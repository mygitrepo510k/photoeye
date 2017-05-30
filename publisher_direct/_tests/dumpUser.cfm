<cfif NOT StructKeyExists(URL,'id')>
	Please supply an id in the URL.
</cfif>
<cfquery name="qTokens" dataSource="photoeyecom">
	SELECT * FROM publisher_direct_token
	WHERE publisher_direct_id = <cfqueryparam CFSQLType="CF_SQL_NUMERIC" value="#URL.id#" />
</cfquery>
<cfdump var="#qTokens#" />
<cfquery name="qUsers" dataSource="photoeyecom">
	SELECT * FROM publisher_direct_accounts
	WHERE id = <cfqueryparam CFSQLType="CF_SQL_NUMERIC" value="#URL.id#" />
</cfquery>
<cfdump var="#qUsers#" />
<cfquery name="qCatalogs" dataSource="photoeyecom">
	SELECT * FROM publisher_direct_catalog
	WHERE publisher_direct_id = <cfqueryparam CFSQLType="CF_SQL_NUMERIC" value="#URL.id#" />
</cfquery>
<cfdump var="#qCatalogs#" />