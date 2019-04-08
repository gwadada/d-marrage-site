<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20190408095553 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE category_rhum ADD distillerie_id INT NOT NULL');
        $this->addSql('ALTER TABLE category_rhum ADD CONSTRAINT FK_4C66C7825EDCF26F FOREIGN KEY (distillerie_id) REFERENCES distillerie (id)');
        $this->addSql('CREATE INDEX IDX_4C66C7825EDCF26F ON category_rhum (distillerie_id)');
        $this->addSql('ALTER TABLE rhum ADD many_to_one INT NOT NULL');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE category_rhum DROP FOREIGN KEY FK_4C66C7825EDCF26F');
        $this->addSql('DROP INDEX IDX_4C66C7825EDCF26F ON category_rhum');
        $this->addSql('ALTER TABLE category_rhum DROP distillerie_id');
        $this->addSql('ALTER TABLE rhum DROP many_to_one');
    }
}
