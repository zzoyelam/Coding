<?php
	session_start();

	$opt = $_POST['opt'];

	if($opt == 'Register')
		{
 			header("Location:new_user.php");
 			exit;
		}

	if($opt == 'Guest')
		{
 			header("Location:guest.php");
 			exit;
		}

	if($opt == 'Login')
		{
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
				header('Location: news.php');
			}

			else
			{
				echo "Not a valid login. Please try again";
		        header('Location: News_Site.html');;
			}
		}

?>