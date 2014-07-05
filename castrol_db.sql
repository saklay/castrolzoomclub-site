-- phpMyAdmin SQL Dump
-- version 2.6.1-pl2
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: May 05, 2005 at 03:12 PM
-- Server version: 4.0.23
-- PHP Version: 4.3.11
-- 
-- Database: `castrolz_sitedb`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `forum_auth_access`
-- 

CREATE TABLE `forum_auth_access` (
  `group_id` mediumint(8) NOT NULL default '0',
  `forum_id` smallint(5) unsigned NOT NULL default '0',
  `auth_view` tinyint(1) NOT NULL default '0',
  `auth_read` tinyint(1) NOT NULL default '0',
  `auth_post` tinyint(1) NOT NULL default '0',
  `auth_reply` tinyint(1) NOT NULL default '0',
  `auth_edit` tinyint(1) NOT NULL default '0',
  `auth_delete` tinyint(1) NOT NULL default '0',
  `auth_sticky` tinyint(1) NOT NULL default '0',
  `auth_announce` tinyint(1) NOT NULL default '0',
  `auth_vote` tinyint(1) NOT NULL default '0',
  `auth_pollcreate` tinyint(1) NOT NULL default '0',
  `auth_attachments` tinyint(1) NOT NULL default '0',
  `auth_mod` tinyint(1) NOT NULL default '0',
  KEY `group_id` (`group_id`),
  KEY `forum_id` (`forum_id`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `forum_auth_access`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `forum_banlist`
-- 

CREATE TABLE `forum_banlist` (
  `ban_id` mediumint(8) unsigned NOT NULL auto_increment,
  `ban_userid` mediumint(8) NOT NULL default '0',
  `ban_ip` varchar(8) NOT NULL default '',
  `ban_email` varchar(255) default NULL,
  PRIMARY KEY  (`ban_id`),
  KEY `ban_ip_user_id` (`ban_ip`,`ban_userid`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `forum_banlist`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `forum_categories`
-- 

CREATE TABLE `forum_categories` (
  `cat_id` mediumint(8) unsigned NOT NULL auto_increment,
  `cat_title` varchar(100) default NULL,
  `cat_order` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`cat_id`),
  KEY `cat_order` (`cat_order`)
) TYPE=MyISAM AUTO_INCREMENT=5 ;

-- 
-- Dumping data for table `forum_categories`
-- 

INSERT INTO `forum_categories` (`cat_id`, `cat_title`, `cat_order`) VALUES (2, 'Driving', 20),
(3, 'Latest Model of Motorcycles', 30),
(4, 'Latest Gadgets / Accessories', 40);

-- --------------------------------------------------------

-- 
-- Table structure for table `forum_config`
-- 

CREATE TABLE `forum_config` (
  `config_name` varchar(255) NOT NULL default '',
  `config_value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`config_name`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `forum_config`
-- 

INSERT INTO `forum_config` (`config_name`, `config_value`) VALUES ('config_id', '1'),
('board_disable', '0'),
('sitename', 'Castrol ZOOM Club'),
('site_desc', 'Castrol ZOOM Club'),
('cookie_name', 'phpbb2mysql'),
('cookie_path', '/'),
('cookie_domain', ''),
('cookie_secure', '0'),
('session_length', '3600'),
('allow_html', '0'),
('allow_html_tags', 'b,i,u,pre'),
('allow_bbcode', '1'),
('allow_smilies', '1'),
('allow_sig', '1'),
('allow_namechange', '0'),
('allow_theme_create', '0'),
('allow_avatar_local', '0'),
('allow_avatar_remote', '0'),
('allow_avatar_upload', '0'),
('enable_confirm', '0'),
('override_user_style', '0'),
('posts_per_page', '15'),
('topics_per_page', '50'),
('hot_threshold', '25'),
('max_poll_options', '10'),
('max_sig_chars', '255'),
('max_inbox_privmsgs', '50'),
('max_sentbox_privmsgs', '25'),
('max_savebox_privmsgs', '50'),
('board_email_sig', 'Thanks.\r\n\r\nCastrol ZOOM Club'),
('board_email', 'info@castrolzoomclub.com'),
('smtp_delivery', '0'),
('smtp_host', ''),
('smtp_username', ''),
('smtp_password', ''),
('sendmail_fix', '0'),
('require_activation', '0'),
('flood_interval', '15'),
('board_email_form', '0'),
('avatar_filesize', '6144'),
('avatar_max_width', '80'),
('avatar_max_height', '80'),
('avatar_path', 'images/avatars'),
('avatar_gallery_path', 'images/avatars/gallery'),
('smilies_path', 'images/smiles'),
('default_style', '1'),
('default_dateformat', 'D M d, Y g:i a'),
('board_timezone', '8'),
('prune_enable', '1'),
('privmsg_disable', '0'),
('gzip_compress', '0'),
('coppa_fax', ''),
('coppa_mail', ''),
('record_online_users', '5'),
('record_online_date', '1102475201'),
('server_name', 'www.castrolzoomclub.com'),
('server_port', '80'),
('script_path', '/forum/'),
('version', '.0.10'),
('board_startdate', '1101667995'),
('default_lang', 'english');

-- --------------------------------------------------------

-- 
-- Table structure for table `forum_confirm`
-- 

CREATE TABLE `forum_confirm` (
  `confirm_id` char(32) NOT NULL default '',
  `session_id` char(32) NOT NULL default '',
  `code` char(6) NOT NULL default '',
  PRIMARY KEY  (`session_id`,`confirm_id`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `forum_confirm`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `forum_disallow`
-- 

CREATE TABLE `forum_disallow` (
  `disallow_id` mediumint(8) unsigned NOT NULL auto_increment,
  `disallow_username` varchar(25) NOT NULL default '',
  PRIMARY KEY  (`disallow_id`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `forum_disallow`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `forum_forum_prune`
-- 

CREATE TABLE `forum_forum_prune` (
  `prune_id` mediumint(8) unsigned NOT NULL auto_increment,
  `forum_id` smallint(5) unsigned NOT NULL default '0',
  `prune_days` smallint(5) unsigned NOT NULL default '0',
  `prune_freq` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`prune_id`),
  KEY `forum_id` (`forum_id`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `forum_forum_prune`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `forum_forums`
-- 

CREATE TABLE `forum_forums` (
  `forum_id` smallint(5) unsigned NOT NULL default '0',
  `cat_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_name` varchar(150) default NULL,
  `forum_desc` text,
  `forum_status` tinyint(4) NOT NULL default '0',
  `forum_order` mediumint(8) unsigned NOT NULL default '1',
  `forum_posts` mediumint(8) unsigned NOT NULL default '0',
  `forum_topics` mediumint(8) unsigned NOT NULL default '0',
  `forum_last_post_id` mediumint(8) unsigned NOT NULL default '0',
  `prune_next` int(11) default NULL,
  `prune_enable` tinyint(1) NOT NULL default '0',
  `auth_view` tinyint(2) NOT NULL default '0',
  `auth_read` tinyint(2) NOT NULL default '0',
  `auth_post` tinyint(2) NOT NULL default '0',
  `auth_reply` tinyint(2) NOT NULL default '0',
  `auth_edit` tinyint(2) NOT NULL default '0',
  `auth_delete` tinyint(2) NOT NULL default '0',
  `auth_sticky` tinyint(2) NOT NULL default '0',
  `auth_announce` tinyint(2) NOT NULL default '0',
  `auth_vote` tinyint(2) NOT NULL default '0',
  `auth_pollcreate` tinyint(2) NOT NULL default '0',
  `auth_attachments` tinyint(2) NOT NULL default '0',
  PRIMARY KEY  (`forum_id`),
  KEY `forums_order` (`forum_order`),
  KEY `cat_id` (`cat_id`),
  KEY `forum_last_post_id` (`forum_last_post_id`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `forum_forums`
-- 

INSERT INTO `forum_forums` (`forum_id`, `cat_id`, `forum_name`, `forum_desc`, `forum_status`, `forum_order`, `forum_posts`, `forum_topics`, `forum_last_post_id`, `prune_next`, `prune_enable`, `auth_view`, `auth_read`, `auth_post`, `auth_reply`, `auth_edit`, `auth_delete`, `auth_sticky`, `auth_announce`, `auth_vote`, `auth_pollcreate`, `auth_attachments`) VALUES (5, 3, 'Rider Communities', '', 0, 20, 8, 7, 28, NULL, 0, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0),
(6, 4, 'Online Bike Vendors', '', 0, 20, 1, 1, 22, NULL, 0, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0),
(4, 2, 'Start your Engines', '', 0, 20, 20, 3, 30, NULL, 0, 0, 0, 0, 0, 1, 5, 3, 3, 1, 1, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `forum_groups`
-- 

CREATE TABLE `forum_groups` (
  `group_id` mediumint(8) NOT NULL auto_increment,
  `group_type` tinyint(4) NOT NULL default '1',
  `group_name` varchar(40) NOT NULL default '',
  `group_description` varchar(255) NOT NULL default '',
  `group_moderator` mediumint(8) NOT NULL default '0',
  `group_single_user` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`group_id`),
  KEY `group_single_user` (`group_single_user`)
) TYPE=MyISAM AUTO_INCREMENT=58 ;

-- 
-- Dumping data for table `forum_groups`
-- 

INSERT INTO `forum_groups` (`group_id`, `group_type`, `group_name`, `group_description`, `group_moderator`, `group_single_user`) VALUES (1, 1, 'Anonymous', 'Personal User', 0, 1),
(2, 1, 'Admin', 'Personal User', 0, 1),
(3, 1, '', 'Personal User', 0, 1),
(4, 1, '', 'Personal User', 0, 1),
(5, 1, '', 'Personal User', 0, 1),
(6, 1, '', 'Personal User', 0, 1),
(7, 1, '', 'Personal User', 0, 1),
(8, 1, '', 'Personal User', 0, 1),
(9, 1, '', 'Personal User', 0, 1),
(10, 1, '', 'Personal User', 0, 1),
(11, 1, '', 'Personal User', 0, 1),
(12, 1, '', 'Personal User', 0, 1),
(13, 1, '', 'Personal User', 0, 1),
(14, 1, '', 'Personal User', 0, 1),
(15, 1, '', 'Personal User', 0, 1),
(16, 1, '', 'Personal User', 0, 1),
(17, 1, '', 'Personal User', 0, 1),
(18, 1, '', 'Personal User', 0, 1),
(19, 1, '', 'Personal User', 0, 1),
(20, 1, '', 'Personal User', 0, 1),
(21, 1, '', 'Personal User', 0, 1),
(22, 1, '', 'Personal User', 0, 1),
(23, 1, '', 'Personal User', 0, 1),
(24, 1, '', 'Personal User', 0, 1),
(25, 1, '', 'Personal User', 0, 1),
(26, 1, '', 'Personal User', 0, 1),
(27, 1, '', 'Personal User', 0, 1),
(28, 1, '', 'Personal User', 0, 1),
(29, 1, '', 'Personal User', 0, 1),
(30, 1, '', 'Personal User', 0, 1),
(31, 1, '', 'Personal User', 0, 1),
(32, 1, '', 'Personal User', 0, 1),
(33, 1, '', 'Personal User', 0, 1),
(34, 1, '', 'Personal User', 0, 1),
(35, 1, '', 'Personal User', 0, 1),
(36, 1, '', 'Personal User', 0, 1),
(37, 1, '', 'Personal User', 0, 1),
(38, 1, '', 'Personal User', 0, 1),
(39, 1, '', 'Personal User', 0, 1),
(40, 1, '', 'Personal User', 0, 1),
(41, 1, '', 'Personal User', 0, 1),
(42, 1, '', 'Personal User', 0, 1),
(43, 1, '', 'Personal User', 0, 1),
(44, 1, '', 'Personal User', 0, 1),
(45, 1, '', 'Personal User', 0, 1),
(46, 1, '', 'Personal User', 0, 1),
(47, 1, '', 'Personal User', 0, 1),
(48, 1, '', 'Personal User', 0, 1),
(49, 1, '', 'Personal User', 0, 1),
(50, 1, '', 'Personal User', 0, 1),
(51, 1, '', 'Personal User', 0, 1),
(52, 1, '', 'Personal User', 0, 1),
(53, 1, '', 'Personal User', 0, 1),
(54, 1, '', 'Personal User', 0, 1),
(55, 1, '', 'Personal User', 0, 1),
(56, 1, '', 'Personal User', 0, 1),
(57, 1, '', 'Personal User', 0, 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `forum_posts`
-- 

CREATE TABLE `forum_posts` (
  `post_id` mediumint(8) unsigned NOT NULL auto_increment,
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` smallint(5) unsigned NOT NULL default '0',
  `poster_id` mediumint(8) NOT NULL default '0',
  `post_time` int(11) NOT NULL default '0',
  `poster_ip` varchar(8) NOT NULL default '',
  `post_username` varchar(25) default NULL,
  `enable_bbcode` tinyint(1) NOT NULL default '1',
  `enable_html` tinyint(1) NOT NULL default '0',
  `enable_smilies` tinyint(1) NOT NULL default '1',
  `enable_sig` tinyint(1) NOT NULL default '1',
  `post_edit_time` int(11) default NULL,
  `post_edit_count` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`post_id`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`),
  KEY `poster_id` (`poster_id`),
  KEY `post_time` (`post_time`)
) TYPE=MyISAM AUTO_INCREMENT=31 ;

-- 
-- Dumping data for table `forum_posts`
-- 

INSERT INTO `forum_posts` (`post_id`, `topic_id`, `forum_id`, `poster_id`, `post_time`, `poster_ip`, `post_username`, `enable_bbcode`, `enable_html`, `enable_smilies`, `enable_sig`, `post_edit_time`, `post_edit_count`) VALUES (2, 2, 4, -1, 1101976664, 'd2016c09', '', 1, 0, 1, 0, NULL, 0),
(3, 2, 4, 2, 1102009220, 'd2d5ac37', '', 1, 0, 1, 0, NULL, 0),
(4, 2, 4, -1, 1102057415, 'ca5c801a', '', 1, 0, 1, 0, NULL, 0),
(5, 2, 4, -1, 1102077721, 'de7e777a', 'dxtreme', 1, 0, 1, 0, NULL, 0),
(6, 2, 4, 10, 1102318822, 'caa3c3b2', '', 1, 0, 1, 1, NULL, 0),
(7, 2, 4, -1, 1102319484, 'cb41f547', 'LUPET', 1, 0, 1, 0, NULL, 0),
(8, 3, 5, -1, 1102324633, 'd2d5b490', 'r_castanas', 1, 0, 1, 0, NULL, 0),
(9, 4, 4, 12, 1102420012, 'd2d58485', '', 1, 0, 1, 0, NULL, 0),
(10, 5, 5, 14, 1102481534, 'caa3cabc', '', 1, 0, 1, 0, NULL, 0),
(11, 2, 4, -1, 1102555885, 'cb8374b3', 'matinique', 1, 0, 1, 0, NULL, 0),
(12, 6, 5, -1, 1102663146, '42c68465', 'artze_tech', 1, 0, 1, 0, NULL, 0),
(13, 7, 5, 17, 1102721032, 'ca51a148', '', 1, 0, 1, 0, NULL, 0),
(14, 2, 4, 17, 1102721177, 'ca51a148', '', 1, 0, 1, 0, NULL, 0),
(15, 3, 5, 18, 1103117243, '3d096e51', '', 1, 0, 1, 0, NULL, 0),
(16, 2, 4, -1, 1104201342, 'ca08fd56', 'antet', 1, 0, 1, 0, NULL, 0),
(17, 2, 4, -1, 1104739822, 'cb8374b3', 'erikikay', 1, 0, 1, 0, NULL, 0),
(18, 8, 4, 24, 1106612988, 'ca56c8fd', '', 1, 0, 1, 1, NULL, 0),
(19, 8, 4, 24, 1106613402, 'ca56c8fd', '', 1, 0, 1, 1, NULL, 0),
(20, 2, 4, -1, 1106642083, 'd2177342', 'swac_slayer', 1, 0, 1, 0, NULL, 0),
(21, 9, 5, -1, 1107835780, 'cb4cd028', 'u4bc(united 4stroke b.c)', 1, 0, 1, 0, NULL, 0),
(22, 10, 6, 27, 1108098108, 'd2d5e545', '', 1, 0, 1, 0, NULL, 0),
(23, 2, 4, -1, 1108522847, 'd2d5aa53', 'foxraider', 1, 0, 1, 0, NULL, 0),
(24, 11, 5, -1, 1109851712, 'de7e4acf', '', 1, 0, 1, 0, NULL, 0),
(25, 2, 4, 31, 1114047159, 'cf8d05fd', '', 1, 0, 1, 0, NULL, 0),
(26, 8, 4, 45, 1114570729, 'ca51b8d4', '', 1, 0, 1, 1, NULL, 0),
(27, 2, 4, 45, 1114571136, 'ca51b8d4', '', 1, 0, 1, 1, NULL, 0),
(28, 12, 5, 45, 1114571768, 'ca51b8d4', '', 1, 0, 1, 1, NULL, 0),
(29, 8, 4, -1, 1114646755, 'ca80268d', '', 1, 0, 1, 0, NULL, 0),
(30, 8, 4, 45, 1114650849, 'ca4e680e', '', 1, 0, 1, 1, NULL, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `forum_posts_text`
-- 

CREATE TABLE `forum_posts_text` (
  `post_id` mediumint(8) unsigned NOT NULL default '0',
  `bbcode_uid` varchar(10) NOT NULL default '',
  `post_subject` varchar(60) default NULL,
  `post_text` text,
  PRIMARY KEY  (`post_id`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `forum_posts_text`
-- 

INSERT INTO `forum_posts_text` (`post_id`, `bbcode_uid`, `post_subject`, `post_text`) VALUES (2, 'e4241f2fe7', 'functional?', 'is this forum functioning already i have registered but cant login activated my account thru my email also\r\n\r\nthanks anyway'),
(3, 'e363c82a66', 'Re: functional?', '[quote:e363c82a66="Anonymous"]is this forum functioning already i have registered but cant login activated my account thru my email also\r\n\r\nthanks anyway[/quote:e363c82a66]\r\n\r\nThe Forum section is fully functional.  If you have registered through the "Register" section, you need to re-register in the Forum section.  These are two separate entities.  The login account for the "Register" section is different from the "Forum" section.   The account for the "Register" section allows you to access the Zoom Game, whereas the Forum section account allows you to access everything under this section.\r\n\r\nHope this helps.\r\n\r\nThanks.'),
(4, '4640ee753e', 'member log in', 'Ive signed up for membership online, do i need to buy castrol oil product/s to avail of a card?'),
(5, '0174d98731', 'greetings!!!', 'cool site :P'),
(6, 'c4d137731a', '', 'Hi dudes, newbee here. Just wanna ask are there authorized sellers of castrol here in phillipines and where'),
(7, '719e3541cc', '', 'hehehe galing!!! :lol:'),
(8, 'c8d5b4bc49', 'scooter club in dasmarinas', ':lol: to all yo ma peeps out da! :lol: \r\n\r\nthe scooter club in dasmarinas, cavite (DC RIDERS CLUB) are inviting you to join the club, if you are interested just come in our dc haus at congressional ave., infront of eastern gas station and manuelaville subd. during friday night with your coolest ride. see you bro! \r\nenjoy your ride!\r\n\r\ndc riders club'),
(9, '93bcb6ff37', 'Zoom Calendar', 'I have seen the Zoom Calendar and I have a question about the activity on Dec 12, 2004 it says Moto Tuner C3-Malabon.  I believe Moto Tuner is located at Gov Pascual St Concepcion Malabon.  Please clarify.  Thanks'),
(10, '83edeb6904', 'taguig riders...', 'TO	: ALL TAGUIG UNDERBONE RIDERS \r\n           \r\n\r\nWHAT	: LET&#8217;S MEET AND FORM A GROUP  \r\n                   THAT WILL UNITE US ALL&#8230;\r\n\r\nWHEN	: EVERY WEDNESDAY 6 PM ONWARDS\r\n\r\nWHERE	: TOPPERS PIZZA BESIDE PLAZA QUEZON STA.ANA TAGUIG\r\n\r\nLET&#8217;S UNITE! GO TAGUIG!\r\nHOME OF THE GLOBAL CITY.\r\n\r\nFOR INQUIRIES PLS FEEL FREE TO CALL or SEND AN SMS:\r\nRT		: 0917-8365805 \r\nPAUL		: 0922-4715461\r\n                                  lndline8381585\r\n                                  or 8398365\r\nARIS		: 0920-6539608\r\nKENNETH	                : 0910-6488374  \r\n                                  lndline8344078\r\n\r\nYOU CAN ALSO VISIT THIS WEBSITE :\r\nhttp://cubclub.gnuthings.com/forum/index.php\r\nAND CLICK THE TAGUIG RIDERS THREAD'),
(11, 'd3648fa106', '', 'ok dito ah. nice :D  :lol: t'),
(12, 'ea77471f4f', 'Honda XRM Club Philippines', 'Honda Xrm 110 riders are invited to join our club!\r\nHang out with us every Friday 9pm onwards @ Caltex Julia Vargas'),
(13, 'a20a6c80f3', 'Moto Dex Riders Club', 'for those who are interested to join our group in Marikina area kindly register at C. Salonga Marketing Dela Paz, Sto.niño Marikina City.............'),
(14, 'f3f7401173', '', 'its a nice site.............. 8)'),
(15, 'ac09fa444d', 'Re: scooter club in dasmarinas', '[quote:ac09fa444d][quote:ac09fa444d="r_castanas"]:lol: to all yo ma peeps out da! :lol: \r\n\r\nthe scooter club in dasmarinas, cavite (DC RIDERS CLUB) are inviting you to join the club, if you are interested just come in our dc haus at congressional ave., infront of eastern gas station and manuelaville subd. during friday night with your coolest ride. see you bro! \r\nenjoy your ride!\r\n\r\ndc riders club[/quote:ac09fa444d][/quote:ac09fa444d]\r\n\r\nBro san ba ang tambayan nyo? i''m from bacoor but i dont know saan yan..'),
(16, 'e966e0a4a9', 'kudos!!!', 'nice work!!! keep it up guyz!!! :D'),
(17, 'ba7992576e', '', '[quote:ba7992576e="Tammahommie"]Hi dudes, newbee here. Just wanna ask are there authorized sellers of castrol here in phillipines and where[/quote:ba7992576e]\r\n\r\n[color=blue:ba7992576e][/color:ba7992576e]hey tammahommie!  There are a lot of authorized sellers of Castrol here in the Philippines.  Kada-shop na makita mo na may Castrol signage, malamang authorized dealer yun.  AFAIK, sa Castrol mismo galing yung mga signages nila, so malamang in-authorize sila ng Castrol magtinda products nila.  San ka ba located dude?'),
(18, 'e165bbc222', 'CASTROL SCOOTERISTA PARTY', 'Thank you castrol for supporting the recently held Castrol Scooterista Party :D\r\n\r\ni''ll post some pictures at the gallery'),
(19, '5a0eb6d379', '', 'how do you post pictures at the gallery? :roll: \r\n\r\nmeatime may i direct you to the psf gallery at motorcyclephilippines\r\n\r\nhttp://motorcyclephilippines.com/photopost/showgallery.php/cat/3170'),
(20, '9bf9f159e8', 'astig!', 'BuRN YoUR TiRE, NoT yOUR SoUL... :wink: \r\nViVA! GOLDEN ISLE RIDERS CLUB!\r\n-Taweng 04'),
(21, '9221cca944', 'you are invited', 'if you are interested to join us..pls email us at\r\nu4bc@yahoo.com\r\n\r\nBe a part of a new society of bikers..'),
(22, 'b86b546890', 'castrol products', 'hello out there to any castrol dealer. i have a motor spare parts store in candaba, pampanga and am looking for castrol product supplier.\r\nplease email me. thanks\r\njohnson_qualityparts@yahoo.com'),
(23, '7bf55a3a1c', '', 'FOXRAIDER IS HERE\r\n\r\nA PROUD MEMBER OF MAKATI MOTO CLUB\r\n\r\nAND A CASTROL USER...'),
(24, 'ba33d52abf', '2nd Quezon Bike Meet &amp; Mayohan sa Tayabas', 'We are all inviting all riders club to join on our 2nd Quezon Bike meet on May 14, 2005 hosted by Tayabense Riders Club Inc. Be there and have a lots of fun. Pahiyas sa Quezon  and many more activities. For more information you can email at aidimaranan@yahoo.com'),
(25, '4136f1909b', '', 'I can''t login to the main site even after activating my account. dunno y...pls help!'),
(26, 'c52075c18c', '', 'sarap-sarap nung event ng scooterista ! ! ! kailan po ba ang next event ? :wink:'),
(27, '22c3220b7e', '', 'i''ve got a zoom card thru a liter of oil ! ! ! but i didnt register it via text ! ! ! coz i think tapos na yung promo ! ! !\r\n\r\ndo i still have to register it thru text?'),
(28, '603b6dc7b2', 'PSF - CPD', 'if you are interested in joining our group ! ! !\r\n\r\nplease see the following threads\r\n\r\n[url]http://cubclub.gnuthings.com/forum/viewforum.php?f=11&amp;sid=e357d82b02a99390a9fe92f5c73344b5[/url]\r\n\r\n[url]http://motorcyclephilippines.com/forums/forumdisplay.php?f=65[/url]\r\n\r\nyou could send us mail at psfncc@yahoo.com ! ! !  :wink:'),
(29, 'fa7f90556a', '', 'this weekend sa subic\r\n\r\nthe "castrol zoom club camp" :D'),
(30, '469cf1982b', '', 'ahhh ok ! ! !');

-- --------------------------------------------------------

-- 
-- Table structure for table `forum_privmsgs`
-- 

CREATE TABLE `forum_privmsgs` (
  `privmsgs_id` mediumint(8) unsigned NOT NULL auto_increment,
  `privmsgs_type` tinyint(4) NOT NULL default '0',
  `privmsgs_subject` varchar(255) NOT NULL default '0',
  `privmsgs_from_userid` mediumint(8) NOT NULL default '0',
  `privmsgs_to_userid` mediumint(8) NOT NULL default '0',
  `privmsgs_date` int(11) NOT NULL default '0',
  `privmsgs_ip` varchar(8) NOT NULL default '',
  `privmsgs_enable_bbcode` tinyint(1) NOT NULL default '1',
  `privmsgs_enable_html` tinyint(1) NOT NULL default '0',
  `privmsgs_enable_smilies` tinyint(1) NOT NULL default '1',
  `privmsgs_attach_sig` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`privmsgs_id`),
  KEY `privmsgs_from_userid` (`privmsgs_from_userid`),
  KEY `privmsgs_to_userid` (`privmsgs_to_userid`)
) TYPE=MyISAM AUTO_INCREMENT=3 ;

-- 
-- Dumping data for table `forum_privmsgs`
-- 

INSERT INTO `forum_privmsgs` (`privmsgs_id`, `privmsgs_type`, `privmsgs_subject`, `privmsgs_from_userid`, `privmsgs_to_userid`, `privmsgs_date`, `privmsgs_ip`, `privmsgs_enable_bbcode`, `privmsgs_enable_html`, `privmsgs_enable_smilies`, `privmsgs_attach_sig`) VALUES (1, 0, 'castrol card', 23, 2, 1104844196, 'ca5ba096', 1, 0, 1, 0),
(2, 2, 'castrol card', 23, 2, 1104844196, 'ca5ba096', 1, 0, 1, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `forum_privmsgs_text`
-- 

CREATE TABLE `forum_privmsgs_text` (
  `privmsgs_text_id` mediumint(8) unsigned NOT NULL default '0',
  `privmsgs_bbcode_uid` varchar(10) NOT NULL default '0',
  `privmsgs_text` text,
  PRIMARY KEY  (`privmsgs_text_id`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `forum_privmsgs_text`
-- 

INSERT INTO `forum_privmsgs_text` (`privmsgs_text_id`, `privmsgs_bbcode_uid`, `privmsgs_text`) VALUES (1, 'e24927b4e4', 'good day sir,\r\n\r\ni am a user of castrol power 1 and would like to inquire how i could avail of the castrol card?\r\n\r\nthanks and more power\r\n\r\ndennis\r\npsf r1'),
(2, 'e24927b4e4', 'good day sir,\r\n\r\ni am a user of castrol power 1 and would like to inquire how i could avail of the castrol card?\r\n\r\nthanks and more power\r\n\r\ndennis\r\npsf r1');

-- --------------------------------------------------------

-- 
-- Table structure for table `forum_ranks`
-- 

CREATE TABLE `forum_ranks` (
  `rank_id` smallint(5) unsigned NOT NULL auto_increment,
  `rank_title` varchar(50) NOT NULL default '',
  `rank_min` mediumint(8) NOT NULL default '0',
  `rank_special` tinyint(1) default '0',
  `rank_image` varchar(255) default NULL,
  PRIMARY KEY  (`rank_id`)
) TYPE=MyISAM AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `forum_ranks`
-- 

INSERT INTO `forum_ranks` (`rank_id`, `rank_title`, `rank_min`, `rank_special`, `rank_image`) VALUES (1, 'Site Admin', -1, 1, NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `forum_search_results`
-- 

CREATE TABLE `forum_search_results` (
  `search_id` int(11) unsigned NOT NULL default '0',
  `session_id` varchar(32) NOT NULL default '',
  `search_array` text NOT NULL,
  PRIMARY KEY  (`search_id`),
  KEY `session_id` (`session_id`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `forum_search_results`
-- 

INSERT INTO `forum_search_results` (`search_id`, `session_id`, `search_array`) VALUES (455937455, '3d3e95b5e199a7d02c38617135aee5da', 'a:7:{s:14:"search_results";s:1:"9";s:17:"total_match_count";i:1;s:12:"split_search";N;s:7:"sort_by";i:0;s:8:"sort_dir";s:4:"DESC";s:12:"show_results";s:5:"posts";s:12:"return_chars";i:200;}');

-- --------------------------------------------------------

-- 
-- Table structure for table `forum_search_wordlist`
-- 

CREATE TABLE `forum_search_wordlist` (
  `word_text` varchar(50) binary NOT NULL default '',
  `word_id` mediumint(8) unsigned NOT NULL auto_increment,
  `word_common` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`word_text`),
  KEY `word_id` (`word_id`)
) TYPE=MyISAM AUTO_INCREMENT=294 ;

-- 
-- Dumping data for table `forum_search_wordlist`
-- 

INSERT INTO `forum_search_wordlist` (`word_text`, `word_id`, `word_common`) VALUES (0x7468616e6b73, 23, 0),
(0x72656769737465726564, 22, 0),
(0x7068706262, 3, 0),
(0x6c6f67696e, 21, 0),
(0x66756e6374696f6e696e67, 20, 0),
(0x66756e6374696f6e616c, 19, 0),
(0x666f72756d, 18, 0),
(0x656d61696c, 17, 0),
(0x616e79776179, 16, 0),
(0x616c7265616479, 15, 0),
(0x616374697661746564, 14, 0),
(0x6163636f756e74, 13, 0),
(0x74687275, 24, 0),
(0x616363657373, 25, 0),
(0x616c6c6f7773, 26, 0),
(0x646966666572656e74, 27, 0),
(0x656e746974696573, 28, 0),
(0x65766572797468696e67, 29, 0),
(0x66756c6c79, 30, 0),
(0x67616d65, 31, 0),
(0x68656c7073, 32, 0),
(0x686f7065, 33, 0),
(0x7265676973746572, 34, 0),
(0x72657265676973746572, 35, 0),
(0x73656374696f6e, 36, 0),
(0x7365706572617465, 37, 0),
(0x74776f, 38, 0),
(0x77686572656173, 39, 0),
(0x7a6f6f6d, 40, 0),
(0x617661696c, 41, 0),
(0x627579, 42, 0),
(0x63617264, 43, 0),
(0x63617374726f6c, 44, 0),
(0x69, 45, 0),
(0x697665, 46, 0),
(0x6c6f67, 47, 0),
(0x6d656d626572, 48, 0),
(0x6d656d62657273686970, 49, 0),
(0x6f696c, 50, 0),
(0x6f6e6c696e65, 51, 0),
(0x70726f64756374, 52, 0),
(0x7369676e6564, 53, 0),
(0x636f6f6c, 54, 0),
(0x6772656574696e6773, 55, 0),
(0x73697465, 56, 0),
(0x617574686f72697a6564, 57, 0),
(0x6475646573, 58, 0),
(0x6e6577626565, 59, 0),
(0x7068696c6c6970696e6573, 60, 0),
(0x73656c6c657273, 61, 0),
(0x77616e6e61, 62, 0),
(0x67616c696e67, 63, 0),
(0x686568656865, 64, 0),
(0x6c6f6c, 65, 0),
(0x617665, 66, 0),
(0x62726f, 67, 0),
(0x636176697465, 68, 0),
(0x636c7562, 69, 0),
(0x636f6e6772657373696f6e616c, 70, 0),
(0x636f6f6c657374, 71, 0),
(0x6461736d6172696e6173, 72, 0),
(0x647572696e67, 73, 0),
(0x6561737465726e, 74, 0),
(0x656e6a6f79, 75, 0),
(0x667269646179, 76, 0),
(0x676173, 77, 0),
(0x68617573, 78, 0),
(0x696e66726f6e74, 79, 0),
(0x696e7465726573746564, 80, 0),
(0x696e766974696e67, 81, 0),
(0x6a6f696e, 82, 0),
(0x6d61, 83, 0),
(0x6d616e75656c6176696c6c65, 84, 0),
(0x6e69676874, 85, 0),
(0x7065657073, 86, 0),
(0x72696465, 87, 0),
(0x726964657273, 88, 0),
(0x73636f6f746572, 89, 0),
(0x73746174696f6e, 90, 0),
(0x73756264, 91, 0),
(0x32303034, 92, 0),
(0x6163746976697479, 93, 0),
(0x62656c69657665, 94, 0),
(0x63336d616c61626f6e, 95, 0),
(0x63616c656e646572, 96, 0),
(0x636c6172696679, 97, 0),
(0x636f6e63657063696f6e, 98, 0),
(0x646563, 99, 0),
(0x676f76, 100, 0),
(0x6c6f6361746564, 101, 0),
(0x6d616c61626f6e, 102, 0),
(0x6d6f746f, 103, 0),
(0x7061736375616c, 104, 0),
(0x7365656e, 105, 0),
(0x74756e6572, 106, 0),
(0x38323137, 107, 0),
(0x38323330, 108, 0),
(0x38333938333635, 109, 0),
(0x3039313036343838333734, 110, 0),
(0x3039313738333635383035, 111, 0),
(0x3039323036353339363038, 112, 0),
(0x3039323234373135343631, 113, 0),
(0x616e61, 114, 0),
(0x61726973, 115, 0),
(0x626573696465, 116, 0),
(0x63616c6c, 117, 0),
(0x63697479, 118, 0),
(0x636c69636b, 119, 0),
(0x6665656c, 120, 0),
(0x666f726d, 121, 0),
(0x66726565, 122, 0),
(0x676c6f62616c, 123, 0),
(0x67726f7570, 124, 0),
(0x696e71756972696573, 125, 0),
(0x6b656e6e657468, 126, 0),
(0x6c6574, 127, 0),
(0x6c6e646c696e6538333434303738, 128, 0),
(0x6c6e646c696e6538333831353835, 129, 0),
(0x6d656574, 130, 0),
(0x6f6e7761726473, 131, 0),
(0x7061756c, 132, 0),
(0x70697a7a61, 133, 0),
(0x706c617a61, 134, 0),
(0x706c73, 135, 0),
(0x706d, 136, 0),
(0x7175657a6f6e, 137, 0),
(0x7274, 138, 0),
(0x73656e64, 139, 0),
(0x736d73, 140, 0),
(0x737461, 141, 0),
(0x746167756967, 142, 0),
(0x746872656164, 143, 0),
(0x746f, 144, 0),
(0x746f7070657273, 145, 0),
(0x756e646572626f6e65, 146, 0),
(0x756e697465, 147, 0),
(0x7669736974, 148, 0),
(0x77656273697465, 149, 0),
(0x7765646e6573646179, 150, 0),
(0x77686174, 151, 0),
(0x7768656e, 152, 0),
(0x7768657265, 153, 0),
(0x6469746f, 154, 0),
(0x6e696365, 155, 0),
(0x313130, 156, 0),
(0x39706d, 157, 0),
(0x63616c746578, 158, 0),
(0x68616e67, 159, 0),
(0x686f6e6461, 160, 0),
(0x696e7669746564, 161, 0),
(0x6a756c6961, 162, 0),
(0x7068696c697070696e6573, 163, 0),
(0x766172676173, 164, 0),
(0x78726d, 165, 0),
(0x61726561, 166, 0),
(0x63, 167, 0),
(0x64656c61, 168, 0),
(0x646578, 169, 0),
(0x6b696e646c79, 170, 0),
(0x6d6172696b696e61, 171, 0),
(0x6d61726b6574696e67, 172, 0),
(0x6e69f16f, 173, 0),
(0x70617a, 174, 0),
(0x73616c6f6e6761, 175, 0),
(0x73746f, 176, 0),
(0x616e67, 177, 0),
(0x6261636f6f72, 178, 0),
(0x6e796f, 179, 0),
(0x7361616e, 180, 0),
(0x73616e, 181, 0),
(0x74616d626179616e, 182, 0),
(0x79616e, 183, 0),
(0x6775797a, 184, 0),
(0x6b656570, 185, 0),
(0x6b75646f73, 186, 0),
(0x776f726b, 187, 0),
(0x616661696b, 188, 0),
(0x6261, 189, 0),
(0x6465616c6572, 190, 0),
(0x64756465, 191, 0),
(0x686579, 192, 0),
(0x696e617574686f72697a65, 193, 0),
(0x6b61646173686f70, 194, 0),
(0x6d616774696e6461, 195, 0),
(0x6d616b697461, 196, 0),
(0x6d616c616d616e67, 197, 0),
(0x6d6179, 198, 0),
(0x6d6761, 199, 0),
(0x6d69736d6f, 200, 0),
(0x6e61, 201, 0),
(0x6e696c61, 202, 0),
(0x70726f6475637473, 203, 0),
(0x7369676e616765, 204, 0),
(0x7369676e61676573, 205, 0),
(0x73696c61, 206, 0),
(0x74616d6d61686f6d6d6965, 207, 0),
(0x79756e, 208, 0),
(0x79756e67, 209, 0),
(0x67616c6c657279, 210, 0),
(0x68656c64, 211, 0),
(0x696c6c, 212, 0),
(0x7061727479, 213, 0),
(0x7069637475726573, 214, 0),
(0x706f7374, 215, 0),
(0x726563656e746c79, 216, 0),
(0x73636f6f74657269737461, 217, 0),
(0x737570706f7274696e67, 218, 0),
(0x646972656374, 219, 0),
(0x6d656174696d65, 220, 0),
(0x6d6f746f726379636c657068696c697070696e6573, 221, 0),
(0x707366, 222, 0),
(0x726f6c6c, 223, 0),
(0x6173746967, 224, 0),
(0x6275726e, 225, 0),
(0x676f6c64656e, 226, 0),
(0x69736c65, 227, 0),
(0x736f756c, 228, 0),
(0x746177656e67, 229, 0),
(0x74697265, 230, 0),
(0x76697661, 231, 0),
(0x77696e6b, 232, 0),
(0x62696b657273, 233, 0),
(0x636f6d, 234, 0),
(0x70617274, 235, 0),
(0x736f6369657479, 236, 0),
(0x75346263, 237, 0),
(0x7961686f6f, 238, 0),
(0x63616e64616261, 239, 0),
(0x68656c6c6f, 240, 0),
(0x6a6f686e736f6e7175616c6974797061727473, 241, 0),
(0x6d6f746f72, 242, 0),
(0x70616d70616e6761, 243, 0),
(0x7061727473, 244, 0),
(0x7370617265, 245, 0),
(0x73746f7265, 246, 0),
(0x737570706c696572, 247, 0),
(0x666f78726169646572, 248, 0),
(0x6d616b617469, 249, 0),
(0x70726f7564, 250, 0),
(0x75736572, 251, 0),
(0x32303035, 252, 0),
(0x326e64, 253, 0),
(0x61637469766974696573, 254, 0),
(0x616964696d6172616e616e, 255, 0),
(0x616d70, 256, 0),
(0x62696b65, 257, 0),
(0x66756e, 258, 0),
(0x686f73746564, 259, 0),
(0x696e63, 260, 0),
(0x696e666f726d6174696f6e, 261, 0),
(0x6c6f7473, 262, 0),
(0x6d61796f68616e, 263, 0),
(0x70616869796173, 264, 0),
(0x74617961626173, 265, 0),
(0x7461796162656e7365, 266, 0),
(0x61637469766174696e67, 267, 0),
(0x64756e6e6f, 268, 0),
(0x68656c70, 269, 0),
(0x6d61696e, 270, 0),
(0x6576656e74, 271, 0),
(0x6b61696c616e, 272, 0),
(0x6e657874, 273, 0),
(0x6e756e67, 274, 0),
(0x73617261707361726170, 275, 0),
(0x636f7a, 276, 0),
(0x6c69746572, 277, 0),
(0x70726f6d6f, 278, 0),
(0x7374696c6c, 279, 0),
(0x7461706f73, 280, 0),
(0x74657874, 281, 0),
(0x7468696e6b, 282, 0),
(0x637064, 283, 0),
(0x666f6c6c6f77696e67, 284, 0),
(0x6a6f696e696e67, 285, 0),
(0x6d61696c, 286, 0),
(0x7073666e6363, 287, 0),
(0x736964, 288, 0),
(0x74687265616473, 289, 0),
(0x63616d70, 290, 0),
(0x7375626963, 291, 0),
(0x7765656b656e64, 292, 0),
(0x61686868, 293, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `forum_search_wordmatch`
-- 

CREATE TABLE `forum_search_wordmatch` (
  `post_id` mediumint(8) unsigned NOT NULL default '0',
  `word_id` mediumint(8) unsigned NOT NULL default '0',
  `title_match` tinyint(1) NOT NULL default '0',
  KEY `post_id` (`post_id`),
  KEY `word_id` (`word_id`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `forum_search_wordmatch`
-- 

INSERT INTO `forum_search_wordmatch` (`post_id`, `word_id`, `title_match`) VALUES (3, 23, 0),
(2, 19, 1),
(2, 24, 0),
(2, 13, 0),
(2, 14, 0),
(2, 15, 0),
(2, 16, 0),
(2, 17, 0),
(2, 18, 0),
(2, 20, 0),
(2, 21, 0),
(2, 22, 0),
(2, 23, 0),
(3, 22, 0),
(3, 21, 0),
(3, 20, 0),
(3, 19, 0),
(3, 18, 0),
(3, 17, 0),
(3, 16, 0),
(3, 15, 0),
(3, 14, 0),
(3, 13, 0),
(3, 24, 0),
(3, 25, 0),
(3, 26, 0),
(3, 27, 0),
(3, 28, 0),
(3, 29, 0),
(3, 30, 0),
(3, 31, 0),
(3, 32, 0),
(3, 33, 0),
(3, 34, 0),
(3, 35, 0),
(3, 36, 0),
(3, 37, 0),
(3, 38, 0),
(3, 39, 0),
(3, 40, 0),
(3, 19, 1),
(4, 41, 0),
(4, 42, 0),
(4, 43, 0),
(4, 44, 0),
(4, 45, 0),
(4, 46, 0),
(4, 49, 0),
(4, 50, 0),
(4, 51, 0),
(4, 52, 0),
(4, 53, 0),
(4, 47, 1),
(4, 48, 1),
(5, 54, 0),
(5, 56, 0),
(5, 55, 1),
(6, 44, 0),
(6, 57, 0),
(6, 58, 0),
(6, 59, 0),
(6, 60, 0),
(6, 61, 0),
(6, 62, 0),
(7, 63, 0),
(7, 64, 0),
(7, 65, 0),
(8, 65, 0),
(8, 66, 0),
(8, 67, 0),
(8, 68, 0),
(8, 69, 0),
(8, 70, 0),
(8, 71, 0),
(8, 72, 0),
(8, 73, 0),
(8, 74, 0),
(8, 75, 0),
(8, 76, 0),
(8, 77, 0),
(8, 78, 0),
(8, 79, 0),
(8, 80, 0),
(8, 81, 0),
(8, 82, 0),
(8, 83, 0),
(8, 84, 0),
(8, 85, 0),
(8, 86, 0),
(8, 87, 0),
(8, 88, 0),
(8, 89, 0),
(8, 90, 0),
(8, 91, 0),
(8, 69, 1),
(8, 72, 1),
(8, 89, 1),
(9, 23, 0),
(9, 40, 0),
(9, 92, 0),
(9, 93, 0),
(9, 94, 0),
(9, 95, 0),
(9, 96, 0),
(9, 97, 0),
(9, 98, 0),
(9, 99, 0),
(9, 100, 0),
(9, 101, 0),
(9, 102, 0),
(9, 103, 0),
(9, 104, 0),
(9, 105, 0),
(9, 106, 0),
(9, 96, 1),
(9, 40, 1),
(10, 88, 0),
(10, 107, 0),
(10, 108, 0),
(10, 109, 0),
(10, 110, 0),
(10, 111, 0),
(10, 112, 0),
(10, 113, 0),
(10, 114, 0),
(10, 115, 0),
(10, 116, 0),
(10, 117, 0),
(10, 118, 0),
(10, 119, 0),
(10, 120, 0),
(10, 121, 0),
(10, 122, 0),
(10, 123, 0),
(10, 124, 0),
(10, 125, 0),
(10, 126, 0),
(10, 127, 0),
(10, 128, 0),
(10, 129, 0),
(10, 130, 0),
(10, 131, 0),
(10, 132, 0),
(10, 133, 0),
(10, 134, 0),
(10, 135, 0),
(10, 136, 0),
(10, 137, 0),
(10, 138, 0),
(10, 139, 0),
(10, 140, 0),
(10, 141, 0),
(10, 142, 0),
(10, 143, 0),
(10, 144, 0),
(10, 145, 0),
(10, 146, 0),
(10, 147, 0),
(10, 148, 0),
(10, 149, 0),
(10, 150, 0),
(10, 151, 0),
(10, 152, 0),
(10, 153, 0),
(10, 88, 1),
(10, 142, 1),
(11, 154, 0),
(11, 65, 0),
(11, 155, 0),
(12, 156, 0),
(12, 157, 0),
(12, 158, 0),
(12, 69, 0),
(12, 76, 0),
(12, 159, 0),
(12, 160, 0),
(12, 161, 0),
(12, 82, 0),
(12, 162, 0),
(12, 131, 0),
(12, 88, 0),
(12, 164, 0),
(12, 165, 0),
(12, 69, 1),
(12, 160, 1),
(12, 163, 1),
(12, 165, 1),
(13, 166, 0),
(13, 167, 0),
(13, 118, 0),
(13, 168, 0),
(13, 124, 0),
(13, 80, 0),
(13, 82, 0),
(13, 170, 0),
(13, 171, 0),
(13, 172, 0),
(13, 173, 0),
(13, 174, 0),
(13, 34, 0),
(13, 175, 0),
(13, 176, 0),
(13, 69, 1),
(13, 169, 1),
(13, 103, 1),
(13, 88, 1),
(14, 155, 0),
(14, 56, 0),
(15, 65, 0),
(15, 66, 0),
(15, 67, 0),
(15, 68, 0),
(15, 69, 0),
(15, 70, 0),
(15, 71, 0),
(15, 72, 0),
(15, 73, 0),
(15, 74, 0),
(15, 75, 0),
(15, 76, 0),
(15, 77, 0),
(15, 78, 0),
(15, 79, 0),
(15, 80, 0),
(15, 81, 0),
(15, 82, 0),
(15, 83, 0),
(15, 84, 0),
(15, 85, 0),
(15, 86, 0),
(15, 87, 0),
(15, 88, 0),
(15, 89, 0),
(15, 90, 0),
(15, 91, 0),
(15, 177, 0),
(15, 178, 0),
(15, 179, 0),
(15, 180, 0),
(15, 181, 0),
(15, 182, 0),
(15, 183, 0),
(15, 69, 1),
(15, 72, 1),
(15, 89, 1),
(16, 184, 0),
(16, 185, 0),
(16, 155, 0),
(16, 187, 0),
(16, 186, 1),
(17, 44, 0),
(17, 57, 0),
(17, 58, 0),
(17, 59, 0),
(17, 60, 0),
(17, 61, 0),
(17, 62, 0),
(17, 63, 0),
(17, 101, 0),
(17, 163, 0),
(17, 181, 0),
(17, 188, 0),
(17, 189, 0),
(17, 190, 0),
(17, 191, 0),
(17, 192, 0),
(17, 193, 0),
(17, 194, 0),
(17, 195, 0),
(17, 196, 0),
(17, 197, 0),
(17, 198, 0),
(17, 199, 0),
(17, 200, 0),
(17, 201, 0),
(17, 202, 0),
(17, 203, 0),
(17, 204, 0),
(17, 205, 0),
(17, 206, 0),
(17, 207, 0),
(17, 208, 0),
(17, 209, 0),
(18, 44, 0),
(18, 210, 0),
(18, 211, 0),
(18, 212, 0),
(18, 213, 0),
(18, 214, 0),
(18, 215, 0),
(18, 216, 0),
(18, 217, 0),
(18, 218, 0),
(18, 44, 1),
(18, 213, 1),
(18, 217, 1),
(19, 219, 0),
(19, 210, 0),
(19, 198, 0),
(19, 220, 0),
(19, 221, 0),
(19, 214, 0),
(19, 215, 0),
(19, 222, 0),
(19, 223, 0),
(20, 225, 0),
(20, 69, 0),
(20, 226, 0),
(20, 227, 0),
(20, 88, 0),
(20, 228, 0),
(20, 229, 0),
(20, 230, 0),
(20, 231, 0),
(20, 232, 0),
(20, 224, 1),
(21, 233, 0),
(21, 234, 0),
(21, 17, 0),
(21, 80, 0),
(21, 82, 0),
(21, 235, 0),
(21, 135, 0),
(21, 236, 0),
(21, 237, 0),
(21, 238, 0),
(21, 161, 1),
(22, 239, 0),
(22, 44, 0),
(22, 234, 0),
(22, 190, 0),
(22, 17, 0),
(22, 240, 0),
(22, 241, 0),
(22, 242, 0),
(22, 243, 0),
(22, 244, 0),
(22, 52, 0),
(22, 245, 0),
(22, 246, 0),
(22, 247, 0),
(22, 23, 0),
(22, 238, 0),
(22, 44, 1),
(22, 203, 1),
(23, 44, 0),
(23, 69, 0),
(23, 248, 0),
(23, 249, 0),
(23, 48, 0),
(23, 103, 0),
(23, 250, 0),
(23, 251, 0),
(24, 252, 0),
(24, 253, 0),
(24, 254, 0),
(24, 255, 0),
(24, 257, 0),
(24, 69, 0),
(24, 234, 0),
(24, 17, 0),
(24, 258, 0),
(24, 259, 0),
(24, 260, 0),
(24, 261, 0),
(24, 81, 0),
(24, 82, 0),
(24, 262, 0),
(24, 198, 0),
(24, 130, 0),
(24, 264, 0),
(24, 137, 0),
(24, 88, 0),
(24, 266, 0),
(24, 238, 0),
(24, 253, 1),
(24, 256, 1),
(24, 257, 1),
(24, 263, 1),
(24, 130, 1),
(24, 137, 1),
(24, 265, 1),
(25, 13, 0),
(25, 267, 0),
(25, 268, 0),
(25, 269, 0),
(25, 21, 0),
(25, 270, 0),
(25, 135, 0),
(25, 56, 0),
(26, 177, 0),
(26, 189, 0),
(26, 271, 0),
(26, 272, 0),
(26, 273, 0),
(26, 274, 0),
(26, 275, 0),
(26, 217, 0),
(26, 232, 0),
(27, 43, 0),
(27, 276, 0),
(27, 45, 0),
(27, 46, 0),
(27, 277, 0),
(27, 50, 0),
(27, 278, 0),
(27, 34, 0),
(27, 279, 0),
(27, 280, 0),
(27, 281, 0),
(27, 282, 0),
(27, 24, 0),
(27, 209, 0),
(27, 40, 0),
(28, 234, 0),
(28, 284, 0),
(28, 124, 0),
(28, 80, 0),
(28, 285, 0),
(28, 286, 0),
(28, 287, 0),
(28, 139, 0),
(28, 288, 0),
(28, 289, 0),
(28, 232, 0),
(28, 238, 0),
(28, 283, 1),
(28, 222, 1),
(29, 290, 0),
(29, 44, 0),
(29, 69, 0),
(29, 291, 0),
(29, 292, 0),
(29, 40, 0),
(30, 293, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `forum_sessions`
-- 

CREATE TABLE `forum_sessions` (
  `session_id` char(32) NOT NULL default '',
  `session_user_id` mediumint(8) NOT NULL default '0',
  `session_start` int(11) NOT NULL default '0',
  `session_time` int(11) NOT NULL default '0',
  `session_ip` char(8) NOT NULL default '0',
  `session_page` int(11) NOT NULL default '0',
  `session_logged_in` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`session_id`),
  KEY `session_user_id` (`session_user_id`),
  KEY `session_id_ip_user_id` (`session_id`,`session_ip`,`session_user_id`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `forum_sessions`
-- 

INSERT INTO `forum_sessions` (`session_id`, `session_user_id`, `session_start`, `session_time`, `session_ip`, `session_page`, `session_logged_in`) VALUES ('9e4bf29b28f72ed93fc8a5bb3d1877aa', -1, 1115276501, 1115276501, 'cbbbd01a', -4, 0),
('fb9622f8b3a5dccaaa792272d35047b9', -1, 1115168185, 1115168185, 'caa3dd0a', 0, 0),
('961ca1bc34e3da8a06fcad5b866162e6', -1, 1115272862, 1115272862, 'd2d5e672', 0, 0),
('df429c64ecf19858f45811cf745a008b', -1, 1115270182, 1115270182, 'd2d5e672', 0, 0),
('28b1bc90adc9b39deb42dedb186bd0af', -1, 1115269296, 1115269296, 'cf2e6250', 0, 0),
('6a350246dd809611d97a15744cc1f2cb', -1, 1115162964, 1115171538, 'cf2e6250', -4, 0),
('a9b21e335a94a28914c0172c59b9f744', -1, 1115259240, 1115259240, 'cf2e6250', -4, 0),
('b1ecf8475cd54bdea7fd5969e74ddb72', -1, 1115255937, 1115255937, 'cf2e6250', 0, 0),
('487748704d460f1c600c0b7f14b9add1', -1, 1115235948, 1115235948, 'cf2e6250', 5, 0),
('dce4e844e623a56fa96ef0b62eb2179f', -1, 1115196244, 1115196244, 'd2d5fc52', 0, 0),
('6c4fbf0d6663132d2bb92e1d0a4aa7c5', -1, 1115185625, 1115185625, 'caafed2a', 0, 0),
('be5ef4828207f1cc272d8b6c470f19f7', -1, 1115185357, 1115185357, 'caafed2a', -4, 0),
('d7e86e63a8e20bba4568dc2e1164b788', -1, 1115179111, 1115179111, 'cf2e6250', 0, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `forum_smilies`
-- 

CREATE TABLE `forum_smilies` (
  `smilies_id` smallint(5) unsigned NOT NULL auto_increment,
  `code` varchar(50) default NULL,
  `smile_url` varchar(100) default NULL,
  `emoticon` varchar(75) default NULL,
  PRIMARY KEY  (`smilies_id`)
) TYPE=MyISAM AUTO_INCREMENT=43 ;

-- 
-- Dumping data for table `forum_smilies`
-- 

INSERT INTO `forum_smilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (1, ':D', 'icon_biggrin.gif', 'Very Happy'),
(2, ':-D', 'icon_biggrin.gif', 'Very Happy'),
(3, ':grin:', 'icon_biggrin.gif', 'Very Happy'),
(4, ':)', 'icon_smile.gif', 'Smile'),
(5, ':-)', 'icon_smile.gif', 'Smile'),
(6, ':smile:', 'icon_smile.gif', 'Smile'),
(7, ':(', 'icon_sad.gif', 'Sad'),
(8, ':-(', 'icon_sad.gif', 'Sad'),
(9, ':sad:', 'icon_sad.gif', 'Sad'),
(10, ':o', 'icon_surprised.gif', 'Surprised'),
(11, ':-o', 'icon_surprised.gif', 'Surprised'),
(12, ':eek:', 'icon_surprised.gif', 'Surprised'),
(13, ':shock:', 'icon_eek.gif', 'Shocked'),
(14, ':?', 'icon_confused.gif', 'Confused'),
(15, ':-?', 'icon_confused.gif', 'Confused'),
(16, ':???:', 'icon_confused.gif', 'Confused'),
(17, '8)', 'icon_cool.gif', 'Cool'),
(18, '8-)', 'icon_cool.gif', 'Cool'),
(19, ':cool:', 'icon_cool.gif', 'Cool'),
(20, ':lol:', 'icon_lol.gif', 'Laughing'),
(21, ':x', 'icon_mad.gif', 'Mad'),
(22, ':-x', 'icon_mad.gif', 'Mad'),
(23, ':mad:', 'icon_mad.gif', 'Mad'),
(24, ':P', 'icon_razz.gif', 'Razz'),
(25, ':-P', 'icon_razz.gif', 'Razz'),
(26, ':razz:', 'icon_razz.gif', 'Razz'),
(27, ':oops:', 'icon_redface.gif', 'Embarassed'),
(28, ':cry:', 'icon_cry.gif', 'Crying or Very sad'),
(29, ':evil:', 'icon_evil.gif', 'Evil or Very Mad'),
(30, ':twisted:', 'icon_twisted.gif', 'Twisted Evil'),
(31, ':roll:', 'icon_rolleyes.gif', 'Rolling Eyes'),
(32, ':wink:', 'icon_wink.gif', 'Wink'),
(33, ';)', 'icon_wink.gif', 'Wink'),
(34, ';-)', 'icon_wink.gif', 'Wink'),
(35, ':!:', 'icon_exclaim.gif', 'Exclamation'),
(36, ':?:', 'icon_question.gif', 'Question'),
(37, ':idea:', 'icon_idea.gif', 'Idea'),
(38, ':arrow:', 'icon_arrow.gif', 'Arrow'),
(39, ':|', 'icon_neutral.gif', 'Neutral'),
(40, ':-|', 'icon_neutral.gif', 'Neutral'),
(41, ':neutral:', 'icon_neutral.gif', 'Neutral'),
(42, ':mrgreen:', 'icon_mrgreen.gif', 'Mr. Green');

-- --------------------------------------------------------

-- 
-- Table structure for table `forum_themes`
-- 

CREATE TABLE `forum_themes` (
  `themes_id` mediumint(8) unsigned NOT NULL auto_increment,
  `template_name` varchar(30) NOT NULL default '',
  `style_name` varchar(30) NOT NULL default '',
  `head_stylesheet` varchar(100) default NULL,
  `body_background` varchar(100) default NULL,
  `body_bgcolor` varchar(6) default NULL,
  `body_text` varchar(6) default NULL,
  `body_link` varchar(6) default NULL,
  `body_vlink` varchar(6) default NULL,
  `body_alink` varchar(6) default NULL,
  `body_hlink` varchar(6) default NULL,
  `tr_color1` varchar(6) default NULL,
  `tr_color2` varchar(6) default NULL,
  `tr_color3` varchar(6) default NULL,
  `tr_class1` varchar(25) default NULL,
  `tr_class2` varchar(25) default NULL,
  `tr_class3` varchar(25) default NULL,
  `th_color1` varchar(6) default NULL,
  `th_color2` varchar(6) default NULL,
  `th_color3` varchar(6) default NULL,
  `th_class1` varchar(25) default NULL,
  `th_class2` varchar(25) default NULL,
  `th_class3` varchar(25) default NULL,
  `td_color1` varchar(6) default NULL,
  `td_color2` varchar(6) default NULL,
  `td_color3` varchar(6) default NULL,
  `td_class1` varchar(25) default NULL,
  `td_class2` varchar(25) default NULL,
  `td_class3` varchar(25) default NULL,
  `fontface1` varchar(50) default NULL,
  `fontface2` varchar(50) default NULL,
  `fontface3` varchar(50) default NULL,
  `fontsize1` tinyint(4) default NULL,
  `fontsize2` tinyint(4) default NULL,
  `fontsize3` tinyint(4) default NULL,
  `fontcolor1` varchar(6) default NULL,
  `fontcolor2` varchar(6) default NULL,
  `fontcolor3` varchar(6) default NULL,
  `span_class1` varchar(25) default NULL,
  `span_class2` varchar(25) default NULL,
  `span_class3` varchar(25) default NULL,
  `img_size_poll` smallint(5) unsigned default NULL,
  `img_size_privmsg` smallint(5) unsigned default NULL,
  PRIMARY KEY  (`themes_id`)
) TYPE=MyISAM AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `forum_themes`
-- 

INSERT INTO `forum_themes` (`themes_id`, `template_name`, `style_name`, `head_stylesheet`, `body_background`, `body_bgcolor`, `body_text`, `body_link`, `body_vlink`, `body_alink`, `body_hlink`, `tr_color1`, `tr_color2`, `tr_color3`, `tr_class1`, `tr_class2`, `tr_class3`, `th_color1`, `th_color2`, `th_color3`, `th_class1`, `th_class2`, `th_class3`, `td_color1`, `td_color2`, `td_color3`, `td_class1`, `td_class2`, `td_class3`, `fontface1`, `fontface2`, `fontface3`, `fontsize1`, `fontsize2`, `fontsize3`, `fontcolor1`, `fontcolor2`, `fontcolor3`, `span_class1`, `span_class2`, `span_class3`, `img_size_poll`, `img_size_privmsg`) VALUES (1, 'subSilver', 'subSilver', 'subSilver.css', '', 'E5E5E5', '000000', '006699', '5493B4', '', 'DD6900', 'EFEFEF', 'DEE3E7', 'D1D7DC', '', '', '', '98AAB1', '006699', 'FFFFFF', 'cellpic1.gif', 'cellpic3.gif', 'cellpic2.jpg', 'FAFAFA', 'FFFFFF', '', 'row1', 'row2', '', 'Verdana, Arial, Helvetica, sans-serif', 'Trebuchet MS', 'Courier, ''Courier New'', sans-serif', 10, 11, 12, '444444', '006600', 'FFA34F', '', '', '', NULL, NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `forum_themes_name`
-- 

CREATE TABLE `forum_themes_name` (
  `themes_id` smallint(5) unsigned NOT NULL default '0',
  `tr_color1_name` char(50) default NULL,
  `tr_color2_name` char(50) default NULL,
  `tr_color3_name` char(50) default NULL,
  `tr_class1_name` char(50) default NULL,
  `tr_class2_name` char(50) default NULL,
  `tr_class3_name` char(50) default NULL,
  `th_color1_name` char(50) default NULL,
  `th_color2_name` char(50) default NULL,
  `th_color3_name` char(50) default NULL,
  `th_class1_name` char(50) default NULL,
  `th_class2_name` char(50) default NULL,
  `th_class3_name` char(50) default NULL,
  `td_color1_name` char(50) default NULL,
  `td_color2_name` char(50) default NULL,
  `td_color3_name` char(50) default NULL,
  `td_class1_name` char(50) default NULL,
  `td_class2_name` char(50) default NULL,
  `td_class3_name` char(50) default NULL,
  `fontface1_name` char(50) default NULL,
  `fontface2_name` char(50) default NULL,
  `fontface3_name` char(50) default NULL,
  `fontsize1_name` char(50) default NULL,
  `fontsize2_name` char(50) default NULL,
  `fontsize3_name` char(50) default NULL,
  `fontcolor1_name` char(50) default NULL,
  `fontcolor2_name` char(50) default NULL,
  `fontcolor3_name` char(50) default NULL,
  `span_class1_name` char(50) default NULL,
  `span_class2_name` char(50) default NULL,
  `span_class3_name` char(50) default NULL,
  PRIMARY KEY  (`themes_id`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `forum_themes_name`
-- 

INSERT INTO `forum_themes_name` (`themes_id`, `tr_color1_name`, `tr_color2_name`, `tr_color3_name`, `tr_class1_name`, `tr_class2_name`, `tr_class3_name`, `th_color1_name`, `th_color2_name`, `th_color3_name`, `th_class1_name`, `th_class2_name`, `th_class3_name`, `td_color1_name`, `td_color2_name`, `td_color3_name`, `td_class1_name`, `td_class2_name`, `td_class3_name`, `fontface1_name`, `fontface2_name`, `fontface3_name`, `fontsize1_name`, `fontsize2_name`, `fontsize3_name`, `fontcolor1_name`, `fontcolor2_name`, `fontcolor3_name`, `span_class1_name`, `span_class2_name`, `span_class3_name`) VALUES (1, 'The lightest row colour', 'The medium row color', 'The darkest row colour', '', '', '', 'Border round the whole page', 'Outer table border', 'Inner table border', 'Silver gradient picture', 'Blue gradient picture', 'Fade-out gradient on index', 'Background for quote boxes', 'All white areas', '', 'Background for topic posts', '2nd background for topic posts', '', 'Main fonts', 'Additional topic title font', 'Form fonts', 'Smallest font size', 'Medium font size', 'Normal font size (post body etc)', 'Quote & copyright text', 'Code text colour', 'Main table header text colour', '', '', '');

-- --------------------------------------------------------

-- 
-- Table structure for table `forum_topics`
-- 

CREATE TABLE `forum_topics` (
  `topic_id` mediumint(8) unsigned NOT NULL auto_increment,
  `forum_id` smallint(8) unsigned NOT NULL default '0',
  `topic_title` char(60) NOT NULL default '',
  `topic_poster` mediumint(8) NOT NULL default '0',
  `topic_time` int(11) NOT NULL default '0',
  `topic_views` mediumint(8) unsigned NOT NULL default '0',
  `topic_replies` mediumint(8) unsigned NOT NULL default '0',
  `topic_status` tinyint(3) NOT NULL default '0',
  `topic_vote` tinyint(1) NOT NULL default '0',
  `topic_type` tinyint(3) NOT NULL default '0',
  `topic_first_post_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_last_post_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_moved_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_moved_id` (`topic_moved_id`),
  KEY `topic_status` (`topic_status`),
  KEY `topic_type` (`topic_type`)
) TYPE=MyISAM AUTO_INCREMENT=13 ;

-- 
-- Dumping data for table `forum_topics`
-- 

INSERT INTO `forum_topics` (`topic_id`, `forum_id`, `topic_title`, `topic_poster`, `topic_time`, `topic_views`, `topic_replies`, `topic_status`, `topic_vote`, `topic_type`, `topic_first_post_id`, `topic_last_post_id`, `topic_moved_id`) VALUES (2, 4, 'functional?', -1, 1101976664, 348, 13, 0, 0, 0, 2, 27, 0),
(3, 5, 'scooter club in dasmarinas', -1, 1102324633, 103, 1, 0, 0, 0, 8, 15, 0),
(4, 4, 'Zoom Calendar', 12, 1102420012, 94, 0, 0, 0, 0, 9, 9, 0),
(5, 5, 'taguig riders...', 14, 1102481534, 72, 0, 0, 0, 0, 10, 10, 0),
(6, 5, 'Honda XRM Club Philippines', -1, 1102663146, 79, 0, 0, 0, 0, 12, 12, 0),
(7, 5, 'Moto Dex Riders Club', 17, 1102721032, 73, 0, 0, 0, 0, 13, 13, 0),
(8, 4, 'CASTROL SCOOTERISTA PARTY', 24, 1106612988, 71, 4, 0, 0, 0, 18, 30, 0),
(9, 5, 'you are invited', -1, 1107835780, 38, 0, 0, 0, 0, 21, 21, 0),
(10, 6, 'castrol products', 27, 1108098108, 37, 0, 0, 0, 0, 22, 22, 0),
(11, 5, '2nd Quezon Bike Meet &amp; Mayohan sa Tayabas', -1, 1109851712, 22, 0, 0, 0, 0, 24, 24, 0),
(12, 5, 'PSF - CPD', 45, 1114571768, 4, 0, 0, 0, 0, 28, 28, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `forum_topics_watch`
-- 

CREATE TABLE `forum_topics_watch` (
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) NOT NULL default '0',
  `notify_status` tinyint(1) NOT NULL default '0',
  KEY `topic_id` (`topic_id`),
  KEY `user_id` (`user_id`),
  KEY `notify_status` (`notify_status`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `forum_topics_watch`
-- 

INSERT INTO `forum_topics_watch` (`topic_id`, `user_id`, `notify_status`) VALUES (2, 10, 1),
(3, 18, 0),
(8, 24, 1),
(2, 31, 1),
(8, 45, 0),
(2, 45, 0),
(12, 45, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `forum_user_group`
-- 

CREATE TABLE `forum_user_group` (
  `group_id` mediumint(8) NOT NULL default '0',
  `user_id` mediumint(8) NOT NULL default '0',
  `user_pending` tinyint(1) default NULL,
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `forum_user_group`
-- 

INSERT INTO `forum_user_group` (`group_id`, `user_id`, `user_pending`) VALUES (1, -1, 0),
(2, 2, 0),
(3, 3, 0),
(4, 4, 0),
(5, 5, 0),
(6, 6, 0),
(7, 7, 0),
(8, 8, 0),
(9, 9, 0),
(10, 10, 0),
(11, 11, 0),
(12, 12, 0),
(13, 13, 0),
(14, 14, 0),
(15, 15, 0),
(16, 16, 0),
(17, 17, 0),
(18, 18, 0),
(19, 19, 0),
(20, 20, 0),
(21, 21, 0),
(22, 22, 0),
(23, 23, 0),
(24, 24, 0),
(25, 25, 0),
(26, 26, 0),
(27, 27, 0),
(28, 28, 0),
(29, 29, 0),
(30, 30, 0),
(31, 31, 0),
(32, 32, 0),
(33, 33, 0),
(34, 34, 0),
(35, 35, 0),
(36, 36, 0),
(37, 37, 0),
(38, 38, 0),
(39, 39, 0),
(40, 40, 0),
(41, 41, 0),
(42, 42, 0),
(43, 43, 0),
(44, 44, 0),
(45, 45, 0),
(46, 46, 0),
(47, 47, 0),
(48, 48, 0),
(49, 49, 0),
(50, 50, 0),
(51, 51, 0),
(52, 52, 0),
(53, 53, 0),
(54, 54, 0),
(55, 55, 0),
(56, 56, 0),
(57, 57, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `forum_users`
-- 

CREATE TABLE `forum_users` (
  `user_id` mediumint(8) NOT NULL default '0',
  `user_active` tinyint(1) default '1',
  `username` varchar(25) NOT NULL default '',
  `user_password` varchar(32) NOT NULL default '',
  `user_session_time` int(11) NOT NULL default '0',
  `user_session_page` smallint(5) NOT NULL default '0',
  `user_lastvisit` int(11) NOT NULL default '0',
  `user_regdate` int(11) NOT NULL default '0',
  `user_level` tinyint(4) default '0',
  `user_posts` mediumint(8) unsigned NOT NULL default '0',
  `user_timezone` decimal(5,2) NOT NULL default '0.00',
  `user_style` tinyint(4) default NULL,
  `user_lang` varchar(255) default NULL,
  `user_dateformat` varchar(14) NOT NULL default 'd M Y H:i',
  `user_new_privmsg` smallint(5) unsigned NOT NULL default '0',
  `user_unread_privmsg` smallint(5) unsigned NOT NULL default '0',
  `user_last_privmsg` int(11) NOT NULL default '0',
  `user_emailtime` int(11) default NULL,
  `user_viewemail` tinyint(1) default NULL,
  `user_attachsig` tinyint(1) default NULL,
  `user_allowhtml` tinyint(1) default '1',
  `user_allowbbcode` tinyint(1) default '1',
  `user_allowsmile` tinyint(1) default '1',
  `user_allowavatar` tinyint(1) NOT NULL default '1',
  `user_allow_pm` tinyint(1) NOT NULL default '1',
  `user_allow_viewonline` tinyint(1) NOT NULL default '1',
  `user_notify` tinyint(1) NOT NULL default '1',
  `user_notify_pm` tinyint(1) NOT NULL default '0',
  `user_popup_pm` tinyint(1) NOT NULL default '0',
  `user_rank` int(11) default '0',
  `user_avatar` varchar(100) default NULL,
  `user_avatar_type` tinyint(4) NOT NULL default '0',
  `user_email` varchar(255) default NULL,
  `user_icq` varchar(15) default NULL,
  `user_website` varchar(100) default NULL,
  `user_from` varchar(100) default NULL,
  `user_sig` text,
  `user_sig_bbcode_uid` varchar(10) default NULL,
  `user_aim` varchar(255) default NULL,
  `user_yim` varchar(255) default NULL,
  `user_msnm` varchar(255) default NULL,
  `user_occ` varchar(100) default NULL,
  `user_interests` varchar(255) default NULL,
  `user_actkey` varchar(32) default NULL,
  `user_newpasswd` varchar(32) default NULL,
  PRIMARY KEY  (`user_id`),
  KEY `user_session_time` (`user_session_time`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `forum_users`
-- 

INSERT INTO `forum_users` (`user_id`, `user_active`, `username`, `user_password`, `user_session_time`, `user_session_page`, `user_lastvisit`, `user_regdate`, `user_level`, `user_posts`, `user_timezone`, `user_style`, `user_lang`, `user_dateformat`, `user_new_privmsg`, `user_unread_privmsg`, `user_last_privmsg`, `user_emailtime`, `user_viewemail`, `user_attachsig`, `user_allowhtml`, `user_allowbbcode`, `user_allowsmile`, `user_allowavatar`, `user_allow_pm`, `user_allow_viewonline`, `user_notify`, `user_notify_pm`, `user_popup_pm`, `user_rank`, `user_avatar`, `user_avatar_type`, `user_email`, `user_icq`, `user_website`, `user_from`, `user_sig`, `user_sig_bbcode_uid`, `user_aim`, `user_yim`, `user_msnm`, `user_occ`, `user_interests`, `user_actkey`, `user_newpasswd`) VALUES (-1, 0, 'Anonymous', '', 0, 0, 0, 1101667995, 0, 14, 0.00, NULL, '', '', 0, 0, 0, NULL, 0, 0, 0, 1, 1, 1, 0, 1, 0, 1, 0, NULL, '', 0, '', '', '', '', '', NULL, '', '', '', '', '', '', ''),
(2, 1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1113840138, 0, 1113799880, 1101667995, 1, 2, 0.00, 1, 'english', 'd M Y h:i a', 0, 0, 1104853118, NULL, 1, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, '', 0, 'info@castrolzoomclub.com', '', '', '', '', '', '', '', '', '', '', '', ''),
(3, 1, 'lapu-lapu', '81101af26e4924f457dd99d3d6b77a7f', 1102010608, 0, 1102010538, 1102010424, 0, 0, 0.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, '', 0, 'reyhal@yahoo.com', '', '', 'Cebu City', '', '', '', '', '', 'Production Supervisor', 'Family Affairs, Window Shopping, tv viewing, current events,riding', '', NULL),
(4, 1, 'jongie', '5d9f59d0c45ed1d00c3f2d13712c0c6b', 1102047331, 0, 1102045309, 1102045096, 0, 0, 0.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, '', 0, 'ahadloc@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', NULL),
(5, 1, 'wangu1023', 'af2a819071ff3bb5732a683dfec96666', 1102060959, 0, 1102060892, 1102060875, 0, 0, 0.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, '', 0, 'luen.duco@solar-entertainment.com', '', '', 'cainta', 'drive fast, die fast', 'e67c8a01e4', 'wangu1023', 'wangu1023', '', '', 'motorcycles', '', NULL),
(6, 1, 'luckydragon', '76419c58730d9f35de7ac538c2fd6737', 1102062470, -11, 1102062052, 1102062019, 0, 0, 0.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, '', 0, 'lucky_dragon168@yahoo.com', '', '', 'Caloocan', '', '', '', '', '', '', '', '', NULL),
(7, 1, 'fedaplus', 'c5efe10ef922d575908700ec15d7517f', 0, 0, 0, 1102117614, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, '', 0, 'fedaplus@mailcity.com', '', '', 'Parana-Q', '"BäL" \r\nPiaggio Vespa PX150E\r\nEUROSCOOT Philippines\r\n- - - - - - - - - - - - - - -\r\n"When you''re on the road, there are no boundaries"...', '1bc139f211', '', '', '', '', '', '', NULL),
(8, 1, 'M@verick', '2d2b1a9d82c93f760ed5a889769f6341', 1102185404, -1, 1102184845, 1102184745, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, '', 0, 'lij_06@hotmail.com', '', '', '', '[b:b40c893677][size = 5][color = blue]M@VERICK®[/size][/color][/b:b40c893677]\r\n[b:b40c893677]LF100-5[/b:b40c893677]\r\n________________________________________\r\n"JEHOVAH SHAMAH"', 'b40c893677', '', '', '', '', '', '', NULL),
(9, 1, 'boylit', '67cc86339b2654a35fcc57da8fc9d33d', 1102299655, 0, 1102299655, 1102299615, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, '', 0, 'jaimecardinalsin@yahoo.com', '', '', '', '', '', '', 'jaimecardinalsin', '', '', '', '', NULL),
(10, 1, 'Tammahommie', '47c888561498742948f0e940e265907b', 1102388619, 5, 1102318906, 1102318672, 0, 1, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, '', 0, 'chrispedrena@yahoo.com', '', 'http://www.chrispedrena.tk', 'manila', '"DO WHAT YOU CAN WITH WHAT YOU HAVE"', '29ca3f1bbb', '', 'chrispedrena', '', 'Mis Programmer', '', '', NULL),
(11, 1, 'froilanr', '7c49d0e5f68b8f6569e260f3ce1d7031', 1102320287, 0, 1102320287, 1102320271, 0, 0, 4.50, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, '', 0, 'froilanr@mozcom.com', '', '', '', 'Modified Pavement!!!:)', '600c6dcf13', '', '', '', '', '', '', NULL),
(12, 1, 'reekee98', '8e73b27568cb3be29e2da74d42eab6dd', 1104474767, 0, 1102559385, 1102419835, 0, 1, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, '', 0, 'reekee98@yahoo.com', '', '', 'Manila / Navotas', '', '', 'bassrooten', 'reekee98', '', 'Call Center Supervisor', 'Scooters!', '', NULL),
(13, 1, 'lito_bee', 'daea57feee83caea3f9da1efcc5cf4b2', 1102478749, 0, 1102478749, 1102478689, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, '', 0, 'lito_bee@yahoo.com', '', 'http://www.litobee.blogspot.com', 'Mangatarem, Pangasinan', '', '', '', '', '', '', '', '', NULL),
(14, 1, 'k3', 'cbf6b12dd3853ba286f880c142e01d02', 1102481794, 0, 1102481322, 1102481266, 0, 1, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, '', 0, 'k3ken@yahoo.com', '', 'http://cubclub.gnuthings.com', 'taguig', '', '', '', 'k3ken', '', 'govt. employee', 'dogs, motorcycles', '', NULL),
(15, 1, 'j_mark_20', 'df3e3e11e803e5213b22915fda9e0027', 1102557292, -1, 1102557207, 1102557048, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, '', 0, 'j_mark_20@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', NULL),
(16, 1, 'funty', 'f25a2fc72690b780b2a14e140ef6a9e0', 0, 0, 0, 1102582757, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, '', 0, 'myfunty@hotmail.com', '', 'http://www.reality77.com', '', '', '', '', 'funty69', 'negui15', 'webdesigner', '', '', NULL),
(17, 1, 'MHAR8', 'cf79ae6addba60ad018347359bd144d2', 1110950910, 5, 1103120438, 1102720606, 0, 2, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, '', 0, 'edmhar8@yahoo.com', '160701654', 'http://mdrc.epinoy.com', 'Antipolo City', '', '', '', 'edmhar8', '', '', '', '', NULL),
(18, 1, 'sealander', 'ba1f262f09fcb3450e8c6fa62172d1c8', 1103117607, 6, 1103117030, 1103117009, 0, 1, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, '', 0, 'dvdtnsy@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', NULL),
(19, 1, 'robert', '70791dbd7c5e6a1a3c3615f17fa8f929', 1103767573, 0, 1103767573, 1103767508, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, '', 0, 'robert@globenet.com.ph', '', '', '', '', '', '', '', '', '', '', '', NULL),
(20, 1, 'antet', '1a18ce1c4d479319634bebfbddcafbec', 1106910469, 0, 1106544614, 1104201544, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, '', 0, 'francism@mydestiny.net', '', '', 'proj6, qc', '', '', '', 'fmangahas@yahoo.com', '', '', 'bikes, audio/video, pc''s', '', NULL),
(21, 1, 'bft50cc', '24220dd74d88a94e7cc2eca7bca6c2be', 1104213075, 0, 1104213075, 1104213050, 0, 0, 0.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, '', 0, 'backflipthe50cc@yahoo.com', '', '', 'muntinlupa', 'trytobackflipthe50cc', '', '', '', '', '', 'racing', '', NULL),
(22, 1, 'pro2wister', '62bf43e2db266caa78d4f0bd18fb5f7e', 1104305164, -7, 1104305082, 1104304369, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, '', 0, 'dan.arevalo@excelpoint.com', '', '', 'Makati City', '', '', '', '', '', '', 'Sportbikes', '', NULL),
(23, 1, 'dug711', '7daacea5f373b4c1c054158b126d317f', 1109831220, 6, 1104844195, 1104843821, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, '', 0, 'dug71168@yahoo.com', '', '', '', '', '', '', '', '', 'businessman', 'motorcycling', '', NULL),
(24, 1, 'jojo', '98c24482eabe3c29f3fa970b4874d4f5', 1109895899, 0, 1106613402, 1106612707, 0, 2, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, '', 0, 'jojomedina88@yahoo.com', '', 'http://motorcyclephilippines.com', 'alabang, muntinlupa', 'PHILIPPINES SCOOTER FEDERATION\r\nSYM Motorcycle Clubs', '1fac22b2ad', '', 'jojomedina', '', 'real estate devoloper', '', '', NULL),
(28, 1, 'leo', '0f759dd1ea6c4c76cedc299039ca4f23', 1113356809, -7, 1113356668, 1113356640, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, '', 0, 'liping1708@yahoo.com.sg', '', '', '', '', '', '', '', '', '', '', '', NULL),
(25, 0, 'erikikay', '8d23e5e6e872ab31cd8f44acb200fd9d', 0, 0, 0, 1106895321, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, '', 0, 'erikikay@yahoo.com', '', '', '', '', '', '', 'erikikay', 'erica.esguerra@se1.bp.com', 'angel in disguise...', '', '428d68', NULL),
(26, 1, 'erikitch', '8d23e5e6e872ab31cd8f44acb200fd9d', 1107845801, 0, 1107845726, 1106895571, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, '', 0, 'erikitch@lycos.com', '', '', '', '', '', '', 'erikikay@yahoo.com', 'erica.esguerra@se1.bp.com', 'angel in disguise...', '', '', NULL),
(27, 1, 'genesis', 'd16244f3c65053413ccc6272a9119967', 1108098108, -9, 1108097929, 1108097848, 0, 1, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, '', 0, 'johnson_qualityparts@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', NULL),
(29, 1, 'mickfoley', 'a31f0c3a65215d35311149682de17717', 1113836807, 4, 1113829594, 1113828219, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, '', 0, 'info@zeconmedia.com', '', '', '', '', '', '', '', '', '', '', '', NULL),
(30, 1, 'ka2ga', 'b1292c564fe4b78f7eb90491fae50fdd', 0, 0, 0, 1114036410, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, '', 0, 'contrapello_43@lycos.com', '', '', 'Pasig City, Philippines', '', '', '', '', '', '', 'motorcycle, scooter', '', NULL),
(31, 1, 'harv3y', '6d722ce68578d44330ede373855f1ee3', 1114047130, -9, 1114047005, 1114046955, 0, 1, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, '', 0, 'mark_ocoma@yahoo.com', '', 'http://harv3y.blogs.friendster.com/bipblog/', 'Makati City / San Pedro Laguna', '', '', '', 'jewelz_cru3', '', 'Technician', 'Basketball, Billiards, Byks', '', NULL),
(32, 1, 'wilbert jose', 'e331ce047a76696871d95b63a5d27fb7', 0, 0, 0, 1114067200, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, '', 0, 'wilbert_jose0201@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', NULL),
(33, 1, 'M2rvin', '416cc041babb74d461e4c2690e1e536b', 0, 0, 0, 1114081909, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, '', 0, 'cocoystd@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', NULL),
(34, 1, 'gembherds', 'd2670d25508e6e49903b4fd554743c9c', 1114145876, 0, 1114145876, 1114145738, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, '', 0, 'peappoint@pldtsl.net', '', '', '', '', '', '', '', '', '', '', '', NULL),
(35, 1, 'JUG_NOYPI', 'a8f29fb91760fb27c251ea8b7c7ac8c9', 1114149700, 0, 1114149700, 1114149614, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, '', 0, 'biatch_1979@yahoo.com', '', '', 'quezon city', '', '', '', '', '', 'businessman', '', '', NULL),
(36, 1, 'kinan_2t', 'c1293893c9eba14fdc14f298dd7c1a6f', 0, 0, 0, 1114170308, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, '', 0, 'kinan_2t@yahoo.com', '', '', '', '', '', '', '', '', 'network maintenance', 'scooters', '', NULL),
(37, 1, 'bakser', '123de2f6d6fd726bdfd56d23e725ab8a', 1114315265, -4, 1114315060, 1114315016, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, '', 0, 'bakser3@hotmail.com', '', '', '', '', '', '', '', '', '', '', '', NULL),
(38, 1, 'czar', 'd1ce405294f071507a9c1ffcd1105dee', 0, 0, 0, 1114331771, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, '', 0, 'menchu27@yahoo.co.uk', '', '', '', '', '', '', '', '', '', '', '', NULL),
(39, 1, 'joelrl05', 'af9b5fba0ed882326c0601cd5c36ec4a', 1114341373, -4, 1114341113, 1114341055, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, '', 0, 'joelrl05@yahoo.com', '', '', 'Cagayan de oro City', '', '', '', 'joelrl05', '', 'self-employed', 'Dirt bike, off-road..', '', NULL),
(40, 1, 'ariel cuevas', '5d2b8beb3ca65c91ec0426efa92da6d4', 0, 0, 0, 1114349498, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, '', 0, 'ariel_bhaybie@yahoo.com', '', '', 'alabang', '', '', '', 'ariel_bhaybie@yahoo.com', '', 'students', 'racing bikes, billiards, pc games, watching movies', '', NULL),
(41, 1, 'Erwin', 'b04ee5ed088e4c8f16d452db2386fa8c', 0, 0, 0, 1114402838, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, '', 0, 'reckon657@yahoo.com', '', '', '', '', '', '', 'reckon657@yahoo.com', '', 'Security Officer-III', '', '', NULL),
(42, 1, 'ulysses', '459b436771f318a67212bf45cf416631', 0, 0, 0, 1114414161, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, '', 0, 'i_am2gr8_4u@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', NULL),
(43, 0, 'rscmtc', '8a65294220bfdfe913bd813878d670b7', 0, 0, 0, 1114426775, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, '', 0, 'robie@cii.com.ph', '', '', 'alabang', '', '', '', '', '', 'accountant', 'motorcycle', '4fae3c', NULL),
(44, 1, 'swinger1979ph', '2454936891bf9b0e0eb1d6523de3e204', 0, 0, 0, 1114491187, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, '', 0, 'swinger1979ph@yahoo.com', '', '', 'Ortigas Center, Pasig City', '', '', '', 'swinger1979ph', '', 'Marketing Manager', '', '', NULL),
(45, 1, 'jepok22', '75b6e86d67622c95d1cebc75119df1c2', 1114650807, -9, 1114580845, 1114569894, 0, 4, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 0, 1, 0, 0, 0, '', 0, 'jepok22@yahoo.com', '', 'http://cubclub.gnuthings.com', 'nova q.c.', '[b:0cd7a1a901][size=16:0cd7a1a901][color=red:0cd7a1a901]SATURN 107cc[/color:0cd7a1a901]\r\nlife is short so live it as you want it to be\r\n[color=blue:0cd7a1a901]Motorcycle Philippines Federation[/size:0cd7a1a901][/color:0cd7a1a901]\r\n[size=17:0cd7a1a901][color=magenta:0cd7a1a901]P.S.F. - C.P.D.[/color:0cd7a1a901]\r\n[/size:0cd7a1a901][size=14:0cd7a1a901]www.cubclub.gnuthings.com[/size:0cd7a1a901][/b:0cd7a1a901]', '0cd7a1a901', '', 'jepok22', '', 'net-sys admin', 'bikes and computers', '', NULL),
(46, 1, 'diazthor', 'b048814970919abb1fd3a2d882fb8c51', 0, 0, 0, 1114571935, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, '', 0, 'diazthor@yahoo.com', '', '', 'quezon city', '', '', '', 'diazthor@yahoo.com', '', 'graphic artist', 'motor bikes, sex....', '', NULL),
(47, 1, 'stucker67', 'a0f15d09df04d9ad657ce26e371ddf9a', 1114666562, 0, 1114666249, 1114666182, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, '', 0, 'ronfactor2002@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', NULL),
(48, 1, 'jeff3677', 'e36a1dd98dac0133e97ab843ec40a002', 0, 0, 0, 1114740979, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, '', 0, 'jeff_de_vera@yahoo.com', '', '', 'roxville, q.c.', '', '', '', 'jeff030677', '', '', 'SCOOTER', '42830d', '61af8a97aecc4b71b8cf32f551dbb186'),
(49, 1, 'drsabas', 'e10adc3949ba59abbe56e057f20f883e', 0, 0, 0, 1114748346, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, '', 0, 'drsabas@yahoo.com', '', '', 'Bulacan', 'Raider 150', 'e7032538ac', '', '', '', 'Accountant', 'Motorcycling, books, basketball', '', NULL),
(50, 1, 'forge47', '6a571fe98a2ba453e84923b447d79cff', 1114781910, 0, 1114781910, 1114781797, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, '', 0, 'forge47@yahoo.com', '', '', 'Parañaque City', '', '', '', '', '', 'Gov''t Employee', '', '', NULL),
(51, 1, 'rainmaker777', 'f158fb71b3e2273d6a253ff601d717d0', 1114789047, 6, 1114788981, 1114788940, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, '', 0, 'rb_areta@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', NULL),
(52, 1, 'dashiell_agf@yahoo.com', 'db5b3ee016977736bc540a0a8d13b011', 0, 0, 0, 1114881722, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, '', 0, 'dashiell_agf@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', NULL),
(53, 1, 'chiela2000', '2760c7b84d4bad6b0b12d7c1a6c5e1a4', 0, 0, 0, 1114914913, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, '', 0, 'chiela2000@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', NULL),
(54, 1, 'arvine', 'e9a72084d0d8682ac8ea26cb15aa2328', 0, 0, 0, 1114939936, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, '', 0, 'arvine_nuqui@yahoo.com', '', '', '', '', '', '', 'arvine_nuqui', '', '', '', '', NULL),
(55, 1, 'vin', '01cfcd4f6b8770febfb40cb906715822', 0, 0, 0, 1114940657, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, '', 0, 'arvine@f1racer.com', '', '', 'laguna', '', '', '', '', '', 'student', 'bikes and cars', '', NULL),
(56, 1, 'mohamed', 'ecba395727f462d8863ba6fab50b193b', 0, 0, 0, 1115027310, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, '', 0, 'pagong_cya@yahoo.com', '', '', '', '“I don’t always want sex.” “But because I’m a guy with a penis that often stiffens up, my girlfriend thinks that I want sex all the time. I just like to be close to her sometimes — that’s all.”', '5dc23a5505', '', 'vonianelle', '', 'art director', 'motoracing', '', NULL),
(57, 1, 'glennferrer', '65ea83c47badbb894c76b1d58ca136b2', 1115092731, 4, 1115092661, 1115092604, 0, 0, 8.00, 1, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, '', 0, 'glf787431@yahoo.com', '', '', 'pasig', '', '', '', '', '', 'sales&amp;marketing', 'varied', '', NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `forum_vote_desc`
-- 

CREATE TABLE `forum_vote_desc` (
  `vote_id` mediumint(8) unsigned NOT NULL auto_increment,
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `vote_text` text NOT NULL,
  `vote_start` int(11) NOT NULL default '0',
  `vote_length` int(11) NOT NULL default '0',
  PRIMARY KEY  (`vote_id`),
  KEY `topic_id` (`topic_id`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `forum_vote_desc`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `forum_vote_results`
-- 

CREATE TABLE `forum_vote_results` (
  `vote_id` mediumint(8) unsigned NOT NULL default '0',
  `vote_option_id` tinyint(4) unsigned NOT NULL default '0',
  `vote_option_text` varchar(255) NOT NULL default '',
  `vote_result` int(11) NOT NULL default '0',
  KEY `vote_option_id` (`vote_option_id`),
  KEY `vote_id` (`vote_id`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `forum_vote_results`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `forum_vote_voters`
-- 

CREATE TABLE `forum_vote_voters` (
  `vote_id` mediumint(8) unsigned NOT NULL default '0',
  `vote_user_id` mediumint(8) NOT NULL default '0',
  `vote_user_ip` char(8) NOT NULL default '',
  KEY `vote_id` (`vote_id`),
  KEY `vote_user_id` (`vote_user_id`),
  KEY `vote_user_ip` (`vote_user_ip`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `forum_vote_voters`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `forum_words`
-- 

CREATE TABLE `forum_words` (
  `word_id` mediumint(8) unsigned NOT NULL auto_increment,
  `word` char(100) NOT NULL default '',
  `replacement` char(100) NOT NULL default '',
  PRIMARY KEY  (`word_id`)
) TYPE=MyISAM AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `forum_words`
-- 

INSERT INTO `forum_words` (`word_id`, `word`, `replacement`) VALUES (1, 'fuck', 'f@&$');

-- --------------------------------------------------------

-- 
-- Table structure for table `users`
-- 

CREATE TABLE `users` (
  `userid` int(25) NOT NULL auto_increment,
  `first_name` varchar(25) NOT NULL default '',
  `last_name` varchar(25) NOT NULL default '',
  `email_address` varchar(25) NOT NULL default '',
  `username` varchar(25) NOT NULL default '',
  `password` varchar(255) NOT NULL default '',
  `decrypted_password` varchar(255) NOT NULL default '',
  `info` text NOT NULL,
  `user_level` enum('0','1','2','3') NOT NULL default '0',
  `signup_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_login` datetime NOT NULL default '0000-00-00 00:00:00',
  `activated` enum('0','1') NOT NULL default '0',
  PRIMARY KEY  (`userid`),
  KEY `email_address_2` (`email_address`),
  KEY `email_address_3` (`email_address`),
  KEY `email_address_4` (`email_address`),
  FULLTEXT KEY `email_address` (`email_address`),
  FULLTEXT KEY `last_name` (`last_name`)
) TYPE=MyISAM COMMENT='Membership Information' AUTO_INCREMENT=500 ;

-- 
-- Dumping data for table `users`
-- 

INSERT INTO `users` (`userid`, `first_name`, `last_name`, `email_address`, `username`, `password`, `decrypted_password`, `info`, `user_level`, `signup_date`, `last_login`, `activated`) VALUES (16, 'erica', 'esguerra', 'erikikay@yahoo.com', 'erikikay', '8d23e5e6e872ab31cd8f44acb200fd9d', 'gibernau', 'test', '0', '2004-12-01 10:55:49', '0000-00-00 00:00:00', '1'),
(2, 'Manuel  Romualdo', 'Ortiz', 'mr_ortiz_aim@yahoo.com', 'mr_ortiz_aim@yahoo.com', '3bcf8d43c0202cb7156181b29f79c528', 'mrsuave', 'test', '0', '2004-11-29 15:30:19', '0000-00-00 00:00:00', '0'),
(3, 'Azahyelle', 'Yabut', 'azahyelle_cdcy@yahoo.com', 'azahyelle', '0f293a2229a661f69d1ccfde67fbb48b', '691882', 'test', '0', '2004-11-29 21:01:15', '0000-00-00 00:00:00', '0'),
(4, 'Mario', 'Palado', 'marrups@hotmail.com', 'maru', '3c981fc6a6d8e3d89b4afa6215d30aa7', 'rav4', 'test', '0', '2004-11-29 22:11:30', '0000-00-00 00:00:00', '0'),
(5, 'Paulo Angelo', 'Manuel', 'pmanuel125@yahoo.com', 'pmanuel125', '7e87ecf46cfa23241ec48ec40a610403', 'best125r', 'test', '0', '2004-11-29 23:05:29', '0000-00-00 00:00:00', '0'),
(6, 'Robert', 'Martinez', 'robert@globenet.com.ph', 'robert', '70791dbd7c5e6a1a3c3615f17fa8f929', 'rlm5633', 'test', '0', '2004-11-29 23:35:19', '0000-00-00 00:00:00', '0'),
(15, 'geri', 'barcelona', 'gerardo@barcelona.com', 'raredog', '510d6792d9fc6c44dce7b549d3ca5d8e', 'dograre', 'test', '0', '2004-12-01 08:17:07', '0000-00-00 00:00:00', '1'),
(8, 'Edward', 'Borja', 'eaborja@ezrs.com', 'wallyski', '78fb5c8f9f94ea66dce65629566f4170', 'edwillard', 'test', '0', '2004-11-30 08:34:45', '0000-00-00 00:00:00', '0'),
(9, 'Raul', 'Gallego', 'rglhyn@abenson.com', 'rglhyn', 'dc355db69268e55b07e6cc192795a437', '060197', 'test', '0', '2004-11-30 15:37:00', '0000-00-00 00:00:00', '0'),
(10, 'edwin', 'Bayona', 'edwinsb@yahoo.com', 'edwinsb', '8e6e509fba12de7be9ff1cb5333a69d2', 'edwin', 'test', '0', '2004-11-30 15:47:51', '0000-00-00 00:00:00', '0'),
(11, 'ARNOLD', 'NATIVIDAD', 'desaconsult@pacific.net.p', 'TAKAKU', '4cb00002e87933c1073b17c9197e0836', 'YOS', 'test', '0', '2004-11-30 17:17:04', '0000-00-00 00:00:00', '0'),
(12, 'samuel', 'fajardo', 'samuelfajardo@yahoo.com', 'samuelfajardo', '6503610376710c33f3cde4c2b5488570', 'bigmofo', 'test', '0', '2004-11-30 18:47:39', '0000-00-00 00:00:00', '0'),
(13, 'arnel', 'estanislao', 'arnel@infiniteinfo.com', 'arnel', '3f5085d0868150815d939e46ae41d2d5', 'arnel', 'test', '0', '2004-11-30 19:53:24', '0000-00-00 00:00:00', '0'),
(14, 'arnel', 'estanislao', 'arnel@zeconmedia.com', 'bobet', '7c672f8a4ce122df11311170a8ad8a68', 'bobet', 'test', '0', '2004-11-30 20:10:09', '0000-00-00 00:00:00', '1'),
(17, 'rene', 'guillen', 'myfunty@hotmail.com', 'rene', 'f25a2fc72690b780b2a14e140ef6a9e0', 'iloveyou', 'test', '0', '2004-12-01 13:08:48', '0000-00-00 00:00:00', '1'),
(18, 'roberto jr', 'bule', 'odoniz_what@yahoo.com', 'odoniz', '7b0f8cbd74f9e593b35209adec17721a', 'recklezz', 'test', '0', '2004-12-01 14:11:26', '0000-00-00 00:00:00', '1'),
(19, 'Arnel', 'Dador', 'arneldador@yahoo.com', 'arneldador', '442ced26864ef6ca9f5a9421502a4318', '818820', 'test', '0', '2004-12-01 21:22:17', '0000-00-00 00:00:00', '1'),
(20, 'butch', 'alegre', 'chokz29@yahoo.com', 'chokz29', 'a9c1e1ad32df07cd43d9106eb955b9b7', '021379', 'test', '0', '2004-12-02 01:10:27', '0000-00-00 00:00:00', '1'),
(21, 'Lorenzo', 'Pullido', 'lorz78@yahoo.com', 'ping', 'db45ebc44c92264b33ab1cd40732f740', 'kupalka', 'test', '0', '2004-12-02 09:50:56', '0000-00-00 00:00:00', '1'),
(22, 'Jofred', 'Tumale', 'jofred_tumale@yahoo.com', 'derfoj', '0025b3e9722a6648c86bb56a0f3882f5', 'schindler', 'test', '0', '2004-12-02 12:12:43', '0000-00-00 00:00:00', '1'),
(23, 'Ferdinand', 'Catacutan', 'ferdinand_cms@yahoo.com', 'Ferdz', 'a99d5fd32cc1dd114f284c27787a2688', 'FRCCMS', 'test', '0', '2004-12-02 12:26:11', '0000-00-00 00:00:00', '1'),
(24, 'Robert', 'Dizon', 'robert.dizon@ingasco.com', 'Robert M. Dizon', 'd41d8cd98f00b204e9800998ecf8427e', '', 'test', '0', '2004-12-02 12:43:36', '0000-00-00 00:00:00', '0'),
(25, 'junjoy', 'gavero', 'J_gavero@Yahoo.com', 'jbgavero', '72407173e6260739973ac814ce1ec0ff', 'humvee', 'test', '0', '2004-12-02 12:44:55', '0000-00-00 00:00:00', '0'),
(26, 'King', 'Francisco', 'kingjohn.francisco@ph.nes', 'king', '58c4bd598ce13caac5f5cbb4cdca689b', 'poledit', 'test', '0', '2004-12-02 12:47:04', '0000-00-00 00:00:00', '1'),
(27, 'Ken', 'Fortun', 'kfortun@viva.com.ph', 'SLEX Runner', 'aa72828bb64a8ea3536403435bae5772', 'euro88', 'test', '0', '2004-12-02 12:57:35', '0000-00-00 00:00:00', '1'),
(28, 'dexyl', 'camba', 'dex_d1@yahoo.com', 'graver_d1', 'b30967940c5b3927cc315df8cc5ab21b', 'ddexyl', 'test', '0', '2004-12-02 13:35:45', '0000-00-00 00:00:00', '1'),
(29, 'RHONNEIL', 'ESTACIO', 'dHum4n@gmail.com', 'Hum4n', '65c905e57a7c43d614056a7833cf2d22', 'radikal', 'test', '0', '2004-12-02 13:39:24', '0000-00-00 00:00:00', '1'),
(30, 'Gerardo', 'Cornejo', 'jetc_ph@yahoo.com', 'jetc', 'e4990f5e5d23a6110dc162efe49b9f06', 'jetcorn', 'test', '0', '2004-12-02 15:06:02', '0000-00-00 00:00:00', '1'),
(31, 'Angelito', 'Budomo', 'lito_bee2004@yahoo.com', 'lito_bee', 'daea57feee83caea3f9da1efcc5cf4b2', 'ajmahal', 'test', '0', '2004-12-02 15:11:09', '0000-00-00 00:00:00', '1'),
(32, 'noel', 'ponce', 'leohn15@yahoo.com', 'leohn15', 'a5c329df38f4ddada2b8133d306aca2d', 'nap1066', 'test', '0', '2004-12-02 15:40:56', '0000-00-00 00:00:00', '1'),
(33, 'andres', 'hadloc', 'ahadloc@yahoo.com', 'jongie', '5d9f59d0c45ed1d00c3f2d13712c0c6b', 'hadloc', 'test', '0', '2004-12-02 15:57:10', '0000-00-00 00:00:00', '1'),
(34, 'J', 'G', 'cz_rocker1@yahoo.com', 'czrocker', 'b75605d6b197516de3b18ccc764b6378', 'luvchyna', 'test', '0', '2004-12-02 18:15:46', '0000-00-00 00:00:00', '1'),
(35, 'Nathaniel', 'Ginson', 'nginson@hotmail.com', 'ginson', '992f71412b41f71623ab6e083dec29a9', 'nautilus', 'test', '0', '2004-12-02 18:21:30', '0000-00-00 00:00:00', '1'),
(36, 'Henry', 'Abesamis', 'henry@gmanmi.tv', 'skin', '713e1f77683ddf9d04f50296a09754cc', 'matrix69', 'test', '0', '2004-12-02 19:26:17', '0000-00-00 00:00:00', '1'),
(37, 'enan', 'francisco', 'enanfrancisco@yahoo.com', 'enanfrancisco', 'cdf1ba2103e8924836b23eba41b7555a', 'deebebs', 'test', '0', '2004-12-02 21:57:52', '0000-00-00 00:00:00', '1'),
(38, 'Rommel', 'Frias', 'rrfrias@gmail.com', 'rommel', 'bffb980fed02471d26993bad4cd77c34', 'rommel99', 'test', '0', '2004-12-02 23:43:01', '0000-00-00 00:00:00', '1'),
(39, 'Rey Halcyon', 'Reynes', 'reyhal@yahoo.com', 'lapu-lapu', '81101af26e4924f457dd99d3d6b77a7f', 'ISHIDA', 'test', '0', '2004-12-03 01:36:27', '0000-00-00 00:00:00', '1'),
(40, 'Ramon Petros', 'Patalinghug', 'ramonpetros@yahoo.com', 'ramonpetros', 'fd9b8d4e9a40c99fb7dde6494a41b53e', 'loveski', 'test', '0', '2004-12-03 01:54:36', '0000-00-00 00:00:00', '1'),
(41, 'Joel', 'Sombrito', 'joelmel82@yahoo.com', 'joelmel82', '2979327e42694763da4e93117fd8822b', '070399', 'test', '0', '2004-12-03 07:43:42', '0000-00-00 00:00:00', '1'),
(42, 'Reggie', 'de Leon', 'piston_blade@yahoo.com', 'DarkLord_AnubiS', 'c0284f0a96151748345c6fbacf1db839', 'diablo9902368', 'test', '0', '2004-12-03 08:12:06', '0000-00-00 00:00:00', '1'),
(43, 'donnie', 'cave', 'lyndon.cave@digitelone.co', 'garfield 8', 'f7feca2ee744bad5af96b9dac78bef22', 'mr.g', 'test', '0', '2004-12-03 09:27:28', '0000-00-00 00:00:00', '1'),
(44, 'bernard james', 'beltran', 'engrbjrb@gmail.com', 'bulito', '2bcfeac4f452c605b79713bb826054aa', '1980766', 'test', '0', '2004-12-03 09:29:10', '0000-00-00 00:00:00', '1'),
(45, 'Robinson', 'Cuison', 'robinson_cuison@yahoo.com', 'cool shot', '7e304a57fc186698435d335ee59e6db9', 'robynrae', 'test', '0', '2004-12-03 09:40:53', '0000-00-00 00:00:00', '1'),
(46, 'Ruel', 'Apostol', 'little_bad_boy@yahoo.com', 'littlebadboy', '7d93b505bccb9de90383f1f1e5144d73', '12021970', 'test', '0', '2004-12-03 10:08:34', '0000-00-00 00:00:00', '1'),
(47, 'Dante', 'Sabas', 'drsabas@yahoo.com', 'drsabas', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'test', '0', '2004-12-03 10:30:31', '0000-00-00 00:00:00', '1'),
(48, 'Frank', 'Woolf', 'frank@motorcyclephilippin', 'Skywoolf', 'a4dc3dd12aeb238c5fd8d5e28472bd39', 'bluewing', 'test', '0', '2004-12-03 10:33:15', '0000-00-00 00:00:00', '1'),
(49, 'tereso', 'asido', 'a4tech@digitelone.com', 'a4tech', '012f86a533b7ce6f569c30ec1d09bf76', 'castrolteam', 'test', '0', '2004-12-03 11:00:51', '0000-00-00 00:00:00', '1'),
(50, 'Jonathan', 'Villao', 'jsvillao@fcpp.fujitsu.com', 'jsvillao', 'dd247570ce4bea131231d83201ad5f55', 'j991484', 'test', '0', '2004-12-03 11:08:43', '0000-00-00 00:00:00', '1'),
(51, 'Dennis Lorenzo', 'Barrios', 'dennis_lorenzo@yahoo.com', 'bikerider', '7daacea5f373b4c1c054158b126d317f', 'dennis', 'test', '0', '2004-12-03 11:14:34', '0000-00-00 00:00:00', '1'),
(52, 'dong', 'loresca jr', 'dongunc669@yahoo.com', 'dongunc669', '0574517a60180ba2d4b51d1cb5c055f6', 'eana', 'test', '0', '2004-12-03 11:27:42', '0000-00-00 00:00:00', '1'),
(53, 'Jhun', 'De Guzman', 'jhundeg@info.com.ph', 'jhundeg', '750e5e8485403e99c9b0e484702fe59b', '127517', 'test', '0', '2004-12-03 11:37:03', '0000-00-00 00:00:00', '1'),
(54, 'Mar', 'Luciano', 'mar.luciano@gmail.com', 'mar38', '726ef24ca1ccdeda20b6181221e5e1e3', 'lynne', 'test', '0', '2004-12-03 11:47:16', '0000-00-00 00:00:00', '1'),
(55, 'oliver', 'ambrosio', 'ohlybear@yahoo.com', 'ohlybear', 'abab6b115f383ae769b55f3bc2803cec', 'revilo', 'test', '0', '2004-12-03 11:51:18', '0000-00-00 00:00:00', '1'),
(56, 'jun', 'bautista', 'bautista_jun@hotmail.com', 'ninjajunb', '146407f524f4276b3077f85b11958216', 'mydze777', 'test', '0', '2004-12-03 11:58:53', '0000-00-00 00:00:00', '1'),
(57, 'rommel', 'bulan', 'rommel.bulan@link2support', 'mengski', '4337fb150cbc24bd1842fb3b8f828a6c', 'jess', 'test', '0', '2004-12-03 12:14:27', '0000-00-00 00:00:00', '1'),
(58, 'Expedito', 'Garcia', 'xpgarcia@yahoo.com', 'xpgarcia', 'bcdc57ac1d3b2bbf2b5911736eca7e86', '885168', 'test', '0', '2004-12-03 12:21:30', '0000-00-00 00:00:00', '1'),
(59, 'Michael', 'Sales', 'watercooledmfs@yahoo.com', 'Miko_Sales', 'f183928c0b6e864f221d970b6fbc8a00', 'taugamma', 'test', '0', '2004-12-03 12:28:48', '0000-00-00 00:00:00', '1'),
(60, 'Michael', 'Oralde', 'nyterider27@yahoo.com', 'Michael Nyte', '525c2ae1b837fed8426ecbd20cfeed29', 'xrm110', 'test', '0', '2004-12-03 12:37:37', '0000-00-00 00:00:00', '0'),
(61, 'joseph', 'flores', 'josephflores@astec-power.', 'josephf', '013f9627f29838c7be865f3465c6740a', 'logon', 'test', '0', '2004-12-03 13:11:04', '0000-00-00 00:00:00', '1'),
(62, 'Trendy', 'Honda', 'ledz08@gmail.com', 'trendy08', 'fb96ccd0dcdaf18abfe3603ce2819740', 'System08', 'test', '0', '2004-12-03 13:46:05', '0000-00-00 00:00:00', '1'),
(63, 'benjamin', 'almeda', 'jonskie@pldtdsl.net', 'jonskie', '5f21ae70692894433ac637d6879d2cde', 'balbon', 'test', '0', '2004-12-03 13:46:23', '0000-00-00 00:00:00', '1'),
(64, 'Eddi', 'Permalino', 'april943@yahoo.com', 'bumbatse', 'b26f6a21cb3ecec4e72446260966ac0a', '4857why', 'test', '0', '2004-12-03 14:16:21', '0000-00-00 00:00:00', '1'),
(65, 'Archie', 'Dolliente', 'artze_tech@yahoo.com', 'artze_tech', 'fc63f87c08d505264caba37514cd0cfd', 'nicole', 'test', '0', '2004-12-03 14:23:28', '0000-00-00 00:00:00', '1'),
(66, 'Luis', 'Sundiang', 'litsskywalker@yahoo.com', 'Slow Rider', '0fda6a9fa8ca42d553a4eef6e706f8a0', 'Roadster', 'test', '0', '2004-12-03 14:33:29', '0000-00-00 00:00:00', '1'),
(67, 'Sahid', 'Kamid', 'firegrab@yahoo.com', 'smashgear', 'dc349ecccdf771ab1433a973c74b2da3', 'twelvers', 'test', '0', '2004-12-03 14:43:15', '0000-00-00 00:00:00', '1'),
(68, 'iluminado III', 'garcia', 'aloy_g@yahoo.com', 'aloy_g', '9405f8052c11925c44d3321cc8754398', 'disintegrate', 'test', '0', '2004-12-03 15:07:23', '0000-00-00 00:00:00', '1'),
(69, 'Roland', 'Pascual', 'rdpascual16@yahoo.com', 'Ratbugasmati', '5f4dcc3b5aa765d61d8327deb882cf99', 'password', 'test', '0', '2004-12-03 15:23:38', '0000-00-00 00:00:00', '1'),
(70, 'vens', 'estrella', 'vens_e@email.com', 'brogger', 'a31424b8d1843fb4dcfacbc277053273', 'brogger', 'test', '0', '2004-12-03 15:41:55', '0000-00-00 00:00:00', '1'),
(71, 'Luen', 'Duco', 'luen.duco@solar-entertain', 'wangu1023', 'af2a819071ff3bb5732a683dfec96666', 'nairobi', 'test', '0', '2004-12-03 15:42:31', '0000-00-00 00:00:00', '1'),
(72, 'Angel', 'Bernal', 'du1uuu@yahoo.com', 'du1uuu', '41ee4861eb5876ef36e97aa256886409', 'bigbird', 'test', '0', '2004-12-03 16:08:58', '0000-00-00 00:00:00', '1'),
(73, 'jonathan', 'Ngo', 'lucky_dragon168@yahoo.com', 'luckydragon', '76419c58730d9f35de7ac538c2fd6737', 'qazwsx', 'test', '0', '2004-12-03 16:12:48', '0000-00-00 00:00:00', '1'),
(74, 'Anthony', 'Budomo', 'anthony_bud@hotmail.com', 'anthony_bud', '9a69f3d48da5b817aed1a5ee5a51c272', 'EQUALIZE', 'test', '0', '2004-12-03 16:15:31', '0000-00-00 00:00:00', '1'),
(75, 'Gener', 'Tongco', 'gctongco@yahoo.com', 'gtongco', '5bda6ece016ddd17f54a503f6e10e720', 'w4pfyfjk', 'test', '0', '2004-12-03 16:29:39', '0000-00-00 00:00:00', '1'),
(76, 'Orven', 'Barreyro', 'rageix@yahoo.com.cn', 'ragex', 'dbffc27e379b908b333684bf846b9249', 'ragex143', 'test', '0', '2004-12-03 17:04:25', '0000-00-00 00:00:00', '1'),
(77, 'Romulo', 'Sermonia III', 'romulosermoniaiii@yahoo.c', 'romulosermoniaiii', 'af83ee1646c420803ce64eae067e6f4d', 'looney', 'test', '0', '2004-12-03 17:34:20', '0000-00-00 00:00:00', '1'),
(78, ' lyndon', ' isleta', ' raptor_915@yahoo.com', 'raptor_915', '5eeb87cc9281a5191b44c1fd15430745', 'jumpman23', 'test', '0', '2004-12-03 20:08:43', '0000-00-00 00:00:00', '1'),
(79, 'eric', 'tala', 'dxtreme617@yahoo.com', 'dxtreme', 'f600e83ab44e1c1011871145189d21ce', 'fuckingshit', 'test', '0', '2004-12-03 20:11:30', '0000-00-00 00:00:00', '1'),
(80, 'Rajeev', 'sandhu', 'jeev_sandhu@yahoo.com', 'raj', '4cb9c8a8048fd02294477fcb1a41191a', 'changeme', 'test', '0', '2004-12-03 20:20:11', '0000-00-00 00:00:00', '1'),
(81, 'Albert', 'Dimaranan', 'aidimaranan@yahoo.com', 'Albert_01', '5d069f87c4fb2205bd51573f88f12620', 'quezon', 'test', '0', '2004-12-03 20:36:11', '0000-00-00 00:00:00', '1'),
(82, 'Rekz', 'Sarmenta', 'reinekz@hotmail.com', 'reinekz', '8dfd4b37f53fd46883c9afa6c0495f81', 'shimpat', 'test', '0', '2004-12-03 22:33:58', '0000-00-00 00:00:00', '1'),
(83, 'Clark', 'Valera', 'clark.valera@earthlink.ne', 'whitebear', '7d843c83fc3dad765b1f8babeb9a4db7', 'imanmcpnow', 'test', '0', '2004-12-04 00:05:09', '0000-00-00 00:00:00', '1'),
(84, 'rick', 'de joya', 'pescadores@pacific.net.ph', 'biker 6', '8e930496927757aac0dbd2438cb3f4f6', '2940', 'test', '0', '2004-12-04 01:13:22', '0000-00-00 00:00:00', '0'),
(85, 'archie', 'francisco', 'myboxtype@yahoo.com', 'myboxtype', 'b81a9dfa2a3ea350de88cac98594e40d', 'lancer', 'test', '0', '2004-12-04 07:24:57', '0000-00-00 00:00:00', '1'),
(86, 'Fernando Maria', 'Dalupan', 'fedaplus@mailcity.com', 'fedaplus', 'c5efe10ef922d575908700ec15d7517f', '0709', 'test', '0', '2004-12-04 07:26:55', '0000-00-00 00:00:00', '1'),
(87, 'Buddy', 'Garcia', 'bhipbip@yahoo.com', 'bhipbip', 'a0dcc47c7fff265b93708fd3711b7da7', 'buddysg', 'test', '0', '2004-12-04 07:35:25', '0000-00-00 00:00:00', '1'),
(88, 'Jesse', 'Patricio', 'jesse_patricio@yahoo.com', 'jesse', 'f3c37f795b84049f45884f742de06f2d', 'castrol', 'test', '0', '2004-12-04 08:36:23', '0000-00-00 00:00:00', '1'),
(89, 'joel', 'santos', 'joelcastillosantos@yahoo.', 'kuliglig', 'e3637f6fb15cce18c7682ee492a188c4', 'january22', 'test', '0', '2004-12-04 08:53:02', '0000-00-00 00:00:00', '1'),
(90, 'alan', 'galang', 'alangalang@gmail.com', 'alangalang', '5f44c2d9636efa05ae57b63786a2fb97', 'nipple', 'test', '0', '2004-12-04 08:54:30', '0000-00-00 00:00:00', '1'),
(91, 'ritcher', 'pacleb', 'ritcher_pacleb@yahoo.com', 'buridek', '423295d69df07ebf5e7f4504cf0c84bb', 'belcap', 'test', '0', '2004-12-04 13:55:00', '0000-00-00 00:00:00', '1'),
(92, 'lucito', 'cabalhin', 'lucito8@yahoo.com', 'raider8', 'aa04b54ae641914a733f61abf6c58a5f', 'kawasaki', 'test', '0', '2004-12-04 15:24:27', '0000-00-00 00:00:00', '0'),
(93, 'Benedict', 'Espiritu', 'adhick1975@yahoo.com', 'GEMClub34', 'f3077b76c9b6bb332fd6daef473e5fd6', '141719', 'test', '0', '2004-12-04 16:53:20', '0000-00-00 00:00:00', '1'),
(94, 'ambel', 'baylon', 'maribel_qabest@yahoo.com', 'maribel_qabest', 'b0c0fe9ddff8fd3d577d136a2472df0a', 'maribayl', 'test', '0', '2004-12-04 17:17:45', '0000-00-00 00:00:00', '0'),
(95, 'Lij Oliver', 'Elizaga', 'lij_06@hotmail.com', 'lij_06', '55f9c405bd87ba23896f34011ffce8da', 'maverick', 'test', '0', '2004-12-05 01:59:44', '0000-00-00 00:00:00', '1'),
(96, 'Renan', 'Lingat', 'naner2000@yahoo.com', 'naner2k', '388b98a12bfbff79a69c7f9797d1c53d', 'maynan', 'test', '0', '2004-12-05 06:06:30', '0000-00-00 00:00:00', '1'),
(97, 'edwin', 'barcial', 'wewenski@yahoo.com', 'wewenski', 'df5e0f5a42f6a0339809d9a51033e771', 'bundat', 'test', '0', '2004-12-05 09:22:46', '0000-00-00 00:00:00', '1'),
(98, 'Christian Gamaliel', 'Sunico', 'christian_sunico@yahoo.co', 'Christian F. Sunico', '1861d297772b6e5e36339b54ebd5a65d', 'sheena', 'test', '0', '2004-12-05 11:57:54', '0000-00-00 00:00:00', '1'),
(99, 'prudencio', 'gonzales', 'dug71168@yahoo.com', 'dug711', '7daacea5f373b4c1c054158b126d317f', 'dennis', 'test', '0', '2004-12-05 14:28:31', '0000-00-00 00:00:00', '1'),
(100, 'gelob0y', 'gallares', 'r-vin@digitelone.com', 'tucker_2ph', '7c3c31d93cc504d223ad65a679e5bdbc', 'gelob0y', 'test', '0', '2004-12-05 18:22:16', '0000-00-00 00:00:00', '1'),
(101, 'erik', 'estolas', 'eestolas@yahoo.com', 'pointblank', '9321f807a30feeaa0fe17c312d4dd05a', '100799', 'test', '0', '2004-12-05 20:09:16', '0000-00-00 00:00:00', '1'),
(102, 'dionisio', 'young', 'diony776@hotmail.com', 'diony', 'f5c48b3326f870ef178227aa88a8db45', 'xplorer', 'test', '0', '2004-12-05 21:56:24', '0000-00-00 00:00:00', '1'),
(103, 'aris', 'gatbunton', 'arisgatbunton@yahoo.com', 'jetx01', '7b83d3f08fa392b79e3f553b585971cd', 'warning', 'test', '0', '2004-12-06 03:53:39', '0000-00-00 00:00:00', '1'),
(104, 'todee', 'teodoro', 'todee_teodoro@yahoo.com', 'todee teodoro', '27a1158296c9c8f448115d579c2e7c4c', 'todee', 'test', '0', '2004-12-06 04:28:18', '0000-00-00 00:00:00', '1'),
(105, 'Enrico', 'Raymundo', 'enrico_raymundo@yahoo.com', 'enrico_raymundo', 'f1e3cad9d920432a77f5a7343ab48ec8', '04170417', 'test', '0', '2004-12-06 07:16:47', '0000-00-00 00:00:00', '1'),
(106, 'EDDY', 'CRUZ', 'ecmotorcycle@yahoo.com', 'ecmotorcycle', '1d25d6be2710558105dccf083a92a363', '041745', 'test', '0', '2004-12-06 07:29:03', '0000-00-00 00:00:00', '1'),
(107, 'christian', 'reyes', 'chris@tapsph.com', 'chris reyes', '1b35807aceea0f061a22bdf9937b4308', 'chreech', 'test', '0', '2004-12-06 08:25:51', '0000-00-00 00:00:00', '1'),
(108, 'jon', 'L.', 'krelin21@yahoo.com', 'krelin21', '5699dcfedc325a12a7ecf4dcef1575d5', 'bigotilyo', 'test', '0', '2004-12-06 09:08:50', '0000-00-00 00:00:00', '1'),
(109, 'Richard', 'Francisco', 'jbeloy@nouveau.com.', 'Richard M. Francisco', '17ad55a9b8384777496330d23e59d520', 'Rick', 'test', '0', '2004-12-06 09:12:49', '0000-00-00 00:00:00', '0'),
(110, 'richard', 'castanas', 'r_castanas@yahoo.com', 'r_castanas', '14e34abdd68b0cc79f1a48843787c05e', 'seedqtm', 'test', '0', '2004-12-06 09:41:56', '0000-00-00 00:00:00', '1'),
(111, 'Manolito', 'De Guzman', 'jaimecardinalsin@yahoo.co', 'boylit', '67cc86339b2654a35fcc57da8fc9d33d', 'counterparts', 'test', '0', '2004-12-06 09:43:07', '0000-00-00 00:00:00', '1'),
(112, 'emilio', 'gaerlan', 'epgaerlan@yahoo.com', 'epgaerlan', '96121f201c33256d8d21d0708785d2b7', 'marife', 'test', '0', '2004-12-06 10:46:49', '0000-00-00 00:00:00', '1'),
(113, 'Eric', 'Raymundo', 'envl_mgt@yahoo.com', 'Raymundo', '29988429c481f219b8c5ba8c071440e1', 'eric', 'test', '0', '2004-12-06 10:53:45', '0000-00-00 00:00:00', '1'),
(114, 'Andrew', 'Madrigallos', 'andrew@asol.com.ph', 'Fuzzler', '16ad5892d13a0b7c9220684e52a548b1', 'compaq', 'test', '0', '2004-12-06 12:28:19', '0000-00-00 00:00:00', '1'),
(115, 'Michael', 'Lazaro', 'boz_mike@yahoo.com', 'bbcmike32', 'a8be3e109aa977d5ddad9c97ba30a2c6', 'mike32', 'test', '0', '2004-12-06 13:07:00', '0000-00-00 00:00:00', '1'),
(116, 'Jamil Kastner', 'Mariano', 'www.kastnerph@yahoo.com', 'JamilKastner', 'f34c903e17cfeea18e499d4627eeb3ec', 'slipknot', 'test', '0', '2004-12-06 13:43:01', '0000-00-00 00:00:00', '0'),
(117, 'Froilan', 'Romualdo', 'froilanr@mozcom.com', 'froilanr', '7c49d0e5f68b8f6569e260f3ce1d7031', 'roifsr', 'test', '0', '2004-12-06 13:50:39', '0000-00-00 00:00:00', '1'),
(118, 'Michael Angelo', 'Bondoc', 'codnoboel@yahoo.com', 'codnoboel', '91382b8c7ae588de27d2178b3be7bc31', 'lg1209', 'test', '0', '2004-12-06 14:59:30', '0000-00-00 00:00:00', '1'),
(119, 'Christopher', 'Pedrena', 'chrispedrena@yahoo.com', 'Tammahommie', '47c888561498742948f0e940e265907b', 'babybjork', 'test', '0', '2004-12-06 15:18:20', '0000-00-00 00:00:00', '1'),
(120, 'sherwin', 'posadas', 'bedista23@yahoo.com', 'bedista23', '571e9392a91b35c05ef0c6847c444a65', '042376', 'test', '0', '2004-12-06 15:21:17', '0000-00-00 00:00:00', '1'),
(121, 'abner', 'gonzales', 'lupet_ab@yahoo.com', 'LUPET', 'f2ce0541a4de79020361f242ea4d5252', 'june20', 'test', '0', '2004-12-06 15:38:39', '0000-00-00 00:00:00', '1'),
(122, 'Jerome', 'Gaza', 'jgaza@yahoo.com', 'jgaza', '125af65202fe7ccbc56e1f99320e68ae', 'rabbijey', 'test', '0', '2004-12-06 15:41:00', '0000-00-00 00:00:00', '0'),
(123, 'Alexander', 'Galera', 'lexer_galera@hotmail.com', 'lexer_galera', '25d55ad283aa400af464c76d713c07ad', '12345678', 'test', '0', '2004-12-06 16:21:19', '0000-00-00 00:00:00', '1'),
(124, 'jojo', 'medina', 'jojomedina88@yahoo.com', 'jojo', '98c24482eabe3c29f3fa970b4874d4f5', '051565', 'test', '0', '2004-12-06 17:17:27', '0000-00-00 00:00:00', '1'),
(125, 'Roel', 'Loable', 'rel_gsc@yahoo.com', 'rel_gsc', 'edbd0effac3fcc98e725920a512881e0', 'iloveu', 'test', '0', '2004-12-06 19:23:16', '0000-00-00 00:00:00', '0'),
(126, 'Emilio II', 'Resuello', 'e2resuello@edsamail.com.p', 'echo2knight', 'bd84386835efd1035249e53547b1ba89', 'e2olleuser', 'test', '0', '2004-12-07 00:37:56', '0000-00-00 00:00:00', '1'),
(127, 'erickson', 'manahan', 'kornik_14@yahoo.com', 'kornik14', 'e0f02f63ff64e5f5e1870ddcd0cbf536', 'crisca', 'test', '0', '2004-12-07 09:55:44', '0000-00-00 00:00:00', '0'),
(128, 'Harrison', 'Ng', 'baby_jonx@yahoo.com', 'coleman', '5dd003200ee7591cc175bd87061b4290', '011576', 'test', '0', '2004-12-07 10:04:45', '0000-00-00 00:00:00', '1'),
(129, 'Leonardo', 'Mampusti', 'mampul01@hbfuller.com', 'mampul01', '431387eb7262e1cfc79b125eb8a67c60', 'proxy', 'test', '0', '2004-12-07 10:10:52', '0000-00-00 00:00:00', '1'),
(130, 'jacques', 'jose', 'jacq@volvophils.com', 'jacques', 'cfa970af1c7913d4410b3c6975cf5c40', 'jacques', 'test', '0', '2004-12-07 10:41:27', '0000-00-00 00:00:00', '0'),
(131, 'james', 'dizon', 'jamesedizon@yahoo.com', 'jamesedizon', 'd524876bbfa7103d5c34e16ab571c277', 'jbond', 'test', '0', '2004-12-07 10:50:58', '0000-00-00 00:00:00', '1'),
(132, 'paul', 'merc', 'pmercado@doleasia.com', 'paulmerc', '963e41b52e3fff15844573d57f8c01fc', 'merx', 'test', '0', '2004-12-07 11:53:34', '0000-00-00 00:00:00', '1'),
(133, 'kenneth', 'Joya', 'k3ken@yahoo.com', 'k3', 'cbf6b12dd3853ba286f880c142e01d02', 'saakinlang', 'test', '0', '2004-12-07 12:13:00', '0000-00-00 00:00:00', '1'),
(134, 'florencio jr', 'caringal', 'fcj067@hotmail.com', 'fcj067', '062a9dc58ad113ccbeb4483d71d9c23d', 'pugot067', 'test', '0', '2004-12-07 12:28:22', '0000-00-00 00:00:00', '1'),
(135, 'Margananda', 'Tagorda', 'margoxt@yahoo.com', 'margananda', 'd1d813a48d99f0e102f7d0a1b9068001', 'violet', 'test', '0', '2004-12-07 15:16:53', '0000-00-00 00:00:00', '0'),
(136, 'ryan son', 'tesalona', 'ryanson@yahoo.com', 'pro_scoot', 'b4101678aebb576bfda02bf6fc0ea08c', 'metalman', 'test', '0', '2004-12-07 15:43:41', '0000-00-00 00:00:00', '0'),
(137, 'jose rafael', 'santos', 'fathre08@yahoo.com', 'fathre08', 'ea5801229d983792d7804a0f5dd5d7b6', 'babyruth', 'test', '0', '2004-12-07 18:40:02', '0000-00-00 00:00:00', '1'),
(138, 'jay mark', 'ril', 'j_mark_20@yahoo.com', 'j_mark_20', 'df3e3e11e803e5213b22915fda9e0027', '1030568', 'test', '0', '2004-12-07 19:27:22', '0000-00-00 00:00:00', '1'),
(139, 'Enrique', 'Cruz', 'reekee98@yahoo.com', 'reekee98', '8e73b27568cb3be29e2da74d42eab6dd', 'rachel', 'test', '0', '2004-12-07 19:32:01', '0000-00-00 00:00:00', '1'),
(140, 'Boy', 'siojo', 'boy@sea-cid.com', 'boydive', '61455e0762dfb729a56d260607707419', 'sacky4', 'test', '0', '2004-12-07 21:32:18', '0000-00-00 00:00:00', '1'),
(141, 'andrew', 'delgado', 'andrew@infocom.ph', 'andrew12ph', '6470b8509d18aaf4401b0329a79e5d81', 'cyclops', 'test', '0', '2004-12-07 22:27:34', '0000-00-00 00:00:00', '1'),
(142, 'Feldrian', 'Palafox', 'f.palafox@sdmi.shi.co.jp', 'fepfox', '61a590f1b9b5548efbae70fd7bcf45b3', 'august', 'test', '0', '2004-12-08 07:54:56', '0000-00-00 00:00:00', '1'),
(143, 'Benedict', 'Patajo', 'hotshot_bp@yahoo.com', 'hotshot_bp', '20a2556db13e33eee097f2228f857adb', 'find068', 'test', '0', '2004-12-08 08:37:04', '0000-00-00 00:00:00', '1'),
(144, 'Rey', 'Gonzales', 'reygonzales76@yahoo.com', 'joshua010', '8b28406c698875d68169c0f2fea77af7', 'xander', 'test', '0', '2004-12-08 10:30:12', '0000-00-00 00:00:00', '1'),
(145, 'Darwin', 'Tatac', 'mrblueguy2003@yahoo.com', 'mrblueguy2003', '2588b80963ee311e3656893546db673d', 'power123', 'test', '0', '2004-12-08 12:07:53', '0000-00-00 00:00:00', '1'),
(146, 'adonis', 'sangalang', 'don_sangalang@yahoo.com', 'don sangalang', '0b4e7a0e5fe84ad35fb5f95b9ceeac79', 'aaaaaa', 'test', '0', '2004-12-08 12:26:22', '0000-00-00 00:00:00', '0'),
(147, 'Ariel', 'Villamin', 'aavillamin@yahoo.com', 'SRAD', '8b9b376151de71336bdf4893f447760c', 'adrpao', 'test', '0', '2004-12-08 14:43:50', '0000-00-00 00:00:00', '1'),
(148, 'jeff', 'santos', 'jeff_santos2004@yahoo.com', 'wave2004', '8e9d0d6af4d7307f7e7da74f9907c1de', 'jepoy2004', 'test', '0', '2004-12-08 17:09:25', '0000-00-00 00:00:00', '1'),
(149, 'Rogelio (bhong)', 'Almeda', 'bhong@streamwaredev.com', 'Bhong2002', '8953a5d7179db112de88a2af4a77029b', 'b40ng', 'test', '0', '2004-12-08 21:58:56', '0000-00-00 00:00:00', '1'),
(150, 'Gerald', 'Del Valle', 'dawnripper@gmail.com', 'DawnRipper', '4567a638ffdf80a9245192dcc5be2754', 'dawnreaper', 'test', '0', '2004-12-09 08:02:22', '0000-00-00 00:00:00', '0'),
(151, 'Julius Manuel', 'Paraiso', 'juliusparadise@yahoo.com', 'juliusparadise', '2f8826576093a2943c9ab209970a7ab8', 'fmotherf', 'test', '0', '2004-12-09 08:58:26', '0000-00-00 00:00:00', '1'),
(152, 'bobby', 'zamora', 'ushirodori110501@yahoo.co', 'Ushirodori', '3fa7ffe907521378f4ad30e0f5ffd62c', 'karenina', 'test', '0', '2004-12-09 09:47:47', '0000-00-00 00:00:00', '0'),
(155, 'francis tadeus', 'canilao', 'todz_750@yahoo.com', 'tadeus', '118ac1ae3e486aedf10d4a25283fe5dd', 'suzuki750', 'test', '0', '2004-12-09 13:59:22', '0000-00-00 00:00:00', '1'),
(156, 'Arnold', 'Giron', 'arnold.giron@infostorage.', 'J99', 'a853c3220805850abb016e312e791576', 'heatwave', 'test', '0', '2004-12-09 16:16:09', '0000-00-00 00:00:00', '1'),
(157, 'Bong', 'Villarama', 'spokes14@yahoo.com', 'TerribleOne', '191bcd6f0408fa5d57533f1532f1a258', 'badassako', 'test', '0', '2004-12-09 16:39:59', '0000-00-00 00:00:00', '1'),
(158, 'ian', 'aguila', 'vonianelle@yahoo.com', 'vonianelle', 'ecba395727f462d8863ba6fab50b193b', 'aguila', 'test', '0', '2004-12-09 17:01:31', '0000-00-00 00:00:00', '0'),
(159, 'Lemuel', 'Villenas', 'lhemski_shogun@yahoo.com', 'lhemski', 'e8fbc1f03504ddffc52a9e6dab5e204d', 'scooter', 'test', '0', '2004-12-09 17:33:30', '0000-00-00 00:00:00', '0'),
(160, 'Rafael Khyle', 'Cajefe', 'rafaelkhyle_16@yahoo.com', 'RUFFZ', '1619df7011e973a59f5b7b19acedc871', 'rkhyle', 'test', '0', '2004-12-09 18:15:33', '0000-00-00 00:00:00', '1'),
(161, 'gabriel', 'ramirez', 'gabriel_ramirez37@yahoo.c', 'gabbyramirez', 'f962bed5616612c8c7053f6e97e72b12', 'december', 'test', '0', '2004-12-09 20:24:40', '0000-00-00 00:00:00', '1'),
(162, 'Cesar', 'Villanueva', 'gerimyah@yahoo.com', 'Rasec', 'b080e2ad6f0d850a3253a7fa083e1dae', 'jazzie25!!', 'test', '0', '2004-12-09 20:55:47', '0000-00-00 00:00:00', '1'),
(163, 'ding', 'acuña', 'bullseye_1224@yahoo.com', 'bullseye_1224', '3e9f2427e8ab181625d0a51023ce5bc9', 'nu1075', 'test', '0', '2004-12-09 21:36:44', '0000-00-00 00:00:00', '1'),
(164, 'ronald', 'nava', 'rnava@vocativ.com', 'Logun', 'dfced74a3f5cc2001f4f70354c8b1911', 'bhabie', 'test', '0', '2004-12-10 00:45:56', '0000-00-00 00:00:00', '1'),
(165, 'reste', 'ismael', 'echogin@globalpinoy.com', 'echogin', 'edbd0effac3fcc98e725920a512881e0', 'iloveu', 'test', '0', '2004-12-10 01:12:22', '0000-00-00 00:00:00', '0'),
(166, 'ALBERT', 'OLIVAR', 'alberto@chowking.com', 'ABET', 'e3f1dcadf78b75cc2963a424dcf0618f', 'ABRAM0430', 'test', '0', '2004-12-10 08:07:08', '0000-00-00 00:00:00', '1'),
(167, 'luther', 'lapira', 'bagwis_makati@yahoo.com', 'bagwis_makati@yahoo.com', '8621ffdbc5698829397d97767ac13db3', 'dragon', 'test', '0', '2004-12-10 08:39:43', '0000-00-00 00:00:00', '1'),
(168, 'VoltZ', 'Sanchez', 'arcanefreak@hotmail.com', 'arcanefreak', '42ba6610eb0ebf661af2f12183338cc1', 'nba123', 'test', '0', '2004-12-10 08:54:58', '0000-00-00 00:00:00', '1'),
(169, 'Allan', 'Sauquillo', 'allan.sauquillo@sanofi-sy', 'ua2124', '154ce0ce436e9323e4fb518eb829dae2', 'pyxxius', 'test', '0', '2004-12-10 10:12:02', '0000-00-00 00:00:00', '0'),
(170, 'KAWASAKI', 'peralta', 'harrythemarsian@yahoo.com', 'leostar', 'aa04b54ae641914a733f61abf6c58a5f', 'kawasaki', 'test', '0', '2004-12-10 16:25:56', '0000-00-00 00:00:00', '0'),
(171, 'francis', 'bigueja', 'bigf1977@yahoo.com', 'bigf', '644b1766577d4fadc0ab94ef67dbd6ca', 'nippon', 'test', '0', '2004-12-10 16:29:33', '0000-00-00 00:00:00', '1'),
(172, 'Frederick', 'Ng', 'zonelza@yahoo.com', 'zonelza', 'f5ba1979acd92f94887eb9cd075a2887', 'amp168', 'test', '0', '2004-12-11 00:26:04', '0000-00-00 00:00:00', '0'),
(173, 'Claude Idel', 'Tantoy', 'bhumdel@hotmail.com', 'clude_yamaha', '8bb75b3015682d910daf88b6d728be2c', 'claude', 'test', '0', '2004-12-11 00:35:11', '0000-00-00 00:00:00', '1'),
(174, 'Norman', 'De Guzman', 'normanila2000@yahoo.com', 'Alitaptap', '947f01331ab0db1b086a4fc91e7bda93', 'highspeed', 'test', '0', '2004-12-11 02:10:24', '0000-00-00 00:00:00', '1'),
(175, 'Edmar', 'Bontia', 'edmhar8@yahoo.com', 'MHAR8', 'cf79ae6addba60ad018347359bd144d2', '8888', 'test', '0', '2004-12-11 07:04:13', '0000-00-00 00:00:00', '1'),
(176, 'Luiz', 'Asuncion', 'luiz_asuncion@yahoo.com', 'iggy666', '9f05aa4202e4ce8d6a72511dc735cce9', 'spiderman', 'test', '0', '2004-12-11 16:02:45', '0000-00-00 00:00:00', '1'),
(177, 'rey', 'clavecillas', 'reybetsy@yahoo.com', 'rey clavecillas', '021bbc7ee20b71134d53e20206bd6feb', '1024', 'test', '0', '2004-12-11 17:19:08', '0000-00-00 00:00:00', '1'),
(178, 'anthony', 'gutierrez', 'afg@freemail.com', 'afg', '46f227e9cf17e2e1e88b14e679047bd9', '252525', 'test', '0', '2004-12-11 23:21:31', '0000-00-00 00:00:00', '0'),
(179, 'arnold', 'cantoria', 'stock1300@yahoo.com', 'stock1300', '464dd625130745a2c087b7147c7c4fad', 'arem99', 'test', '0', '2004-12-12 04:25:13', '0000-00-00 00:00:00', '1'),
(180, 'Anthony', 'Concepcion', 'concepciona@corp.earthlin', 'bojok', 'c3d938804af8b2e89bb66de2a8d40dbc', 'joker22', 'test', '0', '2004-12-12 14:35:26', '0000-00-00 00:00:00', '1'),
(181, 'merrick', 'natal', 'merricknatal@yahoo.com', 'mrick@22', '280f07e5ec046577e2fa57d2fe70acfc', 'dolerian', 'test', '0', '2004-12-12 17:53:40', '0000-00-00 00:00:00', '1'),
(182, 'Herbert', 'Haber', 'herbert_haber@yahoo.com', 'matinique', '97a42bd1fa19cf1e3559e24e76b0bac5', 'matinique', 'test', '0', '2004-12-12 18:12:40', '0000-00-00 00:00:00', '1'),
(183, 'Jose', 'Ponce', 'virgopro@yahoo.com', 'thrillwind', '518540884b0a5ef8903c52ea0857f855', 'harurot', 'test', '0', '2004-12-12 21:56:20', '0000-00-00 00:00:00', '1'),
(184, 'jorge', 'dalisay', 'none', 'jorge dalisay', '5fcaf14e2ae8b8a7eb81a79eaf74cfa8', 'ponjap', 'test', '0', '2004-12-12 23:50:06', '0000-00-00 00:00:00', '0'),
(185, 'david', 'tinsay', 'dvdtnsy@yahoo.com', 'sealander', 'ba1f262f09fcb3450e8c6fa62172d1c8', 'wain', 'test', '0', '2004-12-14 12:32:05', '0000-00-00 00:00:00', '1'),
(186, 'marvyn', 'a', 'piniot@yahoo.com', 'zoomer', 'a5fbcfd165dc397736d9411f96e8b6fa', 'marvyn', 'test', '0', '2004-12-14 14:41:51', '0000-00-00 00:00:00', '0'),
(187, 'Lee John', 'Pangilinan', 'jeisenjan@gmail.com', 'jeisenjan', '3c24a5ebb2a8b53f798cde9cbf191d9b', 'jayjaypangilinan', 'test', '0', '2004-12-14 17:05:12', '0000-00-00 00:00:00', '1'),
(188, 'Suhod', 'Hakim', 'phildragonboat@yahoo.com', 'phildragonboat@yahoo.com', '57328360ce90508dbe6029a9e3735891', 'arap123', 'test', '0', '2004-12-14 20:58:13', '0000-00-00 00:00:00', '1'),
(189, 'Edward', 'Martin', 'ej100299@yahoo.com', 'EJ02@Adv.', 'a53f3929621dba1306f8a61588f52f55', 'edward', 'test', '0', '2004-12-16 10:21:41', '0000-00-00 00:00:00', '1'),
(190, 'jerry', 'macalinao', 'gutvik7112@yahoo.com', 'gutvik7112@yahoo.com', '3b66c7bafad8c09f8250a7b80718f4e6', 'jog747', 'test', '0', '2004-12-16 21:40:48', '0000-00-00 00:00:00', '1'),
(191, 'Jake', 'Swann', 'Swann@vasia.com', 'Jake', 'c248fd0f2f6ab4df656754cdfe68b1a8', 'pmtuning', 'test', '0', '2004-12-16 21:53:42', '0000-00-00 00:00:00', '1'),
(192, 'Vivencio', 'Morano', 'mpc_ppc@eastern.com.ph', 'vench', 'b588812224569c46fe0e7cebac6606ad', 'aidz', 'test', '0', '2004-12-17 06:51:59', '0000-00-00 00:00:00', '0'),
(193, 'eyek', 'gaite', 'grey_cutter@yahoo.com', 'kuleleg_super4', 'f72a4f59a032e865f0aae715125f5572', 'choppy', 'test', '0', '2004-12-17 07:57:25', '0000-00-00 00:00:00', '0'),
(194, 'Ande.j', 'Baulete', 'xcnerd@yahoo.com', 'xcnerd', '08bea8b8ecdd663ed8167d1b2904a8f5', '1htiaf0', 'test', '0', '2004-12-18 22:48:10', '0000-00-00 00:00:00', '1'),
(195, 'aris', 'simtoco', 'arisjen1224@yahoo.com', 'aris', '686d04defe50b7f33c2bc86175280e7d', '262812', 'test', '0', '2004-12-18 23:56:30', '0000-00-00 00:00:00', '1'),
(196, 'jann carlo', 'solomon', 'janncarlo_solomon@yahoo.c', 'carlosolomon10', '3d9900bad4135b9458ba500464c53a55', 'october10', 'test', '0', '2004-12-19 22:31:15', '0000-00-00 00:00:00', '0'),
(197, 'Lij Oliver', 'Elizaga', 'lij_06@yahoo.com', 'M@verick', '2d2b1a9d82c93f760ed5a889769f6341', 'lij_06', 'test', '0', '2004-12-19 23:57:17', '0000-00-00 00:00:00', '1'),
(198, 'Jessie', 'Campos', 'jec_mis@hotmail.com', 'jec_mis', '0d107d09f5bbe40cade3de5c71e9e9b7', 'letmein', 'test', '0', '2004-12-20 08:58:16', '0000-00-00 00:00:00', '1'),
(199, 'jann carlo', 'solomon', 'janncarlo_solomon@yahoo.c', 'carlosolomon1088', '3d9900bad4135b9458ba500464c53a55', 'october10', 'test', '0', '2004-12-20 15:10:39', '0000-00-00 00:00:00', '1'),
(200, 'raque', 'medina', 'okerian1224@yahoo.com', 'oker_med', '540b94bb4bce65a37e218285e1aef08c', 'bdrc', 'test', '0', '2004-12-21 09:50:02', '0000-00-00 00:00:00', '1'),
(201, 'glenn', 'luna', 'glenn@philcom.ph', 'glenshe2', 'd63678476b957f66e6e95bbfce6ab2a3', 'glennluna', 'test', '0', '2004-12-21 09:56:25', '0000-00-00 00:00:00', '1'),
(202, 'Alberto', 'Ladores Jr.', 'maykeldyordan@yahoo.com', 'maykeldyordan', '6755b5a357318b7ae0e13af16d00529f', 'bhitong73', 'test', '0', '2004-12-21 11:18:29', '0000-00-00 00:00:00', '1'),
(203, 'Christian', 'dela Cruz', 'ianuks@yahoo.com', 'x-tian', 'f0186e06f922b00e956e9b2039fc4afd', 'tk9782', 'test', '0', '2004-12-21 12:25:28', '0000-00-00 00:00:00', '1'),
(204, 'melwin', 'enriquez', 'backflipthe50cc@yahoo.com', 'melwin', '24220dd74d88a94e7cc2eca7bca6c2be', 'power1', 'test', '0', '2004-12-21 13:38:39', '0000-00-00 00:00:00', '1'),
(205, 'NICANOR', 'ROQUE', 'nique_roque@yahoo.com', 'ncroque', '39dcaf7a053dc372fbc391d4e6b5d693', '1964', 'test', '0', '2004-12-21 13:48:59', '0000-00-00 00:00:00', '1'),
(206, 'edgardo', 'dizon', 'dong_dizon@yahoo.com', 'sir_dong', '75c6f03161d020201000414cd1501f9f', 'diamond', 'test', '0', '2004-12-21 19:07:29', '0000-00-00 00:00:00', '1'),
(207, 'Cedric', 'Malig', 'sedi_malig@yahoo.com', 'batangx', 'dd16cde0e70366049724a2d23130ca36', 'babyko', 'test', '0', '2004-12-22 06:43:26', '0000-00-00 00:00:00', '1'),
(208, 'Eillor', 'De Lima', 'klub_cherie@yahoo.com', 'budi', '08fdf14f7a142497153c387f6cf99b82', 'klubkc75', 'test', '0', '2004-12-22 16:25:53', '0000-00-00 00:00:00', '1'),
(209, 'Jesus', 'Gaffud', 'tukayo030369@yahoo.com', 'Tukayo', '940e126f00a5c2f4bcc0179581798b52', 'blessed', 'test', '0', '2004-12-22 17:39:52', '0000-00-00 00:00:00', '1'),
(210, 'patrick', 'ustaris', 'pmu_3@hotmail.com', 'kash1maru', '2345f10bb948c5665ef91f6773b3e455', 'michelle', 'test', '0', '2004-12-22 19:42:52', '0000-00-00 00:00:00', '1'),
(211, 'Gilbert', 'De Jesus', 'gilber_de_jesus@yahoo.com', 'ghigz', 'a8bb162af4a1a56c794519866e0dbbdc', '071975', 'test', '0', '2004-12-22 23:18:38', '0000-00-00 00:00:00', '0'),
(213, 'Richard Anthony', 'Dalida', 'tey410@excite.com', 'littey', 'e0ab074e8104870583f417cbd8afa027', 'reaction', 'test', '0', '2004-12-23 11:56:48', '0000-00-00 00:00:00', '1'),
(214, 'Allan Christopher', 'Carlos', 'axrockster@yahoo.com.cn', 'axrockster', '0314c9b108b8c39f1cf878ed93fdd5ae', '4131', 'test', '0', '2004-12-23 15:00:53', '0000-00-00 00:00:00', '1'),
(215, 'roger', 'perfecto', 'oer104@yahoo.com', 'roger', 'fa2816b06efaed8ca4bc19fd64d135f3', 'rdp143', 'test', '0', '2004-12-23 15:09:25', '0000-00-00 00:00:00', '0'),
(216, 'ARVIL', 'POTESTAS', 'livranneg@yahoo.com', 'livranneg@yahoo.com', 'b226760bf0de3506108a01cdfcbc0964', 'livann1276', 'test', '0', '2004-12-23 16:34:32', '0000-00-00 00:00:00', '1'),
(217, 'Anthony James', 'Araneta', 'ajaraneta@hotmail.com', 'ajsaraneta', '87ca0cd86915f5d129233b3a5ae8f995', 'aj121776', 'test', '0', '2004-12-25 00:22:07', '0000-00-00 00:00:00', '1'),
(218, 'alexander', 'go', 'abra_racing_team@yahoo.co', 'speedfreak', 'a9781d0ca6abb43812a28783ccb3bbaa', 'piglet', 'test', '0', '2004-12-25 09:04:37', '0000-00-00 00:00:00', '1'),
(219, 'randolf', 'perez', 'psyclops16@yahoo.com', 'fastestjog', 'fa1e900b47ca29f1efffa4c3aa0b7a20', 'nbi101173', 'test', '0', '2004-12-25 13:26:02', '0000-00-00 00:00:00', '1'),
(220, 'Bayani', 'Manuba', 'bayanimanub@yahoo.com', 'raider_shrek', '93c0b3c7414ce3bf4ded94ab11be9e1b', 'joseprizal', 'test', '0', '2004-12-26 19:49:55', '0000-00-00 00:00:00', '0'),
(221, 'Ralph Walter', 'Crisostomo', 'rcrisostomo@wrigley.com', 'Ralph Crisostomo', '611cf54dbcf8d467b7d8ce81e2229af4', 'ralph2671', 'test', '0', '2004-12-26 20:50:43', '0000-00-00 00:00:00', '0'),
(222, 'ANTONIO JR', 'ANDAYA', 'andayataekwondo@hotmail.c', 'APPLEBY', 'b3da75c21bf047cc21720517eeaade96', 'SYRUP', 'test', '0', '2004-12-27 08:43:26', '0000-00-00 00:00:00', '0'),
(223, 'ANTONIO JR', 'ANDAYA', 'tkdwarrior2000@yahoo.com', 'RIDES', 'f13863ed7d6b0224a0046d9646ecd02c', 'wheels', 'test', '0', '2004-12-27 08:50:07', '0000-00-00 00:00:00', '1'),
(224, 'Ariel', 'Jopio', 'arielsj@yahoo.com', 'arielsj', '4b21cf96d4cf612f239a6c322b10c8fe', '2941', 'test', '0', '2004-12-27 18:09:21', '0000-00-00 00:00:00', '1'),
(225, 'jerome', 'venturina', 'prettyboysahangas@yahoo.c', 'elon venturina', '8a6b6ea3aa08285be1d4e00725aa9090', 'favorite', 'test', '0', '2004-12-27 21:16:03', '0000-00-00 00:00:00', '1'),
(226, 'julius', 'venturina', 'uio_333@yahoo.com', 'uio', '5a773c67b9735b1695f7b09a9a37873c', 'ihateuio', 'test', '0', '2004-12-27 21:18:10', '0000-00-00 00:00:00', '1'),
(227, 'francis', 'mangahas', 'fmangahas@yahoo.com', 'antet', '1a18ce1c4d479319634bebfbddcafbec', '726693', 'test', '0', '2004-12-28 10:14:35', '0000-00-00 00:00:00', '1'),
(228, 'joselito', 'bautista', 'joel.bautista@temic.com', 'maskedbandit', '3c6e599ef8b4c06c19586dd9a5250334', 'Kuehne&nagel', 'test', '0', '2004-12-28 11:38:53', '0000-00-00 00:00:00', '0'),
(229, 'Christian', 'Tabuso', 'xtiansy@yahoo.com', 'xtiansy', '9fcd8a7eb2177b0e2b23c95909f71170', 'iantot', 'test', '0', '2004-12-28 15:16:26', '0000-00-00 00:00:00', '0'),
(230, 'Venancio', 'Medel Jr.', 'ariesmedel@yahoo.com', 'ariesmedel', 'd36c91124961f7f0fa9a69eb9a8f7d86', 'VENANCIO', 'test', '0', '2004-12-28 21:49:48', '0000-00-00 00:00:00', '1'),
(231, 'ariel', 'guerrero', 'arieleguerrero@yahoo.com', 'aeg', '7fd6d36ae44765c9f6b7c86cbb87adaf', '122001', 'test', '0', '2004-12-29 09:29:01', '0000-00-00 00:00:00', '1'),
(232, 'edwin joseph', 'olaer', 'ejholaer2000@yahoo.com', 'krivac_6', '6aef28693a0e7cf0a847d7a0e36c6171', '37thmc', 'test', '0', '2004-12-29 10:40:33', '0000-00-00 00:00:00', '1'),
(233, 'moises arvin', 'cundangan', 'moisesarvin@gmail.com', 'moises', '0911054d8ad47cc256400031197f3e97', 'ferrari', 'test', '0', '2004-12-29 12:51:11', '0000-00-00 00:00:00', '1'),
(234, 'Expedito, Jr.', 'Añonuevo', 'e_anonuevojr80@yahoo.com', 'jonskee27', 'b7b0ae5532585411f12c2b90a5509f56', 'jonjon', 'test', '0', '2004-12-29 14:22:29', '0000-00-00 00:00:00', '0'),
(235, 'Expedito', 'Anonuevo', 'jonskee27@yahoo.com', 'jonskee27_decabba', 'b7b0ae5532585411f12c2b90a5509f56', 'jonjon', 'test', '0', '2004-12-29 14:40:08', '0000-00-00 00:00:00', '1'),
(236, 'ROMEO JR', 'MATIAS', 'JETHRU13@YAHOO.COM', 'JETH', '4ce8cfbcaaa534bdf744922005abd7e9', '210720367', 'test', '0', '2004-12-29 14:44:18', '0000-00-00 00:00:00', '1'),
(237, 'Dan', 'Arevalo', 'dan.arevalo@excelpoint.co', 'pro2wister', '62bf43e2db266caa78d4f0bd18fb5f7e', 'danilo', 'test', '0', '2004-12-29 15:00:00', '0000-00-00 00:00:00', '1'),
(238, 'joseph', 'santos', 'josephsantos_eleven@yahoo', 'icejan', 'fdeef2b377bab6d0832d9edddde48bab', 'icejan', 'test', '0', '2004-12-29 15:21:07', '0000-00-00 00:00:00', '1'),
(239, 'JERIC', 'AHAT', 'jeric_ ahat@wgasuperferry', 'JERIC', 'ffeaca5f1a2564a3a2cc7544dcf0b42f', 'POLOMOLOK10', 'test', '0', '2004-12-29 15:50:02', '0000-00-00 00:00:00', '0'),
(240, 'aldwin', 'de guia', 'aldwin_bullet@yahoo.com', 'aldwin de guia', '6c988619f2711666be05fea627dbf15c', 'bergsteiger', 'test', '0', '2004-12-30 13:55:08', '0000-00-00 00:00:00', '0'),
(241, 'Renante', 'cloma', 'reycloms@yahoo.com', 'Rey Cloma', '806ad1e1a4aa6498a4b7adaed7639293', 'yam', 'test', '0', '2004-12-30 17:37:46', '0000-00-00 00:00:00', '0'),
(242, 'jc', 'enriquez', 'jc41386@yahoo.com', 'jc41386', '5987af2048ead50360d8a6fcac137d77', 'jc41386', 'test', '0', '2004-12-30 18:46:39', '0000-00-00 00:00:00', '1'),
(243, 'Richard', 'Santos', 'aos2k3@yahoo.com', 'aos2k3', 'd25199542f4e4882adbcea1dd778f711', '771-3744', 'test', '0', '2004-12-30 20:02:35', '0000-00-00 00:00:00', '1'),
(245, 'angel', 'anden', 'tynee_a@yahoo.com', 'tyneea', '8a01f29d38e75356f312b0a3f8e87e14', '6719009', 'test', '0', '2004-12-31 16:23:33', '0000-00-00 00:00:00', '1'),
(246, 'lee', 'real', 'yongski76@lycos.com', 'yongski', 'a482921766272cebfcdad751e6244f5b', 'aries', 'test', '0', '2005-01-01 20:45:20', '0000-00-00 00:00:00', '1'),
(247, 'ed', 'oftial', 'edoftial@yahoo.com', 'lukeskyph', '62dd9d6afb0141a8de1b08b7dd179a13', 'edward822', 'test', '0', '2005-01-02 00:30:13', '0000-00-00 00:00:00', '1'),
(248, 'Joseph', 'Castro', 'jbcaaa4@yahoo.com', 'Joseph', '8c63feed8b89ea9a6496ed92ed818ac2', 'fritz', 'test', '0', '2005-01-03 09:53:18', '0000-00-00 00:00:00', '0'),
(249, 'irving', 'dela cruz', 'vingdc@identitypro.com', 'vingdc', 'd625368a21585b7939ebfdf0192a26a4', 'sandyirving', 'test', '0', '2005-01-03 13:49:51', '0000-00-00 00:00:00', '1'),
(250, 'ed', 'feliciano', 'edfeliciano@sagawa.com.ph', 'esfeliciano', '8b848a152ad86d9fec34c7c291c66858', 'popeye', 'test', '0', '2005-01-03 13:51:39', '0000-00-00 00:00:00', '1'),
(251, 'neil', 'ratuita', 'engratuita@yahoo.com', 'engratuita', '78c1ffbfc53465f1b2b80101299be354', '1997111819', 'test', '0', '2005-01-03 14:36:15', '0000-00-00 00:00:00', '1'),
(252, 'Anthony', 'Allermo', 'anthony_allermo@yahoo.com', 'Spash', 'b15ab3f829f0f897fe507ef548741afb', 'vincent', 'test', '0', '2005-01-04 11:58:18', '0000-00-00 00:00:00', '0'),
(253, 'Bong', 'Corpuz', 'bncorpuz@yahoo.com', 'vulpes_velox', 'c49e5b9606b2f82f9b2010a18aea2c40', 'anselmo', 'test', '0', '2005-01-04 13:36:43', '0000-00-00 00:00:00', '1'),
(254, 'Fatima May', 'Pacay', 'fmpacay_10@yahoo.com', 'Fatima_10', '0441f9e2d94c39a70e21b83829259aa4', 'artist', 'test', '0', '2005-01-04 14:48:36', '0000-00-00 00:00:00', '1'),
(255, 'erik', 'zurbano', 'erik@artif.com.ph', 'kaminari', 'da7d78e171f65bc3cf942a6f619c909e', 'th39pimp', 'test', '0', '2005-01-05 07:39:02', '0000-00-00 00:00:00', '1'),
(256, 'Nelson', 'Guevara', 'teton_g@yahoo.com', 'teton_g', '713202a391facaf27aab568d95bdc68f', 'oysters', 'test', '0', '2005-01-05 09:27:56', '0000-00-00 00:00:00', '1'),
(257, 'Michael', 'Vedonia', 'mike_vedonia@yahoo.com', 'Mike Vedonia', 'dd429cd4e1426c26acb529d8e9cc711d', 'chariza', 'test', '0', '2005-01-05 11:06:44', '0000-00-00 00:00:00', '1'),
(258, 'Adelberto', 'Baniqued', 'abbaniq@yahoo.com', 'abbaniq', '1fe3e07aeb0a317d943e610d4a8a9c28', '0747', 'test', '0', '2005-01-05 11:30:49', '0000-00-00 00:00:00', '1'),
(259, 'joel', 'dungca', 'knight_wind29@yahoo.com', 'knight_wind29', 'cb3a20744063cffd3959f6af9a8254d2', 'f19065n', 'test', '0', '2005-01-05 12:33:38', '0000-00-00 00:00:00', '0'),
(260, 'Michael', 'Root', 'mlr679@yahoo.com', 'mike79', '7fe91488e1dcd02451f9aa305557a9b7', 'muy79', 'test', '0', '2005-01-05 13:25:36', '0000-00-00 00:00:00', '0'),
(261, 'Lemuel', 'Villenas', 'lhemski@yahoo.com', 'lhem', 'e8fbc1f03504ddffc52a9e6dab5e204d', 'scooter', 'test', '0', '2005-01-05 14:21:31', '0000-00-00 00:00:00', '1'),
(262, 'ian', 'palmones', 'ibpalmones.cec.chiyodaco@', 'ianbp', 'fe9122fbfb11c241becadc9fd30c0abb', 'pdntspa', 'test', '0', '2005-01-05 16:56:01', '0000-00-00 00:00:00', '1'),
(263, 'Jerome', 'Bondoc', 'bugslife71@yahoo.com', 'bugslife71', '3c9447e3247bb6d9aa3d88ae807ecd18', 'beetle', 'test', '0', '2005-01-05 20:30:47', '0000-00-00 00:00:00', '0'),
(264, 'cyril', 'cartojano', 'ccartojano@yahoo.com', 'chappyboy', 'b59696844a87d645acc20db0586df380', 'nebaescyro', 'test', '0', '2005-01-05 21:58:16', '0000-00-00 00:00:00', '1'),
(265, 'Allyn', 'Alpajaro', 'aalpajar@yahoo.com', 'SilverSurfer', 'e744ff6758af846a8b5e5a8b1f4112ae', 'brisbane', 'test', '0', '2005-01-06 11:22:40', '0000-00-00 00:00:00', '1'),
(266, 'Emmanuel', 'Pimentel', 'y3ah00@yahoo.com', 'y3ah', 'c38660c31d0851f75da32c262791a54c', 'skull1', 'test', '0', '2005-01-06 14:02:33', '0000-00-00 00:00:00', '0'),
(267, 'vincent', 'ablis', 'vincentedralin@yahoo.com', 'vincentedralin', '138be415567207bd4abf1d21dc4e4a47', 'taren', 'test', '0', '2005-01-06 14:07:48', '0000-00-00 00:00:00', '1'),
(269, 'danny', 'samson', 'idanny555@yahoo.com', 'danny', '604f1afea60bef31a3ee90003b740f00', 'vanessaeunice', 'test', '0', '2005-01-07 12:40:28', '0000-00-00 00:00:00', '0'),
(270, 'adrian joseph', 'farrales', 'adrianjcfarrales@yahoo.co', 'xanatos', '732fdfd13d45161403b1b1b4f8c7a7d9', 'gago123', 'test', '0', '2005-01-07 13:54:00', '0000-00-00 00:00:00', '1'),
(271, 'petronilo junnel', 'montenegro', 'pjlm_04@yahoo.com', 'pjlm', '3128198d06f1ff7aa6c74c3928d4f1c2', 'junnel', 'test', '0', '2005-01-07 14:15:03', '0000-00-00 00:00:00', '0'),
(272, 'maynard', 'bagtasos', 'bagtasosmay@lycos.com', 'natleng', 'bb8e2dab3166b2bfd98281adffb7522e', 'godisgood', 'test', '0', '2005-01-07 15:50:57', '0000-00-00 00:00:00', '1'),
(273, 'Mark Ronnie', 'Pidlaoan', 'sgt_pepper_123@yahoo.com', 'roadhitter', '74452ee8e5f68b931a5ad48482f2989b', 'gmily', 'test', '0', '2005-01-08 10:46:26', '0000-00-00 00:00:00', '1'),
(274, 'macloyd', 'garcia', 'topryder4ever@yahoo.com', 'topryder4ever', '3899dcbab79f92af727c2190bbd8abc5', 'ninja', 'test', '0', '2005-01-08 13:50:18', '0000-00-00 00:00:00', '1'),
(275, 'abraham', 'mendoza', 'abbi0922@yahoo.com', 'mendoza88359594', 'ef55977ed8344f320970d3a0d9cf7ead', 'rorcfec9qnbd', 'test', '0', '2005-01-08 18:16:06', '0000-00-00 00:00:00', '1'),
(276, 'Jon', 'Gan', 'avespaguy@yahoo.com', 'avespaguy', '3658d56fa7574b517fc08f71c8d7bbe5', 'srx', 'test', '0', '2005-01-08 21:33:34', '0000-00-00 00:00:00', '1'),
(277, 'marvin dave', 'tapia', 'tomben09@yahoo.com', 'vhinxrm1', '80c74513e7126a4d94574653b1b7f86d', 'kaiser', 'test', '0', '2005-01-08 22:29:09', '0000-00-00 00:00:00', '1'),
(278, 'Christopher', 'Unciano', 'uboy1102@yahoo.com', 'uboy1102', '27467936c3428030f089db9d05d3bdab', 'jhen1102', 'test', '0', '2005-01-09 12:47:35', '0000-00-00 00:00:00', '1'),
(279, 'eyrol', 'paloma', 'epalo@amkor.com', 'mythus', '59606609c6f2b0f4ac81167fe123c3f1', 'nemesis', 'test', '0', '2005-01-09 13:43:18', '0000-00-00 00:00:00', '1'),
(280, 'Cyrus Jarwin', 'Riveral', 'cyrusjarwin@yahoo.com', 'cyrusjarwin', '6818bab4da85a3a138cdfa35cfc7a64f', 'valerie', 'test', '0', '2005-01-09 20:31:28', '0000-00-00 00:00:00', '1'),
(281, 'edward', 'rimano', 'edward_rimano@yahoo.com', 'dragster', '720bab3e0415f3b360d83905e0757f60', '9402594', 'test', '0', '2005-01-10 10:13:09', '0000-00-00 00:00:00', '1'),
(282, 'Ashley Vincent', 'Albano', 'optiklenz13@hotmail.com', 'optiklenz13', '69d57defc0123b2c2757f05c7e157cd2', 'leifallen', 'test', '0', '2005-01-10 10:35:25', '0000-00-00 00:00:00', '0'),
(283, 'kristian', 'pimentel', 'krispi32@gmail.com', 'krispi32', '4a296f3c57214c44be33d3dd5d2909a0', 'chesse', 'test', '0', '2005-01-10 11:09:56', '0000-00-00 00:00:00', '1'),
(284, 'Arwin', 'Tapican', 'rwyn_13@yahoo.com.sg', 'Arwin', '23b7a5daadc40515a2936d51facd108c', 'watari', 'test', '0', '2005-01-10 12:09:57', '0000-00-00 00:00:00', '1'),
(285, 'virgilio', 'brito', 'vergel76@lycos.com', 'vergel', '045438714b0588c9f87bc417782d6cd5', 'hunterx', 'test', '0', '2005-01-10 12:14:49', '0000-00-00 00:00:00', '1'),
(286, 'JERIC', ' AHAT', 'jeric_ahat@wgasuperferry.', 'el_sombrero', '361249aef1e824889bfdc08f19825cc6', 'TSUNAMI2004', 'test', '0', '2005-01-10 12:53:48', '0000-00-00 00:00:00', '1'),
(287, 'Ace', 'Arrabe', 'asyong@skateboard.com', 'asyong', 'bfb2e411d58024d52f1bcf3c4bdc42af', 'arrabe', 'test', '0', '2005-01-10 13:01:05', '0000-00-00 00:00:00', '1'),
(288, 'acilo', 'peligro', 'acilop@yahoo.com', 'acilop', '209d439cb668c11fc8657c4d90dee1d2', '123098', 'test', '0', '2005-01-10 16:49:24', '0000-00-00 00:00:00', '1'),
(289, 'dexter', 'manubay', 'chingy_00000@yahoo.com', 'megzter', '7cf2ad7e2c43ef62fed0f854befbb2a2', 'chiniga', 'test', '0', '2005-01-10 20:42:14', '0000-00-00 00:00:00', '1'),
(290, 'richard', 'ferrer', 'rdf2074@yahoo.com', 'rdf2074', '90f2c9c53f66540e67349e0ab83d8cd0', 'p@ssword', 'test', '0', '2005-01-10 23:23:33', '0000-00-00 00:00:00', '0'),
(291, 'Rodulfo Jr.', 'Monteros', 'longshot_1977@yahoo.com', 'montoy', '68e59a8ef2786d57baacf508f2b8ca19', '102377', 'test', '0', '2005-01-11 02:52:39', '0000-00-00 00:00:00', '1'),
(292, 'Hilario', 'Tejuco', 'faot2004@yahoo.com', 'scashie', '55f9c405bd87ba23896f34011ffce8da', 'maverick', 'test', '0', '2005-01-11 10:57:28', '0000-00-00 00:00:00', '1'),
(293, 'mike', 'aguilar', 'm_aguilar1201@yahoo.com', 'mike aguilar', '1a9293c661b533d7f975d69380df11fb', 'guzman', 'test', '0', '2005-01-11 16:48:44', '0000-00-00 00:00:00', '1'),
(294, 'vinson', 'palasigue', 'vinson_80@yahoo.com', 'vinson_80', '6e07027548eaa76a641781f1721fe784', 'bred739', 'test', '0', '2005-01-12 06:35:15', '0000-00-00 00:00:00', '1'),
(295, 'Michael', 'Ande', 'charliemike07@yahoo.com', 'charliemike', '0a8f2d3cd88ff251713c2780e23db9ba', 'bigbike', 'test', '0', '2005-01-12 11:06:43', '0000-00-00 00:00:00', '1'),
(296, 'henry', 'angeles', 'hfangeles@rcbc.com', 'kitkat', 'dff6cf8ca8588a24e670d1056550bdd4', 'kitkat1230', 'test', '0', '2005-01-12 19:18:13', '0000-00-00 00:00:00', '0'),
(297, 'amiel', 'mateo', 'amiel_mat@yahoo.com', 'amiel', '13632c97439beb0cf3239688a15254e4', 'ux', 'test', '0', '2005-01-13 14:30:19', '0000-00-00 00:00:00', '1'),
(298, 'Jose', 'Francisco II', 'boklog11@yahoo.com', 'boklog11', 'fa90819fedb5501012b15ca1c24c64f1', 'arguz', 'test', '0', '2005-01-13 15:44:21', '0000-00-00 00:00:00', '1'),
(299, 'Michael', 'Jimenez', 'mickoy_jimenez@yahoo.com', 'dbestrider', 'b338fc6bcf5ed1367102e832061b3521', 'maikeruxp', 'test', '0', '2005-01-14 08:57:29', '0000-00-00 00:00:00', '1'),
(300, 'jun', 'escolano', 'junescolano@yahoo.com', 'junescolano', 'ec5528409b063c7ae49ea5cee8c53f2e', 'junixs', 'test', '0', '2005-01-14 09:06:25', '0000-00-00 00:00:00', '1'),
(301, 'michael', 'cortez', 'michaeldale20@yahoo.com', 'michaeldale20', 'b1c419decfbc7624427d5e4457ce43c4', 'maryrose', 'test', '0', '2005-01-15 18:33:36', '0000-00-00 00:00:00', '1'),
(302, 'denny', 'sytangco', 'ppconst@pldtdsl.net', 'gembherds', 'd2670d25508e6e49903b4fd554743c9c', '080700', 'test', '0', '2005-01-16 11:21:27', '0000-00-00 00:00:00', '1'),
(303, 'Carlo', 'Chancoco', 'Chanks0716@yahoo.com', 'chanks0716', '0d107d09f5bbe40cade3de5c71e9e9b7', 'letmein', 'test', '0', '2005-01-16 13:30:54', '0000-00-00 00:00:00', '1'),
(304, 'Emmanuel Mari', 'Valdes', 'ekvaldes@unionbankph.com', 'em2', '5e90ae5f6eb12b3f3e3c86c0409de103', '0207', 'test', '0', '2005-01-17 00:39:41', '0000-00-00 00:00:00', '0'),
(305, 'Arnold', 'Laparan', 'bzerr@amkor.com', 'alapa', 'd437df002f7a5c8555c107af8a643977', '135246', 'test', '0', '2005-01-17 06:57:10', '0000-00-00 00:00:00', '0'),
(306, 'joseph', 'sy', 'eidosz_13@yahoo.com', 'bowzer', 'cb07901c53218323c4ceacdea4b23c98', 'joseph', 'test', '0', '2005-01-17 12:26:11', '0000-00-00 00:00:00', '1'),
(307, 'joy', 'gabriel', 'g_cube_26@yahoo.com', 'yohj', 'b8b40189f4bc5dced5f234141a0aa62b', 'reanna', 'test', '0', '2005-01-17 18:48:00', '0000-00-00 00:00:00', '1'),
(308, 'Charlie', 'Ong', 'charlie_ong1980@yahoo.com', 'charlie_ong', '7cde665ca2b03080fd78026f416c61c6', '9234575', 'test', '0', '2005-01-18 04:13:43', '0000-00-00 00:00:00', '1'),
(309, 'Bong', 'Baltazar', 'asbaltazar2004@yahoo.com', 'compaq2100', 'b81da59aafc75f5693c722b9d72b2d09', 'may15640', 'test', '0', '2005-01-18 08:02:16', '0000-00-00 00:00:00', '1'),
(310, 'elpidio', 'tindugan jr.', 'flex_0829@yahoo.com', 'flex', 'b8b771865a95272b0efc2c15655e5855', 'yarity', 'test', '0', '2005-01-19 00:11:13', '0000-00-00 00:00:00', '1'),
(311, 'Bernard', 'Borabon', 'few_gud_men@yahoo.com', 'Identity', '5ebe2294ecd0e0f08eab7690d2a6ee69', 'secret', 'test', '0', '2005-01-19 00:42:24', '0000-00-00 00:00:00', '1'),
(312, 'Ludi', 'Lunar', 'lunar_ludi@hotmail.com', 'Zoom Raider', '80a6e7706862a2f7ef6c35f79d5e7d83', 'Raider150', 'test', '0', '2005-01-19 08:11:45', '0000-00-00 00:00:00', '1'),
(313, 'berlin', 'catapang', 'berlincatapang@yahoo.com', 'mohamad_berlin', '0e38b4fcab7e2f2083f49a1d14521f46', 'nilreb27', 'test', '0', '2005-01-19 13:25:15', '0000-00-00 00:00:00', '0'),
(314, 'Pedro', 'Damian J.r', 'harry_petermon25@yahoo.co', 'harry_petermon25@yahoo.co', '9b4319f389bf4ff53890e7c2b388fc1a', 'jonmon25', 'test', '0', '2005-01-19 14:57:15', '0000-00-00 00:00:00', '0'),
(315, 'MEL', 'VALLES', 'MEL_C_VALLES@MAIL.COM', 'mc_valles', 'ca50f596aa835d962b1f9271223d871a', 'MAIL123', 'test', '0', '2005-01-19 22:42:22', '0000-00-00 00:00:00', '1'),
(316, 'Elieser', 'Moroña', 'elmoro@globalink.net.ph', 'elieser', 'cd978a80732d0890c8620d9bdb90b8ac', 'elmoro', 'test', '0', '2005-01-20 08:43:09', '0000-00-00 00:00:00', '1'),
(317, 'Genley', 'Acebuche', 'ngayex@yahoo.com', 'ngayex', 'e5fb0cda12f90dc4341247ddab54d1da', 'spyder', 'test', '0', '2005-01-21 17:29:23', '0000-00-00 00:00:00', '1'),
(318, 'lorezo', 'onrubia', 'nino_onrubia@yahoo.com', 'bugoi', 'e5f0dd78ba45a79578fafbb799e4d0b0', 'bugoy', 'test', '0', '2005-01-21 23:35:37', '0000-00-00 00:00:00', '1'),
(319, 'lawrence', 'velez', 'racingkit_747@yahoo.com', 'racingkit_747', 'f3c37f795b84049f45884f742de06f2d', 'castrol', 'test', '0', '2005-01-22 11:19:57', '0000-00-00 00:00:00', '1'),
(320, 'Nonie', 'Cambay', 'cfcmby99@eim.ae', 'Hopiaboy', 'b38002fdb5ca19a5b5274c319a0d90a1', 'pebc3798', 'test', '0', '2005-01-22 20:42:05', '0000-00-00 00:00:00', '1'),
(321, 'WILBERT', 'SY', 'w_syling@edsamail.com.ph', 'selectaboy', '1bd3e197e43c5004f1e0c2831fa27604', 'SHARON', 'test', '0', '2005-01-23 09:07:26', '0000-00-00 00:00:00', '0'),
(322, 'enridel', 'bo', 'edel7371@yahoo.com', 'edel', '82488508fddf2e6b449cee28940a6492', 'resli', 'test', '0', '2005-01-23 14:53:51', '0000-00-00 00:00:00', '1'),
(323, 'dennis', 'dello', 'denzyo@yahoo.com', 'denzyo', '2fcc67ce5435c12a27ac9db39ef692f7', 'bankin', 'test', '0', '2005-01-23 23:49:27', '0000-00-00 00:00:00', '1'),
(324, 'Chris', 'Enriquez', 'christopher.enriquez@link', 'migo98', '6b34fe24ac2ff8103f6fce1f0da2ef57', 'chris', 'test', '0', '2005-01-24 06:58:43', '0000-00-00 00:00:00', '1'),
(325, 'aris', 'satorre', 'arissatorre@yahoo.com', 'arisyz', '5c9639ef93856358ab9cce543d961fea', 'yz-250', 'test', '0', '2005-01-24 15:13:24', '0000-00-00 00:00:00', '1'),
(326, 'Dan Erwin', 'Nabayo', 'xtrm_80@yahoo.com', 'extreme_heat', '431f3edef095a17499180601fb3352c0', '561974', 'test', '0', '2005-01-24 19:39:19', '0000-00-00 00:00:00', '1'),
(327, 'roger', 'perfecto', 'roger_perfecto@yahoo.com', 'oer', 'fa2816b06efaed8ca4bc19fd64d135f3', 'rdp143', 'test', '0', '2005-01-24 21:53:27', '0000-00-00 00:00:00', '1'),
(328, 'Jun', 'Rellores', 'citiridersclub@yahoo.com', 'citiriders club', '6bf9786264c6242495a237d3861f8b40', '112704', 'test', '0', '2005-01-24 22:20:49', '0000-00-00 00:00:00', '1'),
(329, 'Mariel', 'Arenas', 'mariel@egiftdelivery', 'motorhead', 'a95d936c561131f11a61e45ef4821e30', 'mcmotor', 'test', '0', '2005-01-25 06:54:26', '0000-00-00 00:00:00', '0'),
(330, 'FRANCIS', 'DE LEON', 'cisdl@yahoo.com', 'ysr freak', '4064364b46b47ad7aeab15697d8d78c8', 'fzrr', 'test', '0', '2005-01-25 13:29:04', '0000-00-00 00:00:00', '1'),
(331, 'jay', 'morales', 'maget@digitelone.com', 'maget', '8b772a0c3a4a1c89fc4733acda91d441', 'wolfyz', 'test', '0', '2005-01-25 14:21:21', '0000-00-00 00:00:00', '1'),
(332, 'Jeffrey', 'Cruz', 'jepok22@yahoo.com', 'jepok22', '75b6e86d67622c95d1cebc75119df1c2', 'moneth', 'test', '0', '2005-01-25 14:28:45', '0000-00-00 00:00:00', '1'),
(333, 'Sherwin William A. Cuasay', 'Cuasay', 'tango_el_grito@yahoo.com', 'swac_slayer', '1c338008976b0b890c3d1b9431dc0646', 'swac27', 'test', '0', '2005-01-25 16:06:06', '0000-00-00 00:00:00', '1'),
(334, 'carlito noel', 'ramos', 'poyettenoel@yahoo.com', 'Ramstar', '5f9901fc60b769b523d0dd8e79b3fe08', 'hammer', 'test', '0', '2005-01-25 22:21:23', '0000-00-00 00:00:00', '1'),
(335, 'Dickenson', 'Yuga', 'mcmaster_00@yahoo.com', 'mcmaster', 'a05c97756902e487ca8ec2c9672dad78', 'thepower', 'test', '0', '2005-01-26 11:29:46', '0000-00-00 00:00:00', '1'),
(336, 'Melvin', 'Vicente', 'bentot24@hotmail.com', 'mondrian', '0f42877a5440b9497e1af2e99d8ad391', 'vinvintot', 'test', '0', '2005-01-27 00:13:23', '0000-00-00 00:00:00', '1'),
(337, 'Alvin', 'De Leon', 'alvinldeleon@yahoo.com', 'alvinldeleon', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'test', '0', '2005-01-27 10:19:03', '0000-00-00 00:00:00', '1'),
(338, 'marvin', 'mendoza', 'banong101179@yahoo.com', 'blaupunkt', 'e2f76573d21aa51c0de8bd3a1d85868b', 'banong', 'test', '0', '2005-01-27 12:06:48', '0000-00-00 00:00:00', '1'),
(339, 'junjun', 'tan', 'retanjr@yahoo.com', 'juntan', '5f4dcc3b5aa765d61d8327deb882cf99', 'password', 'test', '0', '2005-01-27 12:50:28', '0000-00-00 00:00:00', '1'),
(340, 'Cris', 'Del Mundo', 'crisanto.delmundo@senate.', 'crisdel', '4af09080574089cbece43db636e2025f', 'elizabeth', 'test', '0', '2005-01-27 17:58:04', '0000-00-00 00:00:00', '1'),
(341, 'Bernie', 'San Pedro', 'jologssanjuan@yahoo.com', 'einreb', 'dbe9323204b7b19073fbf8a2b078d94f', 'bxm123', 'test', '0', '2005-01-27 22:47:33', '0000-00-00 00:00:00', '0'),
(342, 'emmanuel', 'hernandez', 'emil_hernandezph@yahoo.co', 'ray stinger', '10b46ad1a5cef9e4880f6e04469ff486', 'eminette', 'test', '0', '2005-01-28 08:17:22', '0000-00-00 00:00:00', '1'),
(343, 'emmanuel', 'hernandez', 'emil_hernandezph@yahoo.co', 'ray stinger1', '10b46ad1a5cef9e4880f6e04469ff486', 'eminette', 'test', '0', '2005-01-28 08:27:50', '0000-00-00 00:00:00', '1'),
(344, 'harold', 'cabrera', 'saint_j8@yahoo.com', 'saint_j8', 'dad3a37aa9d50688b5157698acfd7aee', 'xxxxxx', 'test', '0', '2005-01-28 10:37:16', '0000-00-00 00:00:00', '1'),
(345, 'Richard', 'Mendoza', 'www.full_chard@yahoo.com', 'full_chard', 'cfcd7931ab079ae3848355f2a7e0615f', 'mendoza', 'test', '0', '2005-01-28 10:48:39', '0000-00-00 00:00:00', '0'),
(346, 'yeye', 'batasin', 'yeyebatasin@yahoo.com', 'yeye', 'd9d5cba7c445bd9f8dfb1f8616b2380d', 'yeye', 'test', '0', '2005-01-28 11:06:54', '0000-00-00 00:00:00', '1'),
(347, 'Christian', 'Medina', 'ianpmedina02@yahoo.com', 'freak', 'b29af47e38864c60fa81158291fe40a1', 'corinne', 'test', '0', '2005-01-28 17:58:12', '0000-00-00 00:00:00', '1'),
(348, 'raul', 'guillermo', 'mr_swabe012000', 'swabe', '81dc9bdb52d04dc20036dbd8313ed055', '1234', 'test', '0', '2005-01-28 20:52:26', '0000-00-00 00:00:00', '0'),
(349, 'khriss', 'castillo', 'khrissc@yahoo.com', 'ting', '058ce95f6fd5fba24d743ec11fbad655', 'ting16', 'test', '0', '2005-01-29 18:02:13', '0000-00-00 00:00:00', '1'),
(350, 'Jesus', 'Liwanag', 'jayliteph@yahoo.com', 'Liwanag', 'e110e8dbd2a229e47c0acecc8d696f75', 'bullhead', 'test', '0', '2005-01-31 09:56:14', '0000-00-00 00:00:00', '0'),
(351, 'mylix', 'licayan', 'mylix14_dealer@hotmail.co', 'mylix', '4735da99292f2930f3fd9b0c0c7dab2d', 'methuselah', 'test', '0', '2005-01-31 21:46:11', '0000-00-00 00:00:00', '1'),
(352, 'Joriz', 'Balderrama', 'joriz_b@yahoo.com', 'joriz_b', 'e4c8b323f1b500447e9f35e93ecfde0e', 'rizandr0', 'test', '0', '2005-02-01 14:57:55', '0000-00-00 00:00:00', '1'),
(353, 'Darwin', 'Ocampo', 'darwin@takatsuki.co.jp', 'oldarz09', '63c706509f1dde845cb0315426159a92', 'oldarz09', 'test', '0', '2005-02-01 16:00:15', '0000-00-00 00:00:00', '1'),
(354, 'Pedro', 'Damian J.r', 'harry_petermon25@yahoo.co', 'harry_petermon25@yahoo.co', '9b4319f389bf4ff53890e7c2b388fc1a', 'jonmon25', 'test', '0', '2005-02-01 22:44:28', '0000-00-00 00:00:00', '1'),
(355, 'Ariel', 'Chua', 'arielchua_23@yahoo.com', 'Yheng', 'b26c49a0a24ca372b4be52887c382592', '112379', 'test', '0', '2005-02-02 08:32:57', '0000-00-00 00:00:00', '1'),
(356, 'roberto', 'nolasco', 'catgas16@yahoo.com', 'roberto n. nolasco', 'f5163c9b74cf6c07f92381527c84e3b9', 'cbrl', 'test', '0', '2005-02-02 09:03:40', '0000-00-00 00:00:00', '1'),
(357, 'stef', 'fred', 'stef_fred33@yahoo.com', 'stefred', 'e3979f291bf122eb0ce1675c19250859', 'wheresmycardude', 'test', '0', '2005-02-02 11:27:07', '0000-00-00 00:00:00', '0'),
(358, 'frank', 'castle', 'kra_gaido@yahoo.com', 'Gaido', '93eb91d163600b894539014e9a047887', 'dudewheresmycar', 'test', '0', '2005-02-02 13:31:14', '0000-00-00 00:00:00', '1'),
(359, 'toto', 'corneja', 'toto_corneja@yahoo.com', 'toto_corneja', 'a38003520cbfbaa18eadad189fa95fbd', 'parcomm', 'test', '0', '2005-02-03 09:54:36', '0000-00-00 00:00:00', '1'),
(360, 'jhon', 'palma', 'jhon20payton@yahoo.com', 'jhonpalma', '477f74e90332a362aee9c2595da2e9d5', 'jhonwheng', 'test', '0', '2005-02-03 12:37:23', '0000-00-00 00:00:00', '1'),
(361, 'Erwin', 'Mendoza', 'erwin.ph@eastwestseed.com', 'erwin', '38a5d9570abdc35a5cf3588a926130c6', 'marwin', 'test', '0', '2005-02-04 15:28:23', '0000-00-00 00:00:00', '1'),
(362, 'teodolfo jr', 'dalen', 'trdalen@yahoo.com', 'snow838648', 'b932a6ec0f3bef993326983f5c8808eb', 'snowman', 'test', '0', '2005-02-04 15:58:58', '0000-00-00 00:00:00', '0'),
(363, 'teodolfo jr', 'dalen', 'trdalenjr@hotmail.com', 'snow838CL_2kA', 'b932a6ec0f3bef993326983f5c8808eb', 'snowman', 'test', '0', '2005-02-04 16:08:09', '0000-00-00 00:00:00', '0'),
(364, 'joseph', 'bergonia', 'renzeph@yahoo.com', 'jc_bergonia', 'e0e84a49e0dd74e8ea52b4d49473f94d', 'josephcbergonia', 'test', '0', '2005-02-04 18:01:32', '0000-00-00 00:00:00', '1'),
(365, 'dax', 'khankaloo', 'dax_khankaloo@yahoo.com', 'daxkhankaloo', 'ec5bc7bc77c9a29d94e1827395084a1c', 'onip', 'test', '0', '2005-02-04 19:57:58', '0000-00-00 00:00:00', '1'),
(366, 'manuel', 'diamante', 'etnamaid@yahoo.com', 'manuel Diamante III', '9f63217eeb4f7c36019f4b6b4bffd027', '2430november', 'test', '0', '2005-02-05 11:10:51', '0000-00-00 00:00:00', '1'),
(367, 'syd', 'sason', 'sydsason@yahoo.com', 'sydson', 'ae847b6f1c16ec0bd300205c4f60bac7', '192504', 'test', '0', '2005-02-07 18:07:57', '0000-00-00 00:00:00', '1'),
(368, 'Melvin', 'Domingo', 'u4bc@yahoo.com', 'u4bc', 'dabd018f98476c1f6eb2f23e8d9b8920', 'melvin', 'test', '0', '2005-02-08 12:00:19', '0000-00-00 00:00:00', '1'),
(369, 'Ramon', 'Siojo', 'boydive@gmail.com', 'Dukhati', '55bddb726c7edb55c837a735edacda53', 'Gabriel4', 'test', '0', '2005-02-08 12:19:26', '0000-00-00 00:00:00', '1'),
(370, 'Gordon', 'McKenzie', 'mckegid@bp.com', 'Flash', 'bf2c44e6fc09515648b91b1bb4ec3f5f', 'Flash', 'test', '0', '2005-02-08 15:28:43', '0000-00-00 00:00:00', '1'),
(371, 'Allan', 'Tapado', 'azt_71@yahoo.com', 'kmx_125', 'b13bc9bcad362aa4399d606a3a529eea', 'azt82571', 'test', '0', '2005-02-08 15:33:06', '0000-00-00 00:00:00', '1'),
(372, 'Darwin', 'Ang', 'niwrad33@yahoo.com', 'niwrad33', 'd1233c7274abadb3c7b6863bf51fbdfa', 'counterstrike', 'test', '0', '2005-02-09 21:33:23', '0000-00-00 00:00:00', '1'),
(373, 'Felix', 'Godito', 'xilef1899@yahoo.com', 'Felix A. Godito', '959b6c3fdc6ce4e08176e783d01ffc5d', 'teresita', 'test', '0', '2005-02-10 13:46:41', '0000-00-00 00:00:00', '1'),
(374, 'dennis', 'santos', 'den_niss99@yahoo.com', 'dennis', '7daacea5f373b4c1c054158b126d317f', 'dennis', 'test', '0', '2005-02-11 09:10:18', '0000-00-00 00:00:00', '1'),
(375, 'Lawrence', 'Gamboa', 'dj_killerlook@yahoo.com', 'dj_killerlook', 'abcbcc05bbc9874a56ce7b69061f9b9c', 'killerloop', 'test', '0', '2005-02-11 12:26:23', '0000-00-00 00:00:00', '1'),
(376, 'johnson', 'lacaden', 'johnson_qualityparts@yaho', 'genesis', 'd16244f3c65053413ccc6272a9119967', 'jonlet', 'test', '0', '2005-02-11 12:50:19', '0000-00-00 00:00:00', '1'),
(377, 'Noel', 'Marquez', 'batman172307@yahoo.com', 'noelski', '8da1e341b36007818bfbffc0d585a401', 'partok', 'test', '0', '2005-02-11 15:03:06', '0000-00-00 00:00:00', '1'),
(378, 'Erwin', 'Lontok', 'erwin0612@yahoo.com', 'spyk', 'd86cf6380cdce3ffb56e0dab89870cad', 'talentado', 'test', '0', '2005-02-11 16:41:26', '0000-00-00 00:00:00', '0'),
(379, 'George', 'Luna', 'geo_lu@yahoo.com', 'geo_lu', '675a629821799f1f7e24cdd2958ee16c', 'delljhvh', 'test', '0', '2005-02-11 18:11:33', '0000-00-00 00:00:00', '1'),
(380, 'Felix Alfredo', 'Martinez', 'felix_alfredo_c_martinez@', 'zippo', '98db746840b6d444d4c512487b0e6c44', 'polaris', 'test', '0', '2005-02-11 18:17:36', '0000-00-00 00:00:00', '1'),
(381, 'Arrabe', 'Ace', 'semai@globextm.com.ph', 'alas', 'bfb2e411d58024d52f1bcf3c4bdc42af', 'arrabe', 'test', '0', '2005-02-13 10:39:37', '0000-00-00 00:00:00', '0'),
(382, 'macky', 'oliveros', 'macky_oliveros@yahoo.com', 'macky_oliveros', '2c3c1cba1849649fcf43d1d5163eb15a', 'makaria', 'test', '0', '2005-02-14 14:49:23', '0000-00-00 00:00:00', '0'),
(383, 'daniel', 'catchuela', 'itenpus@yahoo.com', 'daniel', 'aa47f8215c6f30a0dcdb2a36a9f4168e', 'daniel', 'test', '0', '2005-02-14 15:52:40', '0000-00-00 00:00:00', '0'),
(384, 'david steven', 'rosal', 'lhoy_rosal@yahoo.com', 'sl1ck19', '358951b95c68bee485753f6cbd2066a0', 'sl1ck19', 'test', '0', '2005-02-15 09:59:39', '0000-00-00 00:00:00', '1'),
(385, 'adel', 'lardizabal', 'jjoonn2x@yahoo.com.ph', 'jjoonn2x', 'd4388c4d4b47c6655b16fe5b13184b32', 'doraemon', 'test', '0', '2005-02-15 11:09:34', '0000-00-00 00:00:00', '0'),
(386, 'ronel', 'guimbao', 'oningg@yahoo.com', 'oninggdrive', '1c4d9eafe6ac29adf9b00133b9a74b36', 'shynne', 'test', '0', '2005-02-15 15:26:37', '0000-00-00 00:00:00', '1'),
(387, 'Ronelo', 'Tejada', 'rontjd@hotmail.com', 'foxraider', 'eb0fd8a723a8d922f83811e9ba0db098', '122301', 'test', '0', '2005-02-16 10:36:55', '0000-00-00 00:00:00', '1'),
(388, 'mike', 'apo', 'astro_luigi@yahoo.com', 'simple_mike', 'a1db26579183eaa4b08c776a775d384d', '61601168', 'test', '0', '2005-02-16 18:59:17', '0000-00-00 00:00:00', '0'),
(389, 'Jeffrey', 'Bamba', 'zhea_zed@yahoo.com', 'zhea', '3720f54e919b22cce392b05de57102dd', 'wolfgang', 'test', '0', '2005-02-17 09:04:34', '0000-00-00 00:00:00', '1'),
(390, 'jarell', 'remorin', 'jarellremorin@yahoo.com', 'nano', '204f2fb757c85d06552418ea31a4ba61', 'melymay', 'test', '0', '2005-02-17 11:26:14', '0000-00-00 00:00:00', '1'),
(391, 'Colin', 'Rattigan', 'colin.rattigan@ogilvy.com', 'crattiganuk', '93101e00cde0b0e421eb84d08ef0e428', 'hjelmstad', 'test', '0', '2005-02-17 17:29:50', '0000-00-00 00:00:00', '0'),
(392, 'MARC', 'UNTALAN', 'mgcu_17@hotmail.com', 'MSP', 'd1a2b0432d9120cace50aa533b8fa738', 'UNTALAN', 'test', '0', '2005-02-17 21:22:01', '0000-00-00 00:00:00', '1'),
(393, 'REDFORD', 'AGUSTIN', 'RED4RD@yahoo.com', 'RED4RD', 'f544317b134d3622086c28e541726b30', 'pongred', 'test', '0', '2005-02-18 10:30:19', '0000-00-00 00:00:00', '0'),
(394, 'miguel', 'Magno', 'kennethmagno@hotmail.com', 'Kamote_1418', '9eb0c9605dc81a68731f61b3e0838937', 'miguel', 'test', '0', '2005-02-19 14:03:24', '0000-00-00 00:00:00', '1'),
(395, 'Edgardo,Jr', 'Buhay', 'jet_buhayjr@yahoo.com', '†jEt†™', '0204fcc0b9c16071eb1edc656d30a8ec', 'pasaway', 'test', '0', '2005-02-20 08:59:41', '0000-00-00 00:00:00', '0'),
(396, 'Lyrylle', 'Go', 'lyrylle@yahoo.com', 'thresh', '314816cd6adb724da2608e0c5abae91a', 'lord72', 'test', '0', '2005-02-21 06:55:01', '0000-00-00 00:00:00', '1'),
(397, 'matt', 'spencer', 'clarma2001@aol.com', 'clarma2001', '9d8a5fa66bbe31b56ca9ac6220d0c4b3', 'aolg0lf', 'test', '0', '2005-02-21 18:13:35', '0000-00-00 00:00:00', '1'),
(398, 'sara', 'birch', 'shbirch@talk21.com', 'shbirch', 'b3d97746dbb45e92dc083db205e1fd14', 'phoenix', 'test', '0', '2005-02-21 22:10:53', '0000-00-00 00:00:00', '1'),
(399, 'Lito', 'Dagodog', 'lito.dagodog@gmail.com', 'toyds', '043028cb85bf3166852eeec2896f562b', 'juliet143', 'test', '0', '2005-02-22 08:38:07', '0000-00-00 00:00:00', '1'),
(400, 'mark', 'lamanilao', 'markbandido@hellokitty.co', 'markbandido', 'ef58babb09196b7ee2fd05491783a600', 'rengel', 'test', '0', '2005-02-22 22:45:04', '0000-00-00 00:00:00', '1'),
(401, 'Laurie', 'Peters', 'laurie.peters@uk.bp.com', 'laurie', '291b6f592381712aa2ec1d861576da6d', 'silkmaion', 'test', '0', '2005-02-23 21:03:59', '0000-00-00 00:00:00', '1'),
(402, 'Randy', 'Laurinaria', 'ratsky_13@yahoo.com', 'randysl', 'd9e2b6e5852d9a04ca06e53f5b8de307', 'swiss', 'test', '0', '2005-02-24 07:41:08', '0000-00-00 00:00:00', '1'),
(403, 'raymond', 'de leon', 'mhong105@hotmail.com', 'mhong', '8c09761fe903cd46a9a988d17a6cb05c', 'myline', 'test', '0', '2005-02-24 17:44:45', '0000-00-00 00:00:00', '1'),
(404, 'jet', 'buhayjr', 'edgardo_buhay@yahoo.com', 'jet_buhayjr™', '0204fcc0b9c16071eb1edc656d30a8ec', 'pasaway', 'test', '0', '2005-02-27 09:42:03', '0000-00-00 00:00:00', '1'),
(405, 'daniel', 'zabala', 'spycruiser@yahoo.com', 'spycruiser', '84d961568a65073a3bcf0eb216b2a576', 'superman', 'test', '0', '2005-02-28 09:12:53', '0000-00-00 00:00:00', '1'),
(406, 'Maynard', 'Belen', 'Basechief@Viacomm.com.ph', 'Basechief_68', '4a62228c132feaf61a62d6df11a92f96', '051186', 'test', '0', '2005-03-02 06:40:24', '0000-00-00 00:00:00', '1'),
(407, 'dean paul', 'cunanan', 'deanpaul81@yahoo.com', 'dean', '6636e1322531bd6a9bf66f3c3aabd8d6', 'freeman', 'test', '0', '2005-03-02 20:26:16', '0000-00-00 00:00:00', '1'),
(408, 'Robert Paul', 'Cledera', 'robertpmcledera@hotmail.c', 'smileyCOW', '059c28b1a8eb8c8f4280f44b8f1ec80a', 'sonnybabie', 'test', '0', '2005-03-03 06:22:07', '0000-00-00 00:00:00', '1'),
(409, 'Martin Hercules II', 'Gino', 'martinsiix@ispx.com.ph', 'Hercules', '925d7518fc597af0e43f5606f9a51512', 'martin', 'test', '0', '2005-03-03 14:35:33', '0000-00-00 00:00:00', '1'),
(410, 'Philip Reiner', 'Porto', 'prap_42@yahoo.com', 'king_42', 'd68c118000c513cb54d7c4feeb1486f4', 'pagamus', 'test', '0', '2005-03-04 08:54:01', '0000-00-00 00:00:00', '1'),
(411, 'ian', 'bernardo', 'ianroy@info.com.ph', 'elmo', '039ae38fdaa57715c2abea48b4972d6f', 'tim0130', 'test', '0', '2005-03-04 10:56:52', '0000-00-00 00:00:00', '1'),
(412, 'Rafael', 'Cajefe', 'khyle_sixteen@yahoo.com', 'MUSKA', '1619df7011e973a59f5b7b19acedc871', 'rkhyle', 'test', '0', '2005-03-04 10:56:55', '0000-00-00 00:00:00', '1'),
(413, 'arvin jay', 'espino', 'idi_amin_jay@yahoo.com', 'arvinjay', '58ecf61a27ae901f846133fe0b6b8f40', 'stronger4u', 'test', '0', '2005-03-04 12:44:50', '0000-00-00 00:00:00', '1'),
(414, 'paul tristan', 'joson', 'nyawsky@hotmail.com', 'paul joson', '920de60ab24bdf7105846d004fdd6fc9', 'tantado', 'test', '0', '2005-03-04 15:16:27', '0000-00-00 00:00:00', '0'),
(415, 'Rollie', 'Magsalin', 'bprofxp@gmail.com', 'bprofxp', '82ef355970302a0eca3ed501ddd84a25', 'bastique', 'test', '0', '2005-03-05 23:01:34', '0000-00-00 00:00:00', '1'),
(416, 'EuGeNe', 'KoH', 'eugene28k@yahoo.com', 'eugene28k', 'b29e740c141241307a6257cfcf23180c', 'enthusiasm', 'test', '0', '2005-03-06 14:39:07', '0000-00-00 00:00:00', '1'),
(417, 'Rommel', 'Lopena', 'rglopena@7-eleven.com.ph', 'rglopena', '6a884c9da70ee96c399f86851119b049', 'sandman', 'test', '0', '2005-03-06 14:41:56', '0000-00-00 00:00:00', '1'),
(418, 'jon', 'carlos', 'jonbcarlos@yahoo.com', 'ponce13', '5b379f9c624f88fefc8b929f92de0f1e', 'badboi', 'test', '0', '2005-03-07 13:12:42', '0000-00-00 00:00:00', '1'),
(419, 'Paul', 'Garcia', 'paul.xt16@gmail.com', 'paul_xt16', '376a79fe6b63cfc433ddee2d5af35399', 'xp8400', 'test', '0', '2005-03-07 20:42:39', '0000-00-00 00:00:00', '1'),
(420, 'Jomar', 'Madriaga', 'jpmadriaga@agpi.com.ph', 'jomskie', '94e4b121aa9e515145683aeb7eb6f357', 'blacktunder', 'test', '0', '2005-03-08 10:37:48', '0000-00-00 00:00:00', '1'),
(421, 'anthony', 'dado', 'ddxph@yahoo.com', 'ddxph@yahoo.com', '8ba338f0ff7cb5c7f716161c2aeb3516', 'dodongx', 'test', '0', '2005-03-08 18:23:22', '0000-00-00 00:00:00', '1'),
(422, 'roel', 'bandong', 'roel_bandong@hotmail.com', 'zero99', 'a83d95f9a741528856464e567b34fe08', 'jopay99', 'test', '0', '2005-03-09 08:55:41', '0000-00-00 00:00:00', '1'),
(423, 'Joji', 'Ancheta', 'bedan93@yahoo.com', 'bedan93', '7abb7fcd99ee10bbe2981825a560c4a2', 'redlion', 'test', '0', '2005-03-09 11:52:35', '0000-00-00 00:00:00', '1'),
(424, 'george', 'muñoz', 'jerats2000@yahoo.com', 'jerts', 'e991b20a8196ae23087867bafd2d5c59', 'gwapito', 'test', '0', '2005-03-10 08:36:38', '0000-00-00 00:00:00', '1'),
(425, 'Garry', 'Maningas', 'garysm2004@yahoo.com', 'garysm2004', 'a480f72f7f57afd9dcb8d79ba290d34b', 'misgsm', 'test', '0', '2005-03-10 09:29:21', '0000-00-00 00:00:00', '1'),
(426, 'Alvin', 'Javier', 'alvinrj@abs.pinoycentral.', 'AlvinRJ', '52538ca7435e949255216dc47bdd5d87', 'genesis7', 'test', '0', '2005-03-10 11:29:37', '0000-00-00 00:00:00', '1'),
(427, 'Eric', 'Martinez', 'batusai_7@hotmail.com', 'Kei2', '1acf2b9d7343db52fe3ee04a9389eb7e', 'akinto', 'test', '0', '2005-03-10 16:25:39', '0000-00-00 00:00:00', '1'),
(428, 'Christopher', 'Acosta', 'cyacosta2004@yahoo.com', 'cyacosta', '572ca9f43b0238b288b07e9a656f7fae', 'superman0814', 'test', '0', '2005-03-11 08:46:17', '0000-00-00 00:00:00', '1'),
(429, 'Efren', 'Delos Reyes Jr.', 'frenskiss@yahoo.com', 'frenskiss', '7b8196e71468ed4cff88a53b97227e48', 'larend', 'test', '0', '2005-03-12 17:10:23', '0000-00-00 00:00:00', '1'),
(430, 'amiel', 'paulayan', 'amiel_p@yahoo.com', 'amiel_p', '3da217708db37e8634123a3250788394', 'rodelia', 'test', '0', '2005-03-13 03:47:51', '0000-00-00 00:00:00', '1'),
(431, 'crisanto', 'sor', 'naztjian@yahoo.com', 'tipos', '9845397788185cae430c50350ba2e7ca', '68325486', 'test', '0', '2005-03-14 15:01:08', '0000-00-00 00:00:00', '1'),
(432, 'Richard', 'Consuelo', 'rcons2003@yahoo.com', 'rcons', '814d06654ea432cb721e1209b4947621', 'cyrus', 'test', '0', '2005-03-15 16:55:28', '0000-00-00 00:00:00', '1'),
(433, 'david remar', 'arcangel', 'davidremar_arcangel@yahoo', 'k8t rider', '9354e56a28217acb5140eafebed59cb9', 'mabib22', 'test', '0', '2005-03-15 17:42:36', '0000-00-00 00:00:00', '0'),
(434, 'Rey', 'Uchi', 'greenNinja250@yahoo.com', 'GreenNinja250', 'ec0e2603172c73a8b644bb9456c1ff6e', 'batman', 'test', '0', '2005-03-16 15:11:31', '0000-00-00 00:00:00', '1'),
(435, 'darius', 'tenorio', 'dari_at@yahoo.com', 'dari_at', 'ab04e48dfbe04512530b2e12c58d10d5', '671975', 'test', '0', '2005-03-21 04:30:37', '0000-00-00 00:00:00', '1'),
(436, 'Roel', 'Sta ana', 'javen14phus@yahoo.com', 'javen14phus', 'f7a45df79fa3e2e5e18477937863137e', 'javen14', 'test', '0', '2005-03-21 10:44:08', '0000-00-00 00:00:00', '0'),
(437, 'John Rod', 'Vivar', 'wentong_018@hotmail.com', 'wentong', '78e1163dae00ec04e0c14ac860f179d4', 'kuting', 'test', '0', '2005-03-24 01:23:25', '0000-00-00 00:00:00', '1'),
(438, 'Remar Zebedee', 'De Vera', 'rzdevera@hotmail.com', 'remar.devera', '77ed6b1eee46f2897e0a99c5b8378a2a', 'DRUMMASTER', 'test', '0', '2005-03-24 10:48:31', '0000-00-00 00:00:00', '1'),
(439, 'carlo', 'quiogue', 'orlac_03@yahoo.com', 'orlac_03', '3bdae171e077adbc3dca25941e524fc5', 'camille', 'test', '0', '2005-03-24 11:37:12', '0000-00-00 00:00:00', '0'),
(440, 'Roy', 'Pabingwit', 'florifeh@yahoo.com', 'Roy', 'cdb6de50014c1e696f4b8c0c3fb0f708', 'Roy', 'test', '0', '2005-03-27 18:28:35', '0000-00-00 00:00:00', '1'),
(441, 'carlo', 'quiogue', 'orlacdalton@yahoo.com', 'orlaccamille', '3bdae171e077adbc3dca25941e524fc5', 'camille', 'test', '0', '2005-03-27 20:36:13', '0000-00-00 00:00:00', '0'),
(442, 'bartosz', 'ubyszewski', 'b.ubyszewski@wp.pl', 'bubyszew', '3ed7af31735caf1f48dd3004e640b6c6', 'bu2904', 'test', '0', '2005-03-28 02:19:04', '0000-00-00 00:00:00', '0'),
(443, 'Nolasco', 'Aguilar Jr', 'jon17ph@yahoo.com', 'jon17ph', '0911054d8ad47cc256400031197f3e97', 'ferrari', 'test', '0', '2005-03-28 13:07:47', '0000-00-00 00:00:00', '1'),
(444, 'Paolo', 'Dizon', 'embajadafil@yahoo.com', 'siops', '3bdae171e077adbc3dca25941e524fc5', 'camille', 'test', '0', '2005-03-30 14:10:05', '0000-00-00 00:00:00', '1'),
(445, 'Pedro', 'Damian J.r', 'harry_petermon25@yahoo.co', 'harry_petermon25@yahoo.co', '9b4319f389bf4ff53890e7c2b388fc1a', 'jonmon25', 'test', '0', '2005-03-30 22:52:11', '0000-00-00 00:00:00', '1'),
(446, 'salvador', 'capili', 'aboycapili@yahoo.com', 'aboy', '04a56d6545bc5a75e50f47490a51fc59', 'aboy', 'test', '0', '2005-03-31 15:14:55', '0000-00-00 00:00:00', '1'),
(447, 'Enrico', 'Bobier', 'ricksters_79@yahoo.com', 'ricksters_79', '5362a2faaa4447113c4978ee058c8e7c', '022779', 'test', '0', '2005-03-31 17:39:14', '0000-00-00 00:00:00', '1'),
(448, 'Danilo Jr.', 'Macam', 'dj_macam@yahoo.com', '^iCe', 'e55be5fc6d285c147bcf6ab419b545a7', 'deejay26', 'test', '0', '2005-04-02 03:15:08', '0000-00-00 00:00:00', '1'),
(449, 'michael nathan', 'quibin', 'bigbrat68@hotmail.com', 'bigbrat68', 'dc3dc669d65687a439760d4d339a42d2', '962513', 'test', '0', '2005-04-02 11:18:46', '0000-00-00 00:00:00', '1'),
(450, 'Frank', 'Woolf', 'frank@motorcyclephilippin', 'Frank Woolf', 'a4dc3dd12aeb238c5fd8d5e28472bd39', 'bluewing', 'test', '0', '2005-04-03 11:48:14', '0000-00-00 00:00:00', '1'),
(451, 'arnel', 'estanislao', 'saklay@gmail.com', 'neo', 'cb59608fced567a14b13a6e5c5c8a1d2', 'neo', 'test', '0', '2005-04-04 00:10:21', '0000-00-00 00:00:00', '0'),
(452, 'mor', 'heus', 'neo@matrix.com', 'morpheus000', 'eb35c17c47b8ea645be204aba44cae3d', 'morpheus', 'test', '0', '2005-04-04 00:18:39', '0000-00-00 00:00:00', '0'),
(457, 'sakdfasjd', 'lkasjdf', 'test_005@testo.com', 'test_005', 'e66ebc9eea704535d49d7e0e907dd623', 'test005', 'test', '0', '2005-04-04 00:49:42', '0000-00-00 00:00:00', '0'),
(458, 'jonart', 'asuncion', 'jonart_88@hotmail.com', 'jonart_88', '26d9d2b7588775d9c1c614ebc000d7b7', 'jan0112', 'test', '0', '2005-04-04 08:27:59', '0000-00-00 00:00:00', '1'),
(459, 'michael', 'lintot', 'jolekim', 'wiseman', 'd054a9397a3b92b6ffa5c342da05c7f7', 'bradpitt', 'test', '0', '2005-04-04 13:04:28', '0000-00-00 00:00:00', '0'),
(460, 'Erwin', 'Aguilar', 'ediabs2003@hotmail.com', 'ediabs', 'fd6d64867b4d10ffeda6e6070d18d9f7', 'winer', 'test', '0', '2005-04-05 06:18:30', '0000-00-00 00:00:00', '1'),
(461, 'tony', 'co', 'ynotoc@yahoo.com', 'toniboi', '26c227dc29f160b79190f4802605a793', 'pilato70', 'test', '0', '2005-04-05 23:46:14', '0000-00-00 00:00:00', '1'),
(462, 'louie', 'miranda', 'lmiranda@gmail.com', 'axishift', 'daeea92d125c60373fbea33684fe77c2', 'louiemiranda2', 'test', '0', '2005-04-06 11:43:57', '0000-00-00 00:00:00', '1'),
(463, 'michael', 'lintot', 'wisemanmikee@yahoo.com', 'wisemanmikee', 'ae7a2a6b7b583aa9cee67bd13edb211e', 'cityofangels', 'test', '0', '2005-04-06 12:07:24', '0000-00-00 00:00:00', '1'),
(464, 'Vincent', 'Brandez', 'vindichry@yahoo.com', 'SMOKE', 'f05357a68b88253a0d2c2420ff7a4136', '92150218', 'test', '0', '2005-04-06 17:22:57', '0000-00-00 00:00:00', '0'),
(465, 'Robert', 'Mananquil', 'robertmananquil963@hotmai', '3x_pasaway', '5adaa5f3f0c20838a7ff261fbef8bc26', 'tangnamo', 'test', '0', '2005-04-06 18:50:38', '0000-00-00 00:00:00', '1'),
(466, 'reggie', 'lemi', 'reggielemi@yahoo.com', 'izeman', '3acf5c7b740d6e2538f3a7b88cf069b3', 'reggie', 'test', '0', '2005-04-07 01:12:22', '0000-00-00 00:00:00', '1'),
(467, 'Chico', 'Rosales', 'choy.rosales@gmail.com', 'chico', '7d5d1919f360e106a4674159c012ce68', 'aspogako', 'test', '0', '2005-04-07 10:28:21', '0000-00-00 00:00:00', '1'),
(468, 'Leonard', 'Diaz', 'leonard.diaz@gmail.com', 'Extreme Yamaha', 'f911c1617171d9351ce92964e7c901cb', 'ainsley', 'test', '0', '2005-04-08 10:54:23', '0000-00-00 00:00:00', '1'),
(469, 'ALVIN', 'CANDELARIA', 'AM-Candelaria@Yahoo.com', 'RECCA', 'dfe3b9d31186efa5216f1e52dc407f85', 'RECCA23', 'test', '0', '2005-04-08 22:44:55', '0000-00-00 00:00:00', '0'),
(470, 'Rico', 'Tacardon', 'bodjtacardon@yahoo.com', 'bodjtacardon', 'b261bb5686885c7ca0766bb66fdff809', 'glock21', 'test', '0', '2005-04-09 20:28:25', '0000-00-00 00:00:00', '1'),
(471, 'clark', 'kuizon', 'clarkkuizon@gmail.com', 'crunos', '0ade91adf264e00acca80a876187c429', 'hitler', 'test', '0', '2005-04-09 23:21:51', '0000-00-00 00:00:00', '1'),
(472, 'Marlo', 'Yu', 'marlsworthcps@yahoo.com', 'marlsworth', 'be60b431a46fcc7bf5ee4f7712993e3b', 'dominique', 'test', '0', '2005-04-11 12:39:51', '0000-00-00 00:00:00', '1'),
(473, 'ron', 'villegas', 'jet_euro@yahoo.com', 'ronnv', '2d46a019b6db793b8ef87436813beec6', 'lennor', 'test', '0', '2005-04-11 15:34:41', '0000-00-00 00:00:00', '1'),
(474, 'Richard', 'Santos', 'aos2k5@gmail.com', 'aos2k5', 'd25199542f4e4882adbcea1dd778f711', '771-3744', 'test', '0', '2005-04-11 19:19:01', '0000-00-00 00:00:00', '1'),
(475, 'RJ Paolo', 'Jimenez', 'rjpaolojimenez@yahoo.com', 'batman', 'ec0e2603172c73a8b644bb9456c1ff6e', 'batman', 'test', '0', '2005-04-11 22:08:14', '0000-00-00 00:00:00', '1'),
(476, 'Piers', 'Dickinson', 'piers.dickinson@bp.com', 'Test', '68eacb97d86f0c4621fa2b0e17cabd8c', 'Test123', 'test', '0', '2005-04-13 05:03:54', '0000-00-00 00:00:00', '1'),
(477, 'german', 'madrid III', 'too_slickk@yahoo.com', 'r600', '520ebdae7cb51bfb5b22d3c886b736fd', 'zoomclub', 'test', '0', '2005-04-14 09:59:43', '0000-00-00 00:00:00', '1'),
(478, 'boying', 'pelobello', 'boying.mgy@gmail.com', 'boneman', '4f0b36a34946153c358f8b243428a1eb', 'hahahaha', 'test', '0', '2005-04-14 21:30:21', '0000-00-00 00:00:00', '1'),
(479, 'manroe', 'regalado', 'mcregalado@i-manila.com', 'manro_r', '575e22bc356137a41abdef379b776dba', 'thor', 'test', '0', '2005-04-15 16:12:34', '0000-00-00 00:00:00', '1'),
(480, 'Blesilda', 'Talento', 'blessy77@lycos.com', 'ylonah', '546c89560ff026d0a2354d545960284c', 'ylonah', 'test', '0', '2005-04-15 18:18:50', '0000-00-00 00:00:00', '1'),
(481, 'Pedro', 'Damian J.R', 'harry_petermon25@yahoo.co', 'jonmon', '1db91a402a4ff6fd07901be5c7179c82', '141825', 'test', '0', '2005-04-16 22:35:37', '0000-00-00 00:00:00', '1'),
(482, 'don', 'suarez', 'doncbs@yahoo.com', 'bogchi', '0af5475a4b3a4bf4a55b84ee0e498537', '363133', 'test', '0', '2005-04-16 23:44:42', '0000-00-00 00:00:00', '1'),
(483, 'Jay', 'Aguilar', 'jhayaguilar73@yahoo.com', 'avrok', 'fcea920f7412b5da7be0cf42b8c93759', '1234567', 'test', '0', '2005-04-17 07:54:58', '0000-00-00 00:00:00', '1'),
(484, 'Francis Joel', 'Bueno', 'francisjoelbueno@yahoo.co', 'joelbueno2005', 'e3a6729ad35f4ac0991a3b99d832a932', '351430', 'test', '0', '2005-04-18 10:04:12', '0000-00-00 00:00:00', '1'),
(485, 'Eric', 'Mananquil', 'ejym2004@yahoo.com', 'eric jym', 'f9d565ccd4e186abfde99d609a96d06c', '793995', 'test', '0', '2005-04-18 11:50:42', '0000-00-00 00:00:00', '1'),
(486, 'Mark Harvey', 'Ocoma', 'mark_ocoma', 'harv3y', '6d722ce68578d44330ede373855f1ee3', 'randz9bip3', 'test', '0', '2005-04-18 12:44:31', '0000-00-00 00:00:00', '0'),
(487, 'chad', 'yang', 'chave111@yahoo.com', 'chave111', 'fc63f87c08d505264caba37514cd0cfd', 'nicole', 'test', '0', '2005-04-18 14:08:03', '0000-00-00 00:00:00', '0'),
(488, 'jeff albert', 'dominguez', 'gratedchiz062299bh@yahoo.', 'gratedchiz22', '32395715895d74524d001ec93145c616', 'jepoy22bh', 'test', '0', '2005-04-18 16:13:50', '0000-00-00 00:00:00', '1'),
(489, 'merrick', 'natal', 'alexbalweg@yahoo.com', 'murdock', '49c754f6053ae887000d33fd12836b7a', 'dristan', 'test', '0', '2005-04-18 20:57:04', '0000-00-00 00:00:00', '1'),
(490, 'Ferdz', 'Fernando', 'ffernando1969@yahoo.com', 'EagleOne', '08b5079d93953dc064075b511fa589e6', 'june1969', 'test', '0', '2005-04-19 01:22:05', '0000-00-00 00:00:00', '1'),
(491, 'jay', 'reyes', 'reyes_jjay@yahoo.com', 'reyes_jjay', 'e7adcbb3efdb2c220077fcaaa033e8f2', 'denisemarc', 'test', '0', '2005-04-19 09:39:15', '0000-00-00 00:00:00', '1'),
(492, 'Mark Harvey', 'Ocoma', 'mark_ocoma@yahoo.com', 'harvey', '6d722ce68578d44330ede373855f1ee3', 'randz9bip3', 'test', '0', '2005-04-19 09:52:41', '0000-00-00 00:00:00', '1'),
(493, 'Franco Marlo', 'Cortez', 'fmlc15@yahoo.com', 'cortefl', '4f0b36a34946153c358f8b243428a1eb', 'hahahaha', 'test', '0', '2005-04-19 15:42:30', '0000-00-00 00:00:00', '1'),
(494, 'Emmanuel Rex Arvin', 'Roseus', 'mannixroseus@hotmail.com', 'mannixroseus', 'e754e9588c0fb745cabbc4638938178e', 'mannix', 'test', '0', '2005-04-20 07:12:05', '0000-00-00 00:00:00', '0'),
(495, 'Obryann', 'Gatdula', 'obgatdula@hotmail.com', 'obgatdula', '525c2ae1b837fed8426ecbd20cfeed29', 'xrm110', 'test', '0', '2005-04-20 08:55:46', '0000-00-00 00:00:00', '1'),
(496, 'Dhong', 'Salem', 'dhongerz@yahoo.com', 'dhongster', '3cce2ebc66845b71fa26e67941d1356e', '302627', 'test', '0', '2005-04-20 11:52:02', '0000-00-00 00:00:00', '1'),
(497, 'garry', 'pegarido', 'zeaga5@yahoo.com', 'garry', 'eb0a191797624dd3a48fa681d3061212', 'master', 'test', '0', '2005-04-20 14:06:43', '0000-00-00 00:00:00', '1'),
(498, 'chito', 'benavente', 'vielside22@yahoo.com', 'vielside22', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'test', '0', '2005-04-20 20:16:01', '0000-00-00 00:00:00', '0'),
(499, 'chito', 'benavente', 'vielside21@yahoo.com', 'vielside_2005', 'd41d8cd98f00b204e9800998ecf8427e', '', 'test', '0', '2005-04-20 20:23:13', '0000-00-00 00:00:00', '0');
