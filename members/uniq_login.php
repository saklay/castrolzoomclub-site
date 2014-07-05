<?
/*
*  Small window. Checks for unique login (called from signup.inc.php)
*
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: Unique login check page
*    FileName $RCSfile: uniq_login.php,v $
*    Release: 1.8.5 ($Revision: 1.6 $)
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

$res = $db->check_uniq_login($login);
$t->assign('login', $login);
if (!$res){
    $t->display("uniq_login_exists.html");
} else {
    $t->display("uniq_login_free.html");
}




?>
