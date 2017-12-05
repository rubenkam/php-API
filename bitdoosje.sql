-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Gegenereerd op: 04 dec 2017 om 00:49
-- Serverversie: 10.1.9-MariaDB
-- PHP-versie: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bitdoosje`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `afdelingen`
--

CREATE TABLE `afdelingen` (
  `id` int(10) UNSIGNED NOT NULL,
  `naam` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `afdelingen`
--

INSERT INTO `afdelingen` (`id`, `naam`) VALUES
(1, 'Verkoop & Administratief'),
(2, 'Design & Ontwikkeling');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `personeel`
--

CREATE TABLE `personeel` (
  `id` int(10) UNSIGNED NOT NULL,
  `voornamen` varchar(255) NOT NULL,
  `tussenvoegsels` varchar(30) DEFAULT NULL,
  `achternaam` varchar(255) NOT NULL,
  `geslacht` varchar(1) NOT NULL,
  `geboorte_datum` date NOT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `personeel`
--

INSERT INTO `personeel` (`id`, `voornamen`, `tussenvoegsels`, `achternaam`, `geslacht`, `geboorte_datum`, `email`) VALUES
(1, 'Truus', NULL, 'Molensteen', 'V', '1965-11-27', NULL),
(2, 'Joop', NULL, 'Kopstoot', 'M', '1990-02-08', NULL),
(3, 'Wilhelmus Frederikus Aloisius', 'van', 'Hot naar Her', 'M', '1950-03-27', NULL),
(4, 'Miep', 'von', 'Truusenstein', 'V', '1960-01-01', NULL),
(5, 'Johny', NULL, 'Kebab', 'M', '1980-04-01', NULL),
(6, 'Koos', NULL, 'Klaproos', 'M', '1995-12-12', NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `personeel_afdeling`
--

CREATE TABLE `personeel_afdeling` (
  `afdeling_id` int(10) UNSIGNED NOT NULL,
  `personeel_id` int(10) UNSIGNED NOT NULL,
  `rol_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `personeel_afdeling`
--

INSERT INTO `personeel_afdeling` (`afdeling_id`, `personeel_id`, `rol_id`) VALUES
(1, 1, 4),
(1, 4, 3),
(1, 5, 2),
(2, 2, 5),
(2, 3, 1),
(2, 6, 6);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `rollen`
--

CREATE TABLE `rollen` (
  `id` int(10) UNSIGNED NOT NULL,
  `functienaam` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `rollen`
--

INSERT INTO `rollen` (`id`, `functienaam`) VALUES
(1, 'Directeur'),
(2, 'Afdelingsmanager'),
(3, 'Verkoper'),
(4, 'Administratief medewerker'),
(5, 'Software Ontwikkelaar'),
(6, 'Designer');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `salarisschalen`
--

CREATE TABLE `salarisschalen` (
  `id` int(10) UNSIGNED NOT NULL,
  `naam` varchar(255) NOT NULL,
  `salaris` decimal(12,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `salarisschalen`
--

INSERT INTO `salarisschalen` (`id`, `naam`, `salaris`) VALUES
(1, 'Schaal 1', '1500.00'),
(2, 'Schaal 2', '1800.00'),
(3, 'Schaal 3', '2200.00'),
(4, 'Schaal 4', '3000.00');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `salarissen`
--

CREATE TABLE `salarissen` (
  `id` int(10) UNSIGNED NOT NULL,
  `personeel_id` int(10) UNSIGNED NOT NULL,
  `salarisschaal_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `salarissen`
--

INSERT INTO `salarissen` (`id`, `personeel_id`, `salarisschaal_id`) VALUES
(1, 1, 2),
(2, 2, 3),
(3, 3, 4),
(4, 4, 1),
(5, 5, 3),
(6, 6, 3);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `afdelingen`
--
ALTER TABLE `afdelingen`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `personeel`
--
ALTER TABLE `personeel`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `personeel_afdeling`
--
ALTER TABLE `personeel_afdeling`
  ADD PRIMARY KEY (`afdeling_id`,`personeel_id`);

--
-- Indexen voor tabel `rollen`
--
ALTER TABLE `rollen`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `salarisschalen`
--
ALTER TABLE `salarisschalen`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `salarissen`
--
ALTER TABLE `salarissen`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `afdelingen`
--
ALTER TABLE `afdelingen`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT voor een tabel `personeel`
--
ALTER TABLE `personeel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT voor een tabel `rollen`
--
ALTER TABLE `rollen`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT voor een tabel `salarisschalen`
--
ALTER TABLE `salarisschalen`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT voor een tabel `salarissen`
--
ALTER TABLE `salarissen`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
