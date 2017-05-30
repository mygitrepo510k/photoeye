<cfset publication = event.getValue('publication') />
<cfoutput>
<!--- RR added requesttimeout=1000 --->
	<form action="#event.linkTo('publication.xe_new')#?requesttimeout=1000" method="POST" enctype="multipart/form-data">
		add new publication<br />
		
		#helpers.form.insertTextField('Catalog_number', '#publication.catalog_number#', '')#
		#helpers.form.insertTextField('Tagline', '#publication.tagline#', '')#
		#helpers.form.insertTextArea('Pricing','#publication.pricing#', '')#
		#helpers.form.insertTextField('Artist_id', '#publication.artist_id#', '***this can be turned into a dropdown box at some point')#

		<h4>cover image</h4>
		<input type="file" name="cover_image" id="cover_image" />
		<div id="container_image_fields">
			<h4>container images</h4>
			<a id="add_container_field">[+] add another upload field</a><br /><br />
			<cfloop index="i" from="1" to="#publication.total_container_images#">
				#i#: <input type="file" name="container_image#i#" id="container_image#i#" /> container image #i# exists, upload new to replace.<br /><br />
			</cfloop>
			#i#: <input type="file" name="container_image#i#" id="container_image#i#" />
		</div>
		<div id="content_image_fields">
			<h4>content images</h4>
			<a id="add_content_field">[+] add another upload field</a><br /><br />
			<cfloop index="i" from="1" to="#publication.total_content_images#">
				#i#: <input type="file" name="content_image#i#" id="content_image#i#" /> content image #i# exists, upload new to replace.<br /><br />
			</cfloop>
			#i#: <input type="file" name="content_image#i#" id="content_image#i#" />
		</div>
		<br />
		<input type="submit" value="submit">
	</form>
</cfoutput>

<script type="text/javascript">
	$('add_container_field').observe('click', function(){
		fields = $$('#container_image_fields input');
		existing_field_number = fields.length+1;
		new_field_code = "<br /><br />"+existing_field_number+": <input type='file' name='container_image"+existing_field_number+"' id='container_image"+existing_field_number+"'/>";
		$('container_image_fields').insert(new_field_code,{ position: 'bottom' });
	});
	
	$('add_content_field').observe('click', function(){
		fields = $$('#content_image_fields input');
		existing_field_number = fields.length+1;
		new_field_code = "<br /><br />"+existing_field_number+": <input type='file' name='content_image"+existing_field_number+"' id='content_image"+existing_field_number+"'/>";
		$('content_image_fields').insert(new_field_code,{ position: 'bottom' });
	});
</script>