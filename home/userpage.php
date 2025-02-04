<?php

error_reporting(0);

session_start();

	if(!isset($_SESSION['user_email']))
	{

		header("location:login.php");

	}

	else if ($_SESSION['usertype'] =="admin") 
	{
		header("location:login.php");
	}


?>



<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
</head>
<body>

	<h1>This is User Page</h1>

	<a href="../logout.php">Logout</a> 

</body>
</html>