DROP DATABASE IF EXISTS mtg_card_shop;
CREATE DATABASE mtg_card_shop;
USE mtg_card_shop;

CREATE TABLE mtg_card_sets
(
    set_code varchar(3),
    set_name varchar(30),
    set_release_date date,
    set_total_common int,
    set_total_uncommon int,
    set_total_rare int, 
    set_total_mythic int,
    set_total_land int,
    set_total_other int
);

CREATE TABLE mtg_card_type
(
    type_name varchar(20) NOT NULL,
    type_description varchar(300)
);

CREATE TABLE mtg_cards
(
    card_id int PRIMARY KEY AUTO_INCREMENT,
    card_name varchar(40) NOT NULL,
    card_type varchar(20),
    card_subtype varchar(20),
    card_set_code varchar(60),
    card_color varchar(30),
    card_cost varchar(20),
    card_attack int,
    card_defense int,
    card_description varchar(1000),
    CONSTRAINT FOREIGN KEY (card_set_code) REFERENCES mtg_card_sets(set_code),
    CONSTRAINT FOREIGN KEY (card_type) REFERENCES mtg_card_type(type_name)
);

CREATE TABLE mtg_decks
(
    deck_id int,
    deck_name varchar(30),
    deck_card_id int,
    deck_card_count int,
    deck_card_type varchar(30),
    deck_card_name varchar(40),
    CONSTRAINT FOREIGN KEY (deck_card_id) REFERENCES mtg_cards(card_id)
);

GRANT SELECT, INSERT, DELETE, UPDATE
ON MTG_CardTable.*
TO 'test_user'@'localhost'
IDENTIFIED BY 'testpassword';

INSERT INTO mtg_card_type
(type_name,type_description)
VALUES("Legendary Creature", "A creature is a permanent.  You may only control one copy of a legendary creature at a time.");

INSERT INTO mtg_card_type
(type_name, type_description)
VALUES("Creature", "Creature designations are given to certain cards based on the creature they represent.");

INSERT INTO mtg_card_type
(type_name, type_description)
VALUES("Land", "Land cards generate mana based on their type to play other cards.");

INSERT INTO mtg_card_type
(type_name, type_description)
VALUES("Basic Land", "Basic Land cards generate mana based on their type to play other cards.");

INSERT INTO mtg_card_type
(type_name, type_description)
VALUES("Instant", "Instances can be played at any time one has priority including during other player's turns and while another spell or ability is waiting to resolve.");

INSERT INTO mtg_card_type
(type_name, type_description)
VALUES("Enchantment", "An Enchantment represents persistent magical effects, usually remaining in play indefinitely.");

INSERT INTO mtg_card_type
(type_name, type_description)
VALUES("Sorcery", "Sorceries take effect when their mana cost is paid and the spell resolves, and then are immediately put into its owner's graveyard.");

INSERT INTO mtg_card_type
(type_name, type_description)
VALUES("Planeswalker", "A planeswalker card represents a powerful being that is able to move from plane to plane.");

INSERT INTO mtg_card_type
(type_name, type_description)
VALUES("Artifact", "Artifacts are permanents that represent magical items, animated constructs, pieces of equipment, or other objects and devices.");

INSERT INTO mtg_card_sets
(set_code, set_name, set_release_date, set_total_common, set_total_uncommon, set_total_rare, set_total_mythic, set_total_land, set_total_other)
VALUES ("RTR", "Return to Ravnica", '2012-10-05', 274, 101, 80, 53, 15, 25);

INSERT INTO mtg_card_sets
(set_code, set_name, set_release_date, set_total_common, set_total_uncommon, set_total_rare, set_total_mythic, set_total_land, set_total_other)
VALUES ("M13", "Magic 2013", '2012-07-13', 249, 101, 60, 53, 15, 20);

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Angel of Serenity", "Creature", "Angel", "RTR", "White", "4 Gray, 3 White", 5,6, "Flying When Angel of Serenity enters the battlefield, you may exile up to three other target creatures from the battlefield and/or creature cards from graveyards. When Angel of Serenity leaves the battlefield, return the exiled cards to their owners’ hands.");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Armory Guard", "Creature", "Giant Soldier", "RTR", "White", "3 Gray, 1 White", 2,5, "Armory Guard has vigilance as long as you control a Gate. The Dimir agents watched from the shadows. “Eight hours, and I’ve yet to see him blink,” Nefara hissed. “I suggest we find another way in.”");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_description)
VALUES("Arrest", "Enchantment", "Aura", "RTR", "White", "2 Gray, 1 White", "Enchant creature Enchanted creature can’t attack or block, and its activated abilities can’t be activated. “We will prove your guilt. We don’t arrest the innocent, you know.”—Arrester Lavinia, Tenth Precinct");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Avenging Arrow", "Instant", "RTR", "White", "2 Gray, 1 White", "Destroy target creature that dealt damage this turn. “Forgive the theft. Punish the deception.” —Alcarus, Selesnya archer");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Azorius Arrester", "Creature", "Human Soldier", "RTR", "White", "1 Gray, 1 White", 2,1, "When Azorius Arrester enters the battlefield, detain target creature an opponent controls. (Until your next turn, that creature can’t attack or block and its activated abilities can’t be activated.) “You have the right to remain silent. Mostly because I tire of your excuses.”");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Azorius Justiciar", "Creature", "Human Wizard", "RTR", "White", "2 Gray, 2 White", 2,2, "When Azorius Justiciar enters the battlefield, detain up to two target creatures your opponents control. (Until your next turn, those creatures can’t attack or block and their activated abilities can’t be activated.) “Your potential to commit a crime warrants further investigation.”");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Bazaar Krovod", "Creature", "Beast", "RTR", "White", "4 Gray, 1 White", 2, 5, "Whenever Bazaar Krovod attacks, another target attacking creature gets +0/+2 until end of turn. Untap that creature. The Hauler’s Collective wields great influence over the Ravnican merchant class. Without it, little moves in the city.");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Concordia Pegasus", "Creature", "Pegasus", "RTR", "White", "1 Gray, 1 White", 1,3, "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_description)
VALUES("Ethereal Armor", "Enchantment", "Aura", "RTR", "White", "1 White", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Eyes in the Skies", "Instant", "RTR", "White", "3 Gray, 1 White", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Fencing Ace", "Creature", "Human Soldier", "RTR", "White", "1 Gray, 1 White", 1, 1, "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Keening Apparition", "Creature", "Spirit", "RTR", "White", "1 Gray, 1 White", 2,2,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_description)
VALUES("Knightly Valor", "Enchantment", "Aura", "RTR", "White", "4 Gray, 1 White", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Martial Law", "Enchantment", "RTR", "White", "2 Gray, 2 White", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Palisade Giant", "Creature", "Giant Soldier", "RTR", "White", "4 Gray, 2 White", 2, 7, "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Phantom General", "Creature", "Spirit Soldier", "RTR", "White", "3 Gray, 1 White", 2,3,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Precinct Captain", "Creature", "Human Soldier", "RTR", "White", "2 White", 2 , 2, "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Rest in Peace", "Enchantment", "RTR", "White", "1 Gray, 1 White", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Rootborn Defenses", "Instant", "RTR", "White", "2 Gray, 1 White", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_description)
VALUES("Security Blockade", "Enchantment", "Aura", "RTR", "White", "2 Gray, 1 White", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Selesnya Sentry", "Creature", "Elephant Soldier", "RTR", "White", "2 Gray, 1 White", 3,2, "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Seller of Songbirds", "Creature", "Human", "RTR", "White", "2 Gray, 1 White", 1,2,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_description)
VALUES("Soul Tithe", "Enchantment", "Aura", "RTR", "White", "1 Gray, 1 White", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Sphere of Safety", "Enchantment", "RTR", "White", "4 Gray, 1 White", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Sunspire Griffin", "Creature", "Griffin", "RTR", "White", "1 Gray, 2 White", 2,3,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Swift Justice", "Instant", "RTR", "White", "1 White", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Trained Caracal", "Creature", "Cat", "RTR", "White", "1 White", 1,1,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Trostani's Judgement", "Instant", "RTR", "White", "5 Gray, 1 White", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Aquus Steed", "Creature", "Beast", "RTR", "Blue", "3 Gray, 1 Blue", 1 , 3, "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Blustersquall", "Instant", "RTR", "Blue", "1 Blue", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Cancel", "Instant", "RTR", "Blue", "1 Gray, 2 Blue", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_description)
VALUES("Chronic Flooding", "Enchantment", "Aura", "RTR", "Blue", "1 Gray, 1 Blue", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Conjured Currency", "Enchantment", "RTR", "Blue", "5 Gray, 1 Blue", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Crosstown Courier", "Creature", "Vedalken", "RTR", "Blue","1 Gray, 1 Blue", 2, 1,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Cyclonic Rift", "Instant", "RTR", "Blue", "1 Gray, 1 Blue", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Dispel", "Instant", "RTR", "Blue", "1 Blue", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Doorkeeper", "Creature", "Homunculus", "RTR", "Blue","1 Gray, 1 Blue", 0, 4,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Downsize", "Instant", "RTR", "Blue", "1 Blue", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Faerie Imposter", "Creature", "Faerie Rogue", "RTR", "Blue", "1 Blue", 2, 1,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Hover Barrier", "Creature", "Illusion Wall", "RTR", "Blue", "2 Gray, 1 Blue", 0, 6,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Inaction Injunction", "Sorcery", "RTR", "Blue", "1 Gray, 1 Blue", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Inspiration", "Instant", "RTR", "Blue", "3 Gray, 1 Blue", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Isperia's Skywatch", "Creature", "Vedalken Knight", "RTR", "Blue","5 Gray, 1 Blue", 3, 3,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_description)
VALUES("Jace, Architect of Thought", "Planeswalker", "Jace", "RTR", "Blue","2 Gray, 2 Blue", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Mizzium Skin", "Instant", "RTR", "Blue", "1 Blue", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_description)
VALUES("Paralyzing Grasp", "Enchantment", "Aura", "RTR", "Blue", "2 Gray, 1 Blue", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Psychic Spiral", "Instant", "RTR", "Blue", "4 Gray, 1 Blue", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Runewing", "Creature", "Bird", "RTR", "Blue","3 Gray, 1 Blue", 2, 2,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Search the City", "Enchantment", "RTR", "Blue", "4 Gray, 1 Blue", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Skyline Predator", "Creature", "Drake", "RTR", "Blue", "4 Gray, 2 Blue", 3, 4,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Soulsworn Spirit", "Creature", "Spirit", "RTR", "Blue","3 Gray, 1 Blue", 2, 1,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Sphinx of the Chimes", "Creature", "Sphinx", "RTR", "Blue","", 5, 6,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Stealer of Secrets", "Creature", "Human Rogue", "RTR", "Blue","2 Gray, 1 Blue", 2, 2,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Syncopate", "Instant", "RTR", "Blue", "X Gray, 1 Blue", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Tower Drake", "Creature", "Drake", "RTR", "Blue", "2 Gray, 1 Blue", 2, 1,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Voidwielder", "Creature", "Human Wizard", "RTR", "Blue", "4 Gray, 1 Blue", 1, 4,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Assassin's Strike", "Sorcery", "RTR", "Black", "4 Gray, 2 Black", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Catacomb Slug", "Creature", "Slug", "RTR", "Black", "4 Gray, 1 Black", 2, 6,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Cremate", "Instant", "RTR", "Black", "1 Black", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Daggerdrome Imp", "Creature", "Imp", "RTR", "Black","1 Gray, 1 Black", 1, 1,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Dark Revenant", "Creature", "Spirit", "RTR", "Black","3 Gray, 1 Black", 2, 2,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Dead Reveler", "Creature", "Zombie", "RTR", "Black","2 Gray, 1 Black", 2, 3,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Desecration Demon", "Creature", "Demon", "RTR", "Black","2 Gray, 2 Black", 6, 6,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Destroy the Evidence", "Sorcery", "RTR", "Black", "4 Gray, 1 Black", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_description)
VALUES("Deviant Glee", "Enchantment", "Aura", "RTR", "Black", "1 Black", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Drainpipe Vermin", "Creature", "Rat", "RTR", "Black", "1 Black", 1, 1,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Grave Betrayal", "Enchantment", "RTR", "Black", "5 Gray, 2 Black", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Grim Roustabout", "Creature", "Skeleton Warrior", "RTR", "Black","1 Gray, 1 Black", 1, 1,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Launch Party", "Instant", "RTR", "Black", "3 Gray, 1 Black", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Mind Rot", "Sorcery", "RTR", "Black", "2 Gray, 1 Black", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Necropolis Regent", "Creature", "Vampire", "RTR", "Black","3 Gray, 3 Black", 6, 5,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Ogre Jailbreaker", "Creature", "Ogre Rogue", "RTR", "Black","3 Gray, 1 Black", 4, 4,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_description)
VALUES("Pack Rat", "Creature", "Rat", "RTR", "Black","1 Gray, 1 Black","");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Perilous Shadow", "Creature", "Insect Shade", "RTR", "Black","2 Gray, 2 Black", 0, 4,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Sewer Shambler", "Creature", "Zombie", "RTR", "Black","2 Gray, 1 Black", 2, 1,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Shrieking Affliction", "Enchantment", "RTR", "Black", "1 Black", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Slum Reaper", "Creature", "Horror", "RTR", "Black","3 Gray, 1 Black", 4, 2,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_description)
VALUES("Stab Wound", "Enchantment", "Aura", "RTR", "Black", "2 Gray, 1 Black", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Tavern Swindler", "Creature", "Human Rogue", "RTR", "Black","1 Gray, 1 Black", 2, 2,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Terrus Wurm", "Creature", "Zombie Wurm", "RTR", "Black", "6 Gray, 1 Black", 5, 5,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Thrill-Kill Assassin", "Creature", "Human Assassin", "RTR", "Black", "1 Gray, 1 Black", 1, 2,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Ultimate Price", "Instant", "RTR", "Black", "1 Gray, 1 Black", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_description)
VALUES("Crippling Blight", "Enchantment", "Aura", "RTR", "Black", "1 Black", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_description)
VALUES("Underworld Connections", "Enchantment", "Aura", "RTR", "Black", "1 Gray, 2 Black", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Zanikev Locust", "Creature", "Insect", "RTR", "Black", "5 Gray, 1 Black", 3, 3,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Annihilating Fire", "Instant", "RTR", "Red", "1 Gray, 2 Red", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Ash Zealot", "Creature", "Human Warrior", "RTR", "Red", "2 Red", 2, 2,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Batterhorn", "Creature", "Beast", "RTR", "Red", "4 Gray, 1 Red", 4, 3,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Bellows Lizard", "Creature", "Lizard", "RTR", "Red", "1 Red", 1, 1,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Bloodfray Giant", "Creature", "Giant", "RTR", "Red", "2 Gray, 1 Red", 4, 3,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Chaos Imps", "Creature", "Imp", "RTR", "Red", "4 Gray, 2 Red", 6, 5,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Cobblebrute", "Creature", "Elemental", "RTR", "Red", "3 Gray, 1 Red", 5, 2,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Dynacharge", "Instant", "RTR", "Red", "1 Red", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Electrickery", "Instant", "RTR", "Red", "1 Red", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Explosive Impact", "Instant", "RTR", "Red", "5 Gray, 1 Red", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Goblin Rally", "Sorcery", "RTR", "Red", "3 Gray, 2 Red", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Gore-House Chainwalker", "Creature", "Human Warrior", "RTR", "Red", "1 Gray, 1 Red", 2, 1,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Guild Feud", "Enchantment", "RTR", "Red", "5 Gray, 1 Red", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Guttersnipe", "Creature", "Goblin Shaman", "RTR", "Red", "2 Gray, 1 Red", 2, 2,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Lobber Crew", "Creature", "Goblin Warrior", "RTR", "Red", "2 Gray, 1 Red", 0, 4,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Minotaur Aggressor", "Creature", "Minotaur Berserker", "RTR", "Red", "6 Gray, 1 Red", 6, 2,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Mizzium Mortars", "Sorcery", "RTR", "Red", "1 Gray, 1 Red", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_description)
VALUES("Pursuit of Flight", "Enchantment", "Aura", "RTR", "Red", "1 Gray, 1 Red", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Pyroconvergence", "Enchantment", "RTR", "Red", "4 Gray, 1 Red", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_description)
VALUES("Racecourse Fury", "Enchantment", "Aura", "RTR", "Red", "1 Red", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Splatter Thug", "Creature", "Human Warrior", "RTR", "Red", "2 Gray, 1 Red", 2, 2,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Street Spasm", "Instant", "RTR", "Red", "X Gray, 1 Red", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Survey the Wreckage", "Sorcery", "RTR", "Red", "4 Gray, 1 Red", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Tenement Crasher", "Creature", "Beast", "RTR", "Red", "5 Gray, 1 Red", 5, 4,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Traitorous Instinct", "Sorcery", "RTR", "Red", "3 Gray, 1 Red", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Utvara Hellkite", "Creature", "Dragon", "RTR", "Red", "6 Gray, 2 Red", 6, 6,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Vandalblast", "Sorcery", "RTR", "Red", "1 Red", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Viashino Racketeer", "Creature", "Viashino Rogue", "RTR", "Red", "2 Gray, 1 Red", 2, 1,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Aerial Predation", "Instant", "RTR", "Green", "2 Gray, 1 Green", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Archweaver", "Creature", "Spider", "RTR", "Green", "5 Gray, 2 Green", 5, 5, "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Axebane Guardian", "Creature", "Human Druid", "RTR", "Green", "2 Gray, 1 Green", 0, 3,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Axebane Stag", "Creature", "Elk", "RTR", "Green", "6 Gray, 1 Green", 6, 7,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Brushstrider", "Creature", "Beast", "RTR", "Green", "1 Gray, 1 Green", 3, 1,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Centaur's Herald", "Creature", "Elf Scout", "RTR", "Green", "1 Green", 0, 1,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Chorus of Might", "Instant", "RTR", "Green", "3 Gray, 1 Green", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Deadbridge Goliath", "Creature", "Insect", "RTR", "Green", "2 Gray, 2 Green", 5, 5,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Death's Presence", "Enchantment", "RTR", "Green", "5 Gray, 1 Green", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Drudge Beetle", "Creature", "Insect", "RTR", "Green", "1 Gray, 1 Green", 2, 2,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Druid's Deliverance", "Instant", "RTR", "Green", "1 Gray, 1 Green", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Gatecreeper Vine", "Creature", "Plant", "RTR", "Green", "1 Gray, 1 Green", 0, 2,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Giant Growth", "Instant", "RTR", "Green", "1 Green", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Gobbling Ooze", "Creature", "Ooze", "RTR", "Green", "4 Gray, 1 Green", 3, 3,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Golgari Decoy", "Creature", "Elf Rogue", "RTR", "Green", "3 Gray, 1 Green", 2, 2,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Horncaller's Chant", "Sorcery", "RTR", "Green", "7 Gray, 1 Green", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Korozda Monitor", "Creature", "Lizard", "RTR", "Green", "2 Gray, 2 Green", 3, 3,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Mana Bloom", "Enchantment", "RTR", "Green", "X Gray, 1 Green", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Oak Street Innkeeper", "Creature", "Elf", "RTR", "Green", "2 Gray, 1 Green", 1, 2,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Rubbleback Rhino", "Creature", "Rhino", "RTR", "Green", "4 Gray, 1 Green", 3, 4,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Savage Surge", "Instant", "RTR", "Green", "1 Gray, 1 Green", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Seek the Horizon", "Sorcery", "RTR", "Green", "3 Gray, 1 Green", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Slime Molding", "Sorcery", "RTR", "Green", "X Gray, 1 Green", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Stonefare Crocodile", "Creature", "Crocodile", "RTR", "Green", "2 Gray, 1 Green", 3, 2,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Towering Indrik", "Creature", "Beast", "RTR", "Green", "3 Gray, 1 Green", 2, 4,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_description)
VALUES("Urban Burgeoning", "Enchanting", "Aura", "RTR", "Green", "1 Green", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Wild Beastmaster", "Creature", "Human Shaman", "RTR", "Green", "2 Gray, 1 Green", 1, 1,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Worldspine Wurm", "Creature", "Wurm", "RTR", "Green", "8 Gray, 3 Green", 15, 15,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Abrupt Decay", "Instant", "RTR", "Black/Green", "1 Black, 1 Green", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Archon of the Triumvirate", "Creature", "Archon", "RTR", "White/Blue", "5 Gray, 1 White, 1 Blue", 4, 5,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Armada Wurm", "Creature", "Wurm", "RTR", "Green/White", "2 Gray, 2 Green, 2 White", 5, 5,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Auger Spree", "Instant", "RTR", "Black/Red", "1 Gray, 1 Black, 1 Red", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Azorius Charm", "Instant", "RTR", "White/Blue", "1 White, 1 Blue", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Call of the Conclave", "Sorcery", "RTR", "Green/White", "1 Green, 1 White", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Carnival Hellsteed", "Creature", "Nightmare Horse", "RTR", "Black/Red", "4 Gray, 1 Black, 1 Red", 5, 4,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Centaur Healer", "Creature", "Centaur Cleric", "RTR", "Green/White", "1 Gray, 1 Green, 1 White", 3, 3,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Chemister's Trick", "Instant", "RTR", "Blue/Red", "1 Blue, 1 Red", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Collective Blessing", "Enchantment", "RTR", "Green/White", "3 Gray, 2 Green, 1 White", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Common Bond", "Instant", "RTR", "Green/White", "1 Gray, 1 Green, 1 White", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Corpsejack Menace", "Creature", "Fungus", "RTR", "Black/Green", "2 Gray, 1 Black, 2 Green", 4, 4,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Counterflux", "Instant", "RTR", "Blue/Red", "2 Blue, 1 Red", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Coursers' Accord", "Sorcery", "RTR", "Green/White", "4 Gray, 1 Green, 1 White", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Detention Sphere", "Enchantment", "RTR", "White/Blue", "1 Gray, 1 White, 1 Blue", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Dramatic Rescue", "Instant", "RTR", "White/Blue", "1 White, 1 Blue", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Dreadbore", "Sorcery", "RTR", "Black/Red", "1 Black, 1 Red", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Dreg Mangler", "Creature", "Plant Zombie", "RTR", "Black/Green", "1 Gray, 1 Black, 1 Green", 3, 3,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Epic Experiment", "Sorcery", "RTR", "Blue/Red", "X Gray, 1 Blue, 1 Red", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Essence Backlash", "Instant", "RTR", "Blue/Red", "2 Gray, 1 Blue, 1 Red", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Fall of the Gavel", "Instant", "RTR", "White/Blue", "3 Gray, 1 White, 1 Blue", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Firemind's Foresight", "Instant", "RTR", "Blue/Red", "5 Gray, 1 Blue, 1 Red", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Goblin Electromancer", "Creature", "Goblin Wizard", "RTR", "Blue/Red", "1 Blue, 1 Red", 2, 2,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Golgari Charm", "Instant", "RTR", "Black/Green", "1 Black, 1 Green", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Grisly Salvage", "Instant", "RTR", "Black/Green", "1 Black, 1 Green", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Havoc Festival", "Enchantment", "RTR", "Black/Red", "4 Gray, 1 Black, 1 Red", "");


INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Hellhole Flailer", "Creature", "Ogre Warrior", "RTR", "Black/Red", "1 Gray, 1 Black, 1 Red", 3, 2,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Heroes' Reunion", "Instant", "RTR", "Green/White", "1 Green, 1 White", "");


INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Hussar Patrol", "Creature", "Human Knight", "RTR", "White/Blue", "2 Gray, 1 White, 1 Blue", 2, 4,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Hypersonic Dragon", "Creature", "Dragon", "RTR", "Blue/Red", "3 Gray, 1 Blue, 1 Red", 4, 4,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Isperia, Supreme Judge", "Legendary Creature", "Sphinx", "RTR", "White/Blue", "2 Gray, 2 White, 2 Blue", 6, 4,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Izzet Charm", "Instant", "RTR", "Blue/Red", "1 Blue, 1 Red", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Izzet Staticaster", "Creature", "Human Wizard", "RTR", "Blue/Red", "1 Gray, 1 Blue, 1 Red", 0, 3,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Jarad, Golgari Lich Lord", "Legendary Creature", "Zombie Elf", "RTR", "Black/Green", "2 Black, 2 Green", 2, 2,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Jarad's Orders", "Sorcery", "RTR", "Black/Green", "2 Gray, 1 Black, 1 Green", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Korozda Guildmage", "Creature", "Elf Shaman", "RTR", "Black/Green", "1 Black, 1 Green", 2, 2,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Lotleth Troll", "Creature", "Zombie Troll", "RTR", "Black/Green", "1 Black, 1 Green", 2, 1,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Loxodon Smiter", "Creature", "Elephant Soldier", "RTR", "Green/White", "1 Gray, 1 Green, 1 White", 4, 4,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Lyev Skyknight", "Creature", "Human Knight", "RTR", "White/Blue", "1 Gray, 1 White, 1 Blue", 3, 1,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Mercurial Chemister", "Creature", "Human Wizard", "RTR", "Blue/Red", "3 Gray, 1 Blue, 1 Red", 2, 3,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("New Prahv Guildmage", "Creature", "Human Wizard", "RTR", "White/Blue", "1 White, 1 Blue", 2, 2,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Nivix Guildmage", "Creature", "Human Wizard", "RTR", "Blue/Red", "1 Blue, 1 Red", 2, 2,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Niv-Mizzet, Dracogenius", "Legendary Creature", "Dragon Wizard", "RTR", "Blue/Red", "2 Gray, 2 Blue, 2 Red", 5, 5,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Rakdos Charm", "Instant", "RTR", "Black/Red", "1 Black, 1 Red", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Rakdos Ragemutt", "Creature", "Elemental Hound", "RTR", "Black/Red", "3 Gray, 1 Black, 1 Red", 3, 3,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Rakdos Ringleader", "Creature", "Skeleton Warrior", "RTR", "Black/Red", "4 Gray, 1 Black, 1 Red", 3, 1,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Rakdos, Lord of Riots", "Legendary Creature", "Demon", "RTR", "Black/Red", "Two Black, Two Red", 6,6, "You can’t cast this spell unless an opponent lost life this turn. Flying, trample Creature spells you cast cost {1} less to cast for each 1 life your opponents have lost this turn.");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Rakdos's Return", "Sorcery", "RTR", "Black/Red", "X Gray, 1 Black, 1 Red", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_description)
VALUES("Righteous Authority", "Enchantment", "Aura", "RTR", "White/Blue", "3 Gray, 1 White, 1 Blue", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Risen Sanctuary", "Creature", "Elemental", "RTR", "Green/White", "5 Gray, 1 Green, 1 White", 8, 8,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Rites of Reaping", "Sorcery", "RTR", "Black/Green", "4 Gray, 1 Black, 1 Green", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Rix Maadi Guildmage", "Creature", "Human Shaman", "RTR", "Black/Red", "1 Black, 1 Red", 2, 2,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Search Warrant", "Sorcery", "RTR", "White/Blue", "1 White, 1 Blue", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Selesnya Charm", "Instant", "RTR", "Green/White", "1 Green, 1 White", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Skull Rend", "Sorcery", "RTR", "Black/Red", "3 Gray, 1 Black, 1 Red", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Skymark Roc", "Creature", "Bird", "RTR", "White/Blue", "2 Gray, 1 White, 1 Blue", 3, 3,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Slaughter Games", "Sorcery", "RTR", "Black/Red", "2 Gray, 1 Black, 1 Red", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Sluiceway Scorpion", "Creature", "Scorpion", "RTR", "Black/Green", "2 Gray, 1 Black, 1 Green", 2, 2,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Spawn of Rix Maadi", "Creature", "Horror", "RTR", "Black/Red", "3 Gray, 1 Black, 1 Red", 5, 3,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Sphinx's Revelation", "Instant", "RTR", "White/Blue", "X Gray, 1 White, 2 Blue", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Supreme Verdict", "Sorcery", "RTR", "White/Blue", "1 Gray, 2 White, 1 Blue", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Teleportal", "Sorcery", "RTR", "Blue/Red", "1 Blue, 1 Red", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Thoughtflare", "Instant", "RTR", "Blue/Red", "3 Gray, 1 Blue, 1 Red", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Treasured Find", "Sorcery", "RTR", "Black/Green", "1 Black, 1 Green", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Trestle Troll", "Creature", "Troll", "RTR", "Black/Green", "1 Gray, 1 Black, 1 Green", 1, 4,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Trostani, Selesnya's Voice", "Legendary Creature", "Dryad", "RTR", "Green/White", "2 Green, 2 White", 2, 5,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Vitu-Ghazi Guildmage", "Creature", "Dryad Shaman", "RTR", "Green/White", "1 Green, 1 White", 2, 2,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_description)
VALUES("Vraska the Unseen", "Planeswalker", "Vraska", "RTR", "Black/Green", "3 Gray, 1 Black, 1 Green","");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_description)
VALUES("Wayfaring Temple", "Creature", "Elemental", "RTR", "Green/White", "1 Gray, 1 Green, 1 White","");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Azor's Elocutors", "Creature", "Human Advisor", "RTR", "White/Blue", "3 Gray, 2 Blue/White", 3, 5,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Blistercoil Weird", "Creature", "Weird", "RTR", "Blue/Red", "1 Blue/Red", 1, 1,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Cryptborn Horror", "Creature", "Horror", "RTR", "Black/Red", "1 Gray, 2 Black/Red", 0, 0,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Deathrite Shaman", "Creature", "Elf Shaman", "RTR", "Black/Green", "1 Black/Green", 1, 2,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Dryad Militant", "Creature", "Dryad Soldier", "RTR", "Green/White", "1 Green/White", 2, 1,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Frostburn Weird", "Creature", "Weird", "RTR", "Blue/Red", "2 Blue/Red", 1, 4,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Golgari Longlegs", "Creature", "Insect", "RTR", "Black/Green", "3 Gray, 2 Black/Green", 5, 4,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Growing Ranks", "Enchantment", "RTR", "Green/White", "2 Gray, 2 White/Green", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Judge's Familiar", "Creature", "Bird", "RTR", "White/Blue", "1 White/Blue", 1, 1,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Nivmagus Elemental", "Creature", "Elemental", "RTR", "Blue/Red","1 Blue/Red", 1, 2,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Rakdos Cackler", "Creature", "Devil", "RTR", "Black/Red","1 Black/Red", 1, 1,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Rakdos Shred-Freak", "Creature", "Human Berserker", "RTR", "Black/Red","2 Black/Red", 2, 1,"");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Slitherhead", "Creature", "Plant Zombie", "RTR", "Black/Green", "1 Black/Green", 1, 1,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Sundering Growth", "Instant", "RTR", "Green/White", "2 Green/White", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Vassal Soul", "Creature", "Spirit", "RTR", "White/Blue","1 Gray, 2 White/Blue", 2, 2,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_cost, card_description)
VALUES("Azorius Keyrune", "Artifact", "RTR", "3 Gray", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_cost, card_description)
VALUES("Chromatic Lantern", "Artifact", "RTR", "3 Gray", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_cost, card_description)
VALUES("Civic Saber", "Artifact", "Equipment", "RTR", "1 Gray", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_cost, card_description)
VALUES("Codex Shredder", "Artifact", "RTR", "1 Gray", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_cost, card_description)
VALUES("Golgari Keyrune", "Artifact", "RTR", "3 Gray", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_cost, card_description)
VALUES("Izzet Keyrune", "Artifact", "RTR", "3 Gray", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_cost, card_description)
VALUES("Pithing Needle", "Artifact", "RTR", "1 Gray", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_cost, card_description)
VALUES("Rakdos Keyrune", "Artifact", "RTR", "3 Gray", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_cost, card_description)
VALUES("Selesnya Keyrune", "Artifact", "RTR", "3 Gray", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_cost, card_attack, card_defense, card_description)
VALUES("Street Sweeper", "Artifact Creature", "Construct", "RTR", "6 Gray", 4, 6,"");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_cost, card_description)
VALUES("Tablet of the Guilds", "Artifact", "RTR", "2 Gray", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_cost, card_attack, card_defense, card_description)
VALUES("Volatile Rig", "Artifact Creature", "Construct", "RTR", "4 Gray", 4, 4,"");


INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_description)
VALUES("Azorius Guildgate", "Land", "Gate", "RTR", "White/Blue", "");


INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_description)
VALUES("Blood Crypt", "Land", "Swamp Mountain", "RTR", "Black/Red", "");


INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_description)
VALUES("Golgari Guildgate", "Land", "Gate", "RTR", "Black/Green", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_description)
VALUES("Grove of the Guardian", "Land", "RTR", "Gray", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_description)
VALUES("Hallowed Fountain", "Land", "Plains Island", "RTR", "White/Blue", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_description)
VALUES("Izzet Guildgate", "Land", "Gate", "RTR", "Blue/Red", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_description)
VALUES("Overgrown Tomb", "Land", "Swamp Forest", "RTR", "Black/Green",  "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_description)
VALUES("Rakdos Guildgate", "Land", "Gate", "RTR", "Black/Red", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_description)
VALUES("Rogue's Passage", "Land", "RTR", "Gray", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_description)
VALUES("Selesnya Guildgate", "Land", "Gate", "RTR", "Green/White", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_description)
VALUES("Steam Vents", "Land", "Island Mountain", "RTR", "Blue/Red", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_description)
VALUES("Temple Garden", "Land", "Forest Plains", "RTR", "Green/White", "");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_description)
VALUES("Transguild Promenade", "Land", "RTR", "Any", "");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color)
VALUES("Plains", "Basic Land", "Plains", "RTR", "White");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color)
VALUES("Island", "Basic Land", "Island", "RTR", "Blue");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color)
VALUES("Swamp", "Basic Land", "Swamp", "RTR", "Black");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color)
VALUES("Mountain", "Basic Land", "Mountain", "RTR", "Red");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color)
VALUES("Forest", "Basic Land", "Forest", "RTR", "Green");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Cower in Fear", "Instant", "M13", "Black", "1 Gray, 2 Black", " Creatures your opponents control get -1/-1 until end of turn. You will fully understand fear when you discover it is the final thing you put your faith in. —Nicol Bolas");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Blood Reckoning", "Enchantment", "M13", "Black", "3 Gray, 1 Black", "Whenever a creature attacks you or a planeswalker you control, that creature's controller loses 1 life. There is no greater folly than standing against me. —Nicol Bolas");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Zombie Goliath", "Creature", "Zombie Giant", "M13", "Black", "4 Gray, 1 Black", 4, 3,"Removing the encumbrance of useless brain tissue grants several advantages: a slight increase in mobility, a response of revulsion and horror from the enemy, and, in the case of large specimens, room for passengers. —Zul Ashur, lich lord");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Tormented Soul", "Creature", "Spirit", "M13", "Black", "1 Black", 1, 1,"Tormented Soul can't block and can't be blocked. Those who raged most bitterly at the world in life are cursed to roam the nether realms in death.");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Ravenous Rats", "Creature", "Rat", "M13", "Black", "1 Gray, 1 Black", 1, 1," When Ravenous Rats enters the battlefield, target opponent discards a card. Devouring books is only the beginning. The librarian's next.");

INSERT INTO mtg_cards
(card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Canyon Minotaur", "Creature", "Minotaur Warrior", "M13", "Red","3 Gray, 1 Red", 3, 3,"We'll scale these cliffs, traverse Brittle Bridge, and then fight our way down the volcanic slopes on the other side. Isn't the shortest route through the canyon? Yes. So shouldn't we— No.");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", 254, "Mountain", 12, "Basic Land");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", 253, "Swamp", 12, "Basic Land");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", 245, "Rakdos Guildgate", 1, "Land - Gate");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", 89, "Bellows Lizard", 1, "Creature");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", 90, "Bloodfray Giant", 1, "Creature");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", 261, "Canyon Minotaur", 2, "Creature");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", 148, "Carnival Hellsteed", 1, "Creature");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", 213, "Cryptborn Horror", 1, "Creature");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", 97, "Gore-House Chainwalker", 2, "Creature");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", 168, "Hellhole Flailer", 1, "Creature");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", 101, "Minotaur Aggressor", 1, "Creature");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", 221, "Rakdos Cackler", 2, "Creature");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", 222, "Rakdos Shred-Freak", 2, "Creature");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", 260, "Ravenous Rats", 1, "Creature");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", 193, "Rix Maadi Guildmage", 1, "Creature");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", 75, "Sewer Shambler", 1, "Creature");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", 200, "Spawn of Rix Maadi", 1, "Creature");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", 259, "Tormented Soul", 3, "Creature");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", 258, "Zombie Goliath", 2, "Creature");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", 257, "Blood Reckoning", 1, "Enchantment");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", 83, "Crippling Blight", 2, "Enchantment");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", 65, "Deviant Glee", 1, "Enchantment");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", 76, "Shrieking Affliction", 2, "Enchantment");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", 145, "Auger Spree", 1, "Instant");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", 256, "Cower in Fear", 1, "Instant");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", 57, "Assassin's Strike", 1, "Sorcery");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", 70, "Mind Rot", 1, "Sorcery");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", 110, "Traitorous Instinct", 1, "Sorcery");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", 233, "Rakdos Keyrune", 2, "Artifact");