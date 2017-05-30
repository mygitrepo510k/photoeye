<cfset artist = event.getValue('artist') />
<cfoutput>
	<form action="#event.linkTo('artist.xe_new')#" method="POST" enctype="multipart/form-data">
		#helpers.form.insertTextField('First_name','#artist.first_name#','')#
		#helpers.form.insertTextField('Last_name','#artist.last_name#','')#
		#helpers.form.insertTextField('Dob','#artist.dob#','')#
		#helpers.form.insertTextArea('Biography','#artist.biography#','')#
		#helpers.form.insertTextArea('Collections','#artist.collections#','<c>collection information</c>')#
		#helpers.form.insertTextArea('Exhibitions','#artist.exhibitions#','<divider>solo</divider> <e>exhibition information</e>')#
		#helpers.form.insertTextArea('Publications','#artist.publications#','<cat>AB123,AB123,AB123</cat>')#
		#helpers.form.insertTextArea('Awards','#artist.awards#','')#
		#helpers.form.insertTextArea('Representation','#artist.representation#','')#
		<label>portrait image</label>
		<input type="file" name="portrait_image" id="portrait_image" /> 
		#helpers.form.insertTextField('Resize_dimensions','480','(ex: 480 => image will be 480px on the longest size)')#
		#helpers.form.insertTextField('Portrait_credit','#artist.portrait_credit#','')#
		<br /><br />
		<input type="hidden" name="ID" value="#artist.id#" />
		<input type="submit" value="submit">
	</form>
</cfoutput>