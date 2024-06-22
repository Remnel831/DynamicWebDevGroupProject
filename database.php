<?php

$dataURL = 'mysql:host=localhost;dbname=mtg_card_shop';
$user = 'mtg_user';
$pass = 'mtgpassword';

try
{
    $db = new PDO($dataURL, $user, $pass);
}
catch(PDOException $e)
{
$error = $e->getMessage();
echo "<p>Connection Error: $error </p>";
}

?>