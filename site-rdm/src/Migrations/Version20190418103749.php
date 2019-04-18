<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20190418103749 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE fiche_degustation ADD marque_id INT NOT NULL');
        $this->addSql('ALTER TABLE fiche_degustation ADD CONSTRAINT FK_41D4FE8F4827B9B2 FOREIGN KEY (marque_id) REFERENCES rhum (id)');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_41D4FE8F4827B9B2 ON fiche_degustation (marque_id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE fiche_degustation DROP FOREIGN KEY FK_41D4FE8F4827B9B2');
        $this->addSql('DROP INDEX UNIQ_41D4FE8F4827B9B2 ON fiche_degustation');
        $this->addSql('ALTER TABLE fiche_degustation DROP marque_id');
    }
}
