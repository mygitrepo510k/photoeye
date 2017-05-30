<cfcomponent output="false" hint="I am the image manager, controllers use me to handle uploading and generation of image files." extends="ModelGlue.gesture.controller.Controller">
	
	<!--- 
		I'm used by controllers to handle all <cffile> operations for uploaded and existing images.
		I pass all generation tasks (<cfimage>) to the imageOperator object.
	
		use example:
			publicationDAO = createObject('component','photoeye_editions.model.publicationDAO');
			publication = publicationDAO.read(id);
			image_manager = createObject('component','photoeye_editions.model.imageManager');
			image_manager.generate_publication_images(publication);
			
	--->
	
	<cffunction name="init" access="public" output="false" hint="Basic settings, initializes imageOperator object for predefined generation tasks.">
		<!--- initialize the named image processing types and pathing, etc --->
		<cfset variables.overwrite_setting = "yes" />
		<cfset variables.image_root_path = "#application.root_path#images/" />
		<cfset variables.image_operator = createObject('component','#application.cfc_root#model.imageOperator').init() />
		<cfreturn this />
	</cffunction>

	<cffunction name="upload_artist_images" output="false" hint="I eat artist beans, if a new image has been submited then I upload it and poop generated images">
		<cfargument name="bean" type="artistBean" required="true" />
<!--- 		<cfargument name="event" />
 --->		
		<cfset artist = arguments.bean />
		<cfset destination_portrait_path = '#expandPath(artist.getImages_path())#portrait_source.jpg' />

		<cfif Len(FORM.portrait_image)>
			<cfif NOT directoryExists('#expandPath(artist.getImages_path())#')>
				<cfdirectory action="create" directory="#expandPath(artist.getImages_path())#" type="dir" />
			</cfif>
		
			<cffile action="UPLOAD" 
				filefield="FORM.portrait_image" 
				destination="#GetTempDirectory()#"
				nameConflict="MakeUnique" />
			
			<cffile action="RENAME"
				destination="#destination_portrait_path#"
				source="#CFFILE.ServerFile#" />
		</cfif>
		
		<cfset this.generate_artist_images(artist) />
		
	</cffunction>
	
	<cffunction name="upload_publication_images" output="false" hint="I eat publication beans and upload any new images that have been submitted">
		<cfargument name="bean" type="publicationBean" required="true" />
<!--- 		<cfargument name="event" />
 --->		
		<cfset publication = arguments.bean />
		<cfif NOT directoryExists('#expandPath(publication.getImages_path())#')>
			<cfdirectory action="create" directory="#expandPath(publication.getImages_path())#" />
		</cfif>
		<cfif IsDefined("FORM.cover_image") AND Len(FORM.cover_image)>
			
			<cfset destination_cover_path = '#expandPath(publication.getImages_path())#cover.jpg' />
			
			<cffile action="UPLOAD" 
				filefield="FORM.cover_image" 
				destination="#GetTempDirectory()#"
				nameConflict="MakeUnique" />
			
			<cffile action="RENAME"
				destination="#destination_cover_path#"
				source="#CFFILE.ServerFile#" />
								
		</cfif>
		<cfset killswitch = 0 />
		<cfset i = 1 />
		
		<cfloop condition="killswitch NEQ 1">
			<cfif StructKeyExists(FORM, 'container_image#i#')>
				<cfif len(evaluate('FORM.container_image#i#'))>
					<cfset container_image_path = '#expandPath(publication.getImages_path())#container#i#.jpg' />
			
					<cffile action="UPLOAD" 
						filefield="FORM.container_image#i#" 
						destination="#GetTempDirectory()#"
						nameConflict="MakeUnique" />
					
					<cffile action="RENAME"
						destination="#container_image_path#"
						source="#CFFILE.ServerFile#" />
						
				</cfif>
				<cfset i++ />
			<cfelse>
				<cfset killswitch = 1 />
				<cfbreak />
			</cfif>
		</cfloop>
		
		<cfset killswitch = 0 />
		<cfset i = 1 />
		
		<cfloop condition="killswitch NEQ 1">
			<cfif StructKeyExists(FORM, 'content_image#i#')>
				<cfif len(evaluate('FORM.content_image#i#'))>
					<cfset content_image_path = '#expandPath(publication.getImages_path())#content#i#.jpg' />
			
					<cffile action="UPLOAD" 
						filefield="FORM.content_image#i#" 
						destination="#GetTempDirectory()#"
						nameConflict="MakeUnique" />
					
					<cffile action="RENAME"
						destination="#content_image_path#"
						source="#CFFILE.ServerFile#" />
						
				</cfif>
				<cfset i++ />
			<cfelse>
				<cfset killswitch = 1 />
				<cfbreak />
			</cfif>
		</cfloop>
		<cfset this.generate_publication_images(publication) />
		
	</cffunction>
	
	<cffunction name="generate_artist_images" output="false" hint="I eat artist beans and poop generated images">
		<cfargument name="bean" type="artistBean" required="true" />
<!--- 		<cfargument name="event" />
 --->		<cfset artist = arguments.bean />
		<cfset user_defined_large_size = ['#arguments.bean.getResize_dimensions()#','#arguments.bean.getResize_dimensions()#','lanczos'] />
<!--- 		<cfset arguments.event.trace("user defined size", user_defined_large_size) />
 --->		<cfset portrait_sized = variables.image_operator.resize_image(destination_portrait_path, user_defined_large_size) />
		<cfimage source="#portrait_sized#" action="write" quality=".9" destination="#expandPath(artist.getImages_path())#portrait.jpg" overwrite="yes" />
	</cffunction>

	<cffunction name="generate_publication_images" output="false" hint="I eat publication beans and poop generated images.">
		<cfargument name="bean" type="publicationBean" required="true" />
<!--- 		<cfargument name="event" />
 --->		<cfset variables.expanded_image_path = ExpandPath(arguments.bean.getImages_path()) />
		<cfset variables.master_cover_path = '#expanded_image_path#cover.jpg' />
		<cfif FileExists('#variables.master_cover_path#')>
				<cfset cover_main = variables.image_operator.resize_image(variables.master_cover_path, 'cover_main') />
				<cfset cover_large = variables.image_operator.resize_image(variables.master_cover_path, 'large') />
				<cfset cover_medium = variables.image_operator.resize_image(master_cover_path,'medium') />
				<cfset cover_small =  variables.image_operator.resize_image(master_cover_path,'small') />
				<cfset cover_thumb =  variables.image_operator.resize_image(variables.master_cover_path, 'thumb') />
				<cfimage source="#cover_main#" action="write" quality=".9" destination="#expanded_image_path#cover_main.jpg" overwrite="#variables.overwrite_setting#" />
				<cfimage source="#cover_large#" action="write" quality=".9" destination="#expanded_image_path#cover_large.jpg" overwrite="#variables.overwrite_setting#" />
				<cfimage source="#cover_medium#" action="write" quality=".9" destination="#expanded_image_path#cover_medium.jpg" overwrite="#variables.overwrite_setting#" />
				<cfimage source="#cover_small#" action="write" quality=".9" destination="#expanded_image_path#cover_small.jpg" overwrite="#variables.overwrite_setting#" />
				<cfimage source="#cover_thumb#" action="write" quality=".9" destination="#expanded_image_path#cover_thumb.jpg" overwrite="#variables.overwrite_setting#" />

				<cfset killswitch = false />
				<cfset i = '1' />
		
				<cfloop condition="NOT killswitch">
					<cfif FileExists("#expanded_image_path#container#i#.jpg")>
						<cfif NOT FileExists("#expanded_image_path#container#i#_thumb.jpg") OR (StructKeyExists(FORM, 'container_image#i#') AND len(evaluate('FORM.container_image#i#')))>
							<cfset additional_image = variables.image_operator.resize_image('#expanded_image_path#container#i#.jpg', 'large') /> 
							<cfset additional_image_thumb = variables.image_operator.resize_image('#expanded_image_path#container#i#.jpg', 'thumb') />
							<cfimage source="#additional_image#" action="write" quality=".9" destination="#expanded_image_path#container#i#_large.jpg" overwrite="#variables.overwrite_setting#" />
							<cfimage source="#additional_image_thumb#" action="write" quality=".9" destination="#expanded_image_path#container#i#_thumb.jpg" overwrite="#variables.overwrite_setting#" />
						</cfif>
					<cfelse>
						<cfset killswitch = true />
						<cfbreak />
					</cfif>
					<cfset i++ />
				</cfloop>
				
				<cfset killswitch = false />
				<cfset i = '1' />
		
				<cfloop condition="NOT killswitch">
					<cftry>
						<cfif FileExists("#expanded_image_path#content#i#.jpg")>
							<cfif NOT FileExists("#expanded_image_path#content#i#_thumb.jpg") OR (StructKeyExists(FORM, 'content_image#i#') AND len(evaluate('FORM.content_image#i#')))>
								<cfset additional_image = variables.image_operator.resize_image('#expanded_image_path#content#i#.jpg', 'large') /> 
								<cfset additional_image_thumb = variables.image_operator.resize_image('#expanded_image_path#content#i#.jpg', 'thumb') />
								<cfimage source="#additional_image#" action="write" quality=".9" destination="#expanded_image_path#content#i#_large.jpg" overwrite="#variables.overwrite_setting#" />
								<cfimage source="#additional_image_thumb#" action="write" quality=".9" destination="#expanded_image_path#content#i#_thumb.jpg" overwrite="#variables.overwrite_setting#" />
							</cfif>
						<cfelse>
							<cfset killswitch = true />
							<cfbreak />
						</cfif>
					<cfcatch>
					
					</cfcatch>
					</cftry>
					<cfset i++ />
				</cfloop>
				
		<cfelse>
		
<!--- 			<cfset arguments.event.trace('No image found to make cover at passed path', master_cover_path) />
			<cfset arguments.event.setValue('error_message','Cover image not found for #arguments.bean.getTitle()#') />
			<cfset arguments.event.addResult("errorsFound")> --->
		
		</cfif>
	</cffunction>
	
</cfcomponent>