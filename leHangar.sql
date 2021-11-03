-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mer. 03 nov. 2021 à 11:29
-- Version du serveur : 5.5.68-MariaDB
-- Version de PHP : 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `dautecou5u`
--

-- --------------------------------------------------------

--
-- Structure de la table `Categorie`
--

CREATE TABLE `Categorie` (
  `Id` int(11) NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Commande`
--

CREATE TABLE `Commande` (
  `Id` int(11) NOT NULL,
  `Nom_client` varchar(25) NOT NULL,
  `Mail_client` varchar(50) NOT NULL,
  `Tel_client` int(10) NOT NULL,
  `Montant` double NOT NULL,
  `Etat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Gerant`
--

CREATE TABLE `Gerant` (
  `Id` int(11) NOT NULL,
  `Mail` varchar(255) NOT NULL,
  `Mdp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Panier`
--

CREATE TABLE `Panier` (
  `Id_produit` int(11) NOT NULL,
  `Id_Commande` int(11) NOT NULL,
  `Quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Producteur`
--

CREATE TABLE `Producteur` (
  `Id` int(11) NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `Localisation` varchar(255) NOT NULL,
  `Mail` varchar(255) NOT NULL,
  `Mdp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Produit`
--

CREATE TABLE `Produit` (
  `Id` int(11) NOT NULL,
  `Id_Producteur` int(11) NOT NULL,
  `Id_Categorie` int(11) NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Tarif_Unitaire` double NOT NULL,
  `Photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Categorie`
--
ALTER TABLE `Categorie`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `Commande`
--
ALTER TABLE `Commande`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `Gerant`
--
ALTER TABLE `Gerant`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `Panier`
--
ALTER TABLE `Panier`
  ADD KEY `Id_produit` (`Id_produit`),
  ADD KEY `Id_Commande` (`Id_Commande`);

--
-- Index pour la table `Producteur`
--
ALTER TABLE `Producteur`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `Produit`
--
ALTER TABLE `Produit`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_Producteur` (`Id_Producteur`) USING BTREE,
  ADD KEY `fk_Categorie` (`Id_Categorie`) USING BTREE;

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Categorie`
--
ALTER TABLE `Categorie`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Commande`
--
ALTER TABLE `Commande`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Gerant`
--
ALTER TABLE `Gerant`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Producteur`
--
ALTER TABLE `Producteur`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Produit`
--
ALTER TABLE `Produit`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Panier`
--
ALTER TABLE `Panier`
  ADD CONSTRAINT `Panier_ibfk_1` FOREIGN KEY (`Id_produit`) REFERENCES `Produit` (`Id`),
  ADD CONSTRAINT `Panier_ibfk_2` FOREIGN KEY (`Id_Commande`) REFERENCES `Commande` (`Id`);

--
-- Contraintes pour la table `Produit`
--
ALTER TABLE `Produit`
  ADD CONSTRAINT `Produit_ibfk_1` FOREIGN KEY (`Id_Producteur`) REFERENCES `Producteur` (`Id`),
  ADD CONSTRAINT `Produit_ibfk_2` FOREIGN KEY (`Id_Categorie`) REFERENCES `Categorie` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
