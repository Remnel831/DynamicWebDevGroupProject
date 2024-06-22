<?php

?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MTG DeckBuilder</title>
        <link rel="stylesheet" href="styles.css?v=<?php echo time(); ?>">
    </head>
    <body>
        <nav>
            <ul class="mainmenu">
                <li><a href=".?action=type_view">Card Types</a></li>
                <li><a href=".?action=card_view">Card List</a></li>
                <li><a href=".?action=deck_view">User Decks</a></li>
            </ul>
        </nav>
        <h1>Welcome to the MTG DeckBuilder!</h1><br>
        <h2>This site is a great way for those getting into Magic: The Gathering
            to get an overview of what each card type does, see what available sets/cards you can build decks from, 
            as well as allowing you to build your own decks!
        </h2>
    </body>
</html>