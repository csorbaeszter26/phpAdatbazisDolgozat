-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Ápr 17. 12:15
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `tagsag`
--
CREATE DATABASE IF NOT EXISTS `tagsag` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `tagsag`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalo`
--

DROP TABLE IF EXISTS `felhasznalo`;
CREATE TABLE IF NOT EXISTS `felhasznalo` (
  `felhAzon` int(11) NOT NULL AUTO_INCREMENT,
  `nev` varchar(20) NOT NULL,
  `jogosultsag` int(11) NOT NULL,
  `email` varchar(20) NOT NULL,
  PRIMARY KEY (`felhAzon`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `felhasznalo`
--

INSERT INTO `felhasznalo` (`felhAzon`, `nev`, `jogosultsag`, `email`) VALUES
(1, 'Kis József', 2, 'kisjozsef@gmail.com'),
(2, 'Nagy Márta', 3, 'nagymari3@gmail.com'),
(3, 'Kovács Antal', 4, 'kantal66@gmail.com');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `klub`
--

DROP TABLE IF EXISTS `klub`;
CREATE TABLE IF NOT EXISTS `klub` (
  `klubAzon` int(11) NOT NULL AUTO_INCREMENT,
  `nev` varchar(20) NOT NULL,
  `datum` date NOT NULL,
  `hely` varchar(20) NOT NULL,
  `maxMeret` varchar(20) NOT NULL,
  PRIMARY KEY (`klubAzon`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `klub`
--

INSERT INTO `klub` (`klubAzon`, `nev`, `datum`, `hely`, `maxMeret`) VALUES
(1, 'foci', '2024-04-18', 'tornaterem', '20'),
(2, 'rajz', '2024-04-19', 'kiselőadó', '15'),
(3, 'dráma', '2024-04-22', 'nagyelőadó', '15');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
  `felhAzon` int(11) NOT NULL AUTO_INCREMENT,
  `klubAzon` int(11) NOT NULL,
  `pocizio` int(11) NOT NULL,
  PRIMARY KEY (`felhAzon`,`klubAzon`),
  KEY `klubAzon` (`klubAzon`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `tag`
--

INSERT INTO `tag` (`felhAzon`, `klubAzon`, `pocizio`) VALUES
(1, 3, 1),
(2, 1, 3),
(3, 2, 2);

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `tag`
--
ALTER TABLE `tag`
  ADD CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`felhAzon`) REFERENCES `felhasznalo` (`felhAzon`),
  ADD CONSTRAINT `tag_ibfk_2` FOREIGN KEY (`klubAzon`) REFERENCES `klub` (`klubAzon`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
