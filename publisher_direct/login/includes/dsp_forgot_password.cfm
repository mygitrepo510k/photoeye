<cfparam name="FORM.email" default="" />
<cfoutput>
	<div class='standard_container'>  
		<h1>Publisher Direct Password Recovery</h1>
		#validationErrors()#
		<form action="submit_forgot_password.cfm" method="POST">
			 <div>
			 	Please enter your email address and we'll send you a new temporary password.
			 </div>			 
			 <label>email</label>
			 <input type="text" name="email" value="#FORM.email#" maxlength="50" />
			 <input type="submit" value="submit" />
		</form>
  	</div> 
</cfoutput>