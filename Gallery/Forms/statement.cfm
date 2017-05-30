<CFQUERY NAME="qGallerySetup"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM GallerySetup where Custnumber=#url.id#
</CFQUERY>

<CFQUERY NAME="qGallerySetup2"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM GallerySetup2 where Custnumber=#url.id#
</CFQUERY>

<CFQUERY NAME="qGalleryStatements"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM GalleryArtistStatements where Custnumber=#url.id#
</CFQUERY>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye  | <cfoutput>#qGallerySetup.FirstName# #qGallerySetup.LastName#</cfoutput></title>




<!--- p {font-family:Verdana, Arial, Helvetica, Sans-Serif; font-size:10pt; color:black;}
    	A:link {font-family:Verdana, Arial, Helvetica, Sans-Serif; font-size:7pt; color:darkblue;}
    	A:visited {font-family:Verdana, Arial, Helvetica, Sans-Serif; font-size:7pt; color:darkblue;} --->
	
	
	
	
	<style type="text/css">   
		
    			A:hover {color:red;}
	</style>

	
	
		<SCRIPT LANGUAGE="JavaScript">
<!--

function closeWindow() {
  bookWindow = window.close()
}


//-->
</script>
	

</head>



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
document.write('<body bgcolor="White" link="darkblue" vlink="darkblue" alink="red">');
}
else {
document.write('<body bgcolor="Black" link="darkblue" vlink="darkblue" alink="red">');
}

//-->
</SCRIPT>

               

<A NAME="Top"> </A>

<cfoutput>


<div align="center"><center>
<table width="580" cellspacing="0" bgcolor="white" border="0">
    <TR> 
      <td width="40" bgcolor="white">&nbsp;</td>
      <TD width="520">
                 <BR>
           &nbsp; 
        </center><div align="center">
<font color="black" face="Verdana, Arial, Helvetica, Sans-Serif" size="3"><b>#qGallerySetup.FirstName# #qGallerySetup.LastName# Statement</b></font>
                </FONT></STRONG>
        <HR ALIGN="center" SIZE="1" WIDTH="200" COLOR="red">
                        
                        <A href="javascript:closeWindow();"><font face="Verdana, Arial, Helvetica, Sans-Serif" size="1"><b>Close Window</b></FONT></A>
        <BR>
						
						<br><br>
						
</cfoutput>				

		
			
						



    </div>

<br>



<cfoutput>
	
		
<!-------------Start Artistic Statement------------->

<CFIF len(#qGalleryStatements.StatementA#) is not 0>

	<table width="100%" cellpadding="0" cellspacing="0">
	
		<tr>
			<td>
				<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="darkblue"><b>
						Artist Statement </b></font><br>
				<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
					<cfif len(#qGalleryStatements.StatementA#) GT 0>
					#qGalleryStatements.StatementA#
					</cfif>
				</font>
			</td> 
			
		</tr>
		
	</table>	

</cfif>

<!-------End Artistic Statement---------->



<!-------------Start Process Statement------------->

<CFIF len(#qGalleryStatements.StatementP#) is not 0>

<br>
<br>

	<table width="100%" cellpadding="0" cellspacing="0">
	
		<tr>
			<td>
				<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="darkblue"><b>
						Process Statement </b></font><BR>
				<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
					<cfif len(#qGalleryStatements.StatementP#) GT 0>
					#qGalleryStatements.StatementP#
					</cfif>
				</font>
			</td> 
			
		</tr>
		
	</table>	

</cfif>

<!-------End Process Statement---------->

<CFIF len(#qGallerySetup2.StatementP#) is not 0>
<br>
<br>
</cfif>		



	


<br>
<br>

</td>
<td width="40" bgcolor="white">&nbsp;</td>
</tr></table>
</cfoutput>







</body>
</html>	