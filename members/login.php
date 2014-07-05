<?
/*
*   Members page, used to login. If user have only 
*  one active subscription, redirect them to url
*  elsewhere, redirect to member.php page
*
*
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: Member display page
*    FileName $RCSfile: login.php,v $
*    Release: 1.8 ($Revision: 1.3 $)
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
$_product_id = array('ONLY_LOGIN');

include($config['plugins_dir']['protect'] . '/php_include/check.inc.php');

$payments = & $db->get_user_payments(intval($HTTP_SESSION_VARS['_amember_id']), 1);
usort($payments, 'rcmp_begin_date');
$now = date('Y-m-d');
$urls = array();
foreach ($payments as $k=>$v){
    if (($v['expire_date'] >= $now) && ($v['begin_date'] <= $now)) {
        $p = get_product($v['product_id']);
        $url = $p->config['url'];
        if (strlen($url)){
            $urls[] = $url;
        }
    }
}
if (count($urls) == 1){
    $redirect = sprintf("http://%s:%s@%s%s", 
        $_amember_user['login'], $_amember_user['pass'],
        $HTTP_SERVER_VARS['HTTP_HOST'], $urls[0]);
} else {
    $redirect = $config['root_url'] . "/member.php";
}
#print_r($urls);
html_redirect("$redirect", 0, 'Redirect', "You'll be redirected into the protected area");
?>
