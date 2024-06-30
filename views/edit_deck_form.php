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
        $queryAllCards = 'SELECT card.*, sets.set_name 
                          FROM mtg_cards card 
                          JOIN mtg_card_sets sets ON card.card_set_code = sets.set_code';
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
$allCards = $deckManager->getAllCards();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Deck</title>
    <link rel="stylesheet" href="../assets/css/form_styles.css" />
</head>
<body>
    <nav class="navMenu">
        <a href="index.php">Main Page</a>
        <a href="index.php?action=all_decks"><b>Deck List</b></a>
        <a href="index.php?action=all_cards">Card List</a>
    </nav>
    <div class="container">
        <h3>Delete Card from Deck/Update Number of a Card</h3>
        <form class="editForm" method="post">
            <input type="hidden" name="deck_id" value="<?php echo $deck_id; ?>" />
            <label>Card: </label>
            <select name="card_id" id="card_id">
                <?php foreach ($cardList as $card) : ?>
                    <option value="<?php echo $card['card_id']; ?>">
                        <?php echo $card['card_name']; ?>
                    </option>
                <?php endforeach; ?>
            </select>
            <br><br>
            <label>Number: </label>
            <select name="card_count" id="card_count">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
            </select>
            <br><br><br>
            <input type="submit" formaction="deleteCard.php" value="Delete Card" />
            <input type="submit" formaction="updateQuantity.php" value="Update Quantity" />
        </form>
        <br><br>
        <h3>Add Card to Deck</h3>
        <form class="editForm" method="post">
            <input type="hidden" name="deck_id" value="<?php echo $deck_id; ?>" />
            <label>Color: </label>
            <select name="color_filter" id="color_filter" onchange="filterCardsByColor()">
                <option value="all">All</option>
                <option value="white">White</option>
                <option value="blue">Blue</option>
                <option value="black">Black</option>
                <option value="red">Red</option>
                <option value="green">Green</option>
                <option value="colorless">Colorless</option>
            </select>
            <br><br>
            <label>Card to Add: </label>
            <select name="card_id" id="card_id_add">
                <?php foreach ($allCards as $card) : ?>
                    <option value="<?php echo $card['card_id']; ?>" data-color="<?php echo strtolower($card['card_color']); ?>">
                        <?php echo $card['card_name']; ?>, <?php echo $card['card_color']; ?>, <?php echo $card['set_name']; ?>
                    </option>
                <?php endforeach; ?>
            </select>
            <br><br><br>
            <input type="submit" formaction="addCard.php" value="Add Card" />
        </form>
        <footer name="deck_id" id="deck_id">Deck ID: <?php echo $deck_id; ?></footer>
    </div>
    <script>
    function filterCardsByColor() {
        var selectedColor = document.getElementById('color_filter').value;
        console.log("Selected Color: ", selectedColor); // Debugging line
        var cardOptions = document.getElementById('card_id_add').options;
        var firstVisibleOptionIndex = -1;

        for (var i = 0; i < cardOptions.length; i++) {
            var option = cardOptions[i];
            var optionColors = option.getAttribute('data-color').toLowerCase().split('/');
            console.log("Option Colors: ", optionColors); // Debugging line

            if (selectedColor === 'all' || optionColors[0] === selectedColor) {
                option.style.display = '';
                if (firstVisibleOptionIndex === -1) {
                    firstVisibleOptionIndex = i;
                }
            } else {
                option.style.display = 'none';
            }
        }

        if (firstVisibleOptionIndex !== -1) {
            cardOptions[firstVisibleOptionIndex].selected = true;
        } else {
            document.getElementById('card_id_add').selectedIndex = -1;
        }
    }
</script>


</body>
</html>
