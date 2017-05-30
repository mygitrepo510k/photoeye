<cfquery name="qBooks" dataSource="#application.dsn#">
	SELECT TOP 20 * FROM Publisher_Direct_Catalog
	ORDER BY catalog DESC
</cfquery>
<cfdump var="#qBooks#" />