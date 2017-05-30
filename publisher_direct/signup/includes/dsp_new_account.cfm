<cflock type="readOnly" scope="Session" timeout="5">
	<cfif NOT StructKeyExists(SESSION,'publisher_direct_redeeming_token')>
		<cflocation url="/#application.root#/" addToken="no" /><cfabort />
	</cfif>
</cflock>
<cfquery name="qGetToken" dataSource="#application.dsn#">
	SELECT * FROM publisher_direct_token
	WHERE token = '#SESSION.publisher_direct_redeeming_token#'
</cfquery>
<cfparam name="FORM.email" default="#qGetToken.email#" />
<cfoutput>
	<div class="standard_container">
		<h1>Create a Publisher Direct Account</h1>
		#validationErrors()#
		<form action="create_new_account.cfm" method="post">
			<div>
				<label>email</label>
				<input type="text" name="email" value="#FORM.email#" />
			</div>
			<div>
				<label>password</label>
				<input type="password" name="password" value="" />
			</div>
			<div>
				<label>password confirmation</label>
				<input type="password" name="passwordconfirm" value="" />
			</div>
			<div style="clear:both;margin-top:20px;">
				<label>password hint (optional)</label>
				<input type="hint" name="hint" value="" />
			</div>
			<div class="dented">
				<input type="submit" value="Create Account" />
			</div>
		</form>
	</div>
</cfoutput>
