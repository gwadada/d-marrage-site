<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\CategoryRhumRepository")
 */
class CategoryRhum
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=45)
     */
    private $nom;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Distillerie", inversedBy="categoryRhums")
     * @ORM\JoinColumn(nullable=false)
     */
    private $distillerie;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Rhum", mappedBy="category")
     */
    private $rhums;

    public function __construct()
    {
        $this->rhums = new ArrayCollection();
    }

    public function __toString()
    {
        return $this->nom;
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

    public function getDistillerie(): ?Distillerie
    {
        return $this->distillerie;
    }

    public function setDistillerie(?Distillerie $distillerie): self
    {
        $this->distillerie = $distillerie;

        return $this;
    }

    /**
     * @return Collection|Rhum[]
     */
    public function getRhums(): Collection
    {
        return $this->rhums;
    }

    public function addRhum(Rhum $rhum): self
    {
        if (!$this->rhums->contains($rhum)) {
            $this->rhums[] = $rhum;
            $rhum->setCategory($this);
        }

        return $this;
    }

    public function removeRhum(Rhum $rhum): self
    {
        if ($this->rhums->contains($rhum)) {
            $this->rhums->removeElement($rhum);
            // set the owning side to null (unless already changed)
            if ($rhum->getCategory() === $this) {
                $rhum->setCategory(null);
            }
        }

        return $this;
    }
}
