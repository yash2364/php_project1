 <?php

session_start();

error_reporting(0);

$conn = mysqli_connect("localhost","root","","php_ecom");

if(isset($_GET['search']))
{

    $search_value = $_GET['my_search'];

    $sql = "SELECT * from products Where concat(title,description) LIKE '%$search_value%' "; 

    $result = mysqli_query($conn,$sql);

}

else
{

    $sql = "SELECT * from products";

$result = mysqli_query($conn,$sql);


}





 

?>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>

    <link rel="stylesheet" type="text/css" href="style.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

    <nav>

        <input type="checkbox" id="check">

        <label for="check" class="checkbtn">
            <i class="fa fa-bars"></i>
        </label>
        
         <label class="my_logo">
            <a style="color: white;" href="index.php">My Ecom</a>
        </label>

        <ul>
            <li>
                <a href="index.php">Home</a>
            </li>

            <li>
                <a href="product.php">Products</a>
            </li>

            <li>
                <a href="#">Contact</a>
            </li>

            <?php 

            if($_SESSION['user_email'])

            {

            ?>

            <a class="logout_btn" href="user_order.php?email=<?php echo $_SESSION['user_email'] ?>">Orders</a>

            <a class="logout_btn" href="logout.php">Logout</a> 
 

 
            <?php

            }


            else
            {

            ?>

            <li>
                <a href="home/register.php">Register</a>
            </li>

            <li>
                <a href="home/login.php">Login</a>
            </li>



            <?php

            }

            ?>

            
        </ul>


    </nav>


   

    <div>
           <h3 class="p_title">Products</h3>

    </div>


    <div style="margin-left: 500px; padding: 100px;">
        
        <form action="" method="GET">

            <input type="text" name="my_search" placeholder="Search your products ...">

            <input type="submit" name="search" value="Search">
        </form>

    </div>


    <div class="my_card">


        <?php

        while($row=mysqli_fetch_assoc($result))

        {

        ?>


         <div class="card">
            
<img class="p_image" src="product_image/<?php echo $row['image'] ?>">

            <h4><?php echo $row['title'] ?></h4>

            <p> <?php echo $row['description'] ?> </p>

            <p>Price : <?php echo $row['price'] ?></p>


            <?php 

            if($_SESSION['user_email'])

            {

            ?>

                <a href="my_order.php?id=<?php echo $row['id'] ?>&email=<?php echo $_SESSION['user_email'] ?>">Buy Now</a>

            <?php

            }

            else

            {

            ?>

                <a href="home/login.php">Buy Now</a>

            <?php

            }

            ?>

             

            

        </div>



        <?php
        }

        ?>

       

       


    </div>


    <div class="footer">


        <div class="footer_title">
            <h3>My Ecom</h3>
        </div>

        <div class="footer_content">

            <div>
                <h4>Services</h4>

                <p>
                    <a href="#">Web Development</a>
                </p>

                <p>
                    <a href="#">App Development</a>
                </p>

                <p>
                    <a href="#">Digital Marketing</a>
                </p>
            </div>


            <div>
                <h4>Social links</h4>

                <p>
                    <a href="#">Facebook</a>
                </p>

                <p>
                    <a href="#">Imstagram</a>
                </p>

                <p>
                    <a href="#">Twitter</a>
                </p>
            </div>

            <div>
                <h4>Quick Links</h4>

                <p>
                    <a href="#">Home</a>
                </p>

                <p>
                    <a href="#">Products</a>
                </p>

                <p>
                    <a href="#">Contact</a>
                </p>

                <p>
                    <a href="#">Register</a>
                </p>

                <p>
                    <a href="#">Login</a>
                </p>
            </div>


            <div>
                <h4>Location</h4>

                <p>
                    Wester union steet , house 27
                </p>

                <p>
                    Email : myecom@gmail.com
                </p>

                <p>
                    Phone : 058451228
                </p>
            </div>



            

        </div>
        

        <footer>
            <hr/>
            <h3>Copyright @webtech Knowledge 2030</h3>
        </footer>


    </div>


    
</body>
</html>