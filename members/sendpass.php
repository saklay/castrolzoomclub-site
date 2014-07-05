<?
/*
*   Send lost password
*
*
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: Send lost password page
*    FileName $RCSfile: sendpass.php,v $
*    Release: 1.8.5 ($Revision: 1.5 $)
*
* Please direct bug reports,suggestions or feedback to the cgi-central forums.
* http://www.cgi-central.net/forum/
*                                                                          
* aMember is free for both commercial and non-commercial use providing that the
* copyright headers remain intact and the links remain on the html pages.
* Re-distribution of this script without prior consent is strictly prohibited.
*    
*/

include('./config.inc.php');
$t = & new_smarty();

$vars = get_input_vars();
$login = $vars['login'];

$ul = $db->users_find_by_string($login, 'login', 1);
if (!count($ul))
    $ul = $db->users_find_by_string($login, 'email', 1);

if ( count($ul) ){
    $u = $ul[0];
    $t->assign('login',  $u['login']);
    $t->assign('pass',   $u['pass']);
    $t->assign('email',  $u['email']);
    $t->assign('name_f', $u['name_f']);
    $t->assign('name_l', $u['name_l']);
    $msg = $t->fetch("sendpass.txt");
    $admin_email = $config['admin_email'];

    mail_customer($u['email'], $msg, "Password Remainder");

    $t->display('sendpass_ok.html');
} else {
    $t->assign('login', $login);
    $t->display('sendpass_failed.html');
}

?>
