<?php
// models/CardModel.php

require_once(__DIR__ . '/../config/database.php');

class CardModel {

    private $conn;

    public function __construct() {
        $this->conn = getConnection(); // Assumes getConnection() function from database.php
    }

    public function getAllCards() {
        $querylist = 'SELECT * FROM mtg_cards';
        $statement1 = $this->conn->prepare($querylist);
        $statement1->execute();
        $cardList = $statement1->fetchAll();
        return $cardList;
    }

}
?>
