<?php
try {
	$db = new PDO("mysql:host=localhost;dbname=flutter_test;","shabrina","");
} catch (Exception $e) {
	echo $e->getMessage();
}
?>