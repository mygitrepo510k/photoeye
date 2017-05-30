<cfif NOT len(FORM.email)>
	<cfset pdError('email','Please enter your email address.') />
</cfif>

<cfif isDefined("_errors")>
	<cfinclude template="forgot_password.cfm" /><cfabort />
</cfif>

<cfquery name="qAccount" dataSource="#application.dsn#">
	SELECT * FROM publisher_direct_accounts
	WHERE email = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#FORM.email#" />
</cfquery>

<cfif NOT qAccount.recordcount>
	<cfset pdError('email','No account found for that email address') />
</cfif>

<cfif isDefined("_errors")>
	<cfinclude template="forgot_password.cfm" /><cfabort />
</cfif>

<!--- generate password --->
<cfset newPass = '' />
<cfset charList = 'A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,0,1,2,3,4,5,6,7,8,9' />
<cfset cLen = ListLen(charList) />
<cfloop from="1" to="9" index="i">
	<cfset newPass &= listGetAt( charList, RandRange( 1, cLen ) ) />
</cfloop>

<cfset crypted_pass = ToBase64(Encrypt(trim(newPass), "#application.xbird#")) />

<cfquery name="qChangePassword" dataSource="#application.dsn#">
	UPDATE publisher_direct_accounts
	SET password = '#crypted_pass#'
	WHERE id = #qAccount.id#
</cfquery>

<cfmail from="publisherdirect@photoeye.com" to="#qAccount.email#" subject="photoeye.com Publisher Direct password reset" type="html">
	Dear #qAccount.firstname# #qAccount.lastname#,<br /><br />
	
	Your password to Publisher Direct has been reset.  Please return to the login page<br /><br />
	
	https://www.photoeye.com/publisher_direct/login/<br /><br />
	
	and use the following password to login:<br /><br />
	
	#newPass#
</cfmail>

<cflocation addToken="no" url="index.cfm?cp=1" />