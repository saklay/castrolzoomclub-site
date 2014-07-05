<?
/**
* Main aMember Config 
* You can edit it manually or using /admin/setup.php
* Don't wrap any strokes. It should still one-line!
*
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: Plugins config
*    FileName $RCSfile: config-dist.inc.php,v $
*    Release: 1.8.5 ($Revision: 1.19 $)
*
* Please direct bug reports,suggestions or feedback to the cgi-central forums.
* http://www.cgi-central.net/forum/
*                                                                          
* aMember is free for both commercial and non-commercial use providing that the
* copyright headers remain intact and the links remain on the html pages.
* Re-distribution of this script without prior consent is strictly prohibited.
*                                                                                 
*
*/
define('INCLUDED_AMEMBER_CONFIG', 1);
error_reporting(E_ALL ^ E_NOTICE);

/**
* Global Script Config
* @global mixed $config
*/
$config = array();


$config['root_dir']    = dirname(__FILE__); 

$config['root_url']    = '@ROOT_URL@';
$config['admin_email'] = '@ADMIN_EMAIL@';
$config['admin_login'] = '@ADMIN_LOGIN@';
$config['admin_pass']  = '@ADMIN_PASS@';
$config['admin_pass_encrypted'] = @ADMIN_PASS_ENCRYPTED@;

$config['tpl_cache_level'] = @TPL_CACHE_LEVEL@;

$config['send_signup_mail'] = @SEND_SIGNUP_MAIL@;
$config['display_member_pw_urls'] = @DISPLAY_MEMBER_PW_URLS@;

#############################################
# predefined variables
#

$config['plugins_dir']['payment'] = "$config[root_dir]/plugins/payment";
$config['plugins_dir']['protect'] = "$config[root_dir]/plugins/protect";
$config['plugins_dir']['db']      = "$config[root_dir]/plugins/db";
$config['data_dir']               = "$config[root_dir]/data";

include_once("$config[root_dir]/smarty/Smarty.class.php");
include_once("$config[root_dir]/common.inc.php");
include_once("$config[root_dir]/db.inc.php");
include_once("$config[root_dir]/paysys.inc.php");
include_once("$config[root_dir]/member.inc.php");
include_once("$config[root_dir]/product.inc.php");
include_once("$config[root_dir]/plugins.inc.php");

?>
