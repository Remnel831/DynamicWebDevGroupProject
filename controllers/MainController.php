<?php
require_once('./models/DeckModel.php');

class MainController {
    public function index() {
        $data = $this->loadModelData();
        
        // Process data or perform actions based on the data
        
        // Load the view and pass data to it
        $this->loadView('main_page', $data);
    } 
    private function loadView($viewName, $data) {
        extract($data);
        
        include("views/{$viewName}.php");
    }
}