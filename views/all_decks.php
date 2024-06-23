<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./assets/css/all_deck_styles.css" />
        <title>Deck List</title>
    </head>
    <body>
    <nav class="navMenu">
                <a href="index.php">Main Page</a>
                <a href="index.php?action=all_decks"><b>Deck List</b></a>
                <a href="index.php?action=cards"><b>Card List</b></a>
    </nav>

        <div class="container">
            <h1>Deck List</h1>
            <div class="deck-grid">
                <?php foreach ($data['decks'] as $deck) : ?>
                    <div class="deck-card">
                        <a href="index.php?action=deck&deck_id=<?php echo $deck['deck_id']; ?>">
                            <?php echo $deck['deck_name']; ?>
                        </a>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
    </body>
</html>
