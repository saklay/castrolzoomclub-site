<?
/*
*
*
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: The installation file
*    FileName $RCSfile: check.inc.php,v $
*    Release: 0.9 ($Revision: 1.11 $)
*
* Please direct bug reports,suggestions or feedback to the cgi-central forums.
* http://www.cgi-central.net/forum/
*                                                                          
* aMember is free for both commercial and non-commercial use providing that the
* copyright headers remain intact and the links remain on the html pages.
* Re-distribution of this script without prior consent is strictly prohibited.
*
*/

////////////////// SAVE NAMESPACE BEFORE LITTER IT ///////////////////////////
$_list_vars = array_keys($GLOBALS);
//////////////////////////////////////////////////////////////////////////////
if (!is_array($_product_id)) die("Product ID is not defined in called script! Died.");

$root = dirname(__FILE__) . '/../../..'; ## set it to root_dir if wrong
if (!defined('INCLUDED_AMEMBER_CONFIG'))
    include("$root/config.inc.php");

function _amember_check_access(){
    global $_product_id;
    global $db;
    global $HTTP_POST_VARS;
    global $HTTP_SESSION_VARS;
    global $config;

    global $_amember_login, $_amember_pass, $_amember_id;
    if (ini_get('register_globals')){
        session_register('_amember_login');
        session_register('_amember_pass');
        session_register('_amember_id');
    }
    $_amember_login = & $HTTP_SESSION_VARS['_amember_login'];
    $_amember_pass  = & $HTTP_SESSION_VARS['_amember_pass'];
    $_amember_id    = & $HTTP_SESSION_VARS['_amember_id'];
    
    //to track current user info
    global $_amember_user, $_amember_product_ids;
    global $_amember_products, $_amember_subscriptions;
    $HTTP_SESSION_VARS['_amember_user']          = array();
    $HTTP_SESSION_VARS['_amember_product_ids']   = array();
    $HTTP_SESSION_VARS['_amember_products']      = array();
    $HTTP_SESSION_VARS['_amember_subscriptions'] = array();
    $_amember_user          = array();
    $_amember_product_ids   = array();
    $_amember_products      = array();
    $_amember_subscriptions = array();

    $l = $HTTP_POST_VARS['amember_login'];
    $p = $HTTP_POST_VARS['amember_pass'];
    if (!strlen($l)) {
        $l = $_amember_login;
        $p = $_amember_pass;
    }
    if (strlen($l) && strlen($p)){
        ////
        if (!$db->check_login($l, $p, $_amember_id)){
            return "Incorrect login/password. Try again";
        }
        if (($_product_id[0] != 'ONLY_LOGIN')
            &&
            !$db->check_access($l, $_product_id)){
            return "Access not allowed";
        } else {
            $_amember_login = $l;
            $_amember_pass  = $p;

            // assign user info to session var '_amember_id 
            // and to same template var 
            $_amember_user  = $db->get_user($_amember_id);

            // find out active subscriptions for this user
            $pl = (Array)$db->get_user_payments($_amember_id, 1);
            $today = date('Y-m-d');
            foreach ($pl as $pp){
                if (($pp['begin_date'] <= $today) && 
                    ($pp['expire_date'] >= $today)) {
                    $_amember_product_ids[]   = $pp['product_id'];
                    $_amember_subscriptions[] = $pp;
                }
            }
            $_amember_product_ids = array_unique($_amember_product_ids);
            foreach ($_amember_product_ids as $product_id){
                $_amember_products[] = $db->get_product($product_id);
            }

            if (ini_get('register_globals')){
                session_register('_amember_user');
                session_register('_amember_product_ids');
                session_register('_amember_products');
                session_register('_amember_subscriptions');
            }
            $HTTP_SESSION_VARS['_amember_user']          = $_amember_user         ;
            $HTTP_SESSION_VARS['_amember_product_ids']   = $_amember_product_ids  ;
            $HTTP_SESSION_VARS['_amember_products']      = $_amember_products     ;
            $HTTP_SESSION_VARS['_amember_subscriptions'] = $_amember_subscriptions;

            $db->log_access($_amember_id);
            return '';
        }
    } 
    return 'Please Login';
}    

function _amember_run(){
    if ($_amember_error = _amember_check_access()){
        $t = & new_smarty();
        $t->assign('error', $_amember_error);
        $t->display('cookie_login/login.html');
        exit();
    }
}

session_start();
_amember_run();

////////////////// CLEANUP NAMESPACE
foreach (array_keys($GLOBALS) as $k){
    if ($k == '_list_vars')             continue;
    if ($k == 'HTTP_SESSION_VARS')      continue;
    if ($k == 'HTTP_GET_VARS')          continue;
    if ($k == 'HTTP_POST_VARS')         continue;
    if ($k == 'HTTP_SERVER_VARS')       continue;
    if ($k == 'HTTP_REFERRER')          continue;
    if ($k == '_SESSION')               continue;
    if (session_is_registered($k))      continue;
    if (!in_array($k, $_list_vars)){
        unset($GLOBALS[$k]);
    }
}
unset($k);
unset($_list_vars);
?>