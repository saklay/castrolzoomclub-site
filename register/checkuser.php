<?
/* Check User Script */
session_start();  // Start Session

include 'db.php';
// Convert to simple variables
$username = $_POST['username'];
$password = $_POST['password'];
$whichpage = $_POST['whichpage'];

if((!$username) || (!$password)){	
	include 'login.php';
	echo "Please enter ALL of the information! <br />";
	exit();
}

// Convert password to md5 hash
$password = md5($password);

// check if the user info validates the db
$sql = mysql_query("SELECT * FROM users WHERE username='$username' AND password='$password' AND activated='1'");
$login_check = mysql_num_rows($sql);

if($login_check > 0){
	while($row = mysql_fetch_array($sql)){
	foreach( $row AS $key => $val ){
		$$key = stripslashes( $val );
	}
		// Register some session variables!
		session_register('first_name');
		$_SESSION['first_name'] = $first_name;
		session_register('last_name');
		$_SESSION['last_name'] = $last_name;
		session_register('email_address');
		$_SESSION['email_address'] = $email_address;
		if($whichpage > 0){
			header("Location: /index.html");
		} else {
			header("Location: /zoomgame/zoomgame.php?first_name=good");
		}
	}
} else {
	include 'login.php';
	echo "You could not be logged in! Either the username and password do not match or you have not validated your membership!<br />
	Please try again!<br />";

}

?>