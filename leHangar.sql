-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 02 nov. 2021 à 15:21
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
-- Base de données : `leHangar`
--

-- --------------------------------------------------------

--
-- Structure de la table `Catégorie`
--

CREATE TABLE `Catégorie` (
  `Id` int(11) NOT NULL,
  `Nom` varchar(25) NOT NULL,
  `Description` text NOT NULL,
  `Id_Produit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Commande`
--

CREATE TABLE `Commande` (
  `Id` int(11) NOT NULL,
  `nom_client` varchar(25) NOT NULL,
  `mail_client` varchar(50) NOT NULL,
  `tel_client` int(10) NOT NULL,
  `montant` double NOT NULL,
  `etat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Gérant`
--

CREATE TABLE `Gérant` (
  `Id` int(11) NOT NULL,
  `Mail` varchar(50) NOT NULL,
  `Mdp` varchar(25) NOT NULL,
  `Id_Commande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Panier`
--

CREATE TABLE `Panier` (
  `Id_Produit` int(11) NOT NULL,
  `Id_Commande` int(11) NOT NULL,
  `quantite` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Producteur`
--

CREATE TABLE `Producteur` (
  `Id` int(11) NOT NULL,
  `Nom` varchar(25) NOT NULL,
  `Localisation` varchar(200) NOT NULL,
  `Mail` varchar(100) NOT NULL,
  `Mdp` varchar(25) NOT NULL,
  `Id_Produit` int(11) NOT NULL,
  `Id_Commande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Produit`
--

CREATE TABLE `Produit` (
  `Id` int(11) NOT NULL,
  `Nom` varchar(25) DEFAULT NULL,
  `Description` text,
  `Tarif_unitaire` double DEFAULT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Catégorie`
--
ALTER TABLE `Catégorie`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `foreign_key_idProduit_Catégorie` (`Id_Produit`);

--
-- Index pour la table `Commande`
--
ALTER TABLE `Commande`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `Gérant`
--
ALTER TABLE `Gérant`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Mail` (`Mail`),
  ADD KEY `fk_gerant_commande` (`Id_Commande`);

--
-- Index pour la table `Panier`
--
ALTER TABLE `Panier`
  ADD KEY `fk_produit_commande` (`Id_Produit`),
  ADD KEY `fk_commande_produit` (`Id_Commande`);

--
-- Index pour la table `Producteur`
--
ALTER TABLE `Producteur`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Mail` (`Mail`),
  ADD KEY `foreign_key_idProduit_Producteur` (`Id_Produit`),
  ADD KEY `fk_Producteur_Commande` (`Id_Commande`);

--
-- Index pour la table `Produit`
--
ALTER TABLE `Produit`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Catégorie`
--
ALTER TABLE `Catégorie`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `Commande`
--
ALTER TABLE `Commande`
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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Catégorie`
--
ALTER TABLE `Catégorie`
  ADD CONSTRAINT `foreign_key_idProduit_Catégorie` FOREIGN KEY (`Id_Produit`) REFERENCES `Produit` (`Id`);

--
-- Contraintes pour la table `Gérant`
--
ALTER TABLE `Gérant`
  ADD CONSTRAINT `fk_gerant_commande` FOREIGN KEY (`Id_Commande`) REFERENCES `Commande` (`Id`);

--
-- Contraintes pour la table `Panier`
--
ALTER TABLE `Panier`
  ADD CONSTRAINT `fk_commande_produit` FOREIGN KEY (`Id_Commande`) REFERENCES `Commande` (`Id`),
  ADD CONSTRAINT `fk_produit_commande` FOREIGN KEY (`Id_Produit`) REFERENCES `Produit` (`Id`);

--
-- Contraintes pour la table `Producteur`
--
ALTER TABLE `Producteur`
  ADD CONSTRAINT `fk_Producteur_Commande` FOREIGN KEY (`Id_Commande`) REFERENCES `Commande` (`Id`),
  ADD CONSTRAINT `foreign_key_idProduit_Producteur` FOREIGN KEY (`Id_Produit`) REFERENCES `Produit` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
