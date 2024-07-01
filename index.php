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
require_once('./views/ManaView.php');
require_once('./models/TipModel.php');
// Instantiate models for dependency injection
$deckModel = new DeckModel();
$cardModel = new CardModel();
$tipModel = new TipModel();

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
        $controller = new CardController($cardModel);
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
        if ($deck_id) {
            require_once('controllers/DeckController.php');
            $controller = new DeckController($deckModel, $cardModel);
            $controller->editDeck($deck_id);
        }
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
	
	case 'tips_view':
        require_once('controllers/TipController.php');
        $controller = new TipController($tipModel);
        $controller->index();
        break;
	case 'about_view':
        require_once('controllers/AboutController.php');
        $controller = new AboutController();
        $controller->index();
        break;

    default:
        // Handle 404 page
        http_response_code(404);
        require_once('views/404.php');
        break;
}
