<cffunction name="errorFound">
	<cfargument name="error" required="true" type="any" />
	<!--- TODO: reinstate mailer for errors production --->
<!--- 	<cfmail to="daniel.e@photoeye.com" cc="rixon@photoeye.com" subject="Error occured on photoeye editions" from="webmaster@photoeye.com">
		#timeFormat(now())# EST: The following error occurred on photoeye Editions #application.version_number#
		
		#arguments.error#
	</cfmail> --->
</cffunction>
