<?php

namespace App\Controller;

use App\Class\Mail;
use App\Entity\Contact;
use App\Form\ContactType;
use Doctrine\ORM\EntityManagerInterface;
use Exception;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class ContactController extends AbstractController
{
    public function __construct(
        private EntityManagerInterface $entityManager
    ) {
    }
    #[Route('/contact', name: 'app_contact_index')]
    public function index(Mail $mail, Request $request): Response
    {
        $form = $this->createForm(ContactType::class);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $data = $form->getData();

            try {
                $this->entityManager->getRepository(Contact::class)->createContact($data);

                $mail->send(
                    $data->getEmail(),
                    $data->getFirstName(),
                    "Demande de contact " . $data->getFirstName() . ' ' . $data->getLastName(),
                    $data->getMessage()
                );

                $this->addFlash('success', 'Votre message a bien été envoyé');
                return $this->redirectToRoute('app_home_index');
            } catch (Exception $ex) {
                $this->addFlash('danger', 'Votre message n\'a pas été envoyé');
                return $this->redirectToRoute('app_contact_index');
            }
        }

        return $this->render('contact/index.html.twig', [
            'form' => $form
        ]);
    }
}
