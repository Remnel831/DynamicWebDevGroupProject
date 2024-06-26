<?php
// models/DeckModel.php

require_once(__DIR__ . '/../config/database.php');

class DeckModel {

    private $conn;

    public function __construct() {
        $this->conn = getConnection(); // Assumes getConnection() function from database.php
    }

    public function getAllDecks() {
        $sql = "SELECT * FROM mtg_decks";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        
        // Fetch all results
        $decks = $stmt->fetchAll(PDO::FETCH_ASSOC);
        
        return $decks;
    }

    public function deleteDeck($deckId) {
        // Delete related rows in mtg_decks_cards table (if applicable)
        $sqlDeleteCards = "DELETE FROM mtg_decks_cards WHERE deck_id = :deckId";
        $stmtDeleteCards = $this->conn->prepare($sqlDeleteCards);
        $stmtDeleteCards->bindValue(":deckId", $deckId);
        $stmtDeleteCards->execute();
    
        // Delete the deck itself from mtg_decks table
        $sqlDeleteDeck = "DELETE FROM mtg_decks WHERE deck_id = :deckId";
        $stmtDeleteDeck = $this->conn->prepare($sqlDeleteDeck);
        $stmtDeleteDeck->bindValue(":deckId", $deckId);
        $stmtDeleteDeck->execute();
    
        // Check if any rows were affected
        $rowsDeleted = $stmtDeleteDeck->rowCount();
    
        // Return true if rows were affected, false otherwise
        return ($rowsDeleted > 0);
    }
    

    public function getCurrentDeck($deckId) {
        $sql = "SELECT deck_id, deck_name FROM mtg_decks WHERE deck_id = :deckId";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindValue(":deckId", $deckId);
        $stmt->execute();
        // Fetch the result
        $deck = $stmt->fetch(PDO::FETCH_ASSOC);
        
        return $deck;
    }

    public function addDeck($deckName) {
        $sql = "INSERT INTO mtg_decks (deck_name) VALUES (:deckName)";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindValue(":deckName", $deckName);
        $stmt->execute();
        return $this->conn->lastInsertId();
    }

    public function updateDeck($deckId, $deckData) {
        $sql = "UPDATE mtg_decks SET column1 = :value1, column2 = :value2 WHERE id = :deckId";
        $stmt = $this->conn->prepare($sql);
        // Bind values from $deckData and $deckId
        $stmt->bindValue(":deckId", $deckId);
        foreach ($deckData as $key => $value) {
            $stmt->bindValue(":$key", $value);
        }
        $stmt->execute();
        return $stmt->rowCount();
    }
    // Add other CRUD methods as needed (addDeck, updateDeck, deleteDeck)
}
?>
