<!--- <CFQUERY NAME="qGetShowcaseApplicationSelect"  DATASOURCE="photoeyecom">
  Select * from GalleryApplication WHERE OrderId = #url.id#
</CFQUERY> --->

<CFQUERY NAME="qGetApplication"  DATASOURCE="photoeyecom">
  SELECT bio
  FROM GalleryApplication
  WHERE OrderId = #url.id# 
</CFQUERY>

<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">


<html>

<head>
<title>photo-eye Photographer's Showcase | Application Bio</title>
</head>

<body bgcolor="gray" link="#000080" vlink="#000080">
<div align="center"><center>
	<form method="post" action="UpdateBio.cfm?id=<cfoutput>#url.id#</cfoutput>">
<br>

   <table width="85%" bgcolor="#FFFFFF" align="center">
      <tr><td align="center"> 
  
	          
            <table width="95%" border="0" cellpadding="5" bgcolor="#FFFFFF" cellspacing="0" valign="top" align="center">
              <tr valign="top"> 
                <td colspan="3" align="left"><br>
                  <img src="../SharedImages/photo-eye%20Explore%20NewLogo_photoShowcaseVersionWhiteBackground.jpg" width="151" height="94"></td>
              </tr>
              <TR> 
                <TD COLSPAN="3" ALIGN="LEFT" height="57"> <font face="Verdana,Arial,Helvetica,sans-serif" size="4">Step 
                  2 - Artist R&eacute;sum&eacute; </font><font face="Verdana,Arial,Helvetica,sans-serif" size="5"><font size="2"><br>
                 <hr size="1" noshade></font></font>
                  <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><b>Enter your Artist R&eacute;sum&eacute;. </b> </font> <font face="Verdana,Arial,Helvetica,sans-serif" color="red" size="1"> 
                    (Recommended)</font><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><br>Include your education, exhibitions, awards, and any additional information that indicates your committment to photography. If you already have a bio in your computer, simply copy and paste the text from that document here.<br><br><font color="red">NOTE:</font> You <strong>MUST</strong> click the &quot;Continue&quot; button at the bottom of this page even if you decide to leave the text box blank <br><br></font>
                    <textarea name="Bio" rows="20" cols="70"><cfoutput>#qGetApplication.bio#</cfoutput></textarea>
                  
                  </td>
              </tr>
              <tr> 
                <td align="center" colspan="3"> 
                  <p><img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"><br>
                    <INPUT TYPE="SUBMIT" VALUE="Save Artist R&eacute;sum&eacute; - Continue"><br>
                    <br>
                    <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"> 
                    <BR>
                    <FONT FACE="Arial, Helvetica, Sans-Serif" size="2"><IMG SRC="../../../img/photoeyebooks&prints.gif" WIDTH=308 HEIGHT=28 BORDER=0><br>
                    376 Garcia Street, Santa Fe, NM 87501<br>
                    Orders Only: 800-227-6941 Info: 505-988-5152 Fax: 505-988-4487<br>
                    E-Mail: <a href="mailto:webmaster@photoeye.com">webmaster@photoeye.com</a><br>
                    � photo-eye books &amp; prints, 2001. All Rights Reserved.</font> 
                    <FONT FACE="Arial, Helvetica, Sans-Serif" size="1"><br>
                    This entire web site is the � copyrighted property of photo-eye 
                    books &amp; prints, except where artists' and publishers' 
                    copyrights on the materials described take precedence. No 
                    portion of the contents within may be reproduced in any form, 
                    for any non-private use, without the express written permission 
                    of photo-eye books &amp; prints.<br>
                    </font></p>
                  </td>
              </tr>
              <tr> 
                <td></td>
              </tr>
            </table> 

    
 </td></tr></table> 
	</form>
</center>
</div>
</body>
</html>

