  <cfif Gallery is 1>
			<cfset #Gallery# = 1>
		<cfelseif Gallery is 2>
			<cfset #Gallery# = 2>
		<cfelseif Gallery is 3>
			<cfset #Gallery# = 3>
		
		<cfelseif Gallery is 4>
			<cfset #Gallery# = 4>
		<cfelse>
			<cfset #Gallery# = 0>
		</cfif>		
<cflocation url="Processes.cfm?Include=1&Gallery=#Gallery#">
