<?
/*
*
*
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: Admin index
*    FileName $RCSfile: index.php,v $
*    Release: 1.8.5 ($Revision: 1.10 $)
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

$t->assign('config', $config);
$page = @$HTTP_GET_VARS['page'];
switch ($page){
 case 'menu':   $t->display("admin/menu.html");  break;
 case 'blank':  $t->display("admin/blank.html"); break;
 default:       $t->display("admin/index.html");
}
?>