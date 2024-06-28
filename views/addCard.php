<?php
require_once(__DIR__ . '/../config/database.php');

class AddCard {
    private $conn;
    private $card_id;
    private $deck_id;

    public function __construct($card_id, $deck_id) {
        $this->conn = getConnection();
        $this->card_id = $card_id;
        $this->deck_id = $deck_id;
    }

    public function addToDeck() {
        if ($this->card_id !== false && $this->deck_id !== false) {
            $query = 'INSERT INTO mtg_decks_cards (card_id, deck_id)
                      VALUES (:card_id, :deck_id)';
            $statement = $this->conn->prepare($query);
            $statement->bindValue(':card_id', $this->card_id);
            $statement->bindValue(':deck_id', $this->deck_id);
            $success = $statement->execute();
            $statement->closeCursor();        

            if ($success) {
                header("Location: ../index.php?action=deck&deck_id=" . $this->deck_id);
                exit;
            } else {
                // Handle the error if deletion was not successful
                echo 'Error deleting card.';
            }
        } else {
            // Handle invalid card_id or deck_id
            echo 'Invalid card ID or deck ID.';
        }
    }
}

// Get IDs
$card_id = filter_input(INPUT_POST, 'card_id', FILTER_VALIDATE_INT);
$deck_id = filter_input(INPUT_POST, 'deck_id', FILTER_VALIDATE_INT);

if ($card_id !== false && $deck_id !== false) {
    $addCard = new AddCard($card_id, $deck_id);
    $addCard->addToDeck();
} else {
    echo 'Invalid card ID or deck ID.';
}
?>