<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20190417104528 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE TABLE article (id INT AUTO_INCREMENT NOT NULL, likes INT NOT NULL, titre VARCHAR(255) NOT NULL, texte LONGTEXT NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE category_evenement (id INT AUTO_INCREMENT NOT NULL, libelle VARCHAR(70) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE category_rhum (id INT AUTO_INCREMENT NOT NULL, distillerie_id INT NOT NULL, nom VARCHAR(45) NOT NULL, INDEX IDX_4C66C7825EDCF26F (distillerie_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE comment (id INT AUTO_INCREMENT NOT NULL, content VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE distillerie (id INT AUTO_INCREMENT NOT NULL, origine_id INT NOT NULL, nom VARCHAR(70) NOT NULL, proprietaire VARCHAR(70) NOT NULL, adresse VARCHAR(255) NOT NULL, region VARCHAR(255) NOT NULL, pays VARCHAR(70) NOT NULL, INDEX IDX_A8FCB9FB87998E (origine_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE evenement (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(255) NOT NULL, date DATE NOT NULL, lieu LONGTEXT NOT NULL, prix NUMERIC(10, 2) NOT NULL, description LONGTEXT NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE fiche_degustation (id INT AUTO_INCREMENT NOT NULL, analysevisuelle LONGTEXT NOT NULL, analyseolfactive LONGTEXT NOT NULL, analysegustative LONGTEXT NOT NULL, conclusion LONGTEXT NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE origine (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(70) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE rhum (id INT AUTO_INCREMENT NOT NULL, category_rhum INT NOT NULL, marque VARCHAR(70) NOT NULL, type VARCHAR(70) NOT NULL, degre VARCHAR(45) NOT NULL, volume VARCHAR(45) NOT NULL, prix_boutique INT NOT NULL, prix_adherent INT NOT NULL, millesime DATE NOT NULL, INDEX IDX_C7FDBDC54C66C782 (category_rhum), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE fos_user (id INT AUTO_INCREMENT NOT NULL, username VARCHAR(180) NOT NULL, username_canonical VARCHAR(180) NOT NULL, email VARCHAR(180) NOT NULL, email_canonical VARCHAR(180) NOT NULL, enabled TINYINT(1) NOT NULL, salt VARCHAR(255) DEFAULT NULL, password VARCHAR(255) NOT NULL, last_login DATETIME DEFAULT NULL, confirmation_token VARCHAR(180) DEFAULT NULL, password_requested_at DATETIME DEFAULT NULL, roles LONGTEXT NOT NULL COMMENT \'(DC2Type:array)\', UNIQUE INDEX UNIQ_957A647992FC23A8 (username_canonical), UNIQUE INDEX UNIQ_957A6479A0D96FBF (email_canonical), UNIQUE INDEX UNIQ_957A6479C05FB297 (confirmation_token), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('ALTER TABLE category_rhum ADD CONSTRAINT FK_4C66C7825EDCF26F FOREIGN KEY (distillerie_id) REFERENCES distillerie (id)');
        $this->addSql('ALTER TABLE distillerie ADD CONSTRAINT FK_A8FCB9FB87998E FOREIGN KEY (origine_id) REFERENCES origine (id)');
        $this->addSql('ALTER TABLE rhum ADD CONSTRAINT FK_C7FDBDC54C66C782 FOREIGN KEY (category_rhum) REFERENCES category_rhum (id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE rhum DROP FOREIGN KEY FK_C7FDBDC54C66C782');
        $this->addSql('ALTER TABLE category_rhum DROP FOREIGN KEY FK_4C66C7825EDCF26F');
        $this->addSql('ALTER TABLE distillerie DROP FOREIGN KEY FK_A8FCB9FB87998E');
        $this->addSql('DROP TABLE article');
        $this->addSql('DROP TABLE category_evenement');
        $this->addSql('DROP TABLE category_rhum');
        $this->addSql('DROP TABLE comment');
        $this->addSql('DROP TABLE distillerie');
        $this->addSql('DROP TABLE evenement');
        $this->addSql('DROP TABLE fiche_degustation');
        $this->addSql('DROP TABLE origine');
        $this->addSql('DROP TABLE rhum');
        $this->addSql('DROP TABLE fos_user');
    }
}
