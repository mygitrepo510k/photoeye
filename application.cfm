<cfset BOW_cat = 'DS479'>
<cfset BOW_author = 'George Slade'>

<!--- <cfinclude template="index-maint.cfm"> <cfabort> --->
<cfif HTTP_USER_AGENT contains 'dev.photoeye.com'>
 <cfabort>

</cfif>

<!--- 12.6.2012 ip that was hitting us with odd url requests --->
<!--- /index.cfm/bookstore/auctions/bookstore/editions/gallery/auctions/bookstore/index.cfm  --->
<cfif CGI.X_FORWARDED_FOR is '42.62.36.90'>
	<cfabort>
</cfif>

<cfset robg_ip = "75.196.15.83">

<cfset dsn = "photoeyecom">
<cfset request.dsn = dsn>

<cfif HTTP_USER_AGENT contains '80legs' or HTTP_USER_AGENT contains 'Baiduspider'>
 <cfabort>

</cfif>

 <!--- DE 5/7/12
  !	Closed to bots on this blacklist.
  !--->
<cfset botblacklist = 'goodzer,sistrix' />
<cfloop list="#botblacklist#" index="bot">
	<cfif HTTP_USER_AGENT CONTAINS bot>
		<cfoutput>
			<p>You are making too many requests too fast, please slow down and wait 20 minutes.</p>
		</cfoutput>
		<cfheader statuscode="503" statustext="Service Unavailable">
		<cfheader name="Retry-After" value="#60*20#">
		<cfabort />
	</cfif>
</cfloop>

<cftry>

	<cfif cgi.SERVER_PROTOCOL neq "none"
			and (
				(NOT CGI.HTTP_HOST CONTAINS "www."
				AND NOT CGI.HTTP_HOST CONTAINS "dev."
				and cgi.http_host neq "76.12.245.137"
				and cgi.server_name neq "phe.byronmann.com")
				OR CGI.HTTP_HOST CONTAINS "photo-eye.com")>
		<cfif StructKeyExists(URL,'testingDomainIssues')>
			HELLO WORLD<cfabort />
		</cfif>
		<!--- Do they have a cart cookie on this domain? --->
		<cfif IsDefined("cookie.useridnumber")>
			<!--- Does it have any items in it? --->
			<cfquery name="checkForCartContents" dataSource="photoeyecom">
				SELECT *
				FROM OrderInfo
				WHERE UserID = <cfqueryparam CFSQLType="CF_SQL_INTEGER" maxLength="10" value="#cookie.useridnumber#" />
			</cfquery>
			<!--- regardless, let's get rid of this cookie --->
			<cfset useridnumber = cookie.useridnumber />
			<cfcookie name="useridnumber" value="" expires="now" />
			<cfif checkForCartContents.recordCount GT 0>
				<!--- Yes?  Okay, now relocate them to the proper domain (www.photoeye.com) --->
				<cflocation url="http://www.photoeye.com#CGI.PATH_INFO#?#CGI.QUERY_STRING#&cfb=#useridnumber#" addtoken="no" />
			<cfelse>
				<!--- No contents?  Okay, transfer them transparently to the proper domain --->
				<cflocation url="http://www.photoeye.com#CGI.PATH_INFO#?#CGI.QUERY_STRING#" addtoken="no" />
			</cfif>
		<!--- No cookie? Okay, just send them along transparently to the proper domain --->
		<cfelse>
			<cflocation url="http://www.photoeye.com#CGI.PATH_INFO#?#CGI.QUERY_STRING#" addtoken="no" />
		</cfif>
	</cfif>

	<cfcatch>
	<cfsavecontent variable="e">
		<cfdump var="#cfcatch#">
	</cfsavecontent>
	<cffile action="write" file="#getDirectoryFromPath(getCurrentTemplatePath())#/error.html" output="#e#"/>
	</cfcatch>
</cftry>

<cftry>
	<CFAPPLICATION NAME="photoeye"
		SESSIONMANAGEMENT="Yes"
		sessiontimeout="#CreateTimeSpan(0,0,20,0)#"
		applicationTimeout="#createTimeSpan(2,0,0,0)#"
		setclientcookies="yes"
		clientManagement="yes">
<cfcatch>
    <!--- Expire this browser's application cookie --->
     <cfcookie name = "JSESSIONID" expires = "NOW">
    <!--- Delete the application's session cookie --->
   	<cfset structDelete(cookie,'JSESSIONID') />
</cfcatch>

</cftry>

<!--- Set the Development / Production environment --->
<cfset application.xdev=0>
<CFSET APPLICATION.DOMAIN_NAME="photoeye.com">
<cfset application.ipi_root = "ipi_beta1z">
<cfset application.ipi_account_manager = "rixon@photoeye.com" />
<cfset application.ipi_beta = "ipi_beta1z">
<cfset application.ipi_permission = "ipi_login">
<cfset application.ipi_beta_status = "1">
<cfset application.bookoftheweek = "#BOW_cat#">
<cfset application.bookoftheweekheader = "<b>BOOK OF THE WEEK &mdash; A Pick by #BOW_author#</b>">
<cfset application.last_public_bestbooks_year = 2014 />

<!--- BLM, 07.21.2014, added some app vars to hold the collection name and path
	Used in: templates/msearchResults_Amazon2.cfm--->
<cfscript>
// BLM, 11.12.2014, use a bootloader to manage application and request settings and such.
// Doing this so it is easy to port application variables from one app to another.
createObject("component", 'cfc.bootloader').init();
// this can't go in the bootloader
request.UrlPrefix = repeatString("../", listLen(getBaseTemplatePath(), "/\") - listLen(getCurrentTemplatePath(), "/\"));
</cfscript>

<!--- temporary error exception exception --->
<cfif StructKeyExists(URL, '505debugging376algheaoihanobeoiagnogi38yt9278h3g29gnbe') OR StructKeyExists(SESSION, 'debugging365')>
	<cfif StructKeyExists(SESSION, 'debugging365')>
	<cfelse>
		<cflock timeout="20" scope="Session" type="exclusive">
			<cfset StructInsert(SESSION,'debugging365','true') />
		</cflock>
	</cfif>
	<cfif StructKeyExists(URL, 'stopdebugging365d8393htoig83t98376y2983u40239423')>
		<cflock timeout="20" scope="Session" type="exclusive">
			<cfset StructDelete(SESSION,'debugging365') />
		</cflock>
	</cfif>
	<cfset zzDebug = 1 />
<cfelse>
	<!--- or cgi.x_forwarded_for eq robg_ip or isDefined("cookie.pedebug") --->
	<cfif CGI.X_FORWARDED_FOR is '65.100.24.36'
				or CGI.X_FORWARDED_FOR is '71.210.205.240'
				or cgi.REMOTE_ADDR is "209.41.163.23">
		<cfset zzDebug = 1 />
	<cfelse>
		<cfset zzDebug = 0 />
	</cfif>
</cfif>
<cfset xswitch = 0>
<cfparam name="xurlhome" default="/">
<cfparam name="application.xurlhome" default="/">

<cfif zzDebug is 0 and cgi.x_forwarded_for neq '67.130.216.252'>
	  <cferror type="exception" template="templates/error.cfm">  
</cfif>

<cfif application.xdev is 0>
	<cfset application.XNEWROOT  = "http://www.photoeye.com">
	<CFSET xServerPath = "c:\inetpub\wwwroot\clients\photoeyecom\html">
	<!--- IPI application variables ADDED 03.02.2010 DE --->
	<cfset application.image_website_path="http://www.visualserver.com/ipi/">
	<cfset application.image_server_path="c:\inetpub\wwwroot\clients\visualservercom\html\ipi\">
	<!---  <CFSET xSSLUrl = "https://69.63.132.110"> --->
	<cfset xSSLUrl = "https://www.photoeye.com">
	<!--- This must be a legitimate web address and not an instaccount such as photo-eyecom.instaccount.net--->
	<cfset xCfhttpPath="http://www.photoeye.com">
	<cfset xRelativePath = "c:\inetpub\wwwroot\clients\visualservercom\html">
	<cfset application.xRelativePath = "c:\inetpub\wwwroot\clients\visualservercom\html">
	<CFSET xCache = "c:\inetpub\wwwroot\clients\photoeyecom\html\_cache">
	<cfset aSiteURL="http://photoeye.com">
	<cfset xPathOrdering ="#xSSLUrl#/templates/">
	<cfset xURLPath ="#xSSLUrl#/">
    <CFSET xURLHome = "#application.XNEWROOT#">
    <CFSET application.xURLHome = "#application.XNEWROOT#">
	<CFSET xTimeDifference = 2>
	<CFSET application.xTimeDifference = 2>

		<!--- from photobistro --->
	<cfset aVSPath = "c:\inetpub\wwwroot\clients\visualservercom\html">
<!---	<cfif CGI.QUERY_STRING is "Catalog=DQ168&i=9781934435144">
		<CFLOCATION URL="http://www.photoeye.com/editions">
	</cfif> --->
	<!--- FINALLY! Fixes the LOST SHOPPING CART BUG OF DOOOOOOOOOM... 2.24.2010 DE --->
	<!--- Are they not coming directly to www.photoeye.com? (photoeye.com, www.photo-eye.com, etc) --->

	<!--- If they're coming to the proper domain, did we just send them here with the code above? --->
	<cfif IsDefined("url.cfb")>
		<!--- Okay, let's identify them, create a new cart if they don't have one on this domain already --->
		<cfinclude template="/templates/useridentification.cfm" />
		<!--- Get the contents of both for the email below --->
		<cfquery name="oldCartContents" dataSource="photoeyecom">
			SELECT *
			FROM OrderInfo
			WHERE UserID = <cfqueryparam CFSQLType="CF_SQL_INTEGER" maxLength="10" value="#url.cfb#" />
		</cfquery>

		<cfquery name="currentCartContents" dataSource="photoeyecom">
			SELECT *
			FROM OrderInfo
			WHERE UserID = <cfqueryparam CFSQLType="CF_SQL_INTEGER" maxLength="10" value="#cookie.useridnumber#" />
		</cfquery>

		<!--- Let's copy all the contents of their old "wrong" cart into this one --->
		<cfquery name="importOldCart" dataSource="photoeyecom">
			UPDATE OrderInfo
			SET UserID = <cfqueryparam CFSQLType="CF_SQL_INTEGER" maxLength="10" value="#cookie.useridnumber#" />
			WHERE UserID = <cfqueryparam CFSQLType="CF_SQL_INTEGER" maxlength="10" value="#url.cfb#" />
		</cfquery>

		<!--- Notify rick that a cart was merged --->
		<cfmail from="admin@photoeye.com" to="rixon@photoeye.com" subject="Cart has been merged!" type="html">
			The cart number #url.cfb# and the contents:

			<cfdump var="#oldCartContents#" />

			Have been merged with cart number #cookie.useridnumber#, which already had:

			<cfdump var="#currentCartContents#" />

		</cfmail>
		<!--- Now lets show them the new merged cart and let them know what's going on --->
		<cflocation url="http://www.photoeye.com/templates/ViewOrder.cfm?cart_notice=1" />
	</cfif>
<cfelseif application.xdev is 1>
	<cfset application.XNEWROOT  = "http://photoeyedev.com/">
	<CFSET xServerPath = "c:\inetpub\wwwroot\clients\photoeyecom\html">
	<!--- IPI application variables ADDED 03.02.2010 DE --->
	<cfset application.image_website_path="http://www.visualserver.com/ipi/">
	<cfset application.image_server_path="\applications\coldfusion8\wwwroot\clients\visualservercom\html\ipi\">
	<!---  <CFSET xSSLUrl = "https://69.63.132.110"> --->
	<cfset xSSLUrl = "https://www.photoeyedev.com">
	<!--- This must be a legitimate web address and not an instaccount such as photo-eyecom.instaccount.net--->
	<cfset xCfhttpPath="http://photoeyedev.com">
	<cfset xRelativePath = "c:\inetpub\wwwroot\clients\visualservercom\html">
	<cfset application.xRelativePath = "c:\inetpub\wwwroot\clients\visualservercom\html">
	<CFSET xCache = "c:\inetpub\wwwroot\clients\photoeyecom\html\_cache">
	<cfset aSiteURL="http://photoeyedev.com">
	<cfset xURLPath ="#xSSLUrl#/">
    <CFSET xURLHome = "#application.XNEWROOT#">
    <CFSET application.xURLHome = "#application.XNEWROOT#">
   	<CFSET xTimeDifference = 0>
	<CFSET application.xTimeDifference = 0>
	<cfif CGI.QUERY_STRING is "Catalog=DQ168&i=9781934435144">
		<CFLOCATION URL="http://localhost/editions">
	</cfif>

<!--- Branch for localhost development --->
<cfelse>
	<cfset application.XNEWROOT  = "http://localhost/">
	<CFSET xServerPath = "\applications\coldfusion8\wwwroot\sites\photoeyecom\html">
	<!--- IPI application variables ADDED 03.02.2010 DE --->
	<cfset application.image_website_path="http:localhost/ipi/">
	<cfset application.image_server_path="\applications\coldfusion8\wwwroot\clients\visualservercom\html\ipi\">
	<!---  <CFSET xSSLUrl = "https://69.63.132.110"> --->
	<cfset xSSLUrl = "https://localhost">
	<!--- This must be a legitimate web address and not an instaccount such as photo-eyecom.instaccount.net--->
	<cfset xCfhttpPath="http://localhost">
	<cfset xRelativePath = "\applications\coldfusion8\wwwroot\sites\visualservercom\html">
	<cfset application.xRelativePath = "\applications\coldfusion8\wwwroot\sites\visualservercom\html">
	<CFSET xCache = "\applications\coldfusion8\wwwroot\clients\photoeyecom\html\_cache">
	<cfset aSiteURL="http://localhost">
	<cfset xPathOrdering = "">
	<cfset xURLPath = "http://localhost/">
	<CFSET xTimeDifference = 0>
	<CFSET application.xTimeDifference = 0>
	<cfif CGI.QUERY_STRING is "Catalog=DQ168&i=9781934435144">
		<CFLOCATION URL="http://localhost/editions">
	</cfif>
</cfif>

<!---<cfset application.googlekey ="ABQIAAAAGLygu72xTxPUIqNs3HgaixRGoefddpfKqX6LEQe43ATDUC4B8xTs1enEDprVOV5TidrQOUmVZpW7QA">--->
<cfset application.googlekey="ABQIAAAAGLygu72xTxPUIqNs3HgaixS7X2rHyalUndAmabl_0qy2SPNhAxREO6plcb6yKIK9Osn0fSZUhmnf5g">

<cfset application.imageSizer = "/templates/ImageSizer_CF.cfm">

<!--- Duplicate of above <cfset application.ipi_root="ipi_beta"> --->
<cfset application.ipi_mode="PRODUCTION">

<!--- RR 7/11/2007 This causes the debugging to NOT show on ALL pages if turned on, unless the page explicity has a <cfsetting showdebugoutput="yes"> --->
<cfsetting showdebugoutput="no">

<CFSET DATASOURCE = "photoeyecom">
<CFSET COMPANYNAME = "Photo-Eye Books and Prints">
<cfset ipi_dsn = "photoeyecom">

<cfset simple = 1>
<cfset xbird="delph99inus">
<cfset application.xbird="delph99inus">

<cfif CGI.CF_TEMPLATE_PATH DOES NOT CONTAIN "\html\index.cfm" AND CGI.CF_TEMPLATE_PATH DOES NOT CONTAIN "\emailnewsletter">
	<!--- <cfinclude template="templates/codecopyright.cfm"> --->
</cfif>

<!--- For use with Inventory vs StockWeb --->
<CFSET xLiveInventory = "StockWeb">

<CFSET xRootCache = "/_cache">

<!--- Show links to the Auction? --->
<CFSET aShowAuctions = 1>

<!--- Used to determine a light grey image border color --->
<CFSET aBorderColor = "Silver">

<!--- Special variable for easing the launch of new galleries, can be removed after the launch if all instances of "#aGalleryDirectory#" are replaced with "Gallery" (only occurs in the Gallery and templates directories) : 2003.10.17 --->
<CFSET aGalleryDirectory = "Gallery">

<!--- Added 8/19/07 For Amazon Rest Statements --->
<cfset amz_Service ="AWSECommerceService">
<cfset amz_AWSAccessKeyId = "1DT0B061XKHQ9CAT4X02">
<cfset amz_Version = "2009-01-06">
<!--- <cfset amz_Version = "2011-08-01">  --->

<cfset amz_associateid = "photoeyecom-20">
<!--- Added 8/10/09 to DRY up the Amazon statements --->
<cfset application.amazon_services_url = "http://webservices.amazon.com/onca/xml" />

<!--- Added 6/10/08 --->
<cfinclude template="/templates/Includes/sql_injection_prevention.cfm">

<!--- For debugging the cookie problem with James Pearce (jpierce39@yahoo.com) --->
<cfset request.userDebuggingEmail = "rixon@photoeye.com" />

<cfif CGI.SCRIPT_NAME CONTAINS 'ipi_beta1z'>
	<cfset request.protocol = 'https' />
</cfif>

