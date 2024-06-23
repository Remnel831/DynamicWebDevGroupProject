<?php

session_start();

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
    case 'cards':
        include('controllers/CardController.php'); // Example controller for cards
        $controller = new CardController();
        $controller->listCards();
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
    default:
        // Handle 404 page
        http_response_code(404);
        include('views/404.php');
        break;
}