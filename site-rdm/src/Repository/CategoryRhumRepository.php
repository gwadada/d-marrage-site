<?php

namespace App\Repository;

use App\Entity\CategoryRhum;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method CategoryRhum|null find($id, $lockMode = null, $lockVersion = null)
 * @method CategoryRhum|null findOneBy(array $criteria, array $orderBy = null)
 * @method CategoryRhum[]    findAll()
 * @method CategoryRhum[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CategoryRhumRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, CategoryRhum::class);
    }

    // /**
    //  * @return CategoryRhum[] Returns an array of CategoryRhum objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('c.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?CategoryRhum
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
