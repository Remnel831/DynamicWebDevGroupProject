<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/css/all_deck_styles.css" />
    <script src="./assets/js/scripts.js" defer></script>
    <title>Deck List</title>
</head>
<body>
    <nav class="navMenu">
        <a href="index.php">Main Page</a>
        <a href="index.php?action=all_decks">Deck List</a>
        <a href="index.php?action=all_cards">Card List</a>
    </nav>

    <div class="container">
        <h1>Deck List</h1>
        <div class="deck-grid">
            <?php foreach ($data['decks'] as $deck) : ?>
                <div class="deck-card">
                    <a href="index.php?action=deck&deck_id=<?php echo $deck['deck_id']; ?>">
						<?php if($deck['deck_id'] === $_SESSION['favoriteDeck']){echo $deck['deck_name']," 💛";}
                         else {echo $deck['deck_name'];} ?>
						
                    </a>
                    <div class="deck-card-actions">
                        <a href="index.php?action=edit_deck&deck_id=<?php echo $deck['deck_id']; ?>" class="edit-button">Edit</a>
                        <a href="index.php?action=delete_deck&deck_id=<?php echo $deck['deck_id']; ?>" class="delete-button" onclick="return confirm('Are you sure you want to delete this deck?');">Delete</a>
                    </div>
                    </a>
                </div>
				
            <?php endforeach; ?>

            <!-- Add deck functionality -->
            <div class="deck-card add-deck-container" onclick="showAddDeckInput()">
                <span class="plus-sign">+</span>
                <div class="add-deck-input">
                    <form action="index.php?action=add_deck" method="POST">
                        <input type="text" name="deck_name" placeholder="Enter deck name" required>
                        <button type="submit">Save</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
