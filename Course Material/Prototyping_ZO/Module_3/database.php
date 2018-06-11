<?php
	// Content of Database -- connects us to the Database "Bears" 
	//username: Todd     password: Sproull
	$mysqli = new mysqli('localhost', 'Todd', 'Sproull', 'Bears'); 
	if($mysqli->connect_errno) 
	{
		printf("Connection Failed: %s\n", $mysqli->connect_error);
		exit;
	}
?>