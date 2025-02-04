Project Structure

http://localhost/php_project-master/product.php
http://127.0.0.1/phpmyadmin/index.php?route=/database/structure&db=php_ecom

admin/
    add_product.php
    admin_style.css
    adminpage.php
    all_orders.php
    display_product.php
    update_order.php
    update_product.php
    users.php
home/
    login.php
    register.php
    userpage.php
images/
index.php
logout.php
my_order.php
php_ecom.sql
product_image/
product.php
READ ME.txt
README.md
style.css
user_order.php

Setup Instructions
Clone the repository:
git clone <repository-url>

Import the database:

Open phpMyAdmin or any MySQL client.
Create a new database named php_ecom.
Import the php_ecom.sql file into the php_ecom database.
Configure the database connection:

Ensure that the database connection details in the PHP files match your local setup. The connection details are typically found in the following files:

add_product.php
adminpage.php
all_orders.php
display_product.php
users.php
update_order.php
update_product.php
login.php
register.php
index.php
my_order.php
product.php
user_order.php
Run the project:

Place the project files in your web server's root directory (e.g., htdocs for XAMPP).
Start your web server and navigate to http://localhost/<project-folder>.
Features
User Registration and Login:

Users can register and log in to the website.
Admin and user roles are supported.
Product Management:

Admins can add, update, and delete products.
Products are displayed on the homepage and product page.
Order Management:

Users can place orders for products.
Admins can view and update the status of orders.
Admin Credentials
Username: admin@gmail.com
Password: 123456
User Credentials
Username: test@gmail.com
Password: 12345678
License
This project is licensed under the MIT License.