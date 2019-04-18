<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\FicheDegustationRepository")
 */
class FicheDegustation
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="text")
     */
    private $analysevisuelle;

    /**
     * @ORM\Column(type="text")
     */
    private $analyseolfactive;

    /**
     * @ORM\Column(type="text")
     */
    private $analysegustative;

    /**
     * @ORM\Column(type="text")
     */
    private $conclusion;

    /**
     * @ORM\OneToOne(targetEntity="App\Entity\Rhum", inversedBy="ficheDegustation", cascade={"persist", "remove"})
     * @ORM\JoinColumn(nullable=false)
     */
    private $marque;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getAnalysevisuelle(): ?string
    {
        return $this->analysevisuelle;
    }

    public function setAnalysevisuelle(string $analysevisuelle): self
    {
        $this->analysevisuelle = $analysevisuelle;

        return $this;
    }

    public function getAnalyseolfactive(): ?string
    {
        return $this->analyseolfactive;
    }

    public function setAnalyseolfactive(string $analyseolfactive): self
    {
        $this->analyseolfactive = $analyseolfactive;

        return $this;
    }

    public function getAnalysegustative(): ?string
    {
        return $this->analysegustative;
    }

    public function setAnalysegustative(string $analysegustative): self
    {
        $this->analysegustative = $analysegustative;

        return $this;
    }

    public function getConclusion(): ?string
    {
        return $this->conclusion;
    }

    public function setConclusion(string $conclusion): self
    {
        $this->conclusion = $conclusion;

        return $this;
    }

    public function getMarque(): ?Rhum
    {
        return $this->marque;
    }

    public function setMarque(Rhum $marque): self
    {
        $this->marque = $marque;

        return $this;
    }
}
