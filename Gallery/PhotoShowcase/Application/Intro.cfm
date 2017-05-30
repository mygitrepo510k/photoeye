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
			
			    
              <TD COLSPAN="3" ALIGN="LEFT"><font face="Verdana,Arial,Helvetica,sans-serif" size="4">Step 
                1 - Introduction</font><font face="Verdana,Arial,Helvetica,sans-serif" size="5"> 
                <br>
                  <font size="2">How these Administration forms are organized<br>
                  <br>
                  <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"></font></font></td>
 
             
            </tr>


            <tr valign="top"> 
              
        <td align="center" height="526"> 
          <p align="left">
                    <b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Please 
                    note that Netscape Navigator or Internet Explorer 4.0 or higher 
                    are required to use these administration pages.</font></b><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><br><br>
Each artist is responsible for keeping their Showcase information accurate and up-to-date. This includes current pricing and availability. Simply fill out the forms step-by-step according to the table of contents on the left side. Then view your Showcase when all steps are completed. You may make changes at any time, even after your Showcase is complete.</font></p>
                  
          <p> 
          <table width="100%" border="0" cellspacing="0">
                <tr> 
                  <td> 
                    <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>1 - Prepare your Images</b></font> 
                        <hr width="100%" size="1" noshade>
                    </div>
                  </td>
                </tr>
              </table>
             	
            <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"> 
              Color correct and spot all images before uploading them to the photo-eye 
              server. They should be ready to display. After uploading, your images 
              will be resized based on Showcase requirements. There may be additional 
              charges if your uploaded images need work. <br>
              <br>
              Save images as a .jpg at a high compression ratio, around 75%, and 
              with the width and/or height to be at least 1,000 pixels (~ 14 inches) 
              at 72 dpi (dots per inch). Each file size should be less than 200k, 
              preferably around 100k. <br>
              <br>
              Use the naming convention shown in the example below. Name the images 
              in the order in which you would like the jurors to view your work. 
              This extremely important if your work is a visual narrative.<br>
              <br>
              </font> </div>
            <table width="100%" border="0" cellspacing="0">
                <tr>
                  <td>
                    <div align="left"> 
                      
                   	<font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Example:<br>
                      </b></font>
                        <hr width="100%" noshade size="1">
                      <font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>
					  Image1.jpg (First image to be juried)
                      <br>
                      <br>
                      Image2.jpg (Second Image to be juried)
					  <br>
                      <br>
                      Image3.jpg (Third Image to be juried)
					  <br>
                  	  <br>
					  And so on ...
					  <br><br>
                      
					<font size="2" color="red">


(Maximum of 

20

images)
</font></b> </font></div>
                  </td>
                </tr>
              </table>
              <table width="100%" border="0" cellspacing="0">
                <tr> 
                  <td> 
				  
                    <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b><br>
                      2 - Upload your Images</b></font> 
                        <hr width="100%" size="1" noshade>
                    </div>
                  </td>
                </tr>
              </table>
              
            <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"> 
              Once you click the button at the bottom of the page, you should 
              be prepaired to upload your images. These instructions will be repeated 
              for you convenience there. To upload images on the following page, 
              simply click the &quot;Browse&quot; button to the right of each 
              text box, and access the appropriate .jpg file on your computer. 
              Select the particular file that you would like to upload by clicking 
              on the appropriate filename. Next, press the &quot;Open&quot; button. 
              The filename and location will appear in the Upload Image text box. 
              Repeat these steps for all all images to be uploaded. When finished 
              press the &quot;Upload Images&quot; button at the bottom of your 
              screen. Within 7 business days, you will be contacted by email with 
              the jurors' decision. If accepted, you will be given instructions 
              on how to proceed.<br>
              <!--- 				In 2-4 business days, you will be contacted 
                by email directing you to the appropriate location 
                to continue working on your Showcase ---> <br>
              If you have any questions reguarding your images or this procedure, 
              please call 1-800-227-6941 and ask for Photographer's Showcase help. 
              We will be happy to assist you. <br>
              <br>
              </font> </div>
            <table width="100%" border="0" cellspacing="0" cellpadding="4">
            <tr valign="top"> 
              <td align="center" height="17"> <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"><br> <hr width="100%" size="1" noshade>
             <form method="post" action="UploadImages.cfm?custnumber=<cfoutput>#URL.Custnumber#</cfoutput>">
                <INPUT TYPE="SUBMIT" VALUE="Continue to Step 2">
           <br><br>
                  <input type="submit" name="reset" value="Print Window &amp; Continue to Step 2" onClick="javascript:window.print();"> </form>
                  <br>
       <hr width="100%" size="1" noshade>
              </td>
            </tr>
            <tr> 
              <td align="center"><font face="Arial, Helvetica, Sans-Serif" size="2"><img src="../Forms/Images/photoeyebooks&prints.gif" width="308" height="28" border="0" alt=""><br>
                376 Garcia Street, Santa Fe, NM 87501<br>
                Orders Only: 800-227-6941 Info: 505-988-5152 Fax: 505-988-4487<br>
                E-Mail: <a href="mailto:webmaster@photoeye.com">webmaster@photoeye.com</a><br>
                © photo-eye books &amp; prints, <cfoutput>#YEAR(Now())#</cfoutput>. 
                All Rights Reserved.</font> <font face="Arial, Helvetica, Sans-Serif" size="1">This 
                entire web site is the © copyrighted property of photo-eye books 
                &amp; prints, except where artists' and publishers' copyrights 
                on the materials described take precedence. No portion of the 
                contents within may be reproduced in any form, for any non-private 
                use, without the express written permission of photo-eye books 
                &amp; prints.</font></td>
            </tr>
          </table>
   
  </table>

</table>  </div>
</body>
</html>
