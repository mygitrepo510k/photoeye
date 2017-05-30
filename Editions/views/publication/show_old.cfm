<cfset publication = event.getValue('publication') />
<cfset display_image = event.getValue('img','cover') />
<cfoutput>

	<div class="full_citation">
	</div>
	#helpers.gui.openWindow('image_viewer')#
		<div class="image_box">
			<div class="canvas">
				<div class="align_middle">
					<img src="#publication.image_path##display_image#_large.jpg" />
				</div>
			</div>
			<div class="information">
				<div class="thumb_tray">
					<div class="row">
						#helpers.gui.insertLinkedThumb(event.linkTo('publication.show'),publication.catalog_number,publication.image_path,'cover')#
						#helpers.gui.insertLinkedThumb(event.linkTo('publication.show'),publication.catalog_number,publication.image_path,'1')#
						#helpers.gui.insertLinkedThumb(event.linkTo('publication.show'),publication.catalog_number,publication.image_path,'2')#
					</div>
					<div class="row">
						#helpers.gui.insertLinkedThumb(event.linkTo('publication.show'),publication.catalog_number,publication.image_path,'3')#
					</div>
				</div>
				<div class="align_bottom">
					<div class="mini_citation">
						<h2>#publication.author#</h2>
						<h4><em>#publication.title#</em></h4>
						<div class="details">
							photo-eye Editions, Santa Fe, 2009. #publication.page_count# pages, #publication.illustration_count#
						</div>
						<div class="description">
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum suscipit cursus nibh, sit amet dictum turpis elementum quis.
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum suscipit cursus nibh, sit amet dictum turpis elementum quis.
						</div>
					</div>
				</div>
			</div>
		</div>
	#helpers.gui.closeWindow()#
	<div class="full_citation">
		<div class="description">
			#REreplace(publication.description,'\n','<br />','ALL')#
		</div>
	</div>
</cfoutput>