<?php

namespace App\Repository;

use App\Entity\CategoryEvenement;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method CategoryEvenement|null find($id, $lockMode = null, $lockVersion = null)
 * @method CategoryEvenement|null findOneBy(array $criteria, array $orderBy = null)
 * @method CategoryEvenement[]    findAll()
 * @method CategoryEvenement[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CategoryEvenementRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, CategoryEvenement::class);
    }

    // /**
    //  * @return CategoryEvenement[] Returns an array of CategoryEvenement objects
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
    public function findOneBySomeField($value): ?CategoryEvenement
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
