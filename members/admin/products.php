<?
/*
*
*
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: Admin Products
*    FileName $RCSfile: products.php,v $
*    Release: 1.8.5 ($Revision: 1.14 $)
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


function display_products_list(){
    global $db,$t;
    $pl = $db->get_products_list();
    $t->assign(pl, $pl);
    $t->display("admin/products.html");
}

function edit_product(){
    global $product_id;
    global $t, $db;
    $p = $db->get_product($product_id);
    if (!$p) {
        fatal_error("Cannot open product #$product_id");
    }
    $t->assign('p', $p);
    global $product_additional_fields;
    $t->assign('product_additional_fields', $product_additional_fields);
    $t->display('admin/product.html');
}

function add_product(){
    global $product_id;
    global $t, $db;
    $t->assign('add', 1);
    global $product_additional_fields;
    $t->assign('product_additional_fields', $product_additional_fields);
    $t->display('admin/product.html');
}

function edit_save(){
    global $PHP_SELF;
    global $db, $t;
    $vars = get_input_vars();

    $p = new product($vars);

    global $product_additional_fields;
    foreach ($product_additional_fields as $f){
        if ($f['validate_func'])
            foreach ((array)$f['validate_func'] as $func){
                if (!function_exists($func))
                    fatal_error("Validation function '$func' for field: '$f[name]' not defined. Internal error");
                if ($err = $func($p, $f['name']))
                    fatal_error("Cannot update product: $err");
            }
    }

    $err = $db->update_product($vars['product_id'], $p->config);
    if ($err) {
        fatal_error("Cannot update product info: $err");
    }
    $t->assign('link', $PHP_SELF);
    $t->display("admin/product_saved.html");
}

function add_save(){
    global $PHP_SELF;
    global $db, $t;
    $vars = get_input_vars();

    $p = new product($vars);

    global $product_additional_fields;
    foreach ($product_additional_fields as $f){
        if ($f['validate_func'])
            foreach ((array)$f['validate_func'] as $func){
                if (!function_exists($func))
                    fatal_error("Validation function '$func' for field: '$f[name]' not defined. Internal error");
                if ($err = $func($p, $f['name']))
                    fatal_error("Cannot add product: $err");
            }
    }

    $product_id = $db->add_product($p->config);
    if (!$product_id) {
        fatal_error("Cannot insert product");
    }
    $t->assign('link', $PHP_SELF);
    $t->display("admin/product_saved.html");
}

function delete(){
    global $product_id;
    global $PHP_SELF;
    global $db, $t;

    $err = $db->delete_product($product_id);
    if ($err) {
        fatal_error("Cannot delete product: $err");
    }
    $t->assign('msg', 'Product deleted');
    $t->assign('link', $PHP_SELF);
    $t->display("admin/product_saved.html");
}

////////////////////////////////////////////////////////////////////////////
//
//                      M A I N
//
////////////////////////////////////////////////////////////////////////////

switch ($action){
    case 'edit':
        edit_product();
        break;
    case 'edit_save':
        edit_save();
        break;
    case 'add':
        add_product();
        break;
    case 'add_save':
        add_save();
        break;
    case 'delete':
        delete();
        break;
    case 'browse': case '': 
        display_products_list();
        break;
    default: 
        fatal_error("Unknown action: '$action' for $PHP_SELF");
}


?>