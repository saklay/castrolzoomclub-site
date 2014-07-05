<?                                                       
/*
*  User's cancel payment page. Displayed after failed payment.
*
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: User's failed payment page
*    FileName $RCSfile: cancel.php,v $
*    Release: 1.8.5 ($Revision: 1.3 $)
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

$t->display("cancel.html");

?>
