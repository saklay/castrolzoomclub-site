<?
/** 
* Plugins config file.
* Generated from setup.php
*
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: The installation file
*    FileName $RCSfile: config_plugins-dist.inc.php,v $
*    Release: 1.8.5 ($Revision: 1.12 $)
*
* Please direct bug reports,suggestions or feedback to the cgi-central forums.
* http://www.cgi-central.net/forum/
*                                                                          
* aMember is free for both commercial and non-commercial use providing that the
* copyright headers remain intact and the links remain on the html pages.
* Re-distribution of this script without prior consent is strictly prohibited.
*                                                                                 
*/

####### don't edit this file manually #########
global $config;

/*
* List of Enabled Plugins
* @global array $plugins
**/
$plugins = array();

/*
* Plugin configs array
* @global mixed $plugin_config
**/
$plugin_config = array();

############## list of ENABLED plugins here ###
$plugins['db']      = array('mysql');
$plugins['payment'] = array(@PAYMENT_PLUGINS@);
$plugins['protect'] = array(@PROTECT_PLUGINS@);

############## db/mysql #######################
$pc = array();
$pc['db']   = '@DB_MYSQL_DB@';
$pc['user'] = '@DB_MYSQL_USER@';
$pc['pass'] = '@DB_MYSQL_PASS@';
$pc['host'] = '@DB_MYSQL_HOST@';
$pc['prefix'] = '@DB_MYSQL_PREFIX@';
$plugin_config['db']['mysql'] = $pc;

############## protect/htpasswd  ##############
$pc = array();
$pc['use_plain_text'] = @PROTECT_HTPASSWD_PLAIN@;
$plugin_config['protect']['htpasswd'] = $pc;

############## protect/php_include  ##############
$pc = array();
/// redirect user after logout to: 
$pc['redirect'] = '@PROTECT_PHP_INCLUDE_REDIRECT@';
$plugin_config['protect']['php_include'] = $pc;

############## payment/clickbank ##############
$pc = array();
$pc['account'] = '@PAYMENT_CLICKBANK_ACCOUNT@';
$pc['secret']  = '@PAYMENT_CLICKBANK_SECRET@';
$plugin_config['payment']['clickbank'] = $pc;

############## payment/paypal #################
$pc = array();
$pc['business'] = '@PAYMENT_PAYPAL_BUSINESS@';
$plugin_config['payment']['paypal'] = $pc;

############## payment/free #################
$pc = array();
$pc['admin_approval'] = @PAYMENT_FREE_APPROVAL@;
$pc['mail_admin'] = 1;
$plugin_config['payment']['free'] = $pc;

############# payment/2checkout ##############
$pc = array();
$pc['seller_id'] = "@PAYMENT_2C0_SELLER_ID@";
$pc['demo']      = "@PAYMENT_2CO_DEMO@";
$pc['secret']    = "@PAYMENT_2CO_SECRET@";
$plugin_config['payment']['twocheckout'] = $pc;

?>
