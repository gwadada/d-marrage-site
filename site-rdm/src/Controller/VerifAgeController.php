<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;

class VerifAgeController extends AbstractController
{
    /**
     * @Route("/verif/age/{choice}", name="app_verifage")
     * @param string $choice
     * @param SessionInterface $session
     * @param Request $request
     * @return Response
     */
    public function verifAge(
        string $choice,
        SessionInterface $session,
        Request $request
    ): Response {
        // On retrouve le nom de l'URL
        $url = $request->query->get('url');
        $router = $this->get('router');
        $routeName = $router->match($url)['_route'];
        // Si c'est ok, on l'enregistre dans la session
        if ($choice === "1") {
            $session->set('verifage', true);
            // On le redirige vers la route trouvée
            return $this->redirectToRoute($routeName);
        } else {
            return new RedirectResponse("https://www.google.com");
        }
    }
}