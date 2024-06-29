<?php
class AboutController {
    public function index() {
        $data = [];
        
        // Process data or perform actions based on the data
        
        // Load the view and pass data to it
        $this->loadView('about_view', $data);
    } 
    private function loadView($viewName, $data) {
        extract($data);
        
        include("views/{$viewName}.php");
    }
}