<?php
if (($_SESSION['currentDeck']) === $_SESSION['favoriteDeck']) { $favoriteBtnMsg = '💛Favorited💛'; }
else {$favoriteBtnMsg = '❤Click to favorite❤';}
?>
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
        <a href="decks.php"><b>Deck List</b></a>
        <a href="cards.php">Card List</a>
    </nav>

    <div class="container">
        <?php if (is_array($data['currentDeck']) && !empty($data['currentDeck'])): ?>
            <h1>Deck: <?php echo $data['currentDeck'][0]['deck_name']; ?></h1>

			<h2><a href=".?action=add_favorite"><?php echo $favoriteBtnMsg; ?></a></h2>
            <div class="deck-grid">
                <?php foreach ($data['currentDeck'] as $index => $deck): ?>
                    <div class="deck-card">
                        <div class="card-count">Card <?php echo $index + 1; ?></div>
                        <table class="deck-details">
                            <tr>
                                <td><strong>Card Name:</strong> <?php echo $deck['card_name']; ?></td>
                            </tr>
                            <tr>
                                <td><strong>Type:</strong> <?php echo $deck['card_type']; ?> - <?php echo $deck['card_subtype']; ?></td>
                            </tr>
                            <tr>
                                <td><strong>Set Code:</strong> <?php echo $deck['card_set_code']; ?></td>
                            </tr>
                            <tr>
                                <td><strong>Color:</strong> <?php echo $deck['card_color']; ?></td>
                            </tr>
                            <tr>
                                <td><strong>Cost:</strong> <?php echo $deck['card_cost']; ?></td>
                            </tr>
                            <tr>
                                <td><strong>Attack/Defense:</strong> <?php echo $deck['card_attack']; ?> / <?php echo $deck['card_defense']; ?></td>
                            </tr>
                            <tr>
                                <td><strong>Description:</strong> <?php echo $deck['card_description']; ?></td>
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
