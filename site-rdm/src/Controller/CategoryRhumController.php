<?php

namespace App\Controller;

use App\Entity\CategoryRhum;
use App\Form\CategoryRhumType;
use App\Repository\CategoryRhumRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/category/rhum")
 */
class CategoryRhumController extends AbstractController
{
    /**
     * @Route("/", name="category_rhum_index", methods={"GET"})
     */
    public function index(CategoryRhumRepository $categoryRhumRepository): Response
    {
        return $this->render('category_rhum/index.html.twig', [
            'category_rhums' => $categoryRhumRepository->findAll(),
        ]);
    }

    /**
     * @Route("/new", name="category_rhum_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $categoryRhum = new CategoryRhum();
        $form = $this->createForm(CategoryRhumType::class, $categoryRhum);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($categoryRhum);
            $entityManager->flush();

            return $this->redirectToRoute('category_rhum_index');
        }

        return $this->render('category_rhum/new.html.twig', [
            'category_rhum' => $categoryRhum,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="category_rhum_show", methods={"GET"})
     */
    public function show(CategoryRhum $categoryRhum): Response
    {
        return $this->render('category_rhum/show.html.twig', [
            'category_rhum' => $categoryRhum,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="category_rhum_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, CategoryRhum $categoryRhum): Response
    {
        $form = $this->createForm(CategoryRhumType::class, $categoryRhum);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('category_rhum_index', [
                'id' => $categoryRhum->getId(),
            ]);
        }

        return $this->render('category_rhum/edit.html.twig', [
            'category_rhum' => $categoryRhum,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="category_rhum_delete", methods={"DELETE"})
     */
    public function delete(Request $request, CategoryRhum $categoryRhum): Response
    {
        if ($this->isCsrfTokenValid('delete'.$categoryRhum->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($categoryRhum);
            $entityManager->flush();
        }

        return $this->redirectToRoute('category_rhum_index');
    }
}
