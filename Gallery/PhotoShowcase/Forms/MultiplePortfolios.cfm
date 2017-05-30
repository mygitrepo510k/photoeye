<cfif IsDefined("URL.id")>
	<cfset id=#url.id#>

<cfelse>
	<cfset id = #qGetShowcaseSetupInfo.Custnumber#>
	
</cfif>

<CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
  SELECT DISTINCT *
  FROM GallerySetup
  WHERE Custnumber = #id#
</CFQUERY>

<!--- Query multiple portfolios ---> 
<CFQUERY NAME="qGetPortfolios"  DATASOURCE="photoeyecom">
  SELECT DISTINCT P.CustNumber, D.Custnumber, P.Subdirectory, D.Subdirectory, D.PortfolioName, P.ShowcaseOK 
  FROM GalleryPortfolio as P, GalleryDefaultPhotos as D
  WHERE P.Custnumber = #id#  and P.custnumber=D.Custnumber and P.Subdirectory=D.Subdirectory;
</CFQUERY>


<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">

<html>

<head>
<title>photo-eye Photographer's Showcase | Multiple Portfolios</title>
</head>

<body bgcolor="GRAY" link="#000080" vlink="#000080">
<!--- <form method="post" action="Step1BasicData.cfm?Custnumber=<cfoutput>#URL.Custnumber#</cfoutput>"> --->
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
                  <br>
                  <font size="2">Choose which Portfolio to Administer<br>
                  <br>
                  <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"></font></font></td>
 
             
            </tr>
<cfoutput>

            <tr valign="top"> 
              <td align="center" height="526"> 
                <div align="left"> 
                  <p align="left">
				 <cfset portfolionumber=1> 
			<!--- 	 <cfset break = 0> --->
				 <cfset totalPortfolios=#qGetPortfolios.recordcount#>
				  		
						
						<cfloop QUERY=qGetPortfolios startrow="1" endrow="#totalPortfolios#">
			
			<!--- Show the portfolio is showcaseok is 1--->
			<!--- <cfif qGetPortfolios.showcaseok is 1> --->
			
<!--- 			<cfif fileexists(Expandpath("../../#qGetShowcaseSetupInfo.Gallery#/Artists/#qGetShowcaseSetupInfo.Subdirectory#/#qGetPortfolios.Subdirectory#/Images_Thumbs/image1.jpg"))>		 --->
				<!--- If Showcase is OK, go to Administration, Otherwise Go to Setup--->
				<cfif qGetPortfolios.ShowcaseOK>
				<a href="indexadminMultiplePortfolios.cfm?custnumber=#qGetShowcaseSetupInfo.custnumber#&portfolio=#qGetPortfolios.Subdirectory#" target="_parent">
				<cfelse>
					<a href="indexsetupMultiplePortfolios.cfm?custnumber=#qGetShowcaseSetupInfo.custnumber#&portfolio=#qGetPortfolios.Subdirectory#" target="_parent">			
				</cfif>


<!--- ImageSizer --->									
<cfset xheight=64>
<cfset xwidth=75>
<cfset xImageAddress = "#xRelativePath#\artists\#qGetShowcaseSetupInfo.Subdirectory#\#qGetPortfolios.Subdirectory#\Images_Large\">
<!--- <cfset xPath= "http://www.visualserver.com/artists/#qGetShowcaseSetupInfo.Subdirectory#/#qGetPortfolios.Subdirectory#/Images_Large/"> --->
<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image1.jpg">

<cfinclude template="../../../templates/imagesizer.cfm">

<img src="../../../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a>
<!--- End ImageSizer --->
			

			    <br><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>				<cfif qGetPortfolios.ShowcaseOK>
				<a href="indexadminMultiplePortfolios.cfm?custnumber=#qGetShowcaseSetupInfo.custnumber#&portfolio=#qGetPortfolios.Subdirectory#" target="_parent">
				<cfelse>
					<a href="indexsetupMultiplePortfolios.cfm?custnumber=#qGetShowcaseSetupInfo.custnumber#&portfolio=#qGetPortfolios.Subdirectory#" target="_parent">			
				</cfif>
#qGetPortfolios.PortfolioName#</a></b></font><br><br><br>
				
<!--- 				<cfif break is 1>
					<br><br>
					<cfset break = 0>
				<cfelse>
					<cfset break = 1>
				</cfif> --->
			
		<!--- 	</cfif> --->
			
			<!--- </cfif> --->
			
			<cfset portfolionumber=portfolionumber+1>
			
			
		</cfloop>	
		
		<cfif #trim(qGetShowcaseSetupInfo.gallery)# is not "PhotoShowcase">
				<font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>					<a href="IndexSetupImages.cfm?id=#qGetShowcaseSetupInfo.custnumber#" target="_parent">	
<!--- <a href="AddMorePortfolios.cfm?custnumber=#qGetShowcaseSetupInfo.custnumber#&portfolio=#qGetPortfolios.Subdirectory#" target="_parent"> --->Add Additional Portfolios</a></b></font>
		</cfif>
		
</cfoutput>
				  </p>
                </div> </td>
            </tr>
            <tr valign="top"> 
              <td align="center" height="17">
                <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"><br><br>
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
