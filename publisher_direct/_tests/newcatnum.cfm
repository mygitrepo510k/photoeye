<cfquery name="qLastCatnum" dataSource="#application.dsn#">
	SELECT TOP 1 catalog, subject FROM inventory
	WHERE catalog LIKE 'I%'
	AND subject = 'PUBLISHER DIRECT'
	ORDER BY catalog DESC 
</cfquery>
<cfdump var="#qLastCatnum#" />
<cfset newCatNum = "I"&(Right(qLastCatnum.catalog,4)+1) />
<cfdump var="#newCatNum#" />