<?php

namespace App\Controller;

use App\Class\Mail;
use App\Entity\ResetPasswordRequest;
use App\Entity\User;
use App\Form\UpdatePasswordType;
use DateTimeImmutable;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;

class ResetPasswordRequestController extends AbstractController
{
    public function __construct(
        private EntityManagerInterface $entityManager
    ) {
    }

    #[Route('/mot-de-passe-oublie', name: 'app_reset_password_request')]
    public function index(Request $request, Mail $mail, UrlGeneratorInterface $urlGenerator): Response
    {
        if ($this->getUser()) {
            return $this->redirectToRoute('app_home_index');
        }

        if ($email = $request->get('email')) {
            $user = $this->entityManager->getRepository(User::class)->findOneBy(['email' => $email]);

            if ($user) {
                $resetPasswordRequest = new ResetPasswordRequest();
                $resetPasswordRequest->setUser($user);
                $resetPasswordRequest->setSelector(bin2hex(random_bytes(8)));
                $resetPasswordRequest->setHashedToken(uniqid());
                $resetPasswordRequest->setRequestedAt(new DateTimeImmutable());
                $resetPasswordRequest->setExpiresAt(new DateTimeImmutable('+1 hour'));

                $this->entityManager->persist($resetPasswordRequest);
                $this->entityManager->flush();

                $url = $this->generateUrl('app_update_password_request', [
                    'token' => $resetPasswordRequest->getHashedToken()
                ]);

                $url = $urlGenerator->generate('app_update_password_request', [
                    'token' => $resetPasswordRequest->getHashedToken()
                ], UrlGeneratorInterface::ABSOLUTE_URL);

                $content = "Bonjour " . $user->getFirstName() . '. Vous avez demandé la réinitialisation de votre mot de passe.<br><br>Veuillez cliquer sur le lien suivant : <a href="' . $url . '">Lien de réinitialisation</a>';
                $mail->send($user->getEmail(), $user->getFirstName(), 'Réinitialiser votre mot de passe', $content);
            } else {
                $this->addFlash('notice', 'Adresse mail inconnue');
            }
            $this->addFlash('success', 'Un mail de réinitialisation vous a été envoyé');
            return $this->redirectToRoute('app_home_index');
        }
        return $this->render('reset_password_request/index.html.twig');
    }

    #[Route('/mise-a-jour-mot-de-passe/{token}', name: 'app_update_password_request')]
    public function update(mixed $token, Request $request, UserPasswordHasherInterface $userPasswordHasher, Mail $mail)
    {
        $resetPassword = $this->entityManager->getRepository(ResetPasswordRequest::class)->findOneBy(['hashedToken' => $token]);
        if (!$resetPassword) {
            return $this->redirectToRoute('app_reset_password_request');
        }

        if ($resetPassword->getRequestedAt() > $resetPassword->getExpiresAt()) {
            $this->addFlash('notice', 'La demande de réinitialisaiton à expirée');
            return $this->redirectToRoute('app_reset_password_request');
        }

        $form = $this->createForm(UpdatePasswordType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $user = $resetPassword->getUser();

            $user->setPassword(
                $userPasswordHasher->hashPassword(
                    $user,
                    $form->get('plainPassword')->getData()
                )
            );
            $this->entityManager->flush();
            $this->addFlash('success', 'Votre mot de passe a bien été modifié');

            $mail->send($user->getEmail(), $user->getFirstName(), 'Réinitialisation de votre mot de passe', 'Votre mot de passe a bien été réinitialisé');

            return $this->redirectToRoute('app_contact_index');
        }
        return $this->render('reset_password_request/update.html.twig', [
            'form' => $form
        ]);
    }
}
