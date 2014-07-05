<?
session_start();

include 'header.php';

if(!isset($_REQUEST['logmeout'])){
	session_unset();
	session_destroy();
	if(!session_is_registered('first_name')){
		echo "<center><font color=red><strong>You are now logged out!</strong></font></center><br />";
	}
}

include 'footer.php';
?>