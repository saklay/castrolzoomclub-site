<?
session_start();
if ( empty( $first_name ) ) {
?> Welcome Guest, You Can Login <a href="index.htm">Here</a>, Or Signup For Your 
Free Account <a href="http://www.clansr.co.uk/shatners">Here<br>
&copy;2003 Shatners PHP<br>
</a> 
<?
} else { include 'db.php'; echo "Welcome, 
". $_SESSION['first_name'] .""; 
?>
 <a href="logout.php">Logout</a> 
<? } ?>
