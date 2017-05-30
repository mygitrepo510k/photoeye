<CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
  SELECT DISTINCT *
  FROM GallerySetup
  WHERE Password = '#form.Password#' and  Email = '#form.Email#' ;
</CFQUERY>



<CFQUERY NAME="qGetShowcaseUserInfoNew"  DATASOURCE="photoeyecom">
  	SELECT *
  	FROM UserInfoNew  
  	WHERE Password = '#form.Password#' and  Email = '#form.Email#' order by OrderID DESC;
</CFQUERY>

<cfset xportfoliocredits=0>

<CFIF qGetShowcaseUserInfoNew.recordcount GT 0>
			<CFQUERY NAME="qGetShowcaseApplicationInfo"  DATASOURCE="photoeyecom">
  				SELECT *
  				FROM GalleryApplication
 				WHERE orderid = #qGetShowcaseUserInfoNew.orderid# 
		</CFQUERY>
		<cfset xportfoliocredits=#qGetShowcaseApplicationInfo.portfoliocredits#>
</CFIF>

<cfif qGetShowcaseSetupInfo.recordcount GT 0 and #xportfoliocredits# GT 0>
	<cfif qGetShowcaseApplicationInfo.portfoliocredits GT 0>
		<CFLOCATION URL="WhereDoYouWantToGo.cfm?id=#qGetShowcaseApplicationInfo.orderid#&Custnumber=#qGetShowcaseSetupInfo.Custnumber#">
	</cfif>
<!--- First time applying, no account setup yet--->	
<cfelseif qGetShowcaseSetupInfo.recordcount is 0 and #xportfoliocredits# GT 0>
	<CFLOCATION URL="../application/indexapplicationpayment.cfm?id=#qGetShowcaseApplicationInfo.orderid#">
</CFIF>

<CFIF #form.Password# is "SuperAdmin" and #Ucase(form.email)# is "JACKREED@PHOTOEYE.COM">

<cfoutput>
<cfinclude template="indexsetupSuperAdmin.cfm">
</cfoutput>

<CFELSEIF #form.Password# is "QuarK" and #Ucase(form.email)# is "JR@PHOTOEYE.NET">

<cfoutput>
<CFLOCATION URL="../../index1.html" ADDTOKEN="No">
</cfoutput>

<CFELSEIF #qGetShowcaseSetupInfo.Password# is "">

<CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup
  WHERE Email = '#form.Email#'
</CFQUERY>
	
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">


<html>

<head>
<title>photo-eye Photographer's Showcase | Set Up Form </title>
</head>
<body bgcolor="gray" link="#000080" vlink="#000080">
<div align="center"><center>

	<form action="Step0VerifyPassword.cfm" method="post">
<br>

   <table width="85%" bgcolor="#FFFFFF" align="center">
      <tr><td align="center"> 
  
	          
            <table width="95%" border="0" cellpadding="5" bgcolor="#FFFFFF" cellspacing="0" valign="top" align="center">
              <tr valign="top"> 
                <td colspan="3" align="left"> <br>
                  <img src="../SharedImages/photo-eye%20Explore%20NewLogo_photoShowcaseVersionWhiteBackground.jpg" width="151" height="94"></td>
              </tr>
              <TR> 
                <TD COLSPAN="3" ALIGN="LEFT"><font face="Verdana,Arial,Helvetica,sans-serif" size="4">Email or Password Not Found</font><font face="Verdana,Arial,Helvetica,sans-serif" size="5"><br>
                  <font size="2">Retry password to setup your Showcase<br>       
				  <br>
                  <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"></font></font></td>
              </tr>
              <tr> 
                <td width="49%" valign="top" height="154"> 
                  <p> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Your 
                    e-mail address:</b></font><br>
                    <font face="Verdana,Arial,Helvetica,sans-serif" size="5"><font size="2"> 
                    <input type="text" size="30" maxlength="50" name="Email" value="<cfoutput>#form.email#</cfoutput>">
                    </font></font><br>
                    <br>
                    <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Your 
                    Password:</b> (Case Sensitive)<br>
                    Use your Customer Number Initially<font color="red"></font> 
                    </font><br>
                    <input type="password" size="30" maxlength="50" name="Password">
                    <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><br>
                    <br>
                    <br>
                    <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b><a href="Passwordhint.cfm">Password Hint</a></b></font> </font> </p>
                  </td>
                <td width="2%" valign="top" align="left" height="154"> 
                  <div align="center"><img src="Images/BlackRule.gif" width=1 height=100% alt="" border="0"></div>
                </td>
                <td valign="top" width="49%" height="154"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><b> 
                  </b></font> </td>
              </tr>
              <tr> 
                <td align="center" colspan="3"> 
                  <p><img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"><br>
                    <br>
                    <INPUT TYPE="SUBMIT" VALUE="Continue Login">
                    <br>
                    <br>
                    <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"> 
                    <BR>
                    <FONT FACE="Arial, Helvetica, Sans-Serif" size="2"><IMG SRC="images/photoeyebooks&prints.gif" WIDTH=308 HEIGHT=28 BORDER=0><br>
                    376 Garcia Street, Santa Fe, NM 87501<br>
                    Orders Only: 800-227-6941 Info: 505-988-5152 Fax: 505-988-4487<br>
                    E-Mail: <a href="mailto:webmaster@photoeye.com">webmaster@photoeye.com</a><br>
                    © photo-eye books &amp; prints, <cfoutput>#YEAR(Now())#</cfoutput>. All Rights Reserved.</font><br> 
                    <FONT FACE="Arial, Helvetica, Sans-Serif" size="1">This entire 
                    web site is the © copyrighted property of photo-eye books 
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
</form>
</center>
</div>
</body>
</html>


<CFELSE>



<!--- <CFQUERY NAME="qGetApplication"  DATASOURCE="photoeyecom">
  SELECT Accepted, OnlineFeeSubmitted, ImagesAccepted, ImagesDelivery
  FROM GalleryApplication
  WHERE Custnumber = #qGetShowcaseSetupInfo.Custnumber# ;
</CFQUERY>  --->

<!--- Query to see if there are multiple portfolios ---> 
<CFQUERY NAME="qGetPortfolios"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryPortfolio
  WHERE Custnumber = #qGetShowcaseSetupInfo.Custnumber# ;
</CFQUERY>

<cfif qGetPortfolios.recordcount gt 1>
	<cfset MultiplePortfolios = 1>
<cfelse>
	<cfset MultiplePortfolios = 0>
</cfif>

<!--- If there are multiple portfolios --->
<cfif MultiplePortfolios is 1>
		<cfinclude template="multipleportfolios.cfm">
<cfelse>
	<cfif qGetPortfolios.Showcaseok is 1>
		<cfinclude template="indexadmin.cfm">
	<cfelseif qGetShowcaseSetupInfo.imagesok is 1>
		<cfinclude template="indexsetup.cfm">
	<cfelse>
 		<cfinclude template="indexsetupimages.cfm">
	</cfif>
</cfif>

</CFIF>

