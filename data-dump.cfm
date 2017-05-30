<cfabort />
<cftry>
	<cfquery name="qGet" datasource="ewhserver678_cfvars_pe1">
		SELECT count(*) FROM cGlobal
	</cfquery>
	
	<cfdump var="#qGet#" />
	
	<cfquery name="qGet" datasource="ewhserver678_cfvars_pe1">
		SELECT count(*) FROM cData
	</cfquery>
	
	<cfdump var="#qGet#" />
	<cfcatch>
		<cfdump var="#CFCATCH#" />
	</cfcatch>
</cftry>