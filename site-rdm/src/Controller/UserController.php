<?php


namespace App\Controller;


use App\Entity\Rhum;
use App\Entity\User;
use App\Form\RhumType;
use App\Form\UserEditRoleType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class UserController extends AbstractController
{
    /**
     * @Route("/back-office/utilisateurs", name="utilisateur")
     * @return Response
     */
    public function list():Response
    {
        // Récupération du Repository
        $repo =$this->getDoctrine()->getRepository(User::class);
        // Récupération des utilisateurs
        $users =$repo->findAll();
        // Envoi des utilisateurs à la vue
        return $this->render('user/list.html.twig', ['users' => $users]);
    }

    /**
     * @Route("/back-office/utilisateurs/changement-roles/{id}", name="app_user_editrole", requirements={"id"="[0-9]+"})
     * @param $id
     * @param $request
     * @return Response
     */
    public function edit(int $id,Request $request): Response
    {
        // Récupération du Repository
        $repo = $this->getDoctrine()->getRepository(User::class);
        // Récupérateur de l'utilisateur
        $user = $repo->findOneBy(['id' => $id]);
        // Instanciation du formulaire
        $form = $this->createForm(UserEditRoleType::class, $user);
        // On remplit le formulaire avec les données
        $form->handleRequest($request);
        // On vérifie que le formulaire est soumis et ses valeurs sont valides
        if ($form->isSubmitted() && $form->isValid()) {
            // Récupération du manager
            $manager = $this->getDoctrine()->getManager();
            $manager->flush(); //Exécution du SQL
            $this->addFlash('success', 'va te faire');
        }
        // Récupération des utilisateurs
        $user = $repo->findOneBy(['id' => $id]);
        // Envoi des utilisateurs à la vue
        return $this->render('user/show.html.twig', ['user' => $user,
        'editForm' => $form->createView()]);
    }
}
