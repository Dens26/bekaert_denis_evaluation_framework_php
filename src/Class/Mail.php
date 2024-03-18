<?php

namespace App\Class;

use Symfony\Bridge\Twig\Mime\NotificationEmail;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Mailer\MailerInterface;

class Mail
{
    public function __construct(
        private MailerInterface $mailer
    ) {
    }
    public function send(string $toEmail, string $toName, string $subject, string $content)
    {
        $adminEmail = "denis.bekaert.apformation@gmail.com";
        $email = (new NotificationEmail())
            ->from($adminEmail)
            ->to($toEmail)
            ->htmlTemplate("emails/contact.html.twig")
            ->context([
                'name' => $toName
            ])
            ->subject($subject);
        $this->mailer->send($email);
    }
}
