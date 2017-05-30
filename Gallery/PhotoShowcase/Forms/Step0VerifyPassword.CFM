<cfset xtreepath = "../../">

<CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
  SELECT DISTINCT *
  FROM GallerySetup
  WHERE Ltrim(Password) = '#trim(form.Password)#' and  Ltrim(Email) = '#trim(form.Email)#' ;
</CFQUERY>

<!--- <cfoutput><cfif cgi.x_forwarded_for is '67.130.216.252'>#qGetShowcaseSetupInfo.recordcount#<cfabort></cfif></cfoutput> --->

<CFQUERY NAME="qGetShowcaseUserInfoNew"  DATASOURCE="photoeyecom">
  	SELECT *
  	FROM UserInfoNew  
  	WHERE Ltrim(Password) = '#trim(form.Password)#' and  Ltrim(Email) = '#trim(form.Email)#' order by OrderID DESC;
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

<CFIF #form.Password# is "SuperAdmin" and #Ucase(form.email)# is "JACKREED99@PHOTOEYE.COM">

	<cfoutput>
	<cfinclude template="indexsetupSuperAdmin.cfm">
	</cfoutput>
	
	<CFELSEIF #form.Password# is "QuarK" and #Ucase(form.email)# is "JR@PHOTOEYE.NET">
	
	<cfoutput>
	<CFLOCATION URL="../../index1.html" ADDTOKEN="No">
	</cfoutput>

<CFELSEIF #qGetShowcaseSetupInfo.Password# is "">
	<!--- I'm not sure if this query is needed--->
	
	<CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
	  SELECT *
	  FROM GallerySetup
	  WHERE ltrim(Email) = '#trim(form.Email)#'
	</CFQUERY>
		
	<cfinclude template="../../includes/dsp_galleries_index_top.cfm">
	
	<div align="center"><center>
	
		<form action="Step0VerifyPassword.cfm" method="post">
	
	
	   <table width="85%" bgcolor="#FFFFFF" align="center">
	      <tr><td align="center"> 
	  
		          
	            <table width="95%" border="0" cellpadding="5" bgcolor="#FFFFFF" cellspacing="0" valign="top" align="center">
	
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
	                </td>
	                <td valign="top" width="49%" height="154"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><b> 
	                  </b></font> </td>
	              </tr>
	              <tr> 
	                <td align="left" colspan="3"> 
	                  <p><img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"><br>
	                    <br>
	                    <INPUT TYPE="SUBMIT" VALUE="Continue Login">
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
	<cfinclude template="../../includes/dsp_galleries_index_bottom.cfm">



<CFELSE>

<!--- The password and email address are verified --->

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

