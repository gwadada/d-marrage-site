<?php


namespace App\Controller;

use App\Entity\Comment;
use App\Entity\Rhum;
use App\Form\CommentFronType;
use App\Form\RhumType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;


class RhumController extends AbstractController
{

    /**
     * @Route("/", name="rhum")
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
     * @param Request $request
     * @return Response
     */
    public function create(Request $request): Response
    {
        //Récupération du formulaire
        $rhum = new Rhum();
        $form = $this->createForm(RhumType::class, $rhum);
        // On remplit le formulaire avec les données
        $form->handleRequest($request);
        // On vérifie que le formulaire est soumis et ses valeurs sont valides
        if ($form->isSubmitted() && $form->isValid()) {

            dump($form);
           // Récupération du manager
            $manager = $this->getDoctrine()->getManager();
            // Insertion de l'article en BDD
           $manager->persist($rhum); //Préparation du SQL
            $manager->flush(); //Exécution du SQL
        }
        //Envoi du formulaire à la vue
        return $this->render('rhum/create.html.twig', ['createForm' => $form->createView()]);
    }

    /*
     * @Route("/rhum/{id}")
     * @return Response
     *
    public function show($id): Response
    {
        //Récupération du Repository
        $repository = $this->getDoctrine()->getRepository(Rhum::class);
        // Récupération des rhums
        $rhums = $repository->findOneBy(['id' => $id]);

        return $this->render('rhum/show.html.twig', ['rhum' => $rhums]);
    }*/

    /**
     * @Route("/rhum/{id}")
     * @param Rhum $rhum
     * @param Request $request
     * @return Response
     */
    public function show(Rhum $rhum, Request $request)
    {
        //Création du formulaire pour l'ajout de commentaire
        $newComment = new Comment();
        $newComment->setContent($rhum);
        $commentForm = $this->createForm(CommentFronType::class, $newComment);

        // Gestion de l'ajout d'un commentaire
        $commentForm->handleRequest($request);
        // On vérifie que le formulaire est soumis et valide
        if ($commentForm->isSubmitted() && $commentForm->isValid()) {
            // Récupération du manager
            $manager = $this->getDoctrine()->getManager();
            // Mis en BDD
            $manager->flush();
            // Création d'un nouveau formulaire
            $newComment = new Comment();
            $newComment->setContent($rhum);
            $commentForm = $this->createForm(CommentFronType::class, $newComment);

        }

        return $this->render('rhum/show.html.twig', ['rhum' => $rhum,
            'commentForm' => $commentForm->createView()
        ]);
    }

        /**
         * @Route("/rhum/{id}/modification", name="rhum_update")
         * @param Rhum $rhum
         * @param Request $request
         * @return Response
         */
    public function edit(Rhum $rhum, Request $request): Response
    {
        //Récupération du formulaire
        $form = $this->createForm(RhumType::class, $rhum);
        // Remplir le formulaire avec les variables $_POST
        $form->handleRequest($request);
        // On vérifie que le formulaire est soumis et valide
        if ($form->isSubmitted() && $form->isValid()) {
            // Récupération du manager
            $manager = $this->getDoctrine()->getManager();
            // Mis en BDD
            $manager->persist($form);
            $manager->flush();
            // Ajout du message flash
            $this->addFlash('primary', 'votre rhum a bien été modifié');
            // redirection vers le détail du rhum
            return $this->redirectToRoute('rhum_update', ['id' => $rhum->getId()]);
        }
        return $this->render('rhum/update.html.twig', ['editForm' => $form->createView()]);
    }

    /**
     * @Route("/rhum/{id}/suppression", name="rhum_delete")
     * @param Rhum $rhum
     * @return Response
     */

    public function delete(Rhum $rhum): Response
    {
        // Récupération du manager
        $manager = $this->getDoctrine()->getManager();
        // Suppréssion du rhum
        $manager->remove($rhum);
        $manager->flush();
        // redirection vers le détail du rhum
        return $this->redirectToRoute('rhum');
    }

}