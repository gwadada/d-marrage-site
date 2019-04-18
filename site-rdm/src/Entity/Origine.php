<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\OrigineRepository")
 */
class Origine
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
     * @ORM\OneToMany(targetEntity="App\Entity\Distillerie", mappedBy="origine")
     */
    private $distilleries;

    public function __construct()
    {
        $this->distilleries = new ArrayCollection();
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

    /**
     * @return Collection|Distillerie[]
     */
    public function getDistilleries(): Collection
    {
        return $this->distilleries;
    }

    public function addDistillery(Distillerie $distillery): self
    {
        if (!$this->distilleries->contains($distillery)) {
            $this->distilleries[] = $distillery;
            $distillery->setOrigine($this);
        }

        return $this;
    }

    public function removeDistillery(Distillerie $distillery): self
    {
        if ($this->distilleries->contains($distillery)) {
            $this->distilleries->removeElement($distillery);
            // set the owning side to null (unless already changed)
            if ($distillery->getOrigine() === $this) {
                $distillery->setOrigine(null);
            }
        }

        return $this;
    }
}
