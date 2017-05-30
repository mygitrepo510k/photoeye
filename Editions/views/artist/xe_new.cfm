<cfset artist = event.getValue('artist') />
<cfoutput>
	<form action="#event.linkTo('artist.xe_edit')#" method="POST" enctype="multipart/form-data">
		#helpers.form.insertTextField('First_name','#artist.first_name#')#
		#helpers.form.insertTextField('Last_name','#artist.last_name#')#
		#helpers.form.insertTextArea('Biography','#artist.biography#')#
		#helpers.form.insertTextArea('Collections','#artist.collections#')#
		#helpers.form.insertTextArea('Exhibitions','#artist.exhibitions#')#
		#helpers.form.insertTextArea('Publications','#artist.publications#')#
		<label>portrait image</label>
		<input type="file" name="portrait_image" id="portrait_image" /><br /><br />
		<input type="hidden" name="ID" value="#artist.id#" />
		<input type="submit" value="submit">
	</form>
</cfoutput>