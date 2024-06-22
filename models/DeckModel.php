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

    // Add other CRUD methods as needed (addDeck, updateDeck, deleteDeck)
}
?>
