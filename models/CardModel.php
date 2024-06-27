<?php
// models/CardModel.php

require_once(__DIR__ . '/../config/database.php');

class CardModel {

    private $conn;

    public function __construct() {
        $this->conn = getConnection(); // Assumes getConnection() function from database.php
    }
    public function getAllCards($columns = '*') {
        $queryCards = "SELECT $columns
                       FROM mtg_cards";
        $statement = $this->conn->prepare($queryCards);
        $statement->execute();
        $cardList = $statement->fetchAll();
        $statement->closeCursor();

        return $cardList;
    }
    public function getCardList($deck_id, $columns = '*') {
        $queryCards = "SELECT $columns
                       FROM mtg_cards c
                       INNER JOIN mtg_decks_cards dc ON c.card_id = dc.card_id
                       WHERE dc.deck_id = :deck_id";
        $statement = $this->conn->prepare($queryCards);
        $statement->bindValue(':deck_id', $deck_id, PDO::PARAM_INT);
        $statement->execute();
        $cardList = $statement->fetchAll();
        $statement->closeCursor();
    
        return $cardList;
    }
}
?>
