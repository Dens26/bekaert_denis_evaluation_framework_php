<?php

namespace App\Controller;

use App\Entity\News;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class HomeController extends AbstractController
{
    public function __construct(
        private EntityManagerInterface $entityManager
    ) {
    }

    #[Route('/', name: 'app_home_index')]
    public function index(): Response
    {
        $news = $this->entityManager->getRepository(News::class)->findAll();

        return $this->render('home/index.html.twig', [
            'news' => $news
        ]);
    }

    #[Route('/home/afficher/{id}', name: 'app_home_show')]
    public function show(News $one_news): Response
    {
        return $this->render('home/show.html.twig', [
            'one_news' => $one_news
        ]);
    }
}
