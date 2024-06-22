<?php

require_once('database.php');

$querylist = 'SELECT * FROM mtg_decks';
$statement1 = $db->prepare($querylist);
$statement1->execute();
$deckList = $statement1->fetchAll();
$statement1->closeCursor();      

?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Decks</title>
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
        <table>
            <tr>
                <th>Deck</th>
                <th>Card</th>
                <th>Type</th>
                <th>Count</th>
            </tr>
                
            <?php foreach ($deckList as $deck) : ?>
                <tr>      
                    <td><?php echo $deck['deck_name']; ?></td>
                    <td><?php echo $deck['deck_card_name']; ?></td>
                    <td><?php echo $deck['deck_card_type']; ?></td>
                    <td><?php echo $deck['deck_card_count']; ?></td>
                    </tr>
            <?php endforeach; ?>
        </table>
    </body>
</html>