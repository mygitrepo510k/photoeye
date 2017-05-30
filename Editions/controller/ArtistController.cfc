<cfcomponent output="false" hint="I am a Model-Glue controller." extends="ModelGlue.gesture.controller.Controller">

	<cffunction name="init" access="public" output="false" hint="Constructor">
		<cfreturn this />
	</cffunction>


	<cffunction name="index" output="false" hint="I am a message listener function generated for the ""artist.index"" event.">
		<cfargument name="event" />
		<cfset all_artists = beans.artistGateway.getAll() />
		<cfif isArray(all_artists)>
			<cfif ArrayLen(all_artists) EQ 1>
				<cfset arguments.event.setValue('id', all_artists[1].getID()) />
				<cfset arguments.event.forward('artist.show','id') />
			</cfif>
			<cfset artists = ArrayNew(1) />
			<cfloop array="#all_artists#" index="i">
				<cfset ArrayAppend(artists, i.getInstance()) />
			</cfloop>
			<cfscript>
				buttons = StructNew();
				buttons.add_artist = arguments.event.LinkTo('artist.new');
				arguments.event.setValue('buttons',buttons);
			</cfscript>
			<cfset arguments.event.setValue('artists', artists) />
			<cfset arguments.event.setValue('page_title', "photo-eye Editions artist list") />
		<cfelse>
			<cfset arguments.event.setValu('error_message',"Couldn't find artists.") />
			<cfset arguments.event.addResult('errorsFound') />
		</cfif>
		<!--- 
			Put "behind the scenes" query, form validation, and model interaction code here.
			  
			Use event.getValue("name") to get variables from the FORM and URL scopes.
		--->
	</cffunction>

	<cffunction name="show" output="false" hint="I am a message listener function generated for the ""artist.show"" event.">
		<cfargument name="event" />
		
		<cfset errors = " " />
		<cfif arguments.event.valueExists('name')>
			<cfset name = arguments.event.getValue('name') />
			<cfset variables.artist = beans.artistDAO.findByName('#trim(name)#') />
			<cfset variables.publication = beans.artistGateway.getPublications(variables.artist) />
		<cfelse>
			<cfset id = arguments.event.getValue('id') />
			<cfset variables.artist = beans.artistDAO.read('#trim(id)#') />
			<cfset variables.publication = beans.artistGateway.getPublications(variables.artist) />
		</cfif>
		<cfif len(variables.artist.getName())>
<!--- ! this will eventually need to be pluralized, in case a single artist has more than one publication --->			
			<cfset arguments.event.setValue('id',artist.getId()) />
			<cfscript>
				buttons = StructNew();
				buttons.edit_profile = arguments.event.LinkTo('artist.edit','id');
				arguments.event.setValue('buttons',buttons);
			</cfscript>
			<cfset arguments.event.setValue('artist', variables.artist.getInstance()) />
			<cfset arguments.event.setValue('publication', variables.publication.getInstance()) />
			<cfset arguments.event.setValue('page_title', "#variables.artist.getName()# profile at photo-eye Editions") />
			
			<cfif arguments.event.getValue('page','statement') EQ 'publications'>
				<cfset bookstore_publications = ArrayNew(1) />
				<cfif FindNoCase("<cat>",variables.artist.getPublications())>
					<cfset catlist = Replace(REReplace(REReplace(variables.artist.getPublications(),'.*<cat>',''),'</cat>.*',''),' ','','all') />
					<cfif len(catlist)>
						<cfloop list="#catlist#" index="list_catnum">
							<cfif len(list_catnum) EQ 5>
								<cfset ArrayAppend(bookstore_publications, beans.publicationDAO.readFromBookstore(list_catnum).getInstance()) />
							</cfif>
						</cfloop>
						<cfset arguments.event.setValue('other_publications', bookstore_publications) />
					</cfif>
				</cfif>
			</cfif>

		<cfelse>
			
			<cfset arguments.event.setValue('error_message','No artist name provided') />
			<cfset arguments.event.addResult('errorsFound') />
			
		</cfif>
	</cffunction>
	
	<cffunction name="edit" output="false" hint="I am a message listener for the artist.edit event">
		<cfargument name="event" />
		<cfset id = arguments.event.getValue('id') />
		<cfset artist = beans.artistDAO.read('#trim(id)#') />
		<cfif NOT len(artist.getName())>
			<cfset arguments.event.setValue('error_message','No artist found by id: #id#') />
			<cfset arguments.event.addResult('errorsFound') />
		<cfelse>
			<cfset arguments.event.setValue('artist', variables.artist.getInstance()) />
			<cfset arguments.event.setValue('page_title', "editing #variables.artist.getName()# profile at photo-eye Editions") />
		</cfif>
	</cffunction>
	
	<cffunction name="xe_edit" output="false" hint="I am a message listener for the artist.xe_edit event">
		<cfargument name="event" />
		<cfset artist = event.MakeEventBean(beans.artistBean) />
		<cfset beans.artistDAO.update(artist) />
		<cfset arguments.event.trace("user defined demensions", artist.getResize_dimensions()) />
		<cfset beans.imageManager.upload_artist_images(artist, arguments.event) />
		<cfset arguments.event.setValue('notice_message','The profile for #artist.getName()# was updated successfully.')>
		
	</cffunction>
	
	<cffunction name="new" output="false" hint="">
		<cfargument name="event" />
		<cfset event.setValue('artist',beans.artistBean.init().getInstance()) />
	</cffunction>

	<cffunction name="xe_new" output="false" hint="">
		<cfargument name="event" />
		
		<cfset artist = event.MakeEventBean(beans.artistBean) />
		<cfset beans.artistDAO.create(artist) />
		<cfset arguments.event.setValue('id', artist.getID()) />
		
		<cfset beans.imageManager.upload_artist_images(artist) />
		
	</cffunction>

</cfcomponent>
	
	

