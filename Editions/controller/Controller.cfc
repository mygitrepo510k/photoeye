<cfcomponent output="false" hint="I am a Model-Glue controller." extends="ModelGlue.gesture.controller.Controller">

	<cffunction name="init" access="public" output="false" hint="Constructor">
		<cfargument name="framework" />
		
		<cfset super.init(framework) />
			<cfset application.root_path = "/editions/" />
			<cfif CGI.SERVER_NAME CONTAINS 'photoeyeeditions.com'>
				<cfset application.root_path = "/" />
			</cfif>
			<cfset application.cfc_root = "editions." />
			<cfset application.css_path = "#application.root_path#css/" />
			<cfset application.dsn = "photoeyecom" />
			<cfset application.root_name = "editions" />
			<cfset application.version_number = "version 0.3 | 07.29.09 5:27pm EST (initialized #dateFormat(now(),'mm-dd')# at #timeFormat(now(),'hh:mm:ss')# EST)" />

		<cfreturn this />
	</cffunction>
	
	<cffunction name="verifyLogin" output="false" hint="verifys that the user is logged in, boots to login page if not.">
		<cfargument name="event" />
		
		<cflock scope="SESSION" type="exclusive" timeout="20">
			<cfif StructKeyExists(SESSION, 'logged_in')>
				<cfset arguments.event.addResult("loggedIn") />
			<cfelse>
				<cfset arguments.event.addResult("notLoggedIn") />
			</cfif>
		</cflock>
	</cffunction>
</cfcomponent>
	
	
	


