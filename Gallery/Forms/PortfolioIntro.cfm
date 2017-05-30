<CFQUERY NAME="qGallerySetup"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM GallerySetup where Custnumber=#url.id#
</CFQUERY>

<CFQUERY NAME="qGalleryPortfolio"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM GalleryPortfolio where Custnumber=#url.id# AND SUBDIRECTORY='#url.portfolio#'
</CFQUERY>

<CFQUERY NAME="qShowcaseGalleryDefaultPhotos"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM GalleryDefaultPhotos where custnumber=#url.id# AND SUBDIRECTORY='#url.portfolio#'
</CFQUERY>


<!--- ImageNumber=#url.imagenumber# --->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase | <cfoutput>#qGallerySetup.FirstName# #qGallerySetup.LastName#</cfoutput></title>

	<style type="text/css">   
		p {font-family:Verdana, Arial, Helvetica, Sans-Serif; font-size:10pt; color:black;}
    	A:link {font-family:Verdana, Arial, Helvetica, Sans-Serif; font-size:7pt; color:darkblue;}
    	A:visited {font-family:Verdana, Arial, Helvetica, Sans-Serif; font-size:7pt; color:darkblue;}
    	A:hover {font-family:Verdana, Arial, Helvetica, Sans-Serif; font-size:7pt; color:red;}
	</style>


<SCRIPT LANGUAGE="JavaScript">
<!--

function _get_version()
{
return Math.round(parseFloat(navigator.appVersion)*1000);
}
function _get_os()
{
if (navigator.appVersion.indexOf("Win95") > 0) return "WIN95";
else if (navigator.appVersion.indexOf("Win16") > 0) return "WIN31";
else if (navigator.appVersion.indexOf("Mac") > 0) return "MAC";
else if (navigator.appVersion.indexOf("X11") > 0) return "UNIX";
else return "UNKNOWN";
}
var browser = new Object();

if (navigator.appName.substring(0,8) == "Netscape") {

        browser.name ="NN";
        browser.version=_get_version();
        browser.os=_get_os();
}

else if (navigator.appName.substring(0,9) == "Microsoft")
{
        browser.name="MSIE";
        browser.version=3000;
        browser.os="WIN95";

        }
else {
        browser.name=navigator.appName;
        browser.version=_get_version();
        browser.os=_get_os();
}

browser.langlevel = 1000;

if (browser.version == 2000){
document.write('<body bgcolor="White" link="Blue" vlink="purple" alink="red">');
}
else {
document.write('<body bgcolor="black" link="Blue" vlink="purple" alink="red">');
}

//-->
</SCRIPT>

               

</head>
<BODY SCROLL="AUTO">

<cfoutput>


<div align="center"><center>
<table width="580" cellspacing="0" bgcolor="white" border="0">
    <TR> 
      <td width="40" bgcolor="white">&nbsp;</td>
      <TD width="520">
                 <BR>
           &nbsp; 
        </center><div align="center">
<font color="black" face="Verdana, Arial, Helvetica, Sans-Serif" size="3"><b> Introduction to #qGalleryPortfolio.Title#</b></font>
                </FONT></STRONG>
        <HR ALIGN="center" SIZE="1" WIDTH="200" COLOR="red">
                        <font color="silver" face="Verdana, Arial, Helvetica, Sans-Serif" size="1"><strong>
                       <A href="javascript:window.close();">Close Window</A>
        </STRONG></FONT><BR>
						
					
	<br><br>
	<table height="200" align="center">
	<tr>
	<td align="center" valign="top">	
						

	<table>

	<tr>
		<td align="left" valign="top">
			<p>
				<cfif len(qGalleryPortfolio.PortfolioIntro) GT 0>
				#qGalleryPortfolio.PortfolioIntro#
				</cfif>

			</p><br>
			</td>
	</tr>		

	</table>
	
	
	
	
	
	</td></tr></table>
		</td>


	</tr>
	</table>
	
	</cfoutput>		
	</body>
</html>