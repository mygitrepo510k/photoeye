<cfoutput>
<div class="left">
	<form action="#event.linkTo('information.send_mail')#" method="POST">
		<label>name</label>
		<input type="text" name="name" />
		<label>email</label>
		<input type="text" name="email" />
		<label>inquiry</label>
		<textarea name="body"></textarea>
		<input type="submit" value="submit inquiry" />
	</form>
</div>
<div class="right">
<p>
<span>photo-eye Editions</span><br />
376 Garcia Street, Suite A<br />
Santa Fe NM, 87501<br />
USA<br /><br />

info: 505.988.5152 x111<br />
fax: 505.988.4487<br />
</p>
</div>
</cfoutput>