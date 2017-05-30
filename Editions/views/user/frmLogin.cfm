<cfoutput>
<!--- 	#helpers.gui.insertDivider("administrator login")#<br /> --->
	<cfset submit = event.linkTo('user.xe_login') />
	<cfif len(viewState.getValue('messages'))>
		<div style="color: red;">#viewState.getValue('messages')#</div>
	</cfif>
	<div style="width:230px; margin:100px auto;">
	<div style="font-size:20px;margin-bottom: 20px; text-decoration: underline;">Administrator Login</div>
	<form action="#submit#" method="post">
		username: <input type="text" name="username" /><br />
		password: <input type="password" name="password" /><br /><br />
		<input type="submit" value="login" />
	</form>
	</div>
</cfoutput>