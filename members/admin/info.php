<?
/*
*
*
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: Admin Info / PHP
*    FileName $RCSfile: info.php,v $
*    Release: 1.8.5 ($Revision: 1.4 $)
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

if ($config['disable_info']) die("Disabled");

$t->assign('config', $config);
$t->assign('plugins', $plugins);
$t->assign('plugins_config', $plugins_config);
$t->assign('root_url', $config['root_url']);
$t->display("admin/info.html");

?>