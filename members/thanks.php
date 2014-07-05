<?                                                       
/*
*  User's thanks page. Displayed after sucessull payment.
*
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: Thanks page
*    FileName $RCSfile: thanks.php,v $
*    Release: 1.8.5 ($Revision: 1.11 $)
*
* Please direct bug reports,suggestions or feedback to the cgi-central forums.
* http://www.cgi-central.net/forum/
*                                                                          
* aMember is free for both commercial and non-commercial use providing that the
* copyright headers remain intact and the links remain on the html pages.
* Re-distribution of this script without prior consent is strictly prohibited.
*                                                                                 
*/
$rd = dirname(__FILE__);
include($rd.'/config.inc.php');

###############################################################################
##
##                             M  A  I  N 
##
###############################################################################
$t = & new_smarty();
$error = '';
$vars = & get_input_vars();

if (!strlen($paysys_id))
    $paysys_id = $vars['paysys_id'];

if ($paysys_id){ //should be passed from url or plugins/payment/../thanks.php
    //process plugin work if payment system pass info to thanks page
    if (($error = plugin_validate_thanks($paysys_id, $vars))
         || ($error = plugin_process_thanks($paysys_id, $vars))
       ){
        $t->assign('error', $error);
        $t->display('thanks_error.html');
        exit();
    }
}

$t->display("thanks.html");

?>
