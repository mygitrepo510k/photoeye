<CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup
  WHERE Custnumber = #url.custnumber#
</CFQUERY>

<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">

<html>

<head>
<title>photo-eye Photographer's Showcase | Overview</title>
</head>

<body bgcolor="GRAY" link="#000080" vlink="#000080">
<form method="post" action="Step1BasicData.cfm?Custnumber=<cfoutput>#URL.Custnumber#</cfoutput>">
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
			
			    <TD COLSPAN="3" ALIGN="LEFT"><font face="Verdana,Arial,Helvetica,sans-serif" size="4">Overview</font><font face="Verdana,Arial,Helvetica,sans-serif" size="5"> 
                  <br>
                  <font size="2">How these Administration forms are organized<br>
                  <br>
                  <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"></font></font></td>
 
             
            </tr>


            <tr valign="top"> 
              <td align="center" height="526"> 
                <div align="left"> 
                  <p align="left">
                    <b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Please 
                    note that Netscape Navigator or Internet Explorer 4.0 or higher 
                    are required to use these administration pages.</b><br><br>
Each artist is responsible for keeping their Showcase information accurate and up-to-date. This includes current pricing and availability. Simply fill out the forms step-by-step according to the table of contents on the left side. Then view your Showcase when all steps are completed. You may make changes at any time, even after your Showcase is complete.</font></p>
                  <p align="left"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Part  
                    1 - Biographical Information</font></b><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><br>
                    Enter your biographical data by filling out forms online. These forms will be used to build your artist's r&eacute;sum&eacute;.  This r&eacute;sum&eacute; will provide pertinent information to the viewer about you and your history as a photographer or artist. All fields with a red asterisk (<font color="red">*</font>) are required. This information will appear on your biography page <b><font color="red">exactly</font></b> as 
                    it is entered here, so please be very careful with spelling, punctuation, and capitalization. Be careful, once these forms are approved, any changes that 
                    you wish to make will incur additional fees. For further information, see the <a href = "AdditionalFees.html">Additional Fees</a> schedule.
                    <br><br>
<!---    					 <b>Part 2 - Your Images </b><br>Upload and sequence your images online. Information is provided as to how you upload your scans in all of their sizes to your showcase on our site. Once these images are uploaded, tools are provided allowing you to easily sequence your images.
                    <br><br> --->
					<b>Part  2 - Sequence Images / Add Image Descriptions </b><br>
					Enter information about each image. To speed up data entry and reduce redundancy, a  template page will be used as 
the default information about each image unless you choose to override it on the Individual Artwork forms. In other words, the default template page is comprised on the basic information that will be used on most or all of your pictures. 
                    You will also be able to fill out Information 
                    that is unique to each individual piece of artwork.<br>
                    <br>
                    <b>Part 3 - Completion</b><br>
					View your showcase and communicate with us that you are ready to go live. Here you will inform us that you have completed all forms, uploaded and sequenced your images, and are ready for our final review.</font><br>
                    <br>
                    <br>
                    <font face="Verdana, Arial, Helvetica, sans-serif" size="2">Thank 
                    you for taking the time to carefully fill out these forms. They insure that all the information for your Showcase will be correct.<br>
                    <br>
                    </font></p>
                </div> </td>
            </tr>
            <tr valign="top"> 
              <td align="center" height="17">
                <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"><br><br>
<INPUT TYPE="SUBMIT" VALUE="Continue to Step 1">
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
