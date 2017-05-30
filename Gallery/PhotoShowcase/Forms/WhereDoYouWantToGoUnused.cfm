

<CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup
  WHERE Custnumber = #url.custnumber#
</CFQUERY>

<!--- Query multiple portfolios ---> 
<CFQUERY NAME="qGetPortfolios"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryPortfolio
  WHERE Custnumber = #url.Custnumber# ;
</CFQUERY>


<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">

<html>

<head>
<title>photo-eye Photographer's Showcase | Where do you want to go?</title>
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
			
			    <TD COLSPAN="3" ALIGN="LEFT">

<font face="Verdana,Arial,Helvetica,sans-serif" size="2"><br>
<br>
Welcome <cfoutput>#qGetShowcaseSetupInfo.FirstName# #qGetShowcaseSetupInfo.LastName#</cfoutput>. Please choose from the following options:<br>
<cfoutput>
<br>
<a href="../application/indexapplicationpayment.cfm?id=#url.id#" target="_top">Click Here</a> to submit your portfolio to the Photographer's Showcase jury.<br><br><br>

<hr noshade size="1" color="black" width="100%"><br>
Administer one of the following portfolio already online.<br><br>




		<table>
            <tr valign="top"> 
              <td align="center" height="526"> 
                <div align="left"> 
                  <p align="left">
				 <cfset portfolionumber=1> 
			<!--- 	 <cfset break = 0> --->
				 <cfset totalPortfolios=#qGetPortfolios.recordcount#>
				  		<cfloop QUERY=qGetPortfolios startrow="1" endrow="#totalPortfolios#">
			
			<cfif fileexists(Expandpath("../../#qGetShowcaseSetupInfo.Gallery#/Artists/#qGetShowcaseSetupInfo.Subdirectory#/Portfolio#portfolionumber#/Images_Thumbs/image1.jpg"))>		
				<!--- If Showcase is OK, go to Administration, Otherwise Go to Setup--->
				<cfif qGetPortfolios.ShowcaseOK>
				<a href="indexadminMultiplePortfolios.cfm?custnumber=#qGetShowcaseSetupInfo.custnumber#&portfolio=Portfolio#portfolionumber#" target="_parent">
				<cfelse>
					<a href="indexsetupMultiplePortfolios.cfm?custnumber=#qGetShowcaseSetupInfo.custnumber#&portfolio=Portfolio#portfolionumber#" target="_parent">			
				</cfif>
<img src="../../#qGetShowcaseSetupInfo.Gallery#/Artists/#qGetShowcaseSetupInfo.Subdirectory#/Portfolio#portfolionumber#/Images_Thumbs/image1.jpg" border="0"></a>
			    <br><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>				<cfif qGetPortfolios.ShowcaseOK>
				<a href="indexadminMultiplePortfolios.cfm?custnumber=#qGetShowcaseSetupInfo.custnumber#&portfolio=Portfolio#portfolionumber#" target="_parent">
				<cfelse>
					<a href="indexsetupMultiplePortfolios.cfm?custnumber=#qGetShowcaseSetupInfo.custnumber#&portfolio=Portfolio#portfolionumber#" target="_parent">			
				</cfif>Portfolio #portfolionumber#</a></b></font><br><br><br>
				
<!--- 				<cfif break is 1>
					<br><br>
					<cfset break = 0>
				<cfelse>
					<cfset break = 1>
				</cfif> --->
			
			</cfif>
			

			
			<cfset portfolionumber=portfolionumber+1>
			
			
		</cfloop>	
		
		
		</td></tr></table>
</cfoutput>
</td></tr></table>
</td></tr></table>

</body>
</html>
