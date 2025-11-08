-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Giu 18, 2023 alle 20:28
-- Versione del server: 10.4.28-MariaDB
-- Versione PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `theverifiersdb`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `blacklist`
--

CREATE TABLE `blacklist` (
  `URL` varchar(180) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `blacklist`
--

INSERT INTO `blacklist` (`URL`) VALUES
('ciccia.com'),
('HelloWorld.it');

-- --------------------------------------------------------

--
-- Struttura della tabella `credenzialiamministratori`
--

CREATE TABLE `credenzialiamministratori` (
  `ID` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `credenzialiamministratori`
--

INSERT INTO `credenzialiamministratori` (`ID`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Struttura della tabella `credenzialiutenti`
--

CREATE TABLE `credenzialiutenti` (
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(130) NOT NULL,
  `phone` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `credenzialiutenti`
--

INSERT INTO `credenzialiutenti` (`nome`, `cognome`, `email`, `password`, `phone`) VALUES
('Fabio', 'Papapicco', 'fabio@gmail.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '3207505770'),
('Davide', 'Poli', 'davide@gmail.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '3398053004'),
('Roberto', 'Selvaggi', 'roberto@gmail.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '3409832661'),
('Salvatore', 'Forte', 'salvatore@gmail.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '3893420619');

-- --------------------------------------------------------

--
-- Struttura della tabella `dominiverificati`
--

CREATE TABLE `dominiverificati` (
  `URL` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `dominiverificati`
--

INSERT INTO `dominiverificati` (`URL`) VALUES
('https://www.avvenire.it/'),
('https://www.corriere.it/'),
('https://www.corrieredellosport.it/'),
('https://www.gazzetta.it/'),
('https://www.ilfattoquotidiano.it/'),
('https://www.ilgazzettino.it/'),
('https://www.ilmessaggero.it/'),
('https://www.ilsole24ore.com/'),
('https://www.lanazione.it/'),
('https://www.lastampa.it/'),
('https://www.repubblica.it/');

-- --------------------------------------------------------

--
-- Struttura della tabella `form`
--

CREATE TABLE `form` (
  `ID` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `oggetto` varchar(30) NOT NULL,
  `messaggio` text NOT NULL,
  `risposta` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `form`
--

INSERT INTO `form` (`ID`, `nome`, `email`, `oggetto`, `messaggio`, `risposta`) VALUES
(10, 'Utente', 'Utente@gmail.com', 'Problema', 'Ho un problema nel verificare una notizia;', 'Contatta la nostra assistenza diretta, grazie per la segnalazione!'),
(11, 'Utente1', 'Utente1@gmail.com', 'Problema Software', 'Ho un problema con il software;', 'Contatta la nostra assistenza diretta, grazie per la segnalazione!'),
(12, 'Utente2', 'Utente2@gmail.come', 'Problema Registrazione', 'Non riesco a registrarmi al vostro sito;', 'Contatta la nostra assistenza diretta, grazie per la segnalazione!');

-- --------------------------------------------------------

--
-- Struttura della tabella `notizieaggiunte`
--

CREATE TABLE `notizieaggiunte` (
  `URL` varchar(180) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `notizieaggiunte`
--

INSERT INTO `notizieaggiunte` (`URL`) VALUES
('https://www.avvenire.it/agora/arte'),
('https://www.avvenire.it/attualita/pagine/l-odissea-degli-ultimi'),
('https://www.avvenire.it/mondo/pagine/l-impegno-del-fondo-del-g7-allarme-educazione-il-mondo-si-mobiliti'),
('https://www.avvenire.it/mondo/pagine/la-francia-scatena-la-corsa-all-uranio-ma-il-conto'),
('https://www.avvenire.it/mondo/pagine/sudan-due-mesi-dopo'),
('https://www.avvenire.it/papa/');

-- --------------------------------------------------------

--
-- Struttura della tabella `notiziesegnalate`
--

CREATE TABLE `notiziesegnalate` (
  `URL` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `notiziesegnalate`
--

INSERT INTO `notiziesegnalate` (`URL`) VALUES
('https://notiziepericolose.blogspot.com/'),
('https://secretnews.fr/disneyland-paris-deratiseur-abat-minnie-mouse/'),
('https://www.avvenire.it/attualita/pagine/sparisce-nel-fiume-per-un-video'),
('https://www.fonteverificata.it/2023/05/15/muoiono-per-un-malore-improvviso-a-22-anni-ciamp'),
('https://www.ilmessaggio.it/il-certificato-di-matrimonio-cose-e-a-cosa-serve/'),
('https://www.pianetablunews.it/2023/05/29/come-immagini-luomo-e-la-donna-perfetti-questi-so');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `blacklist`
--
ALTER TABLE `blacklist`
  ADD PRIMARY KEY (`URL`);

--
-- Indici per le tabelle `credenzialiamministratori`
--
ALTER TABLE `credenzialiamministratori`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `credenzialiutenti`
--
ALTER TABLE `credenzialiutenti`
  ADD PRIMARY KEY (`phone`);

--
-- Indici per le tabelle `dominiverificati`
--
ALTER TABLE `dominiverificati`
  ADD PRIMARY KEY (`URL`);

--
-- Indici per le tabelle `form`
--
ALTER TABLE `form`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `notizieaggiunte`
--
ALTER TABLE `notizieaggiunte`
  ADD PRIMARY KEY (`URL`);

--
-- Indici per le tabelle `notiziesegnalate`
--
ALTER TABLE `notiziesegnalate`
  ADD PRIMARY KEY (`URL`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `form`
--
ALTER TABLE `form`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
