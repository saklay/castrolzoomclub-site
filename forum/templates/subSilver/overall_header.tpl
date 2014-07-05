<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html dir="{S_CONTENT_DIRECTION}">
<head>
<meta http-equiv="Content-Type" content="text/html; charset={S_CONTENT_ENCODING}">
<meta http-equiv="Content-Style-Type" content="text/css">
{META}
{NAV_LINKS}
<title>Castrol ZOOM</title>
<link rel="stylesheet" type="text/css" href="/js-css/style.css">
<style type="text/css">
<!--
/*
  The original subSilver Theme for phpBB version 2+
  Created by subBlue design
  http://www.subBlue.com

  NOTE: These CSS definitions are stored within the main page body so that you can use the phpBB2
  theme administration centre. When you have finalised your style you could cut the final CSS code
  and place it in an external file, deleting this section to save bandwidth.
*/


/* General font families for common tags */
font,th,td,p { font-family: {T_FONTFACE1} }
a:link,a:active,a:visited { color : {T_BODY_LINK}; }
a:hover		{ text-decoration: underline; color : {T_BODY_HLINK}; }
hr	{ height: 0px; border: solid {T_TR_COLOR3} 0px; border-top-width: 1px;}

/* This is the border line & background colour round the entire page */
.bodyline	{ background-color: {T_TD_COLOR2}; border: 1px {T_TH_COLOR1} solid; }

/* This is the outline round the main forum tables */
.forumline	{ background-color: {T_TD_COLOR2}; border: 2px #247A25 solid; }

/* Main table cell colours and backgrounds */
td.row1	{ background-color: {T_TR_COLOR1}; }
td.row2	{ background-color: {T_TR_COLOR2}; }
td.row3	{ background-color: {T_TR_COLOR3}; }

/*
  This is for the table cell above the Topics, Post & Last posts on the index.php page
  By default this is the fading out gradiated silver background.
  However, you could replace this with a bitmap specific for each forum
*/
td.rowpic {
		background-color: {T_TD_COLOR2};
		background-image: url(templates/subSilver/images/{T_TH_CLASS3});
		background-repeat: repeat-y;
}

/* Header cells - the blue and silver gradient backgrounds */
th	{
	color: {T_FONTCOLOR3}; font-size: {T_FONTSIZE2}px; font-weight : bold; 
	background-color: {T_BODY_LINK}; height: 25px;
	background-image: url(templates/subSilver/images/{T_TH_CLASS2});
}

td.cat,td.catHead,td.catSides,td.catLeft,td.catRight,td.catBottom {
			background-image: url(templates/subSilver/images/{T_TH_CLASS1});
			background-color:{T_TR_COLOR3}; border: {T_TH_COLOR3}; border-style: solid; height: 28px;
}

/*
  Setting additional nice inner borders for the main table cells.
  The names indicate which sides the border will be on.
  Don't worry if you don't understand this, just ignore it :-)
*/
td.cat,td.catHead,td.catBottom {
	height: 29px;
	border-width: 0px 0px 0px 0px;
}
th.thHead,th.thSides,th.thTop,th.thLeft,th.thRight,th.thBottom,th.thCornerL,th.thCornerR {
	font-weight: bold; border: {T_TD_COLOR2}; border-style: solid; height: 28px;
}
td.row3Right,td.spaceRow {
	background-color: {T_TR_COLOR3}; border: {T_TH_COLOR3}; border-style: solid;
}

th.thHead,td.catHead { font-size: {T_FONTSIZE3}px; border-width: 1px 1px 0px 1px; }
th.thSides,td.catSides,td.spaceRow	 { border-width: 0px 1px 0px 1px; }
th.thRight,td.catRight,td.row3Right	 { border-width: 0px 1px 0px 0px; }
th.thLeft,td.catLeft	  { border-width: 0px 0px 0px 1px; }
th.thBottom,td.catBottom  { border-width: 0px 1px 1px 1px; }
th.thTop	 { border-width: 1px 0px 0px 0px; }
th.thCornerL { border-width: 1px 0px 0px 1px; }
th.thCornerR { border-width: 1px 1px 0px 0px; }

/* The largest text used in the index page title and toptic title etc. */
.maintitle	{
	font-weight: bold; font-size: 22px; font-family: "{T_FONTFACE2}",{T_FONTFACE1};
	text-decoration: none; line-height : 120%; color : {T_BODY_TEXT};
}

/* General text */
.gen { font-size : {T_FONTSIZE3}px; }
.genmed { font-size : {T_FONTSIZE2}px; }
.gensmall { font-size : {T_FONTSIZE1}px; }
.gen,.genmed,.gensmall { color : {T_BODY_TEXT}; }
a.gen,a.genmed,a.gensmall { color: {T_BODY_LINK}; text-decoration: none; }
a.gen:hover,a.genmed:hover,a.gensmall:hover	{ color: {T_BODY_HLINK}; text-decoration: underline; }

/* The register, login, search etc links at the top of the page */
.mainmenu		{ font-size : {T_FONTSIZE2}px; color : {T_BODY_TEXT} }
a.mainmenu		{ text-decoration: none; color : {T_BODY_LINK};  }
a.mainmenu:hover{ text-decoration: underline; color : {T_BODY_HLINK}; }

/* Forum category titles */
.cattitle		{ font-weight: bold; font-size: {T_FONTSIZE3}px ; letter-spacing: 1px; color : {T_BODY_LINK}}
a.cattitle		{ text-decoration: none; color : {T_BODY_LINK}; }
a.cattitle:hover{ text-decoration: underline; }

/* Forum title: Text and link to the forums used in: index.php */
.forumlink		{ font-weight: bold; font-size: {T_FONTSIZE3}px; color : {T_BODY_LINK}; }
a.forumlink 	{ text-decoration: none; color : {T_BODY_LINK}; }
a.forumlink:hover{ text-decoration: underline; color : {T_BODY_HLINK}; }

/* Used for the navigation text, (Page 1,2,3 etc) and the navigation bar when in a forum */
.nav			{ font-weight: bold; font-size: {T_FONTSIZE2}px; color : {T_BODY_TEXT};}
a.nav			{ text-decoration: none; color : {T_BODY_LINK}; }
a.nav:hover		{ text-decoration: underline; }

/* titles for the topics: could specify viewed link colour too */
.topictitle,h1,h2	{ font-weight: bold; font-size: {T_FONTSIZE2}px; color : {T_BODY_TEXT}; }
a.topictitle:link   { text-decoration: none; color : {T_BODY_LINK}; }
a.topictitle:visited { text-decoration: none; color : {T_BODY_VLINK}; }
a.topictitle:hover	{ text-decoration: underline; color : {T_BODY_HLINK}; }

/* Name of poster in viewmsg.php and viewtopic.php and other places */
.name			{ font-size : {T_FONTSIZE2}px; color : {T_BODY_TEXT};}

/* Location, number of posts, post date etc */
.postdetails		{ font-size : {T_FONTSIZE1}px; color : {T_BODY_TEXT}; }

/* The content of the posts (body of text) */
.postbody { font-size : {T_FONTSIZE3}px; line-height: 18px}
a.postlink:link	{ text-decoration: none; color : {T_BODY_LINK} }
a.postlink:visited { text-decoration: none; color : {T_BODY_VLINK}; }
a.postlink:hover { text-decoration: underline; color : {T_BODY_HLINK}}

/* Quote & Code blocks */
.code { 
	font-family: {T_FONTFACE3}; font-size: {T_FONTSIZE2}px; color: {T_FONTCOLOR2};
	background-color: {T_TD_COLOR1}; border: {T_TR_COLOR3}; border-style: solid;
	border-left-width: 1px; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px
}

.quote {
	font-family: {T_FONTFACE1}; font-size: {T_FONTSIZE2}px; color: {T_FONTCOLOR1}; line-height: 125%;
	background-color: {T_TD_COLOR1}; border: {T_TR_COLOR3}; border-style: solid;
	border-left-width: 1px; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px
}

/* Copyright and bottom info */
.copyright		{ font-size: {T_FONTSIZE1}px; font-family: {T_FONTFACE1}; color: {T_FONTCOLOR1}; letter-spacing: -1px;}
a.copyright		{ color: {T_FONTCOLOR1}; text-decoration: none;}
a.copyright:hover { color: {T_BODY_TEXT}; text-decoration: underline;}

/* Form elements */
input,textarea, select {
	color : {T_BODY_TEXT};
	font: normal {T_FONTSIZE2}px {T_FONTFACE1};
	border-color : {T_BODY_TEXT};
}

/* The text input fields background colour */
input.post, textarea.post, select {
	background-color : {T_TD_COLOR2};
}

input { text-indent : 2px; }

/* The buttons used for bbCode styling in message post */
input.button {
	background-color : {T_TR_COLOR1};
	color : {T_BODY_TEXT};
	font-size: {T_FONTSIZE2}px; font-family: {T_FONTFACE1};
}

/* The main submit button option */
input.mainoption {
	background-color : {T_TD_COLOR1};
	font-weight : bold;
}

/* None-bold submit button */
input.liteoption {
	background-color : {T_TD_COLOR1};
	font-weight : normal;
}

/* This is the line in the posting page which shows the rollover
  help line. This is actually a text box, but if set to be the same
  colour as the background no one will know ;)
*/
.helpline { background-color: {T_TR_COLOR2}; border-style: none; }

/* Import the fancy styles for IE only (NS4.x doesn't use the @import function) */
@import url("templates/subSilver/formIE.css"); 
-->
</style>
<!-- BEGIN switch_enable_pm_popup -->
<script language="Javascript" type="text/javascript">
<!--
	if ( {PRIVATE_MESSAGE_NEW_FLAG} )
	{
		window.open('{U_PRIVATEMSGS_POPUP}', '_phpbbprivmsg', 'HEIGHT=225,resizable=yes,WIDTH=400');;
	}
//-->
</script>

<SCRIPT LANGUAGE="JavaScript">
<!--

if (document.images) {
    var img1 = new Image();
    var img2 = new Image();
	var img3 = new Image();
	var img4 = new Image();
	var img5 = new Image();
	var img6 = new Image();
	var img7 = new Image();
	var img8 = new Image();
	
	img1.src = "/shared/2btregister.gif";
	img2.src = "/shared/2btzoomperks.gif";
	img3.src = "/shared/2btpromo.gif";
	img4.src = "/shared/2btzoomcalendar.gif";
	img5.src = "/shared/2btzoomgame.gif";
	img6.src = "/shared/2btgallery.gif";
	img7.src = "/shared/2btforum.gif";
	img8.src = "/shared/2btlinks.gif";
}

function highlight(img, location, desc) {
    if (document.images) {
		document.images[img].src = location + "2bt" + img + ".gif";
    }
	window.status=desc;
	return true;
}

function unhighlight(img, location) {
    if (document.images) {
		document.images[img].src = location + "bt" + img + ".gif";
    }
	window.status="";
	return true;
}

function PopUpWindow (URL, windowName, wid, hgt) {
  newTop = (screen.height - hgt)/2;
  newLeft = (screen.width - wid)/2;
  winFeat = "height="+hgt+",width="+wid+",top="+newTop+",left="+newLeft+",scrollbars=0,toolbar=0,location=0,status=0,menubar=0,resizable=0,dependent=0";
  window.open(URL, windowName, winFeat);
}

//-->
</SCRIPT>

<!-- END switch_enable_pm_popup -->
</head>
<BODY BGCOLOR="#FFFFFF" MARGINWIDTH=0 MARGINHEIGHT=0 TOPMARGIN=0 LEFTMARGIN=0>

<a name="top"></a>
<TABLE CELLSPACING=0 CELLPADDING=0 BORDER=0>
	<TR>
		<TD><IMG SRC="shared/pixel.gif" WIDTH=20 HEIGHT=1 BORDER=0></TD>
		<TD>
		
		
<TABLE CELLSPACING=0 CELLPADDING=0 BORDER=0 WIDTH=740>
	<TR>
		<TD><IMG SRC="/shared/pixel.gif" WIDTH=1 HEIGHT=15 BORDER=0></TD>
	</TR>
	<TR>
		<TD><IMG SRC="/shared/logo.gif" WIDTH=365 HEIGHT=68 BORDER=0 ALT="Castrol"></TD>
		<TD VALIGN="TOP" ALIGN="RIGHT">
			<span><A HREF="/terms/" class="utilityLink">Terms and Conditions</A></span>
			<span class="greenPipe">|</span>
			<span><A HREF="/contactus/" class="utilityLink">Contact Us</A></span>
			<span class="greenPipe">|</span>
			<span><A HREF="/index.html" class="utilityLink">Home</A></span>
			<form name="SearchResultForm" method="get">
				<span class="greenBold">Username</span><span class="mLeft5"></span>
				<input type="text" name="keyword" value="" class="searchBox" size=10><span class="mLeft5"></span>
				<span class="greenBold">Password</span><span class="mLeft5"></span>
				<input type="text" name="keyword" value="" class="searchBox" size=10><span class="mLeft5"></span>
				<input type="submit" value="Go" class="goAnchor">
			</form>
		</TD>
	</TR>
</TABLE>
<TABLE CELLSPACING=0 CELLPADDING=0 BORDER=0 WIDTH=740>
	<TR>
		<TD><IMG SRC="/shared/pixel.gif" WIDTH=1 HEIGHT=10 BORDER=0></TD>
	</TR>
	<TR>
		<TD><A HREF="/register/" onMouseOver="return highlight('register','/shared/','Register')" onMouseOut="return unhighlight('register','/shared/')"><IMG SRC="/shared/btregister.gif" NAME="register" WIDTH=80 HEIGHT=29 BORDER=0 ALT="Register"></A></TD>
		<TD><A HREF="/zoomperks/" onMouseOver="return highlight('zoomperks','/shared/','Zoom Perks')" onMouseOut="return unhighlight('zoomperks','/shared/')"><IMG SRC="/shared/btzoomperks.gif" NAME="zoomperks" WIDTH=94 HEIGHT=29 BORDER=0 ALT="Zoom Perks"></A></TD>
		<TD><A HREF="/promo/" onMouseOver="return highlight('promo','/shared/','Promo Announcement')" onMouseOut="return unhighlight('promo','/shared/')"><IMG SRC="/shared/btpromo.gif" NAME="promo" WIDTH=157 HEIGHT=29 BORDER=0 ALT="Promo Announcement"></A></TD>
		<TD><A HREF="/zoomcalendar/" onMouseOver="return highlight('zoomcalendar','/shared/','Zoom Calendar')" onMouseOut="return unhighlight('zoomcalendar','/shared/')"><IMG SRC="/shared/btzoomcalendar.gif" NAME="zoomcalendar" WIDTH=112 HEIGHT=29 BORDER=0 ALT="Zoom Calendar"></A></TD>
		<TD><A HREF="javascript:PopUpWindow('/zoomgame/zoomgame.php','zoomgame','750','500');" onMouseOver="return highlight('zoomgame','/shared/','Zoom Game')" onMouseOut="return unhighlight('zoomgame','/shared/')"><IMG SRC="/shared/btzoomgame.gif" NAME="zoomgame" WIDTH=96 HEIGHT=29 BORDER=0 ALT="Zoom Game"></A></TD>
		<TD><A HREF="/gallery/" onMouseOver="return highlight('gallery','/shared/','Gallery')" onMouseOut="return unhighlight('gallery','/shared/')"><IMG SRC="/shared/btgallery.gif" NAME="gallery" WIDTH=62 HEIGHT=29 BORDER=0 ALT="Gallery"></A></TD>
		<TD><A HREF="/forum/" onMouseOver="window.status='Forum'; return true;" onMouseOut="window.status=''; return true;"><IMG SRC="/shared/3btforum.gif" NAME="forum" WIDTH=66 HEIGHT=29 BORDER=0 ALT="Forum"></A></TD>
		<TD><A HREF="/links/" onMouseOver="return highlight('links','/shared/','Links')" onMouseOut="return unhighlight('links','/shared/')"><IMG SRC="/shared/btlinks.gif" NAME="links" WIDTH=73 HEIGHT=29 BORDER=0 ALT="Links"></A></TD>
	</TR>
</TABLE>
<TABLE CELLSPACING=0 CELLPADDING=0 BORDER=0 WIDTH=740>
	<TR>
		<TD><IMG SRC="/shared/pixel.gif" WIDTH=1 HEIGHT=40 BORDER=0></TD>
	</TR>
	<TR>
		<TD><IMG SRC="flash_image.jpg" WIDTH=740 HEIGHT=185 BORDER=0></TD>
	</TR>
	<TR>
		<TD><IMG SRC="/shared/pixel.gif" WIDTH=1 HEIGHT=15 BORDER=0></TD>
	</TR>
</TABLE>
<TABLE CELLSPACING=0 CELLPADDING=0 BORDER=0 WIDTH=740>
	<TR>
		<TD VALIGN="TOP">
			<center>
				<table cellspacing="0" cellpadding="2" border="0">
					<tr> 
						<td align="center" valign="top" nowrap="nowrap"><span class="mainmenu">&nbsp;<a href="{U_FAQ}" class="mainmenu"><img src="templates/subSilver/images/icon_mini_faq.gif" width="12" height="13" border="0" alt="{L_FAQ}" hspace="3" />{L_FAQ}</a></span><span class="mainmenu">&nbsp; &nbsp;<a href="{U_SEARCH}" class="mainmenu"><img src="templates/subSilver/images/icon_mini_search.gif" width="12" height="13" border="0" alt="{L_SEARCH}" hspace="3" />{L_SEARCH}</a>&nbsp; &nbsp;<a href="{U_MEMBERLIST}" class="mainmenu"><img src="templates/subSilver/images/icon_mini_members.gif" width="12" height="13" border="0" alt="{L_MEMBERLIST}" hspace="3" />{L_MEMBERLIST}</a>&nbsp; &nbsp;<a href="{U_GROUP_CP}" class="mainmenu"><img src="templates/subSilver/images/icon_mini_groups.gif" width="12" height="13" border="0" alt="{L_USERGROUPS}" hspace="3" />{L_USERGROUPS}</a>&nbsp; 
						<!-- BEGIN switch_user_logged_out -->
						&nbsp;<a href="{U_REGISTER}" class="mainmenu"><img src="templates/subSilver/images/icon_mini_register.gif" width="12" height="13" border="0" alt="{L_REGISTER}" hspace="3" />{L_REGISTER}</a></span>&nbsp;
						<!-- END switch_user_logged_out -->
						</td>
					</tr>
					<tr>
						<td height="25" align="center" valign="top" nowrap="nowrap"><span class="mainmenu">&nbsp;<a href="{U_PROFILE}" class="mainmenu"><img src="templates/subSilver/images/icon_mini_profile.gif" width="12" height="13" border="0" alt="{L_PROFILE}" hspace="3" />{L_PROFILE}</a>&nbsp; &nbsp;<a href="{U_PRIVATEMSGS}" class="mainmenu"><img src="templates/subSilver/images/icon_mini_message.gif" width="12" height="13" border="0" alt="{PRIVATE_MESSAGE_INFO}" hspace="3" />{PRIVATE_MESSAGE_INFO}</a>&nbsp; &nbsp;<a href="{U_LOGIN_LOGOUT}" class="mainmenu"><img src="templates/subSilver/images/icon_mini_login.gif" width="12" height="13" border="0" alt="{L_LOGIN_LOGOUT}" hspace="3" />{L_LOGIN_LOGOUT}</a>&nbsp;</span></td>
					</tr>
				</table>
			</center>
			<br>
			