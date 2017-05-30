<!--- Ben Nadel's application.cfc framework --->


<cfcomponent
displayname="Application"
output="true"
hint="Handle the application."
>


<!--- Set up the application. --->
<cfset THIS.Name = "Publisher_Direct" />
<cfset THIS.ApplicationTimeout = CreateTimeSpan( 0, 3, 0, 0 ) />
<cfset THIS.SessionManagement = true />
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
		<cfset var ipiPublicPaths = '' />
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
		<cfset application.root = "submissions" />
		<cfset application.title = "photo-eye | Submissions" />
		<cfset application.xbird = "delph99inus" />



		<!--- Execution timing function --->
		<cfset request.tix = ArrayNew(1) />
				
		
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