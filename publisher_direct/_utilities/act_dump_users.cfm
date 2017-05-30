<cfquery name="qTokens" dataSource="#application.dsn#">
	SELECT * FROM publisher_direct_token
</cfquery>
<cfdump var="#qTokens#" />

<cfquery name="qUsers" dataSource="#application.dsn#">
	SELECT * FROM publisher_direct_accounts
</cfquery>
<cfdump var="#qUsers#" />

<cfquery name="qReveal" dbtype="query">
	SELECT * FROM qUsers
	WHERE id = 10058
</cfquery>
<!--- <cfdump var="#CGI#" /><cfabort /> --->
<cfset crypted_pass = Decrypt(ToString(ToBinary(qReveal.password)),application.xbird)/>
<cfoutput>#crypted_pass#</cfoutput>