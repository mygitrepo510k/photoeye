<cfcomponent output="false" hint="I am a Model-Glue controller." extends="ModelGlue.gesture.controller.Controller">

	<cffunction name="init" access="public" output="false" hint="Constructor">
		<cfset variables.force_images = false />
		
		<cfreturn this />
	</cffunction>

	<cffunction name="index" output="false" hint="I am a message listener function generated for the ""publication.index"" event.">
		<cfargument name="event" />
		
		<cfset variables.publications = beans.publicationGateway.getAll() />
		<cfset arguments.event.setValue('publications', publications) />
		
		<cfscript>
			buttons = StructNew();
			buttons.add_new_edition = arguments.event.LinkTo('publication.new');
			arguments.event.setValue('buttons',buttons);
		</cfscript>
		
	</cffunction>
	

	<cffunction name="show" output="false" hint="I am a message listener function generated for the ""publication.show"" event.">
		<cfargument name="event" />
		
		<cfset errors = '' />
		<cfset catalog_number = arguments.event.getValue('catalog') />
		
		<cfif len(catalog_number)>
			<cfset variables.publication = beans.publicationDAO.read('#catalog_number#') />
			<cfif len(variables.publication.getCatalog_number())>
				
				<cfscript>
					buttons = StructNew();
					buttons.add_publication = event.LinkTo('publication.new');
					buttons.edit_citation = event.LinkTo('publication.edit','catalog');
					buttons.regenerate_images = event.LinkTo('publication.generateImages','catalog');
					arguments.event.setValue('buttons',buttons);
				</cfscript>
	
				<cfset arguments.event.setValue('publication', publication.getInstance()) />
				<cfset arguments.event.setValue('page_title', ReplaceNoCase("#publication.getAuthor()#: #publication.getTitle()#","<br>","","all")) />			
			<cfelse>
				 <cfset errors = "No publication found by that catalog number" />
			</cfif>
		<cfelse>
			<cfset errors = "No catalog number provided" />
		</cfif>
		
		<cfif len(errors)>
			<cfset arguments.event.setValue('error_message', errors) />
			<cfset arguments.event.addResult('errorsFound') />
		</cfif>
			
<!--- 		<cfset cat = arguments.event.getValue('cat') />
		
		<cfif len(cat)>		
			<cfset arguments.event.trace('catnum',cat) />
			<cfset title = "Title From Cat Variable [#cat#]" />
		<cfelse>
			<cfset title = "Title" />
		</cfif>
 --->
		
		<!--- 
			Put "behind the scenes" query, form validation, and model interaction code here.
			  
			Use event.getValue("name") to get variables from the FORM and URL scopes.
		--->
	</cffunction>
	
	<cffunction name="new" output="false" hint="create a new publication">
		<cfargument name="event" />
		<cfset event.setValue('publication',beans.publicationBean.init().getInstance()) />
	</cffunction>
	
	<cffunction name="xe_new" output="false" hint="action page for new publication">
		<cfargument name="event" />
				
		<cfset publication = event.MakeEventBean(beans.publicationBean) />
		<cfset beans.publicationDAO.create(publication) />
		<cfset beans.imageManager.upload_publication_images(publication, arguments.event) />
		<cfset arguments.event.setValue('catalog', publication.getCatalog_number()) />
		<cfset arguments.event.setValue('notice_message','#publication.getTitle()# was added successfully') />		
	
	</cffunction>
	
	<cffunction name="edit" output="false" hint="edit a publication">
		<cfargument name="event" />
		<cfset catalog_number = arguments.event.getValue('catalog') />
		<cfset publication = beans.publicationDAO.read(catalog_number) />
		<cfif len(publication.getTitle())>
			<cfset arguments.event.setValue('publication', publication.getInstance()) />
			<cfset arguments.event.setValue('page_title','editing #publication.getTitle()#') />
		<cfelse>
			<cfset arguments.event.setValue('error_message','No publication found for catalog number #catalog_number#') />
			<cfset arguments.event.addResult('errorsFound') />
		</cfif>
	</cffunction>

	<cffunction name="xe_edit" output="false" hint="I am a message listener for the publication.xe_edit event">
		<cfargument name="event" />
		<cfset publication = beans.publicationDAO.read(arguments.event.getValue('catalog')) />
		<cfset publication.setPricing(arguments.event.getValue('pricing')) />
		<cfset publication.setTagline(arguments.event.getValue('tagline')) />
		<cfset beans.publicationDAO.update(publication) />
		<cfset beans.imageManager.upload_publication_images(publication, arguments.event) />
		<cfset arguments.event.setValue('catalog', '#publication.getCatalog_number()#') />
		<cfset arguments.event.setValue('notice_message','#publication.getTitle()# was updated successfully') />		
	</cffunction>
	
	<cffunction name="generateImages" output="false" hint="regenerate a publication's images">
		<cfargument name="event" />
		<cfsetting requestTimeout="600" />
		<cfset publication = beans.publicationDAO.read(arguments.event.getValue('catalog')) />
		<cfset beans.imageManager.generate_publication_images(publication) />
	</cffunction>

	<cffunction name="all" output="false" hint="I am a message listener function generated for the ""publication.all"" event.">
		<cfargument name="event" />
		
<!---
		<cfset publications = beans.publicationGateway.getAll() />
		<cfset arguments.event.setValue('publications', publications) />
--->
		
		<!--- 
			Put "behind the scenes" query, form validation, and model interaction code here.
			  
			Use event.getValue("name") to get variables from the FORM and URL scopes.
		--->
	</cffunction>
	



	<cffunction name="recent" output="false" hint="I am a message listener function generated for the ""publication.recent"" event.">
		<cfargument name="event" />
		
		<!--- 
			Put "behind the scenes" query, form validation, and model interaction code here.
			  
			Use event.getValue("name") to get variables from the FORM and URL scopes.
		--->
	</cffunction>
	

</cfcomponent>	
	
	



