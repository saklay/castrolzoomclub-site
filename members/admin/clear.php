<?
/*
*
*
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: Admin clear old records
*    FileName $RCSfile: clear.php,v $
*    Release: 1.8.5 ($Revision: 1.8 $)
*
* Please direct bug reports,suggestions or feedback to the cgi-central forums.
* http://www.cgi-central.net/forum/
*                                                                          
* aMember is free for both commercial and non-commercial use providing that the
* copyright headers remain intact and the links remain on the html pages.
* Re-distribution of this script without prior consent is strictly prohibited.
*
*/

include "../config.inc.php";
$t = new_smarty();
include "login.inc.php";
    
$vars = get_input_vars();
extract($vars, EXTR_OVERWRITE);

if ($clear){
    $vars = get_input_vars();
    set_date_from_smarty('dat', $vars);    
    if ($vars['access_log'])    $db->clear_access_log($vars['dat']);
    if ($vars['error_log'])     $db->clear_error_log($vars['dat']);
    if ($vars['inc_users'])     $db->clear_incomplete_users($vars['dat']);
    if ($vars['inc_payments'])  $db->clear_incomplete_payments($vars['dat']);
    $t->display('admin/clear_save.html');
    exit();
}


$t->assign('dt', time() - 3600 * 24 * 30);
$t->display("admin/clear.html");

?>