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
        <form action='editDeck.php' method="post">
            <label>Card List: </label>
            <select name="deck" id="deck">
            <?php foreach ($cardList as $card) : ?>
                <option value="<?php echo $card['card_id']; ?>">
                <?php echo $card['card_name']; ?>
                </option>
            <?php endforeach; ?>    
            </select>
        </form>
    </body>
</html>