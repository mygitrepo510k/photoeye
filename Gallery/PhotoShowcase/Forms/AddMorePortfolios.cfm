<CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup
  WHERE Custnumber = #URL.custnumber#
</CFQUERY>

<!--- Query multiple portfolios ---> 
<CFQUERY NAME="qGetPortfolios"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryPortfolio
  WHERE Custnumber = #URL.Custnumber# ;
</CFQUERY>

<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">

<html>

<head>
<title>photo-eye Photographer's Showcase | Multiple Portfolios</title>
</head>

<body bgcolor="GRAY" link="#000080" vlink="#000080">
<form method="post" action="AddMorePortfoliosAction.cfm?Custnumber=<cfoutput>#URL.Custnumber#</cfoutput>"> 
<br><div align="center">
<center>

      <br>
      </center>
	  <table width="85%" bgcolor="#FFFFFF">
      <tr><td align="center">
  
	          
          <table width="95%" border="0" cellpadding="5" bgcolor="#FFFFFF" cellspacing="0" valign="top" align="center">
            <tr valign="top"> 
              <td colspan="3" align="left"><font face="Verdana,Arial,Helvetica,sans-serif" size="5"><font size="2"><img src="../SharedImages/photo-eye%20Explore%20NewLogo_photoShowcaseVersionWhiteBackground.jpg" width="151" height="94"></font></font></td>
            </tr><TR>
			
			    <TD COLSPAN="3" ALIGN="LEFT"><font face="Verdana,Arial,Helvetica,sans-serif" size="4">Multiple Portfolios for <cfoutput>#qGetShowcaseSetupInfo.FirstName# #qGetShowcaseSetupInfo.LastName#</cfoutput></font><font face="Verdana,Arial,Helvetica,sans-serif" size="5"> 
                  <br><br>
                  <font size="2">How many portfolios do you wish to add? <input type="text" size="2" name="AddPortfolios" maxlength="2" value="0"><br><br>
<INPUT TYPE="SUBMIT" VALUE="Add"> <INPUT TYPE="SUBMIT" VALUE="Cancel">
               <!---    <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"> ---></font></font></td>
 
             
            </tr>


			<tr><td>
			
			
			</td></tr>



            <tr valign="top"> 
              <td align="center" height="17">
               <!---  <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"><br><br> --->
<!--- <INPUT TYPE="SUBMIT" VALUE="Continue to Step 1"> --->
                <br><img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0">
              </td>
            </tr>
            <tr> 
              <td align="center"><font face="Arial, Helvetica, Sans-Serif" size="2"><img src="images/photoeyebooks&prints.gif" width=308 height=28 border=0><br>
                376 Garcia Street, Santa Fe, NM 87501<br>
                Orders Only: 800-227-6941 Info: 505-988-5152 Fax: 505-988-4487<br>
                E-Mail: <a href="mailto:webmaster@photoeye.com">webmaster@photoeye.com</a><br>
                © photo-eye books &amp; prints, <cfoutput>#YEAR(Now())#</cfoutput>. All Rights Reserved.</font> 
                <font face="Arial, Helvetica, Sans-Serif" size="1">This entire 
                web site is the © copyrighted property of photo-eye books &amp; 
                prints, except where artists' and publishers' copyrights on the 
                materials described take precedence. No portion of the contents 
                within may be reproduced in any form, for any non-private use, 
                without the express written permission of photo-eye books &amp; 
                prints.</font></td>
            </tr>
          </table>
   
  </table>
  </div>
</form>
</body>
</html>
