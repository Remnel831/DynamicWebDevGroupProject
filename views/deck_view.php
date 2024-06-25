<!-- <?php
if (($_SESSION['currentDeck']) === $_SESSION['favoriteDeck']) { $favoriteBtnMsg = '💛Favorited💛'; }
else {$favoriteBtnMsg = '❤Click to favorite❤';}
?> -->
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
        <?php if (is_array($currentDeck) && !empty($currentDeck)): ?>
            <h1>Deck: <?= $currentDeck[0]['deck_name']; ?></h1>

            <h2><a href=".?action=add_favorite?deck_id=<?= $deckId; ?>"><?= $favoriteBtnMsg; ?></a></h2> 
            <div class="deck-grid">
                <?php foreach ($currentDeck as $index => $deck): ?>
                    <div class="deck-card">
                        <div class="card-count">Card <?= $index + 1; ?></div>
                        <table class="deck-details">
                            <tr>
                                <td><strong>Card Name:</strong> <?= $deck['card_name']; ?></td>
                            </tr>
                            <tr>
                                <td><strong>Type:</strong> <?= $deck['card_type']; ?> - <?= $deck['card_subtype']; ?></td>
                            </tr>
                            <tr>
                                <td><strong>Set Code:</strong> <?= $deck['card_set_code']; ?></td>
                            </tr>
                            <tr>
                                <td><strong>Color:</strong> <?= $deck['card_color']; ?></td>
                            </tr>
                            <tr>
                                <td><strong>Cost:</strong> <?= $deck['card_cost']; ?></td>
                            </tr>
                            <tr>
                                <td><strong>Attack/Defense:</strong> <?= $deck['card_attack']; ?> / <?= $deck['card_defense']; ?></td>
                            </tr>
                            <tr>
                                <td><strong>Description:</strong> <?= $deck['card_description']; ?></td>
                            </tr>
                        </table>
                    </div>
                <?php endforeach; ?>
            </div>
        <?php else: ?>
            <p>Deck information is unavailable.</p>
        <?php endif; ?>
    </div>
</body>
</html>
