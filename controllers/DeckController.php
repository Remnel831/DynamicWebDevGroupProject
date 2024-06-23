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

    public function getFavoriteDeck($deck_id) {
        $deckModel = new DeckModel();
        $deckModel->getFavoriteDeck($deck_id);
        header('Location: index.php?action=all_decks');
    }

    public function deleteDeck($deck_id) {
        $deckModel = new DeckModel();
        $deckModel->deleteDeck($deck_id);
        header('Location: index.php?action=all_decks');
    }

    public function addDeck($deck_name) {
        $deckModel = new DeckModel();
        $deckModel->addDeck($deck_name);
        header('Location: index.php?action=all_decks');
    }
    private function loadView($viewName, $data) {
        include("views/{$viewName}.php");
    }
}
?>
