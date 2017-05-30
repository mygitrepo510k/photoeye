<cfif CGI.X_FORWARDED_FOR is '65.100.24.36' or CGI.X_FORWARDED_FOR is '70.56.208.84'>
	<cfset zzDebug = 1>	
<cfelse>
	<cfset zzDebug = 0>
</cfif>
