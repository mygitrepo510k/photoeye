<cfif NOT len(FORM.email)>
	<cfset pdError('email','Please enter your email address') />
</cfif>

<cfif NOT len(FORM.password)>
	<cfset pdError('password','Please enter your password') />
<cfelseif FORM.password NEQ FORM.passwordconfirm>
	<cfset pdError('password','Password and confirmation did not match') />
</cfif>

<cfif isDefined("_errors")>
	<cfinclude template="index.cfm" /><cfabort />
</cfif>

<cfquery name="qAccountDup" dataSource="#application.dsn#">
	SELECT email FROM publisher_direct_accounts
	WHERE email = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#FORM.email#" />
</cfquery>

<cfif qAccountDup.recordcount>
	<cfset backToPath = '/#application.root#/signup/' />
	<cfinclude template="/#application.root#/login/submit_login.cfm" /><cfabort />
</cfif>


<cfset crypted_pass = ToBase64(Encrypt(trim(form.password), "#application.xbird#"))>
<cfquery name="qLastRecord" dataSource="#application.dsn#">
	SELECT TOP 1 * FROM publisher_direct_accounts
	ORDER BY id DESC
</cfquery>
<cfif qLastRecord.recordcount GT 0>
	<cfset freshID = qLastRecord.id+1 />
<cfelse>
	<cfset freshID = 10000 />
</cfif>

<cflock scope="Session" timeout="5" type="readOnly">
	<cfif Right(SESSION.publisher_direct_redeeming_token,2) IS 'i1'>
		<cfset commercial = 0 />
	<cfelse>
		<cfset commercial = 1 />
	</cfif>
</cflock>

<cfquery name="qCreatePubDirAccount" dataSource="#application.dsn#">
	INSERT INTO publisher_direct_accounts (	ID,
											Email,
											Password,
											Hint,
											Commercial)
	VALUES (#freshID#,
			<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#FORM.email#" />,
			<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#crypted_pass#" />,
			<cfif Len(FORM.hint)>
				<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#FORM.hint#" />
			<cfelse>
				NULL
			</cfif>,#commercial#)
			
</cfquery>

<cflock scope="Session" type="exclusive" timeout="5">
	<cfquery name="qRedeemToken" dataSource="#application.dsn#">
		UPDATE publisher_direct_token
		SET publisher_direct_id = #freshID#
		WHERE token = '#SESSION.publisher_direct_redeeming_token#'
	</cfquery>
	<cfset SESSION.publisher_direct_id = #freshID# />
</cflock>

<cflocation url="/#application.root#/purchase/" addToken="no" />