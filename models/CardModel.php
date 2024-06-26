<?php
// models/CardModel.php

require_once(__DIR__ . '/../config/database.php');

class CardModel {

    private $conn;

    public function __construct() {
        $this->conn = getConnection(); // Assumes getConnection() function from database.php
    }

    public function getCardsFromCurrentDeck($deck_id) {
        $query = "SELECT card_id, card_name, card_type, card_subtype, 
        card_set_code, card_color, card_cost, card_attack, card_defense, card_description
        FROM mtg_deck_cards_view WHERE deck_id = :deckId";
        $statement = $this->conn->prepare($query);
        $statement->bindParam(':deckId', $deck_id);
        $statement->execute();
        $cardList = $statement->fetchAll();
        
        return $cardList;
    }

}
?>
