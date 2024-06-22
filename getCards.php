<?php
// Database connection details
require_once('database.php');

// SQL query to get cards from the database
$sql = "SELECT card_name, card_type, card_subtype, card_set_code, card_color, card_cost, card_description FROM mtg_cards";
$result = $conn->query($sql);

return $result;
