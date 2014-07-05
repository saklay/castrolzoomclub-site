2Checkout Payment Plugin
 By James Mitchell(aka ReDucTor)
-----------------------------

Disclaimer:
I am not responsible with anything that may happen if you use this plugin, but Feel free to contact me if you run into problems, just try to explain them clearly And no abuse/spam.

FAQ
-----
Q. Unable to up upload config_plugins.inc.php - Permission Denied
A. The common reason for this is because setup.php is set to create config_plugins.inc.php, and apache, or what ever webserver is ran by your host is the one opening the file, and your ftp doesn't have access to access that file.

There is no real easy way to do this, because if your host gives you ssh, telnet or some method of shell access login to that and use the chown command to own it to your user(ps you might need to change it back to apache after) or contact your host.

I might release a different method of doing this if lots of people have this problem, because it can be sometimes a confusing problem and hard to over come, for those with not much experience in the field.

Q. Where do I set/get my secret
A. Login to sellers.2checkout.com and click "Account Details", click "return", scroll down to "Overall Passback Parameters", its the very last one, I believe.

Q. How Can I contact you?
A. Email me at reductor@aismail.com