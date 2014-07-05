<?
/*
*
*
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: The installation file
*    FileName $RCSfile: logout.php,v $
*    Release: 0.9 ($Revision: 1.7 $)
*
* Please direct bug reports,suggestions or feedback to the cgi-central forums.
* http://www.cgi-central.net/forum/
*                                                                          
* aMember is free for both commercial and non-commercial use providing that the
* copyright headers remain intact and the links remain on the html pages.
* Re-distribution of this script without prior consent is strictly prohibited.
*
*/

include("../../../config.inc.php");
session_start();
$to_delete = array();
foreach ($HTTP_SESSION_VARS as $k=>$v){
   if (!preg_match('/^_amember/', $k)) continue;
   $to_delete[] = $k;
}

foreach ($to_delete as $k){
   if (ini_get('register_globals'))
       session_unregister($k);
   else
       unset($HTTP_SESSION_VARS[$k]);
   unset($$k);
}

session_write_close();

if (!strlen($plugin_config['protect']['php_include']['redirect']))
    $plugin_config['protect']['php_include']['redirect'] = 
            'http://' . $HTTP_SERVER_VARS['HTTP_HOST'] . '/';
html_redirect($plugin_config['protect']['php_include']['redirect'], 1, 'Logout', 'Logged out');
?>