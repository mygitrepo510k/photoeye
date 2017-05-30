<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<cfinclude template="../includes/dsp_header.cfm">
<cfset redeemingToken = false />
<cfif StructKeyExists(URL,'t')>
	<cfquery name="qToken" dataSource="#application.dsn#">
		SELECT * FROM publisher_direct_token
		WHERE token = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#URL.t#" />
	</cfquery>
	<cfif qToken.recordCount GT 0>
		<cfif qToken.redeemed EQ 1>
			Whoops, token was already redeemed.  Please call +1(505)988-5152 if you require assistance.<cfabort />
		<cfelse>
			<cflock scope="Session" type="exclusive" timeout="5">
				<cfset SESSION.publisher_direct_redeeming_token = URL.t />
				<cfset redeemingToken = true />
			</cflock>
		</cfif>
	<cfelse>
		Token is invalid<cfabort />
	</cfif>
<cfelseif StructKeyExists(SESSION,'publisher_direct_redeeming_token')>
	<cfset redeemingToken = true />
</cfif>
<cfinclude template="includes/dsp_login.cfm">
<cfinclude template="../includes/dsp_footer.cfm">