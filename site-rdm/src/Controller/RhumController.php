<?php


namespace App\Controller;

use App\Entity\Rhum;
use App\Form\RhumType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;


class RhumController extends AbstractController
{

    /**
     * @Route("/rhum", name="rhum")
     * @return Response
     */
    public function index(): Response
    {
        //Récupération du Repository
        $repository = $this->getDoctrine()->getRepository(Rhum::class);
        // Récupération des rhums
        $rhums = $repository->findAll();

        return $this->render('index.html.twig', ['rhums' => $rhums]);
    }

    /**
     * @Route("/rhum/create", name="rhum_create")
     * @param RhumType $
     * @return Response
     */
    public function create(): Response
    {
        //Récupération du formulaire
        $rhum = new Rhum();
        $form = $this->createForm(RhumType::class);
        //Envoi du formulaire à la vue
        return $this->render('rhum/create.html.twig', ['createForm' => $form->createView()]);
    }

    /**
     * @Route("/rhum/{id}")
     * @return Response
     */
    public function show($id): Response
    {
        //Récupération du Repository
        $repository = $this->getDoctrine()->getRepository(Rhum::class);
        // Récupération des rhums
        $rhums = $repository->findOneBy(['id' => $id]);

        return $this->render('rhum/show.html.twig', ['rhum' => $rhums]);
    }

}