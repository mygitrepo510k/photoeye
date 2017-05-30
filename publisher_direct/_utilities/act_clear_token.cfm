<cfquery name="clearToken" dataSource="#application.dsn#">
	DELETE FROM publisher_direct_token
	WHERE email = 'daniel@danielespeset.com'
</cfquery>