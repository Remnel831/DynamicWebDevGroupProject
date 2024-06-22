<?php
require_once('./models/DeckModel.php');

class DeckController {

    public function viewDeck($deck_id) {
        $deckModel = new DeckModel();
        $decks = $deckModel->getAllDecks();
        $currentDeck = $deckModel->getCurrentDeck($deck_id);
        $data = [
            'title' => 'Welcome to Our Deck Collection',
            'content' => 'Explore our collection of decks.',
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
