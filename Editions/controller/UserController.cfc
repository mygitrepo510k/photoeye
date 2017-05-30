<cfcomponent hint="Access controls" output="false" extends="ModelGlue.gesture.controller.Controller">
	
	<cffunction name="init" access="public" output="false" hint="Constructor">
		<cfreturn this />
	
	</cffunction>
	
	<cffunction name="login" output="false" hint="message listener for login event">
		<cfargument name="event" />
		
	</cffunction>
	
	<cffunction name="xe_login" output="false" hint="message listener for execution of the login event">
		<cfargument name="event" />
		
		<cfset username = arguments.event.getValue('username') />
		<cfset password = arguments.event.getValue('password') />
			
			<cfset arguments.event.trace('username and password',username & password) />
					
		<cfif username EQ "admin" AND password EQ "2editionsb">
			<cflock scope="SESSION" type="exclusive" timeout="20">
				<cfset StructInsert(SESSION,'logged_in',true) />
			</cflock>
			<cfset arguments.event.addResult('loginSuccess') />
		<cfelse>
			<cfset arguments.event.setValue('error_message','invalid username and password combination') />
		</cfif>
		
	</cffunction>
	
	<cffunction name="xe_logout" output="false" hint="message listener for execution of the login event">
		<cfargument name="event" />

		<cflock scope="SESSION" type="exclusive" timeout="20">
				<cfset StructDelete(SESSION,'logged_in') />
		</cflock>

		<cfset arguments.event.setValue('notice_message','you have been logged out') />
		
	</cffunction>

	
</cfcomponent>