-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 20 août 2020 à 14:05
-- Version du serveur :  10.4.13-MariaDB
-- Version de PHP : 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `banquedupeuplepoo`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

CREATE TABLE `adresse` (
  `id` int(11) UNSIGNED NOT NULL,
  `ville` varchar(20) NOT NULL,
  `dep` varchar(20) DEFAULT NULL,
  `com` varchar(20) DEFAULT NULL,
  `rue` varchar(20) DEFAULT NULL,
  `villa` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `affecter`
--

CREATE TABLE `affecter` (
  `id` int(11) UNSIGNED NOT NULL,
  `mat` varchar(11) NOT NULL,
  `numAgence` varchar(11) NOT NULL,
  `dateAffecter` date NOT NULL,
  `matAffecteur` varchar(11) NOT NULL,
  `etat` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `agence`
--

CREATE TABLE `agence` (
  `numero` varchar(11) NOT NULL,
  `adrAgence` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE `compte` (
  `numero` varchar(11) NOT NULL,
  `id_entreprise` int(11) UNSIGNED DEFAULT NULL,
  `mat` varchar(11) DEFAULT NULL,
  `rib` int(3) NOT NULL,
  `solde` double(10,5) NOT NULL,
  `dateOuverture` date NOT NULL,
  `nomEmpl` varchar(50) DEFAULT NULL,
  `telEmpl` varchar(20) DEFAULT NULL,
  `agios` double(10,5) DEFAULT NULL,
  `fraisOuverture` double(10,5) DEFAULT NULL,
  `remuneration` double(10,5) DEFAULT NULL,
  `dateDebut` date DEFAULT NULL,
  `dateFin` date DEFAULT NULL,
  `typeCompte` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `compte`
--

INSERT INTO `compte` (`numero`, `id_entreprise`, `mat`, `rib`, `solde`, `dateOuverture`, `nomEmpl`, `telEmpl`, `agios`, `fraisOuverture`, `remuneration`, `dateDebut`, `dateFin`, `typeCompte`) VALUES
('3B9JN9EP', 0, 'CMRJAA6E', 1, 0.00000, '2020-08-18', NULL, NULL, NULL, 25000.00000, 10000.00000, NULL, NULL, 1),
('BAUHBKN2', 0, 'G8VNPWUH', 1, 0.00000, '2020-08-19', NULL, NULL, NULL, 25000.00000, 10000.00000, '2020-08-19', '2021-08-19', 3),
('CT87AGDP', 3, NULL, 1, 0.00000, '2020-08-20', NULL, NULL, NULL, 20000.00000, 7500.00000, '2020-08-20', '2021-08-20', 3),
('K3T782HA', 2, NULL, 1, 0.00000, '2020-08-20', NULL, NULL, NULL, 25000.00000, 10000.00000, NULL, NULL, 1),
('MM3DCR7B', 0, 'CMRJAA6E', 1, 0.00000, '2020-08-18', NULL, NULL, NULL, 25000.00000, 10000.00000, NULL, NULL, 1),
('NKFR8JBN', 0, '3BERE2M2', 1, 0.00000, '2020-08-19', NULL, NULL, 10000.00000, NULL, NULL, NULL, NULL, 2),
('P6887HJ9', 0, 'VGP9PT6G', 1, 0.00000, '2020-08-19', NULL, NULL, NULL, 25000.00000, 10000.00000, NULL, NULL, 1),
('PVWUR4GH', 0, 'WJBKHJ4C', 1, 0.00000, '2020-08-19', NULL, NULL, 10000.00000, NULL, NULL, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

CREATE TABLE `entreprise` (
  `id` int(11) UNSIGNED NOT NULL,
  `nom` varchar(20) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `budget` varchar(50) NOT NULL,
  `login` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `adrEntreprise` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `entreprise`
--

INSERT INTO `entreprise` (`id`, `nom`, `tel`, `email`, `budget`, `login`, `password`, `adrEntreprise`) VALUES
(1, 'Auchan', '775655657', 'nma@gmail.com', '80000000', NULL, NULL, 'Thiaroye'),
(2, 'voile', '7812267389', 'voulou@gmail.com', '900003', NULL, NULL, 'Mboro'),
(3, 'saveur asie', '760974634', 'asssii@gmail.com', '6576465', NULL, NULL, 'Louga');

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

CREATE TABLE `etat` (
  `id` int(11) UNSIGNED NOT NULL,
  `libelle` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `etatcompte`
--

CREATE TABLE `etatcompte` (
  `id` int(11) UNSIGNED NOT NULL,
  `numcompte` varchar(11) NOT NULL,
  `etatcompte` int(11) UNSIGNED NOT NULL,
  `dateAffecter` date NOT NULL,
  `matAffecteur` varchar(11) NOT NULL,
  `etat` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `operation`
--

CREATE TABLE `operation` (
  `id` int(11) UNSIGNED NOT NULL,
  `matEmpl` varchar(11) NOT NULL,
  `numcompte` varchar(11) NOT NULL,
  `dateOperation` date NOT NULL,
  `montant` double(10,5) NOT NULL,
  `numcomptevir` varchar(11) DEFAULT NULL,
  `taxe` double(10,5) DEFAULT NULL,
  `taxesms` double(10,5) DEFAULT NULL,
  `dateD` date DEFAULT NULL,
  `dateF` date DEFAULT NULL,
  `typeOperation` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE `personne` (
  `matricule` varchar(11) NOT NULL,
  `cni` varchar(20) DEFAULT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `sexe` varchar(10) NOT NULL,
  `dateNaiss` date NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `adrPersonne` varchar(100) NOT NULL,
  `email` varchar(20) NOT NULL,
  `raison_sociale` varchar(100) DEFAULT NULL,
  `salaire` double DEFAULT NULL,
  `nom_employeur` varchar(50) DEFAULT NULL,
  `adr_employeur` varchar(50) DEFAULT NULL,
  `login` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `personne`
--

INSERT INTO `personne` (`matricule`, `cni`, `nom`, `prenom`, `sexe`, `dateNaiss`, `telephone`, `adrPersonne`, `email`, `raison_sociale`, `salaire`, `nom_employeur`, `adr_employeur`, `login`, `password`) VALUES
('3BERE2M2', '2749847428747', 'Babou', 'maman', 'feminin', '1999-12-08', '77537783723', 'Mboro', 'diadia@gmail.com', 'Lo et frere', 897786, 'egkjhkjhlh', 'nfdtdytffjyfuryt', NULL, NULL),
('CMRJAA6E', '1234567891232', 'FALL', 'Fallou', 'masculin', '1111-11-11', '777777777', 'keur massar', 'mosila2138@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL),
('G8VNPWUH', '2749847428747', 'Dia', 'maman', 'feminin', '1999-12-08', '77537783723', 'Mboro', 'diadia@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL),
('KWJFG98H', '2749847428747', 'Babou', 'maman', 'feminin', '1999-12-08', '77537783723', 'Mboro', 'diadia@gmail.com', 'Lo et frere', 897786, 'egkjhkjhlh', 'nfdtdytffjyfuryt', NULL, NULL),
('UVV2GTVN', '2749847428747', 'Babou', 'maman', 'feminin', '1999-12-08', '77537783723', 'Mboro', 'diadia@gmail.com', 'Lo et frere', 897786, 'egkjhkjhlh', 'nfdtdytffjyfuryt', NULL, NULL),
('VCG4MDPU', '1234567891232', 'FALL', 'Fallou', 'masculin', '1111-11-11', '777777777', 'keur massar', 'mosila2138@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL),
('VGP9PT6G', '2749847428747', 'Babou', 'maman', 'feminin', '1999-12-08', '77537783723', 'Mboro', 'diadia@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL),
('WJBKHJ4C', '2749847428747', 'Babou', 'maman', 'feminin', '1999-12-08', '77537783723', 'Mboro', 'diadia@gmail.com', 'Lo et frere', 897786, 'egkjhkjhlh', 'nfdtdytffjyfuryt', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `profil`
--

CREATE TABLE `profil` (
  `id` int(11) UNSIGNED NOT NULL,
  `libelle` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `typecompte`
--

CREATE TABLE `typecompte` (
  `id` int(11) UNSIGNED NOT NULL,
  `libelle` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `typecompte`
--

INSERT INTO `typecompte` (`id`, `libelle`) VALUES
(1, 'simple'),
(2, 'courant'),
(3, 'bloque');

-- --------------------------------------------------------

--
-- Structure de la table `typeoperation`
--

CREATE TABLE `typeoperation` (
  `id` int(11) UNSIGNED NOT NULL,
  `libelle` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `userrole`
--

CREATE TABLE `userrole` (
  `id` int(11) UNSIGNED NOT NULL,
  `mat` varchar(11) NOT NULL,
  `idProfil` int(11) UNSIGNED NOT NULL,
  `dateAffecter` date NOT NULL,
  `matAffecteur` varchar(11) NOT NULL,
  `etat` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `affecter`
--
ALTER TABLE `affecter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mat` (`mat`),
  ADD KEY `numAgence` (`numAgence`);

--
-- Index pour la table `agence`
--
ALTER TABLE `agence`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `adrAgence` (`adrAgence`);

--
-- Index pour la table `compte`
--
ALTER TABLE `compte`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `numAgence` (`mat`),
  ADD KEY `typeCompte` (`typeCompte`),
  ADD KEY `id_entreprise` (`id_entreprise`);

--
-- Index pour la table `entreprise`
--
ALTER TABLE `entreprise`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `etat`
--
ALTER TABLE `etat`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `etatcompte`
--
ALTER TABLE `etatcompte`
  ADD PRIMARY KEY (`id`),
  ADD KEY `numcompte` (`numcompte`),
  ADD KEY `etatcompte` (`etatcompte`);

--
-- Index pour la table `operation`
--
ALTER TABLE `operation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matEmpl` (`matEmpl`),
  ADD KEY `numcompte` (`numcompte`),
  ADD KEY `typeOperation` (`typeOperation`);

--
-- Index pour la table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`matricule`);

--
-- Index pour la table `profil`
--
ALTER TABLE `profil`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `typecompte`
--
ALTER TABLE `typecompte`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `typeoperation`
--
ALTER TABLE `typeoperation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `userrole`
--
ALTER TABLE `userrole`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mat` (`mat`),
  ADD KEY `idProfil` (`idProfil`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adresse`
--
ALTER TABLE `adresse`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `affecter`
--
ALTER TABLE `affecter`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `entreprise`
--
ALTER TABLE `entreprise`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `etat`
--
ALTER TABLE `etat`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `etatcompte`
--
ALTER TABLE `etatcompte`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `operation`
--
ALTER TABLE `operation`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `profil`
--
ALTER TABLE `profil`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `typecompte`
--
ALTER TABLE `typecompte`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `typeoperation`
--
ALTER TABLE `typeoperation`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `userrole`
--
ALTER TABLE `userrole`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
