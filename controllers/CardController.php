<?php
require_once('./models/CardModel.php');

class CardController {
    
    public function index() {
        // Logic to list all decks
        $deckModel = new CardModel();
        $cards = $deckModel->getAllCards();
        $data = [
            'cards' => $cards
        ];
        $this->loadView('cards_view', $data);
    }
    private function loadView($viewName, $data) {
        include("views/{$viewName}.php");
    }
}
?>
