<?

/*
*  User's signup page
*
*
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: Signup Page
*    FileName $RCSfile: signup.php,v $
*    Release: 1.8.5 ($Revision: 1.15 $)
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

###############################################################################
# CHECK_PAYMENT_FORM
#
# set $GLOBAL[error] if needed
# return 1/0 (valid/not-valid)
#
function check_payment_form(){
    global $error;
    global $vars;
    global $db;

    //
    if (!intval($vars['product_id'])) {
        $error[] = 'Please select Membership Type';
    }
    if (!strlen($vars['paysys_id'])){   
        $error[] = 'Please select Payment System';
    }
    if (!strlen($vars['name_f'])){
        $error[] = 'Please enter your First Name';
    }
    if (!strlen($vars['name_l'])){
        $error[] = 'Please enter your Last Name';
    }
    if (!check_email($vars['email'])){
        $error[] = 'Please enter valid Email';
    }
    if (!preg_match('/^\w{4}\w*$/', $vars['login'])){
        $error[] = "Please enter correct login. It should contain at least 4 letters, digits or _";
    }
    else if (!$db->check_uniq_login($vars['login'])){
        $error[] = "Login '$vars[login]' already used. Please enter another login";
    }
    if (!strlen($vars['pass0'])){
        $error[] = 'Please enter Password';
    }
    if ($vars['pass0'] != $vars['pass1']){
        $error[] = 'Password and Password Confirmation are different. Please reenter both';
    }
    return !count($error);
}

###############################################################################
# SHOW_PAYMENT_FORM
#
# get vars from database and plugins
# display $GLOBAL[error] if it set
# substitute previous entered parameters using Smarty
#
function show_payment_form(){
    global $t;
    global $error;
    global $db;

    $t->assign('error', $error);

    $products = $db->get_products_list();
    $paysystems = get_paysystems_list();
    foreach ($paysystems as $k=>$p)
        if (!$p['public']) unset($paysystems[$k]); 
        //remove paysystems such as manual
    
    $t->assign('products', $products);
    $t->assign('paysystems', $paysystems);
    $t->display('signup.html');
}

###############################################################################
##
##                             M  A  I  N 
##
###############################################################################

$t = & new_smarty();
$error = '';


$vars = & get_input_vars();

$error = array();
if ($vars['do_payment'] && check_payment_form()){
    // do payment !
    $product_id = $vars['product_id'];
    $login      = $vars['login'];
    $paysys_id  = $vars['paysys_id'];

    do { // to easy exit using break()
        $member_id = $db->add_pending_user($vars);
        if ($error) break;

        $product_id = intval($product_id);
        $product    = & get_product($product_id); //class Product
        $price      = $product->get_price();
        $begin_date = date('Y-m-d');
        $expire_date   = $product->get_expire($begin_date); //yyyy-mm-dd

        $payment_id = $db->add_waiting_payment($member_id, $product_id, 
            $paysys_id, $price, $begin_date, $expire_date, $vars);
        if ($error) {
            $db->delete_user($member_id);
            break;
        }
        $error = plugin_do_payment($paysys_id, $payment_id, $member_id, $product_id,
            $price, $begin_date, $expire_date, $vars);
        if ($error) {
            $db->delete_user($member_id);
            $db->delete_payment($payment_id);
            break;
        }

        exit();
    } while (0);
} 

show_payment_form();
?>
