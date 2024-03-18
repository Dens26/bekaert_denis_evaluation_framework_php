<?php

namespace App\Controller;

use App\Class\Mail;
use App\Entity\ResetPasswordRequest;
use App\Entity\User;
use DateTimeImmutable;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ResetPasswordRequestController extends AbstractController
{
    public function __construct(
        private EntityManagerInterface $entityManager
    ) {
    }

    #[Route('/mot-de-passe-oublie', name: 'app_reset_password_request')]
    public function index(Request $request, Mail $mail): Response
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
                $resetPasswordRequest->setHashedToken(password_hash(random_bytes(32), PASSWORD_BCRYPT));
                $resetPasswordRequest->setRequestedAt(new DateTimeImmutable());
                $resetPasswordRequest->setExpiresAt(new DateTimeImmutable('+1 hour'));

                $this->entityManager->persist($resetPasswordRequest);
                $this->entityManager->flush();

                $url = $this->generateUrl('app_update_password_request', [
                    'token' => $resetPasswordRequest->getHashedToken()
                ]);
                $content = "Bonjour " . $user->getFirstName() . '. Vous avez demandé la réinitialisation de votre mot de passe.<br><br>Veuillez cliquer sur le lien suivant : <a href="' . $url . '">Lien de réinitialisation</a>';
                $mail->send($user->getEmail(), $user->getFirstName(), 'Réinitialiser votre mot de passe', $content);
            }
        }

        return $this->render('reset_password_request/index.html.twig');
    }

    #[Route('/mise-a-jour-mot-de-passe', name: 'app_update_password_request')]
    public function update(){

    }
}
