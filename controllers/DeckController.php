<?php
require_once('./models/DeckModel.php');

class DeckController {
    
    public function index() {
        // Logic to list all decks
        $deckModel = new DeckModel();
        $decks = $deckModel->getAllDecks();
        $data = [
            'decks' => $decks
        ];
        $this->loadView('all_decks', $data);
    }
    public function viewDeck($deck_id) {
        $deckModel = new DeckModel();
        $decks = $deckModel->getAllDecks();
        $currentDeck = $deckModel->getCurrentDeck($deck_id);
        $data = [
            'decks' => $decks,
            'currentDeck' => $currentDeck
        ];
        $this->loadView('deck_view', $data);
    }


    private function loadView($viewName, $data) {
        include("views/{$viewName}.php");
    }
}
?>