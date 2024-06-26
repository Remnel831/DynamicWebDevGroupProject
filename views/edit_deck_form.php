<?php
require_once(__DIR__ . '/../config/database.php');

class DeckManager {
    private $conn;

    public function __construct() {
        $this->conn = getConnection(); // Assumes getConnection() function from database.php
    }

    public function getCardList() {
        if (isset($_GET['deck_id'])) {
            $deck_id = $_GET['deck_id'];
        }
    
        $queryCards = 'SELECT c.*
                       FROM mtg_cards c
                       INNER JOIN mtg_decks_cards dc ON c.card_id = dc.card_id
                       WHERE dc.deck_id = :deck_id';
        $statement = $this->conn->prepare($queryCards);
        $statement->bindValue(':deck_id', $deck_id, PDO::PARAM_INT);
        $statement->execute();
        $cardList = $statement->fetchAll();
        $statement->closeCursor();
    
        return $cardList;
    }
}

$deckManager = new DeckManager();
$cardList = $deckManager->getCardList();

// Now you can use $deckList in your view
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit Deck</title>
    </head>
    <body>
    <nav class="navMenu">
        <a href="index.php">Main Page</a>
        <a href="index.php?action=all_decks"><b>Deck List</b></a>
        <a href="index.php?action=all_cards">Card List</a>
    </nav>
        <form action='editDeck.php' method="post">
            <label>Card List: </label>
            <select name="deck" id="deck">
            <?php foreach ($cardList as $card) : ?>
                <option value="<?php echo $card['card_id']; ?>">
                <?php echo $card['card_name']; ?>
                </option>
            <?php endforeach; ?>    
            </select>
        </form>
    </body>
</html>