-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 09 juin 2024 à 00:50
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `associations`
--

-- --------------------------------------------------------

--
-- Structure de la table `abonnement`
--

CREATE TABLE `abonnement` (
  `ID_Abonnement` int(11) NOT NULL,
  `Date_Debut` date NOT NULL,
  `Date_Fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `actualite`
--

CREATE TABLE `actualite` (
  `ID_Actualite` int(11) NOT NULL,
  `Titre` varchar(100) NOT NULL,
  `Contenu` text NOT NULL,
  `Date_Publication` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE `administrateur` (
  `ID_Admin` int(11) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Pwd` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `carte`
--

CREATE TABLE `carte` (
  `ID_Carte` int(11) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Date_Expiration` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

CREATE TABLE `cours` (
  `ID_Cours` int(11) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `Duree` int(11) NOT NULL,
  `Date_Heure_Debut` datetime NOT NULL,
  `Prix` decimal(10,2) NOT NULL,
  `Lien` varchar(255) DEFAULT NULL,
  `ID_Admin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

CREATE TABLE `eleve` (
  `ID_Eleve` int(11) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Compte_Standard` tinyint(1) DEFAULT 1,
  `Compte_Google` tinyint(1) DEFAULT 0,
  `Compte_Facebook` tinyint(1) DEFAULT 0,
  `Credits` int(11) DEFAULT 0,
  `Duree_Abonnement` int(11) DEFAULT 0,
  `Pwd` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `enseigner`
--

CREATE TABLE `enseigner` (
  `ID_Prof` int(11) NOT NULL,
  `ID_Cours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gestion_eleve`
--

CREATE TABLE `gestion_eleve` (
  `ID_Eleve` int(11) NOT NULL,
  `ID_Gestionnaire` int(11) NOT NULL,
  `Type_Gestionnaire` enum('PROFESSEUR','ADMINISTRATEUR') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gestion_professeur`
--

CREATE TABLE `gestion_professeur` (
  `ID_Prof` int(11) NOT NULL,
  `ID_Admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `participer`
--

CREATE TABLE `participer` (
  `ID_Eleve` int(11) NOT NULL,
  `ID_Cours` int(11) NOT NULL,
  `Moyen_Paiement` varchar(50) DEFAULT NULL,
  `Date_Participation` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `posseder`
--

CREATE TABLE `posseder` (
  `ID_Eleve` int(11) NOT NULL,
  `ID_Carte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

CREATE TABLE `professeur` (
  `ID_Prof` int(11) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `Photo` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `Pwd` varchar(255) NOT NULL,
  `ID_Admin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `souscrire`
--

CREATE TABLE `souscrire` (
  `ID_Eleve` int(11) NOT NULL,
  `ID_Abonnement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `abonnement`
--
ALTER TABLE `abonnement`
  ADD PRIMARY KEY (`ID_Abonnement`);

--
-- Index pour la table `actualite`
--
ALTER TABLE `actualite`
  ADD PRIMARY KEY (`ID_Actualite`);

--
-- Index pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD PRIMARY KEY (`ID_Admin`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Index pour la table `carte`
--
ALTER TABLE `carte`
  ADD PRIMARY KEY (`ID_Carte`);

--
-- Index pour la table `cours`
--
ALTER TABLE `cours`
  ADD PRIMARY KEY (`ID_Cours`),
  ADD KEY `ID_Admin` (`ID_Admin`);

--
-- Index pour la table `eleve`
--
ALTER TABLE `eleve`
  ADD PRIMARY KEY (`ID_Eleve`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Index pour la table `enseigner`
--
ALTER TABLE `enseigner`
  ADD PRIMARY KEY (`ID_Prof`,`ID_Cours`),
  ADD KEY `ID_Cours` (`ID_Cours`);

--
-- Index pour la table `gestion_eleve`
--
ALTER TABLE `gestion_eleve`
  ADD PRIMARY KEY (`ID_Eleve`,`ID_Gestionnaire`,`Type_Gestionnaire`),
  ADD KEY `ID_Gestionnaire` (`ID_Gestionnaire`);

--
-- Index pour la table `gestion_professeur`
--
ALTER TABLE `gestion_professeur`
  ADD PRIMARY KEY (`ID_Prof`,`ID_Admin`),
  ADD KEY `ID_Admin` (`ID_Admin`);

--
-- Index pour la table `participer`
--
ALTER TABLE `participer`
  ADD PRIMARY KEY (`ID_Eleve`,`ID_Cours`),
  ADD KEY `ID_Cours` (`ID_Cours`);

--
-- Index pour la table `posseder`
--
ALTER TABLE `posseder`
  ADD PRIMARY KEY (`ID_Eleve`,`ID_Carte`),
  ADD KEY `ID_Carte` (`ID_Carte`);

--
-- Index pour la table `professeur`
--
ALTER TABLE `professeur`
  ADD PRIMARY KEY (`ID_Prof`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `ID_Admin` (`ID_Admin`);

--
-- Index pour la table `souscrire`
--
ALTER TABLE `souscrire`
  ADD PRIMARY KEY (`ID_Eleve`,`ID_Abonnement`),
  ADD KEY `ID_Abonnement` (`ID_Abonnement`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `abonnement`
--
ALTER TABLE `abonnement`
  MODIFY `ID_Abonnement` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `actualite`
--
ALTER TABLE `actualite`
  MODIFY `ID_Actualite` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `administrateur`
--
ALTER TABLE `administrateur`
  MODIFY `ID_Admin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `carte`
--
ALTER TABLE `carte`
  MODIFY `ID_Carte` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cours`
--
ALTER TABLE `cours`
  MODIFY `ID_Cours` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `eleve`
--
ALTER TABLE `eleve`
  MODIFY `ID_Eleve` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `professeur`
--
ALTER TABLE `professeur`
  MODIFY `ID_Prof` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cours`
--
ALTER TABLE `cours`
  ADD CONSTRAINT `cours_ibfk_1` FOREIGN KEY (`ID_Admin`) REFERENCES `administrateur` (`ID_Admin`);

--
-- Contraintes pour la table `enseigner`
--
ALTER TABLE `enseigner`
  ADD CONSTRAINT `enseigner_ibfk_1` FOREIGN KEY (`ID_Prof`) REFERENCES `professeur` (`ID_Prof`),
  ADD CONSTRAINT `enseigner_ibfk_2` FOREIGN KEY (`ID_Cours`) REFERENCES `cours` (`ID_Cours`);

--
-- Contraintes pour la table `gestion_eleve`
--
ALTER TABLE `gestion_eleve`
  ADD CONSTRAINT `gestion_eleve_ibfk_1` FOREIGN KEY (`ID_Eleve`) REFERENCES `eleve` (`ID_Eleve`),
  ADD CONSTRAINT `gestion_eleve_ibfk_2` FOREIGN KEY (`ID_Gestionnaire`) REFERENCES `professeur` (`ID_Prof`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gestion_eleve_ibfk_3` FOREIGN KEY (`ID_Gestionnaire`) REFERENCES `administrateur` (`ID_Admin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `gestion_professeur`
--
ALTER TABLE `gestion_professeur`
  ADD CONSTRAINT `gestion_professeur_ibfk_1` FOREIGN KEY (`ID_Prof`) REFERENCES `professeur` (`ID_Prof`),
  ADD CONSTRAINT `gestion_professeur_ibfk_2` FOREIGN KEY (`ID_Admin`) REFERENCES `administrateur` (`ID_Admin`);

--
-- Contraintes pour la table `participer`
--
ALTER TABLE `participer`
  ADD CONSTRAINT `participer_ibfk_1` FOREIGN KEY (`ID_Eleve`) REFERENCES `eleve` (`ID_Eleve`),
  ADD CONSTRAINT `participer_ibfk_2` FOREIGN KEY (`ID_Cours`) REFERENCES `cours` (`ID_Cours`);

--
-- Contraintes pour la table `posseder`
--
ALTER TABLE `posseder`
  ADD CONSTRAINT `posseder_ibfk_1` FOREIGN KEY (`ID_Eleve`) REFERENCES `eleve` (`ID_Eleve`),
  ADD CONSTRAINT `posseder_ibfk_2` FOREIGN KEY (`ID_Carte`) REFERENCES `carte` (`ID_Carte`);

--
-- Contraintes pour la table `professeur`
--
ALTER TABLE `professeur`
  ADD CONSTRAINT `professeur_ibfk_1` FOREIGN KEY (`ID_Admin`) REFERENCES `administrateur` (`ID_Admin`);

--
-- Contraintes pour la table `souscrire`
--
ALTER TABLE `souscrire`
  ADD CONSTRAINT `souscrire_ibfk_1` FOREIGN KEY (`ID_Eleve`) REFERENCES `eleve` (`ID_Eleve`),
  ADD CONSTRAINT `souscrire_ibfk_2` FOREIGN KEY (`ID_Abonnement`) REFERENCES `abonnement` (`ID_Abonnement`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
