<cfcomponent output="false" hint="I am a Model-Glue controller." extends="ModelGlue.gesture.controller.Controller">

	<cffunction name="init" access="public" output="false" hint="Constructor">
		<cfreturn this />
	</cffunction>


	<cffunction name="about_us" output="false" hint="I am a message listener function generated for the ""information.about_us"" event.">
		<cfargument name="event" />
		
		<!--- 
			Put "behind the scenes" query, form validation, and model interaction code here.
			  
			Use event.getValue("name") to get variables from the FORM and URL scopes.
		--->
	</cffunction>
	



	<cffunction name="contact" output="false" hint="I am a message listener function generated for the ""information.contact"" event.">
		<cfargument name="event" />
		
		<!--- 
			Put "behind the scenes" query, form validation, and model interaction code here.
			  
			Use event.getValue("name") to get variables from the FORM and URL scopes.
		--->
	</cffunction>
	
	<cffunction name="send_mail" output="false" hint="I send emails!">
		<cfargument name="event" />
		<cftry>
			<cfmail to="rixon@photoeye.com" cc="daniel.e@photoeye.com" subject="photo-eye Editions Inquiry from #arguments.event.getValue('name')#" from="#arguments.event.getValue('email')#">
				#arguments.event.getValue('body')#
			</cfmail>
			<cfset arguments.event.setValue('notice_message','Your inquiry has been sent.') />
		<cfcatch>
			<cfset arguments.event.setValue('error_message','Unfortunately, there was an error sending your inquiry.  Our website administrators have been notified of the problem.  In the meantime, please feel free to call us at 505.988.5152') />
		</cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>
	
	

