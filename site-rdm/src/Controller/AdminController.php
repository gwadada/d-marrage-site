<?php


namespace App\Controller;



use App\Entity\Rhum;
use App\Form\RhumType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AdminController extends AbstractController
{
    /**
     * @Route("/back-office/home")
     * @return Response
     */
    public function backOffice(): Response
    {
        return $this->render('back-office/home.html.twig');
    }

    /**
     * @Route("/back-office/creation")
     * @param Request $request
     * @param UploadableManager $uploadableManager
     * @return Response
     */
    public function create(Request $request, UploadableManager $uploadableManager): Response
    {
        $rhum = new Rhum();
        $form = $this->createForm(RhumType::class, $rhum);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            // Récupération du manager
            $manager = $this->getDoctrine()->getManager();
            // insertion du rhum en BDD
            $manager->persist($rhum);
            $uploadableManager->markEntityToUpload($rhum, $rhum->getImageSrc());
            $manager->flush();
            $this->addFlash('success', 'votre message a bien été ajouté');
            // Redirection vers le détail rhum
            return $this->redirectToRoute('app_admin_create', [
                'id' => $rhum->getId()
            ]);

        }

        return $this->render('back-office/create.html.twig', ['rhum' => $rhum,
            'createForm' => $form->createView()]);

    }

}