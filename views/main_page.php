<?php

require_once(__DIR__ . '/../config/database.php');

class TypesManager {
    private $conn;

    public function __construct() {
        $this->conn = getConnection(); // Assumes getConnection() function from database.php
    }

    public function getCardTypes() {
        $queryTypes = 'SELECT *
                       FROM mtg_card_type';
        $statement = $this->conn->prepare($queryTypes);
        $statement->execute();
        $types = $statement->fetchAll();
        $statement->closeCursor();

        return $types;
    }
}

$typeManager = new TypesManager();
$types = $typeManager->getCardTypes();

?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MTG DeckBuilder</title>
        <link rel="stylesheet" href="./assets/css/main_page_styles.css">
    </head>
    <body>
        <nav class="navMenu">
            <a href="index.php">Main Page</a>
            <a href="index.php?action=all_decks"><b>Deck List</b></a>
            <a href="index.php?action=all_cards"><b>Card List</b></a>
        </nav>

        <div class="container">
            <h1>Welcome to the MTG DeckBuilder!</h1>
            <h2>This site is a great way for those getting into Magic: The Gathering
                to get an overview of what each card type does, see what available sets/cards you can build decks from, 
                as well as allowing you to build your own decks!
            </h2>
            <div class="sub-container">
                <h1>The Magic Mini Lesson</h1>
                <h2>Week of 06/30/24</h2>
                <p>The following table has a breakdown of the ten different card types in Magic: The Gathering. This first week
                    is to help you get a general knowledge of each card type and how they differ. Follow along in our series in
                    the coming weeks, where we will go through each different card type and how the interact on the field of play!
                </p>
                <table class="card-types">
                    <tr>
                        <th>Card Type</th>
                        <th>Description</th>
                    </tr>
                    <?php foreach($types as $type) : ?>
                    <tr>
                        <td class="types"><?php echo $type['type_name'] ?></td>
                        <td><?php echo $type['type_description'] ?></td>
                    </tr>
                    <?php endforeach; ?>
                </table>
            </div>
        </div>
    </body>
</html>
