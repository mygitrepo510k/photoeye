<CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup
  WHERE Email = '#form.Email#'
</CFQUERY>


<CFIF #qGetShowcaseSetupInfo.Email# is "">
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">


<html>

<head>
<title>photo-eye Photographer's Showcase | Set Up Form </title>
</head>
<body bgcolor="gray" link="#000080" vlink="#000080">
<div align="center"><center>


<div align="center"><center>
	<form method="post" action="Step1BasicData.cfm">
<br>

   <table width="85%" bgcolor="#FFFFFF" background="Images/WhiteBackground.gif" align="center">
      <tr><td align="center"> 
  
	          
            <table width="95%" border="0" cellpadding="5" bgcolor="#FFFFFF" background="Images/WhiteBackground.gif" cellspacing="0" valign="top" align="center">
              <tr valign="top"> 
                <td colspan="3" align="left"> <br>
                  <img src="../SharedImages/photo-eye%20Explore%20NewLogo_photoShowcaseVersionWhiteBackground.jpg" width="151" height="94"></td>
              </tr>
              <TR> 
                <TD COLSPAN="3" ALIGN="LEFT"><font face="Verdana,Arial,Helvetica,sans-serif" size="4">Email Address 
                  Not Found</font><font face="Verdana,Arial,Helvetica,sans-serif" size="5"><br>
                  <font size="2">Re-Enter Email Address to setup your Showcase<br>
                  <br>
                  <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"></font></font></td>
              </tr>
              <tr> 
                <td width="49%" valign="top" height="124"> 
                  <p> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Your 
                    Password Hint:</b></font><br>
                    <font face="Verdana,Arial,Helvetica,sans-serif" size="5"><font size="2"> 
                    <input type="text" size="30" maxlength="50" name="Hint" <CFOUTPUT>value="#qGetShowcaseSetupInfo.Hint#"</CFOUTPUT>>
                    </font></font><br>
                    <br>
                    <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Enter Your Password:</b> (Case Sensitive)<br>
                    Use your Customer Number Initially<font color="red"></font> 
                    </font><br>
                    <input type="text" size="30" maxlength="50" name="Password">
                  </p>
                  </td>
                <td width="2%" valign="top" align="left" height="124"> 
                  <div align="center"><img src="Images/BlackRule.gif" width=1 height=100% alt="" border="0"></div>
                </td>
                <td valign="top" width="49%" height="124"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><b> 
                  </b></font> </td>
              </tr>
              <tr> 
                <td align="center" colspan="3"> 
                  <p><img src="Images/BlackRule.gif" width=100% height=8 alt="" border="0"><br>
                    <br>
                    <INPUT TYPE="SUBMIT" VALUE="Continue Login">
                    <INPUT TYPE="SUBMIT" VALUE="Cancel">
                    <br>
                    <br>
                    <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"> 
                    <BR>
                    <FONT FACE="Arial, Helvetica, Sans-Serif" size="2"><IMG SRC="images/photoeyebooks&prints.gif" WIDTH=308 HEIGHT=28 BORDER=0><br>
                    376 Garcia Street, Santa Fe, NM 87501<br>
                    Orders Only: 800-227-6941 Info: 505-988-5152 Fax: 505-988-4487<br>
                    E-Mail: <a href="mailto:webmaster@photoeye.com">webmaster@photoeye.com</a><br>
                    � photo-eye books &amp; prints, 2000. All Rights Reserved.</font> 
                    <FONT FACE="Arial, Helvetica, Sans-Serif" size="1">This entire 
                    web site is the � copyrighted property of photo-eye books 
                    &amp; prints, except where artists' and publishers' copyrights 
                    on the materials described take precedence. No portion of 
                    the contents within may be reproduced in any form, for any 
                    non-private use, without the express written permission of 
                    photo-eye books &amp; prints.<br>
                    </font></p>
                  </td>
              </tr>
              <tr>
                <td></td>
              </tr>
            </table> 

    
 </td></tr></table> 

      <input type="HIDDEN" name="Email" <CFOUTPUT>value="#qGetShowcaseSetupInfo.Email#"</CFOUTPUT>>
</form>
</center>
</div>
</body>
</html>

<CFELSE>
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">

<html>

<head>
<title>photo-eye Photographer's Showcase | Login Form </title>
</head>

<body bgcolor="gray" link="#000080" vlink="#000080">
<div align="center"><center>
	<form method="post" action="Step1BasicData.cfm">
<br>

   <table width="85%" bgcolor="#FFFFFF" background="Images/WhiteBackground.gif" align="center">
      <tr><td align="center"> 
  
	          
            <table width="95%" border="0" cellpadding="5" bgcolor="#FFFFFF" background="Images/WhiteBackground.gif" cellspacing="0" valign="top" align="center">
              <tr valign="top"> 
                <td colspan="3" align="left"> <br>
                  <img src="../SharedImages/photo-eye%20Explore%20NewLogo_photoShowcaseVersionWhiteBackground.jpg" width="151" height="94"></td>
              </tr>
              <TR> 
                <TD COLSPAN="3" ALIGN="LEFT"><font face="Verdana,Arial,Helvetica,sans-serif" size="4">Password 
                  Hint </font><font face="Verdana,Arial,Helvetica,sans-serif" size="5"><br>
                  <font size="2">Login to setup your Showcase<br>
                  <br>
                  <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"></font></font></td>
              </tr>
              <tr> 
                <td width="49%" valign="top" height="124"> 
                  <p> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Your 
                    Password Hint:</b></font><br>
                    <font face="Verdana,Arial,Helvetica,sans-serif" size="5"><font size="2"> 
                    <input type="text" size="30" maxlength="50" name="Hint" <CFOUTPUT>value="#qGetShowcaseSetupInfo.Hint#"</CFOUTPUT>>
                    </font></font><br>
                    <br>
                    <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Enter Your Password:</b> (Case Sensitive)<br>
                    Use your Customer Number Initially<font color="red"></font> 
                    </font><br>
                    <input type="text" size="30" maxlength="50" name="Password">
                  </p>
                  </td>
                <td width="2%" valign="top" align="left" height="124"> 
                  <div align="center"><img src="Images/BlackRule.gif" width=1 height=100% alt="" border="0"></div>
                </td>
                <td valign="top" width="49%" height="124"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><b> 
                  </b></font> </td>
              </tr>
              <tr> 
                <td align="center" colspan="3"> 
                  <p><img src="Images/BlackRule.gif" width=100% height=8 alt="" border="0"><br>
                    <br>
                    <INPUT TYPE="SUBMIT" VALUE="Continue Login">
                    <INPUT TYPE="SUBMIT" VALUE="Cancel">
                    <br>
                    <br>
                    <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"> 
                    <BR>
                    <FONT FACE="Arial, Helvetica, Sans-Serif" size="2"><IMG SRC="images/photoeyebooks&prints.gif" WIDTH=308 HEIGHT=28 BORDER=0><br>
                    376 Garcia Street, Santa Fe, NM 87501<br>
                    Orders Only: 800-227-6941 Info: 505-988-5152 Fax: 505-988-4487<br>
                    E-Mail: <a href="mailto:webmaster@photoeye.com">webmaster@photoeye.com</a><br>
                    � photo-eye books &amp; prints, 2000. All Rights Reserved.</font> 
                    <FONT FACE="Arial, Helvetica, Sans-Serif" size="1">This entire 
                    web site is the � copyrighted property of photo-eye books 
                    &amp; prints, except where artists' and publishers' copyrights 
                    on the materials described take precedence. No portion of 
                    the contents within may be reproduced in any form, for any 
                    non-private use, without the express written permission of 
                    photo-eye books &amp; prints.<br>
                    </font></p>
                  </td>
              </tr>
              <tr>
                <td></td>
              </tr>
            </table> 

    
 </td></tr></table> 

      <input type="HIDDEN" name="Email" <CFOUTPUT>value="#qGetShowcaseSetupInfo.Email#"</CFOUTPUT>>
</form>
</center>
</div>
</body>
</html>
</CFIf>

