    <?php
require_once('./models/CardModel.php');

class CardController {
    private $cardModel;

    public function __construct(CardModel $cardModel) {
        $this->cardModel = $cardModel;
    }
    public function index() {
        $cards = $this->cardModel->getAllCards();
        $data = [
            'cards' => $cards
        ];
        $this->loadView('all_cards', $data);
    }
    public function getAllCards() {
        // Logic to list all decks
        $cards = $this->cardModel->getAllCards();
        $data = [
            'cards' => $cards
        ];
        $this->loadView('cards_view', $data);
    }
    public function get_card_list($deck_id) {
        $cards = $this->cardModel->getCardList($deck_id);
        $data = [
            'cardList' => $cards
        ];
        $this->loadView('cards_list', $data);
    }
    public function updateCard(){
        $card_id = filter_input(INPUT_POST, 'card_id', FILTER_VALIDATE_INT);
        $deck_id = filter_input(INPUT_POST, 'deck_id', FILTER_VALIDATE_INT);
        $card_count = filter_input(INPUT_POST, 'card_count', FILTER_VALIDATE_INT);
    
        // Update card quantity in the model
        $success = $this->cardModel->updateCardQuantity($card_id, $deck_id, $card_count);
    
        // Redirect based on whether $deck_id is available
        if ($success) {
            header("Location: index.php?action=edit_deck&deck_id={$deck_id}");
        } else {
            // Handle if deck_id is not available, perhaps redirect to a default page
            echo "Error updating card quantity.";
            echo "card id: " . $card_id . "deck id:" . $deck_id . "card count: " . $card_count;
        }
        exit; 
    }
    public function deleteCard() {
        // Delete card from the model
        $card_id = filter_input(INPUT_POST, 'card_id', FILTER_VALIDATE_INT);
        $deck_id = filter_input(INPUT_POST, 'deck_id', FILTER_VALIDATE_INT);
        
        $success = $this->cardModel->deleteCard($card_id, $deck_id);

        // Redirect based on whether $deck_id is available
        if ($success) {
            header("Location: index.php?action=edit_deck&deck_id={$deck_id}");
        } else {
            // Handle if deck_id is not available, perhaps redirect to a default page
            echo "Error deleting card.";
            echo "card id: " . $card_id . "deck id:" . $deck_id;
        }
        exit; 
    }

    public function addCard() {
        //Add card from the model
        $card_id = filter_input(INPUT_POST, 'card_id', FILTER_VALIDATE_INT);
        $deck_id = filter_input(INPUT_POST, 'deck_id', FILTER_VALIDATE_INT);

        $success = $this->cardModel->addCard($card_id, $deck_id);

        // Redirect based on whether $deck_id is available
        if ($success) {
            header("Location: index.php?action=edit_deck&deck_id={$deck_id}");
        } else {
            // Handle if deck_id is not available, perhaps redirect to a default page
            echo "Error adding card.";
            echo "card id: " . $card_id . "deck id:" . $deck_id;
        }
        exit; 
    }

    private function loadView($viewName, $data) {
        include("views/{$viewName}.php");
    }
}
?>
