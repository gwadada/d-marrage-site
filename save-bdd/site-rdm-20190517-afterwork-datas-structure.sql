-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: May 17, 2019 at 09:56 PM
-- Server version: 10.3.4-MariaDB
-- PHP Version: 7.2.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rhum_bbd`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `texte` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `likes` int(11) DEFAULT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `titre`, `texte`, `likes`, `image_name`, `updated_at`) VALUES
(1, 'Le prix du rhum pourrait augmenter de 30 à 40% d\'ici 2023', 'Le prix du rhum pourrait augmenter d\'ici 2023. Une mesure prise pour faire chuter la consommation d\'alcool dans nos territoires ultramarins et faire aligner les tarifs sur ceux de l\'hexagone.\r\nC\'est très certainement un coup dur pour les producteurs de rhum en Outre-mer. D\'ici 2023, le prix des rhums devrait augmenter de 30 à 40%. Une mesure prise afin de faire chuter la consommation d\'alcool dans nos territoires ultramarins et aligner les tarifs sur ceux de l\'hexagone. \r\nUn amendement des députés de la République en Marche qui ne passe pas chez nous en Martinique auprès des producteurs de rhum.', 8, NULL, '0000-00-00 00:00:00'),
(2, 'tete', 'tetete', NULL, 'verte2.jpg', '2019-05-17 21:36:24');

-- --------------------------------------------------------

--
-- Table structure for table `category_evenement`
--

CREATE TABLE `category_evenement` (
  `id` int(11) NOT NULL,
  `libelle` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_evenement`
--

INSERT INTO `category_evenement` (`id`, `libelle`) VALUES
(2, 'Dégustation Rhum du Monde'),
(3, 'Dégustation Christian De Montaguere'),
(4, 'Dégustation La Maison Du Rhum'),
(5, 'Rhum Fest Paris'),
(6, 'Dégustation A\'Rhum');

-- --------------------------------------------------------

--
-- Table structure for table `category_rhum`
--

CREATE TABLE `category_rhum` (
  `id` int(11) NOT NULL,
  `distillerie_id` int(11) NOT NULL,
  `nom` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_rhum`
--

INSERT INTO `category_rhum` (`id`, `distillerie_id`, `nom`) VALUES
(1, 1, 'Rhum Blanc'),
(2, 1, 'Rhum Ambré ou Paille'),
(3, 1, 'rhum vieux'),
(4, 1, 'Rhum épicé ou spiced');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `distillerie`
--

CREATE TABLE `distillerie` (
  `id` int(11) NOT NULL,
  `origine_id` int(11) NOT NULL,
  `nom` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proprietaire` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pays` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `distillerie`
--

INSERT INTO `distillerie` (`id`, `origine_id`, `nom`, `proprietaire`, `adresse`, `region`, `pays`) VALUES
(1, 1, 'Distillerie du Simon', 'SAS - Pdg Yves Hayot', 'Usine du Simon, 97240 LE FRANÇOIS', 'MARTINIQUE', 'FRANCE'),
(2, 1, 'RHUM BOLOGNE', 'SOC AGRICOLE DE BOLOGNE SA - Dg sargenton Callard', 'RHUM BOLOGNE HABITATION BOLOGNE ld rivières des pères 97100  97100 BASSE TERRE', 'GUADELOUPE', 'FRANCE'),
(3, 1, 'HABITATION SAINT ETIENNE - HSE', 'SAS - Pdg Bernard Hayot', 'Chemin Berault, 97213 Gros-Morne', 'MARTINIQUE', 'FRANCE'),
(4, 1, 'Distillerie Depaz', 'Groupe LA MARTINIQUAISE', 'Plantation de la Montagne Pelée, 97250 Saint-Pierre', 'MARTINIQUE', 'FRANCE');

-- --------------------------------------------------------

--
-- Table structure for table `evenement`
--

CREATE TABLE `evenement` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `lieu` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` decimal(10,2) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `evenement`
--

INSERT INTO `evenement` (`id`, `nom`, `date`, `lieu`, `prix`, `description`, `category_id`) VALUES
(1, 'Rhums Blancs de Guadeloupe', '2019-05-15', 'La table du Loup\r\n32, Rue Traversière, 75012 Paris', '65.00', 'Découvrez et acheter les rhums de Guadeloupe, des rhums blanc, parcellaire, mono-varietal, des rhums d’exceptions de collection.', 3),
(2, 'Rhum Fest Paris 2019', '2019-04-12', 'PARC FLORAL DE PARIS. Route de la Pyramide – Bois de Vincennes Entrée par le Pavillon des Cèdres', '45.00', 'Rhum Fest, le salon du Rhum à Paris \r\nSi vous êtes un amateur de rhum alors ne manquez pas la nouvelle et sixième édition du Rhum Fest Paris à découvrir à la Grande Halle du Parc Floral de Vincennes les samedi 13 et dimanche 14 avril 2019 pour le grand public, et le lundi 15 pour les professionnels. Au menu ? Dégustations et animations autour de ce fameux spiritueux. Et comme on a un code promo à vous filer, c\'est le moment d\'en profiter !', 5);

-- --------------------------------------------------------

--
-- Table structure for table `fiche_degustation`
--

CREATE TABLE `fiche_degustation` (
  `id` int(11) NOT NULL,
  `analysevisuelle` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `analyseolfactive` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `analysegustative` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `conclusion` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `marque_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fiche_degustation`
--

INSERT INTO `fiche_degustation` (`id`, `analysevisuelle`, `analyseolfactive`, `analysegustative`, `conclusion`, `marque_id`) VALUES
(1, 'robe acajou', 'Fruits secs, café, vanille.', 'Chocolat, vieux porto', 'Narcisse, bois de santal.', 2);

-- --------------------------------------------------------

--
-- Table structure for table `fos_user`
--

CREATE TABLE `fos_user` (
  `id` int(11) NOT NULL,
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
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fos_user`
--

INSERT INTO `fos_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`) VALUES
(1, 'fgfggf', 'fgfggf', 'ggkgkg@mail.fr', 'ggkgkg@mail.fr', 1, NULL, '$2y$13$0G3Gu./w.SrnCXtHYPAlhOjzdXoXqrHKrR/9UjA7MlRlYnqfd38Mm', '2019-04-18 12:41:00', NULL, NULL, 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}'),
(2, 'user', 'user', 'user@user.fr', 'user@user.fr', 1, NULL, '$2y$13$STp..qw6NqXldJtlwoCri.iHGCbVDk/RqNpIoL55w60hxn7THjQse', '2019-05-17 21:03:24', NULL, NULL, 'a:0:{}'),
(3, 'admin', 'admin', 'admin@admin.fr', 'admin@admin.fr', 1, NULL, '$2y$13$2O1874a5UVEMeP7mCeW8.OltH98rqlqx3giOU4D.PJocXU90Y89kq', '2019-05-17 21:09:34', NULL, NULL, 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}');

-- --------------------------------------------------------

--
-- Table structure for table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20190417104528', '2019-04-17 10:45:31'),
('20190418071845', '2019-04-18 07:18:50'),
('20190418100632', '2019-04-18 10:06:46'),
('20190418100829', '2019-04-18 10:08:40'),
('20190418103749', '2019-04-18 10:38:04'),
('20190418110320', '2019-04-18 11:03:22'),
('20190517181259', '2019-05-17 18:13:01'),
('20190517192244', '2019-05-17 19:22:47'),
('20190517192951', '2019-05-17 19:29:54');

-- --------------------------------------------------------

--
-- Table structure for table `origine`
--

CREATE TABLE `origine` (
  `id` int(11) NOT NULL,
  `nom` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `origine`
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
-- Table structure for table `rhum`
--

CREATE TABLE `rhum` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `marque` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `degre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `volume` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix_boutique` int(11) NOT NULL,
  `prix_adherent` int(11) NOT NULL,
  `millesime` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rhum`
--

INSERT INTO `rhum` (`id`, `category_id`, `marque`, `type`, `degre`, `volume`, `prix_boutique`, `prix_adherent`, `millesime`) VALUES
(2, 3, 'RHUM DEPAZ', 'Single cask 2003', '45°', '70 cl', 85, 85, '2003-01-01'),
(3, 1, 'HABITATION SAINT ETIENNE', 'Titouan Lamazou 50°', '50°', '70 cl', 24, 24, '2018-01-01'),
(4, 1, 'HABITATION CLEMENT', 'CLEMENT 50)', '50°', '100 cl', 25, 25, '2018-01-01'),
(5, 1, 'HABITATION CLEMENT', 'CANNE BLEUE 2018', '50°', '70 cl', 35, 35, '2018-01-01'),
(6, 1, 'BOTRAN', 'RESERVA 15 anejo', '40°', '70 cl', 42, 42, '2003-01-01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_evenement`
--
ALTER TABLE `category_evenement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_rhum`
--
ALTER TABLE `category_rhum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_4C66C7825EDCF26F` (`distillerie_id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `distillerie`
--
ALTER TABLE `distillerie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_A8FCB9FB87998E` (`origine_id`);

--
-- Indexes for table `evenement`
--
ALTER TABLE `evenement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B26681E12469DE2` (`category_id`);

--
-- Indexes for table `fiche_degustation`
--
ALTER TABLE `fiche_degustation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_41D4FE8F4827B9B2` (`marque_id`);

--
-- Indexes for table `fos_user`
--
ALTER TABLE `fos_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`),
  ADD UNIQUE KEY `UNIQ_957A6479C05FB297` (`confirmation_token`);

--
-- Indexes for table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `origine`
--
ALTER TABLE `origine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rhum`
--
ALTER TABLE `rhum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C7FDBDC512469DE2` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category_evenement`
--
ALTER TABLE `category_evenement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `category_rhum`
--
ALTER TABLE `category_rhum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `distillerie`
--
ALTER TABLE `distillerie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `evenement`
--
ALTER TABLE `evenement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fiche_degustation`
--
ALTER TABLE `fiche_degustation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fos_user`
--
ALTER TABLE `fos_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `origine`
--
ALTER TABLE `origine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `rhum`
--
ALTER TABLE `rhum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_rhum`
--
ALTER TABLE `category_rhum`
  ADD CONSTRAINT `FK_4C66C7825EDCF26F` FOREIGN KEY (`distillerie_id`) REFERENCES `distillerie` (`id`);

--
-- Constraints for table `distillerie`
--
ALTER TABLE `distillerie`
  ADD CONSTRAINT `FK_A8FCB9FB87998E` FOREIGN KEY (`origine_id`) REFERENCES `origine` (`id`);

--
-- Constraints for table `evenement`
--
ALTER TABLE `evenement`
  ADD CONSTRAINT `FK_B26681E12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category_evenement` (`id`);

--
-- Constraints for table `fiche_degustation`
--
ALTER TABLE `fiche_degustation`
  ADD CONSTRAINT `FK_41D4FE8F4827B9B2` FOREIGN KEY (`marque_id`) REFERENCES `rhum` (`id`);

--
-- Constraints for table `rhum`
--
ALTER TABLE `rhum`
  ADD CONSTRAINT `FK_C7FDBDC512469DE2` FOREIGN KEY (`category_id`) REFERENCES `category_rhum` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
