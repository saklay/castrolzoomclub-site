<?
/*
*
*
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: Admin Login
*    FileName $RCSfile: login.inc.php,v $
*    Release: 1.8.5 ($Revision: 1.13 $)
*
* Please direct bug reports,suggestions or feedback to the cgi-central forums.
* http://www.cgi-central.net/forum/
*                                                                          
* aMember is free for both commercial and non-commercial use providing that the
* copyright headers remain intact and the links remain on the html pages.
* Re-distribution of this script without prior consent is strictly prohibited.
*
*/

global $HTTP_SESSION_VARS;

function _check_admin_password($l, $p){
    global $config;
    $cl = $config['admin_login'];
    $cp = $config['admin_pass'];
    if ($l != $cl) return 0;
    if ($config['admin_pass_encrypted']){
        return crypt($p, $cp) == $cp;
    } else {
        return $p == $cp;
    }
}


function admin_auth(){
    global $config;
    global $HTTP_POST_VARS;
    global $HTTP_SESSION_VARS;
    global $vars;
    $do_login = $vars['do_login'];

    $_admin_login = $HTTP_SESSION_VARS['_admin_login'];
    $_admin_pass  = $HTTP_SESSION_VARS['_admin_pass'];

    $l = $_admin_login;
    $p = $_admin_pass;
    if ($do_login) {
        $l = $HTTP_POST_VARS['login'];
        $p = $HTTP_POST_VARS['passwd'];
    }
    if (strlen($l) && strlen($p)){
        ////
        if (!_check_admin_password($l, $p)){
//            $HTTP_SESSION_VARS['_admin_login'] = '';
//            $HTTP_SESSION_VARS['_admin_pass']  = '';                    
            return "Incorrect login/password. Try again";
        } else {
            global $_admin_login;
            global $_admin_pass;
            $_admin_login = $HTTP_SESSION_VARS['_admin_login'] = $l;
            $_admin_pass  = $HTTP_SESSION_VARS['_admin_pass']  = $p;                    
            session_register('_admin_login');
            session_register('_admin_pass');
            return '';
        }
    } 
    return 'Please Login';
}    


function admin_login_form($err){
    global $t;
    global $do_login;
    if ($err)
        if ($do_login){
        $t->assign('error', $err);
        } else {
        $t->assign('error', 'Please login');
        }
    $t->display('admin/login.html');
    exit();
}

///////////////////////////////////////////////////////////////////////////////

$vars = get_input_vars(); 
session_start();
if($err = admin_auth()) {                // authentication failed
  admin_login_form($err);               // display login form
}
session_write_close();
session_start();
if ($t)
    $t->assign('SID', session_name().'='.session_id());
unset($vars);
?>