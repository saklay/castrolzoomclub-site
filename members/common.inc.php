<?
/**
* This file contain commonly used subroutines
*
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: Common Routines
*    FileName $RCSfile: common.inc.php,v $
*    Release: 1.8.5 ($Revision: 1.23 $)
*
* Please direct bug reports,suggestions or feedback to the cgi-central forums.
* http://www.cgi-central.net/forum/
*                                                                          
* aMember is free for both commercial and non-commercial use providing that the
* copyright headers remain intact and the links remain on the html pages.
* Re-distribution of this script without prior consent is strictly prohibited.
*                                                                                 
*/

$config['version'] = '1.8.5';


/**
* Create new Smarty object 
* @return double Smarty to newly created Smarty object
*
*/
function new_smarty(){
    global $config;
    switch ($config['tpl_cache_level']){
    case '2':
        $t = new Smarty();
        $t->force_compile = 0;
        break;
    case '1': 
        require_once($config['root_dir'].'/smarty/SmartySingleDir.class.php');
        $t = new SmartySingleDir();
        $t->force_compile = 0;
        break;
    case '0': default:
        require_once($config['root_dir'].'/smarty/SmartyNoWrite.class.php');
        $t = new SmartyNoWrite();
        $t->force_compile = 1;
        $t->compile_check = 1;
        break;
    }
    $t->template_dir = "$config[root_dir]/templates";
    $t->compile_dir  = "$config[root_dir]/templates_c";

    ///
    $t->assign('config', $config);
    return $t;
}

/**
* Check email using regexes
* @param string email
* @return bool true if email valid, false if not
*/

function check_email($email) {
    #characters allowed on name: 0-9a-Z-._ on host: 0-9a-Z-. on between: @
    if (!preg_match('/^[0-9a-zA-Z\.\-\_]+\@[0-9a-zA-Z\.\-]+$/', $email))
        return false;

    #must start or end with alpha or num
    if ( preg_match('/^[^0-9a-zA-Z]|[^0-9a-zA-Z]$/', $email))
        return false;

    #name must end with alpha or num
    if (!preg_match('/([0-9a-zA-Z_]{1})\@./',$email) )                    
        return false;

    #host must start with alpha or num
    if (!preg_match('/.\@([0-9a-zA-Z_]{1})/',$email) )                    
        return false;

    #pair .- or -. or -- or .. not allowed
    if ( preg_match('/.\.\-.|.\-\..|.\.\..|.\-\-./',$email) )
        return false;

    #pair ._ or -_ or _. or _- or __ not allowed
    if ( preg_match('/.\.\_.|.\-\_.|.\_\..|.\_\-.|.\_\_./',$email) )
        return false;

    #host must end with '.' plus 2-5 alpha for TopLevelDomain
    if (!preg_match('/\.([a-zA-Z]{2,5})$/',$email) )
        return false;

    return true;
}

/**
* Retrieve input vars, trim spaces and return as array
* @return array array of input vars (HTTP_POST_VARS or HTTP_GET_VARS)
*
*/
function get_input_vars(){
    global $HTTP_SERVER_VARS;
    $REQUEST_METHOD = $HTTP_SERVER_VARS['REQUEST_METHOD'];
    global $HTTP_POST_VARS;
    global $HTTP_GET_VARS;

    $vars = $REQUEST_METHOD == 'POST' ? $HTTP_POST_VARS : $HTTP_GET_VARS;
    foreach ($vars as $k=>$v){
        if (is_array($v)) continue;
        if (get_magic_quotes_gpc()) $v = stripslashes($v);
        $vars[$k] = trim($v);
    }
    return $vars;
}

/**
* Display fatal error to user. 
* Should send mail and save log (not implemented yet)
* Exit current script
* return bool should never return
*/
function fatal_error($error){
    global $config, $db;
    global $in_fatal_error; //!
    $in_fatal_error++;
    if ($in_fatal_error > 2){
        die("<br><br><b>fatal_error called twice</b>");
    }
    $t = & new_smarty();    
    $t->assign('error', $error);
    $t->assign('admin_email', $config['admin_email']);
    $t->display("fatal_error.html");
    // log error
    $db->log_error($error);
    exit;
}

function set_date_from_smarty($prefix, &$vars){
    return $vars[$prefix] = sprintf('%04d-%02d-%02d', 
        $vars[$prefix.  'Year'],
        $vars[$prefix.  'Month'],
        $vars[$prefix.  'Day']
    );
}

function mail_signup_user($payment_id){
    global $t, $db, $config;
    if (!is_object($t))
        $t = & new_smarty();
    $p = $db->get_payment($payment_id);
    $u = $db->get_user($p['member_id']);
    $product = get_product($p['product_id']);
    ///////////////////////////////////
    $t->assign('login', $u['login']);
    $t->assign('pass',  $u['pass']);
    $t->assign('name_f', $u['name_f']);
    $t->assign('name_l', $u['name_l']);
    ///////////////////////////////////
    $t->assign('user', $u);
    $t->assign('payment', $p);
    $t->assign('product', $product->config);
    ///////////////////////////////////
    $mail = $t->fetch("signup_mail.txt");
    mail_customer($u['email'], $mail, "Signup Completed");
}

function mail_customer($email, $text, $subject=''){
    global $config;
    if (!strlen($email)) 
        return;
    if (preg_match('/^Subject: (.+?)[\n\r]+/im', $text, $args)){
        // found subject in body of message! then save it and remove from 
        // message
        $subject = $args[1];
        $text = preg_replace('/(^Subject: .+?[\n\r]+)/im', '', $text);
    }
    mail($email, $subject, $text, 
        "From: $config[admin_email]\r\n"
       ."X-Mailer: aMember (http://cgi-central.net/)" 
    );
}

// output html code and possible header, suitable for redirect
function html_redirect($url, $print_header=0, $title='', $text=''){
print <<<EOF
<html><head>
<title>$title</title>
<META HTTP-EQUIV="Refresh" CONTENT="0; URL=$url">
</head>
<body>
$text
<a href="$url">Continue</a>
</body>
EOF;
}

srand((double) microtime() * 1000000); 

?>
