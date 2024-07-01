<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tips</title>
		<link rel="stylesheet" href="./assets/css/main_page_styles.css">
    </head>
    <body>
        <nav class="navMenu">
            <a href="index.php">Main Page</a>
            <a href="index.php?action=all_decks">Deck List</a>
            <a href="index.php?action=all_cards">Card List</a>
			<a href=".?action=tips_view"><b>Tips</b></a>
			<a href="index.php?action=about_view">About Us</a>
        </nav>
		<?php
		$count = -1;
		foreach ($data['tips'] as $tip){
			$count++;
		}
		
		$random = rand(1, $count);
		$countx = 0;
		
		foreach ($data['tips'] as $tip){
			if($countx === $random){
			$tipDisplay = $tip['tip_message'];
			}
			$countx++;
		}

		?>
		<h1 style="color:white"><strong>TIP: </strong> <?php echo $tipDisplay; ?> </h1>


    </body>
</html>
