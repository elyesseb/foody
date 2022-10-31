-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 04 nov. 2021 à 10:01
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `foody_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `CodeCateg` int(11) NOT NULL AUTO_INCREMENT,
  `NomCateg` varchar(15) NOT NULL,
  `Descriptionn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CodeCateg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `Codecli` varchar(10) NOT NULL,
  `Societe` varchar(45) NOT NULL,
  `Contact` varchar(45) NOT NULL,
  `Fonction` varchar(45) NOT NULL,
  `Adresse` varchar(45) DEFAULT NULL,
  `Ville` varchar(25) DEFAULT NULL,
  `Region` varchar(25) DEFAULT NULL,
  `Codepostal` varchar(10) DEFAULT NULL,
  `Pays` varchar(25) DEFAULT NULL,
  `Tel` varchar(25) DEFAULT NULL,
  `Fax` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`Codecli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `NoCom` int(11) NOT NULL AUTO_INCREMENT,
  `CodeCli` varchar(10) DEFAULT NULL,
  `NoEmp` int(11) DEFAULT NULL,
  `DateCom` datetime DEFAULT NULL,
  `ALivAvant` datetime DEFAULT NULL,
  `DateEnv` datetime DEFAULT NULL,
  `NoMess` int(11) DEFAULT NULL,
  `Portt` decimal(10,4) NOT NULL DEFAULT 0.0000,
  `Destinataire` varchar(50) DEFAULT NULL,
  `AdrLiv` varchar(50) DEFAULT NULL,
  `VilleLiv` varchar(50) DEFAULT NULL,
  `RegionLiv` varchar(50) DEFAULT NULL,
  `CodePostalLiv` varchar(20) DEFAULT NULL,
  `PaysLiv` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`NoCom`),
  KEY `Commande_fk0` (`CodeCli`),
  KEY `Commande_fk1` (`NoEmp`),
  KEY `Commande_fk2` (`NoMess`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `detailcommande`
--

DROP TABLE IF EXISTS `detailcommande`;
CREATE TABLE IF NOT EXISTS `detailcommande` (
  `NoCom` int(11) NOT NULL,
  `RefProd` int(11) NOT NULL,
  `PrixUnit` decimal(10,4) NOT NULL DEFAULT 0.0000,
  `Qte` int(11) NOT NULL DEFAULT 1,
  `Remise` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`NoCom`,`RefProd`),
  KEY `DetailCommande_fk1` (`RefProd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

DROP TABLE IF EXISTS `employe`;
CREATE TABLE IF NOT EXISTS `employe` (
  `NoEmp` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `Fonction` varchar(50) DEFAULT NULL,
  `TitreCourtoisie` varchar(50) DEFAULT NULL,
  `DateNaissance` datetime DEFAULT NULL,
  `DateEmbauche` datetime DEFAULT NULL,
  `Adresse` varchar(60) DEFAULT NULL,
  `Ville` varchar(50) DEFAULT NULL,
  `Region` varchar(50) DEFAULT NULL,
  `Codepostal` varchar(50) DEFAULT NULL,
  `Pays` varchar(50) DEFAULT NULL,
  `TelDom` varchar(20) DEFAULT NULL,
  `Extension` varchar(50) DEFAULT NULL,
  `RendCompteA` int(11) DEFAULT NULL,
  PRIMARY KEY (`NoEmp`),
  KEY `Employe_fk0` (`RendCompteA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `NoFour` int(11) NOT NULL AUTO_INCREMENT,
  `Societe` varchar(45) NOT NULL,
  `Contact` varchar(45) DEFAULT NULL,
  `Fonction` varchar(45) DEFAULT NULL,
  `Adresse` varchar(255) DEFAULT NULL,
  `Ville` varchar(45) DEFAULT NULL,
  `Region` varchar(45) DEFAULT NULL,
  `CodePostal` varchar(10) DEFAULT NULL,
  `Pays` varchar(45) DEFAULT NULL,
  `Tel` varchar(20) DEFAULT NULL,
  `Fax` varchar(20) DEFAULT NULL,
  `PageAccueil` mediumtext DEFAULT NULL,
  PRIMARY KEY (`NoFour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `messager`
--

DROP TABLE IF EXISTS `messager`;
CREATE TABLE IF NOT EXISTS `messager` (
  `NoMess` int(11) NOT NULL AUTO_INCREMENT,
  `NomMess` varchar(50) NOT NULL,
  `Tel` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`NoMess`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `RefProd` int(11) NOT NULL AUTO_INCREMENT,
  `NomProd` varchar(50) NOT NULL,
  `NoFour` int(11) DEFAULT NULL,
  `CodeCateg` int(11) DEFAULT NULL,
  `QteParUnit` varchar(20) DEFAULT NULL,
  `PrixUnit` decimal(10,4) DEFAULT 0.0000,
  `UnitesStock` smallint(6) DEFAULT 0,
  `UnitesCom` int(11) DEFAULT 0,
  `NiveauReap` int(11) DEFAULT 0,
  `Indisponible` bit(1) NOT NULL,
  PRIMARY KEY (`RefProd`),
  KEY `Produit_fk0` (`NoFour`),
  KEY `Produit_fk1` (`CodeCateg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `Commande_fk0` FOREIGN KEY (`CodeCli`) REFERENCES `client` (`Codecli`),
  ADD CONSTRAINT `Commande_fk1` FOREIGN KEY (`NoEmp`) REFERENCES `employe` (`NoEmp`),
  ADD CONSTRAINT `Commande_fk2` FOREIGN KEY (`NoMess`) REFERENCES `messager` (`NoMess`);

--
-- Contraintes pour la table `detailcommande`
--
ALTER TABLE `detailcommande`
  ADD CONSTRAINT `DetailCommande_fk0` FOREIGN KEY (`NoCom`) REFERENCES `commande` (`NoCom`),
  ADD CONSTRAINT `DetailCommande_fk1` FOREIGN KEY (`RefProd`) REFERENCES `produit` (`RefProd`);

--
-- Contraintes pour la table `employe`
--
ALTER TABLE `employe`
  ADD CONSTRAINT `Employe_fk0` FOREIGN KEY (`RendCompteA`) REFERENCES `employe` (`NoEmp`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `Produit_fk0` FOREIGN KEY (`NoFour`) REFERENCES `fournisseur` (`NoFour`),
  ADD CONSTRAINT `Produit_fk1` FOREIGN KEY (`CodeCateg`) REFERENCES `categorie` (`CodeCateg`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
