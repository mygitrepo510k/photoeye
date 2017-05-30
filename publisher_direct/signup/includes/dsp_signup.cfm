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
		<h2>Publisher Direct Signup</h2>
		#validationErrors()#
		<form action="submit_signup.cfm" method="POST">			 
			<div class="dented">
			 	Already have a photo-eye Account? Enter your credentials to automatically create a Publisher Direct account:	</div>
			<div>
				<label>email</label>
				<input type="text" name="email" value="#FORM.email#" />
			</div>
			<div>
				<label>password</label>
				<input type="password" name="password" value="" />
			</div>
			<div class="dented">
				 <input type="submit" value="Import Information" />
			</div>
			<div class="dented">
				 Otherwise, <a href="new_account.cfm" />create a new Publisher Direct account</a>
			</div>
		</form>	
	</div>
</cfoutput>