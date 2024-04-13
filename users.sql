-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 13 avr. 2024 à 21:09
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `users`
--

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `User_ID` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(250) NOT NULL,
  `e_mail` varchar(250) NOT NULL,
  `mot_de_passe` varchar(250) NOT NULL,
  `adresse` varchar(250) NOT NULL,
  `telephone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

DROP TABLE IF EXISTS `commandes`;
CREATE TABLE IF NOT EXISTS `commandes` (
  `comand_id` int NOT NULL AUTO_INCREMENT,
  `date_commande` date NOT NULL,
  `User_ID` int NOT NULL,
  PRIMARY KEY (`comand_id`),
  KEY `User_ID` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE IF NOT EXISTS `order_detail` (
  `order_detail` int NOT NULL AUTO_INCREMENT,
  `quantite` int NOT NULL,
  `prix_unitaire` double NOT NULL,
  `User_ID` int DEFAULT NULL,
  `comand_id` int DEFAULT NULL,
  PRIMARY KEY (`order_detail`),
  KEY `popo_fk` (`User_ID`),
  KEY `toto_fk` (`comand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

DROP TABLE IF EXISTS `produits`;
CREATE TABLE IF NOT EXISTS `produits` (
  `Product_id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `prix` double NOT NULL,
  `quantité_en_stock` int NOT NULL,
  `img_url` text NOT NULL COMMENT 'lien des images',
  PRIMARY KEY (`Product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `commandes_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `clients` (`User_ID`);

--
-- Contraintes pour la table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `popo_fk` FOREIGN KEY (`User_ID`) REFERENCES `clients` (`User_ID`),
  ADD CONSTRAINT `toto_fk` FOREIGN KEY (`comand_id`) REFERENCES `commandes` (`comand_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
