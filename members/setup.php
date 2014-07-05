<?
function version_check($vercheck)
{
    $minver = str_replace(".","", $vercheck);
    $curver = str_replace(".","", phpversion());
    if($curver >= $minver){
    return true;
    } else {
        die("SORRY! PHP version ".$vercheck." or greater is required to run aMember. Your PHP-Version is : ".phpversion().
        "<br>Please upgrade or ask your hosting to upgrade. PHP before $vercheck was buggy and vunerable.");

    }
}
version_check('4.0.6');  // if version not ok the script stopped and displays an errormsg

error_reporting(E_ALL ^ E_NOTICE);
/***************************************************************************
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: The installation file
*    FileName $RCSfile: setup.php,v $
*    Release: 1.8.5 ($Revision: 1.25 $)
*
* Please direct bug reports,suggestions or feedback to the cgi-central forums.
* http://www.cgi-central.net/forum/
*                                                                          
* aMember is free for both commercial and non-commercial use providing that the
* copyright headers remain intact and the links remain on the html pages.
* Re-distribution of this script without prior consent is strictly prohibited.
*                                                                                 

  Web-based setup. Steps:
   0 - check for installed config.php, check if it writeable
     - main config.inc.php data form
   1 - check config.inc.php data
     - display mysql connection form
   2 - check mysql connection
     - check for tables installed
     - if installed, skip to step 4
     - if not installed ask to install it
   3 - install mysql db
   4 - plugins configuration (except MySQL)
   5 - save all config files
   9 - download config files, if can't write it
*/

function make_password($length=16){
    $vowels = 'aeiouy';
    $consonants = 'bdghjlmnpqrstvwxz';
    $password = '';
    
    $alt = time() % 2;
    srand(time());

    for ($i = 0; $i < $length; $i++) {
        if ($alt == 1) {
            $password .= $consonants[(rand() % 17)];
            $alt = 0;
        } else {
            $password .= $vowels[(rand() % 6)];
            $alt = 1;
        }
    }
    return $password;
}



function display_header($title){
    global $header_displayed;
    if ($header_displayed) return;
    $header_displayed++;
    print <<<EOF
<html>
<head>  
    <title>$title</title>
    <style>
        body, th, td {
            font-family: Verdana, sans-serif;
            font-size: 0.8em;
        }
        input, textarea {ldelim}
            font-family: Verdana, sans-serif;
            font-size: 1em;
        }
        .err {
            color: red;
            font-weight: bold;
        }
        .vedit {
            background-color: #F0F0F0;
        }
        .vedit td {
            padding: 10px;
            padding-left:  15px;
            background-color: #E0E0E0;
        }
        .vedit th {
            padding: 10px;
            padding-right: 15px;
            text-align: right;
            background-color: #C0B9C0;
            font-weight: normal;
        }
    </style>
</head>
<body bgcolor=#E0E0E0><center>
<h2 style='color: #707070'>$title</h2>
<table width=60% cellpadding=0><tr><td height=1 bgcolor=black></td></tr></table>
EOF;
}

function display_footer(){
    global $footer_displayed;
    if ($footer_displayed) return;
    $footer_displayed++;
    print <<<EOF
<table width=60% cellpadding=0><tr><td height=1 bgcolor=black></td></tr></table>
<small>&copy; <a href=http://cgi-central.net>CGI Central, Inc.</a>, 2002</small>
</center></body></html>
EOF;
}

function display_fatal($error){
    display_header();
    print "<FONT COLOR=red>Fatal Error: $error<B></B></FONT>";
    display_footer();
    exit();
}

function display_errors($errs){
    display_header("aMember Installation");
    print "<p class=err>";
    foreach ((array)$errs as $e)
        print "<LI><font color=red><b>$e</b></font>\n";
    print "</p>";
}

function check_for_existance(){
    global $root_dir;
    $errors = array();
 
    $cf = "$root_dir/config.inc.php";
    if (file_exists($cf) && filesize($cf)){
        $errors[] = "File '$cf' is already exists and non-zero. Please remove it or delete all content if you want to do full reconfiguration";        
    } 
    $cf = "$root_dir/config_plugins.inc.php";
    if (file_exists($cf) && filesize($cf)){
        $errors[] = "File '$cf' is already exists and non-zero. Please remove it or delete all content if you want to do full reconfiguration";        
    } 
    if ($errors) {
        display_errors($errors);
        print <<<EOF
    After you fix these problems, click <a href="javascript: window.location.reload()">here</a> to refresh page.
    <br><br>
EOF;
        display_footer();
        exit();
    }
}


function check_for_writeable(){
    global $root_dir;
    $errors = array();
 
    $cf = "$root_dir/config.inc.php";
    if (file_exists($cf) && !is_writeable($cf)){
        $errors[] = "File '$cf' is not writeable. Please fix it";        
    } else if (!file_exists($cf) && !is_writeable($d=$root_dir)){
        $errors[] = "Directory '$d' is not writeable. It needed to write config file '$cf'. Please fix it";        
    }

    $cf = "$root_dir/config_plugins.inc.php";
    if (file_exists($cf) && !is_writeable($cf)){
        $errors[] = "File '$cf' is not writeable. Please fix it";        
    } else if (!file_exists($cf) && !is_writeable($d=$root_dir)){
        $errors[] = "Directory '$d' is not writeable. It needed to write config file '$cf'. Please fix it";        
    }

    if (!is_writeable($d = "$root_dir/templates_c/")){
        $errors[] = "Directory '$d' is not writeable. Please fix it";        
    }
    if (!is_writeable($d = "$root_dir/data/")){
        $errors[] = "Directory '$d' is not writeable. Please fix it";        
    }
    if ($errors) {
        display_errors($errors);
        print <<<EOF
    After you fix these problems, click <a href="javascript: window.location.reload()">here</a> to refresh page.
    <br><br>
EOF;
        display_footer();
        exit();
    }
}

function display_main_config(){
    global $root_dir;
    global $HTTP_SERVER_VARS;
    $HTTP_HOST    = $HTTP_SERVER_VARS['HTTP_HOST'];
    $SERVER_ADMIN = $HTTP_SERVER_VARS['SERVER_ADMIN'];
    $REQUEST_URI  = $HTTP_SERVER_VARS['REQUEST_URI'];

    $root_url    = "http://$HTTP_HOST" . str_replace('/setup.php', '', $REQUEST_URI);
    $admin_email = $SERVER_ADMIN;
    $admin_login = 'admin';
    $admin_pass  = '';

    print <<<EOF
    <form method=post>
    <h3>Enter configuration parameters</h3>
    <table class=vedit>
    <tr>
        <th><b>Root URL of script</b><br><small>Without trailing slash, please</small></th>
        <td><input type=text name=@ROOT_URL@ value="$root_url" size=30></td>
    </tr>
    <tr>
        <th><b>Admin Email</b><br><small>for alerts, etc.</small></th>
        <td><input type=text name=@ADMIN_EMAIL@ value='$admin_email' size=30></td>
    </tr>
    <tr>
        <th><b>Admin Login</b><br><small>username for login into admin interface</small></th>
        <td><input type=text name=@ADMIN_LOGIN@ value='$admin_login' size=30></td>
    </tr>
    <tr>
        <th><b>Admin Password</b><br><small>password for login into admin interface</small></th>
        <td><input type=text name=@ADMIN_PASS@ value='$admin_pass' size=30></td>
    </tr>
    <tr>
        <th><b>Encrypt Admin Password?</b><br><small>encrypt password in config file to hide it?</small></th>
        <td><input type=checkbox name=@ADMIN_PASS_ENCRYPTED@ value=1 checked></td>
    </tr>
    <tr>
        <th><b>Send Signup Mail?</b><br><small>should the script send signup emails to customers?</small></th>
        <td><select name="@SEND_SIGNUP_MAIL@" size=1>
        <option value=1>Yes, send
        <option value=0>No, thank you
            </select>
        </td>
    </tr>

    <tr>
        <th><b>Substitute member password in urls?</b>
        <br><small>should the script substitute login/password
        <br>to urls, displayed on member.html page?
        <br>very useful if you're using .htpasswd protection
        </small></th>
        <td><select name="@DISPLAY_MEMBER_PW_URLS@" size=1>
        <option value=1>Yes, display. I use .htpasswd
        <option value=0>No, I only use php protection
        </select>
        </td>
    </tr>
    <tr>
        <th><b>Template Cache Level</b><br><small>
0 - low speed, but will work on any hosting (no disk writes);<br>
1 - faster (just without any directory creations);<br>
2 - best speed, but some hostings have problems with it.<br>
You can change it later in <i>config.inc.php</i>
</small></th>
        <td><select name=@TPL_CACHE_LEVEL@ size=1>
        <option value=0>0 - Most safe
        <option value=1>1 - Middle
        <option value=2>2 - Fastest
        </select></td>
    </tr>
    </table>
    <br>
    <input type=submit value="&nbsp;&nbsp;&nbsp;&nbsp;Next&gt;&gt;&nbsp;&nbsp;&nbsp;">
    <input type=hidden name=step value=1>
    </form>
EOF;
}

function check_main_config(){
    global $HTTP_POST_VARS;
    $vars = $HTTP_POST_VARS;
    $errors = array();
    if (!strlen($vars['@ROOT_URL@']))   $errors[] = "Please enter root url of script";
    if (!strlen($vars['@ADMIN_EMAIL@'])) $errors[] = "Please enter admin email";
    if (!strlen($vars['@ADMIN_LOGIN@'])) $errors[] = "Please enter admin login";
    if (!strlen($vars['@ADMIN_PASS@'])) $errors[] = "Please enter admin password";
    if ($errors) {
        display_errors($errors);
        print <<<EOF
        Please <a href="javascript: history.back(-1)">return</a> and fix these errors.
    <br><br>
EOF;
        display_footer();
        exit();
    }
}

function get_hidden_vars(){
    global $HTTP_POST_VARS;
    $res = '';
    foreach ($HTTP_POST_VARS as $k=>$v){
      if ($k[0] == '@')
        if (is_array($v)) // array
            foreach ($v as $kk=>$vv)
             $res .= sprintf('<input type=hidden name="%s[]" value="%s">'."\n",
                htmlspecialchars($k), htmlspecialchars($vv));
        else
            $res .= sprintf('<input type=hidden name="%s" value="%s">'."\n",
                htmlspecialchars($k), htmlspecialchars($v));
    }
    return $res;
}

function display_mysql_form(){
    $hidden = get_hidden_vars();

    print <<<EOF
    <form method=post>
    <h3>Enter configuration parameters</h3>
    <table class=vedit>
    <tr>
        <th><b>MySQL Host</b><br><small>very often 'localhost'</small></th>
        <td><input type=text name='@DB_MYSQL_HOST@' value='localhost' size=30></td>
    </tr>
    <tr>
        <th><b>MySQL Database </b><br><small>by example, amember</small></th>
        <td><input type=text name='@DB_MYSQL_DB@' value='$admin_email' size=30></td>
    </tr>
    <tr>
        <th><b>MySQL Username</b><br><small>mysql username</small></th>
        <td><input type=text name='@DB_MYSQL_USER@' value='$admin_login' size=30></td>
    </tr>
    <tr>
        <th><b>MySQL Password</b><br><small>mysql password</small></th>
        <td><input type=text name='@DB_MYSQL_PASS@' value='$admin_pass' size=30></td>
    </tr>
    <tr></tr>
    <tr>
        <th><b>MySQL Tables Prefix</b><br><small>by example <i>amember_</i><br>use it if can't create special<br> database for aMember</small></th>
        <td><input type=text name='@DB_MYSQL_PREFIX@' value='' size=30></td>
    </tr>
    </table>
    <br>
    <input type=submit value="&nbsp;&nbsp;&nbsp;&nbsp;Next&gt;&gt;&nbsp;&nbsp;&nbsp;">
    <input type=hidden name=step value=2>
    $hidden
    </form>
EOF;
}

function check_mysql_form(&$db_installed){
    global $HTTP_POST_VARS;

    $db_installed = 0;
    $vars = $HTTP_POST_VARS;
    $errors = array();
    if (!strlen($vars['@DB_MYSQL_DB@']))   $errors[] = "Please enter mysql database name";
    if (!strlen($vars['@DB_MYSQL_USER@'])) $errors[] = "Please enter mysql username";
#    if (!strlen($vars['@DB_MYSQL_PASS@'])) $errors[] = "Please enter mysql password";
    if (!strlen($vars['@DB_MYSQL_HOST@'])) $errors[] = "Please enter mysql hostname";
    if ($errors) {
        display_errors($errors);
        print <<<EOF
        Please <a href="javascript: history.back(-1)">return</a> and fix these errors.
    <br><br>
EOF;
        display_footer();
        exit();
    }
    /// really connect
    $conn = @mysql_connect(
        $vars['@DB_MYSQL_HOST@'], 
        $vars['@DB_MYSQL_USER@'],
        $vars['@DB_MYSQL_PASS@']
    );
    if (!$conn)
        $errors = "Cannot connect to mysql (".mysql_error().")";
    if ($errors) {
        display_errors($errors);
        print <<<EOF
        Please <a href="javascript: history.back(-1)">return</a> and fix these errors.
    <br><br>
EOF;
        display_footer();
        exit();
    }
    $dbc = @mysql_select_db($vars['@DB_MYSQL_DB@']);
    if (!$dbc)
        $errors = "Cannot select database '" . $vars["@DB_MYSQL_DB@"] . "' (" . mysql_error() . ")";
    if ($errors) {
        display_errors($errors);
        print <<<EOF
        Please <a href="javascript: history.back(-1)">return</a> and fix these errors.
    <br><br>
EOF;
        display_footer();
        exit();
    }   
    $q = mysql_query("SELECT COUNT(*) FROM ".$vars['@DB_MYSQL_PREFIX@']."error_log", $conn);
    if (mysql_errno()) return;
    $q = mysql_query("SELECT COUNT(*) FROM ".$vars['@DB_MYSQL_PREFIX@']."members", $conn);
    if (mysql_errno()) return;
    $q = mysql_query("SELECT COUNT(*) FROM ".$vars['@DB_MYSQL_PREFIX@']."payments", $conn);
    if (mysql_errno()) return;
    $q = mysql_query("SELECT COUNT(*) FROM ".$vars['@DB_MYSQL_PREFIX@']."access_log", $conn);
    if (mysql_errno()) return;
    $q = mysql_query("SELECT COUNT(*) FROM ".$vars['@DB_MYSQL_PREFIX@']."cron_run", $conn);
    if (mysql_errno()) return;
    $q = mysql_query("SELECT COUNT(*) FROM ".$vars['@DB_MYSQL_PREFIX@']."products", $conn);
    if (mysql_errno()) return;
    $db_installed = 1;
}

function display_db_install_query(){
    $hidden = get_hidden_vars();

    print <<<EOF
    <form method=post>
    <h3>Install MySQL database?</h3>
    <table class=vedit>
    <tr>
        <th><b>Install MySQL database</b><br><small>should the setup create mysql tables in specified database?</small></th>
        <td><input type=checkbox name=@INSTALL_DB@ value=1 checked></td>
    </tr>
    </table>
    <br>
    <input type=submit value="&nbsp;&nbsp;&nbsp;&nbsp;Next&gt;&gt;&nbsp;&nbsp;&nbsp;">
    <input type=hidden name=step value=3>
    $hidden
    </form>
EOF;
}


function create_mysql_tables(){
    global $HTTP_POST_VARS;

    $vars = $HTTP_POST_VARS;
    $errors = array();
    $file = join('', file("amember.sql"));    
    $conn = @mysql_connect(
        $vars['@DB_MYSQL_HOST@'], 
        $vars['@DB_MYSQL_USER@'],
        $vars['@DB_MYSQL_PASS@']
    );
    if (!$conn)
        $errors = "Cannot connect to mysql (".mysql_error().")";
    if ($errors) {
        display_errors($errors);
        print <<<EOF
        Please <a href="javascript: history.back(-1)">return</a> and fix these errors.
    <br><br>
EOF;
        display_footer();
        exit();
    }
    $dbc = @mysql_select_db($vars['@DB_MYSQL_DB@']);
    if (!$dbc)
        $errors = "Cannot select database '" . $vars["@DB_MYSQL_DB@"] . "' (" . mysql_error() . ")";
    if ($errors) {
        display_errors($errors);
        print <<<EOF
        Please <a href="javascript: history.back(-1)">return</a> and fix these errors.
    <br><br>
EOF;
        display_footer();
        exit();
    }   
    $file = str_replace('@DB_MYSQL_PREFIX@', $vars['@DB_MYSQL_PREFIX@'], $file);
    preg_match_all("/(CREATE TABLE.+?)\;/s", $file, $out);
    foreach ($out[0] as $sql){
        mysql_query($sql);
        if ($err = mysql_error()) $errors[] = $err;
        if ($errors) {
            display_errors($errors);
            print <<<EOF
            Please fix these errors and <a href="javascript: window.location.reload()">reload</a> this page.
        <br><br>
EOF;
            display_footer();
            exit();
        }
    }
}

function display_plugins_form(){
    $hidden = get_hidden_vars();

    $clickbank_secret = make_password(12);

    print <<<EOF
    <form method=post>
    <h3>Enter plugin configuration parameters</h3>
    <table class=vedit>
    <tr><th colspan=2 style='color: #FFFFFF; font-weight: bold; text-align:center'>PAYMENT PLUGINS</th></tr>
    <tr><td colspan=2 style='text-align:left;'><input type=checkbox name=@PAYMENT_PLUGINS@[] value=clickbank checked><b>ClickBank</b> (http://www.clickbank.com)</td></tr>
    <tr>
        <th><b>ClickBank Account</b><br><small>your account name in Clickbank<br>Look like 'cgicentral'</small></th>
        <td><input type=text name=@PAYMENT_CLICKBANK_ACCOUNT@ value='$clickbank_account' size=30></td>
    </tr>
    <tr>
        <th><b>ClickBank Secret Phrase</b><br><small>generated value is displayed.<br> You should enter it in clickbank<br> settings</small></th>
        <td><input type=text name=@PAYMENT_CLICKBANK_SECRET@ value='$clickbank_secret' size=30></td>
    </tr>

    <tr><td colspan=2 style='text-align:left'><input type=checkbox name=@PAYMENT_PLUGINS@[] value=paypal checked><b>PayPal</b> (http://www.paypal.com)</td></tr>
    <tr>
        <th><b>PayPal Account</b><br><small>your account name in PayPal<br>Anywhere in Paypal is called as 'business'<br>Look like 'youremail@domain.com'</small></th>
        <td><input type=text name=@PAYMENT_PAYPAL_BUSINESS@ value='$paypal_account' size=30></td>
    </tr>

    <tr><td colspan=2 style='text-align:left;'><input type=checkbox name=@PAYMENT_PLUGINS@[] value=twocheckout checked><b>2Checkout</b> (http://www.2checkout.com)</td></tr>
    <tr>
        <th><b>2Checkout Seller ID</b><br><small>your account id in 2checkout</small></th>
        <td><input type=text name='@PAYMENT_2C0_SELLER_ID@' size=30></td>
    </tr>
    <tr>
        <th><b>2Checkout Secret Phrase</b><br><small>generated value is displayed.<br> You should enter it into 2checkout<br> settings</small></th>
        <td><input type=text name='@PAYMENT_2CO_SECRET@' value='$clickbank_secret' size=30></td>
    </tr>
    <tr>
        <th><b>2Checkout Test Mode</b><br><small>if you select "yes" now<br> you may change it<br> in <i>config_plugins.inc.php</i> later</small></th>
        <td><select name='@PAYMENT_2CO_DEMO@' size=1>
        <option value=N>No
        <option value=Y>Yes
        </select>
        </td>
    </tr>

    <tr><td colspan=2 style='text-align:left'><input type=checkbox name=@PAYMENT_PLUGINS@[] value=free checked><b>Free Signup</b> (just membership management for $0 products)</td></tr>
    <tr>
        <th><b>Admin Approval</b><br><small>Require or not admin approval<br>for new members</small></th>
        <td><select name=@PAYMENT_FREE_APPROVAL@ size=1>
        <option value=0>No, don't require
        <option value=1>Yes, require
        </td>
    </tr>

    <tr><th colspan=2 style='color: #FFFFFF; font-weight: bold; text-align:center'>PROTECT PLUGINS</th></tr>
    <tr><td colspan=2 style='text-align:center'><input type=checkbox name='@PROTECT_PLUGINS@[]' value=htpasswd checked><b>HtPasswd</b> (generate .htpasswd and .htgroup files for protected areas)</td></tr>
    <tr>
        <th><b>.htpasswd encryption</b><br><small></small></th>
        <td><select name=@PROTECT_HTPASSWD_PLAIN@ size=1>
        <option value=0>Encrypt passwords in .htpasswd
        <option value=1>Don't encrypt passwords
        </td>
    </tr>

    <tr><td colspan=2 style='bold; text-align:center'><input type=checkbox name='@PROTECT_PLUGINS@[]' value=php_include checked><b>PHP Include</b> (allow you to protect PHP files, if your site is PHP-based)</td></tr>
    <tr>
        <th><b>Logout Redirect</b><br>
        <small>URL for redirect after logout. Default is site root URL</small></th>
        <td><input type=text name=@PROTECT_PHP_INCLUDE_REDIRECT@ size=30></td>
    </tr>
    
    
    
    
    </table>
    <br>
    <input type=submit value="&nbsp;&nbsp;&nbsp;&nbsp;Next&gt;&gt;&nbsp;&nbsp;&nbsp;">
    <input type=hidden name=step value=4>
    $hidden
    </form>
EOF;
}

function check_plugins_form(){
    global $HTTP_POST_VARS;
    $vars = $HTTP_POST_VARS;
    return true;
}


function get_config_files(){
    // return 2-elements array with content of 
    // config.inc.php config-plugins.inc.php
    global $HTTP_POST_VARS;
    global $root_dir;
    $vars = $HTTP_POST_VARS;

    foreach (array('@DB_PLUGINS@', '@PAYMENT_PLUGINS@', '@PROTECT_PLUGINS@')
    as $varname)
        foreach ((array)$vars[$varname] as $k=>$v)
            $vars[$varname][$k] = "'" . $v . "'";        

    $vars['@DB_PLUGINS@']      = join(',', (array)$vars['@DB_PLUGINS@']);
    $vars['@PAYMENT_PLUGINS@'] = join(',', (array)$vars['@PAYMENT_PLUGINS@']);
    $vars['@PROTECT_PLUGINS@'] = join(',', (array)$vars['@PROTECT_PLUGINS@']);

    settype($vars['@ADMIN_PASS_ENCRYPTED@'], 'integer');
    if ($vars['@ADMIN_PASS_ENCRYPTED@'] > 0){
        srand(time());
        $vars['@ADMIN_PASS@'] = crypt($vars['@ADMIN_PASS@'], rand());
    }
    $f = file("$root_dir/config-dist.inc.php");
    if (!$f)
        die("Cannot open $fn . Please upload this file");
    $f1 = array();
    foreach ($f as $k1=>$v1) {
        foreach ($vars as $k=>$v)
            $v1 = str_replace($k, $v, $v1);
        $f1[] = $v1;
    }
    
    $f = file($fn = "$root_dir/config_plugins-dist.inc.php");
    if (!$f)
        die("Cannot open $fn . Please upload this file");
    $f2 = array();
    foreach ($f as $k1=>$v1) {
        foreach ($vars as $k=>$v)
            $v1 = str_replace($k, $v, $v1);
        $f2[] = $v1;
    }

    return array(join('', $f1), join('', $f2));
}

function display_send_files_form($error_filename){
    display_header("Cannot save config files");
    $hidden = get_hidden_vars();
    global $root_dir;
    print <<<CUT
    <p><b>Cannot save file <i>$error_filename</i></b>. <br>
    For complete setup you may download new config files to your computer and upload
    it back to your server.</p>

    <p>File <i>config.inc.php</i>. Upload it to:
    <br><i>$root_dir/config.inc.php</i><br>
    <form name=f1 method=post>
    <input type=submit value="Download config.inc.php">
    <input type=hidden name=step value=9>
    <input type=hidden  name=file value=0>
    $hidden
    </form>
    </p>

    <p>File <i>config-plugins.inc.php</i>. Upload it to:
    <br><i>$root_dir/config-plugins.inc.php</i><br>
    <form name=f1 method=post>
    <input type=submit value="Download config_plugins.inc.php">
    <input type=hidden name=step value=9>
    <input type=hidden name=file value=1>
    $hidden
    </form>
    </p>

    <p><font color=red><b>Internet Expolorer sometimes rename <br>
    files when save it. By example, it may rename <i>config.inc.php</i><br>
    to <i>config[1].inc.php</i>. Don't forget to  fix it before uploading!
    </b></font></p>

CUT;
    display_footer();
}

function send_config_file(){
    global $HTTP_POST_VARS;
    $file = $HTTP_POST_VARS['file'];
    $files = get_config_files();
    $filename = $file == 1 ? 'config_plugins.inc.php' : 'config.inc.php';
    header("Content-Disposition: inline; filename=\"$filename\"");
    header("Content-Type: application/php");
    print $files[$file];
    exit();
}

function commit_changes(){
    global $HTTP_POST_VARS;
    global $root_dir;
    $vars = $HTTP_POST_VARS;

    if ($vars['@INSTALL_DB@']) 
        create_mysql_tables();

    list($f1, $f2) = get_config_files();
    /// 
    $fp = @fopen($fn = "$root_dir/config.inc.php", 'wb');
    if (!$fp){
        display_send_files_form($fn);
        return;
//        "Cannot open '$fn' for write"
    }
    fwrite($fp, $f1);
    fclose($fp);

    /// 
    $fp = @fopen($fn = "$root_dir/config_plugins.inc.php", 'wb');
    if (!$fp){
        display_send_files_form($fn);
        return;
//        display_fatal("Cannot open '$fn' for write");
    }
    fwrite($fp, $f2);
    fclose($fp);

    global $HTTP_SERVER_VARS;
    $HTTP_HOST   = $HTTP_SERVER_VARS['HTTP_HOST'];
    $REQUEST_URI = $HTTP_SERVER_VARS['REQUEST_URI'];
    header(sprintf("Location: http://%s%s?step=5", $HTTP_HOST, $REQUEST_URI));
    exit();
}

function display_thanks(){
    global $HTTP_POST_VARS;
    print "
    <p>Thank you for using aMember script. Fell free to contact<br>
    <a href='http://cgi-central.net/'>CGI Central</a> any time 
    if you will have any issues with this script.    
    <br><br>
    <b>Now you have to see:</b>
        <table width=40%><tr><td>
        <li><a href=admin/ target=_blank>admin page</a>
        <li><a href=signup.php target=_blank>signup page</a>
        <li><a href=member.php target=_blank>registered member page</a>
        <li><a href=login.php target=_blank>login page (redirect to protected area)</a>
        </td></tr></table>
    </p>
    <br><br>
    <b>What to do now?</b> There's preliminary list of actions:<br>
      <table width=40%><tr><td>
      <li>Goto <a href=admin/ target=_blank>admin page</a> and
      add products. Product is typically the same as subscription type.
      Most users have only one type of subscription. Then they need to add
      only one product.
      <li>If your payment system need special configuration 
      (usually yes) then do it. Read 
      <a href='http://cgi-central.net/opened/html/' target=_blank>installation manual</a> for
      concrete howto.
      <li>Setup your protection for protected areas. 
      Read <a href='http://cgi-central.net/opened/html/' target=_blank>installation manual</a> 
      about.
      You can do it
      with .htaccess and with php included files. To use cookie-based login,
      all your protected files must be PHP!
      <li>Check your installation: <a href=signup.php target=_blank>signup page</a>.
      <li>If all ok, you may customize templates. You should customize:
      <i>
      <br>header.inc.html
      <br>footer.inc.html
      <br>thanks.html
      <br>signup.html
      <br>sendpass.txt
      <br>signup_mail.txt
      </i>
      </td></tr></table>

    <br>
    <b>Don't forget to add your site to list of \"Sites Running aMember\"</b><br>
    Mail us: <a href='mailto: support@cgi-central.net'>support@cgi-central.net</a> 
    URL and short description of your site.
    <br><br>
    Feel free to <a href='http://www.cgi-central.net/services/contact.php?from=setup' target=_blank>contact cgi-central</a> if you need any customization of the script.
    <br><br>

    You may also find a lot of useful info in <a href='http://www.cgi-central.net/forum/?from=setup' target=_blank>aMember forum</a>.
    <br><br>
    ";        
}

//////////////////////// main //////////////////////////////////////////////
$root_dir = dirname(__FILE__);

$step = intval($HTTP_POST_VARS['step']);
if (!$step)
    $step = intval($HTTP_GET_VARS['step']);
if ($step != 5) check_for_existance();

while (1){ switch ($step){
    case 0: case '0': 
        display_header("aMember Setup: step ".($step+1)." of 6");
        check_for_writeable();
        display_main_config();
        break;
    case 1: case '1':
        display_header("aMember Setup: step ".($step+1)." of 6");
        check_main_config();
        display_mysql_form();
        break;
    case 2: case '2':
        display_header("aMember Setup: step ".($step+1)." of 6");
        check_mysql_form($db_installed);
        if ($db_installed) { $step = 3; display_plugins_form(); break;}
        display_db_install_query();
        break;
    case 3: case '3':
        display_header("aMember Setup: step ".($step+1)." of 6");
        display_plugins_form();
        break;
    case 4: case '4':
        check_plugins_form();
        commit_changes();
        break;
    case 5: case '5':
        display_header("aMember Setup: step ".($step+1)." of 6");
        display_thanks();
        break;
    case 9: case '9':
        send_config_file();
        break;

} break; }

display_footer();
?>


