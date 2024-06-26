<?php
require_once('./models/DeckModel.php');
require_once('./models/CardModel.php'); // Include the CardModel

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
        $cardModel = new CardModel(); // Instantiate CardModel

        $currentDeck = $deckModel->getCurrentDeck($deck_id);
        $cards = $cardModel->getCardsFromCurrentDeck($deck_id); // Fetch cards from the model

        if (!empty($currentDeck)) {
            $_SESSION['currentDeck'] = $currentDeck['deck_id'];
        }
        if ($_SESSION['currentDeck'] === $_SESSION['favoriteDeck']) {
            $favoriteBtnMsg = '💛 Favorited 💛';
        } else {
            $favoriteBtnMsg = '❤ Click to favorite ❤';
        }
        
        $data = [
            'currentDeck' => $currentDeck,
            'cards' => $cards,
            'favorite_deck' => $favoriteBtnMsg
        ];
        $this->loadView('deck_view', $data);
    }

    public function toggleFavorite($deck_id) {
        if ($_SESSION['favoriteDeck'] === $deck_id) {
            $_SESSION['favoriteDeck'] = 0;
        } else {
            $_SESSION['favoriteDeck'] = $deck_id;
        }
        
        // Redirect back to viewDeck for display update
        $this->viewDeck($deck_id);
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
    
    private function loadView($viewName, $data = []) {
        include("views/{$viewName}.php");
    }
}
?>
