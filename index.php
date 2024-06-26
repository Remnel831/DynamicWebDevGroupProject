<?php
session_set_cookie_params(0, '/');
session_start();

// Initialize session variables if not set
if (empty($_SESSION['currentDeck'])) {
    $_SESSION['currentDeck'] = 0;
}
if (empty($_SESSION['favoriteDeck'])) {
    $_SESSION['favoriteDeck'] = 0;
}

require_once('./models/DeckModel.php');
require_once('./models/CardModel.php');
require_once('ManaIcon.php');

// Instantiate models for dependency injection
$deckModel = new DeckModel();
$cardModel = new CardModel();

$action = $_GET['action'] ?? 'main_page';
$deck_id = $_GET['deck_id'] ?? null;
$deck_name = $_POST['deck_name'] ?? null;

switch ($action) {
    case 'main_page':
        require_once('controllers/MainController.php');
        $controller = new MainController();
        $controller->index();
        break;

    case 'all_decks':
        require_once('controllers/DeckController.php');
        $controller = new DeckController($deckModel, $cardModel);
        $controller->index();
        break;

    case 'deck':
        if ($deck_id) {
            $_SESSION['currentDeck'] = $deck_id; // Saves last deck loaded in
        }
        require_once('controllers/DeckController.php');
        $controller = new DeckController($deckModel, $cardModel);
        $controller->viewDeck($deck_id);
        break;

    case 'delete_deck':
        if ($deck_id) {
            require_once('controllers/DeckController.php');
            $controller = new DeckController($deckModel, $cardModel);
            $controller->deleteDeck($deck_id);
        }
        break;

    case 'all_cards':
        require_once('controllers/CardController.php');
        $controller = new CardController();
        $controller->index();
        break;

    case 'add_deck':
        if ($deck_name) {
            require_once('controllers/DeckController.php');
            $controller = new DeckController($deckModel, $cardModel);
            $controller->addDeck($deck_name);
        }
        break;
    case 'edit_deck':
        $deck_id = $_GET['deck_id'];
        header("Location: views/edit_deck_form.php?deck_id=$deck_id");
        break;
    case 'add_card':
        require_once('controllers/CardController.php');
        $controller = new CardController();
        $controller->addCard();
        break;

    case 'toggle_favorite': // Saves a favorite deck
        require_once('controllers/DeckController.php');
        $deck_id = $_SESSION['currentDeck'];
        $controller = new DeckController($deckModel, $cardModel);
        $controller->toggleFavorite($deck_id);
        break;

    default:
        // Handle 404 page
        http_response_code(404);
        require_once('views/404.php');
        break;
}
