PHP_INCLUDE protect plugins.

Add cookie-based login for protected-pages. It can only protect
PHP files, of course. But it very useful to include payed
membership-support to your existsing PHP-based application.
Also it log access to special db table - you able to view it
later via admin interface.
This module also used in member.php to do authentication for 
members. So if you need to change something, you should create new 
plugin, based on this code.

Just include amember_root/plugins/php_include/check.inc.php
in your PHP page as follows:
============================================================================
<?
$_product_id = array(1,3); // or $_product_id = array(1) if it so
include("aMember_Root_Dir/plugins/php_include/check.inc.php"); 

.. your existing PHP code goes here
?>
.. your html still here, if exists
============================================================================

If user isn't authorized yet, then it display templates/cookie_login/login.html
If user enter right login/password - the page will be displayed.

Yout MUST define $_product_id array to work. If you want to only check
access login/password then use it as : 
    $_product_id = array('ONLY_LOGIN');
It only check login/password pair. Of course, it can allow access for ]
not-payed or expired members! You are warned!

User can use http://www.yoursite.com/aMember_Root/plugins/protect/php_include/logout.php
to logout. You should set where user will be redirected after logout
in config_plugins.inc.php

Also calling php script some session variables are set.

   
