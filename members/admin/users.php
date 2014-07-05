<?                       
/*
*
*
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: Admin users 
*    FileName $RCSfile: users.php,v $
*    Release: 1.8.5 ($Revision: 1.20 $)
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

function get_az(){
    $az = array();
    for ($c=ord('A');$c<=ord('Z');$c++){
        $az[chr($c)] = 0; 
    }
    return $az;
}

function display_user_list(){
    global $letter;
    global $active;
    global $db, $t;
    $ul = & $db->get_users_list($letter, intval($active));
    $t->assign('ul', $ul);


    $t->assign('az', get_az());
    $t->display('admin/users.html');
}

function display_access_log(){
    global $member_id;
    global $start, $count;
    global $all_count;
    global $db, $t;

    if (!$count) $count = 20;
    $list = $db->get_access_log($member_id, $start, $count);
    $all_count = $db->get_access_log_count($member_id);

    $t->assign('list', $list);
    $t->assign('count', $count);
    $t->display("admin/user_access_log.html");    
}

function display_search_form(){
    global $db, $t;

    $t->assign('az', get_az());

    $products = & $db->get_products_list();
    $pp = array();
    foreach ($products as $p) $pp[ $p['product_id'] ] = $p['title'] ;
    $t->assign('products', $pp);

    $t->display('admin/user_search.html');
}

function search_by_string(){
    global $q, $q_where;
    global $db, $t;
    $ul = & $db->users_find_by_string($q, $q_where);
    if (count($ul) == 0){
        $t->assign('error', 'Nothing was found by your request. Try to redefine search terms');
        display_search_form();
        return;
    }
    $t->assign('ul', $ul);
    $t->display('admin/user_search_res.html');
}

function search_by_product(){
    global $product_id, $include_expired;
    global $db, $t;
    $ul = & $db->users_find_by_product($product_id, $include_expired);
    if (count($ul) == 0){
        $t->assign('error', 'Nothing was found by your request. Try to redefine search terms');
        display_search_form();
        return;
    }
    $t->assign('ul', $ul);
    $t->display('admin/user_search_res.html');
}

function search_by_date(){
    global $HTTP_GET_VARS, $search_type;
    global $db, $t;
    set_date_from_smarty('date', $HTTP_GET_VARS);
    print $date;
    $ul = & $db->users_find_by_date($HTTP_GET_VARS['date'], $search_type);
    if (count($ul) == 0){
        $t->assign('error', 'Nothing was found by your request. Try to redefine search terms');
        display_search_form();
        return;
    }
    $t->assign('ul', $ul);
    $t->display('admin/user_search_res.html');
}

function display_add_form(){
    global $db, $t;
    $t->assign('add', 1);
    global $member_additional_fields;
    $t->assign('member_additional_fields', $member_additional_fields);
    $t->display('admin/user_form.html');
}

function display_edit_form(){
    global $member_id;
    global $db, $t;
    $u = & $db->get_user(intval($member_id));
    global $member_additional_fields;
    $t->assign('member_additional_fields', $member_additional_fields);
    $t->assign('u', $u);
    $t->display('admin/user_form.html');
}

function add_save(){
    global $PHP_SELF;
    global $db, $t;
    global $member_additional_fields;

    $vars = get_input_vars();
    $vars['pass0'] = $vars['pass'];
    if (!$db->check_uniq_login($vars['login'])) {
        fatal_error("User '$vars[login] already exists'. Press 'Back' and select other login", 0);
    }

    foreach ($member_additional_fields as $f){
        $fname = $f['name'];
        if (isset($vars[$fname]))
            $vars['data'][$fname] = $vars[$fname];
    }
    foreach ($member_additional_fields as $f){
        $fname = $f['name'];
        if ($f['validate_func'])
            foreach ((array)$f['validate_func'] as $func){
                if (!function_exists($func))
                    fatal_error("Validation function '$func' for field: '$fname' not defined. Internal error", 0);
                if ($err = $func($vars, $fname))
                    fatal_error("Cannot update member: $err", 0);
            }
    }
    foreach ($member_additional_fields as $f){
        $fname = $f['name'];
        $vars[$fname] = $vars['data'][$fname];
        unset($vars['data'][$fname]);
    }

    $member_id = $db->add_pending_user( $vars);

    $t->assign('member_id', $member_id);
    $t->assign('msg', "User added. Click on 'User Payments' link in top to subscribe him.");
    $t->assign('link', $PHP_SELF);
    $t->display("admin/user_saved.html");
}

function delete_user(){
    global $member_id;
    global $PHP_SELF;
    global $db, $t;
    $db->delete_user($member_id);
    $t->assign('msg', "User deleted");
    $t->assign('link', $PHP_SELF);
    $t->display("admin/user_saved.html");
}


function edit_save(){
    global $PHP_SELF;
    global $db, $t;
    global $member_additional_fields;

    $vars = get_input_vars();

    foreach ($member_additional_fields as $f){
        $fname = $f['name'];
        if (isset($vars[ $fname ]))
            $vars['data'][ $fname ] = $vars[ $fname ];
        unset($vars[ $fname ]);
    }
    foreach ($member_additional_fields as $f){
        $fname = $f['name'];
        if ($f['validate_func'])
            foreach ((array)$f['validate_func'] as $func){
                if (!function_exists($func))
                    fatal_error("Validation function '$func' for field: '$fname' not defined. Internal error");
                if ($err = $func($vars, $fname))
                    fatal_error("Cannot update member: $err");
            }
    }

    $err = $db->update_user($vars['member_id'], $vars);
    if ($err) {
        fatal_error("Cannot update user info: $err");
    }
    $t->assign('link', $PHP_SELF);
    $t->display("admin/user_saved.html");
}

function edit_payment(){
    global $member_id, $payment_id;
    global $db, $t;
    $payments = & $db->get_user_payments(intval($member_id));
    foreach ($payments as $p)
        if ($p['payment_id'] == $payment_id) 
            $t->assign('p', $p);

    $products = & $db->get_products_list();
    $pp = array();
    foreach ($products as $p) $pp[ $p['product_id'] ] = $p['title'] ;
    $t->assign('products', $pp);

    $paysystems = get_paysystems_list();
    $pp = array();
    foreach ($paysystems as $p) $pp[ $p['paysys_id'] ] = $p['title'] ;
    $t->assign('paysystems', $pp);

    $t->display('admin/user_payment.html');
}

function del_payment(){
    global $member_id, $payment_id;
    global $PHP_SELF;
    global $db, $t;

    $err = $db->delete_payment($payment_id);    
    if ($err) {
        fatal_error("Cannot delete payment: $err");
    }

    $t->assign('msg', 'Payment deleted');
    $t->assign('link', $PHP_SELF);
    $t->display('admin/user_saved.html');
}

function display_payments_form(){
    global $member_id;
    global $db, $t;
    $payments = & $db->get_user_payments(intval($member_id));
    $t->assign('payments', $payments);

    $products = & $db->get_products_list();
    $pp = array();
    foreach ($products as $p) $pp[ $p['product_id'] ] = $p['title'] ;
    $t->assign('products', $pp);

    $paysystems = get_paysystems_list();
    $pp = array();
    foreach ($paysystems as $p) $pp[ $p['paysys_id'] ] = $p['title'] ;
    $t->assign('paysystems', $pp);

    $t->display('admin/user_payments.html');
}

function payment_save(){
    global $HTTP_POST_VARS;
    global $PHP_SELF;
    global $db, $t;
    set_date_from_smarty('begin_date',  $HTTP_POST_VARS);
    set_date_from_smarty('expire_date',  $HTTP_POST_VARS);
    $err = $db->update_payment($HTTP_POST_VARS['payment_id'], $HTTP_POST_VARS);
    if ($err) {
        fatal_error("Cannot update payment info: $err");
    }
    $t->assign('link', $PHP_SELF);
    $t->display("admin/user_saved.html");
}

function payment_add(){
    global $HTTP_POST_VARS;
    global $PHP_SELF;
    global $db, $t;
    set_date_from_smarty('begin_date',  $HTTP_POST_VARS);
    set_date_from_smarty('expire_date',  $HTTP_POST_VARS);
    $err = $db->add_payment($HTTP_POST_VARS);
    if ($err) {
        fatal_error("Cannot add payment: $err");
    }
    $t->assign('link', $PHP_SELF);
    $t->display("admin/user_saved.html");
}

////////////////////////////////////////////////////////////////////////////
//
//                      M A I N
//
////////////////////////////////////////////////////////////////////////////
$vars = get_input_vars();
$member_id = $vars['member_id'];
$t->assign('member_id', $vars['member_id']);
switch (@$vars['action']){
    case 'access_log':
        display_access_log();
        break;
    case 'add_form':
        display_add_form();
        break;
    case 'add_save':
        add_save();
        break;
    case 'search_form':
        display_search_form();
        break;
    case 'search_by_string':
        search_by_string();
        break;
    case 'search_by_product':
        search_by_product();
        break;
    case 'search_by_date':
        search_by_date();
        break;
    case 'edit':
        display_edit_form();
        break;
    case 'delete':
        delete_user();
        break;
    case 'edit_save':
        edit_save();
        break;
    case 'payments':
        display_payments_form();
        break;
    case 'edit_payment':
        edit_payment();
        break;
    case 'del_payment':
        del_payment();
        break;
    case 'payment_save':
        payment_save();
        break;
    case 'payment_add':
        payment_add();
        break;
    case 'browse': case '': 
        display_user_list();
        break;
    default: 
        fatal_error("Unknown action: '$action' for users.php");
}


?>