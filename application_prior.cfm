<!---
Header.cfm
Copyright Rixon Reed, 2001. All Rights Reserved.
Date Created: 12/07/01
Date Modified: 06/22/03
--->

<!---
If the shared SQL server is down, use this code
<cflocation url="http://www.photoeye.com/index.html">
<cfabort> --->

<!--- #<cferror 
    template="templates/Error_monitor.cfm"
    mailto="mmafc@dreamlounge.com"
    type="monitor"
	Exception="Handled"
	> # --->
<!----
<cferror 
    template="templates/error_message.cfm"
    mailto="mmafc@dreamlounge.com"
    type="exception"
	Exception="ANY"
	>
	--->
	<!--- <cferror 
    template="templates/error_message.cfm"
    mailto="mmafc@dreamlounge.com"
    type="exception"
	Exception="ANY"
	> --->
<!---	
<cfif cgi.REMOTE_ADDR NEQ "71.216.245.69">
	<cflocation url="http://www.photoeye.com/construction/index.html">
	<cfabort>
</cfif>--->

<CFAPPLICATION NAME="photoeye" SESSIONMANAGEMENT="Yes" sessiontimeout="#CreateTimeSpan(0,0,20,0)#" setclientcookies="yes">

<cfset application.XNEWROOT  = "http://www.photoeye.com">
<CFSET xServerPath = "c:\inetpub\wwwroot\clients\photoeyecom\html">
<!---<cfset application.googlekey ="ABQIAAAAGLygu72xTxPUIqNs3HgaixRGoefddpfKqX6LEQe43ATDUC4B8xTs1enEDprVOV5TidrQOUmVZpW7QA">--->
<cfset application.googlekey="ABQIAAAAGLygu72xTxPUIqNs3HgaixS7X2rHyalUndAmabl_0qy2SPNhAxREO6plcb6yKIK9Osn0fSZUhmnf5g">


<!--- RR 7/11/2007 This causes the debugging to NOT show on ALL pages if turned on, unless the page explicity has a <cfsetting showdebugoutput="yes"> --->
<cfsetting showdebugoutput="no">

<CFSET DATASOURCE = "photoeyecom">
<CFSET COMPANYNAME = "Photo-Eye Books and Prints">

 <cfset xSSLUrl = "https://www.photoeye.com"> 
<!---  <CFSET xSSLUrl = "https://69.63.132.110"> --->


<cfset xSwitch = 1>

<cfif xSwitch is 1>
	<cfset xPathOrdering ="#xSSLUrl#/templates/"> 
	<cfset xURLPath ="#xSSLUrl#/">
<!---  <CFSET xURLHome = "http://www.photoeye.com">  --->
   <CFSET xURLHome = "#application.XNEWROOT#">  
<!---  <CFSET xURLHome = "http://69.63.132.110">  --->
	<CFSET xTimeDifference = 2>
	<CFSET application.xTimeDifference = 2>
<cfelse>
	<cfset xPathOrdering = "">
	<cfset xURLPath = "http://localhost/photoeye/">
</cfif>

<cfset simple = 1>
<cfset xbird="delph99inus">

<cfinclude template="templates/codecopyright.cfm">

<!--- For use with Inventory vs StockWeb --->
<CFSET xLiveInventory = "StockWeb">

<!--- <CFSET xServerPath = "c:\inetpub\photoeye\">

<CFSET xCache = "c:\inetpub\wwwroot\clients\photoeyecom\_cache"> --->

<!--- This must be a legitimate web address and not an instaccount such as photo-eyecom.instaccount.net--->
<cfset xCfhttpPath="http://www.photoeye.com">


<cfset xRelativePath = "c:\inetpub\wwwroot\clients\visualservercom\html">
<cfset application.xRelativePath = "c:\inetpub\wwwroot\clients\visualservercom\html">

<CFSET xServerPath = "c:\inetpub\wwwroot\clients\photoeyecom\html">

<CFSET xCache = "c:\inetpub\wwwroot\clients\photoeyecom\html\_cache">

<CFSET xRootCache = "/_cache">

<cfif xSwitch is 0>
	<cfset aSiteURL="http://localhost/photoeye">
<cfelse>
<cfset aSiteURL="http://www.photoeye.com">
	
</cfif>

<!--- Show links to the Auction? --->
<CFSET aShowAuctions = 1>

<!--- Used to determine a light grey image border color --->
<CFSET aBorderColor = "Silver">

<!--- Special variable for easing the launch of new galleries, can be removed after the launch if all instances of "#aGalleryDirectory#" are replaced with "Gallery" (only occurs in the Gallery and templates directories) : 2003.10.17 --->
<CFSET aGalleryDirectory = "Gallery">

<!--- Added 8/19/07 For Amazon Rest Statements --->
<cfset amz_Service ="AWSECommerceService">
<cfset amz_AWSAccessKeyId = "1DT0B061XKHQ9CAT4X02">
<cfset amz_Version = "2007-07-16">
<cfset amz_associateid = "photoeyecom-20">

<!--- Added 6/10/08 --->
<cfinclude template="/templates/Includes/sql_injection_prevention.cfm">


