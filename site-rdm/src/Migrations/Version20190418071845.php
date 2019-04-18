<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20190418071845 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE rhum DROP FOREIGN KEY FK_C7FDBDC54C66C782');
        $this->addSql('DROP INDEX IDX_C7FDBDC54C66C782 ON rhum');
        $this->addSql('ALTER TABLE rhum CHANGE category_rhum category_id INT NOT NULL');
        $this->addSql('ALTER TABLE rhum ADD CONSTRAINT FK_C7FDBDC512469DE2 FOREIGN KEY (category_id) REFERENCES category_rhum (id)');
        $this->addSql('CREATE INDEX IDX_C7FDBDC512469DE2 ON rhum (category_id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE rhum DROP FOREIGN KEY FK_C7FDBDC512469DE2');
        $this->addSql('DROP INDEX IDX_C7FDBDC512469DE2 ON rhum');
        $this->addSql('ALTER TABLE rhum CHANGE category_id category_rhum INT NOT NULL');
        $this->addSql('ALTER TABLE rhum ADD CONSTRAINT FK_C7FDBDC54C66C782 FOREIGN KEY (category_rhum) REFERENCES category_rhum (id)');
        $this->addSql('CREATE INDEX IDX_C7FDBDC54C66C782 ON rhum (category_rhum)');
    }
}
