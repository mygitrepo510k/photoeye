<cfparam name="FORM.email" default="" />
<cfoutput>
	<div class="standard_container">
		<h1>Publisher Direct Login</h1>
		<cfif StructKeyExists(URL,'timeout')>
			<br /><br /><ul class="error_messages">
				<li>Your session has timed out! Please login to continue.</li>
			</ul><br /><br />
		</cfif>
		<cfif StructKeyExists(URL,'cp')>
			<br /><br /><ul class="error_messages">
				<li>Your password has been reset, you'll receive and email directing you to .</li>
			</ul><br /><br />			
		</cfif>
		#validationErrors()#
		<form action="submit_login.cfm" method="POST">
			<div>
				<label>email</label> <input type="text" name="email" value="#FORM.email#" maxlength="50" />
			</div>
			<div>
				<label>password</label> <input type="password" name="password" value="" />
			</div>
			<label>&nbsp;</label> <input type="submit" value="login" />
			<div class="dented">
				forgot password? <a href="forgot_password.cfm">click here</a>
			</div>
			<cfif redeemingToken>
			<h2>Don't have a publisher direct account yet? <a href="/#application.root#/signup/">Create one</a></h2>
			</cfif>
		</form>	
	</div>
</cfoutput>
