<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\DistillerieRepository")
 */
class Distillerie
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=70)
     */
    private $nom;

    /**
     * @ORM\Column(type="string", length=70)
     */
    private $proprietaire;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $adresse;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $region;

    /**
     * @ORM\Column(type="string", length=70)
     */
    private $pays;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\CategoryRhum", mappedBy="distillerie")
     */
    private $categoryRhums;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Origine", inversedBy="distilleries")
     * @ORM\JoinColumn(nullable=false)
     */
    private $origine;

    public function __construct()
    {
        $this->categoryRhums = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function setNom(string $nom): self
    {
        $this->nom = $nom;

        return $this;
    }

    public function getProprietaire(): ?string
    {
        return $this->proprietaire;
    }

    public function setProprietaire(string $proprietaire): self
    {
        $this->proprietaire = $proprietaire;

        return $this;
    }

    public function getAdresse(): ?string
    {
        return $this->adresse;
    }

    public function setAdresse(string $adresse): self
    {
        $this->adresse = $adresse;

        return $this;
    }

    public function getRegion(): ?string
    {
        return $this->region;
    }

    public function setRegion(string $region): self
    {
        $this->region = $region;

        return $this;
    }

    public function getPays(): ?string
    {
        return $this->pays;
    }

    public function setPays(string $pays): self
    {
        $this->pays = $pays;

        return $this;
    }

    /**
     * @return Collection|CategoryRhum[]
     */
    public function getCategoryRhums(): Collection
    {
        return $this->categoryRhums;
    }

    public function addCategoryRhum(CategoryRhum $categoryRhum): self
    {
        if (!$this->categoryRhums->contains($categoryRhum)) {
            $this->categoryRhums[] = $categoryRhum;
            $categoryRhum->setDistillerie($this);
        }

        return $this;
    }

    public function removeCategoryRhum(CategoryRhum $categoryRhum): self
    {
        if ($this->categoryRhums->contains($categoryRhum)) {
            $this->categoryRhums->removeElement($categoryRhum);
            // set the owning side to null (unless already changed)
            if ($categoryRhum->getDistillerie() === $this) {
                $categoryRhum->setDistillerie(null);
            }
        }

        return $this;
    }

    public function getOrigine(): ?Origine
    {
        return $this->origine;
    }

    public function setOrigine(?Origine $origine): self
    {
        $this->origine = $origine;

        return $this;
    }
}
