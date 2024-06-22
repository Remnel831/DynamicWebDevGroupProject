<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet"  href="./assets/css/styles.css" />
    <title>Document</title>
</head>
<body>
<div class="navMenu">
    <a href="index.php">Main Page</a>
</div>
<div class="navMenu">
    <b><a href="decks.php">Deck List</a></b>
</div>
<div class="navMenu">
    <a href="cards.php">Card List</a>
</div>

<table>
    <tr>
        <td><b>Deck</b></td>
        <td></td>
        <td><b>Card</b></td>
        <td></td>
        <td><b>Type</b></td>
        <td></td>
        <td><b>Count</b></td>
    </tr>
    <?php foreach ($decks as $deck) : ?>
        <tr>      
            <td><?php echo $deck['deck_name']; ?></td>
            <td></td>
            <td><?php echo $deck['deck_card_name']; ?></td>
            <td></td>
            <td><?php echo $deck['deck_card_type'];?></td>
            <td></td>
            <td><?php echo $deck['deck_card_count']; ?></td>
        </tr>
    <?php endforeach; ?>
</table>

</body>
</html>