-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 09 juin 2024 à 03:08
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `associationdanse`
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

--
-- Déchargement des données de la table `abonnement`
--

INSERT INTO `abonnement` (`ID_Abonnement`, `Date_Debut`, `Date_Fin`) VALUES
(1, '2024-01-01', '2024-06-30'),
(2, '2024-02-01', '2024-07-31'),
(3, '2024-03-01', '2024-08-31'),
(4, '2024-04-01', '2024-09-30'),
(5, '2024-05-01', '2024-10-31'),
(6, '2024-06-01', '2024-11-30'),
(7, '2024-07-01', '2024-12-31'),
(8, '2024-08-01', '2025-01-31'),
(9, '2024-09-01', '2025-02-28'),
(10, '2024-10-01', '2025-03-31');

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

--
-- Déchargement des données de la table `actualite`
--

INSERT INTO `actualite` (`ID_Actualite`, `Titre`, `Contenu`, `Date_Publication`) VALUES
(1, 'Nouvelle session de Sabar', 'Une nouvelle session de Sabar débutera le mois prochain.', '2024-06-01'),
(2, 'Actualités sur la danse Irlandaise', 'Venez découvrir l Irlande sous toutes ses formes.', '2024-06-02'),
(3, 'Cours de danse supplémentaire', 'Un cours de danse supplémentaire a été ajouté.', '2024-06-03');

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

--
-- Déchargement des données de la table `administrateur`
--

INSERT INTO `administrateur` (`ID_Admin`, `Nom`, `Prenom`, `Email`, `Pwd`) VALUES
(1, 'Martin', 'Paul', 'paul.martin@example.com', 'password2');

-- --------------------------------------------------------

--
-- Structure de la table `carte`
--

CREATE TABLE `carte` (
  `ID_Carte` int(11) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Date_Expiration` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `carte`
--

INSERT INTO `carte` (`ID_Carte`, `Type`, `Date_Expiration`) VALUES
(1, 'Unité', '2024-12-31'),
(2, 'Carte 5 places', '2025-06-30'),
(3, 'Carte 10 places', '2025-12-31'),
(4, 'Carte 20 places', '2025-12-31'),
(5, 'Carte 30 places', '2026-06-30'),
(6, 'Carte 40 places', '2026-12-31'),
(7, 'Carte 50 places', '2027-06-30'),
(8, 'Carte 60 places', '2027-12-31'),
(9, 'Carte 70 places', '2028-06-30'),
(10, 'Carte 80 places', '2028-12-31');

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

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`ID_Cours`, `Title`, `Type`, `Image`, `Duree`, `Date_Heure_Debut`, `Prix`, `Lien`, `ID_Admin`) VALUES
(1, 'Tango', 'Danse', 'image1.jpg', 60, '2024-06-01 18:00:00', 20.00, 'http://example.com/course1', 1),
(2, 'Danse Orientale', 'Danse', 'image2.jpg', 90, '2024-06-02 10:00:00', 15.00, 'http://example.com/course2', 1),
(3, 'Flamenco', 'Danse', 'image3.jpg', 120, '2024-06-03 14:00:00', 25.00, 'http://example.com/course3', 1),
(4, 'Danse Irlandaise', 'Arts', 'image4.jpg', 150, '2024-06-04 16:00:00', 30.00, 'http://example.com/course4', 1),
(5, 'Salsa Cubaine', 'Danse', 'image5.jpg', 180, '2024-06-05 19:00:00', 20.00, 'http://example.com/course5', 1),
(6, 'Otea', 'Danse', 'image6.jpg', 200, '2024-06-06 11:00:00', 35.00, 'http://example.com/course6', 1),
(7, 'Country', 'Danse', 'image7.jpg', 90, '2024-06-07 09:00:00', 15.00, 'http://example.com/course7', 1),
(8, 'Danse Bollywood', 'Danse', 'image8.jpg', 120, '2024-06-08 15:00:00', 25.00, 'http://example.com/course8', 1),
(9, 'Valse Viennoise', 'Danse', 'image9.jpg', 60, '2024-06-09 17:00:00', 20.00, 'http://example.com/course9', 1),
(10, 'Sabar', 'Danse', 'image10.jpg', 90, '2024-06-10 13:00:00', 15.00, 'http://example.com/course10', 1);

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

--
-- Déchargement des données de la table `eleve`
--

INSERT INTO `eleve` (`ID_Eleve`, `Nom`, `Prenom`, `Email`, `Compte_Standard`, `Compte_Google`, `Compte_Facebook`, `Credits`, `Duree_Abonnement`, `Pwd`) VALUES
(1, 'Durand', 'Pierre', 'pierre.durand@example.com', 1, 0, 0, 10, 6, 'password1'),
(2, 'Lefevre', 'Pauline', 'pauline.lefevre@example.com', 1, 0, 0, 15, 12, 'password2'),
(3, 'Martin', 'Lucas', 'lucas.martin@example.com', 1, 0, 0, 5, 3, 'password3'),
(4, 'Moreau', 'Julie', 'julie.moreau@example.com', 1, 0, 0, 20, 24, 'password4'),
(5, 'Petit', 'Thomas', 'thomas.petit@example.com', 1, 0, 0, 8, 6, 'password5'),
(6, 'Leroy', 'Sophie', 'sophie.leroy@example.com', 1, 0, 0, 12, 12, 'password6'),
(7, 'Roux', 'Camille', 'camille.roux@example.com', 1, 0, 0, 6, 3, 'password7'),
(8, 'Vincent', 'Emma', 'emma.vincent@example.com', 1, 0, 0, 18, 24, 'password8'),
(9, 'Garcia', 'Nicolas', 'nicolas.garcia@example.com', 1, 0, 0, 9, 6, 'password9'),
(10, 'David', 'Chloe', 'chloe.david@example.com', 1, 0, 0, 13, 12, 'password10');

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

--
-- Déchargement des données de la table `participer`
--

INSERT INTO `participer` (`ID_Eleve`, `ID_Cours`, `Moyen_Paiement`, `Date_Participation`) VALUES
(1, 1, 'Espèces', '2024-06-01'),
(2, 2, 'Carte', '2024-06-02'),
(3, 3, 'Carte', '2024-06-03'),
(4, 4, 'Espèces', '2024-06-04'),
(5, 5, 'Abonnement', '2024-06-05'),
(6, 6, 'Abonnement', '2024-06-06'),
(7, 7, 'Carte', '2024-06-07'),
(8, 8, 'Espèces', '2024-06-08'),
(9, 9, 'Carte', '2024-06-09'),
(10, 10, 'Abonnement', '2024-06-10');

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

--
-- Déchargement des données de la table `professeur`
--

INSERT INTO `professeur` (`ID_Prof`, `Nom`, `Prenom`, `Photo`, `Description`, `Email`, `Pwd`, `ID_Admin`) VALUES
(1, 'Blanc', 'Marie', 'photo1.jpg', 'Professeur de Flamenco', 'marie.blanc@example.com', 'password1', 1),
(2, 'Morel', 'Paul', 'photo2.jpg', 'Professeur de Danse Orientale', 'paul.morel@example.com', 'password2', 1),
(3, 'Dubois', 'Claire', 'photo3.jpg', 'Professeur de Country', 'claire.dubois@example.com', 'password3', 1),
(4, 'Fontaine', 'Luc', 'photo4.jpg', 'Professeur d Otea', 'luc.fontaine@example.com', 'password4', 1),
(5, 'Gauthier', 'Nina', 'photo5.jpg', 'Professeur de Salsa Cubaine', 'nina.gauthier@example.com', 'password5', 1),
(6, 'Renaud', 'Marc', 'photo6.jpg', 'Professeur de Danse Bollywood', 'marc.renaud@example.com', 'password6', 1),
(7, 'Legrand', 'Sophie', 'photo7.jpg', 'Professeur de Valse Viennoise', 'sophie.legrand@example.com', 'password7', 1),
(8, 'Lemoine', 'Lucas', 'photo8.jpg', 'Professeur de Tango', 'lucas.lemoine@example.com', 'password8', 1),
(9, 'Marchand', 'Julie', 'photo9.jpg', 'Professeur de Danse Irlandaise', 'julie.marchand@example.com', 'password9', 1),
(10, 'Ousmane', 'Bongo', 'photo10.jpg', 'Professeur de Sabar', 'ousmane.bongo@example.com', 'password10', 1);

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
  MODIFY `ID_Abonnement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `actualite`
--
ALTER TABLE `actualite`
  MODIFY `ID_Actualite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `administrateur`
--
ALTER TABLE `administrateur`
  MODIFY `ID_Admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `carte`
--
ALTER TABLE `carte`
  MODIFY `ID_Carte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `cours`
--
ALTER TABLE `cours`
  MODIFY `ID_Cours` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `eleve`
--
ALTER TABLE `eleve`
  MODIFY `ID_Eleve` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `professeur`
--
ALTER TABLE `professeur`
  MODIFY `ID_Prof` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
