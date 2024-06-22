<?php
// controllers/DeckController.php

require_once(__DIR__ . '/../models/DeckModel.php');

class DeckController {
    
    private $deckModel;

    public function __construct() {
        $this->deckModel = new DeckModel();
    }

    public function listDecks() {
        $decks = $this->deckModel->getAllDecks();
        include(__DIR__ . '/../views/deck_list.php');
    }

    public function addDeck() {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $name = $_POST['name'];
            $description = $_POST['description'];
            $this->deckModel->addDeck($name, $description);
            // Redirect after adding deck (optional)
            header("Location: index.php?action=list_decks");
            exit();
        }
        include(__DIR__ . '/../views/add_deck.php');
    }

    // Other methods as needed (viewDeck, editDeck, deleteDeck)
}
?>
