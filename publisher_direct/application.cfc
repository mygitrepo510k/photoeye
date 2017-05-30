<!--- Ben Nadel's application.cfc framework --->


<cfcomponent
displayname="Application"
output="true"
hint="Handle the application."
>


<!--- Set up the application. --->
<cfset THIS.Name = "photoeye" />
<cfset THIS.ApplicationTimeout = CreateTimeSpan( 0, 3, 0, 0 ) />
<cfset THIS.SessionManagement = true />
<cfset THIS.SessionTimeout = CreateTimeSpan( 0, 3, 0, 0 ) />
<cfset THIS.SetClientCookies = true />
<cfset THIS.ClientManagement="yes" />




<!--- Define the page request properties. --->
<cfsetting
requesttimeout="20"
showdebugoutput="false"
enablecfoutputonly="false"
/>


  
<cffunction
name="OnApplicationStart"
returntype="boolean"
output="false"
hint="Fires when the application is first created.">





<!--- Return out. --->
<cfreturn true />
</cffunction>



<cffunction
name="OnSessionStart"
access="public"
returntype="void"
output="false"
hint="Fires when the session is first created.">

	<!--- Return out. --->
	<cfreturn />
</cffunction>


<cffunction
name="OnRequestStart"
access="public"
returntype="boolean"
output="false"
hint="Fires at first part of page processing.">
 
 
       
	<!--- Define arguments. --->
	<cfargument
	name="TargetPage"
	type="string"
	required="true"
	/> 
		<cfset var pdPublicPaths = '' />
		<cfset var pdAdminPaths = '' />
		<cfset var superUser = false />
		<cfset var qSuperAdmin = '' />
		<cfset var qPD_user = '' />
		
	 <!--- Important that this is here and nowhere else --->
<!---
		<cfif NOT StructKeyExists(URL,'showmea8ha89gh38haweogiuhh38')>
		 	<cferror type="exception" template="error.cfm">
		</cfif>
--->
	 	
		<cfif structKeyExists(url, "init")>           
			<cfset onApplicationStart()> <!--- not single-threaded if you do this --->      
		</cfif> 
		
 		<cfset request.dsn = "photoeyecom">
		<cfset application.dsn = "photoeyecom">
		<cfset application.root = "publisher_direct" />
		<cfset application.title = "photo-eye | Publisher Direct" />
		<cfset application.xbird = "delph99inus" />
		
	 	<cfset application.env = StructNew() />
	 	<cfset application.env.production = true />
	 	<cfset application.env.development = false />
		
		<cfset application.PD_service_levels = StructNew() />
		<cfset application.PD_prices = StructNew() />

		<cfset application.PD_service_levels.ind = "individual" />
		<cfset application.PD_service_levels.bgt = "individual-budget" />
		<cfset application.PD_service_levels.com = "commercial" />		
		
		<cfset application.PD_prices.ind = StructNew() />
		<cfset application.PD_prices.ind.setup = 30 />
		<cfset application.PD_prices.ind.initial_book = 45 />
		<!--- No longer have additional book price --->
		<!--- <cfset application.PD_prices.ind.additional_book = 45 /> --->
		<!--- Possible charge when they renew. We'll look at this at that time --->
		<!--- <cfset application.PD_prices.ind.remarket = 30 /> --->
		<cfset application.PD_prices.ind.booktease = 100 />
		<cfset application.PD_prices.ind.booktease_reduced = 50 />
		
		<cfset application.PD_prices.bgt = StructNew() />
		<cfset application.PD_prices.bgt.setup = 20 />
		<cfset application.PD_prices.bgt.initial_book = 25 />
		<!--- No longer have additional book price --->
		<!--- <cfset application.PD_prices.bgt.additional_book = 25 /> --->
		<!--- Possible charge when they renew. We'll look at this at that time --->
		<!--- <cfset application.PD_prices.bgt.remarket = 20 /> --->
		<cfset application.PD_prices.bgt.booktease = 100 />
		<cfset application.PD_prices.bgt.booktease_reduced = 50 />
		
		<cfset application.PD_prices.com = StructNew() />
		<cfset application.PD_prices.com.setup = 40 />
		<cfset application.PD_prices.com.initial_book = 55 />
		<!--- No longer have additional book price --->
		<!--- <cfset application.PD_prices.com.additional_book = 55 /> --->
		<!--- Possible charge when they renew. We'll look at this at that time --->
		<!--- <cfset application.PD_prices.com.remarket = 40 /> --->
		<cfset application.PD_prices.com.booktease = 100 />
		<cfset application.PD_prices.com.booktease_reduced = 50 />
				
		<cfset application.admin_email = "melanie@photoeye.com" />
		<cfset application.admin = "Melanie McWhorter" />
		<cfset application.admin_phone = "505.988.5152 x112" />
		<!--- Universal utility functions --->
		<cfset StructAppend(URL, createObject('component','#application.root#.cfc.utilities')) />

		<!--- Execution timing function --->
		<cfset request.tix = ArrayNew(1) />
		
		<!--- Start Authentication --->
		<cfset pdPublicPaths = '/#application.root#/index.cfm,/#application.root#/fees.cfm,/#application.root#/login/index.cfm,/#application.root#/login/submit_login.cfm,/#application.root#/login/forgot_password.cfm,/#application.root#/login/submit_forgot_password.cfm,/#application.root#/signup/index.cfm,/#application.root#/signup/submit_signup.cfm,/#application.root#/signup/new_account.cfm,/#application.root#/signup/create_new_account.cfm,/#application.root#/order.cfm' />
		<cfset pdAdminPaths = '/#application.root#/admin/invite_user.cfm' />
		
		<!--- Check for a superAdmin --->
		<cfif StructKeyExists(SESSION,'AcctID')>
 			<cfquery name="qSuperAdmin" dataSource="#application.dsn#">
 				SELECT * FROM MailingList_OM
 				WHERE custnumber = #SESSION.AcctID#
 				AND IndexSuperAdmin = 1
 			</cfquery>
 			<cfif qSuperAdmin.recordcount>
 				<cfset superUser = true />
 			</cfif>
		</cfif>
		
		<!--- if they're not logged in, only show public pages --->
		<cfif NOT StructKeyExists(SESSION,'publisher_direct_id')>
			<cfif ListFindNoCase(pdPublicPaths,arguments.TargetPage) LT 1 AND NOT superUser>
 				<cflocation url="/#application.root#/login/?timeout=true" addToken="no" /><cfabort />
			</cfif>
		<cfelse>
			<cfquery name="qPD_user" datasource="#application.dsn#">
				SELECT *, commercial, id FROM publisher_direct_accounts
				WHERE id = #SESSION.publisher_direct_id#
			</cfquery>
			<cfset request.qPD_user = qPD_user />
			<cfif NOT HTTP_BIGIPSSL>
				<cfif Len(CGI.query_string)>
					<cflocation url="https://www.photoeye.com#CGI.path_info#?#CGI.query_string#" addToken="no" />
				<cfelse>
					<cflocation url="https://www.photoeye.com#CGI.path_info#" addToken="no" />				
				</cfif>
			</cfif> 
		</cfif>
		
		<!--- only allow superAdmins for secure pages --->
		<cfif (ListFindNoCase(pdAdminPaths,arguments.TargetPage) GT 0 OR Left(arguments.TargetPage,2) EQ "/_") AND NOT superUser>
			<cflocation url="/#application.root#/login/" addToken="no" /><cfabort />
		</cfif>
		
		<!--- End Authentication --->

		<!--- Set our request.protocol value --->
		<cfif HTTP_BIGIPSSL>
			<cfset request.protocol = "https" />
		<cfelse>
			<cfset request.protocol = "http" />
		</cfif>
		
	<!--- Return out. --->
	<cfreturn true />
	
</cffunction>


<!--- Don't use this. In Coldfusion 8 it prevents AJAX from working !!! Confirmed by Ray Camden --->
<!---
<cffunction
name="OnRequest"
access="public"
returntype="void"
output="true"
hint="Fires after pre page processing is complete."> --->


	<!--- Define arguments. --->
<!--- <cfargument
	name="TargetPage"
	type="string"
	required="true"
	/> --->
	
	<!--- Include the requested page. --->
<!---	<cfinclude template="#ARGUMENTS.TargetPage#" />  --->
	
	<!--- Return out. --->
<!---	<cfreturn />
</cffunction>  --->


<cffunction
name="OnRequestEnd"
access="public"
returntype="void"
output="true"
hint="Fires after the page processing is complete.">

	<cfset var i = '' />
<!--- tick() timer output

	<cfif ArrayLen(request.tix) GT 0>
		<div style="overflow:scroll;text-align:left;position:fixed;top:0;width:1000px;max-height:500px;background:black;color:##ffffcc">
			<ul>
				<cfloop from="1" to="#ArrayLen(request.tix)#" index="i">
					<cfif ArrayLen(request.tix) GT i>
					<li style="clear:both;">
						#request.tix[i+1][2]-request.tix[i][2]#ms : #request.tix[i][1]# - #request.tix[i+1][1]#
						 <span style='float:left;background:##ffffcc;width:#(request.tix[i+1][2]-request.tix[i][2])*0.5#px;display:block;'>&nbsp;</span>
					</li>
					</cfif>
				</cfloop>
				<li>total: #request.tix[ArrayLen(request.tix)][2]-request.tix[1][2]#ms (#(request.tix[ArrayLen(request.tix)][2]-request.tix[1][2])/1000# seconds)</li>
			</ul>
		</div>
	</cfif> --->
	

	<!--- Return out. --->
	<cfreturn />
</cffunction>


<cffunction
name="OnSessionEnd"
access="public"
returntype="void"
output="false"
hint="Fires when the session is terminated.">

	<!--- Define arguments. --->
	<cfargument
	name="SessionScope"
	type="struct"
	required="true"
	/>
	
	<cfargument
	name="ApplicationScope"
	type="struct"
	required="false"
	default="#StructNew()#"
	/>
	
	<!--- Return out. --->
	<cfreturn />
</cffunction>


<cffunction
name="OnApplicationEnd"
access="public"
returntype="void"
output="false"
hint="Fires when the application is terminated.">

	<!--- Define arguments. --->
	<cfargument
	name="ApplicationScope"
	type="struct"
	required="false"
	default="#StructNew()#"
	/>
	
	<!--- Return out. --->
	<cfreturn />
</cffunction>


<!--- <cffunction
name="OnError"
access="public"
returntype="void"
output="true"
hint="Fires when an exception occures that is not caught by a try/catch.">

	<!--- Define arguments. --->
	<cfargument
	name="Exception"
	type="any"
	required="true"
	/>
	
	<cfargument
	name="EventName"
	type="string"
	required="false"
	default=""
	/>
 
	<!--- Return out. --->
	<cfreturn />
</cffunction>  --->

</cfcomponent>