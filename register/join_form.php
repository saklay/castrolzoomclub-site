<?
session_start();
include 'header.php';
if ($_SESSION['email_address'] != "" ) {
	echo "<b>You do not have the appropriate permissions to enter new distributors.</b><br><br><br>";


if ( empty( $first_name ) ) {
	include 'login.php';
	print "Please login below!";

}
} else { 
?>

			<br>
			<form name=form1 method=post action=register.php>
			<input type="hidden" name="info" value="test">
			<CENTER>
			<TABLE CELLSPACING=0 CELLPADDING=5 BORDER=0 WIDTH=400 class="tableline">
				<TR>
					<TD><IMG SRC="../shared/pixel.gif" WIDTH=15 HEIGHT=1 BORDER=0></TD>
					<TD><div class="grey mBot10"><BR><strong>Log in Name</strong> <b>*</b></div></TD>
					<TD><BR><input type="text" name="username" value="" class="registerBox" size=35 id="username"></TD>
				</TR>
				<TR>
					<TD><IMG SRC="../shared/pixel.gif" WIDTH=15 HEIGHT=1 BORDER=0></TD>
					<TD><div class="grey mBot10"><BR><strong>Password</strong> <b>*</b></div></TD>
					<TD><BR><input type="password" name="yourpassword" value="" class="registerBox" size=35 id="yourpassword"></TD>
				</TR>
				<TR>
					<TD><IMG SRC="../shared/pixel.gif" WIDTH=15 HEIGHT=1 BORDER=0></TD>
					<TD><div class="grey mBot10"><strong>First Name</strong> <b>*</b></div></TD>
					<TD><input type="text" name="first_name" value="" class="registerBox" size=35 id="first_name2"></TD>
				</TR>
				<TR>
					<TD><IMG SRC="../shared/pixel.gif" WIDTH=15 HEIGHT=1 BORDER=0></TD>
					<TD><div class="grey mBot10"><strong>Middle Initial</strong> <b>*</b></div></TD>
					<TD><input type="text" name="middle_initial" value="" class="registerBox" size=35 id="middle_initial"></TD>
				</TR>
				<TR>
					<TD><IMG SRC="../shared/pixel.gif" WIDTH=15 HEIGHT=1 BORDER=0></TD>
					<TD><div class="grey mBot10"><strong>Last Name</strong> <b>*</b></div></TD>
					<TD><input type="text" name="last_name" value="" class="registerBox" size=35 id="last_name"></TD>
				</TR>
				<TR>
					<TD><IMG SRC="../shared/pixel.gif" WIDTH=15 HEIGHT=1 BORDER=0></TD>
					<TD><div class="grey mBot10"><strong>Address</strong></b></div></TD>
					<TD><input type="text" name="address" value="" class="registerBox" size=35 id="address"></TD>
				</TR>
				<TR>
					<TD><IMG SRC="../shared/pixel.gif" WIDTH=15 HEIGHT=1 BORDER=0></TD>
					<TD><div class="grey mBot10"><strong>Province</strong> <b>*</b></div></TD>
					<TD><input type="text" name="province" value="" class="registerBox" size=35 id="province"></TD>
				</TR>
				<TR>
					<TD><IMG SRC="../shared/pixel.gif" WIDTH=15 HEIGHT=1 BORDER=0></TD>
					<TD><div class="grey mBot10"><strong>Telephone</strong></div></TD>
					<TD><input type="text" name="phone" value="" class="registerBox" size=35 id="phone"></TD>
				</TR>
				<TR>
					<TD><IMG SRC="../shared/pixel.gif" WIDTH=15 HEIGHT=1 BORDER=0></TD>
					<TD><div class="grey mBot10"><strong>Mobile No.</strong></div></TD>
					<TD><input type="text" name="mobile" value="" class="registerBox" size=35 id="mobile"></TD>
				</TR>
				<TR>
					<TD><IMG SRC="../shared/pixel.gif" WIDTH=15 HEIGHT=1 BORDER=0></TD>
					<TD><div class="grey mBot10"><strong>e-mail</strong> <b>*</b></div></TD>
					<TD><input type="text" name="email_address" value="" class="registerBox" size=35 id="email_address"></TD>
				</TR>
				<TR>
					<TD><IMG SRC="../shared/pixel.gif" WIDTH=15 HEIGHT=1 BORDER=0></TD>
					<TD><div class="grey mBot10"><strong>Age</strong> <b>*</b></div></TD>
					<TD><input type="text" name="age" value="" class="registerBox" size=35 id="age"></TD>
				</TR>
				<TR>
					<TD><IMG SRC="../shared/pixel.gif" WIDTH=15 HEIGHT=1 BORDER=0></TD>
					<TD><div class="grey mBot10"><strong>Sex</strong> <b>*</b></div></TD>
					<TD><input type="text" name="sex" value="" class="registerBox" size=35 id="sex"></TD>
				</TR>
				<TR>
					<TD><IMG SRC="../shared/pixel.gif" WIDTH=15 HEIGHT=1 BORDER=0></TD>
					<TD><div class="grey mBot10"><strong>Birthday</strong></div></TD>
					<TD><input type="text" name="birthday" value="" class="registerBox" size=35 id="birthday"></TD>
				</TR>
				<TR>
					<TD><IMG SRC="../shared/pixel.gif" WIDTH=15 HEIGHT=1 BORDER=0></TD>
					<TD><div class="grey mBot10"><strong>Bike model</strong> <b>*</b></div></TD>
					<TD><input type="text" name="bike_model" value="" class="registerBox" size=35 id="bike_model"></TD>
				</TR>
				<TR>
					<TD><IMG SRC="../shared/pixel.gif" WIDTH=15 HEIGHT=1 BORDER=0></TD>
					<TD><div class="grey mBot10"><strong>Bike name</strong></div></TD>
					<TD><input type="text" name="bike_name" value="" class="registerBox" size=35 id="bike_name"></TD>
				</TR>
				<TR>
					<TD><IMG SRC="../shared/pixel.gif" WIDTH=15 HEIGHT=1 BORDER=0></TD>
					<TD><div class="grey mBot10"><strong>ZOOM CLUB No.</strong></div></TD>
					<TD><input type="text" name="zoomclub_number" value="" class="registerBox" size=35 id="zoomclub_number"></TD>
				</TR>
				<TR>
					<TD colspan=2><IMG SRC="../shared/pixel.gif" WIDTH=1 HEIGHT=1 BORDER=0></TD>
					<TD align="right"><div class="grey mBot10"><font style="color:#ff0000"><b>*</b> Please accomplish completely.</font></div></TD>
				</TR>
			</TABLE>
			<br><input type="submit" value="Send" class="goAnchor">&nbsp;&nbsp;<input type="submit" value="Cancel" class="goAnchor">
			</CENTER>
			</form>

<? } ?>

<?
include 'footer.php';
?>