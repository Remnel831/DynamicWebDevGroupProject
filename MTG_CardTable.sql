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
    card_creature_type varchar(20),
    card_set_code varchar(60),
    card_color varchar(15),
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
    deck_card_name varchar(40)
    
);

INSERT INTO mtg_card_type
(type_name,type_description)
VALUES("Legendary Creature", "A creature is a permanent.  You may only control one copy of a legendary creature at a time.");

INSERT INTO mtg_card_type
(type_name, type_description)
VALUES("Creature", "Creature designations are given to certain cards based on the creature they represent.");

INSERT INTO mtg_card_type
(type_name, type_description)
VALUES("Enchantment - Aura", "An enchantment subtype. Aura spells target objects or players, and Aura permanents are attached to objects or players.");

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


INSERT INTO mtg_cards
(card_name, card_type, card_creature_type, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Rakdos, Lord of Riots", "Legendary Creature", "Demon", "RTR", "Black/Red", "Two Black, Two Red", 6,6, "You can’t cast this spell unless an opponent lost life this turn. Flying, trample Creature spells you cast cost {1} less to cast for each 1 life your opponents have lost this turn.");

INSERT INTO mtg_cards
(card_name, card_type, card_creature_type, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Angel of Serenity", "Creature", "Angel", "RTR", "White", "4 Gray, 3 White", 5,6, "Flying When Angel of Serenity enters the battlefield, you may exile up to three other target creatures from the battlefield and/or creature cards from graveyards. When Angel of Serenity leaves the battlefield, return the exiled cards to their owners’ hands.");

INSERT INTO mtg_cards
(card_name, card_type, card_creature_type, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Armory Guard", "Creature", "Giant Soldier", "RTR", "White", "3 Gray, 1 White", 2,5, "Armory Guard has vigilance as long as you control a Gate. The Dimir agents watched from the shadows. “Eight hours, and I’ve yet to see him blink,” Nefara hissed. “I suggest we find another way in.”");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Arrest", "Enchantment - Aura", "RTR", "White", "2 Gray, 1 White", "Enchant creature Enchanted creature can’t attack or block, and its activated abilities can’t be activated. “We will prove your guilt. We don’t arrest the innocent, you know.”—Arrester Lavinia, Tenth Precinct");

INSERT INTO mtg_cards
(card_name, card_type, card_set_code, card_color, card_cost, card_description)
VALUES("Avenging Arrow", "Instant", "RTR", "White", "2 Gray, 1 White", "Destroy target creature that dealt damage this turn. “Forgive the theft. Punish the deception.” —Alcarus, Selesnya archer");

INSERT INTO mtg_cards
(card_name, card_type, card_creature_type, card_set_code, card_color, card_cost, card_attack, card_defense, card_description)
VALUES("Azorius Arrester", "Creature", "Human Soldier", "RTR", "White", "1 Gray, 1 White", 2,1, "When Azorius Arrester enters the battlefield, detain target creature an opponent controls. (Until your next turn, that creature can’t attack or block and its activated abilities can’t be activated.) “You have the right to remain silent. Mostly because I tire of your excuses.”");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", NULL, "Mountain", 12, "Basic Land");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", NULL, "Swamp", 12, "Basic Land");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", NULL, "Rakdos Guildgate", 1, "Land - Gate");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", NULL, "Bellows Lizard", 1, "Creature");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", NULL, "Bloodfray Giant", 1, "Creature");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", NULL, "Canyon Minotaur", 2, "Creature");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", NULL, "Carnival Hellsteed", 1, "Creature");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", NULL, "Cryptborn Horror", 1, "Creature");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", NULL, "Gore-House Chainwalker", 2, "Creature");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", NULL, "Hellhole Flailer", 1, "Creature");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", NULL, "Minotaur Aggressor", 1, "Creature");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", NULL, "Rakdos Cackler", 2, "Creature");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", NULL, "Rakdos Shred-Freak", 2, "Creature");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", NULL, "Ravenous Rats", 1, "Creature");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", NULL, "Rix Maadi Guildmage", 1, "Creature");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", NULL, "Sewer Shambler", 1, "Creature");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", NULL, "Spawn of Rix Maadi", 1, "Creature");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", NULL, "Tormented Soul", 3, "Creature");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", NULL, "Zombie Goliath", 2, "Creature");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", NULL, "Blood Reckoning", 1, "Enchantment");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", NULL, "Crippling Blight", 2, "Enchantment");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", NULL, "Deviant Glee", 1, "Enchantment");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", NULL, "Shrieking Affliction", 2, "Enchantment");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", NULL, "Auger Spree", 1, "Instant");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", NULL, "Cower in Fear", 1, "Instant");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", NULL, "Assassin's Strike", 1, "Sorcery");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", NULL, "Mind Rot", 1, "Sorcery");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", NULL, "Traitorous Instinct", 1, "Sorcery");

INSERT INTO mtg_decks
(deck_id, deck_name, deck_card_id, deck_card_name, deck_card_count, deck_card_type)
VALUES(1, "Rakdos Raid", NULL, "Rakdos Keyrune", 2, "Artifact");