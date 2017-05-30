
<!--- <CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
  		SELECT *
  		FROM GallerySetup
 		WHERE OrderId = #url.id#
</CFQUERY>
 --->
<!--- <CFQUERY NAME="qGetShowcaseApplicationPortfoliosSelect"  DATASOURCE="photoeyecom">
  Select * from GalleryApplicationPortfolios WHERE OrderId = #url.id#
</CFQUERY>

<CFQUERY NAME="qGetShowcaseApplicationInfo"  DATASOURCE="photoeyecom">
  Select * from GalleryApplication WHERE OrderId = #url.id#
</CFQUERY>

<cfif qGetShowcaseApplicationSelect.recordcount is 0>

<CFQUERY NAME="qInsertOrderId"  DATASOURCE="photoeyecom">
  		INSERT into GalleryApplication (OrderId)
  		VALUES (#url.id#)
</CFQUERY>

</cfif>	 --->


 

<cfinclude template="header.cfm">

<body bgcolor="#999999" text="black" link="Navy" vlink="Navy" alink="Red">
<!--- <form method=post enctype="text/plain" action="../../../templates/PasswordEnter.cfm?ShowcaseDoor=1"><div align="center"> --->
<form method=post enctype="text/plain" action="Bio.cfm?id=<cfoutput>#URL.ID#</cfoutput>"><div align="center">

	      
		   <table width="85%" bgcolor="#FFFFFF">
      <tr><td align="center">
  
	          
          <table width="95%" border="0" cellpadding="5" bgcolor="#FFFFFF" cellspacing="0" valign="top" align="center">
            <tr valign="top"> 
              <td colspan="3" align="left"><img src="/images/photoeye_logo_magazine.png" width="196" height="100">
</td>
            </tr>
			<TR>
			
			    <TD COLSPAN="3" ALIGN="LEFT"><font face="Verdana,Arial,Helvetica,sans-serif" size="4">Overview</font><font face="Verdana,Arial,Helvetica,sans-serif" size="5"> 
                  <br>
                  <font size="2">Welcome to the photo-eye Project/Portfolio Online Application<br>
                  <br>
                 <HR size=1 noshade></font></font></td>
 
             
            </tr>
     
         <!--- <font face="Verdana,Arial,Helvetica,sans-serif" size="5" Color="black"><font size="2"><img src="../SharedImages/photo-eye%20Explore%20NewLogo_photoShowcaseVersionReversed.jpg" width="151" height="94"></font></font></td> 
    <td width="95%" height="51" colspan="3" align="center" bgcolor="Black"><img src="../SharedImages/photoeyeexplorephotographersshowcase7.jpg" width="384" height="84" alt="" border="0"></td>

            </tr><TR><TD COLSPAN="3" ALIGN="LEFT">
                <br><font face="Verdana,Arial,Helvetica,sans-serif" size="4" Color="black">Overview<br>
                  <font size="2"><b>Welcome to the Photographer's Showcase Online Application</b></font></font> 
<hr width="100%" size="1" noshade color="Red"> --->
              
             
            <tr valign="top"> 
              <td align="center" height="420"> 
                <div align="left"> 
                    <b><font face="Verdana, Arial, Helvetica, sans-serif" size="1" Color="black"><!---Netscape Navigator or Internet Explorer 4.0 or higher are required to use our Online Application.---></font></b><p></p>
                  <p align="left"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="Black"> 
                    <b>At this time, applications and submissions are accepted 
                     online only  using the following application 
                    process.</b><br>
                    </font> <br>
                    <b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" Color="black"> 
                    Step 1 - Pay Application Fee - <font color="red">Already Complete</font></font></b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#333333"> 
                    <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#333333"><br>
                    </font><br>
                    </font>
                  <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#333333">
                  <hr size="1" noshade color="black">
                  <br>
                  <font face="Verdana, Arial, Helvetica, sans-serif" size="2" Color="black"> 
                  <b>Step 2 - Artist R&eacute;sum&eacute; (optional)</b></font><br>
                  <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#333333">Include 
                  your education, exhibitions, awards, and any additional information 
                  that indicates your commitment to photography. If you already 
                  have a bio saved in your computer, simply copy and paste the 
                  text from that document into the form provided. Don't be concerned 
                  about any formatting changes as we are only
                  only interested in the information.<br>
                  </font> <br>
                  <hr size="1" noshade color="black">
                  <br>
                  <font face="Verdana, Arial, Helvetica, sans-serif" size="2" Color="black"> 
                  <b>Step 3 - Artist Statement (optional)</b></font><br>
                  <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#333333"> 
                  Include a short statement (three paragraphs or less) about your 
                  body of work and/or what you explore as an artist. If these 
                  images are a visual narrative, please give the jurors some background 
                  information. If you already have a artist statement in a word 
                  processing document, simply copy and paste that text into the 
                  form provided. Don't be concerned about any formatting changes. 
                  
                  <br>
                  </font> <br>
                  <hr size="1" noshade color="black">
                  <br>
                  <font face="Verdana, Arial, Helvetica, sans-serif" size="2" Color="black"> 
                  <b>Step 4 - Process Statement (optional)</b></font><br>
                  <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#333333">Describe 
                  the technical process(es) you use in your work. Include any 
                  camera or darkroom techniques that make your work distinctive. 
                  If you already have a process statement in a word processing 
                  document, simply copy and paste that text into the form provided. 
                  Don't be concerned about any formatting changes. At this point, 
                	<br>
                  </font> <br>
                  <hr size="1" noshade color="black">
                  <br>
                  <font face="Verdana, Arial, Helvetica, sans-serif" size="2" Color="black"> 
                  <b>Step 5 - Title List (optional)</b></font><br>
                  <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#333333"> 
                  Enter Titles for your Images. Include Process, Dimensions, and 
                  Retail Price.<br>
                  </font> <br>
                  <hr size="1" noshade color="black">
                  <br>
                  <font face="Verdana, Arial, Helvetica, sans-serif" size="2" Color="black"> 
                  <b>Step 6 - Upload Images</b></font><br>
                  <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#333333"> 
                  Color correct and spot all images before uploading them to the 
                  <b>photo-eye</b> server. Your images should be ready to display. 
                  After uploading, if your images are accepted, <b>photo-eye</b> 
                  will resize them based on our requirements. There may be 
                  other charges if your uploaded images need additional work.<br>
                  <br>
                  Save all images as JPEGS using the .jpg extension. The JPEG 
                  compression setting, should be low, around 75%, with the width 
                  and/or height set to at least 1,000 pixels (~ 14 inches) at 
                  72 dpi (dots per inch). Save files use the PhotoShop Save for Web feature or make sure the color space is sRGB. Each file should average between 100k 
                  to 300k in size. <br>
                  <br>
                  Use the naming convention shown in the example below. Name the 
                  images in the order in which you would like the jurors to view 
                  your work. This extremely important if your work is a visual 
                  narrative.<br>
                  <br>
                  </font> 
                  <table width="100%" border="0" cellspacing="0">
                    <tr> 
                      <td> 
                        <div align="left"> <font face="Verdana,Arial,Helvetica,sans-serif" size="2" color="#333333"><b>Name 
                          your images as follows:<br>
                          </b></font> 
                          <hr width="70%" noshade size="1">
                          <font face="Verdana,Arial,Helvetica,sans-serif" size="2" color="#333333"><b> 
                          Image1.jpg (First image to be juried) <br>
                          <br>
                          Image2.jpg (Second Image to be juried) <br>
                          <br>
                          Image3.jpg (Third Image to be juried) <br>
                          <br>
                          And so on ... <br>
                          <br>
                          (Maximum of 20 images) </b> </font></div>
                      </td>
                    </tr>
                  </table>
                  <br>
                  The form used for uploading your work to our server is provided 
                  in this step.<br>
                  </font> <br>
<!---                   <hr size="1" noshade color="black"><br>
                  <font face="Verdana, Arial, Helvetica, sans-serif" size="2" Color="black">   <b>Step 7 - Completion</b></font><br>
                 <font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#333333">   Send an e-mail that notifies us that you have completed all steps. That's all there is to it!  Normally a decision is made within one week. You will receive an email with the jury's decision and instructions as to how to proceed.</font> --->
                </div>
              </td>
            </tr>
            <tr valign="top"> 
              <td align="center">
                <hr size="1" noshade color="black"><!--- <img src="../forms/images/BlackRule.gif" width=50% height=1 alt="" border="0"> ---><br>
				 
                <INPUT TYPE="SUBMIT" VALUE="Continue Online Application">
                <br><img src="../forms/images/BlackRule.gif" width=100% height=1 alt="" border="0">
              </td>
            </tr>
			
			<cfinclude template="footer.cfm">
          </table>
   
</td>
            </tr>
          </table>

  </div>
</form>
</body>
</html>
