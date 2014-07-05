// Begin: Function for masthead //
var BVersion;
BVersion=navigator.appVersion;
if (BVersion.indexOf("MSIE 5.0")!=-1)
{
document.write('<link rel="stylesheet" type="text/css" href="css/modules/M_G1_masthead_IE5.css" />');
document.write('<link rel="stylesheet" type="text/css" href="css/modules/M_G7_HomeCountryDropdown180IE5.css" />');
}

else if (BVersion.indexOf("MSIE 5.5")!=-1)
{
document.write('<link rel="stylesheet" type="text/css" href="css/modules/M_G1_masthead_IE5.css" />');
document.write('<link rel="stylesheet" type="text/css" href="css/modules/M_G7_HomeCountryDropdown180IE5.css" />');
}

//else if (BVersion.indexOf("MSIE 6.0")!=-1)
//{
//document.write('<link rel="stylesheet" type="text/css" href="css/modules/M_G1_masthead_IE6.css" />');
//}

else 
if (navigator.platform.indexOf("MacPPC")!=-1)
{
	document.write('<link rel="stylesheet" type="text/css" href="css/modules/M_G1_masthead_Mac.css" />');
}

else {
document.write('<link rel="stylesheet" type="text/css" href="css/modules/M_G1_masthead.css" />');
}
// End: Function for masthead //

// Begin: Function for Left Nav expand - collapse //
var prev_n=0;
function toggleMenu(n) {
	if (n != prev_n) {
	for (i=1; i<=3; i++){
		eval('document.getElementById("childContainer'+i+'").style.display = "none"');
	}
		eval('document.getElementById("childContainer'+n+'").style.display = "block"');
		prev_n=n;
	  }
}
// End: Function for Left Nav expand - collapse //


function modelesswin(url,mwidth,mheight){
	if (document.all&&window.print) //if ie5
		eval('window.showModelessDialog(url,"","help:0;resizable:0;dialogWidth:'+(mwidth)+'px;dialogHeight:'+(mheight+80)+'px;status:no;scroll:no;")')
	else 
		eval('window.open(url,"","width='+(mwidth+50)+'px,height='+(mheight+80)+'px,resizable=0,scrollbars=0")')
}
	
function win2col(url2col){
	window.open(url2col,'BP','width=433,height=500,status=no,resizable=no,top=110,left=200,toolbar=no,menubar=no,scrollbars=yes')
}

function win3col(url3col){
	window.open(url3col,'Bp_com','width=627, height=500,resizable=0,top=110,left=200,toolbar=0,titlebar=0,menubar=0,scrollbars=yes')
}

