-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 24, 2024 at 11:48 PM
-- Server version: 5.7.40
-- PHP Version: 8.0.26

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


--
-- Database: `mtg_card_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `mtg_cards`
--
DROP TABLE IF EXISTS mtg_tips;
CREATE TABLE IF NOT EXISTS mtg_tips
(
tip_id int NOT NULL AUTO_INCREMENT,
tip_message varchar(1000),
PRIMARY KEY (tip_id)
);

INSERT INTO mtg_tips
(tip_id, tip_message)
VALUES
(1, 'The card description describes the card.'),
(2, 'Download MTG Arena to get a feel for the game.'),
(3, 'Use the Wizards store and event locator to find people to play with.'),
(4, 'Once you know what cards you want buy them directly.  Booster packs are random and will cost more in the long run.'),
(5, 'Avoid low impact cards! They take up space in your hand that could be used by cards you need.'),
(6, 'Better to have more mana than you need instead of not enough.  Add extra lands to your deck!'),
(7, 'If you use a red deck put a few lightning bolts in there 1 {R} for 3 damage is a pretty good deal'),
(8, 'Attack and Block a lot!  Creatures only have value when you use them.'),
(9, 'Never give up never surrender!  You haven''t lost until you lose.  With one more turn your opponent might make a mistake.'),
(10, 'A good sideboard is what separates a good player from a great player.'),
(11, 'Shower and put on deoderant before going to a tournament'),
(12, 'No sleep ahead, all the more time for Elden Ring'),
(13, 'Don''t give up, skeleton!'),
(14, 'MTG Arena has free promo codes! Just look them up to get a good start.'),
(15, 'Don''t hesitate to stop and ask questions.');


DROP TABLE IF EXISTS `mtg_cards`;
CREATE TABLE IF NOT EXISTS `mtg_cards` (
  `card_id` int(11) NOT NULL AUTO_INCREMENT,
  `card_name` varchar(40) NOT NULL,
  `card_type` varchar(20) NOT NULL,
  `card_subtype` varchar(20) DEFAULT NULL,
  `card_set_code` varchar(3) DEFAULT NULL,
  `card_color` varchar(30) DEFAULT NULL,
  `card_cost` varchar(20) DEFAULT NULL,
  `card_attack` int(11) DEFAULT NULL,
  `card_defense` int(11) DEFAULT NULL,
  `card_description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`card_id`),
  KEY `fk_card_set_code` (`card_set_code`),
  KEY `fk_card_type` (`card_type`)
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mtg_cards`
--

INSERT INTO `mtg_cards` (`card_id`, `card_name`, `card_type`, `card_subtype`, `card_set_code`, `card_color`, `card_cost`, `card_attack`, `card_defense`, `card_description`) VALUES
(1, 'Angel of Serenity', 'Creature', 'Angel', 'RTR', 'White', '{4}{W}{W}{W}', 5, 6, 'Flying When Angel of Serenity enters the battlefield, you may exile up to three other target creatures from the battlefield and/or creature cards from graveyards. When Angel of Serenity leaves the battlefield, return the exiled cards to their owners'' hands.'),
(2, 'Armory Guard', 'Creature', 'Giant Soldier', 'RTR', 'White', '{3}{W}', 2, 5, 'Armory Guard has vigilance as long as you control a Gate. The Dimir agents watched from the shadows. "Eight hours, and I''ve yet to see him blink," Nefara hissed. "I suggest we find another way in."'),
(3, 'Arrest', 'Enchantment', 'Aura', 'RTR', 'White', '{2}{W}', NULL, NULL, 'Enchant creature Enchanted creature can''t attack or block, and its activated abilities can''t be activated. "We will prove your guilt. We don''t arrest the innocent, you know."-Arrester Lavinia, Tenth Precinct'),
(4, 'Avenging Arrow', 'Instant', NULL, 'RTR', 'White', '{2}{W}', NULL, NULL, 'Destroy target creature that dealt damage this turn. "Forgive the theft. Punish the deception." -Alcarus, Selesnya archer'),
(5, 'Azorius Arrester', 'Creature', 'Human Soldier', 'RTR', 'White', '{1}{W}', 2, 1, 'When Azorius Arrester enters the battlefield, detain target creature an opponent controls. (Until your next turn, that creature can''t attack or block and its activated abilities can''t be activated.) "You have the right to remain silent. Mostly because I tire of your excuses."'),
(6, 'Azorius Justiciar', 'Creature', 'Human Wizard', 'RTR', 'White', '{2}{W}{W}', 2, 2, 'When Azorius Justiciar enters the battlefield, detain up to two target creatures your opponents control. (Until your next turn, those creatures can''t attack or block and their activated abilities can''t be activated.) "Your potential to commit a crime warrants further investigation."'),
(7, 'Bazaar Krovod', 'Creature', 'Beast', 'RTR', 'White', '{4]{W}', 2, 5, 'Whenever Bazaar Krovod attacks, another target attacking creature gets +0/+2 until end of turn. Untap that creature. The Hauler''s Collective wields great influence over the Ravnican merchant class. Without it, little moves in the city.'),
(8, 'Concordia Pegasus', 'Creature', 'Pegasus', 'RTR', 'White', '{1}{W}', 1, 3, '  Flying  "A kick from its hooves is like a bolt of lightning. I''d know. I''ve been hit by both." -Rencz, Izzet chemister''s aide'),
(9, 'Ethereal Armor', 'Enchantment', 'Aura', 'RTR', 'White', '{W}', NULL, NULL, '  Enchant creature  Enchanted creature gets +1/+1 for each enchantment you control and has first strike.  Metal is scarce, smiths are pricey, and plate mail is heavy.'),
(10, 'Eyes in the Skies', 'Instant', NULL, 'RTR', 'White', '{3}{W}', NULL, NULL, '  Create a 1/1 white Bird creature token with flying, then populate. (Create a token that''s a copy of a creature token you control.)  "What root and branch cannot reach, our winged friends will attend to." -Zunak, Selesnya strategist'),
(11, 'Fencing Ace', 'Creature', 'Human Soldier', 'RTR', 'White', '{1}{W}', 1, 1, '  Double strike  His prowess gives the guildless hope that they can hold out against tyranny.'),
(12, 'Keening Apparition', 'Creature', 'Spirit', 'RTR', 'White', '{1}{W}', 2, 2, '  Sacrifice Keening Apparition: Destroy target enchantment.  Some souls are too damaged to be of use to the Orzhov.'),
(13, 'Knightly Valor', 'Enchantment', 'Aura', 'RTR', 'White', '{4}{W}', NULL, NULL, '  Enchant creature  When Knightly Valor enters the battlefield, create a 2/2 white Knight creature token with vigilance. (Attacking doesn''t cause it to tap.)  Enchanted creature gets +2/+2 and has vigilance.'),
(14, 'Martial Law', 'Enchantment', NULL, 'RTR', 'White', '{2}{W}{W}', NULL, NULL, '  At the beginning of your upkeep, detain target creature an opponent controls. (Until your next turn, that creature can''t attack or block and its activated abilities can''t be activated.)  "The good of society matters much more than the inconvenience of a few." -Agmand Sarv, Azorius hussar'),
(15, 'Palisade Giant', 'Creature', 'Giant Soldier', 'RTR', 'White', '{4}{W}{W}', 2, 7, '  All damage that would be dealt to you and other permanents you control is dealt to Palisade Giant instead.  Refusing guild allegiances, she fights for those who can''t protect themselves.'),
(16, 'Phantom General', 'Creature', 'Spirit Soldier', 'RTR', 'White', '{3}{W}', 2, 3, '  Creature tokens you control get +1/+1.  After his death, the general was reunited with fallen soldiers from over thirty of his campaigns.'),
(17, 'Precinct Captain', 'Creature', 'Human Soldier', 'RTR', 'White', '{W}{W}', 2, 2, '  First strike  Whenever Precinct Captain deals combat damage to a player, create a 1/1 white Soldier creature token.  "In troubled times, we all need someone to watch our back."'),
(18, 'Rest in Peace', 'Enchantment', NULL, 'RTR', 'White', '{1}{W}', NULL, NULL, '  When Rest in Peace enters the battlefield, exile all graveyards.  If a card or token would be put into a graveyard from anywhere, exile it instead.  Some corpses the Golgari cannot claim. Some souls the Orzhov cannot shackle.'),
(19, 'Rootborn Defenses', 'Instant', NULL, 'RTR', 'White', '{2}{W}', NULL, NULL, 'Populate. Creatures you control gain indestructible until end of turn. (To populate, create a token that''s a copy of a creature token you control.)'),
(20, 'Security Blockade', 'Enchantment', 'Aura', 'RTR', 'White', '{2}{W}', NULL, NULL, 'Enchant land When Security Blockade enters the battlefield, create a 2/2 white Knight creature token with vigilance.\n\nEnchanted land has "{T}: Prevent the next 1 damage that would be dealt to you this turn."'),
(21, 'Selesnya Sentry', 'Creature', 'Elephant Soldier', 'RTR', 'White', '{2}{W}', 3, 2, '{5}{G}: Regenerate Selesnya Sentry.  Ravnicans still tell tales about the Battle of Sumala where four Selesnya sentries held off an entire clan of Gruul warriors.'),
(22, 'Seller of Songbirds', 'Creature', 'Human', 'RTR', 'White', '{2}{W}', 1, 2, '  When Seller of Songbirds enters the battlefield, create a 1/1 white Bird creature token with flying.  "Lady Wren is the one merchant in Keyhole Downs who isn''t running a scam." -Mirela, Azorius hussar'),
(23, 'Soul Tithe', 'Enchantment', 'Aura', 'RTR', 'White', '{1}{W}', NULL, NULL, '  Enchant nonland permanent  At the beginning of the upkeep of enchanted permanent''s controller, that player sacrifices it unless they pay X, where X is its mana value.'),
(24, 'Sphere of Safety', 'Enchantment', NULL, 'RTR', 'White', '{4}{W}', NULL, NULL, '  Creatures can''t attack you or planeswalkers you control unless their controller pays {X} for each of those creatures, where X is the number of enchantments you control.  The Rakdos believe that all are eager to join their revels, even when told otherwise.'),
(25, 'Sunspire Griffin', 'Creature', 'Griffin', 'RTR', 'White', '{1}{W}{W}', 2, 3, '  Flying  "For each griffin wounded by an arrow, there''s a corpse with a bow nearby." -Pel Javya, Wojek investigator'),
(26, 'Swift Justice', 'Instant', NULL, 'RTR', 'White', '{W}', NULL, NULL, '  Until end of turn, target creature gets +1/+0 and gains first strike and lifelink.  "Having conviction is more important than being righteous." -Aurelia'),
(27, 'Trained Caracal', 'Creature', 'Cat', 'RTR', 'White', '{W}', 1, 1, '  Lifelink (Damage dealt by this creature also causes you to gain that much life.)  Some Ravnicans consider carrying a sword to be beneath them, preferring instead a tooth-and-claw escort.'),
(28, 'Trostani\'s Judgement', 'Instant', NULL, 'RTR', 'White', '{5}{W}', NULL, NULL, '  Exile target creature, then populate. (Create a token that''s a copy of a creature token you control.)  "Some cannot be saved as they are, but all can serve the Worldsoul." -Trostani'),
(29, 'Aquus Steed', 'Creature', 'Beast', 'RTR', 'Blue', '{3}{U}', 1, 3, '{2}{U}{T}: Target creature gets -2/-0 until end of turn.  In water, it''s as graceful as a dolphin. On land, it darts and jerks so unpredictably that few can ride it for long.'),
(30, 'Blustersquall', 'Instant', NULL, 'RTR', 'Blue', '{U}', NULL, NULL, '  Tap target creature you don''t control.  Overload 3 Gray, 1 Blue (You may cast this spell for its overload cost. If you do, change "target" in its text to "each.")  Weather is more predictable than the Izzet.'),
(31, 'Cancel', 'Instant', NULL, 'RTR', 'Blue', '{1}{U}{U}', NULL, NULL, '  Counter target spell.  "It is forbidden. Asking why is irrelevant." -Sergiu, Opal Lake magistrate'),
(32, 'Chronic Flooding', 'Enchantment', 'Aura', 'RTR', 'Blue', '{1}{U}', NULL, NULL, '  Enchant land  Whenever enchanted land becomes tapped, its controller mills three cards.  With the Izzet occupied elsewhere, many of their public works fell into disrepair.'),
(33, 'Conjured Currency', 'Enchantment', NULL, 'RTR', 'Blue', '{5}{U}', NULL, NULL, '  At the beginning of your upkeep, you may exchange control of Conjured Currency and target permanent you neither own nor control.  A bargain in Keyhole Downs is always too good to be true.'),
(34, 'Crosstown Courier', 'Creature', 'Vedalken', 'RTR', 'Blue', '{1}{U}', 2, 1, '  Whenever Crosstown Courier deals combat damage to a player, that player mills that many cards.  Information travels quickly through Ravnica''s network of messengers and thought agents.'),
(35, 'Cyclonic Rift', 'Instant', NULL, 'RTR', 'Blue', '{1}{U}', NULL, NULL, '  Return target nonland permanent you don''t control to its owner''s hand.  Overload {6}{U} (You may cast this spell for its overload cost. If you do, change "target" in its text to "each.")  The Izzet specialize in unnatural disaster.'),
(36, 'Dispel', 'Instant', NULL, 'RTR', 'Blue', '{U}', NULL, NULL, '  Counter target instant spell.  "Civilization will subsume us unless we overwhelm it instead." -Speaker Zegana'),
(37, 'Doorkeeper', 'Creature', 'Homunculus', 'RTR', 'Blue', '{1}{U}', 0, 4, '  Defender {2}{U},{T}: Target player mills X cards, where X is the number of creatures you control with defender.  One piercing stare usually convinces thieves to go elsewhere.'),
(38, 'Downsize', 'Instant', NULL, 'RTR', 'Blue', '{U}', NULL, NULL, '  Target creature you don''t control gets -4/-0 until end of turn.  Overload {2}{U} (You may cast this spell for its overload cost. If you do, change "target" in its text to "each.")'),
(39, 'Faerie Imposter', 'Creature', 'Faerie Rogue', 'RTR', 'Blue', '{U}', 2, 1, '  Flying  When Faerie Impostor enters the battlefield, sacrifice it unless you return another creature you control to its owner''s hand.  Many Tin Street shops display a sign on the door: "No cloaks allowed."'),
(40, 'Hover Barrier', 'Creature', 'Illusion Wall', 'RTR', 'Blue', '{2}{U}', 0, 6, '  Defender, flying  As whispers and rumors increased, so did the demand for fail-safe barriers.'),
(41, 'Inaction Injunction', 'Sorcery', NULL, 'RTR', 'Blue', '{1}{U}', NULL, NULL, '  Detain target creature an opponent controls. (Until your next turn, that creature can''t attack or block and its activated abilities can''t be activated.)  Draw a card.  "To prevent action is to prevent transgression." -Azorius Arrester motto'),
(42, 'Inspiration', 'Instant', NULL, 'RTR', 'Blue', '{3}{U}', NULL, NULL, '  Target player draws two cards.  "Day 31: I finally succeeded in my time reversal experiment! \"Day 30: I might have a problem here." -Journal of the Prime Izmagnus'),
(43, 'Isperia\'s Skywatch', 'Creature', 'Vedalken Knight', 'RTR', 'Blue', '{5}{U}', 3, 3, '  Flying  When Isperia''s Skywatch enters the battlefield, detain target creature an opponent controls. (Until your next turn, that creature can''t attack or block and its activated abilities can''t be activated.)'),
(44, 'Jace, Architect of Thought', 'Planeswalker', 'Jace', 'RTR', 'Blue', '{2}{U}{U}', NULL, NULL, '  +1: Until your next turn, whenever a creature an opponent controls attacks, it gets -1/-0 until end of turn.  −2: Reveal the top three cards of your library. An opponent separates those cards into two piles. Put one pile into your hand and the other on the bottom of your library in any order.  −8: For each player, search that player''s library for a nonland card and exile it, then that player shuffles. You may cast those cards without paying their mana costs.'),
(45, 'Mizzium Skin', 'Instant', NULL, 'RTR', 'Blue', '{U}', NULL, NULL, 'Target creature you control gets +0/+1 and gains hexproof until end of turn.  Overload {1}{U} (You may cast this spell for its overload cost. If you do, change "target" in its text to "each.")'),
(46, 'Paralyzing Grasp', 'Enchantment', 'Aura', 'RTR', 'Blue', '{2}{U}', NULL, NULL, '  Enchant creature  Enchanted creature doesn''t untap during its controller''s untap step.  "Obviously, the Firemind''s mission is worth more than a few goblins." -Pelener, chamberlain of Niv-Mizzet'),
(47, 'Psychic Spiral', 'Instant', NULL, 'RTR', 'Blue', '{4}{U}', NULL, NULL, '  Shuffle all cards from your graveyard into your library. Target player mills that many cards.  An elocutor forces criminals to confess to the laws they merely intended to break.'),
(48, 'Runewing', 'Creature', 'Bird', 'RTR', 'Blue', '{3}{U}', 2, 2, '  Flying  When Runewing dies, draw a card.  In the hands of the open-minded, a runewing quill writes wisdom of its own.'),
(49, 'Search the City', 'Enchantment', NULL, 'RTR', 'Blue', '{4}{U}', NULL, NULL, '  When Search the City enters the battlefield, exile the top five cards of your library.  Whenever you play a card with the same name as one of the exiled cards, you may put one of those cards with that name into its owner''s hand. Then if there are no cards exiled with Search the City, sacrifice it. If you do, take an extra turn after this one.'),
(50, 'Skyline Predator', 'Creature', 'Drake', 'RTR', 'Blue', '{4}{U}', 3, 4, '  Flash (You may cast this spell any time you could cast an instant.)  Flying  "It will dodge your first arrow and flatten you before there''s a second." -Alcarus, Selesnya archer'),
(51, 'Soulsworn Spirit', 'Creature', 'Spirit', 'RTR', 'Blue', '{3}{U}', 2, 1, '  Soulsworn Spirit can''t be blocked.  When Soulsworn Spirit enters the battlefield, detain target creature an opponent controls. (Until your next turn, that creature can''t attack or block and its activated abilities can''t be activated.)'),
(52, 'Sphinx of the Chimes', 'Creature', 'Sphinx', 'RTR', 'Blue', '{4}{U}{U}', 5, 6, '  Flying  Discard two nonland cards with the same name: Draw four cards.  "I''ve dreamt of the future, Isperia. Danger is on the horizon. You must heed my warning."'),
(53, 'Stealer of Secrets', 'Creature', 'Human Rogue', 'RTR', 'Blue', '{2}{U}', 2, 2, '  Whenever Stealer of Secrets deals combat damage to a player, draw a card.  The Dimir would hire her, if only they knew where she lived. The Azorius would condemn her, if only they knew her name.'),
(54, 'Syncopate', 'Instant', NULL, 'RTR', 'Blue', '{X}{U}', NULL, NULL, '  Counter target spell unless its controller pays {X}. If that spell is countered this way, exile it instead of putting it into its owner''s graveyard.  "Patience, mage. Killing you now would be too easy."'),
(55, 'Tower Drake', 'Creature', 'Drake', 'RTR', 'Blue', '{2}{U}', 2, 1, '  Flying  {W}: Tower Drake gets +0/+1 until end of turn.  The first motion put forth in the pristine Jelenn Column was for severe restrictions on the airspace around New Prahv.'),
(56, 'Voidwielder', 'Creature', 'Human Wizard', 'RTR', 'Blue', '{4}{U}', 1, 4, '  When Voidwielder enters the battlefield, you may return target creature to its owner''s hand.  "He makes up his own laws, and that''s dangerous to all who love peace and prosperity. Kill him on sight." -Mirela, Azorius hussar'),
(57, 'Assassin\'s Strike', 'Sorcery', NULL, 'RTR', 'Black', '{4}{B}{B}', NULL, NULL, '  Destroy target creature. Its controller discards a card.  When Selesnya missionaries moved into the Shanav Quarter, they faced scorn, ridicule, and ultimately martyrdom.'),
(58, 'Catacomb Slug', 'Creature', 'Slug', 'RTR', 'Black', '{4}{B}', 2, 6, '"The entire murder scene was covered in dripping, oozing slime. No need for a soothsayer to solve that one." -Pel Javya, Wojek investigator'),
(59, 'Cremate', 'Instant', NULL, 'RTR', 'Black', '{B}', NULL, NULL, '  Exile target card from a graveyard.  Draw a card.  "Without a body, the soul is helpless to fight the terms of our contracts." -Somhaur, Orzhov pontiff'),
(60, 'Daggerdrome Imp', 'Creature', 'Imp', 'RTR', 'Black', '{1}{B}', 1, 1, '  Flying  Lifelink (Damage dealt by this creature also causes you to gain that much life.)  One of the many reasons why open-air markets close at dusk.'),
(61, 'Dark Revenant', 'Creature', 'Spirit', 'RTR', 'Black', '{3}{B}', 2, 2, '  Flying  When Dark Revenant dies, put it on top of its owner''s library.  The murderer faced justice in the Azorius courts, but his soul was set free on a technicality.'),
(62, 'Dead Reveler', 'Creature', 'Zombie', 'RTR', 'Black', '{2}{B}', 2, 3, '  Unleash (You may have this creature enter the battlefield with a +1/+1 counter on it. It can''t block as long as it has a +1/+1 counter on it.)  He''s the unlife of the party.'),
(63, 'Desecration Demon', 'Creature', 'Demon', 'RTR', 'Black', '{2}{B}{B}', 6, 6, '  Flying  At the beginning of each combat, any opponent may sacrifice a creature. If a player does, tap Desecration Demon and put a +1/+1 counter on it.'),
(64, 'Destroy the Evidence', 'Sorcery', NULL, 'RTR', 'Black', '{4}{B}', NULL, NULL, '  Destroy target land. Its controller reveals cards from the top of their library until they reveal a land card, then puts those cards into their graveyard.  Everyone knew the Dimir had done the damage. Everyone suspected the Izzet had hired them.'),
(65, 'Deviant Glee', 'Enchantment', 'Aura', 'RTR', 'Black', '{B}', NULL, NULL, 'Enchant creature  Enchanted creature gets +2/+1 and has "{R}: This creature gains trample until end of turn."  "You just need the right incentive to fulfill my dreams.\"'),
(66, 'Drainpipe Vermin', 'Creature', 'Rat', 'RTR', 'Black', '{B}', 1, 1, '  When Drainpipe Vermin dies, you may pay {B}. If you do, target player discards a card.  When times are tough, the poor eat the rats. When times are tougher, the rats eat the poor.'),
(67, 'Grave Betrayal', 'Enchantment', NULL, 'RTR', 'Black', '{5}{B}{B}', NULL, NULL, 'Whenever a creature you don''t control dies, return it to the battlefield under your control with an additional +1/+1 counter on it at the beginning of the next end step. That creature is a black Zombie in addition to its other colors and types.'),
(68, 'Grim Roustabout', 'Creature', 'Skeleton Warrior', 'RTR', 'Black', '{1}{B}', 1, 1, '  Unleash (You may have this creature enter the battlefield with a +1/+1 counter on it. It can''t block as long as it has a +1/+1 counter on it. {1}{B})  : Regenerate Grim Roustabout.  He''ll point you to your death row seats.'),
(69, 'Launch Party', 'Instant', NULL, 'RTR', 'Black', '{3}{B}', NULL, NULL, '  As an additional cost to cast this spell, sacrifice a creature.  Destroy target creature. Its controller loses 2 life.  Life''s too short to not do the things you love.'),
(70, 'Mind Rot', 'Sorcery', NULL, 'RTR', 'Black', '{2}{B}', NULL, NULL, '  Target player discards two cards.  With no memories left to compare to his present situation, Andalum was finally content.'),
(71, 'Necropolis Regent', 'Creature', 'Vampire', 'RTR', 'Black', '{3}{B}{B}{B}', 6, 5, '  Flying  Whenever a creature you control deals combat damage to a player, put that many +1/+1 counters on it.  "Jarad fancies himself king of the undercity, but he''s merely king of rot."'),
(72, 'Ogre Jailbreaker', 'Creature', 'Ogre Rogue', 'RTR', 'Black', '{3}{B}', 4, 4, '  Defender  Ogre Jailbreaker can attack as though it didn''t have defender as long as you control a Gate.  It took three years for it to occur to him to use the chain as a weapon, but once it did, he made up for lost time.'),
(73, 'Pack Rat', 'Creature', 'Rat', 'RTR', 'Black', '{1}{B}', NULL, NULL, '  Pack Rat''s power and toughness are each equal to the number of Rats you control.  {2}{B}, Discard a card: Create a token that''s a copy of Pack Rat.'),
(74, 'Perilous Shadow', 'Creature', 'Insect Shade', 'RTR', 'Black', '{2}{B}{B}', 0, 4, '{1}{B}: Perilous Shadow gets +2/+2 until end of turn.  There are some shadows that even the Dimir fear.'),
(75, 'Sewer Shambler', 'Creature', 'Zombie', 'RTR', 'Black', '{2}{B}', 2, 1, 'Swampwalk (This creature can''t be blocked as long as defending player controls a Swamp.)  Scavenge {2}{B}({2}{B}, Exile this card from your graveyard: Put a number of +1/+1 counters equal to this cards power on target creature. Scavenge only as a sorcery.)'),
(76, 'Shrieking Affliction', 'Enchantment', NULL, 'RTR', 'Black', '{B}', NULL, NULL, '  At the beginning of each opponent''s upkeep, if that player has one or fewer cards in hand, they lose 3 life.  A gargoyle''s voice reaches pitches that will shatter glass and warp bone.'),
(77, 'Slum Reaper', 'Creature', 'Horror', 'RTR', 'Black', '{3}{B}', 4, 2, '  When Slum Reaper enters the battlefield, each player sacrifices a creature.  It''s sent into unguilded districts by the Orzhov to collect the souls of those no one will miss.'),
(78, 'Stab Wound', 'Enchantment', 'Aura', 'RTR', 'Black', '{2}{B}', NULL, NULL, '  Enchant creature  Enchanted creature gets -2/-2.  At the beginning of the upkeep of enchanted creature''s controller, that player loses 2 life.'),
(79, 'Tavern Swindler', 'Creature', 'Human Rogue', 'RTR', 'Black', '{1}{B}', 2, 2, '{T}: Pay 3 life: Flip a coin. If you win the flip, you gain 6 life.  Rakdos cultists are her best customers. They never flinch at pain and are seldom good at math.'),
(80, 'Terrus Wurm', 'Creature', 'Zombie Wurm', 'RTR', 'Black', '{6}{B}', 5, 5, '  Scavenge {6}{B} ({6}{B}, Exile this card from your graveyard: Put a number of +1/+1 counters equal to this card''s power on target creature. Scavenge only as a sorcery.)  "We follow it through its tunnels, and where it dies, we farm." -Mihas, spore druid'),
(81, 'Thrill-Kill Assassin', 'Creature', 'Human Assassin', 'RTR', 'Black', '{1}{B}', 1, 2, '  Deathtouch  Unleash (You may have this creature enter the battlefield with a +1/+1 counter on it. It can''t block as long as it has a +1/+1 counter on it.)  As the bounty on Massacre Girl rose, so did the number of imitators.'),
(82, 'Ultimate Price', 'Instant', NULL, 'RTR', 'Black', '{1}{B}', NULL, NULL, '  Destroy target monocolored creature.  "Let him be an example to others who would default on their debts to us." -\"The Cozen," Orzhov assassin'),
(83, 'Crippling Blight', 'Enchantment', 'Aura', 'RTR', 'Black', '{B}', NULL, NULL, ' Enchant creature Enchanted creature gets -1/-1 and can\'t block. \"Still alive? No matter. I\'ll leave you as a warning to others who would oppose me.\" -Vish Kal, Blood Arbiter'),
(84, 'Underworld Connections', 'Enchantment', 'Aura', 'RTR', 'Black', '{1}{B}{B}', NULL, NULL, '  Flying  Scavenge {2}{B}{B} ({2}{B}{B}, Exile this card from your graveyard: Put a number of +1/+1 counters equal to this card''s power on target creature. Scavenge only as a sorcery.)'),
(85, 'Zanikev Locust', 'Creature', 'Insect', 'RTR', 'Black', '{5}{B}', 3, 3, '  Enchant land  Enchanted land has "{T}, Pay 1 life: Draw a card."  If you''re looking for it, it''s available. The question is how much you''re willing to pay.'),
(86, 'Annihilating Fire', 'Instant', NULL, 'RTR', 'Red', '{1}{R}{R}', NULL, NULL, '  Annihilating Fire deals 3 damage to any target. If a creature dealt damage this way would die this turn, exile it instead.  "The most impressive performances can be done only once." -Mote, Rakdos madcap'),
(87, 'Ash Zealot', 'Creature', 'Human Warrior', 'RTR', 'Red', '{R}{R}', 2, 2, '  First strike, haste  Whenever a player casts a spell from a graveyard, Ash Zealot deals 3 damage to that player.  "Smarter than death? Let''s see you outsmart my mace, necromancer!"'),
(88, 'Batterhorn', 'Creature', 'Beast', 'RTR', 'Red', '{4}{R}', 4, 3, '  When Batterhorn enters the battlefield, you may destroy target artifact.  Novice shopkeeps spend hours deciding how best to display their wares. Veterans focus on portability.'),
(89, 'Bellows Lizard', 'Creature', 'Lizard', 'RTR', 'Red', '{R}', 1, 1, '{R}: Bellows Lizard gets +1/+0 until end of turn.  As the price of wood and coal rose, smiths found creative ways to keep their forges burning.'),
(90, 'Bloodfray Giant', 'Creature', 'Giant', 'RTR', 'Red', '{2}{R}', 4, 3, '  Trample  Unleash (You may have this creature enter the battlefield with a +1/+1 counter on it. It can''t block as long as it has a +1/+1 counter on it.)  The star performer of the Juri Revue, his shows have fans and blood spilling into the street.'),
(91, 'Chaos Imps', 'Creature', 'Imp', 'RTR', 'Red', '{4}{R}{R}', 6, 5, '  Flying  Unleash (You may have this creature enter the battlefield with a +1/+1 counter on it. It can''t block as long as it has a +1/+1 counter on it.)  Chaos Imps has trample as long as it has a +1/+1 counter on it.'),
(92, 'Cobblebrute', 'Creature', 'Elemental', 'RTR', 'Red', '{3}{R}', 5, 2, 'The most ancient streets take on a life of their own. A few have decided to move to nicer neighborhoods.'),
(93, 'Dynacharge', 'Instant', NULL, 'RTR', 'Red', '{R}', NULL, NULL, '  Target creature you control gets +2/+0 until end of turn.  Overload {2}{R} (You may cast this spell for its overload cost. If you do, change "target" in its text to "each.")  Nothing evens the odds like a little lightning.'),
(94, 'Electrickery', 'Instant', NULL, 'RTR', 'Red', '{R}', NULL, NULL, '  Electrickery deals 1 damage to target creature you don''t control.  Overload {1}{R} (You may cast this spell for its overload cost. If you do, change "target" in its text to "each.")'),
(95, 'Explosive Impact', 'Instant', NULL, 'RTR', 'Red', '{5}{R}', NULL, NULL, '  Explosive Impact deals 5 damage to any target.  "Such boorish noise is what passes for subtlety among the Boros." -Vraska'),
(96, 'Goblin Rally', 'Sorcery', NULL, 'RTR', 'Red', '{3}{R}{R}', NULL, NULL, '  Create four 1/1 red Goblin creature tokens.  You don''t so much hire goblins as put ideas in their heads.'),
(97, 'Gore-House Chainwalker', 'Creature', 'Human Warrior', 'RTR', 'Red', '{1}{R}', 2, 1, '  Unleash (You may have this creature enter the battlefield with a +1/+1 counter on it. It can''t block as long as it has a +1/+1 counter on it.)  If the pig''s blood drips on you, you''re next on the chain.'),
(98, 'Guild Feud', 'Enchantment', NULL, 'RTR', 'Red', '{5}{R}', NULL, NULL, 'At the beginning of your upkeep, target opponent reveals the top three cards of their library, may put a creature card from among them onto the battlefield, then puts the rest into their graveyard. You do the same with the top three cards of your library. If two creatures are put onto the battlefield this way, those creatures fight each other.'),
(99, 'Guttersnipe', 'Creature', 'Goblin Shaman', 'RTR', 'Red', '{2}{R}', 2, 2, '  Whenever you cast an instant or sorcery spell, Guttersnipe deals 2 damage to each opponent.  He wants to watch Ravnica burn, one soul at a time.'),
(100, 'Lobber Crew', 'Creature', 'Goblin Warrior', 'RTR', 'Red', '{2}{R}', 0, 4, '  Defender  {T}: Lobber Crew deals 1 damage to each opponent.  Whenever you cast a multicolored spell, untap Lobber Crew.  It''s easier to just aim at everything.'),
(101, 'Minotaur Aggressor', 'Creature', 'Minotaur Berserker', 'RTR', 'Red', '{6}{R}', 6, 2, '  First strike, haste  The smelting district is home to many who see the guilds as not for them.'),
(102, 'Mizzium Mortars', 'Sorcery', NULL, 'RTR', 'Red', '{1}{R}', NULL, NULL, '  Mizzium Mortars deals 4 damage to target creature you don''t control.  Overload {3}{R}{R}{R} (You may cast this spell for its overload cost. If you do, change "target" in its text to "each.")'),
(103, 'Pursuit of Flight', 'Enchantment', 'Aura', 'RTR', 'Red', '{1}{R}', NULL, NULL, '  Enchant creature  Enchanted creature gets +2/+2 and has "{U}: This creature gains flying until end of turn."  "Watch the voltage. We don''t need another charred, crashing viashino." -Bori Andon, Izzet blastseeker'),
(104, 'Pyroconvergence', 'Enchantment', NULL, 'RTR', 'Red', '{4}{R}', NULL, NULL, '  Whenever you cast a multicolored spell, Pyroconvergence deals 2 damage to any target.  "The Izzet are an equation that turns lunacy into explosions." -Leonos, Azorius arbiter'),
(105, 'Racecourse Fury', 'Enchantment', 'Aura', 'RTR', 'Red', '{R}', NULL, NULL, '  Enchant land  Enchanted land has "{T}: Target creature gains haste until end of turn."  Close finishes are settled by who can dismount and get to weapons first.'),
(106, 'Splatter Thug', 'Creature', 'Human Warrior', 'RTR', 'Red', '{2}{R}', 2, 2, '  First strike  Unleash (You may have this creature enter the battlefield with a +1/+1 counter on it. It can''t block as long as it has a +1/+1 counter on it.)  The mask isn''t meant to hide his identity. It''s meant to keep the viscera out of his eyes.'),
(107, 'Street Spasm', 'Instant', NULL, 'RTR', 'Red', '{X}{R}', NULL, NULL, '  Street Spasm deals X damage to target creature without flying you don''t control.  Overload {X}{X}{R}{R} (You may cast this spell for its overload cost. If you do, change "target" in its text to "each.")'),
(108, 'Survey the Wreckage', 'Sorcery', NULL, 'RTR', 'Red', '{4}{R}', NULL, NULL, '  Destroy target land. Create a 1/1 red Goblin creature token.  Goblins and architects seldom get along.'),
(109, 'Tenement Crasher', 'Creature', 'Beast', 'RTR', 'Red', '{5}{R}', 5, 4, '  Haste  Nothing was going to stop it-not the narrow alleys, not the Boros garrison, and certainly not the four-story Orzhov cathedral.'),
(110, 'Traitorous Instinct', 'Sorcery', NULL, 'RTR', 'Red', '{3}{R}', NULL, NULL, '  Gain control of target creature until end of turn. Untap that creature. Until end of turn, it gets +2/+0 and gains haste.  Joining the Worldsoul took years of study and meditation. Severing that connection took the snap of Rakdos''s fingers.'),
(111, 'Utvara Hellkite', 'Creature', 'Dragon', 'RTR', 'Red', '{6}{R}{R}', 6, 6, '  Flying  Whenever a Dragon you control attacks, create a 6/6 red Dragon creature token with flying.  The fear of dragons is as old and as powerful as the fear of death itself.'),
(112, 'Vandalblast', 'Sorcery', NULL, 'RTR', 'Red', '{R}', NULL, NULL, '  Destroy target artifact you don''t control.  Overload {4}{R} (You may cast this spell for its overload cost. If you do, change "target" in its text to "each.")  Beauty is in the eye of the exploder.'),
(113, 'Viashino Racketeer', 'Creature', 'Viashino Rogue', 'RTR', 'Red', '{2}{R}', 2, 1, '  When Viashino Racketeer enters the battlefield, you may discard a card. If you do, draw a card.  "You may call me a fool, selling this stuff on Orzhov turf. Well, you need to be a little reckless to survive."'),
(114, 'Aerial Predation', 'Instant', NULL, 'RTR', 'Green', '{2}{G}', NULL, NULL, '  Destroy target creature with flying. You gain 2 life.  In the towering trees of the Samok Stand and the predators that guard them, the might of the Ravnican wild has returned.'),
(115, 'Archweaver', 'Creature', 'Spider', 'RTR', 'Green', '{5}{G}', 5, 5, '  Reach, trample  The silk of the archweavers adds structural integrity to otherwise unstable Izzet building sites.'),
(116, 'Axebane Guardian', 'Creature', 'Human Druid', 'RTR', 'Green', '{2}{G}', 0, 3, '  Defender  {T}: Add X mana in any combination of colors, where X is the number of creatures with defender you control.  Only a worthy few are permitted within the sentient forest known as Axebane.'),
(117, 'Axebane Stag', 'Creature', 'Elk', 'RTR', 'Green', '{6}{G}', 6, 7, '"When the spires have burned and the cobblestones are dust, he will take his rightful place as king of the wilds." -Kirce, Axebane guardian'),
(118, 'Brushstrider', 'Creature', 'Beast', 'RTR', 'Green', '{1}{G}', 3, 1, '  Vigilance  Magistrate Ludy agreed to designate land for the brushstriders only after several broken windows and dozens of missing blini-cakes.'),
(119, 'Centaur\'s Herald', 'Creature', 'Elf Scout', 'RTR', 'Green', '{G}', 0, 1, '{G}, Sacrifice Centaur''s Herald: Create a 3/3 green Centaur creature token.  The farther they go from Vitu-Ghazi, the less willing the crowd is to part for them.'),
(120, 'Chorus of Might', 'Instant', NULL, 'RTR', 'Green', '{3}{G}', NULL, NULL, '  Until end of turn, target creature gets +1/+1 for each creature you control and gains trample.  "In each of us is the strength of all of us." -Trostani'),
(121, 'Deadbridge Goliath', 'Creature', 'Insect', 'RTR', 'Green', '{2}{G}', 5, 5, '  Scavenge {4}{G}{G} ({4}{G}{G}, Exile this card from your graveyard: Put a number of +1/+1 counters equal to this card''s power on target creature. Scavenge only as a sorcery.)  Some Golgari insects live for centuries-and they never stop growing.'),
(122, 'Death\'s Presence', 'Enchantment', NULL, 'RTR', 'Green', '{5}{G}', NULL, NULL, '  Whenever a creature you control dies, put X +1/+1 counters on target creature you control, where X is the power of the creature that died.  "We traffic in flesh, not souls. Still, it''s a shame to let anything go to waste." -Cevraya, Golgari shaman'),
(123, 'Drudge Beetle', 'Creature', 'Insect', 'RTR', 'Green', '{1}{G}', 2, 2, '  Scavenge {5}{G} ({5}{G}, Exile this card from your graveyard: Put a number of +1/+1 counters equal to this card''s power on target creature. Scavenge only as a sorcery.)  The Street Swarm is the labor class that drives the Golgari''s endless cycle of life and death.'),
(124, 'Druid\'s Deliverance', 'Instant', NULL, 'RTR', 'Green', '{1}{G}', NULL, NULL, '  Prevent all combat damage that would be dealt to you this turn. Populate. (Create a token that''s a copy of a creature token you control.)  "So many oppose us, but we are the reed that bends without breaking."'),
(125, 'Gatecreeper Vine', 'Creature', 'Plant', 'RTR', 'Green', '{1}{G}', 0, 2, '  Defender  When Gatecreeper Vine enters the battlefield, you may search your library for a basic land card or a Gate card, reveal it, put it into your hand, then shuffle.  Every inch of Ravnica is home to something.'),
(126, 'Giant Growth', 'Instant', NULL, 'RTR', 'Green', '{G}', NULL, NULL, '  Target creature gets +3/+3 until end of turn.  "The prohibition of unnecessary tossing of the citizenry by giants shall also extend to spontaneous giants." -Isperia''s Edict, provision VII.789.2'),
(127, 'Gobbling Ooze', 'Creature', 'Ooze', 'RTR', 'Green', '{4}{G}', 3, 3, ', Sacrifice another creature: Put a +1/+1 counter on Gobbling Ooze.  The furious citizens blamed the Simic for releasing it in their district. The Simic pointed out that rats were no longer a problem.'),
(128, 'Golgari Decoy', 'Creature', 'Elf Rogue', 'RTR', 'Green', '{3}{G}', 2, 2, '  All creatures able to block Golgari Decoy do so.  Scavenge {3}{G}{G} ({3}{G}{G}, Exile this card from your graveyard: Put a number of +1/+1 counters equal to this card''s power on target creature. Scavenge only as a sorcery.)'),
(129, 'Horncaller\'s Chant', 'Sorcery', NULL, 'RTR', 'Green', '{7}{G}', NULL, NULL, '  Create a 4/4 green Rhino creature token with trample, then populate. (Create a token that''s a copy of a creature token you control.)  "The Selesnya are gathering armies. Do you still believe they aren''t preparing for war?" -Teysa, to Isperia'),
(130, 'Korozda Monitor', 'Creature', 'Lizard', 'RTR', 'Green', '{2}{G}{G}', 3, 3, '  Trample  Scavenge {5}{G}{G} ({5}{G}{G}, Exile this card from your graveyard: Put a number of +1/+1 counters equal to this card''s power on target creature. Scavenge only as a sorcery.)'),
(131, 'Mana Bloom', 'Enchantment', NULL, 'RTR', 'Green', '{X}{G}', NULL, NULL, '  Mana Bloom enters the battlefield with X charge counters on it.  Remove a charge counter from Mana Bloom: Add one mana of any color. Activate only once each turn.  At the beginning of your upkeep, if Mana Bloom has no charge counters on it, return it to its owner''s hand.'),
(132, 'Oak Street Innkeeper', 'Creature', 'Elf', 'RTR', 'Green', '{2}{G}', 1, 2, '  As long as it''s not your turn, tapped creatures you control have hexproof.  The city is vast and perilous, but there are places where a weary traveler can feel very much at home.'),
(133, 'Rubbleback Rhino', 'Creature', 'Rhino', 'RTR', 'Green', '{4}{G}', 3, 4, '  Hexproof (This creature can''t be the target of spells or abilities your opponents control.)  The trouble started when a street urchin bet a goblin he could ride one until the clock on Shilbo''s Tower struck thirteen.'),
(134, 'Savage Surge', 'Instant', NULL, 'RTR', 'Green', '{1}{G}', NULL, NULL, '  Target creature gets +2/+2 until end of turn. Untap that creature.  Gruul warriors never need to be stirred to battle. They need only to be shown where the battle is.'),
(135, 'Seek the Horizon', 'Sorcery', NULL, 'RTR', 'Green', '{3}{G}', NULL, NULL, '  Search your library for up to three basic land cards, reveal them, put them into your hand, then shuffle.  Raked by vertical spikes of glass and stone, Ravnica''s vistas offer only a rare glimpse of the horizon.'),
(136, 'Slime Molding', 'Sorcery', NULL, 'RTR', 'Green', '{X}{G}', NULL, NULL, '  Create an X/X green Ooze creature token.  "Give me enough refuse and mana and I will summon an ooze that can engulf all of Ravnica." -Cevraya, Golgari shaman'),
(137, 'Stonefare Crocodile', 'Creature', 'Crocodile', 'RTR', 'Green', '{2}{G}', 3, 2, '{B}: Stonefare Crocodile gains lifelink until end of turn. (Damage dealt by this creature also causes you to gain that much life.)  The Izzet''s plans to exploit the undercity ran into a few stubborn obstacles.'),
(138, 'Towering Indrik', 'Creature', 'Beast', 'RTR', 'Green', '{3}{G}', 2, 4, '  Reach (This creature can block creatures with flying.)  It chases its airborne prey relentlessly, heedless to what it pulverizes beneath its hooves.'),
(139, 'Urban Burgeoning', 'Enchantment', 'Aura', 'RTR', 'Green', '{G}', NULL, NULL, '  Enchant land  Enchanted land has "Untap this land during each other player''s untap step."  The ruins of Old Prahv became a wildspace, although all birdsong was silenced by lingering Azorius magic.'),
(140, 'Wild Beastmaster', 'Creature', 'Human Shaman', 'RTR', 'Green', '{2}{G}', 1, 1, '  Whenever Wild Beastmaster attacks, each other creature you control gets +X/+X until end of turn, where X is Wild Beastmaster''s power.  "When they covered the world in city, all they did was give themselves nowhere to run."'),
(141, 'Worldspine Wurm', 'Creature', 'Wurm', 'RTR', 'Green', '{8}{G}{G}{G}', 15, 15, '  Trample  When Worldspine Wurm dies, create three 5/5 green Wurm creature tokens with trample.  When Worldspine Wurm is put into a graveyard from anywhere, shuffle it into its owner''s library.'),
(142, 'Abrupt Decay', 'Instant', NULL, 'RTR', 'Black/Green', '{B}{G}', NULL, NULL, '  This spell can''t be countered.  Destroy target nonland permanent with mana value 3 or less.  The Izzet quickly suspended their policy of lifetime guarantees.'),
(143, 'Archon of the Triumvirate', 'Creature', 'Archon', 'RTR', 'White/Blue', '{5}{W}{U}', 4, 5, '  Flying  Whenever Archon of the Triumvirate attacks, detain up to two target nonland permanents your opponents control. (Until your next turn, those permanents can''t attack or block and their activated abilities can''t be activated.)'),
(144, 'Armada Wurm', 'Creature', 'Wurm', 'RTR', 'Green/White', '{2}{G}{G}{W}{W}', 5, 5, '  Trample  When Armada Wurm enters the battlefield, create a 5/5 green Wurm creature token with trample.  No one in the Conclave acts alone.'),
(145, 'Auger Spree', 'Instant', NULL, 'RTR', 'Black/Red', '{1}{B}{R}', NULL, NULL, '  Target creature gets +4/-4 until end of turn.  "Finally, a weapon the Boros can''t confiscate!" -Juri, proprietor of the Juri Revue'),
(146, 'Azorius Charm', 'Instant', NULL, 'RTR', 'White/Blue', '{W}{U}', NULL, NULL, '  Choose one -  • Creatures you control gain lifelink until end of turn.  • Draw a card.  • Put target attacking or blocking creature on top of its owner''s library.  "The rules of logic and order have already made the choice for you." -Isperia'),
(147, 'Call of the Conclave', 'Sorcery', NULL, 'RTR', 'Green/White', '{G}{W}', NULL, NULL, '  Create a 3/3 green Centaur creature token.  Centaurs are sent to evangelize in Gruul territories where words of war speak louder than prayers of peace.'),
(148, 'Carnival Hellsteed', 'Creature', 'Nightmare Horse', 'RTR', 'Black/Red', '{4}{B}{R}', 5, 4, '  First strike, haste  Unleash (You may have this creature enter the battlefield with a +1/+1 counter on it. It can''t block as long as it has a +1/+1 counter on it.)  Its favorite treats are candied hands and sweet hearts.'),
(149, 'Centaur Healer', 'Creature', 'Centaur Cleric', 'RTR', 'Green/White', '{1}{G}{W}', 3, 3, '  When Centaur Healer enters the battlefield, you gain 3 life.  Instructors at the Kasarna training grounds are capable healers in case their students fail to grasp the subtleties of combat.'),
(150, 'Chemister\'s Trick', 'Instant', NULL, 'RTR', 'Blue/Red', '{U}{R}', NULL, NULL, '  Target creature you don''t control gets -2/-0 until end of turn and attacks this turn if able.  Overload {3}{U}{R} (You may cast this spell for its overload cost. If you do, change "target" in its text to "each.")'),
(151, 'Collective Blessing', 'Enchantment', NULL, 'RTR', 'Green/White', '{3}{G}{G}{W}', NULL, NULL, '  Creatures you control get +3/+3.  Senators of Azorius often hired agents to spy on the Selesnya. They were told to record every spore and root they saw, as each could become a deadly foe.'),
(152, 'Common Bond', 'Instant', NULL, 'RTR', 'Green/White', '{1}{G}{W}', NULL, NULL, '  Put a +1/+1 counter on target creature.  Put a +1/+1 counter on target creature.  Wolf riders hone their skills traversing the perilous rooftops, each dizzying step bringing elf and wolf closer together.'),
(153, 'Corpsejack Menace', 'Creature', 'Fungus', 'RTR', 'Black/Green', '{2}{B}{G}', 4, 4, '  If one or more +1/+1 counters would be put on a creature you control, twice that many +1/+1 counters are put on it instead.  Weakness is not in the nature of the Swarm.'),
(154, 'Counterflux', 'Instant', NULL, 'RTR', 'Blue/Red', '{U}{U}{R}', NULL, NULL, '  This spell can''t be countered.  Counter target spell you don''t control.  Overload {1}{U}{U}{R} (You may cast this spell for its overload cost. If you do, change "target" in its text to "each.")'),
(155, 'Coursers\' Accord', 'Sorcery', NULL, 'RTR', 'Green/White', '{4}{G}{W}', NULL, NULL, '  Create a 3/3 green Centaur creature token, then populate. (Create a token that''s a copy of a creature token you control.)  Bleak rumors reached Trostani''s ears. She decreed that no one should travel alone.'),
(156, 'Detention Sphere', 'Enchantment', NULL, 'RTR', 'White/Blue', '{1}{W}{U}', NULL, NULL, '  When Detention Sphere enters the battlefield, you may exile target nonland permanent not named Detention Sphere and all other permanents with the same name as that permanent.  When Detention Sphere leaves the battlefield, return the exiled cards to the battlefield under their owner''s control.'),
(157, 'Dramatic Rescue', 'Instant', NULL, 'RTR', 'White/Blue', '{W}{U}', NULL, NULL, '  Return target creature to its owner''s hand. You gain 2 life.  "I never thought I''d be so glad to see two tons of beak and claws bearing down on me at the speed of an arrow." -Mirela, Azorius hussar'),
(158, 'Dreadbore', 'Sorcery', NULL, 'RTR', 'Black/Red', '{B}{R}', NULL, NULL, '  Destroy target creature or planeswalker.  In Rakdos-controlled neighborhoods, everyone is part of the show.'),
(159, 'Dreg Mangler', 'Creature', 'Plant Zombie', 'RTR', 'Black/Green', '{1}{B}{G}', 3, 3, '  Haste  Scavenge {3}{B}{G} ({3}{B}{G}, Exile this card from your graveyard: Put a number of +1/+1 counters equal to this card''s power on target creature. Scavenge only as a sorcery.)'),
(160, 'Epic Experiment', 'Sorcery', NULL, 'RTR', 'Blue/Red', '{X}{U}{R}', NULL, NULL, 'Exile the top X cards of your library. You may cast instant and sorcery spells with mana value X or less from among them without paying their mana costs. Then put all cards exiled this way that weren''t cast into your graveyard.'),
(161, 'Essence Backlash', 'Instant', NULL, 'RTR', 'Blue/Red', '{2}{U}{R}', NULL, NULL, '  Counter target creature spell. Essence Backlash deals damage equal to that spell''s power to its controller.  "The other guilds will learn the hard way not to interfere with our investigations." -Bori Andon, Izzet blastseeker'),
(162, 'Fall of the Gavel', 'Instant', NULL, 'RTR', 'White/Blue', '{3}{W}{U}', NULL, NULL, '  Counter target spell. You gain 5 life.  "My ruling is final. Order is upheld. Justice is done."'),
(163, 'Firemind\'s Foresight', 'Instant', NULL, 'RTR', 'Blue/Red', '{5}{U}{R}', NULL, NULL, 'Search your library for an instant card with mana value 3, reveal it, and put it into your hand. Then repeat this process for instant cards with mana values 2 and 1. Then shuffle.'),
(164, 'Goblin Electromancer', 'Creature', 'Goblin Wizard', 'RTR', 'Blue/Red', '{U}{R}', 2, 2, '  Instant and sorcery spells you cast cost {1} less to cast.  When asked how much power is required, Izzet mages always answer "more."'),
(165, 'Golgari Charm', 'Instant', NULL, 'RTR', 'Black/Green', '{B}{G}', NULL, NULL, '  Choose one -  • All creatures get -1/-1 until end of turn.  • Destroy target enchantment.  • Regenerate each creature you control.  "Let the rest of Ravnica sneer. One way or another, they all end up in the undercity." -Jarad'),
(166, 'Grisly Salvage', 'Instant', NULL, 'RTR', 'Black/Green', '{B}{G}', NULL, NULL, '  Reveal the top five cards of your library. You may put a creature or land card from among them into your hand. Put the rest into your graveyard.  To the Golgari, anything buried is treasure.'),
(167, 'Havoc Festival', 'Enchantment', NULL, 'RTR', 'Black/Red', '{4}{B}{R}', NULL, NULL, '  Players can''t gain life.  At the beginning of each player''s upkeep, that player loses half their life, rounded up.  "We can''t control enemies who have no regard for their own survival." -Arrester Lavinia, Tenth Precinct'),
(168, 'Hellhole Flailer', 'Creature', 'Ogre Warrior', 'RTR', 'Black/Red', '{1}{B}{R}', 3, 2, '  Unleash (You may have this creature enter the battlefield with a +1/+1 counter on it. It can''t block as long as it has a +1/+1 counter on it.)  {2}{B}{R}, Sacrifice Hellhole Flailer: Hellhole Flailer deals damage equal to its power to target player or planeswalker.'),
(169, 'Heroes\' Reunion', 'Instant', NULL, 'RTR', 'Green/White', '{G}{W}', NULL, NULL, '  Target player gains 7 life.  They share no bloodline, but a bond greater than family unites them. Such are the gifts of the Worldsoul.'),
(170, 'Hussar Patrol', 'Creature', 'Human Knight', 'RTR', 'White/Blue', '{2}{W}{U}', 2, 4, '  Flash (You may cast this spell any time you could cast an instant.)  Vigilance  "You think no one is watching, you think you''re smart enough to escape, and most foolish of all, you think no one cares." -Arrester Lavinia, Tenth Precinct'),
(171, 'Hypersonic Dragon', 'Creature', 'Dragon', 'RTR', 'Blue/Red', '{3}{U}{R}', 4, 4, '  Flying, haste  You may cast sorcery spells as though they had flash. (You may cast them any time you could cast an instant.)  "Even this primitive specimen of my kind is impressive." -Niv-Mizzet'),
(172, 'Isperia, Supreme Judge', 'Legendary Creature', 'Sphinx', 'RTR', 'White/Blue', '{2}{W}{W}{U}{U}', 6, 4, '  Flying  Whenever a creature attacks you or a planeswalker you control, you may draw a card.  "I serve only justice. But through that duty, I serve all of Ravnica."'),
(173, 'Izzet Charm', 'Instant', NULL, 'RTR', 'Blue/Red', '{U}{R}', NULL, NULL, '  Choose one -  • Counter target noncreature spell unless its controller pays {2}.  • Izzet Charm deals 2 damage to target creature.  • Draw two cards, then discard two cards.'),
(174, 'Izzet Staticaster', 'Creature', 'Human Wizard', 'RTR', 'Blue/Red', '{1}{U}{R}', 0, 3, '  Flash (You may cast this spell any time you could cast an instant.)  Haste  {T}: Izzet Staticaster deals 1 damage to target creature and each other creature with the same name as that creature.'),
(175, 'Jarad, Golgari Lich Lord', 'Legendary Creature', 'Zombie Elf', 'RTR', 'Black/Green', '{B}{B}{G}{G}', 2, 2, '  Jarad, Golgari Lich Lord gets +1/+1 for each creature card in your graveyard.  {1}{B}{G}, Sacrifice another creature: Each opponent loses life equal to the sacrificed creature''s power.  Sacrifice a Swamp and a Forest: Return Jarad from your graveyard to your hand.'),
(176, 'Jarad\'s Orders', 'Sorcery', NULL, 'RTR', 'Black/Green', '{2}{B}{G}', NULL, NULL, '  Search your library for up to two creature cards and reveal them. Put one into your hand and the other into your graveyard. Then shuffle.  "The Izzet are searching for something. Discern what or die trying."'),
(177, 'Korozda Guildmage', 'Creature', 'Elf Shaman', 'RTR', 'Black/Green', '{B}{G}', 2, 2, '{B}{G}: Target creature gets +1/+1 and gains intimidate until end of turn. (It can''t be blocked except by artifact creatures and/or creatures that share a color with it.)  {2}{B}{G}, Sacrifice a nontoken creature: Create X 1/1 green Saproling creature tokens, where X is the sacrificed creature''s toughness.'),
(178, 'Lotleth Troll', 'Creature', 'Zombie Troll', 'RTR', 'Black/Green', '{B}{G}', 2, 1, '  Trample  Discard a creature card: Put a +1/+1 counter on Lotleth Troll.  {B}: Regenerate Lotleth Troll.  He lurks in the undercity, eager for the corpse haulers to unload their rotting cargo.'),
(179, 'Loxodon Smiter', 'Creature', 'Elephant Soldier', 'RTR', 'Green/White', '{1}{G}{W}', 4, 4, '  This spell can''t be countered.  If a spell or ability an opponent controls causes you to discard Loxodon Smiter, put it onto the battlefield instead of putting it into your graveyard.'),
(180, 'Lyev Skyknight', 'Creature', 'Human Knight', 'RTR', 'White/Blue', '{1}{W}{U}', 3, 1, '  Flying  When Lyev Skyknight enters the battlefield, detain target nonland permanent an opponent controls. (Until your next turn, that permanent can''t attack or block and its activated abilities can''t be activated.)');
INSERT INTO `mtg_cards` (`card_id`, `card_name`, `card_type`, `card_subtype`, `card_set_code`, `card_color`, `card_cost`, `card_attack`, `card_defense`, `card_description`) VALUES
(181, 'Mercurial Chemister', 'Creature', 'Human Wizard', 'RTR', 'Blue/Red', '{3}{U}{R}', 2, 3, ', {T}: Draw two cards.  {R}, {T}, Discard a card: Mercurial Chemister deals damage to target creature equal to the discarded card''s mana value.  What some see as "distracted" is really "fathoming the unfathomable."'),
(182, 'New Prahv Guildmage', 'Creature', 'Human Wizard', 'RTR', 'White/Blue', '{W}{U}', 2, 2, '{U}: Target creature gains flying until end of turn.  {3}{W}{U}: Detain target nonland permanent an opponent controls. (Until your next turn, that permanent can''t attack or block and its activated abilities can''t be activated.)'),
(183, 'Nivix Guildmage', 'Creature', 'Human Wizard', 'RTR', 'Blue/Red', '{U}{R}', 2, 2, '{U}{R}: Draw a card, then discard a card.  {2}{U}{R}: Copy target instant or sorcery spell you control. You may choose new targets for the copy.  "The only action worth taking is one with an unknown outcome."'),
(184, 'Niv-Mizzet, Dracogenius', 'Legendary Creature', 'Dragon Wizard', 'RTR', 'Blue/Red', '{2}{U}{U}{R}{R}', 5, 5, '  Flying  Whenever Niv-Mizzet, Dracogenius deals damage to a player, you may draw a card.  {U}{R}: Niv-Mizzet, Dracogenius deals 1 damage to any target.  He has no patience for minds that do not inspire him or explode by trying.'),
(185, 'Rakdos Charm', 'Instant', NULL, 'RTR', 'Black/Red', '{B}{R}', NULL, NULL, '  Choose one -  • Exile target player''s graveyard.  • Destroy target artifact.  • Each creature deals 1 damage to its controller.  "Let all feel joy in pain." -Rakdos'),
(186, 'Rakdos Ragemutt', 'Creature', 'Elemental Hound', 'RTR', 'Black/Red', '{3}{B}{R}', 3, 3, '  Lifelink, haste  Ragemutts pull the chariots of the Butcher Clowns, a trio of wingless, zombified faeries formerly of the Izzet.'),
(187, 'Rakdos Ringleader', 'Creature', 'Skeleton Warrior', 'RTR', 'Black/Red', '{4}{B}{R}', 3, 1, '  First strike  Whenever Rakdos Ringleader deals combat damage to a player, that player discards a card at random.  {B}: Regenerate Rakdos Ringleader.'),
(188, 'Rakdos, Lord of Riots', 'Legendary Creature', 'Demon', 'RTR', 'Black/Red', '{B}{B}{R}{R}', 6, 6, 'You can''t cast this spell unless an opponent lost life this turn. Flying, trample Creature spells you cast cost {1} less to cast for each 1 life your opponents have lost this turn.'),
(189, 'Rakdos\'s Return', 'Sorcery', NULL, 'RTR', 'Black/Red', '{X}{B}{R}', NULL, NULL, '  Rakdos''s Return deals X damage to target opponent or planeswalker. That player or that planeswalker''s controller discards X cards.  When Lord Rakdos stirred from his slumber, everyone else''s nightmare began.'),
(190, 'Righteous Authority', 'Enchantment', 'Aura', 'RTR', 'White/Blue', '{3}{W}{U}', NULL, NULL, '  Enchant creature  Enchanted creature gets +1/+1 for each card in its controller''s hand.  At the beginning of the draw step of enchanted creature''s controller, that player draws an additional card.'),
(191, 'Risen Sanctuary', 'Creature', 'Elemental', 'RTR', 'Green/White', '{5}{G}{W}', 8, 8, '  Vigilance  When one of the great guardians arises, it sweeps enemies aside like chaff yet takes care not to crush a single insect underfoot.'),
(192, 'Rites of Reaping', 'Sorcery', NULL, 'RTR', 'Black/Green', '{4}{B}{G}', NULL, NULL, '  Target creature gets +3/+3 until end of turn. Another target creature gets -3/-3 until end of turn.  Don''t cross a Devkarin elf unless you long for an early grave.'),
(193, 'Rix Maadi Guildmage', 'Creature', 'Human Shaman', 'RTR', 'Black/Red', '{B}{R}', 2, 2, '{R}: Target blocking creature gets -1/-1 until end of turn.  {B}{R}: Target player who lost life this turn loses 1 life.  Insatiable, irresistible, and insane.'),
(194, 'Search Warrant', 'Sorcery', NULL, 'RTR', 'White/Blue', '{W}{U}', NULL, NULL, '  Target player reveals their hand. You gain life equal to the number of cards in that player''s hand.  "And would you care to explain why your satchel is radiating an aura of unstable energy?"'),
(195, 'Selesnya Charm', 'Instant', NULL, 'RTR', 'Green/White', '{G}{W}', NULL, NULL, '  Choose one -  • Target creature gets +2/+2 and gains trample until end of turn.  • Exile target creature with power 5 or greater.  • Create a 2/2 white Knight creature token with vigilance.'),
(196, 'Skull Rend', 'Sorcery', NULL, 'RTR', 'Black/Red', '{3}{B}{R}', NULL, NULL, '  Skull Rend deals 2 damage to each opponent. Those players each discard two cards at random.  "We could never accept anyone with a face that pretty or a mind that sane." -Nyoser, Gore-House ringleader'),
(197, 'Skymark Roc', 'Creature', 'Bird', 'RTR', 'White/Blue', '{2}{W}{U}', 3, 3, '  Flying  Whenever Skymark Roc attacks, you may return target creature defending player controls with toughness 2 or less to its owner''s hand.  "Try not to look guilty. Or delicious." -Thorpe, street urchin'),
(198, 'Slaughter Games', 'Sorcery', NULL, 'RTR', 'Black/Red', '{2}{B}{R}', NULL, NULL, '  This spell can''t be countered.  Choose a nonland card name. Search target opponent''s graveyard, hand, and library for any number of cards with that name and exile them. Then that player shuffles.'),
(199, 'Sluiceway Scorpion', 'Creature', 'Scorpion', 'RTR', 'Black/Green', '{2}{B}{G}', 2, 2, '  Deathtouch (Any amount of damage this deals to a creature is enough to destroy it.)  Scavenge {1}{B}{G} ({1}{B}{G}, Exile this card from your graveyard: Put a number of +1/+1 counters equal to this card''s power on target creature. Scavenge only as a sorcery.)'),
(200, 'Spawn of Rix Maadi', 'Creature', 'Horror', 'RTR', 'Black/Red', '{3}{B}{R}', 5, 3, '  Unleash (You may have this creature enter the battlefield with a +1/+1 counter on it. It can''t block as long as it has a +1/+1 counter on it.)  "Straight from the blood-drenched imagination of our illustrious parun!" -Nyoser, Gore-House ringleader'),
(201, 'Sphinx\'s Revelation', 'Instant', NULL, 'RTR', 'White/Blue', '{X}{W}{U}{U}', NULL, NULL, '  You gain X life and draw X cards.  "Let the knowledge of absolute law inspire you to live a life of absolute order."'),
(202, 'Supreme Verdict', 'Sorcery', NULL, 'RTR', 'White/Blue', '{1}{W}{W}{U}', NULL, NULL, '  This spell can''t be countered.  Destroy all creatures.  Leonos had no second thoughts about the abolishment edict. He''d left skyrunes warning of the eviction, even though it was cloudy.'),
(203, 'Teleportal', 'Sorcery', NULL, 'RTR', 'Blue/Red', '{U}{R}', NULL, NULL, '  Target creature you control gets +1/+0 until end of turn and can''t be blocked this turn.  Overload {3}{U}{R} (You may cast this spell for its overload cost. If you do, change "target" in its text to "each.")'),
(204, 'Thoughtflare', 'Instant', NULL, 'RTR', 'Blue/Red', '{3}{U}{R}', NULL, NULL, '  Draw four cards, then discard two cards.  "If this is thinking, I don''t know what I was doing before."'),
(205, 'Treasured Find', 'Sorcery', NULL, 'RTR', 'Black/Green', '{B}{G}', NULL, NULL, '  Return target card from your graveyard to your hand. Exile Treasured Find.  Gorgons crave beautiful things: gems, exquisite amulets, the alabaster corpses of the petrified dead …'),
(206, 'Trestle Troll', 'Creature', 'Troll', 'RTR', 'Black/Green', '{1}{B}{G}', 1, 4, '  Defender  Reach (This creature can block creatures with flying.)  {1}{B}{G}: Regenerate Trestle Troll.  Unwelcome in Golgari colonies, he found his own dark place from which to represent the Swarm.'),
(207, 'Trostani, Selesnya\'s Voice', 'Legendary Creature', 'Dryad', 'RTR', 'Green/White', '{G}{G}{W}{W}', 2, 5, '  Whenever another creature enters the battlefield under your control, you gain life equal to that creature''s toughness.  {1}{G}{W}, {T}: Populate. (Create a token that''s a copy of a creature token you control.)'),
(208, 'Vitu-Ghazi Guildmage', 'Creature', 'Dryad Shaman', 'RTR', 'Green/White', '{G}{W}', 2, 2, '{G}{W}: Create a 3/3 green Centaur creature token.  {2}{G}{W}: Populate. (Create a token that''s a copy of a creature token you control.)  "Preachers of freedom forget that conformity can be beautiful."'),
(209, 'Vraska the Unseen', 'Planeswalker', 'Vraska', 'RTR', 'Black/Green', '{3}{B}{G}', NULL, NULL, '  +1: Until your next turn, whenever a creature deals combat damage to Vraska the Unseen, destroy that creature.  −3: Destroy target nonland permanent.  −7: Create three 1/1 black Assassin creature tokens with "Whenever this creature deals combat damage to a player, that player loses the game."'),
(210, 'Wayfaring Temple', 'Creature', 'Elemental', 'RTR', 'Green/White', '{1}{G}{W}', NULL, NULL, '  Wayfaring Temple''s power and toughness are each equal to the number of creatures you control.  Whenever Wayfaring Temple deals combat damage to a player, populate. (Create a token that''s a copy of a creature token you control.)'),
(211, 'Azor\'s Elocutors', 'Creature', 'Human Advisor', 'RTR', 'White/Blue', '{3}{WU}{WU}', 3, 5, '  At the beginning of your upkeep, put a filibuster counter on Azor''s Elocutors. Then if Azor''s Elocutors has five or more filibuster counters on it, you win the game.  Whenever a source deals damage to you, remove a filibuster counter from Azor''s Elocutors.'),
(212, 'Blistercoil Weird', 'Creature', 'Weird', 'RTR', 'Blue/Red', '{UR}', 1, 1, '  Whenever you cast an instant or sorcery spell, Blistercoil Weird gets +1/+1 until end of turn. Untap it.  Azorius lawmages would like to outlaw the creation of weirds, but first they''d have to settle their long-standing debate on how to classify them.'),
(213, 'Cryptborn Horror', 'Creature', 'Horror', 'RTR', 'Black/Red', '{1}{BR}{BR}', 0, 0, '  Trample  Cryptborn Horror enters the battlefield with X +1/+1 counters on it, where X is the total life lost by your opponents this turn.  Although Cryptwitch Merree vanished after a spat with Rakdos, her playthings lingered.'),
(214, 'Deathrite Shaman', 'Creature', 'Elf Shaman', 'RTR', 'Black/Green', '{BG}', 1, 2, ': Exile target land card from a graveyard. Add one mana of any color.  {B}, {T}: Exile target instant or sorcery card from a graveyard. Each opponent loses 2 life.  {G}, {T}: Exile target creature card from a graveyard. You gain 2 life.'),
(215, 'Dryad Militant', 'Creature', 'Dryad Soldier', 'RTR', 'Green/White', '{GW}', 2, 1, '  If an instant or sorcery card would be put into a graveyard from anywhere, exile it instead.  "We will defend the Worldsoul from Izzet ‘progress'' at any cost."'),
(216, 'Frostburn Weird', 'Creature', 'Weird', 'RTR', 'Blue/Red', '{UR}{UR}', 1, 4, ': Frostburn Weird gets +1/-1 until end of turn.  Many chemisters are oblivious to the innumerable machinations of their guild, instead focusing obsessively on creating the perfect weird.'),
(217, 'Golgari Longlegs', 'Creature', 'Insect', 'RTR', 'Black/Green', '{3}{BG}{BG}', 5, 4, 'Despite its enormous stature, it can fold itself into a tunnel with startling quickness, vanishing back into the undercity.'),
(218, 'Growing Ranks', 'Enchantment', NULL, 'RTR', 'Green/White', '{2}{GW}{GW}', NULL, NULL, '  At the beginning of your upkeep, populate. (Create a token that''s a copy of a creature token you control.)  "We will grow an army large enough to withstand the Izzet''s madness." -Trostani'),
(219, 'Judge\'s Familiar', 'Creature', 'Bird', 'RTR', 'White/Blue', '{WU}', 1, 1, '  Flying  Sacrifice Judge''s Familiar: Counter target instant or sorcery spell unless its controller pays {1}.  "It misses nothing and it has no sense of humor." -Barvisa, courtroom scribe'),
(220, 'Nivmagus Elemental', 'Creature', 'Elemental', 'RTR', 'Blue/Red', '{UR}', 1, 2, '  Exile an instant or sorcery spell you control: Put two +1/+1 counters on Nivmagus Elemental. (That spell won''t resolve.)  When it escaped, the experimenters hesitated. It would cause untold havoc, yet they wished to see it in action.'),
(221, 'Rakdos Cackler', 'Creature', 'Devil', 'RTR', 'Black/Red', '{BR}', 1, 1, '  Unleash (You may have this creature enter the battlefield with a +1/+1 counter on it. It can''t block as long as it has a +1/+1 counter on it.)  Devil-blades and dripping blood make music Rakdos never tires of hearing.'),
(222, 'Rakdos Shred-Freak', 'Creature', 'Human Berserker', 'RTR', 'Black/Red', '{BR}{BR}', 2, 1, '  Haste  "If there were such a thing as a soul, I think it would be behind the gallbladder but above the kidneys."'),
(223, 'Slitherhead', 'Creature', 'Plant Zombie', 'RTR', 'Black/Green', '{BG}', 1, 1, '  Scavenge {0} ({0}, Exile this card from your graveyard: Put a number of +1/+1 counters equal to this card''s power on target creature. Scavenge only as a sorcery.)  "It makes better use of Uncle Dragi''s head than he ever did." -Pesha, retired blacksmith'),
(224, 'Sundering Growth', 'Instant', NULL, 'RTR', 'Green/White', '{GW}{GW}', NULL, NULL, '  Destroy target artifact or enchantment, then populate. (Create a token that''s a copy of a creature token you control.)  "One day every pillar will be a tree and every hall a glade." -Trostani'),
(225, 'Vassal Soul', 'Creature', 'Spirit', 'RTR', 'White/Blue', '{1}{WU}{WU}', 2, 2, '  Flying  For the Azorius, the opportunity to serve the law is too great an honor for death to interrupt.'),
(226, 'Azorius Keyrune', 'Artifact', NULL, 'RTR', NULL, '{3}', NULL, NULL, ': Add {W} or {U}.  {W}{U}: Azorius Keyrune becomes a 2/2 white and blue Bird artifact creature with flying until end of turn.  "The higher the mind soars, the greater its understanding of the law." -Isperia'),
(227, 'Chromatic Lantern', 'Artifact', NULL, 'RTR', NULL, '{3}', NULL, NULL, '  Lands you control have "{T}: Add one mana of any color."  {T}: Add one mana of any color.  Dimir mages put the lanterns to good use, creating shapeshifters and sleeper agents from mana foreign to them.'),
(228, 'Civic Saber', 'Artifact', 'Equipment', 'RTR', NULL, '{1}', NULL, NULL, '  Equipped creature gets +1/+0 for each of its colors.  Equip {1}  Those without a guild signet often display a different form of protection.'),
(229, 'Codex Shredder', 'Artifact', NULL, 'RTR', NULL, '{1}', NULL, NULL, ': Target player mills a card. (They put the top card of their library into their graveyard.)  {5}, {T}, Sacrifice Codex Shredder: Return target card from your graveyard to your hand.'),
(230, 'Golgari Keyrune', 'Artifact', NULL, 'RTR', NULL, '{3}', NULL, NULL, ': Add {B} or {G}.  {B}{G}: Golgari Keyrune becomes a 2/2 black and green Insect artifact creature with deathtouch until end of turn.  Like a single ant, it only hints at the colony below.'),
(231, 'Izzet Keyrune', 'Artifact', NULL, 'RTR', NULL, '{3}', NULL, NULL, ': Add {U} or {R}.  {U}{R}: Until end of turn, Izzet Keyrune becomes a 2/1 blue and red Elemental artifact creature.  Whenever Izzet Keyrune deals combat damage to a player, you may draw a card. If you do, discard a card.'),
(232, 'Pithing Needle', 'Artifact', NULL, 'RTR', NULL, '{1}', NULL, NULL, '  As Pithing Needle enters the battlefield, choose a card name.  Activated abilities of sources with the chosen name can''t be activated unless they''re mana abilities.  The fearful want the procedure before a blood festival. The guilty seek it afterward.'),
(233, 'Rakdos Keyrune', 'Artifact', NULL, 'RTR', NULL, '{3}', NULL, NULL, ': Add {B} or {R}.  {B}{R}: Rakdos Keyrune becomes a 3/1 black and red Devil artifact creature with first strike until end of turn.  The Rakdos use it for everything you can think of and plenty more than that.'),
(234, 'Selesnya Keyrune', 'Artifact', NULL, 'RTR', NULL, '{3}', NULL, NULL, ': Add {G} or {W}.  {G}{W}: Selesnya Keyrune becomes a 3/3 green and white Wolf artifact creature until end of turn.  A mark of unity when you want one; a fierce guardian when you need one.'),
(235, 'Street Sweeper', 'Artifact Creature', 'Construct', 'RTR', NULL, '{6}', 4, 6, '  Whenever Street Sweeper attacks, destroy all Auras attached to target land.  The sweepers roam endlessly, scrubbing away the refuse-and anything else too slow or too clumsy to get out of their way.'),
(236, 'Tablet of the Guilds', 'Artifact', NULL, 'RTR', NULL, '{2}', NULL, NULL, '  As Tablet of the Guilds enters the battlefield, choose two colors.  Whenever you cast a spell, if it''s at least one of the chosen colors, you gain 1 life for each of the chosen colors it is.  It is rumored the Azorius paid an exorbitant sum to ensure its symbol would appear at the top.'),
(237, 'Volatile Rig', 'Artifact Creature', 'Construct', 'RTR', NULL, '{4}', 4, 4, '  Trample  Volatile Rig attacks each combat if able.  Whenever Volatile Rig is dealt damage, flip a coin. If you lose the flip, sacrifice Volatile Rig.  When Volatile Rig dies, flip a coin. If you lose the flip, it deals 4 damage to each creature and each player.'),
(238, 'Azorius Guildgate', 'Land', 'Gate', 'RTR', 'White/Blue', NULL, NULL, NULL, '  Azorius Guildgate enters the battlefield tapped.  {T}: Add {W} or {U}.  Enter the Senate, the seat of justice and the foundation of Ravnican society.'),
(239, 'Blood Crypt', 'Land', 'Swamp Mountain', 'RTR', 'Black/Red', NULL, NULL, NULL, '  ({T}: Add {B} or {R}.)  As Blood Crypt enters the battlefield, you may pay 2 life. If you don''t, it enters the battlefield tapped.  Where the dead serve as diversion, decor, and dessert.'),
(240, 'Golgari Guildgate', 'Land', 'Gate', 'RTR', 'Black/Green', NULL, NULL, NULL, '  Golgari Guildgate enters the battlefield tapped.  {T}: Add {B} or {G}.  Enter those who are starving and sick. You are welcome among the Swarm when the rest of Ravnica rejects you.'),
(241, 'Grove of the Guardian', 'Land', NULL, 'RTR', 'Gray', NULL, NULL, NULL, ': Add {C}.  {3}{G}{W}, {T}, Tap two untapped creatures you control, Sacrifice Grove of the Guardian: Create an 8/8 green and white Elemental creature token with vigilance.'),
(242, 'Hallowed Fountain', 'Land', 'Plains Island', 'RTR', 'White/Blue', NULL, NULL, NULL, '  ({T}: Add {W} or {U}.)  As Hallowed Fountain enters the battlefield, you may pay 2 life. If you don''t, it enters the battlefield tapped.  A place to relax, if you have the proper permit.'),
(243, 'Izzet Guildgate', 'Land', 'Gate', 'RTR', 'Blue/Red', NULL, NULL, NULL, '  Izzet Guildgate enters the battlefield tapped.  {T}: Add {U} or {R}.  Enter those with the vision to create and the daring to release their creations.'),
(244, 'Overgrown Tomb', 'Land', 'Swamp Forest', 'RTR', 'Black/Green', NULL, NULL, NULL, '  ({T}: Add {B} or {G}.)  As Overgrown Tomb enters the battlefield, you may pay 2 life. If you don''t, it enters the battlefield tapped.  The best funeral shroud is the fabric of new life.'),
(245, 'Rakdos Guildgate', 'Land', 'Gate', 'RTR', 'Black/Red', NULL, NULL, NULL, '  Rakdos Guildgate enters the battlefield tapped.  {T}: Add {B} or {R}.  Enter and indulge your darkest fantasies, for you may never pass this way again.'),
(246, 'Rogue\'s Passage', 'Land', NULL, 'RTR', 'Gray', NULL, NULL, NULL, ': Add {C}.  {4}, {T}: Target creature can''t be blocked this turn.  Rumors quickly spread among thieves about a labyrinth without walls and a prize beyond all measures of worth.'),
(247, 'Selesnya Guildgate', 'Land', 'Gate', 'RTR', 'Green/White', NULL, NULL, NULL, '  Selesnya Guildgate enters the battlefield tapped.  {T}: Add {G} or {W}.  Enter and rejoice! The Conclave stands united, open to one and all.'),
(248, 'Steam Vents', 'Land', 'Island Mountain', 'RTR', 'Blue/Red', NULL, NULL, NULL, '  ({T}: Add {U} or {R}.)  As Steam Vents enters the battlefield, you may pay 2 life. If you don''t, it enters the battlefield tapped.  Crafted with genius, energized with madness.'),
(249, 'Temple Garden', 'Land', 'Forest Plains', 'RTR', 'Green/White', NULL, NULL, NULL, '  ({T}: Add {G} or {W}.)  As Temple Garden enters the battlefield, you may pay 2 life. If you don''t, it enters the battlefield tapped.  In the gardens of the Conclave, order and beauty are the roots of power.'),
(250, 'Transguild Promenade', 'Land', NULL, 'RTR', 'Any', NULL, NULL, NULL, '  Transguild Promenade enters the battlefield tapped.  When Transguild Promenade enters the battlefield, sacrifice it unless you pay {1}.  {T}: Add one mana of any color.'),
(251, 'Plains', 'Basic Land', 'Plains', 'RTR', 'White', NULL, NULL, NULL, NULL),
(252, 'Island', 'Basic Land', 'Island', 'RTR', 'Blue', NULL, NULL, NULL, NULL),
(253, 'Swamp', 'Basic Land', 'Swamp', 'RTR', 'Black', NULL, NULL, NULL, NULL),
(254, 'Mountain', 'Basic Land', 'Mountain', 'RTR', 'Red', NULL, NULL, NULL, NULL),
(255, 'Forest', 'Basic Land', 'Forest', 'RTR', 'Green', NULL, NULL, NULL, NULL),
(256, 'Cower in Fear', 'Instant', NULL, 'M13', 'Black', '{1}{B}{B}', NULL, NULL, ' Creatures your opponents control get -1/-1 until end of turn. You will fully understand fear when you discover it is the final thing you put your faith in. -Nicol Bolas'),
(257, 'Blood Reckoning', 'Enchantment', NULL, 'M13', 'Black', '{3}{B]', NULL, NULL, 'Whenever a creature attacks you or a planeswalker you control, that creature\'s controller loses 1 life. There is no greater folly than standing against me. -Nicol Bolas'),
(258, 'Zombie Goliath', 'Creature', 'Zombie Giant', 'M13', 'Black', '{4}{B}', 4, 3, 'Removing the encumbrance of useless brain tissue grants several advantages: a slight increase in mobility, a response of revulsion and horror from the enemy, and, in the case of large specimens, room for passengers. -Zul Ashur, lich lord'),
(259, 'Tormented Soul', 'Creature', 'Spirit', 'M13', 'Black', '{B]', 1, 1, 'Tormented Soul can\'t block and can\'t be blocked. Those who raged most bitterly at the world in life are cursed to roam the nether realms in death.'),
(260, 'Ravenous Rats', 'Creature', 'Rat', 'M13', 'Black', '{1}{B}', 1, 1, ' When Ravenous Rats enters the battlefield, target opponent discards a card. Devouring books is only the beginning. The librarian\'s next.'),
(261, 'Canyon Minotaur', 'Creature', 'Minotaur Warrior', 'M13', 'Red', '{3}{R}', 3, 3, 'We\'ll scale these cliffs, traverse Brittle Bridge, and then fight our way down the volcanic slopes on the other side. Isn\'t the shortest route through the canyon? Yes. So shouldn\'t we- No.');

-- --------------------------------------------------------

--
-- Table structure for table `mtg_card_sets`
--

DROP TABLE IF EXISTS `mtg_card_sets`;
CREATE TABLE IF NOT EXISTS `mtg_card_sets` (
  `set_code` varchar(3) NOT NULL,
  `set_name` varchar(30) DEFAULT NULL,
  `set_release_date` date DEFAULT NULL,
  `set_total_common` int(11) DEFAULT NULL,
  `set_total_uncommon` int(11) DEFAULT NULL,
  `set_total_rare` int(11) DEFAULT NULL,
  `set_total_mythic` int(11) DEFAULT NULL,
  `set_total_land` int(11) DEFAULT NULL,
  `set_total_other` int(11) DEFAULT NULL,
  PRIMARY KEY (`set_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

DROP TABLE IF EXISTS `mtg_card_type`;
CREATE TABLE IF NOT EXISTS `mtg_card_type` (
  `type_name` varchar(20) NOT NULL,
  `type_description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

DROP TABLE IF EXISTS `mtg_decks`;
CREATE TABLE IF NOT EXISTS `mtg_decks` (
  `deck_id` int(11) NOT NULL AUTO_INCREMENT,
  `deck_name` varchar(100) NOT NULL,
  PRIMARY KEY (`deck_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

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

DROP TABLE IF EXISTS `mtg_decks_cards`;
CREATE TABLE IF NOT EXISTS `mtg_decks_cards` (
  `deck_id` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `card_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`deck_id`,`card_id`),
  KEY `card_id` (`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(4, 57, 1),
(4, 65, 1),
(4, 70, 1),
(4, 75, 1),
(4, 76, 1),
(4, 83, 2),
(4, 89, 1),
(4, 90, 1),
(4, 97, 2),
(4, 101, 1),
(4, 110, 1),
(4, 145, 1),
(4, 148, 1),
(4, 168, 1),
(4, 200, 1),
(4, 213, 1),
(4, 221, 2),
(4, 222, 2),
(4, 233, 2),
(4, 245, 1),
(4, 253, 12),
(4, 254, 12),
(4, 256, 1),
(4, 257, 1),
(4, 258, 2),
(4, 259, 3),
(4, 260, 1),
(4, 261, 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `mtg_deck_cards_view`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `mtg_deck_cards_view`;
CREATE TABLE IF NOT EXISTS `mtg_deck_cards_view` (
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

DROP VIEW IF EXISTS `mtg_deck_cards_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mtg_deck_cards_view`  AS SELECT `d`.`deck_id` AS `deck_id`, `d`.`deck_name` AS `deck_name`, `c`.`card_id` AS `card_id`, `c`.`card_name` AS `card_name`, `c`.`card_type` AS `card_type`, `c`.`card_subtype` AS `card_subtype`, `c`.`card_set_code` AS `card_set_code`, `c`.`card_color` AS `card_color`, `c`.`card_cost` AS `card_cost`, `c`.`card_attack` AS `card_attack`, `c`.`card_defense` AS `card_defense`, `c`.`card_description` AS `card_description` FROM ((`mtg_decks` `d` join `mtg_decks_cards` `dmc` on((`d`.`deck_id` = `dmc`.`deck_id`))) join `mtg_cards` `c` on((`dmc`.`card_id` = `c`.`card_id`)))  ;

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
