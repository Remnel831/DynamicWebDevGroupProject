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
    public function updateCardQuantity($card_id, $deck_id, $card_count) {
        if ($card_id !== false && $deck_id !== false && $card_count !== false) {
            $query = 'UPDATE mtg_decks_cards
                      SET card_count = :card_count
                      WHERE card_id = :card_id
                      AND deck_id = :deck_id';
            $statement = $this->conn->prepare($query);
            $statement->bindValue(':card_count', $card_count);
            $statement->bindValue(':card_id', $card_id);
            $statement->bindValue(':deck_id', $deck_id);
            $success = $statement->execute();
            return $success;
        }
    }
    public function deleteCard($card_id, $deck_id) {
        if ($card_id !== false && $deck_id !== false) {
            $query = 'DELETE FROM mtg_decks_cards
                      WHERE card_id = :card_id
                      AND deck_id = :deck_id';
            $statement = $this->conn->prepare($query);
            $statement->bindValue(':card_id', $card_id);
            $statement->bindValue(':deck_id', $deck_id);
            $success = $statement->execute();
            $statement->closeCursor();

            return $success;
        }
    }
}
?>

