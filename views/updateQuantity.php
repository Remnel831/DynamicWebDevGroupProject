<?php

require_once(__DIR__ . '/../config/database.php');

class UpdateQuantity {
    private $conn;
    private $card_id;
    private $deck_id;
    private $card_count;

    public function __construct($card_id, $deck_id, $card_count) {
        $this->conn = getConnection();
        $this->card_id = $card_id;
        $this->deck_id = $deck_id;
        $this->card_count = $card_count;
    }

    public function updateCardQuantity() {
        if ($this->card_id !== false && $this->deck_id !== false && $this->card_count !== false) {
            $query = 'UPDATE mtg_decks_cards
                      SET card_count = :card_count
                      WHERE card_id = :card_id
                      AND deck_id = :deck_id';
            $statement = $this->conn->prepare($query);
            $statement->bindValue(':card_count', $this->card_count);
            $statement->bindValue(':card_id', $this->card_id);
            $statement->bindValue(':deck_id', $this->deck_id);
            $success = $statement->execute();
            $statement->closeCursor();

            if ($success) {
                header("Location: ../index.php?action=deck&deck_id=" . $this->deck_id);
                exit;
            } else {
                // Handle the error if deletion was not successful
                echo 'Error updating card quantity.';
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
$card_count = filter_input(INPUT_POST, 'card_count', FILTER_VALIDATE_INT);


if ($card_id !== false && $deck_id !== false && $card_count !== false) {
    $updateDeck = new UpdateQuantity($card_id, $deck_id, $card_count);
    $updateDeck->updateCardQuantity();
} else {
    echo 'Invalid card ID or deck ID.';
}
?>