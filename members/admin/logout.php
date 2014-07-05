<?
/*
*
*
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: Admin logout
*    FileName $RCSfile: logout.php,v $
*    Release: 1.8.5 ($Revision: 1.8 $)
*
* Please direct bug reports,suggestions or feedback to the cgi-central forums.
* http://www.cgi-central.net/forum/
*                                                                          
* aMember is free for both commercial and non-commercial use providing that the
* copyright headers remain intact and the links remain on the html pages.
* Re-distribution of this script without prior consent is strictly prohibited.
*
*/


session_start();
unset($HTTP_SESSION_VARS['_admin_login']);
unset($HTTP_SESSION_VARS['_admin_pass']);
session_unregister('_admin_login');
session_unregister('_admin_pass');
session_write_close();
header("Location: http://" . $HTTP_SERVER_VARS['HTTP_HOST'] . '/');
print <<<EOF
<html><head>
<title>Logout</title>
<META HTTP-EQUIV="Refresh" CONTENT="1; URL=/">
</head>
<body>
Logged out. 
<a href="/">Continue</a>
</body>
EOF;
?>