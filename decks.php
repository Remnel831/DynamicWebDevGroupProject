<?php
//loads the ship model database
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
        <title>MTG Decks</title>
        <link rel="stylesheet"  href="stylesheets/shipreg.css" />

            <div class="navMenu">
                <a href="index.php">Main Page</a>
            </div>
            <div class="navMenu">
                <b><a href="decks.php">Deck List</a></b>
            </div>
            <div class="navMenu">
                <a href="cards.php">Card List</a>
            </div>
    </head>

    <body>
   <div class="grid">     
    <div class="makerList">
        </div>
            <div class="shipList">
            <table>
                <tr>
                    <!-- labels the rows -->
                    <td><b>Deck</b></td>
                    <td></td>
                    <td><b>Card</b></td>
                    <td></td>
                    <td><b>Type</b></td>
                    <td></td>
                    <td><b>Count</b></td>
                </tr>
                <!--for each ship in the table from statement 2 populates the table with their stats -->
                 <?php foreach ($deckList as $deck) : ?>
                    <?php
                    $searchbyID = 'SELECT * FROM mtg_cards WHERE card_id = :cardID';
                    $searchStatement = $db->prepare($searchbyID);
                    $searchStatement->bindvalue(':cardID', $deck['deck_card_id']);
                    $searchStatement->execute();
                    $cardStats = $searchStatement->fetch();
                    $searchStatement->closeCursor();
                     ?> 
                    <tr>      
                        <td><?php echo $deck['deck_name']; ?></td>
                        <td></td>
                        <td><?php echo $deck['deck_card_name']; ?></td>
                        <td></td>
                        <td><?php echo $cardStats['card_type'];?></td>
                        <td></td>
                        <td><?php echo $deck['deck_card_count']; ?></td>
                    </tr>
                    <?php endforeach; ?>
            </table>
        </div>
                 </div>
</html>