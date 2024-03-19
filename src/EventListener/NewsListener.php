<?php

namespace App\EventListener;

use App\Entity\News;
use DateTimeImmutable;
use Doctrine\ORM\EntityManagerInterface;
use EasyCorp\Bundle\EasyAdminBundle\Event\BeforeEntityPersistedEvent;
use EasyCorp\Bundle\EasyAdminBundle\Event\BeforeEntityUpdatedEvent;
use Symfony\Component\EventDispatcher\Attribute\AsEventListener;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpKernel\Event\RequestEvent;
use Symfony\Component\HttpKernel\KernelEvents;

final class NewsListener implements EventSubscriberInterface
{
    public function __construct(
        private EntityManagerInterface $entityManager
    ) {
    }

    public static function getSubscribedEvents()
    {
        return [
            BeforeEntityPersistedEvent::class => 'onBeforeEntityPersisted',
            BeforeEntityUpdatedEvent::class => 'onBeforeEntityUpdated'
        ];
    }

    public function onBeforeEntityPersisted(BeforeEntityPersistedEvent $event)
    {
        $entity = $event->getEntityInstance();

        if ($entity instanceof News) {
            $this->updateCreatedAt($entity);
            $this->updateUpdatedAt($entity);
        }
    }

    public function onBeforeEntityUpdated(BeforeEntityUpdatedEvent $event)
    {
        $entity = $event->getEntityInstance();

        if ($entity instanceof News) {
            $this->updateUpdatedAt($entity);
        }
    }

    private function updateCreatedAt(News $news)
    {
        $news->setCreatedAt(new DateTimeImmutable());
    }

    private function updateUpdatedAt(News $news)
    {
        $news->setUpdatedAt(new DateTimeImmutable());
    }
}
