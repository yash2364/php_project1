<?php

session_start();

error_reporting(0);

$conn = mysqli_connect("localhost","root","","php_ecom");

	if(isset($_POST['login']))
	{
		$u_email = $_POST['email'];

		$pass = $_POST['password'];

		$sql = "SELECT * from users Where email ='".$u_email."' AND password = '".$pass."' ";

		$result = mysqli_query($conn,$sql);

		$row = mysqli_fetch_array($result);

		if($row['usertype']=="user")
		{
			$_SESSION['user_email']=$u_email;

			$_SESSION['usertype']="user";


			header("location:../index.php");
		}


		else if($row['usertype']=="admin")
		{
			$_SESSION['user_email']=$u_email;

			$_SESSION['usertype']="admin";

			header("location:../admin/adminpage.php");
		}

		else
		{
			$_SESSION['message']="Username or Password is wrong";

			
		}

	}


?>


<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>

	<link rel="stylesheet" type="text/css" href="../style.css">
</head>
<body>

	<div class="my_form">

		<h3>
			
			<?php 

 

			 echo $_SESSION['message'];

			?>

		</h3>

		<h2>Login Form</h2>
		

		<form action="" method="POST">


			<div class="input_deg">
				<label>Email</label>
				<input type="email" name="email" required>
			</div>

			<div class="input_deg">
				<label>Password</label>
				<input type="password" name="password" required>
			</div>

			<div class="input_deg">
				 
				<input type="submit" name="login" value="Login">
			</div>
		</form>


	</div>

</body>
</html>