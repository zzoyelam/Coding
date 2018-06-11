<?php
	require 'database.php';
	session_start();


 	$user = $_POST['username'];
 	$pass = crypt($_POST['password']);
    
 	$_SESSION['login_u'] = $user;
 	$_SESSION['login_p'] = $pass;
 
	$stmt = $mysqli->prepare("insert into users (user,pass) values (?, ?)");
	
	if(!$stmt)
	{
		printf("Query Prep Failed: %s\n", $mysqli->error);
		echo "Invalid username.";
		exit;
	}
 
	$stmt->bind_param('ss', $user, $pass,);
 
	$stmt->execute();
 
	$stmt->close();
 	header('Location: site.php');
?>