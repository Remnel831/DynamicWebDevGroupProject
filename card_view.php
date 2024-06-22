<?php
require_once('database.php');

//get all cards
$querylist = 'SELECT * FROM mtg_cards';
$statement1 = $db->prepare($querylist);
$statement1->execute();
$cardList = $statement1->fetchAll();
$statement1->closeCursor();       
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Card List</title>
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
                <th>Card Name</th>
                <th>Card Type</th>
                <th>Card Subtype</th>
                <th>Card Color</th>
                <th>Card Cost</th>
                <th>Creature Attack</th>
                <th>Creature Defense</th>
            </tr>
            <?php foreach ($cardList as $cards) : ?>
            <tr>
                <td><?php echo $cards['card_name']?></td>
                <td><?php echo $cards['card_type']?></td>
                <td><?php echo $cards['card_subtype']?></td>
                <td><?php echo $cards['card_color']?></td>
                <td><?php echo $cards['card_cost']?></td>
                <td><?php echo $cards['card_attack']?></td>
                <td><?php echo $cards['card_defense']?></td> 
            </tr>    
            <?php endforeach; ?>
        </table>       
    </body>
</html>