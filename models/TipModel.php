<?php
// models/TipModel.php

require_once(__DIR__ . '/../config/database.php');

class TipModel {

    private $conn;

    public function __construct() {
        $this->conn = getConnection(); // Assumes getConnection() function from database.php
    }
    public function getAllTips(){
        $queryTips = "SELECT * FROM mtg_tips";
        $statement = $this->conn->prepare($queryTips);
        $statement->execute();
        $tipList = $statement->fetchAll();
        $statement->closeCursor();

        return $tipList;
    }

}
?>
