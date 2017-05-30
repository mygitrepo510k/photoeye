<cfparam name="backToPath" default="" />

<cfif NOT len(FORM.email)>
	<cfset pdError('email','Please enter your email address.') />
</cfif>
<cfif NOT len(FORM.password)>
	<cfset pdError('password','Please enter your password.') />
</cfif>
<cfif isDefined("_errors")>
	<cfinclude template="#backToPath#index.cfm" />
<cfelse>
	<cfset crypted_pass = ToBase64(Encrypt(trim(form.password), "#application.xbird#")) />
	<cfquery name="qAuthenticate" datasource="#application.dsn#">
		SELECT * FROM publisher_direct_accounts
		WHERE email = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#FORM.email#" />
			AND ((SUBSTRING(password,1,5)='#LEFT(crypted_pass,5)#') 
	   		OR (SUBSTRING(password,1,5)='#LEFT(lcase(crypted_pass),5)#'))
	</cfquery>
	<cfif qAuthenticate.recordCount GT 0>
		<cflock type="exclusive" scope="Session" timeout="5">
			<cfset SESSION.publisher_direct_id = qAuthenticate.id />
			<cfif StructKeyExists(SESSION,'publisher_direct_redeeming_token')>
				<cfquery name="qUpdateToken" dataSource="#application.dsn#">
					UPDATE publisher_direct_token
					SET publisher_direct_id = #qAuthenticate.id#
					WHERE token = '#SESSION.publisher_direct_redeeming_token#'
				</cfquery>
				<cflocation url="/#application.root#/purchase" addToken="no" />		
			</cfif>
		</cflock>
		<cflocation url="/#application.root#/catalog" addToken="no" />
	<cfelse>
		<cfset pdError('global','No account was found for the email & password provided, please try again.') />
		<cfinclude template="#backToPath#index.cfm" />		
	</cfif>
</cfif>