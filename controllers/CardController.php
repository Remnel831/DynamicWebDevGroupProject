<?php
require_once('./models/CardModel.php');

class CardController {
    private $cardModel;

    public function __construct(CardModel $cardModel) {
        $this->cardModel = $cardModel;
    }
    public function index() {
        $cards = $this->cardModel->getAllCards();
        $data = [
            'cards' => $cards
        ];
        $this->loadView('all_cards', $data);
    }
    public function getAllCards() {
        // Logic to list all decks
        $cards = $this->cardModel->getAllCards();
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
