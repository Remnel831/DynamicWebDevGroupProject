<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Deck</title>
    <link rel="stylesheet" href="./assets/css/form_styles.css">
</head>
<body>
    <nav class="navMenu">
        <a href="index.php">Main Page</a>
        <a href="index.php?action=all_decks"><b>Deck List</b></a>
        <a href="index.php?action=all_cards">Card List</a>
    </nav>

    <div class="container">
        <h3>Delete Card from Deck/Update Number of a Card</h3>
        <h3>Current Deck: <?php echo $data['deck_name']; ?></h3>
        <form class="editForm" method="post">
    <input type="hidden" name="deck_id" value="<?php echo $data['deck_id']; ?>">
    <label>Card:</label>
    <select name="card_id">
        <?php foreach ($data['cardList'] as $card) : ?>
            <option value="<?php echo $card['card_id']; ?>">
                <?php echo $card['card_name']; ?>
            </option>
        <?php endforeach; ?>
    </select>
    <br>
    <label>Number:</label>
    <select name="card_count">
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
    </select>
    <br><br>
    <button type="submit" formaction="index.php?action=delete_card" name="delete_card">Delete Card</button>
    <button type="submit" formaction="index.php?action=update_card" name="update_quantity">Update Quantity</button>
</form>

        <br><br>
        <h3>Add Card to Deck</h3>
        <form class="editForm" method="post">
            <input type="hidden" name="deck_id" value="<?php echo $data['deck_id']; ?>">
            <label>Card to Add:</label>
            <select name="card_id">
                <?php foreach ($data['allCards'] as $card) : ?>
                    <option value="<?php echo $card['card_id']; ?>">
                        <?php echo $card['card_name']; ?>, <?php echo $card['card_color']; ?>, <?php echo $card['card_set_code']; ?>
                    </option>
                <?php endforeach; ?>
            </select>
            <br><br>
            <button type="submit" formaction="index.php?action=add_card" name="add_card">Add Card</button>
        </form>
        <footer name="deck_id">Deck ID: <?php echo $data['deck_id']; ?></footer>
    </div>
</body>
</html>