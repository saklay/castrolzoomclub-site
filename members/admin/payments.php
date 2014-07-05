<?
/*
*
*
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: Admin Payments
*    FileName $RCSfile: payments.php,v $
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

if ($beg_dateDay)
    set_date_from_smarty('beg_date', $vars);
else
    $vars['beg_date'] = date('Y-m-d');

if ($end_dateDay)
    set_date_from_smarty('end_date', $vars);
else
    $vars['end_date'] = date('Y-m-d');

$t->assign('beg_date', $vars['beg_date']);
$t->assign('end_date', $vars['end_date']);

$list = $db->get_payments($vars['beg_date'], $vars['end_date'], 
            intval($only_completed)); 

$t->assign('list', $list);

$t->display('admin/payments.html');


?>