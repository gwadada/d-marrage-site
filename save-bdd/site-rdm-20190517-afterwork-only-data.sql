-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: May 17, 2019 at 09:57 PM
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

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `titre`, `texte`, `likes`, `image_name`, `updated_at`) VALUES
(1, 'Le prix du rhum pourrait augmenter de 30 à 40% d\'ici 2023', 'Le prix du rhum pourrait augmenter d\'ici 2023. Une mesure prise pour faire chuter la consommation d\'alcool dans nos territoires ultramarins et faire aligner les tarifs sur ceux de l\'hexagone.\r\nC\'est très certainement un coup dur pour les producteurs de rhum en Outre-mer. D\'ici 2023, le prix des rhums devrait augmenter de 30 à 40%. Une mesure prise afin de faire chuter la consommation d\'alcool dans nos territoires ultramarins et aligner les tarifs sur ceux de l\'hexagone. \r\nUn amendement des députés de la République en Marche qui ne passe pas chez nous en Martinique auprès des producteurs de rhum.', 8, NULL, '0000-00-00 00:00:00'),
(2, 'tete', 'tetete', NULL, 'verte2.jpg', '2019-05-17 21:36:24');

--
-- Dumping data for table `category_evenement`
--

INSERT INTO `category_evenement` (`id`, `libelle`) VALUES
(2, 'Dégustation Rhum du Monde'),
(3, 'Dégustation Christian De Montaguere'),
(4, 'Dégustation La Maison Du Rhum'),
(5, 'Rhum Fest Paris'),
(6, 'Dégustation A\'Rhum');

--
-- Dumping data for table `category_rhum`
--

INSERT INTO `category_rhum` (`id`, `distillerie_id`, `nom`) VALUES
(1, 1, 'Rhum Blanc'),
(2, 1, 'Rhum Ambré ou Paille'),
(3, 1, 'rhum vieux'),
(4, 1, 'Rhum épicé ou spiced');

--
-- Dumping data for table `distillerie`
--

INSERT INTO `distillerie` (`id`, `origine_id`, `nom`, `proprietaire`, `adresse`, `region`, `pays`) VALUES
(1, 1, 'Distillerie du Simon', 'SAS - Pdg Yves Hayot', 'Usine du Simon, 97240 LE FRANÇOIS', 'MARTINIQUE', 'FRANCE'),
(2, 1, 'RHUM BOLOGNE', 'SOC AGRICOLE DE BOLOGNE SA - Dg sargenton Callard', 'RHUM BOLOGNE HABITATION BOLOGNE ld rivières des pères 97100  97100 BASSE TERRE', 'GUADELOUPE', 'FRANCE'),
(3, 1, 'HABITATION SAINT ETIENNE - HSE', 'SAS - Pdg Bernard Hayot', 'Chemin Berault, 97213 Gros-Morne', 'MARTINIQUE', 'FRANCE'),
(4, 1, 'Distillerie Depaz', 'Groupe LA MARTINIQUAISE', 'Plantation de la Montagne Pelée, 97250 Saint-Pierre', 'MARTINIQUE', 'FRANCE');

--
-- Dumping data for table `evenement`
--

INSERT INTO `evenement` (`id`, `nom`, `date`, `lieu`, `prix`, `description`, `category_id`) VALUES
(1, 'Rhums Blancs de Guadeloupe', '2019-05-15', 'La table du Loup\r\n32, Rue Traversière, 75012 Paris', '65.00', 'Découvrez et acheter les rhums de Guadeloupe, des rhums blanc, parcellaire, mono-varietal, des rhums d’exceptions de collection.', 3),
(2, 'Rhum Fest Paris 2019', '2019-04-12', 'PARC FLORAL DE PARIS. Route de la Pyramide – Bois de Vincennes Entrée par le Pavillon des Cèdres', '45.00', 'Rhum Fest, le salon du Rhum à Paris \r\nSi vous êtes un amateur de rhum alors ne manquez pas la nouvelle et sixième édition du Rhum Fest Paris à découvrir à la Grande Halle du Parc Floral de Vincennes les samedi 13 et dimanche 14 avril 2019 pour le grand public, et le lundi 15 pour les professionnels. Au menu ? Dégustations et animations autour de ce fameux spiritueux. Et comme on a un code promo à vous filer, c\'est le moment d\'en profiter !', 5);

--
-- Dumping data for table `fiche_degustation`
--

INSERT INTO `fiche_degustation` (`id`, `analysevisuelle`, `analyseolfactive`, `analysegustative`, `conclusion`, `marque_id`) VALUES
(1, 'robe acajou', 'Fruits secs, café, vanille.', 'Chocolat, vieux porto', 'Narcisse, bois de santal.', 2);

--
-- Dumping data for table `fos_user`
--

INSERT INTO `fos_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`) VALUES
(1, 'fgfggf', 'fgfggf', 'ggkgkg@mail.fr', 'ggkgkg@mail.fr', 1, NULL, '$2y$13$0G3Gu./w.SrnCXtHYPAlhOjzdXoXqrHKrR/9UjA7MlRlYnqfd38Mm', '2019-04-18 12:41:00', NULL, NULL, 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}'),
(2, 'user', 'user', 'user@user.fr', 'user@user.fr', 1, NULL, '$2y$13$STp..qw6NqXldJtlwoCri.iHGCbVDk/RqNpIoL55w60hxn7THjQse', '2019-05-17 21:03:24', NULL, NULL, 'a:0:{}'),
(3, 'admin', 'admin', 'admin@admin.fr', 'admin@admin.fr', 1, NULL, '$2y$13$2O1874a5UVEMeP7mCeW8.OltH98rqlqx3giOU4D.PJocXU90Y89kq', '2019-05-17 21:09:34', NULL, NULL, 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}');

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

--
-- Dumping data for table `rhum`
--

INSERT INTO `rhum` (`id`, `category_id`, `marque`, `type`, `degre`, `volume`, `prix_boutique`, `prix_adherent`, `millesime`) VALUES
(2, 3, 'RHUM DEPAZ', 'Single cask 2003', '45°', '70 cl', 85, 85, '2003-01-01'),
(3, 1, 'HABITATION SAINT ETIENNE', 'Titouan Lamazou 50°', '50°', '70 cl', 24, 24, '2018-01-01'),
(4, 1, 'HABITATION CLEMENT', 'CLEMENT 50)', '50°', '100 cl', 25, 25, '2018-01-01'),
(5, 1, 'HABITATION CLEMENT', 'CANNE BLEUE 2018', '50°', '70 cl', 35, 35, '2018-01-01'),
(6, 1, 'BOTRAN', 'RESERVA 15 anejo', '40°', '70 cl', 42, 42, '2003-01-01');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
