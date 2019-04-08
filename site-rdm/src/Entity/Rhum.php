<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\RhumRepository")
 */
class Rhum
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
    private $marque;

    /**
     * @ORM\Column(type="string", length=70)
     */
    private $type;

    /**
     * @ORM\Column(type="string", length=45)
     */
    private $degre;

    /**
     * @ORM\Column(type="string", length=45)
     */
    private $volume;

    /**
     * @ORM\Column(type="date")
     */
    private $millesime;

    /**
     * @ORM\Column(type="integer")
     */
    private $PrixBoutique;

    /**
     * @ORM\Column(type="integer")
     */
    private $PrixAdherent;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\CategoryRhum", inversedBy="rhums")
     * @ORM\JoinColumn(nullable=false, name="category_rhum")
     */
    private $nom;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getMarque(): ?string
    {
        return $this->marque;
    }

    public function setMarque(string $marque): self
    {
        $this->marque = $marque;

        return $this;
    }

    public function getType(): ?string
    {
        return $this->type;
    }

    public function setType(string $type): self
    {
        $this->type = $type;

        return $this;
    }

    public function getDegre(): ?string
    {
        return $this->degre;
    }

    public function setDegre(string $degre): self
    {
        $this->degre = $degre;

        return $this;
    }

    public function getVolume(): ?string
    {
        return $this->volume;
    }

    public function setVolume(string $volume): self
    {
        $this->volume = $volume;

        return $this;
    }

    public function getMillesime(): ?\DateTimeInterface
    {
        return $this->millesime;
    }

    public function setMillesime(\DateTimeInterface $millesime): self
    {
        $this->millesime = $millesime;

        return $this;
    }

    public function getPrixBoutique(): ?int
    {
        return $this->PrixBoutique;
    }

    public function setPrixBoutique(int $PrixBoutique): self
    {
        $this->PrixBoutique = $PrixBoutique;

        return $this;
    }

    public function getPrixAdherent(): ?int
    {
        return $this->PrixAdherent;
    }

    public function setPrixAdherent(int $PrixAdherent): self
    {
        $this->PrixAdherent = $PrixAdherent;

        return $this;
    }

    public function getNom(): ?CategoryRhum
    {
        return $this->nom;
    }

    public function setNom(?CategoryRhum $nom): self
    {
        $this->nom = $nom;

        return $this;
    }
}
