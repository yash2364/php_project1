<?php
	
	session_start();


	if(!isset($_SESSION['user_email']))
	{

		header("location:../home/login.php");

	}

	else if ($_SESSION['usertype'] =="user") 
	{
		header("location:../home/login.php");
	}


	$conn = mysqli_connect("localhost","root","","php_ecom");

	$p_id = $_GET['id'];

	$sql= "SELECT * from products where id='$p_id'";

	$result = mysqli_query($conn,$sql);

	$row = mysqli_fetch_assoc($result);


	if(isset($_POST['update_product']))
	{

		$p_title = $_POST['title'];

		$p_des = $_POST['description'];

		$p_price = $_POST['price'];

		$p_qty = $_POST['qty'];




		$image_name = $_FILES['my_image']['name'];


		if($image_name)

		{


			$tmp = explode(".",$image_name);

		$newfilename = round(microtime(true)).'.'.end($tmp);

		$uploadpath = "../product_image/".$newfilename;

  		move_uploaded_file($_FILES['my_image']['tmp_name'],$uploadpath);


  		$update_sql = "Update products set title = '$p_title', description ='$p_des' , price='$p_price' , quantity ='$p_qty' , image = '$newfilename' where id='$p_id' ";

		$data = mysqli_query($conn,$update_sql);

		if($data)
		{
			header("location:display_product.php");
		}


		}


		else
		{

			$update_sql = "Update products set title = '$p_title', description ='$p_des' , price='$p_price' , quantity ='$p_qty' where id='$p_id' ";

		$data = mysqli_query($conn,$update_sql);

		if($data)
		{
			header("location:display_product.php");
		}


		}




		


	}





?>


<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>

	<link rel="stylesheet" type="text/css" href="admin_style.css">
</head>
<body>

	<div class="wrapper">

		<div class="sidebar">

			<h2>Ecom Admin</h2>

			<ul>
				<li>
					<a href="adminpage.php">Dashboard</a>
				</li>

				<li>
					<a href="users.php">Users</a>
				</li>

				<li>
					<a href="add_product.php">Add products</a>
				</li>

				<li>
					<a href="display_product.php">View Products</a>
				</li>

				<li>
					<a href="all_orders.php">Orders</a>
				</li>
			</ul>
			

		</div>


		<div class="header">

			<div class="admin_header">
				<a href="../logout.php">Logout</a>
			</div>

			<div class="info">

				<h1>Update Page</h1>


				<div class="my_form">
					
					<form action="" method="POST" enctype="multipart/form-data">

						<div class="div_deg">
							<label>Title</label>
							<input type="text" value="<?php echo $row['title'] ?>" name="title">
						</div>

						<div class="div_deg">
							<label>Description</label>
							<textarea name="description"><?php echo $row['description'] ?>
							</textarea>
						</div>

						<div class="div_deg">
							<label>Price</label>
							<input type="number" value="<?php echo $row['price'] ?>" name="price">
						</div>


						<div class="div_deg">
							<label>Quantity</label>
							<input type="number" value="<?php echo $row['quantity'] ?>" name="qty">
						</div>

						<div>
							<label>Current Image</label>
							<img width="80" height="80" src="../product_image/<?php echo $row['image'] ?>">
						</div>

						<div class="div_deg">
							<label>Change Image</label>
							<input type="file" name="my_image">
						</div>


						<div class="div_deg">
							 
							<input type="submit" class="upd_btn" name="update_product" value="Update product">
						</div>


					</form>

				</div>
				

			</div>
			
		</div>
		


	</div>

</body>
</html>