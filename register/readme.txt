                                                  Lite Login System
                                               ©2003-2004 Daniel Brown
                                         Originally Released on www.pscode.com
                                     Coded in 2003 and updated 2004 by Daniel Brown


About
-----

Lite Login System is a secure php login system that uses sessions and allows you stop people viewing webpage unless they are registered. It uses md5 encryption and so is very secure, however it also saves an unecrypted password in the database and so you might want to remove this.


Installation
------------

Edit the variables in db.php to connect to mysql.
Add database.sql to your mysql table using phpMyAdmin or a similiar tool
Upload all the files


Usage
-----

In order to secure pages you will need to put some code into the page that checks if the user is logged in.
Here is some sample code for it: (found in sample.php)

<?
session_start();
if ( empty( $first_name ) ) {
?> 
This page requires you to login before it can be viewed. Login  <a href="index.htm">Here</a>, Or Signup For Your 
Free Account <a href="join_form.php">Here</a> 
<?
} else {
echo "the pages content when logged in";
} 
?>

look at sample.php for how this works.

Thanks for looking at this script and for visiting www.gmtt.co.uk
For help and support visit www.gmtt.co.uk or email me: brownie@thedinghy.co.uk