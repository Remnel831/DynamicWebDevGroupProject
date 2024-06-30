<!DOCTYPE html>
<html>
    <head>
        <title>Card List</title>
        <link rel="stylesheet" href="./assets/css/cards_view_styles.css>">
    </head>
    <body>
        <nav>
            <ul class="mainmenu">
                <li><a href="index.php?action=type_view">Card Types</a></li>
                <li><a href="index.php?action=cards_view">Card List</a></li>
                <li><a href="index.php?action=all_decks">User Decks</a></li>
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
            <?php foreach ($allCards as $cards) : ?>
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