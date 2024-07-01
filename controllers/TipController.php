<?php
require_once('./models/TipModel.php');

class TipController {
    private $tipModel;

    public function __construct(tipModel $tipModel) {
        $this->tipModel = $tipModel;
    }
    public function index() {
        $tips = $this->tipModel->getAllTips();
        $data = [
            'tips' => $tips
        ];
        $this->loadView('tips_view', $data);
    }

    private function loadView($viewName, $data) {
        include("views/{$viewName}.php");
    }
}
?>
