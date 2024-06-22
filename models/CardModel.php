<?php
// models/CardModel.php

require_once(__DIR__ . '/../config/database.php');

class CardModel {

    private $conn;

    public function __construct() {
        $this->conn = getConnection(); // Assumes getConnection() function from database.php
    }

    public function getAllCards() {
        $sql = "SELECT * FROM mtg_cards";
        $result = $this->conn->query($sql);
        $cards = [];
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $cards[] = $row;
            }
        }
        return $cards;
    }

    public function getCardById($id) {
        $id = $this->conn->real_escape_string($id);
        $sql = "SELECT * FROM mtg_cards WHERE id = '$id'";
        $result = $this->conn->query($sql);
        return $result->fetch_assoc();
    }

    // Add other CRUD methods as needed (addCard, updateCard, deleteCard)
}
?>
