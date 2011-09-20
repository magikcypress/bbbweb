--
-- Structure for table `compteur`
--

DROP TABLE IF EXISTS `compteur`;
CREATE TABLE IF NOT EXISTS `compteur` (
  `id_tarif` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `nb_salle` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Structure for table `connection`
--

DROP TABLE IF EXISTS `connection`;
CREATE TABLE IF NOT EXISTS `connection` (
  `id_connection` int(11) NOT NULL AUTO_INCREMENT,
  `ip_visiteur` varchar(50) NOT NULL,
  `date_insert` datetime NOT NULL,
  `id_participant` int(11) NOT NULL,
  `codevip` varchar(50) NOT NULL,
  `term_condition` int(11) NOT NULL,
  `joint_url` text,
  PRIMARY KEY (`id_connection`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Structure for table `consommation`
--

DROP TABLE IF EXISTS `consommation`;
CREATE TABLE IF NOT EXISTS `consommation` (
  `id_consommation` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `prix` float(120,0) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  PRIMARY KEY (`id_consommation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Structure for table `parametres`
--

DROP TABLE IF EXISTS `parametres`;
CREATE TABLE IF NOT EXISTS `parametres` (
  `id_parametres` int(11) NOT NULL AUTO_INCREMENT,
  `urlbbb` varchar(255) NOT NULL,
  `clebbb` varchar(255) NOT NULL,
  `delai` char(10) NOT NULL,
  `codevip` char(8) NOT NULL,
  `numero_tel` char(20) NOT NULL,
  `urlbbbdefaut` varchar(255) NOT NULL,
  `bienvenue` text,
  `host` varchar(50) NOT NULL,
  `port` char(6) NOT NULL,
  `auth` char(2) NOT NULL,
  `usersmtp` varchar(255) NOT NULL,
  `passsmtp` varchar(255) NOT NULL,
  PRIMARY KEY (`id_parametres`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Structure for table `participant`
--

DROP TABLE IF EXISTS `participant`;
CREATE TABLE IF NOT EXISTS `participant` (
  `id_participant` int(11) NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `id_meeting` varchar(255) NOT NULL,
  PRIMARY KEY (`id_participant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Structure for table `planning`
--

DROP TABLE IF EXISTS `planning`;
CREATE TABLE IF NOT EXISTS `planning` (
  `id_planning` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `descriptif` text NOT NULL,
  `date_debut` datetime NOT NULL,
  `date_fin` datetime NOT NULL,
  `open_salle` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  PRIMARY KEY (`id_planning`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Structure for table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
  `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom_salle` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `passmd` varchar(50) NOT NULL,
  `passap` varchar(50) NOT NULL,  
  `email` varchar(50) NOT NULL,
  `url_moderateur` varchar(150) NOT NULL,  
  `url_fin` varchar(150) NOT NULL,    
  `date_creation` datetime NOT NULL,
  PRIMARY KEY (`id_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Structure for table `superutilisateur`
--

DROP TABLE IF EXISTS `superutilisateur`;
CREATE TABLE IF NOT EXISTS `superutilisateur` (
  `id_sutilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date_creation` datetime NOT NULL,
  `mot_passe` varchar(255) NOT NULL,
  PRIMARY KEY (`id_sutilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Structure for table `tarifs`
--

DROP TABLE IF EXISTS `tarifs`;
CREATE TABLE IF NOT EXISTS `tarifs` (
  `id_tarif` int(11) NOT NULL AUTO_INCREMENT,
  `prix` float(120,0) NOT NULL,
  `remise` float(120,0) NOT NULL,
  `description` text NOT NULL,
  `nom` varchar(255) NOT NULL,
  `options` varchar(255) NOT NULL,
  `date_creation` datetime NOT NULL,
  `max_salle` int(11) NOT NULL,
  PRIMARY KEY (`id_tarif`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tel` varchar(50) NOT NULL,
  `raison_social` varchar(255) NOT NULL,
  `adresse` text NOT NULL,
  `code_postal` varchar(10) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `mot_passe` varchar(500) NOT NULL,
  `date_insertion` datetime NOT NULL,
  `id_tarif` int(11) NOT NULL,
  `acquitte` int(5) NOT NULL,
  `validation` int(5) NOT NULL,
  `newsletters` int(5) NOT NULL,
  `tandc` int(5) NOT NULL,
  `cle` varchar(200) NOT NULL,
  PRIMARY KEY (`id_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

