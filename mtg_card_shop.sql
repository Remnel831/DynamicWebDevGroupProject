-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2024 at 08:43 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

DROP DATABASE IF EXISTS mtg_card_shop;
CREATE DATABASE mtg_card_shop;
USE mtg_card_shop;

GRANT SELECT, INSERT, DELETE, UPDATE
ON mtg_card_shop.*
TO 'mtg_user@localhost'
IDENTIFIED BY 'mtgpassword';

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mtg_card_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `mtg_cards`
--

CREATE TABLE `mtg_cards` (
  `card_id` int(11) NOT NULL,
  `card_name` varchar(40) NOT NULL,
  `card_type` varchar(20) NOT NULL,
  `card_subtype` varchar(20) DEFAULT NULL,
  `card_set_code` varchar(3) DEFAULT NULL,
  `card_color` varchar(30) DEFAULT NULL,
  `card_cost` varchar(20) DEFAULT NULL,
  `card_attack` int(11) DEFAULT NULL,
  `card_defense` int(11) DEFAULT NULL,
  `card_description` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mtg_cards`
--

INSERT INTO `mtg_cards` (`card_id`, `card_name`, `card_type`, `card_subtype`, `card_set_code`, `card_color`, `card_cost`, `card_attack`, `card_defense`, `card_description`) VALUES
(1, 'Angel of Serenity', 'Creature', 'Angel', 'RTR', 'White', '4 Gray, 3 White', 5, 6, 'Flying When Angel of Serenity enters the battlefield, you may exile up to three other target creatures from the battlefield and/or creature cards from graveyards. When Angel of Serenity leaves the battlefield, return the exiled cards to their owners’ hands.'),
(2, 'Armory Guard', 'Creature', 'Giant Soldier', 'RTR', 'White', '3 Gray, 1 White', 2, 5, 'Armory Guard has vigilance as long as you control a Gate. The Dimir agents watched from the shadows. “Eight hours, and I’ve yet to see him blink,” Nefara hissed. “I suggest we find another way in.”'),
(3, 'Arrest', 'Enchantment', 'Aura', 'RTR', 'White', '2 Gray, 1 White', NULL, NULL, 'Enchant creature Enchanted creature can’t attack or block, and its activated abilities can’t be activated. “We will prove your guilt. We don’t arrest the innocent, you know.”—Arrester Lavinia, Tenth Precinct'),
(4, 'Avenging Arrow', 'Instant', NULL, 'RTR', 'White', '2 Gray, 1 White', NULL, NULL, 'Destroy target creature that dealt damage this turn. “Forgive the theft. Punish the deception.” —Alcarus, Selesnya archer'),
(5, 'Azorius Arrester', 'Creature', 'Human Soldier', 'RTR', 'White', '1 Gray, 1 White', 2, 1, 'When Azorius Arrester enters the battlefield, detain target creature an opponent controls. (Until your next turn, that creature can’t attack or block and its activated abilities can’t be activated.) “You have the right to remain silent. Mostly because I tire of your excuses.”'),
(6, 'Azorius Justiciar', 'Creature', 'Human Wizard', 'RTR', 'White', '2 Gray, 2 White', 2, 2, 'When Azorius Justiciar enters the battlefield, detain up to two target creatures your opponents control. (Until your next turn, those creatures can’t attack or block and their activated abilities can’t be activated.) “Your potential to commit a crime warrants further investigation.”'),
(7, 'Bazaar Krovod', 'Creature', 'Beast', 'RTR', 'White', '4 Gray, 1 White', 2, 5, 'Whenever Bazaar Krovod attacks, another target attacking creature gets +0/+2 until end of turn. Untap that creature. The Hauler’s Collective wields great influence over the Ravnican merchant class. Without it, little moves in the city.'),
(8, 'Concordia Pegasus', 'Creature', 'Pegasus', 'RTR', 'White', '1 Gray, 1 White', 1, 3, ''),
(9, 'Ethereal Armor', 'Enchantment', 'Aura', 'RTR', 'White', '1 White', NULL, NULL, ''),
(10, 'Eyes in the Skies', 'Instant', NULL, 'RTR', 'White', '3 Gray, 1 White', NULL, NULL, ''),
(11, 'Fencing Ace', 'Creature', 'Human Soldier', 'RTR', 'White', '1 Gray, 1 White', 1, 1, ''),
(12, 'Keening Apparition', 'Creature', 'Spirit', 'RTR', 'White', '1 Gray, 1 White', 2, 2, ''),
(13, 'Knightly Valor', 'Enchantment', 'Aura', 'RTR', 'White', '4 Gray, 1 White', NULL, NULL, ''),
(14, 'Martial Law', 'Enchantment', NULL, 'RTR', 'White', '2 Gray, 2 White', NULL, NULL, ''),
(15, 'Palisade Giant', 'Creature', 'Giant Soldier', 'RTR', 'White', '4 Gray, 2 White', 2, 7, ''),
(16, 'Phantom General', 'Creature', 'Spirit Soldier', 'RTR', 'White', '3 Gray, 1 White', 2, 3, ''),
(17, 'Precinct Captain', 'Creature', 'Human Soldier', 'RTR', 'White', '2 White', 2, 2, ''),
(18, 'Rest in Peace', 'Enchantment', NULL, 'RTR', 'White', '1 Gray, 1 White', NULL, NULL, ''),
(19, 'Rootborn Defenses', 'Instant', NULL, 'RTR', 'White', '2 Gray, 1 White', NULL, NULL, ''),
(20, 'Security Blockade', 'Enchantment', 'Aura', 'RTR', 'White', '2 Gray, 1 White', NULL, NULL, ''),
(21, 'Selesnya Sentry', 'Creature', 'Elephant Soldier', 'RTR', 'White', '2 Gray, 1 White', 3, 2, ''),
(22, 'Seller of Songbirds', 'Creature', 'Human', 'RTR', 'White', '2 Gray, 1 White', 1, 2, ''),
(23, 'Soul Tithe', 'Enchantment', 'Aura', 'RTR', 'White', '1 Gray, 1 White', NULL, NULL, ''),
(24, 'Sphere of Safety', 'Enchantment', NULL, 'RTR', 'White', '4 Gray, 1 White', NULL, NULL, ''),
(25, 'Sunspire Griffin', 'Creature', 'Griffin', 'RTR', 'White', '1 Gray, 2 White', 2, 3, ''),
(26, 'Swift Justice', 'Instant', NULL, 'RTR', 'White', '1 White', NULL, NULL, ''),
(27, 'Trained Caracal', 'Creature', 'Cat', 'RTR', 'White', '1 White', 1, 1, ''),
(28, 'Trostani\'s Judgement', 'Instant', NULL, 'RTR', 'White', '5 Gray, 1 White', NULL, NULL, ''),
(29, 'Aquus Steed', 'Creature', 'Beast', 'RTR', 'Blue', '3 Gray, 1 Blue', 1, 3, ''),
(30, 'Blustersquall', 'Instant', NULL, 'RTR', 'Blue', '1 Blue', NULL, NULL, ''),
(31, 'Cancel', 'Instant', NULL, 'RTR', 'Blue', '1 Gray, 2 Blue', NULL, NULL, ''),
(32, 'Chronic Flooding', 'Enchantment', 'Aura', 'RTR', 'Blue', '1 Gray, 1 Blue', NULL, NULL, ''),
(33, 'Conjured Currency', 'Enchantment', NULL, 'RTR', 'Blue', '5 Gray, 1 Blue', NULL, NULL, ''),
(34, 'Crosstown Courier', 'Creature', 'Vedalken', 'RTR', 'Blue', '1 Gray, 1 Blue', 2, 1, ''),
(35, 'Cyclonic Rift', 'Instant', NULL, 'RTR', 'Blue', '1 Gray, 1 Blue', NULL, NULL, ''),
(36, 'Dispel', 'Instant', NULL, 'RTR', 'Blue', '1 Blue', NULL, NULL, ''),
(37, 'Doorkeeper', 'Creature', 'Homunculus', 'RTR', 'Blue', '1 Gray, 1 Blue', 0, 4, ''),
(38, 'Downsize', 'Instant', NULL, 'RTR', 'Blue', '1 Blue', NULL, NULL, ''),
(39, 'Faerie Imposter', 'Creature', 'Faerie Rogue', 'RTR', 'Blue', '1 Blue', 2, 1, ''),
(40, 'Hover Barrier', 'Creature', 'Illusion Wall', 'RTR', 'Blue', '2 Gray, 1 Blue', 0, 6, ''),
(41, 'Inaction Injunction', 'Sorcery', NULL, 'RTR', 'Blue', '1 Gray, 1 Blue', NULL, NULL, ''),
(42, 'Inspiration', 'Instant', NULL, 'RTR', 'Blue', '3 Gray, 1 Blue', NULL, NULL, ''),
(43, 'Isperia\'s Skywatch', 'Creature', 'Vedalken Knight', 'RTR', 'Blue', '5 Gray, 1 Blue', 3, 3, ''),
(44, 'Jace, Architect of Thought', 'Planeswalker', 'Jace', 'RTR', 'Blue', '2 Gray, 2 Blue', NULL, NULL, ''),
(45, 'Mizzium Skin', 'Instant', NULL, 'RTR', 'Blue', '1 Blue', NULL, NULL, ''),
(46, 'Paralyzing Grasp', 'Enchantment', 'Aura', 'RTR', 'Blue', '2 Gray, 1 Blue', NULL, NULL, ''),
(47, 'Psychic Spiral', 'Instant', NULL, 'RTR', 'Blue', '4 Gray, 1 Blue', NULL, NULL, ''),
(48, 'Runewing', 'Creature', 'Bird', 'RTR', 'Blue', '3 Gray, 1 Blue', 2, 2, ''),
(49, 'Search the City', 'Enchantment', NULL, 'RTR', 'Blue', '4 Gray, 1 Blue', NULL, NULL, ''),
(50, 'Skyline Predator', 'Creature', 'Drake', 'RTR', 'Blue', '4 Gray, 2 Blue', 3, 4, ''),
(51, 'Soulsworn Spirit', 'Creature', 'Spirit', 'RTR', 'Blue', '3 Gray, 1 Blue', 2, 1, ''),
(52, 'Sphinx of the Chimes', 'Creature', 'Sphinx', 'RTR', 'Blue', '', 5, 6, ''),
(53, 'Stealer of Secrets', 'Creature', 'Human Rogue', 'RTR', 'Blue', '2 Gray, 1 Blue', 2, 2, ''),
(54, 'Syncopate', 'Instant', NULL, 'RTR', 'Blue', 'X Gray, 1 Blue', NULL, NULL, ''),
(55, 'Tower Drake', 'Creature', 'Drake', 'RTR', 'Blue', '2 Gray, 1 Blue', 2, 1, ''),
(56, 'Voidwielder', 'Creature', 'Human Wizard', 'RTR', 'Blue', '4 Gray, 1 Blue', 1, 4, ''),
(57, 'Assassin\'s Strike', 'Sorcery', NULL, 'RTR', 'Black', '4 Gray, 2 Black', NULL, NULL, ''),
(58, 'Catacomb Slug', 'Creature', 'Slug', 'RTR', 'Black', '4 Gray, 1 Black', 2, 6, ''),
(59, 'Cremate', 'Instant', NULL, 'RTR', 'Black', '1 Black', NULL, NULL, ''),
(60, 'Daggerdrome Imp', 'Creature', 'Imp', 'RTR', 'Black', '1 Gray, 1 Black', 1, 1, ''),
(61, 'Dark Revenant', 'Creature', 'Spirit', 'RTR', 'Black', '3 Gray, 1 Black', 2, 2, ''),
(62, 'Dead Reveler', 'Creature', 'Zombie', 'RTR', 'Black', '2 Gray, 1 Black', 2, 3, ''),
(63, 'Desecration Demon', 'Creature', 'Demon', 'RTR', 'Black', '2 Gray, 2 Black', 6, 6, ''),
(64, 'Destroy the Evidence', 'Sorcery', NULL, 'RTR', 'Black', '4 Gray, 1 Black', NULL, NULL, ''),
(65, 'Deviant Glee', 'Enchantment', 'Aura', 'RTR', 'Black', '1 Black', NULL, NULL, ''),
(66, 'Drainpipe Vermin', 'Creature', 'Rat', 'RTR', 'Black', '1 Black', 1, 1, ''),
(67, 'Grave Betrayal', 'Enchantment', NULL, 'RTR', 'Black', '5 Gray, 2 Black', NULL, NULL, ''),
(68, 'Grim Roustabout', 'Creature', 'Skeleton Warrior', 'RTR', 'Black', '1 Gray, 1 Black', 1, 1, ''),
(69, 'Launch Party', 'Instant', NULL, 'RTR', 'Black', '3 Gray, 1 Black', NULL, NULL, ''),
(70, 'Mind Rot', 'Sorcery', NULL, 'RTR', 'Black', '2 Gray, 1 Black', NULL, NULL, ''),
(71, 'Necropolis Regent', 'Creature', 'Vampire', 'RTR', 'Black', '3 Gray, 3 Black', 6, 5, ''),
(72, 'Ogre Jailbreaker', 'Creature', 'Ogre Rogue', 'RTR', 'Black', '3 Gray, 1 Black', 4, 4, ''),
(73, 'Pack Rat', 'Creature', 'Rat', 'RTR', 'Black', '1 Gray, 1 Black', NULL, NULL, ''),
(74, 'Perilous Shadow', 'Creature', 'Insect Shade', 'RTR', 'Black', '2 Gray, 2 Black', 0, 4, ''),
(75, 'Sewer Shambler', 'Creature', 'Zombie', 'RTR', 'Black', '2 Gray, 1 Black', 2, 1, ''),
(76, 'Shrieking Affliction', 'Enchantment', NULL, 'RTR', 'Black', '1 Black', NULL, NULL, ''),
(77, 'Slum Reaper', 'Creature', 'Horror', 'RTR', 'Black', '3 Gray, 1 Black', 4, 2, ''),
(78, 'Stab Wound', 'Enchantment', 'Aura', 'RTR', 'Black', '2 Gray, 1 Black', NULL, NULL, ''),
(79, 'Tavern Swindler', 'Creature', 'Human Rogue', 'RTR', 'Black', '1 Gray, 1 Black', 2, 2, ''),
(80, 'Terrus Wurm', 'Creature', 'Zombie Wurm', 'RTR', 'Black', '6 Gray, 1 Black', 5, 5, ''),
(81, 'Thrill-Kill Assassin', 'Creature', 'Human Assassin', 'RTR', 'Black', '1 Gray, 1 Black', 1, 2, ''),
(82, 'Ultimate Price', 'Instant', NULL, 'RTR', 'Black', '1 Gray, 1 Black', NULL, NULL, ''),
(83, 'Crippling Blight', 'Enchantment', 'Aura', 'RTR', 'Black', '1 Black', NULL, NULL, ''),
(84, 'Underworld Connections', 'Enchantment', 'Aura', 'RTR', 'Black', '1 Gray, 2 Black', NULL, NULL, ''),
(85, 'Zanikev Locust', 'Creature', 'Insect', 'RTR', 'Black', '5 Gray, 1 Black', 3, 3, ''),
(86, 'Annihilating Fire', 'Instant', NULL, 'RTR', 'Red', '1 Gray, 2 Red', NULL, NULL, ''),
(87, 'Ash Zealot', 'Creature', 'Human Warrior', 'RTR', 'Red', '2 Red', 2, 2, ''),
(88, 'Batterhorn', 'Creature', 'Beast', 'RTR', 'Red', '4 Gray, 1 Red', 4, 3, ''),
(89, 'Bellows Lizard', 'Creature', 'Lizard', 'RTR', 'Red', '1 Red', 1, 1, ''),
(90, 'Bloodfray Giant', 'Creature', 'Giant', 'RTR', 'Red', '2 Gray, 1 Red', 4, 3, ''),
(91, 'Chaos Imps', 'Creature', 'Imp', 'RTR', 'Red', '4 Gray, 2 Red', 6, 5, ''),
(92, 'Cobblebrute', 'Creature', 'Elemental', 'RTR', 'Red', '3 Gray, 1 Red', 5, 2, ''),
(93, 'Dynacharge', 'Instant', NULL, 'RTR', 'Red', '1 Red', NULL, NULL, ''),
(94, 'Electrickery', 'Instant', NULL, 'RTR', 'Red', '1 Red', NULL, NULL, ''),
(95, 'Explosive Impact', 'Instant', NULL, 'RTR', 'Red', '5 Gray, 1 Red', NULL, NULL, ''),
(96, 'Goblin Rally', 'Sorcery', NULL, 'RTR', 'Red', '3 Gray, 2 Red', NULL, NULL, ''),
(97, 'Gore-House Chainwalker', 'Creature', 'Human Warrior', 'RTR', 'Red', '1 Gray, 1 Red', 2, 1, ''),
(98, 'Guild Feud', 'Enchantment', NULL, 'RTR', 'Red', '5 Gray, 1 Red', NULL, NULL, ''),
(99, 'Guttersnipe', 'Creature', 'Goblin Shaman', 'RTR', 'Red', '2 Gray, 1 Red', 2, 2, ''),
(100, 'Lobber Crew', 'Creature', 'Goblin Warrior', 'RTR', 'Red', '2 Gray, 1 Red', 0, 4, ''),
(101, 'Minotaur Aggressor', 'Creature', 'Minotaur Berserker', 'RTR', 'Red', '6 Gray, 1 Red', 6, 2, ''),
(102, 'Mizzium Mortars', 'Sorcery', NULL, 'RTR', 'Red', '1 Gray, 1 Red', NULL, NULL, ''),
(103, 'Pursuit of Flight', 'Enchantment', 'Aura', 'RTR', 'Red', '1 Gray, 1 Red', NULL, NULL, ''),
(104, 'Pyroconvergence', 'Enchantment', NULL, 'RTR', 'Red', '4 Gray, 1 Red', NULL, NULL, ''),
(105, 'Racecourse Fury', 'Enchantment', 'Aura', 'RTR', 'Red', '1 Red', NULL, NULL, ''),
(106, 'Splatter Thug', 'Creature', 'Human Warrior', 'RTR', 'Red', '2 Gray, 1 Red', 2, 2, ''),
(107, 'Street Spasm', 'Instant', NULL, 'RTR', 'Red', 'X Gray, 1 Red', NULL, NULL, ''),
(108, 'Survey the Wreckage', 'Sorcery', NULL, 'RTR', 'Red', '4 Gray, 1 Red', NULL, NULL, ''),
(109, 'Tenement Crasher', 'Creature', 'Beast', 'RTR', 'Red', '5 Gray, 1 Red', 5, 4, ''),
(110, 'Traitorous Instinct', 'Sorcery', NULL, 'RTR', 'Red', '3 Gray, 1 Red', NULL, NULL, ''),
(111, 'Utvara Hellkite', 'Creature', 'Dragon', 'RTR', 'Red', '6 Gray, 2 Red', 6, 6, ''),
(112, 'Vandalblast', 'Sorcery', NULL, 'RTR', 'Red', '1 Red', NULL, NULL, ''),
(113, 'Viashino Racketeer', 'Creature', 'Viashino Rogue', 'RTR', 'Red', '2 Gray, 1 Red', 2, 1, ''),
(114, 'Aerial Predation', 'Instant', NULL, 'RTR', 'Green', '2 Gray, 1 Green', NULL, NULL, ''),
(115, 'Archweaver', 'Creature', 'Spider', 'RTR', 'Green', '5 Gray, 2 Green', 5, 5, ''),
(116, 'Axebane Guardian', 'Creature', 'Human Druid', 'RTR', 'Green', '2 Gray, 1 Green', 0, 3, ''),
(117, 'Axebane Stag', 'Creature', 'Elk', 'RTR', 'Green', '6 Gray, 1 Green', 6, 7, ''),
(118, 'Brushstrider', 'Creature', 'Beast', 'RTR', 'Green', '1 Gray, 1 Green', 3, 1, ''),
(119, 'Centaur\'s Herald', 'Creature', 'Elf Scout', 'RTR', 'Green', '1 Green', 0, 1, ''),
(120, 'Chorus of Might', 'Instant', NULL, 'RTR', 'Green', '3 Gray, 1 Green', NULL, NULL, ''),
(121, 'Deadbridge Goliath', 'Creature', 'Insect', 'RTR', 'Green', '2 Gray, 2 Green', 5, 5, ''),
(122, 'Death\'s Presence', 'Enchantment', NULL, 'RTR', 'Green', '5 Gray, 1 Green', NULL, NULL, ''),
(123, 'Drudge Beetle', 'Creature', 'Insect', 'RTR', 'Green', '1 Gray, 1 Green', 2, 2, ''),
(124, 'Druid\'s Deliverance', 'Instant', NULL, 'RTR', 'Green', '1 Gray, 1 Green', NULL, NULL, ''),
(125, 'Gatecreeper Vine', 'Creature', 'Plant', 'RTR', 'Green', '1 Gray, 1 Green', 0, 2, ''),
(126, 'Giant Growth', 'Instant', NULL, 'RTR', 'Green', '1 Green', NULL, NULL, ''),
(127, 'Gobbling Ooze', 'Creature', 'Ooze', 'RTR', 'Green', '4 Gray, 1 Green', 3, 3, ''),
(128, 'Golgari Decoy', 'Creature', 'Elf Rogue', 'RTR', 'Green', '3 Gray, 1 Green', 2, 2, ''),
(129, 'Horncaller\'s Chant', 'Sorcery', NULL, 'RTR', 'Green', '7 Gray, 1 Green', NULL, NULL, ''),
(130, 'Korozda Monitor', 'Creature', 'Lizard', 'RTR', 'Green', '2 Gray, 2 Green', 3, 3, ''),
(131, 'Mana Bloom', 'Enchantment', NULL, 'RTR', 'Green', 'X Gray, 1 Green', NULL, NULL, ''),
(132, 'Oak Street Innkeeper', 'Creature', 'Elf', 'RTR', 'Green', '2 Gray, 1 Green', 1, 2, ''),
(133, 'Rubbleback Rhino', 'Creature', 'Rhino', 'RTR', 'Green', '4 Gray, 1 Green', 3, 4, ''),
(134, 'Savage Surge', 'Instant', NULL, 'RTR', 'Green', '1 Gray, 1 Green', NULL, NULL, ''),
(135, 'Seek the Horizon', 'Sorcery', NULL, 'RTR', 'Green', '3 Gray, 1 Green', NULL, NULL, ''),
(136, 'Slime Molding', 'Sorcery', NULL, 'RTR', 'Green', 'X Gray, 1 Green', NULL, NULL, ''),
(137, 'Stonefare Crocodile', 'Creature', 'Crocodile', 'RTR', 'Green', '2 Gray, 1 Green', 3, 2, ''),
(138, 'Towering Indrik', 'Creature', 'Beast', 'RTR', 'Green', '3 Gray, 1 Green', 2, 4, ''),
(139, 'Urban Burgeoning', 'Enchantment', 'Aura', 'RTR', 'Green', '1 Green', NULL, NULL, ''),
(140, 'Wild Beastmaster', 'Creature', 'Human Shaman', 'RTR', 'Green', '2 Gray, 1 Green', 1, 1, ''),
(141, 'Worldspine Wurm', 'Creature', 'Wurm', 'RTR', 'Green', '8 Gray, 3 Green', 15, 15, ''),
(142, 'Abrupt Decay', 'Instant', NULL, 'RTR', 'Black/Green', '1 Black, 1 Green', NULL, NULL, ''),
(143, 'Archon of the Triumvirate', 'Creature', 'Archon', 'RTR', 'White/Blue', '5 Gray, 1 White, 1 B', 4, 5, ''),
(144, 'Armada Wurm', 'Creature', 'Wurm', 'RTR', 'Green/White', '2 Gray, 2 Green, 2 W', 5, 5, ''),
(145, 'Auger Spree', 'Instant', NULL, 'RTR', 'Black/Red', '1 Gray, 1 Black, 1 R', NULL, NULL, ''),
(146, 'Azorius Charm', 'Instant', NULL, 'RTR', 'White/Blue', '1 White, 1 Blue', NULL, NULL, ''),
(147, 'Call of the Conclave', 'Sorcery', NULL, 'RTR', 'Green/White', '1 Green, 1 White', NULL, NULL, ''),
(148, 'Carnival Hellsteed', 'Creature', 'Nightmare Horse', 'RTR', 'Black/Red', '4 Gray, 1 Black, 1 R', 5, 4, ''),
(149, 'Centaur Healer', 'Creature', 'Centaur Cleric', 'RTR', 'Green/White', '1 Gray, 1 Green, 1 W', 3, 3, ''),
(150, 'Chemister\'s Trick', 'Instant', NULL, 'RTR', 'Blue/Red', '1 Blue, 1 Red', NULL, NULL, ''),
(151, 'Collective Blessing', 'Enchantment', NULL, 'RTR', 'Green/White', '3 Gray, 2 Green, 1 W', NULL, NULL, ''),
(152, 'Common Bond', 'Instant', NULL, 'RTR', 'Green/White', '1 Gray, 1 Green, 1 W', NULL, NULL, ''),
(153, 'Corpsejack Menace', 'Creature', 'Fungus', 'RTR', 'Black/Green', '2 Gray, 1 Black, 2 G', 4, 4, ''),
(154, 'Counterflux', 'Instant', NULL, 'RTR', 'Blue/Red', '2 Blue, 1 Red', NULL, NULL, ''),
(155, 'Coursers\' Accord', 'Sorcery', NULL, 'RTR', 'Green/White', '4 Gray, 1 Green, 1 W', NULL, NULL, ''),
(156, 'Detention Sphere', 'Enchantment', NULL, 'RTR', 'White/Blue', '1 Gray, 1 White, 1 B', NULL, NULL, ''),
(157, 'Dramatic Rescue', 'Instant', NULL, 'RTR', 'White/Blue', '1 White, 1 Blue', NULL, NULL, ''),
(158, 'Dreadbore', 'Sorcery', NULL, 'RTR', 'Black/Red', '1 Black, 1 Red', NULL, NULL, ''),
(159, 'Dreg Mangler', 'Creature', 'Plant Zombie', 'RTR', 'Black/Green', '1 Gray, 1 Black, 1 G', 3, 3, ''),
(160, 'Epic Experiment', 'Sorcery', NULL, 'RTR', 'Blue/Red', 'X Gray, 1 Blue, 1 Re', NULL, NULL, ''),
(161, 'Essence Backlash', 'Instant', NULL, 'RTR', 'Blue/Red', '2 Gray, 1 Blue, 1 Re', NULL, NULL, ''),
(162, 'Fall of the Gavel', 'Instant', NULL, 'RTR', 'White/Blue', '3 Gray, 1 White, 1 B', NULL, NULL, ''),
(163, 'Firemind\'s Foresight', 'Instant', NULL, 'RTR', 'Blue/Red', '5 Gray, 1 Blue, 1 Re', NULL, NULL, ''),
(164, 'Goblin Electromancer', 'Creature', 'Goblin Wizard', 'RTR', 'Blue/Red', '1 Blue, 1 Red', 2, 2, ''),
(165, 'Golgari Charm', 'Instant', NULL, 'RTR', 'Black/Green', '1 Black, 1 Green', NULL, NULL, ''),
(166, 'Grisly Salvage', 'Instant', NULL, 'RTR', 'Black/Green', '1 Black, 1 Green', NULL, NULL, ''),
(167, 'Havoc Festival', 'Enchantment', NULL, 'RTR', 'Black/Red', '4 Gray, 1 Black, 1 R', NULL, NULL, ''),
(168, 'Hellhole Flailer', 'Creature', 'Ogre Warrior', 'RTR', 'Black/Red', '1 Gray, 1 Black, 1 R', 3, 2, ''),
(169, 'Heroes\' Reunion', 'Instant', NULL, 'RTR', 'Green/White', '1 Green, 1 White', NULL, NULL, ''),
(170, 'Hussar Patrol', 'Creature', 'Human Knight', 'RTR', 'White/Blue', '2 Gray, 1 White, 1 B', 2, 4, ''),
(171, 'Hypersonic Dragon', 'Creature', 'Dragon', 'RTR', 'Blue/Red', '3 Gray, 1 Blue, 1 Re', 4, 4, ''),
(172, 'Isperia, Supreme Judge', 'Legendary Creature', 'Sphinx', 'RTR', 'White/Blue', '2 Gray, 2 White, 2 B', 6, 4, ''),
(173, 'Izzet Charm', 'Instant', NULL, 'RTR', 'Blue/Red', '1 Blue, 1 Red', NULL, NULL, ''),
(174, 'Izzet Staticaster', 'Creature', 'Human Wizard', 'RTR', 'Blue/Red', '1 Gray, 1 Blue, 1 Re', 0, 3, ''),
(175, 'Jarad, Golgari Lich Lord', 'Legendary Creature', 'Zombie Elf', 'RTR', 'Black/Green', '2 Black, 2 Green', 2, 2, ''),
(176, 'Jarad\'s Orders', 'Sorcery', NULL, 'RTR', 'Black/Green', '2 Gray, 1 Black, 1 G', NULL, NULL, ''),
(177, 'Korozda Guildmage', 'Creature', 'Elf Shaman', 'RTR', 'Black/Green', '1 Black, 1 Green', 2, 2, ''),
(178, 'Lotleth Troll', 'Creature', 'Zombie Troll', 'RTR', 'Black/Green', '1 Black, 1 Green', 2, 1, ''),
(179, 'Loxodon Smiter', 'Creature', 'Elephant Soldier', 'RTR', 'Green/White', '1 Gray, 1 Green, 1 W', 4, 4, ''),
(180, 'Lyev Skyknight', 'Creature', 'Human Knight', 'RTR', 'White/Blue', '1 Gray, 1 White, 1 B', 3, 1, ''),
(181, 'Mercurial Chemister', 'Creature', 'Human Wizard', 'RTR', 'Blue/Red', '3 Gray, 1 Blue, 1 Re', 2, 3, ''),
(182, 'New Prahv Guildmage', 'Creature', 'Human Wizard', 'RTR', 'White/Blue', '1 White, 1 Blue', 2, 2, ''),
(183, 'Nivix Guildmage', 'Creature', 'Human Wizard', 'RTR', 'Blue/Red', '1 Blue, 1 Red', 2, 2, ''),
(184, 'Niv-Mizzet, Dracogenius', 'Legendary Creature', 'Dragon Wizard', 'RTR', 'Blue/Red', '2 Gray, 2 Blue, 2 Re', 5, 5, ''),
(185, 'Rakdos Charm', 'Instant', NULL, 'RTR', 'Black/Red', '1 Black, 1 Red', NULL, NULL, ''),
(186, 'Rakdos Ragemutt', 'Creature', 'Elemental Hound', 'RTR', 'Black/Red', '3 Gray, 1 Black, 1 R', 3, 3, ''),
(187, 'Rakdos Ringleader', 'Creature', 'Skeleton Warrior', 'RTR', 'Black/Red', '4 Gray, 1 Black, 1 R', 3, 1, ''),
(188, 'Rakdos, Lord of Riots', 'Legendary Creature', 'Demon', 'RTR', 'Black/Red', 'Two Black, Two Red', 6, 6, 'You can’t cast this spell unless an opponent lost life this turn. Flying, trample Creature spells you cast cost {1} less to cast for each 1 life your opponents have lost this turn.'),
(189, 'Rakdos\'s Return', 'Sorcery', NULL, 'RTR', 'Black/Red', 'X Gray, 1 Black, 1 R', NULL, NULL, ''),
(190, 'Righteous Authority', 'Enchantment', 'Aura', 'RTR', 'White/Blue', '3 Gray, 1 White, 1 B', NULL, NULL, ''),
(191, 'Risen Sanctuary', 'Creature', 'Elemental', 'RTR', 'Green/White', '5 Gray, 1 Green, 1 W', 8, 8, ''),
(192, 'Rites of Reaping', 'Sorcery', NULL, 'RTR', 'Black/Green', '4 Gray, 1 Black, 1 G', NULL, NULL, ''),
(193, 'Rix Maadi Guildmage', 'Creature', 'Human Shaman', 'RTR', 'Black/Red', '1 Black, 1 Red', 2, 2, ''),
(194, 'Search Warrant', 'Sorcery', NULL, 'RTR', 'White/Blue', '1 White, 1 Blue', NULL, NULL, ''),
(195, 'Selesnya Charm', 'Instant', NULL, 'RTR', 'Green/White', '1 Green, 1 White', NULL, NULL, ''),
(196, 'Skull Rend', 'Sorcery', NULL, 'RTR', 'Black/Red', '3 Gray, 1 Black, 1 R', NULL, NULL, ''),
(197, 'Skymark Roc', 'Creature', 'Bird', 'RTR', 'White/Blue', '2 Gray, 1 White, 1 B', 3, 3, ''),
(198, 'Slaughter Games', 'Sorcery', NULL, 'RTR', 'Black/Red', '2 Gray, 1 Black, 1 R', NULL, NULL, ''),
(199, 'Sluiceway Scorpion', 'Creature', 'Scorpion', 'RTR', 'Black/Green', '2 Gray, 1 Black, 1 G', 2, 2, ''),
(200, 'Spawn of Rix Maadi', 'Creature', 'Horror', 'RTR', 'Black/Red', '3 Gray, 1 Black, 1 R', 5, 3, ''),
(201, 'Sphinx\'s Revelation', 'Instant', NULL, 'RTR', 'White/Blue', 'X Gray, 1 White, 2 B', NULL, NULL, ''),
(202, 'Supreme Verdict', 'Sorcery', NULL, 'RTR', 'White/Blue', '1 Gray, 2 White, 1 B', NULL, NULL, ''),
(203, 'Teleportal', 'Sorcery', NULL, 'RTR', 'Blue/Red', '1 Blue, 1 Red', NULL, NULL, ''),
(204, 'Thoughtflare', 'Instant', NULL, 'RTR', 'Blue/Red', '3 Gray, 1 Blue, 1 Re', NULL, NULL, ''),
(205, 'Treasured Find', 'Sorcery', NULL, 'RTR', 'Black/Green', '1 Black, 1 Green', NULL, NULL, ''),
(206, 'Trestle Troll', 'Creature', 'Troll', 'RTR', 'Black/Green', '1 Gray, 1 Black, 1 G', 1, 4, ''),
(207, 'Trostani, Selesnya\'s Voice', 'Legendary Creature', 'Dryad', 'RTR', 'Green/White', '2 Green, 2 White', 2, 5, ''),
(208, 'Vitu-Ghazi Guildmage', 'Creature', 'Dryad Shaman', 'RTR', 'Green/White', '1 Green, 1 White', 2, 2, ''),
(209, 'Vraska the Unseen', 'Planeswalker', 'Vraska', 'RTR', 'Black/Green', '3 Gray, 1 Black, 1 G', NULL, NULL, ''),
(210, 'Wayfaring Temple', 'Creature', 'Elemental', 'RTR', 'Green/White', '1 Gray, 1 Green, 1 W', NULL, NULL, ''),
(211, 'Azor\'s Elocutors', 'Creature', 'Human Advisor', 'RTR', 'White/Blue', '3 Gray, 2 Blue/White', 3, 5, ''),
(212, 'Blistercoil Weird', 'Creature', 'Weird', 'RTR', 'Blue/Red', '1 Blue/Red', 1, 1, ''),
(213, 'Cryptborn Horror', 'Creature', 'Horror', 'RTR', 'Black/Red', '1 Gray, 2 Black/Red', 0, 0, ''),
(214, 'Deathrite Shaman', 'Creature', 'Elf Shaman', 'RTR', 'Black/Green', '1 Black/Green', 1, 2, ''),
(215, 'Dryad Militant', 'Creature', 'Dryad Soldier', 'RTR', 'Green/White', '1 Green/White', 2, 1, ''),
(216, 'Frostburn Weird', 'Creature', 'Weird', 'RTR', 'Blue/Red', '2 Blue/Red', 1, 4, ''),
(217, 'Golgari Longlegs', 'Creature', 'Insect', 'RTR', 'Black/Green', '3 Gray, 2 Black/Gree', 5, 4, ''),
(218, 'Growing Ranks', 'Enchantment', NULL, 'RTR', 'Green/White', '2 Gray, 2 White/Gree', NULL, NULL, ''),
(219, 'Judge\'s Familiar', 'Creature', 'Bird', 'RTR', 'White/Blue', '1 White/Blue', 1, 1, ''),
(220, 'Nivmagus Elemental', 'Creature', 'Elemental', 'RTR', 'Blue/Red', '1 Blue/Red', 1, 2, ''),
(221, 'Rakdos Cackler', 'Creature', 'Devil', 'RTR', 'Black/Red', '1 Black/Red', 1, 1, ''),
(222, 'Rakdos Shred-Freak', 'Creature', 'Human Berserker', 'RTR', 'Black/Red', '2 Black/Red', 2, 1, ''),
(223, 'Slitherhead', 'Creature', 'Plant Zombie', 'RTR', 'Black/Green', '1 Black/Green', 1, 1, ''),
(224, 'Sundering Growth', 'Instant', NULL, 'RTR', 'Green/White', '2 Green/White', NULL, NULL, ''),
(225, 'Vassal Soul', 'Creature', 'Spirit', 'RTR', 'White/Blue', '1 Gray, 2 White/Blue', 2, 2, ''),
(226, 'Azorius Keyrune', 'Artifact', NULL, 'RTR', NULL, '3 Gray', NULL, NULL, ''),
(227, 'Chromatic Lantern', 'Artifact', NULL, 'RTR', NULL, '3 Gray', NULL, NULL, ''),
(228, 'Civic Saber', 'Artifact', 'Equipment', 'RTR', NULL, '1 Gray', NULL, NULL, ''),
(229, 'Codex Shredder', 'Artifact', NULL, 'RTR', NULL, '1 Gray', NULL, NULL, ''),
(230, 'Golgari Keyrune', 'Artifact', NULL, 'RTR', NULL, '3 Gray', NULL, NULL, ''),
(231, 'Izzet Keyrune', 'Artifact', NULL, 'RTR', NULL, '3 Gray', NULL, NULL, ''),
(232, 'Pithing Needle', 'Artifact', NULL, 'RTR', NULL, '1 Gray', NULL, NULL, ''),
(233, 'Rakdos Keyrune', 'Artifact', NULL, 'RTR', NULL, '3 Gray', NULL, NULL, ''),
(234, 'Selesnya Keyrune', 'Artifact', NULL, 'RTR', NULL, '3 Gray', NULL, NULL, ''),
(235, 'Street Sweeper', 'Artifact Creature', 'Construct', 'RTR', NULL, '6 Gray', 4, 6, ''),
(236, 'Tablet of the Guilds', 'Artifact', NULL, 'RTR', NULL, '2 Gray', NULL, NULL, ''),
(237, 'Volatile Rig', 'Artifact Creature', 'Construct', 'RTR', NULL, '4 Gray', 4, 4, ''),
(238, 'Azorius Guildgate', 'Land', 'Gate', 'RTR', 'White/Blue', NULL, NULL, NULL, ''),
(239, 'Blood Crypt', 'Land', 'Swamp Mountain', 'RTR', 'Black/Red', NULL, NULL, NULL, ''),
(240, 'Golgari Guildgate', 'Land', 'Gate', 'RTR', 'Black/Green', NULL, NULL, NULL, ''),
(241, 'Grove of the Guardian', 'Land', NULL, 'RTR', 'Gray', NULL, NULL, NULL, ''),
(242, 'Hallowed Fountain', 'Land', 'Plains Island', 'RTR', 'White/Blue', NULL, NULL, NULL, ''),
(243, 'Izzet Guildgate', 'Land', 'Gate', 'RTR', 'Blue/Red', NULL, NULL, NULL, ''),
(244, 'Overgrown Tomb', 'Land', 'Swamp Forest', 'RTR', 'Black/Green', NULL, NULL, NULL, ''),
(245, 'Rakdos Guildgate', 'Land', 'Gate', 'RTR', 'Black/Red', NULL, NULL, NULL, ''),
(246, 'Rogue\'s Passage', 'Land', NULL, 'RTR', 'Gray', NULL, NULL, NULL, ''),
(247, 'Selesnya Guildgate', 'Land', 'Gate', 'RTR', 'Green/White', NULL, NULL, NULL, ''),
(248, 'Steam Vents', 'Land', 'Island Mountain', 'RTR', 'Blue/Red', NULL, NULL, NULL, ''),
(249, 'Temple Garden', 'Land', 'Forest Plains', 'RTR', 'Green/White', NULL, NULL, NULL, ''),
(250, 'Transguild Promenade', 'Land', NULL, 'RTR', 'Any', NULL, NULL, NULL, ''),
(251, 'Plains', 'Basic Land', 'Plains', 'RTR', 'White', NULL, NULL, NULL, NULL),
(252, 'Island', 'Basic Land', 'Island', 'RTR', 'Blue', NULL, NULL, NULL, NULL),
(253, 'Swamp', 'Basic Land', 'Swamp', 'RTR', 'Black', NULL, NULL, NULL, NULL),
(254, 'Mountain', 'Basic Land', 'Mountain', 'RTR', 'Red', NULL, NULL, NULL, NULL),
(255, 'Forest', 'Basic Land', 'Forest', 'RTR', 'Green', NULL, NULL, NULL, NULL),
(256, 'Cower in Fear', 'Instant', NULL, 'M13', 'Black', '1 Gray, 2 Black', NULL, NULL, ' Creatures your opponents control get -1/-1 until end of turn. You will fully understand fear when you discover it is the final thing you put your faith in. —Nicol Bolas'),
(257, 'Blood Reckoning', 'Enchantment', NULL, 'M13', 'Black', '3 Gray, 1 Black', NULL, NULL, 'Whenever a creature attacks you or a planeswalker you control, that creature\'s controller loses 1 life. There is no greater folly than standing against me. —Nicol Bolas'),
(258, 'Zombie Goliath', 'Creature', 'Zombie Giant', 'M13', 'Black', '4 Gray, 1 Black', 4, 3, 'Removing the encumbrance of useless brain tissue grants several advantages: a slight increase in mobility, a response of revulsion and horror from the enemy, and, in the case of large specimens, room for passengers. —Zul Ashur, lich lord'),
(259, 'Tormented Soul', 'Creature', 'Spirit', 'M13', 'Black', '1 Black', 1, 1, 'Tormented Soul can\'t block and can\'t be blocked. Those who raged most bitterly at the world in life are cursed to roam the nether realms in death.'),
(260, 'Ravenous Rats', 'Creature', 'Rat', 'M13', 'Black', '1 Gray, 1 Black', 1, 1, ' When Ravenous Rats enters the battlefield, target opponent discards a card. Devouring books is only the beginning. The librarian\'s next.'),
(261, 'Canyon Minotaur', 'Creature', 'Minotaur Warrior', 'M13', 'Red', '3 Gray, 1 Red', 3, 3, 'We\'ll scale these cliffs, traverse Brittle Bridge, and then fight our way down the volcanic slopes on the other side. Isn\'t the shortest route through the canyon? Yes. So shouldn\'t we— No.');

-- --------------------------------------------------------

--
-- Table structure for table `mtg_card_sets`
--

CREATE TABLE `mtg_card_sets` (
  `set_code` varchar(3) NOT NULL,
  `set_name` varchar(30) DEFAULT NULL,
  `set_release_date` date DEFAULT NULL,
  `set_total_common` int(11) DEFAULT NULL,
  `set_total_uncommon` int(11) DEFAULT NULL,
  `set_total_rare` int(11) DEFAULT NULL,
  `set_total_mythic` int(11) DEFAULT NULL,
  `set_total_land` int(11) DEFAULT NULL,
  `set_total_other` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mtg_card_sets`
--

INSERT INTO `mtg_card_sets` (`set_code`, `set_name`, `set_release_date`, `set_total_common`, `set_total_uncommon`, `set_total_rare`, `set_total_mythic`, `set_total_land`, `set_total_other`) VALUES
('M13', 'Magic 2013', '2012-07-13', 249, 101, 60, 53, 15, 20),
('RTR', 'Return to Ravnica', '2012-10-05', 274, 101, 80, 53, 15, 25);

-- --------------------------------------------------------

--
-- Table structure for table `mtg_card_type`
--

CREATE TABLE `mtg_card_type` (
  `type_name` varchar(20) NOT NULL,
  `type_description` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mtg_card_type`
--

INSERT INTO `mtg_card_type` (`type_name`, `type_description`) VALUES
('Artifact', 'Artifacts are permanents that represent magical items, animated constructs, pieces of equipment, or other objects and devices.'),
('Artifact Creature', 'Creatures made entirely of magical or mechanical materials.'),
('Basic Land', 'Basic Land cards generate mana based on their type to play other cards.'),
('Creature', 'Creature designations are given to certain cards based on the creature they represent.'),
('Enchantment', 'An Enchantment represents persistent magical effects, usually remaining in play indefinitely.'),
('Instant', 'Instances can be played at any time one has priority including during other player\'s turns and while another spell or ability is waiting to resolve.'),
('Land', 'Land cards generate mana based on their type to play other cards.'),
('Legendary Creature', 'A creature is a permanent.  You may only control one copy of a legendary creature at a time.'),
('Planeswalker', 'A planeswalker card represents a powerful being that is able to move from plane to plane.'),
('Sorcery', 'Sorceries take effect when their mana cost is paid and the spell resolves, and then are immediately put into its owner\'s graveyard.');

-- --------------------------------------------------------

--
-- Table structure for table `mtg_decks`
--

CREATE TABLE `mtg_decks` (
  `deck_id` int(11) NOT NULL,
  `deck_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mtg_decks`
--

INSERT INTO `mtg_decks` (`deck_id`, `deck_name`) VALUES
(1, 'My First Deck'),
(2, 'My Second Deck'),
(3, 'My Third Deck'),
(4, 'Rakdos Raid');

-- --------------------------------------------------------

--
-- Table structure for table `mtg_decks_cards`
--

CREATE TABLE `mtg_decks_cards` (
  `deck_id` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `card_count` int(11)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mtg_decks_cards`
--

INSERT INTO `mtg_decks_cards` (`deck_id`, `card_id`, `card_count`) VALUES
(1, 1, 1),
(1, 2, 1),
(1, 3, 1),
(1, 4, 1),
(1, 5, 1),
(1, 6, 1),
(1, 7, 1),
(1, 8, 1),
(1, 9, 1),
(1, 10, 1),
(1, 11, 1),
(1, 12, 1),
(1, 13, 1),
(1, 14, 1),
(1, 15, 1),
(1, 16, 1),
(1, 17, 1),
(1, 18, 1),
(1, 19, 1),
(1, 20, 1),
(2, 1, 1),
(2, 2, 1),
(2, 3, 1),
(2, 4, 1),
(2, 5, 1),
(2, 6, 1),
(2, 7, 1),
(2, 8, 1),
(2, 9, 1),
(2, 10, 1),
(2, 11, 1),
(2, 12, 1),
(2, 13, 1),
(2, 14, 1),
(3, 1, 1),
(3, 2, 1),
(3, 3, 1),
(3, 4, 1),
(3, 5, 1),
(3, 6, 1),
(3, 7, 1),
(3, 8, 1),
(3, 9, 1),
(3, 10, 1),
(3, 11, 1),
(3, 12, 1),
(3, 13, 1),
(3, 14, 1),
(3, 15, 1),
(3, 16, 1),
(3, 17, 1),
(3, 18, 1),
(3, 19, 1),
(3, 20, 1),
(4, 254, 12),
(4, 253, 12),
(4, 245, 1),
(4, 89, 1),
(4, 90, 1),
(4, 261, 2),
(4, 148, 1),
(4, 213, 1),
(4, 97, 2),
(4, 168, 1),
(4, 101, 1),
(4, 221, 2),
(4, 222, 2),
(4, 260, 1),
(4, 75, 1),
(4, 200, 1),
(4, 259, 3),
(4, 258, 2),
(4, 257, 1),
(4, 83, 2),
(4, 65, 1),
(4, 76, 1),
(4, 145, 1),
(4, 256, 1),
(4, 57, 1),
(4, 70, 1),
(4, 110, 1),
(4, 233, 2);



-- --------------------------------------------------------

--
-- Stand-in structure for view `mtg_deck_cards_view`
-- (See below for the actual view)
--
CREATE TABLE `mtg_deck_cards_view` (
`deck_id` int(11)
,`deck_name` varchar(100)
,`card_id` int(11)
,`card_name` varchar(40)
,`card_type` varchar(20)
,`card_subtype` varchar(20)
,`card_set_code` varchar(3)
,`card_color` varchar(30)
,`card_cost` varchar(20)
,`card_attack` int(11)
,`card_defense` int(11)
,`card_description` varchar(1000)
);

-- --------------------------------------------------------

--
-- Structure for view `mtg_deck_cards_view`
--
DROP TABLE IF EXISTS `mtg_deck_cards_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mtg_deck_cards_view`  AS SELECT `d`.`deck_id` AS `deck_id`, `d`.`deck_name` AS `deck_name`, `c`.`card_id` AS `card_id`, `c`.`card_name` AS `card_name`, `c`.`card_type` AS `card_type`, `c`.`card_subtype` AS `card_subtype`, `c`.`card_set_code` AS `card_set_code`, `c`.`card_color` AS `card_color`, `c`.`card_cost` AS `card_cost`, `c`.`card_attack` AS `card_attack`, `c`.`card_defense` AS `card_defense`, `c`.`card_description` AS `card_description` FROM ((`mtg_decks` `d` join `mtg_decks_cards` `dmc` on(`d`.`deck_id` = `dmc`.`deck_id`)) join `mtg_cards` `c` on(`dmc`.`card_id` = `c`.`card_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mtg_cards`
--
ALTER TABLE `mtg_cards`
  ADD PRIMARY KEY (`card_id`),
  ADD KEY `fk_card_set_code` (`card_set_code`),
  ADD KEY `fk_card_type` (`card_type`);

--
-- Indexes for table `mtg_card_sets`
--
ALTER TABLE `mtg_card_sets`
  ADD PRIMARY KEY (`set_code`);

--
-- Indexes for table `mtg_card_type`
--
ALTER TABLE `mtg_card_type`
  ADD PRIMARY KEY (`type_name`);

--
-- Indexes for table `mtg_decks`
--
ALTER TABLE `mtg_decks`
  ADD PRIMARY KEY (`deck_id`);

--
-- Indexes for table `mtg_decks_cards`
--
ALTER TABLE `mtg_decks_cards`
  ADD PRIMARY KEY (`deck_id`,`card_id`),
  ADD KEY `card_id` (`card_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mtg_cards`
--
ALTER TABLE `mtg_cards`
  MODIFY `card_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=262;

--
-- AUTO_INCREMENT for table `mtg_decks`
--
ALTER TABLE `mtg_decks`
  MODIFY `deck_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mtg_cards`
--
ALTER TABLE `mtg_cards`
  ADD CONSTRAINT `fk_card_set_code` FOREIGN KEY (`card_set_code`) REFERENCES `mtg_card_sets` (`set_code`),
  ADD CONSTRAINT `fk_card_type` FOREIGN KEY (`card_type`) REFERENCES `mtg_card_type` (`type_name`);

--
-- Constraints for table `mtg_decks_cards`
--
ALTER TABLE `mtg_decks_cards`
  ADD CONSTRAINT `mtg_decks_cards_ibfk_1` FOREIGN KEY (`deck_id`) REFERENCES `mtg_decks` (`deck_id`),
  ADD CONSTRAINT `mtg_decks_cards_ibfk_2` FOREIGN KEY (`card_id`) REFERENCES `mtg_cards` (`card_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
