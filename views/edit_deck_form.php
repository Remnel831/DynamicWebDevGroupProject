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

    public function getAllCards() {
        $queryAllCards = 'SELECT *
                          FROM mtg_cards';
        $statement1 = $this->conn->prepare($queryAllCards);
        $statement1->execute();
        $allCards = $statement1->fetchAll();
        $statement1->closeCursor();

        return $allCards;
    }   
}

$deck_id = filter_input(INPUT_GET, 'deck_id', FILTER_VALIDATE_INT);

$deckManager = new DeckManager();
$cardList = $deckManager->getCardList();

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
        <h3>Delete Card from Deck/Update Number of a Card</h3>
        <form method="post">
            <input type="hidden" name="deck_id" value="<?php echo $deck_id; ?>" />
            <label>Card List: </label>
            <select name="card_id" id="card_id">
            <?php foreach ($cardList as $card) : ?>
                <option value="<?php echo $card['card_id']; ?>">
                <?php echo $card['card_name']; ?>
                </option>
            <?php endforeach; ?>    
            </select>
            <input type="submit" formaction="deleteCard.php" value="Delete Card" />
            <input type="submit" formaction="updateQuantity.php" value="Update Quantity" />
        </form>
        <footer name="deck_id" id="deck_id">Deck ID: <?php echo $deck_id; ?></footer>
    </body>
</html>