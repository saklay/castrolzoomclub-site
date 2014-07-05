<?
/*
*
*
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: Admin Access log
*    FileName $RCSfile: access_log.php,v $
*    Release: 1.8.5 ($Revision: 1.9 $)
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

settype($start, 'integer'); 
settype($count, 'integer'); if (!$count) $count = 20;
$list = $db->get_access_log(0, $start, $count);
$all_count = $db->get_access_log_count();

$t->assign('list', $list);
$t->assign('count', $count);
$t->display("admin/access_log.html");

?>