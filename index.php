<?php

require_once('database.php');

$action = filter_input(INPUT_POST, 'action');

if ($action == NULL) {
    $action = filter_input(INPUT_GET, 'action');
    if ($action == NULL) {
        $action = 'welcome';
    }
}

switch($action) {
    case 'welcome':
        include('welcome.php');
        break;
    case 'card_view':
        include('card_view.php');
        break;
    case 'type_view':
        include('type_view.php');
        break;
    case 'deck_view':
        include('deck_view.php');
        break;
}
?>
