<?php

namespace App\Form;

use App\Entity\Rhum;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class RhumType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('marque')
            ->add('type')
            ->add('degre')
            ->add('volume')
            ->add('millesime')
            ->add('PrixBoutique')
            ->add('PrixAdherent')
            ->add('CategoryRhum')
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Rhum::class,
        ]);
    }
}
