<?
/*
*
*
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: The installation file
*    FileName $RCSfile: htpasswd.inc.php,v $
*    Release: 0.9 ($Revision: 1.7 $)
*
* Please direct bug reports,suggestions or feedback to the cgi-central forums.
* http://www.cgi-central.net/forum/
*                                                                          
* aMember is free for both commercial and non-commercial use providing that the
* copyright headers remain intact and the links remain on the html pages.
* Re-distribution of this script without prior consent is strictly prohibited.
*
*/

setup_plugin_hook('update_users', 'htpasswd_update');
setup_plugin_hook('update_payments', 'htpasswd_update');
setup_plugin_hook('daily', 'htpasswd_update');

function htpasswd_update($payment_id=0, $member_id=0){
    global $config, $plugin_config;
    global $db;
    $ul = $db->get_allowed_users(); // should return array[product_id][user_login]=password
    $users = array();
    foreach ($ul as $product_id => $user){
        foreach ($user as $l => $p)
            $users[$l] = $p;
    }

    $f = @fopen($fn = "$config[data_dir]/.htpasswd", 'w');
    if (!$f) fatal_error("Cannot open $fn for write. Make directory $config[data_dir] and this file writeable for PHP scripts.");
    foreach ($users as $l => $p) {
        if ($plugin_config['protect']['htpasswd']['use_plain_text'])
            $pw = $p;
        else
            $pw = crypt($p, md5(rand()));
        fwrite($f, "$l:$pw\n");
    }
    fclose($f);    

    $f = @fopen($fn = "$config[data_dir]/.htgroup", 'w');
    if (!$f) fatal_error("Cannot open $fn for write. Make directory $config[data_dir] and this file writeable for PHP scripts.");
    foreach ($ul as $product_id => $user){
        fwrite($f, "PRODUCT_$product_id: ");
        foreach ($user as $l => $p)
            fwrite($f, $l . " ");
        fwrite($f, "\n");
    }
    fclose($f);    
}


?>
