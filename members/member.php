<?
/*
*   Members page. Used to renew subscription.
*
*
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: Member display page
*    FileName $RCSfile: member.php,v $
*    Release: 1.8 ($Revision: 1.12 $)
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

////////////////////////////////////////////////////////////////////////

function rcmp_begin_date($a, $b){
    return strcmp($b['begin_date'], $a['begin_date']);
}

function get_begin_date($member_id, $product_id){
    global $db;
    $payments = & $db->get_user_payments(intval($member_id));
    $date = date('Y-m-d');
    foreach ($payments as $p){
        if (($p['product_id'] == $product_id) &&
            ($p['expire_date'] > $date) &&
            ($p['completed'] > 0)
            ) 
            $date = $p['expire_date'];
    }
    list($y,$m,$d) = split('-', $date);
    $date = date('Y-m-d', mktime(0,0,0,$m, $d, $y));
    return $date;
}


function do_renew(){
    global $HTTP_SESSION_VARS;
    global $_amember_id;
    global $db, $t;
    $vars = & get_input_vars();
    $member_id = intval($_amember_id);
    $paysys_id = $vars['paysys_id'];
    $product_id = intval($vars['product_id']);
    if (!$product_id) {
        $t->assign('error', 'Please select product (subscription type) to renewal');
        return;
    }
    if (!$paysys_id) {
        $t->assign('error', 'Please select payment system for payment');
        return;
    }
    do { // to easy exit using break()
        $product_id = intval($product_id);
        $product    = & get_product($product_id); //class Product
        $price      = $product->get_price();
        $begin_date = get_begin_date($_amember_id, $product_id);
        $expire_date   = $product->get_expire($begin_date); //yyyy-mm-dd

        $payment_id = $db->add_waiting_payment($member_id, $product_id, 
            $paysys_id, $price, $begin_date, $expire_date, $vars);
        if ($error) break;

        $error = plugin_do_payment($paysys_id, $payment_id, $member_id, $product_id,
            $price, $begin_date, $expire_date, $vars);
        if ($error) {
            $db->delete_payment($payment_id);
            break;
        }
        exit();
    } while (0);
    //if we here, error was occured
    $t->assign('error', $error);
    return;    
}

///////////////////////// MAIN /////////////////////////////////////////
$_amember_id = $HTTP_SESSION_VARS['_amember_id'];

if ($HTTP_POST_VARS['action'] == 'renew'){
    do_renew();
}

// get product list (to fill $_product_id also)
$products = & $db->get_products_list();
$pp = array();
$_product_id = array();
foreach ($products as $p)   {
    $pp[ $p['product_id'] ] = $p['title'] ;
    $_product_id[] = $p['product_id'];
}
$t->assign('products', $pp);

$payments = & $db->get_user_payments(intval($_amember_id), 1);
usort($payments, 'rcmp_begin_date');
$now = date('Y-m-d');
foreach ($payments as $k=>$v){
    $payments[$k]['is_active'] = 
    (($v['expire_date'] >= $now) && ($v['begin_date'] <= $now))? 1 : 0;
}
$t->assign('payments', $payments);

$paysystems = get_paysystems_list();
$pp = array();
foreach ($paysystems as $p) 
    if ($p['public'])
        $pp[ $p['paysys_id'] ] = $p['title'] ;
$t->assign('paysystems', $pp);

$t->display('member.html');
?>
