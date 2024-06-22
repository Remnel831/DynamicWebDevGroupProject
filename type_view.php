<?php
require_once('database.php');

$queryTypes = 'SELECT * FROM mtg_card_type';
$statement1 = $db->prepare($queryTypes);
$statement1->execute();
$types = $statement1->fetchAll();
$statement1->closeCursor(); 

?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Card Types</title>
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
                <th>Card Type</th>
                <th>Description</th>
            </tr>
            <?php foreach($types as $type) : ?>
            <tr>
                <td><?php echo $type['type_name'] ?></td>
                <td><?php echo $type['type_description'] ?></td>
            </tr>
            <?php endforeach; ?>
        </table>
    </body>
</html>