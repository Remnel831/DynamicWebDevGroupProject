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
                <br>
                <label>Number: </label>
                <select name="card_count" id="card_count">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                </select>
                <br><br>
                <input type="submit" formaction="deleteCard.php" value="Delete Card" />
                <input type="submit" formaction="updateQuantity.php" value="Update Quantity" />
            </form>
            <br><br>
            <h3>Add Card to Deck</h3>
            <form class="editForm" method="post">
                <input type="hidden" name="deck_id" value="<?php echo $deck_id; ?>" />
                <label>Card to Add: </label>
                <select name="card_id" id="card_id">
                <?php foreach ($allCards as $card) : ?>
                    <option value="<?php echo $card['card_id']; ?>">
                    <?php echo $card['card_name']; ?>, <?php echo $card['set_name']; ?>
                    </option>
                <?php endforeach; ?> 
                </select>
                <br><br>
                <input type="submit" formaction="addCard.php" value="Add Card" />
            </form>
            <footer name="deck_id" id="deck_id">Deck ID: <?php echo $deck_id; ?></footer>
        </div>
    </body>
</html>