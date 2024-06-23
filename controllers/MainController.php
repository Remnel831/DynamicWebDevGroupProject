<?php
require_once('./models/DeckModel.php');

class MainController {
    public function index() {
        $data = $this->loadModelData();
        
        // Process data or perform actions based on the data
        
        // Load the view and pass data to it
        $this->loadView('main_page', $data);
    }
    
    private function loadModelData() {
        // Instantiate the DeckModel
        $deckModel = new DeckModel();
        // Add the fetched cards to the data array
        $decks = $deckModel->getAllDecks();
        
        // Prepare the data to be returned, including the decks
        $data = [
            'title' => 'Welcome to Our Deck Collection',
            'content' => 'Explore our collection of decks.',
            'decks' => $decks // Add the fetched decks to the data array
        ];
        
        return $data;
    }
    
    private function loadView($viewName, $data) {
        // Extract data to variables for the view
        extract($data);
        
        // Include the view file
        include("views/{$viewName}.php");
    }
}