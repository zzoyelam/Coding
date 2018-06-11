<?php
	session_start();

	require 'database.php';

	// Use a prepared statement
	$stmt = $mysqli->prepare("SELECT COUNT(*), username, crypt_pass FROM users WHERE username=?");
	 
	// Bind the parameter
	$stmt->bind_param('s', $user);
	$user = $_POST['username'];
	$stmt->execute();
	 
	// Bind the results
	$stmt->bind_result($cnt, $user_id, $pwd_hash);
	$stmt->fetch();
	 
	$pwd_guess = $_POST['password'];
	
	// Compare the submitted password to the actual password hash
	if( $cnt == 1 && password_verify($pwd_guess, $pwd_hash)==$pwd_hash)
	{
		// Login succeeded!
		$_SESSION['user_id'] = $user_id;
		//Redirects to website page
		header('Location: site.php');
	}

	else
	{
		echo "Not a valid login. Please try again";
        echo  '<a href="http://http://ec2-52-15-52-97.us-east-2.compute.amazonaws.com/~z.oyelami/login.php"> Go Back</a>';
	}
?>