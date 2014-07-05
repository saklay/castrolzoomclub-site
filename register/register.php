<?
include 'header.php';

include 'db.php';

// Define post fields into simple variables
$email_address 		= $_POST['email_address'];
$username 			= $_POST['username'];
$yourpassword 		= $_POST['yourpassword'];
$first_name 		= $_POST['first_name'];
$middle_initial 	= $_POST['middle_initial'];
$last_name 			= $_POST['last_name'];
$address			= $_POST['address'];
$province			= $_POST['province'];
$phone				= $_POST['phone'];
$mobile				= $_POST['mobile'];
$age				= $_POST['age'];
$sex				= $_POST['sex'];
$birthday			= $_POST['birthday'];
$bike_model			= $_POST['bike_model'];
$bike_name			= $_POST['bike_name'];
$zoomclub_number	= $_POST['zoomclub_number'];
$info 				= $_POST['info'];

/* Lets strip some slashes in case the user entered
any escaped characters. */

$email_address 		= stripslashes($email_address);
$username 			= stripslashes($username);
$first_name 		= stripslashes($first_name);
$middle_initial		= stripslashes($middle_initial);
$last_name 			= stripslashes($last_name);
$address			= stripslashes($address);
$province			= stripslashes($province);
$phone				= stripslashes($phone);
$mobile				= stripslashes($mobile);
$age				= stripslashes($age);
$sex				= stripslashes($sex);
$birthday			= stripslashes($birthday);
$bike_model			= stripslashes($bike_model);
$bike_name			= stripslashes($bike_name);
$zoomclub_number	= stripslashes($zoomclub_number);
$info 				= stripslashes($info);


/* Do some error checking on the form posted fields */

if((!$first_name) || (!$last_name) || (!$email_address) || (!$username)){
	echo 'You did not submit the following required information! <br />';
	if(!$first_name){
		echo "First Name is a required field. Please enter it below.<br />";
	}
	if(!$last_name){
		echo "Last Name is a required field. Please enter it below.<br />";
	}
	if(!$email_address){
		echo "Email Address is a required field. Please enter it below.<br />";
	}
	if(!$username){
		echo "Desired Username is a required field. Please enter it below.<br />";
	}
	include 'join_form.php'; // Show the form again!
	/* End the error checking and if everything is ok, we'll move on to
	 creating the user account */
	exit(); // if the error checking has failed, we'll exit the script!
}

/* Let's do some checking and ensure that the user's email address or username
 does not exist in the database */

 $sql_forum_email_check = mysql_query("SELECT user_email FROM forum_users WHERE user_email='$email_address'");
 $sql_email_check = mysql_query("SELECT email_address FROM users WHERE email_address='$email_address'");
 $sql_username_check = mysql_query("SELECT username FROM users WHERE username='$username'");
 $sql_forum_username_check = mysql_query("SELECT username FROM forum_users WHERE username='$username'");

 $email_check = mysql_num_rows($sql_email_check);
 $forum_email_check = mysql_num_rows($sql_forum_email_check);
 $username_check = mysql_num_rows($sql_username_check);
 $forum_username_check = mysql_num_rows($sql_forum_username_check);

 if(($email_check > 0) || ($username_check > 0) || ($forum_email_check > 0) || ($forum_username_check > 0)){
 	echo "Please fix the following errors: <br />";
 	if(($email_check > 0) || ($forum_email_check > 0)){
 		echo "<strong>Your email address has already been registered by another member in our database. Please submit a different Email address!<br />";
 		unset($email_address);
 	}
 	if(($username_check > 0) || ($forum_username_check > 0)){
 		echo "The username you have selected has already been registered by another member in our database. Please choose a different Username!<br />";
 		unset($username);
 	}
 	header("Location: index.html"); // Show the form again!
 	exit();  // exit the script so that we do not create this account!
 }

/* Everything has passed both error checks that we have done.
It's time to create the account! */

/* Random Password generator.
http://www.phpfreaks.com/quickcode/Random_Password_Generator/56.php

We'll generate a random password for the
user and encrypt it, email it and then enter it into the db.
*/

function makeRandomPassword() {
  $salt = "abchefghjkmnpqrstuvwxyz0123456789";
  srand((double)microtime()*1000000);
  	$i = 0;
  	while ($i <= 7) {
    		$num = rand() % 33;
    		$tmp = substr($salt, $num, 1);
    		$pass = $pass . $tmp;
    		$i++;
  	}
  	return $pass;
}

// $random_password = makeRandomPassword();

// $db_password = md5($random_password);
$db_password = md5($yourpassword);

// Enter info into the Database.
$info2 = htmlspecialchars($info);
$sql = mysql_query("INSERT INTO users (first_name, last_name, email_address, username, password, info, signup_date, decrypted_password)
		VALUES('$first_name', '$last_name', '$email_address', '$username', '$db_password', '$info2', now(), '$yourpassword')") or die (mysql_error());

$max_user_id = mysql_query("select max(user_id) from forum_users") or die (mysql_error());
$max_user_id = $max_user_id + 1;

$max_regdate = mysql_query("select max(user_regdate) from forum_users") or die (mysql_error());
$max_regdate = $max_regdate + 10;

$forum_sql = mysql_query("INSERT INTO forum_users (user_id, username, user_regdate, user_password, user_email, user_icq, user_website, user_occ, user_from, user_interests, user_sig, user_sig_bbcode_uid, user_avatar, user_avatar_type, user_viewemail, user_aim, user_yim, user_msnm, user_attachsig, user_allowsmile, user_allowhtml, user_allowbbcode, user_allow_viewonline, user_notify, user_notify_pm, user_popup_pm, user_timezone, user_dateformat, user_lang, user_style, user_level, user_allow_pm, user_active, user_actkey)
		VALUES('$max_user_id', '$username', '$max_regdate', '$db_password', '$email_address', '', '', '', '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 0, 0, 0.00, 'D M d, Y g:i a', NULL, NULL, 0, 1, 1, NULL)") or die (mysql_error());

if(!$sql){
	echo '<center><br><br><b>There has been an error creating your account. Please contact the webmaster.</b></center>';
} else {
	$userid = mysql_insert_id();
	$activatepath = "activate.php?id=$userid&code=$db_password";
	// Let's mail the user!
	$subject = "Membership request at $sitename";
	$message = "Dear $first_name $last_name,
	You are now registered at Castrol ZOOM Club!

	To activate your membership, please login here: $sitepath$activatepath

	Once you activate your membership, you will be able to login with the following information:
	Username: $username
	Password: $yourpassword
	Please keep this username and password in a location that is easily accessible by you.

	Thanks!
	Castrol ZOOM Club



	This is an automated response, please do not reply!";

	mail($email_address, $subject, $message, "From: $sitename <$adminemail>\nX-Mailer: PHP/" . phpversion());
	echo '<center><br><br><b>Your membership information has been mailed to your email address! Please check it and follow the directions!</b></center>';
}

include 'footer.php';

?>