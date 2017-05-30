<cfquery name="qTokens" dataSource="photoeyecom">
	SELECT * FROM publisher_direct_token
</cfquery>
<cfdump var="#qTokens#" />
<cfquery name="qUsers" dataSource="photoeyecom">
	SELECT * FROM publisher_direct_accounts
</cfquery>
<cfdump var="#qUsers#" />
<cfquery name="qCatalogs" dataSource="photoeyecom">
	SELECT * FROM publisher_direct_catalog
</cfquery>
<cfdump var="#qCatalogs#" />
<cfquery name="qCatalogs" dataSource="photoeyecom">
	SELECT * FROM publisher_direct_bindings
</cfquery>
<cfdump var="#qCatalogs#" />
<cfquery name="qBooks" dataSource="photoeyecom">
	SELECT * FROM inventory
	WHERE catalog LIKE 'I%'
	AND subject = 'PUBLISHER DIRECT'
</cfquery>
<cfdump var="#qBooks#" />
