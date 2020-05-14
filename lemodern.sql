-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 14 mai 2020 à 13:06
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
-- Base de données :  `lemodern`
--

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

DROP TABLE IF EXISTS `film`;
CREATE TABLE IF NOT EXISTS `film` (
  `idFilm` int(10) NOT NULL AUTO_INCREMENT,
  `libelleFilm` varchar(255) NOT NULL,
  `anneeSortie` int(4) NOT NULL,
  `numGenre` int(4) NOT NULL,
  `numRealisateur` int(4) NOT NULL,
  PRIMARY KEY (`idFilm`),
  KEY `numGenre` (`numGenre`,`numRealisateur`),
  KEY `numRealisateur` (`numRealisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=1802 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`idFilm`, `libelleFilm`, `anneeSortie`, `numGenre`, `numRealisateur`) VALUES
(1, 'Star Wars', 1977, 2, 360),
(2, 'Shawshank Redemption, The', 1994, 5, 1040),
(3, 'Pulp Fiction', 1994, 6, 444),
(5, 'Star Wars: Episode V - The Empire Strikes Back', 1980, 2, 651),
(6, 'Usual Suspects, The', 1995, 4, 639),
(7, 'Schindler\'s List', 1993, 9, 18),
(8, 'Saving Private Ryan', 1998, 11, 18),
(9, 'Braveheart', 1995, 12, 22),
(10, 'American Beauty', 1999, 9, 2542),
(11, 'Raiders of the Lost Ark', 1981, 5, 18),
(12, 'Godfather, The', 1972, 9, 28),
(14, 'Blade Runner', 1982, 2, 110),
(15, 'Silence of the Lambs, The', 1991, 1, 281),
(18, 'Sixth Sense, The', 1999, 1, 966),
(21, 'Se7en', 1995, 4, 414),
(22, 'Fargo', 1996, 4, 111),
(23, '2001: A Space Odyssey', 1968, 2, 82),
(24, 'Aliens', 1986, 1, 198),
(27, 'Casablanca', 1942, 9, 675),
(28, 'One Flew Over the Cuckoo\'s Nest', 1975, 4, 408),
(32, 'Gladiator', 2000, 6, 110),
(33, 'Fight Club', 1999, 6, 414),
(34, 'Clockwork Orange, A', 1971, 2, 82),
(35, 'Alien', 1979, 1, 110),
(36, 'Princess Bride, The', 1987, 8, 37),
(39, 'Reservoir Dogs', 1992, 6, 444),
(40, 'Citizen Kane', 1941, 9, 253),
(41, 'Dr. Strangelove or: How I Learned to Stop Worrying and Love the Bomb', 1964, 2, 82),
(43, 'Goodfellas', 1990, 9, 78),
(45, 'Apocalypse Now', 1979, 11, 28),
(49, 'Monty Python and the Holy Grail', 1975, 3, 59),
(54, 'Psycho', 1960, 1, 11),
(61, 'Godfather: Part II, The', 1974, 9, 28),
(63, 'Shining, The', 1980, 1, 82),
(64, 'Amadeus', 1984, 12, 408),
(65, 'Taxi Driver', 1976, 9, 78),
(69, 'Full Metal Jacket', 1987, 11, 82),
(70, 'Being John Malkovich', 1999, 3, 1485),
(72, 'Wizard of Oz, The', 1939, 7, 1151),
(73, 'Green Mile, The', 1999, 9, 1040),
(74, 'Vita &#232; bella, La', 1997, 7, 820),
(82, 'American History X', 1998, 9, 2663),
(87, 'Rear Window', 1954, 5, 11),
(94, 'North by Northwest', 1959, 5, 11),
(97, 'Vertigo', 1958, 6, 11),
(105, 'Gone with the Wind', 1939, 7, 1151),
(116, 'Toy Story 2', 1999, 8, 2043),
(121, 'To Kill a Mockingbird', 1962, 4, 2586),
(123, 'Graduate, The', 1967, 3, 47),
(143, 'Sling Blade', 1996, 1, 298),
(149, 'Deer Hunter, The', 1978, 1, 2645),
(150, 'Boot, Das', 1981, 1, 140),
(154, 'Chinatown', 1974, 6, 90),
(159, '12 Angry Men', 1957, 9, 80),
(161, 'Sting, The', 1973, 1, 276),
(162, 'Glory', 1989, 12, 382),
(163, 'Raging Bull', 1980, 6, 78),
(165, 'Wallace & Gromit: The Wrong Trousers', 1993, 8, 572),
(186, 'Insider, The', 1999, 1, 1106),
(189, 'Bridge on the River Kwai, The', 1957, 12, 1080),
(208, 'Annie Hall', 1977, 12, 1),
(211, 'Ben-Hur', 1959, 12, 620),
(221, 'Christmas Story, A', 1983, 3, 579),
(222, 'Singin\' in the Rain', 1952, 3, 428),
(225, 'Butch Cassidy and the Sundance Kid', 1969, 7, 276),
(237, 'Some Like It Hot', 1959, 3, 79),
(241, 'Shichinin no samurai', 1954, 12, 208),
(249, 'Buono, il brutto, il cattivo, Il', 1966, 12, 268),
(271, 'Great Escape, The', 1963, 9, 2473),
(288, 'Third Man, The', 1949, 9, 1003),
(299, 'African Queen, The', 1951, 12, 312),
(303, 'Central do Brasil', 1998, 12, 2560),
(324, 'Nuovo cinema Paradiso', 1988, 12, 2142),
(331, 'Wo hu zang long', 2000, 12, 273),
(376, 'Patton', 1970, 11, 405),
(377, 'Cool Hand Luke', 1967, 3, 1029),
(383, 'Wallace & Gromit: A Close Shave', 1995, 8, 572),
(435, 'Trois couleurs: Rouge', 1994, 3, 398),
(442, 'Sunset Blvd.', 1950, 6, 79),
(453, 'Mr. Smith Goes to Washington', 1939, 3, 392),
(455, 'Arsenic and Old Lace', 1944, 3, 392),
(473, 'All About Eve', 1950, 3, 1111),
(476, 'High Noon', 1952, 5, 617),
(478, 'Philadelphia Story, The', 1940, 9, 628),
(483, 'Wild Bunch, The', 1969, 11, 1072),
(486, 'On the Waterfront', 1954, 11, 655),
(510, 'Ran', 1985, 7, 208),
(515, 'Almost Famous', 2000, 3, 391),
(518, 'Paths of Glory', 1957, 11, 82),
(522, 'Touch of Evil', 1958, 1, 253),
(541, 'Todo sobre mi madre', 1999, 12, 394),
(551, 'Rebecca', 1940, 1, 11),
(555, 'Duck Soup', 1933, 1, 992),
(565, 'Treasure of the Sierra Madre, The', 1948, 5, 312),
(570, 'Straight Story, The', 1999, 9, 139),
(580, 'C\'era una volta il West', 1969, 9, 268),
(582, 'Double Indemnity', 1944, 10, 79),
(584, 'Big Sleep, The', 1946, 10, 197),
(589, 'Modern Times', 1936, 3, 145),
(644, 'Searchers, The', 1956, 10, 287),
(646, 'Notorious', 1946, 10, 11),
(660, 'Rashomon', 1950, 4, 208),
(664, 'Mononoke Hime', 1997, 12, 1051),
(667, 'Bringing Up Baby', 1938, 12, 197),
(683, 'Strangers on a Train', 1951, 12, 11),
(686, 'Die xue shuang xiong', 1989, 12, 204),
(689, 'Fucking &#197;m&#229;l', 1998, 3, 2803),
(694, 'Streetcar Named Desire, A', 1951, 3, 655),
(700, 'Conversation, The', 1974, 4, 28),
(707, 'Apartment, The', 1960, 4, 79),
(715, 'Great Dictator, The', 1940, 3, 145),
(734, 'Quiet Man, The', 1952, 3, 287),
(758, 'Dancer in the Dark', 2000, 1, 615),
(777, 'Sjunde inseglet, Det', 1957, 11, 420),
(778, 'Grapes of Wrath, The', 1940, 12, 287),
(785, 'Hustler, The', 1961, 11, 2605),
(827, 'Who\'s Afraid of Virginia Woolf?', 1966, 10, 47),
(848, 'City Lights', 1931, 11, 145),
(922, 'Gold Rush, The', 1925, 3, 145),
(924, 'Adventures of Robin Hood, The', 1938, 5, 675),
(950, 'Night of the Hunter, The', 1955, 9, 1183),
(952, 'His Girl Friday', 1940, 3, 197),
(958, 'Best Years of Our Lives, The', 1946, 3, 620),
(960, 'All Quiet on the Western Front', 1930, 10, 2138),
(962, 'Snatch', 2000, 6, 2205),
(966, 'Night at the Opera, A', 1935, 12, 2532),
(974, 'Yojimbo', 1961, 12, 208),
(976, 'Billy Elliot', 2000, 9, 2784),
(982, 'Stalag 17', 1953, 11, 79),
(983, 'Nosferatu, eine Symphonie des Grauens', 1922, 1, 2035),
(993, 'General, The', 1927, 12, 2343),
(1103, 'Stagecoach', 1939, 1, 287),
(1125, 'Bronenosets Potyomkin', 1925, 12, 2128),
(1130, 'Amarcord', 1974, 11, 399),
(1134, 'Quatre cents coups, Les', 1959, 3, 505),
(1145, 'Scrooge', 1951, 8, 2434),
(1181, 'Au revoir les enfants', 1987, 8, 619),
(1193, 'Strada, La', 1954, 12, 399),
(1200, 'Fanny och Alexander', 1982, 12, 420),
(1202, 'Requiem for a Dream', 2000, 9, 1136),
(1215, 'Thin Man, The', 1934, 3, 2564),
(1230, 'Da hong deng long gao gao gua', 1991, 12, 2830),
(1234, 'Grande illusion, La', 1937, 4, 2292),
(1247, 'Shadow of a Doubt', 1943, 9, 11),
(1248, 'Witness for the Prosecution', 1957, 4, 79),
(1299, 'Smultronstället', 1957, 12, 420),
(1350, 'Crna macka, beli macor', 1998, 12, 663),
(1379, 'Anatomy of a Murder', 1959, 4, 1406),
(1402, 'Enfants du paradis, Les', 1945, 3, 2573),
(1406, 'Aguirre, der Zorn Gottes', 1972, 1, 1886),
(1499, 'Vie rêvée des anges, La', 1998, 3, 2073),
(1522, 'Andrei Rublyov', 1969, 5, 658),
(1568, 'Bride of Frankenstein', 1935, 1, 1097),
(1723, 'Hotaru no haka', 1988, 12, 2401),
(1741, 'Red River', 1948, 11, 197),
(1749, 'Ikiru', 1952, 11, 208),
(1768, 'To Be or Not to Be', 1942, 9, 2014),
(1790, 'Court Jester, The', 1956, 3, 2717),
(1800, 'Un chien andalou', 1929, 4, 815),
(1801, 'Hearts of Darkness: A Filmmaker s Apocalypse', 1991, 1, 2031);

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

DROP TABLE IF EXISTS `genre`;
CREATE TABLE IF NOT EXISTS `genre` (
  `idGenre` int(10) NOT NULL,
  `libelleGenre` varchar(255) NOT NULL,
  PRIMARY KEY (`idGenre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `genre`
--

INSERT INTO `genre` (`idGenre`, `libelleGenre`) VALUES
(1, 'Horreur'),
(2, 'Science-fiction'),
(3, 'Comique'),
(4, 'Enigme'),
(5, 'Aventure'),
(6, 'Action'),
(7, 'Fantastique'),
(8, 'Dessin animé'),
(9, 'Drame'),
(10, 'Western'),
(11, 'Guerre'),
(12, 'Historique');

-- --------------------------------------------------------

--
-- Structure de la table `projeter`
--

DROP TABLE IF EXISTS `projeter`;
CREATE TABLE IF NOT EXISTS `projeter` (
  `idProjection` int(11) NOT NULL AUTO_INCREMENT,
  `numFilm` int(10) NOT NULL,
  `numSalle` int(15) NOT NULL,
  `dateHeure` datetime NOT NULL,
  PRIMARY KEY (`idProjection`),
  KEY `numFilm` (`numFilm`,`numSalle`),
  KEY `numSalle` (`numSalle`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `projeter`
--

INSERT INTO `projeter` (`idProjection`, `numFilm`, `numSalle`, `dateHeure`) VALUES
(1, 10, 2, '2020-04-01 15:30:00'),
(4, 1, 1, '2020-04-02 10:15:00'),
(5, 1, 2, '2020-04-03 10:15:00'),
(6, 3, 1, '2020-04-03 10:15:00'),
(7, 6, 3, '2020-04-03 18:45:00');

-- --------------------------------------------------------

--
-- Structure de la table `realisateur`
--

DROP TABLE IF EXISTS `realisateur`;
CREATE TABLE IF NOT EXISTS `realisateur` (
  `idRealisateur` int(10) NOT NULL,
  `nomRealisateur` varchar(255) NOT NULL,
  PRIMARY KEY (`idRealisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `realisateur`
--

INSERT INTO `realisateur` (`idRealisateur`, `nomRealisateur`) VALUES
(1, 'Woody Allen'),
(11, 'Alfred Hitchcock'),
(18, 'Steven Spielberg'),
(22, 'Mel Gibson'),
(28, 'Francis Ford Coppola'),
(37, 'Rob Reiner'),
(47, 'Mike Nichols'),
(59, 'Terry Gilliam'),
(78, 'Martin Scorsese'),
(79, 'Billy Wilder'),
(80, 'Sidney Lumet'),
(82, 'Stanley Kubrick'),
(90, 'Roman Polanski'),
(110, 'Ridley Scott'),
(111, 'Joel Coen'),
(139, 'David Lynch'),
(140, 'Wolfgang Petersen'),
(145, 'Charles Chaplin'),
(197, 'Howard Hawks'),
(198, 'James Cameron'),
(204, 'John Woo'),
(208, 'Akira Kurosawa'),
(253, 'Orson Welles'),
(268, 'Sergio Leone'),
(273, 'Ang Lee'),
(276, 'George Roy Hill'),
(281, 'Jonathan Demme'),
(287, 'John Ford'),
(298, 'Billy Bob Thornton'),
(312, 'John Huston'),
(360, 'George Lucas'),
(382, 'Edward Zwick'),
(391, 'Cameron Crowe'),
(392, 'Frank Capra'),
(394, 'Pedro Almod&#243;var'),
(398, 'Krzysztof Kieslowski'),
(399, 'Federico Fellini'),
(405, 'Franklin J. Schaffner'),
(408, 'Milos Forman'),
(414, 'David Fincher'),
(420, 'Ingmar Bergman'),
(428, 'Stanley Donen'),
(444, 'Quentin Tarantino'),
(505, 'Fran&#231;ois Truffaut'),
(572, 'Nick Park'),
(579, 'Bob Clark (III)'),
(615, 'Lars von Trier'),
(617, 'Fred Zinnemann'),
(619, 'Louis Malle'),
(620, 'William Wyler'),
(628, 'George Cukor'),
(639, 'Bryan Singer'),
(651, 'Irvin Kershner'),
(655, 'Elia Kazan'),
(658, 'Andrei Tarkovsky'),
(663, 'Emir Kusturica'),
(675, 'Michael Curtiz'),
(815, 'Luis Bu&#241;uel'),
(820, 'Roberto Benigni'),
(966, 'M. Night Shyamalan'),
(992, 'Leo McCarey'),
(1003, 'Carol Reed'),
(1029, 'Stuart Rosenberg (I)'),
(1040, 'Frank Darabont'),
(1051, 'Hayao Miyazaki'),
(1072, 'Sam Peckinpah'),
(1080, 'David Lean'),
(1097, 'James Whale'),
(1106, 'Michael Mann'),
(1111, 'Joseph L. Mankiewicz'),
(1136, 'Darren Aronofsky'),
(1151, 'Victor Fleming'),
(1183, 'Charles Laughton'),
(1406, 'Otto Preminger'),
(1485, 'Spike Jonze'),
(1886, 'Werner Herzog'),
(2014, 'Ernst Lubitsch'),
(2031, 'Fax Bahr'),
(2035, 'F.W. Murnau'),
(2043, 'Ash Brannon'),
(2073, 'Erick Zonca'),
(2128, 'Grigori Aleksandrov'),
(2138, 'Lewis Milestone'),
(2142, 'Giuseppe Tornatore'),
(2205, 'Guy Ritchie'),
(2292, 'Jean Renoir'),
(2343, 'Clyde Bruckman'),
(2401, 'Isao Takahata'),
(2434, 'Brian Desmond Hurst'),
(2473, 'John Sturges'),
(2532, 'Sam Wood'),
(2542, 'Sam Mendes'),
(2560, 'Walter Salles'),
(2564, 'W.S. Van Dyke'),
(2573, 'Marcel Carn&#233;'),
(2586, 'Robert Mulligan'),
(2605, 'Robert Rossen'),
(2645, 'Michael Cimino'),
(2663, 'Tony Kaye (I)'),
(2717, 'Melvin Frank'),
(2784, 'Stephen Daldry'),
(2803, 'Lukas Moodysson'),
(2830, 'Yimou Zhang');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `idReservation` int(15) NOT NULL AUTO_INCREMENT,
  `nomDuClient` varchar(255) NOT NULL,
  `nbClientReservation` int(10) NOT NULL,
  `numProjection` int(10) NOT NULL,
  PRIMARY KEY (`idReservation`),
  KEY `numProjection` (`numProjection`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`idReservation`, `nomDuClient`, `nbClientReservation`, `numProjection`) VALUES
(31, 'er.ty@lp.ne', 6, 5),
(32, 'er', 15, 5),
(33, 'er', 15, 5),
(34, 'er', 15, 5),
(35, 'er', 15, 5),
(36, 'er', 15, 5),
(37, 'er', 15, 5),
(38, 'er', 15, 5),
(39, 'er', 15, 5),
(40, 'er', 15, 5),
(41, 'er', 15, 5),
(42, 'er', 15, 5),
(43, 'er', 15, 5);

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
  `idSalle` int(1) NOT NULL AUTO_INCREMENT,
  `nomSalle` varchar(255) NOT NULL,
  `descriptionSalle` varchar(255) NOT NULL,
  `nbPlace` int(10) NOT NULL,
  PRIMARY KEY (`idSalle`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `salle`
--

INSERT INTO `salle` (`idSalle`, `nomSalle`, `descriptionSalle`, `nbPlace`) VALUES
(1, 'La Classique', 'Une salle classique', 155),
(2, 'La 3ème Dimension', 'Une salle 3D avec lunettes', 200),
(3, 'La Moderne', 'Une salle proposant une expérience immersive', 300);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `film_ibfk_1` FOREIGN KEY (`numGenre`) REFERENCES `genre` (`idGenre`),
  ADD CONSTRAINT `film_ibfk_2` FOREIGN KEY (`numRealisateur`) REFERENCES `realisateur` (`idRealisateur`);

--
-- Contraintes pour la table `projeter`
--
ALTER TABLE `projeter`
  ADD CONSTRAINT `projeter_ibfk_1` FOREIGN KEY (`numSalle`) REFERENCES `salle` (`idSalle`),
  ADD CONSTRAINT `projeter_ibfk_2` FOREIGN KEY (`numFilm`) REFERENCES `film` (`idFilm`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`numProjection`) REFERENCES `projeter` (`idProjection`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
