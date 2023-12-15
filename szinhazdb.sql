-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Dec 15. 10:45
-- Kiszolgáló verziója: 10.4.24-MariaDB
-- PHP verzió: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `szinhazdb`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kuponok`
--

CREATE TABLE `kuponok` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `percentage` int(255) NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `kuponok`
--

INSERT INTO `kuponok` (`id`, `title`, `percentage`, `code`) VALUES
(1, 'Mágnás Miska', 10, 'MSMA-135713'),
(2, 'Rómeó és Júlia', 50, 'ROJA-752725'),
(3, 'Anna Karenina', 20, 'AAKA-602673'),
(4, 'János vitéz', 60, 'JSVT-237895'),
(5, 'A padlás', 30, 'AAPS-172841'),
(6, 'A dzsungel könyve', 25, 'DZSK-165617'),
(7, 'Shrek', 90, 'SKSK-293652');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `kuponok`
--
ALTER TABLE `kuponok`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `kuponok`
--
ALTER TABLE `kuponok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
