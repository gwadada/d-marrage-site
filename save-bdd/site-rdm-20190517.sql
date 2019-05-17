-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 24 avr. 2019 à 15:22
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `site-rdm`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `texte` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `likes` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `titre`, `texte`, `likes`) VALUES
(1, 'Le prix du rhum pourrait augmenter de 30 à 40% d\'ici 2023', 'Le prix du rhum pourrait augmenter d\'ici 2023. Une mesure prise pour faire chuter la consommation d\'alcool dans nos territoires ultramarins et faire aligner les tarifs sur ceux de l\'hexagone.\r\nC\'est très certainement un coup dur pour les producteurs de rhum en Outre-mer. D\'ici 2023, le prix des rhums devrait augmenter de 30 à 40%. Une mesure prise afin de faire chuter la consommation d\'alcool dans nos territoires ultramarins et aligner les tarifs sur ceux de l\'hexagone. \r\nUn amendement des députés de la République en Marche qui ne passe pas chez nous en Martinique auprès des producteurs de rhum.', 8);

-- --------------------------------------------------------

--
-- Structure de la table `category_evenement`
--

DROP TABLE IF EXISTS `category_evenement`;
CREATE TABLE IF NOT EXISTS `category_evenement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category_evenement`
--

INSERT INTO `category_evenement` (`id`, `libelle`) VALUES
(2, 'Dégustation Rhum du Monde'),
(3, 'Dégustation Christian De Montaguere'),
(4, 'Dégustation La Maison Du Rhum'),
(5, 'Rhum Fest Paris'),
(6, 'Dégustation A\'Rhum');

-- --------------------------------------------------------

--
-- Structure de la table `category_rhum`
--

DROP TABLE IF EXISTS `category_rhum`;
CREATE TABLE IF NOT EXISTS `category_rhum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `distillerie_id` int(11) NOT NULL,
  `nom` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4C66C7825EDCF26F` (`distillerie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category_rhum`
--

INSERT INTO `category_rhum` (`id`, `distillerie_id`, `nom`) VALUES
(1, 1, 'Rhum Blanc'),
(2, 1, 'Rhum Ambré ou Paille'),
(3, 1, 'rhum vieux'),
(4, 1, 'Rhum épicé ou spiced');

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `distillerie`
--

DROP TABLE IF EXISTS `distillerie`;
CREATE TABLE IF NOT EXISTS `distillerie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `origine_id` int(11) NOT NULL,
  `nom` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proprietaire` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pays` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A8FCB9FB87998E` (`origine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `distillerie`
--

INSERT INTO `distillerie` (`id`, `origine_id`, `nom`, `proprietaire`, `adresse`, `region`, `pays`) VALUES
(1, 1, 'Distillerie du Simon', 'SAS - Pdg Yves Hayot', 'Usine du Simon, 97240 LE FRANÇOIS', 'MARTINIQUE', 'FRANCE'),
(2, 1, 'RHUM BOLOGNE', 'SOC AGRICOLE DE BOLOGNE SA - Dg sargenton Callard', 'RHUM BOLOGNE HABITATION BOLOGNE ld rivières des pères 97100  97100 BASSE TERRE', 'GUADELOUPE', 'FRANCE'),
(3, 1, 'HABITATION SAINT ETIENNE - HSE', 'SAS - Pdg Bernard Hayot', 'Chemin Berault, 97213 Gros-Morne', 'MARTINIQUE', 'FRANCE'),
(4, 1, 'Distillerie Depaz', 'Groupe LA MARTINIQUAISE', 'Plantation de la Montagne Pelée, 97250 Saint-Pierre', 'MARTINIQUE', 'FRANCE');

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

DROP TABLE IF EXISTS `evenement`;
CREATE TABLE IF NOT EXISTS `evenement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `lieu` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` decimal(10,2) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B26681E12469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `evenement`
--

INSERT INTO `evenement` (`id`, `nom`, `date`, `lieu`, `prix`, `description`, `category_id`) VALUES
(1, 'Rhums Blancs de Guadeloupe', '2019-05-15', 'La table du Loup\r\n32, Rue Traversière, 75012 Paris', '65.00', 'Découvrez et acheter les rhums de Guadeloupe, des rhums blanc, parcellaire, mono-varietal, des rhums d’exceptions de collection.', 3),
(2, 'Rhum Fest Paris 2019', '2019-04-12', 'PARC FLORAL DE PARIS. Route de la Pyramide – Bois de Vincennes Entrée par le Pavillon des Cèdres', '45.00', 'Rhum Fest, le salon du Rhum à Paris \r\nSi vous êtes un amateur de rhum alors ne manquez pas la nouvelle et sixième édition du Rhum Fest Paris à découvrir à la Grande Halle du Parc Floral de Vincennes les samedi 13 et dimanche 14 avril 2019 pour le grand public, et le lundi 15 pour les professionnels. Au menu ? Dégustations et animations autour de ce fameux spiritueux. Et comme on a un code promo à vous filer, c\'est le moment d\'en profiter !', 5);

-- --------------------------------------------------------

--
-- Structure de la table `fiche_degustation`
--

DROP TABLE IF EXISTS `fiche_degustation`;
CREATE TABLE IF NOT EXISTS `fiche_degustation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `analysevisuelle` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `analyseolfactive` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `analysegustative` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `conclusion` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `marque_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_41D4FE8F4827B9B2` (`marque_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fiche_degustation`
--

INSERT INTO `fiche_degustation` (`id`, `analysevisuelle`, `analyseolfactive`, `analysegustative`, `conclusion`, `marque_id`) VALUES
(1, 'robe acajou', 'Fruits secs, café, vanille.', 'Chocolat, vieux porto', 'Narcisse, bois de santal.', 2);

-- --------------------------------------------------------

--
-- Structure de la table `fos_user`
--

DROP TABLE IF EXISTS `fos_user`;
CREATE TABLE IF NOT EXISTS `fos_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_957A6479C05FB297` (`confirmation_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fos_user`
--

INSERT INTO `fos_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`) VALUES
(1, 'fgfggf', 'fgfggf', 'ggkgkg@mail.fr', 'ggkgkg@mail.fr', 1, NULL, '$2y$13$0G3Gu./w.SrnCXtHYPAlhOjzdXoXqrHKrR/9UjA7MlRlYnqfd38Mm', '2019-04-18 12:41:00', NULL, NULL, 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}');

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20190417104528', '2019-04-17 10:45:31'),
('20190418071845', '2019-04-18 07:18:50'),
('20190418100632', '2019-04-18 10:06:46'),
('20190418100829', '2019-04-18 10:08:40'),
('20190418103749', '2019-04-18 10:38:04'),
('20190418110320', '2019-04-18 11:03:22');

-- --------------------------------------------------------

--
-- Structure de la table `origine`
--

DROP TABLE IF EXISTS `origine`;
CREATE TABLE IF NOT EXISTS `origine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `origine`
--

INSERT INTO `origine` (`id`, `nom`) VALUES
(1, 'FRANCE'),
(2, 'COSTA RICA'),
(3, 'MARTINIQUE'),
(4, 'TRINIDAD & TOBAGO'),
(5, 'Île MAURICE'),
(6, 'La REUNION'),
(7, 'INDE'),
(8, 'JAPON'),
(9, 'Philippines');

-- --------------------------------------------------------

--
-- Structure de la table `rhum`
--

DROP TABLE IF EXISTS `rhum`;
CREATE TABLE IF NOT EXISTS `rhum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `marque` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `degre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `volume` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix_boutique` int(11) NOT NULL,
  `prix_adherent` int(11) NOT NULL,
  `millesime` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C7FDBDC512469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `rhum`
--

INSERT INTO `rhum` (`id`, `category_id`, `marque`, `type`, `degre`, `volume`, `prix_boutique`, `prix_adherent`, `millesime`) VALUES
(2, 3, 'RHUM DEPAZ', 'Single cask 2003', '45°', '70 cl', 85, 85, '2003-01-01'),
(3, 1, 'HABITATION SAINT ETIENNE', 'Titouan Lamazou 50°', '50°', '70 cl', 24, 24, '2018-01-01'),
(4, 1, 'HABITATION CLEMENT', 'CLEMENT 50)', '50°', '100 cl', 25, 25, '2018-01-01'),
(5, 1, 'HABITATION CLEMENT', 'CANNE BLEUE 2018', '50°', '70 cl', 35, 35, '2018-01-01'),
(6, 1, 'BOTRAN', 'RESERVA 15 anejo', '40°', '70 cl', 42, 42, '2003-01-01');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `category_rhum`
--
ALTER TABLE `category_rhum`
  ADD CONSTRAINT `FK_4C66C7825EDCF26F` FOREIGN KEY (`distillerie_id`) REFERENCES `distillerie` (`id`);

--
-- Contraintes pour la table `distillerie`
--
ALTER TABLE `distillerie`
  ADD CONSTRAINT `FK_A8FCB9FB87998E` FOREIGN KEY (`origine_id`) REFERENCES `origine` (`id`);

--
-- Contraintes pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD CONSTRAINT `FK_B26681E12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category_evenement` (`id`);

--
-- Contraintes pour la table `fiche_degustation`
--
ALTER TABLE `fiche_degustation`
  ADD CONSTRAINT `FK_41D4FE8F4827B9B2` FOREIGN KEY (`marque_id`) REFERENCES `rhum` (`id`);

--
-- Contraintes pour la table `rhum`
--
ALTER TABLE `rhum`
  ADD CONSTRAINT `FK_C7FDBDC512469DE2` FOREIGN KEY (`category_id`) REFERENCES `category_rhum` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
