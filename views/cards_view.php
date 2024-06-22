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
        <title>Card List</title>
        

        <div class="navMenu">
            <a href="index.php">Main Page</a>
        </div>
        <div class="navMenu">
            <a href="decks.php">Deck List</a>
        </div>
        <div class="navMenu">
            <b><a href="cards.php">Card List</a></b>
        </div>
    </head>
    <body>
<div class="grid">  
    <div class="shipList">
    <table cellspacing="10" rules="rows" align="center">
        <tr>
            <td><b>Card Name</br</td>
            <td><b>Card Type</br></td>
            <td><b>Card Subtype</b></td>
            <td><b>Card Color</b></td>
            <td><b>Card Cost</b></td>
            <td><b>Creature Attack</b></td>
            <td><b>Creature Defense</b></td>
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
    </div>
    </div>        
    </body>
</html>    