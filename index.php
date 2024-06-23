<?php
session_set_cookie_params(0, '/');
session_start();
if (empty($_SESSION['currentDeck'])) { $_SESSION['currentDeck'] = 0; }
if (empty($_SESSION['favoriteDecks'])) { $_SESSION['favoriteDecks'] = array(1); }
require_once('config/database.php');
$action = isset($_GET['action']) ? $_GET['action'] : 'main_page';

switch ($action) {
    case 'main_page':
        include('controllers/MainController.php'); // Example controller for main page
        $controller = new MainController();
        $controller->index();
        break;

    case 'all_decks':
            include('controllers/DeckController.php'); // Example controller for main page
            $controller = new DeckController();
            $controller->index();
            break;
            
    case 'deck':
        if (isset($_GET['deck_id'])) {
            $deck_id = $_GET['deck_id'];
        }
        include('controllers/DeckController.php'); // Example controller for decks
        $controller = new DeckController();
        $controller->viewDeck($deck_id);
        break;

    case 'delete_deck':
        if (isset($_GET['deck_id'])) {
            $deck_id = $_GET['deck_id'];
        }
        include('controllers/DeckController.php'); // Example controller for deleting a deck
        $controller = new DeckController();
        $controller->deleteDeck($deck_id);
        break;
    case 'all_cards':
        include('controllers/CardController.php'); // Example controller for cards
        $controller = new CardController();
        $controller->index();
        break;
    case 'add_deck':
        if (isset($_POST['deck_name'])) {
            $deck_name = $_POST['deck_name'];
        }
        include('controllers/DeckController.php'); // Example controller for adding a deck
        $controller = new DeckController();
        $controller->addDeck($deck_name);
        break;
    case 'add_card':
        include('controllers/CardController.php'); // Example controller for adding a card
        $controller = new CardController();
        $controller->addCard();
        break;
	case 'add_favorite': // Saves a favorite deck
		if (isset($_GET['deck_id'])) {
		$deck_id = $_GET['deck_id'];
		$_SESSION['currentDeck'] = $deck_id; //Saves last deck loaded in
        }
		foreach ($_SESSION['favoriteDecks'] as $favDecks){
			if ($favDecks === $_SESSION['currentDeck']){$_SESSION[$favDecks] = 0;}
			else{$_SESSION[$favDecks] = $_SESSION['currentDeck'];}
		;}
		include('controllers/DeckController.php');
		$controller = new DeckController();
        $controller->viewDeck($_SESSION['currentDeck']);
        break;
    default:
        // Handle 404 page
        http_response_code(404);
        include('views/404.php');
        break;
}