<?
/*  Database Information - Required!!  */
/* -- Configure the Variables Below --*/
$dbhost = 'localhost';
$dbusername = 'castrolz_admin';
$dbpasswd = 'admin';
$database_name = 'castrolz_sitedb';
$sitepath = "http://www.castrolzoomclub.com/register/"; // full path to your site including http:// 
                                                                                 // and trailing slash
$sitename = "Castrol ZOOM Club";
$adminemail = "info@castrolzoomclub.com";
/* Database Stuff, do not modify below this line */

$connection = mysql_pconnect("$dbhost","$dbusername","$dbpasswd")
	or die ("Couldn't connect to server.");

$db = mysql_select_db("$database_name", $connection)
	or die("Couldn't select database.");
?>