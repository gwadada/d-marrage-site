<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20190408094806 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE rhum ADD nom_id INT NOT NULL, ADD many_to_one INT NOT NULL');
        $this->addSql('ALTER TABLE rhum ADD CONSTRAINT FK_C7FDBDC5C8121CE9 FOREIGN KEY (nom_id) REFERENCES category_rhum (id)');
        $this->addSql('CREATE INDEX IDX_C7FDBDC5C8121CE9 ON rhum (nom_id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE rhum DROP FOREIGN KEY FK_C7FDBDC5C8121CE9');
        $this->addSql('DROP INDEX IDX_C7FDBDC5C8121CE9 ON rhum');
        $this->addSql('ALTER TABLE rhum DROP nom_id, DROP many_to_one');
    }
}
