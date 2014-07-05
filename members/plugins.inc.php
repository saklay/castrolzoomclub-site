<?
/**
* Plugins functions
*
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: Plugins handling functions
*    FileName $RCSfile: plugins.inc.php,v $
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

/*
* Instantiated plugins
* @global mixed $___plugins
**/
global $___plugins;
$__plugins = array();

/*
* For plugin hooks setup
* @global mixed $___hooks
**/
global $___hooks;
$__hooks = array();

/**
* Read plugins config to $plugin_config
* It structured as:
*   $plugin_config[plugin_type=db|payment|protect][plugin_name] = assoc array
*
* @global mixed Global Config
* @global mixed Plugins Config
*/
function read_plugins_config(){
    global $config, $plugin_config;
    global $plugins;
    include("$config[root_dir]/config_plugins.inc.php");
    if (!count($plugins)) 
        fatal_error("Cannot open config_plugins or it is not configured");
}

/**
* Load Plugins
* Include all plugins of type to setup all hooks
*
* @param string $type Plugin Type = db|payment|protect
*
* @global array Plugins List
* @global mixed Script Config
*/
function load_plugins($type){
    global $plugins;
    global $config;
    foreach ($plugins[$type] as $name){
        $file = $config['plugins_dir'][$type]."/$name/$name.inc.php";
        if (!file_exists($file))
            fatal_error("Plugin file ($file) for plugin ($type/$name) not exists");

        $open = include($file);
    }
}

/**
* Setup Plugin Hook
* Setup plugin hook to be called at specified event
*
* @param string $hook Hook Name
* @param string $func_name Function Name to be called
*
* @global array Hooks List
*/
function setup_plugin_hook($hook, $func_name){
    global $__hooks;
    if (function_exists($func_name))
        $__hooks[$hook][$func_name] = 1;
    else
        fatal_error("Hook function not defined: '$func_name' for $hook");
}

/**
* Instantiate Plugin 
* Get it from cache if it already exists
*
* @param string $type Plugin Type = db|payment|protect
* @param string $name Plugin Name
* @return mixed Plugin Object
*
* @global array Plugins List
* @global mixed Script Config
* @global mixed Plugins Config
* @global mixed Plugins Cache
*/
function instantiate_plugin($type, $name, $need_to_include=0){
    global $plugins;
    global $config, $plugin_config;
    global $___plugins; //array of existsing plugins, indexed by [type][name]

    if (!strlen($type))
        fatal_error("Plugin type is empty in instantiate_plugin(NULL, '$type')");
    if (!strlen($name))
        fatal_error("Plugin name is empty in instantiate_plugin('$type',NULL)");
    if (!in_array($name, $plugins[$type]))
        fatal_error("Plugin '$name' is not enabled. Died");


    $class = $type . "_" . $name;
    $exists = & $___plugins[$type][$name];           
    if (gettype($exists) == 'object')
        return $exists;
    
    if ($need_to_include){
        $file = $config['plugins_dir'][$type]."/$name/$name.inc.php";
        if (!file_exists($file))
            fatal_error("Plugin file ($file) for plugin ($type/$name) not exists");
        $open = include($file);
    }

    if (!class_exists($class)) 
        fatal_error("Error in plugin $type/$name: class $class not exists!");
    return $___plugins[$type][$name] = new $class($plugin_config[$type][$name]);
}

/**
* Instantiate Database Plugin 
* Return always first of database plugins.
* Use {@link instaniate_plugin}
*
* @param string $name Database Plugin Name
* @return mixed db Object
*
* @global array Plugins List
*/
function instantiate_db(){
    global $plugins;
    return instantiate_plugin('db', $plugins['db'][0], 1);    
}

///////////////////// PAYMENT PLUGINS hooks ////////////////////////////

function plugin_do_payment($paysys_id, $payment_id, $member_id, $product_id,
            $price, $begin_date, $expire_date, &$vars){
    $pay_plugin = &instantiate_plugin('payment', $paysys_id);
    return $pay_plugin->do_payment($payment_id, $member_id, $product_id,
            $price, $begin_date, $expire_date, $vars);
}

function plugin_validate_thanks($paysys_id, &$vars){
    $pay_plugin = &instantiate_plugin('payment', $paysys_id);
    return $pay_plugin->validate_thanks($vars);
    
}

function plugin_process_thanks($paysys_id, &$vars){
    $pay_plugin = &instantiate_plugin('payment', $paysys_id);
    return $pay_plugin->process_thanks($vars);
}

//////////////////// PROTECT PLUGINS hooks ////////////////////////////////

function plugin_finish_waiting_payment($payment_id, $member_id=0){
    //payment finished ok - call plugins to possible update databases, etc.
    global $__hooks;
    foreach ((array)$__hooks['finish_waiting_payment'] as $func_name=>$c){
        $func_name($payment_id, $member_id);
    }
    ### fix me! Signup mail ####
    global $config;
    if ($payment_id) {
        // check if it's first subscription
        global $db;
        $payment = $db->get_payment($payment_id);
        $payments = $db->get_user_payments($payment['member_id'], 1);
        $exists_payments = 0;
        foreach ($payments as $p){
            if ($p['product_id'] == $payment['product_id']){
                $exists_payments++;
            }
        }
        // send mail only if it FIRST payment for this product
        if (($exists_payments == 1) && $config['send_signup_mail'])
            mail_signup_user($payment_id);
    }
}

function plugin_update_users($member_id=0){
    //payment finished ok - call plugins to possible update databases, etc.
    global $__hooks;
    if (!is_array($__hooks['update_users'])) return;
    foreach ($__hooks['update_users'] as $func_name=>$c){
        $func_name($payment_id);
    }
}

function plugin_update_payments($payment_id=0, $member_id=0){
    //payment finished ok - call plugins to possible update databases, etc.
    global $__hooks;
    if (!is_array($__hooks['update_payments'])) return;
    foreach ($__hooks['update_payments'] as $func_name=>$c){
        $func_name($payment_id, $member_id);
    }
}

function plugin_hourly(){
    global $__hooks;
    if (!is_array($__hooks['hourly'])) return;
    foreach ($__hooks['hourly'] as $func_name=>$c){
        $func_name();
    }
}

function plugin_daily(){
    global $__hooks;
    if (!is_array($__hooks['daily'])) return;
    foreach ($__hooks['daily'] as $func_name=>$c){
        $func_name();
    }
}

////////////////////////////////////////////////////////////////////////////


function check_cron(){
    global $db;
    $last_runned = $db->load_cron_time(1);
    $h_diff = date('H') - date('H', $last_runned);
    $d_diff = date('d') - date('d', $last_runned);
    if ($h_diff || $d_diff) $db->save_cron_time(1);
    if ($h_diff) plugin_hourly();
    if ($d_diff) plugin_daily();
}

// INITIALIZATION
read_plugins_config();

global $db;
/*
* Database (db) object
* @global object $db
**/
$db = & instantiate_db();

load_plugins('protect');
load_plugins('payment');
check_cron();


?>
