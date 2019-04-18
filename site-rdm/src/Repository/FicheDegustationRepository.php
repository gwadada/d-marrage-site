<?php

namespace App\Repository;

use App\Entity\FicheDegustation;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method FicheDegustation|null find($id, $lockMode = null, $lockVersion = null)
 * @method FicheDegustation|null findOneBy(array $criteria, array $orderBy = null)
 * @method FicheDegustation[]    findAll()
 * @method FicheDegustation[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class FicheDegustationRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, FicheDegustation::class);
    }

    // /**
    //  * @return FicheDegustation[] Returns an array of FicheDegustation objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('f')
            ->andWhere('f.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('f.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?FicheDegustation
    {
        return $this->createQueryBuilder('f')
            ->andWhere('f.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
