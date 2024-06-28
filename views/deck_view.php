<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/css/deck_view_styles.css" />
    <title>Deck Details</title>
</head>
<body>
    <nav class="navMenu">
        <a href="index.php">Main Page</a>
        <a href="index.php?action=all_decks"><b>Deck List</b></a>
        <a href="index.php?action=all_cards">Card List</a>
    </nav>

        <div class="container">
            <?php if (is_array($data['currentDeck']) && !empty($data['currentDeck'])): ?>
                <h1>Deck: <?php echo $data['currentDeck']['deck_name']; ?></h1>

                <h2>
                    <a href=".?action=toggle_favorite&id=<?php echo $data['currentDeck']['deck_id']; ?>">
                        <?php echo $data['favorite_deck']; ?>
                    </a>
                </h2>

                <div class="deck-grid">
                <?php $index = 1; ?>
                    <?php foreach ($data['cards'] as $card): ?>
                        <div class="deck-card" style="background-image: url(<?php echo CardColor($card['card_color']);?>);">
                            <div class="card-count">Card <?php echo $index; ?></div>
                            <table class="deck-details">
                                <tr>
                                    <td><strong>Card Name:</strong> <?php echo $card['card_name']; ?></td>
                                </tr>
                                <tr>
                                    <td><strong>Type:</strong> <?php echo $card['card_type']; ?> - <?php echo $card['card_subtype']; ?></td>
                                </tr>
                                <tr>
                                    <td><strong>Set Code:</strong> <?php echo $card['card_set_code']; ?></td>
                                </tr>
                                <tr>
                                    <td><strong>Color:</strong> <?php echo $card['card_color']; ?></td>
                                </tr>
                                <tr>
                                    <td><strong>Cost:</strong> <?php echo manaReplace($card['card_cost']); ?></td>
                                </tr>
                                <tr>
                                    <td><strong>Attack/Defense:</strong> <?php echo $card['card_attack']; ?> / <?php echo $card['card_defense']; ?></td>
                                </tr>
                                <tr>
                                    <td><strong>Description:</strong> <?php echo manaReplace($card['card_description']); ?></td>
                                </tr>
                            </table>
                        </div>
                        <?php $index++; ?>
                    <?php endforeach; ?>
                </div>
            <?php else: ?>
                <p>Deck information is unavailable.</p>
            <?php endif; ?>
        </div>
    </body>
</html>
