#
# WARNING! If you want to apply it manually
# REPLACE @DB_MYSQL_PREFIX to desired value -
# possible empty string
#
#
# aMember MySQL database dump
#
#
#
# Table structure for table 'access_log'
#

CREATE TABLE @DB_MYSQL_PREFIX@access_log(
log_id int(11) NOT NULL auto_increment,
member_id int(11) default '0',
time timestamp(14) NOT NULL,
url varchar(255) default NULL,
remote_addr varchar(15) default NULL,
referrer varchar(255) default NULL,
PRIMARY KEY (log_id),
INDEX (member_id, `time`, remote_addr),
INDEX (`time`)
)
;



#
# Table structure for table 'cron_run'
#

CREATE TABLE @DB_MYSQL_PREFIX@cron_run (
id int(11) NOT NULL default '0',
time datetime NOT NULL default '0000-00-00 00:00:00',
PRIMARY KEY (id)
);



#
# Table structure for table 'error_log'
#

CREATE TABLE @DB_MYSQL_PREFIX@error_log (
log_id int(11) NOT NULL auto_increment,
member_id int(11) default '0',
time timestamp(14) NOT NULL,
url varchar(255) default NULL,
remote_addr varchar(15) default NULL,
referrer varchar(255) default NULL,
error text,
PRIMARY KEY (log_id)
) ;



#
# Table structure for table 'members'
#

CREATE TABLE @DB_MYSQL_PREFIX@members (
member_id int(11) NOT NULL auto_increment,
login varchar(32) NOT NULL,
pass varchar(32) default NULL,
email varchar(64) default NULL,
name_f varchar(32) NOT NULL default '',
name_l varchar(32) NOT NULL default '',
street varchar(255) default NULL,
city varchar(255) default NULL,
state varchar(255) default NULL,
zip varchar(255) default NULL,
country varchar(255) default NULL,
is_male smallint(6) default NULL,
added datetime NOT NULL default '0000-00-00 00:00:00',
remote_addr varchar(15) default NULL,
data text NOT NULL,
PRIMARY KEY (member_id),
UNIQUE KEY login (login)
) ;



#
# Table structure for table 'payments'
#

CREATE TABLE @DB_MYSQL_PREFIX@payments (
payment_id int(11) NOT NULL auto_increment,
member_id int(11) NOT NULL default '0',
product_id int(11) NOT NULL default '0',
begin_date date NOT NULL default '0000-00-00',
expire_date date NOT NULL default '0000-00-00',
paysys_id varchar(32) NOT NULL default '',
receipt_id varchar(32) NOT NULL default '',
amount decimal(12,2) NOT NULL default '0.00',
completed smallint(6) default '0',
remote_addr varchar(15) NOT NULL default '',
data text,
time timestamp(14) NOT NULL,
PRIMARY KEY (payment_id),
KEY member_id (member_id)
) ;



#
# Table structure for table 'products'
#

CREATE TABLE @DB_MYSQL_PREFIX@products (
product_id int(11) NOT NULL auto_increment,
title varchar(255) NOT NULL default '',
description text,
price decimal(12,2) default NULL,
data text,
PRIMARY KEY (product_id)
) ; 
