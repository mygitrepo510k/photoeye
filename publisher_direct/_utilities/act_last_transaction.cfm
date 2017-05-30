<cfif StructKeyExists(application, 'last_transact_req')>
	<cfdump var="#application.last_transact_req#" />
	<cfdump var="#application.last_transact_res#" />
</cfif>