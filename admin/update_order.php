<?php

$conn=mysqli_connect("localhost","root","","php_ecom");

$order_id = $_GET['id'];

$delivered = "Delivered";

$sql = "UPDATE orders set status='$delivered' where id='$order_id' ";

$result=mysqli_query($conn,$sql);

if($result)
{
	header("location:all_orders.php");
}

?>