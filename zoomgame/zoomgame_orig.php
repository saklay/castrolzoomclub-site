<html>
<head>
<title>Castrol ZOOM</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" type="text/css" href="../js-css/style.css">
<script language="JavaScript">
function closeWindow() {
  window.close()
}
</script> 
</head>

<?
if ( empty( $first_name ) ) {
?>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#FFFFFF">
<table cellspacing=0 cellpadding=0 border=0 width=100%>
	<tr>
		<TD><IMG SRC="../shared/logo.gif" WIDTH=365 HEIGHT=68 BORDER=0 ALT="Castrol"></TD>
	</tr>
	<tr>
		<TD><IMG SRC="../shared/pixel.gif" WIDTH=1 HEIGHT=20 BORDER=0></TD>
	</tr>
	<tr>
		<TD align="center" width=100%><IMG SRC="flash_image.jpg" WIDTH=740 HEIGHT=185 BORDER=0></TD>
	</tr>
	<tr>
		<TD><IMG SRC="../shared/pixel.gif" WIDTH=1 HEIGHT=25 BORDER=0></TD>
	</tr>
</table>
<center>
<form action="/register/checkuser.php" method="post" name="form1">
<input type="hidden" name="whichpage" value="0" id="whichpage">
  <table width="300" border="0" cellpadding="5" cellspacing="0" class="tableline">
    <tr>
	  <TD><IMG SRC="../shared/pixel.gif" WIDTH=15 HEIGHT=1 BORDER=0></TD>
      <td width="22%"><div class="grey mBot10"><BR><strong>Username</strong></div></td>
      <td width="78%"><BR><input name="username" type="text" id="username"></td>
    </tr>
    <tr>
	  <TD><IMG SRC="../shared/pixel.gif" WIDTH=15 HEIGHT=1 BORDER=0></TD>
      <td><div class="grey mBot10"><BR><strong>Password</strong></div></td>
      <td><BR><input name="password" type="password" id="password"></td>
    </tr>
	<tr>
	  <TD><IMG SRC="../shared/pixel.gif" WIDTH=1 HEIGHT=10 BORDER=0></TD>
    </tr>
    <tr>
      <td colspan=3 align="center"><input type="submit" name="Submit" value="Submit" class="goAnchor"></td>
    </tr>
  </table>
</form>
</center>

<?
} else { 
?>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#000000">
<table width="100%" height="100%" border="0">
  <tr>
    <td><div align="center">
        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="750" height="500">
          <param name="movie" value="zoomgame.swf">
          <param name="quality" value="best">
          <param name="menu" value="false">
          <embed src="zoomgame.swf" width="750" height="500" quality="best" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" menu="false"></embed></object>
      </div></td>
  </tr>
</table>

<? } ?>

</body>
</html>