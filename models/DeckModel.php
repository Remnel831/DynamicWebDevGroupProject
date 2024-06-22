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
    public function getCurrentDeck($deckId) {
        $sql = "SELECT * FROM mtg_decks WHERE id = :deckId";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindValue(":deckId", $deckId);
        $stmt->execute();
        
        // Fetch the result
        $deck = $stmt->fetch(PDO::FETCH_ASSOC);
        
        return $deck;
    }

    public function addDeck($deckData) {
        $sql = "INSERT INTO mtg_decks (column_names) VALUES (:column_values)";
        $stmt = $this->conn->prepare($sql);
        // Assuming $deckData is an associative array with keys matching your column names
        foreach ($deckData as $key => $value) {
            $stmt->bindValue(":$key", $value);
        }
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
    
    public function deleteDeck($deckId) {
        $sql = "DELETE FROM mtg_decks WHERE id = :deckId";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindValue(":deckId", $deckId);
        $stmt->execute();
        return $stmt->rowCount();
    }
    // Add other CRUD methods as needed (addDeck, updateDeck, deleteDeck)
}
?>
