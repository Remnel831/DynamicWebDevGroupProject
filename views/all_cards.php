<!DOCTYPE html>
<html>
<head>
    <title>Card List</title>
    <link rel="stylesheet" href="./assets/css/all_cards_styles.css">
    <script src="./assets/js/scripts.js" defer></script>
</head>
<body>
    <nav class="navMenu">
        <a href="index.php">Main Page</a>
        <a href="index.php?action=all_decks">Deck List</a>
        <a href="index.php?action=all_cards"><b>Card List</b></a>
    </nav>
    <div class="container">
        <div class="sc-container">
            <h2 id="selected-cards-heading">Selected Cards</h2>
            <div class="selected-cards" id="selected-cards">
                <!-- Selected cards will appear here -->
            </div>
        </div>
        <div class="deck-grid">
            <h2>Available Cards</h2>
            <?php foreach ($data['cards'] as $card): ?>
                <div class="deck-card" onclick="addCard(this)" style="background-size: cover; background-repeat: no-repeat; background-image: url(<?php echo CardColor($card['card_color']);?>);">
                    <strong><?php echo $card['card_name']; ?></strong>
                    <div class="card-details">
                        <p><strong>Type:</strong> <?php echo $card['card_type']; ?> - <?php echo $card['card_subtype']; ?></p>
                        <p><strong>Set Code:</strong> <?php echo $card['card_set_code']; ?></p>
                        <p><strong>Color:</strong> <?php echo $card['card_color']; ?></p>
                        <p><strong>Cost:</strong> <?php echo manaReplace($card['card_cost']); ?></p>
                        <p><strong>Attack/Defense:</strong> <?php echo $card['card_attack']; ?> / <?php echo $card['card_defense']; ?></p>
                        <p><strong>Description:</strong> <?php echo manaReplace($card['card_description']); ?></p>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
</body>
</html>
