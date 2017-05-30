<cfcomponent displayname="Publication Bean" output="false">

	<cffunction name="init" returntype="any" access="public" output="false">
		
	<cfscript> 
		variables.instance = structNew();
		variables.instance.catalog_number = "";
		variables.instance.title = "";
		variables.instance.author = "";
		variables.instance.description = "";
		variables.instance.full_authors = "";
		variables.instance.subtitle = "";
		variables.instance.page_count = "";
		variables.instance.illustration_count = "";
		variables.instance.hb_due_date = "";
		variables.instance.sb_due_date = "";
		variables.instance.hb_not_yet_published = "";
		variables.instance.sb_not_yet_published = "";
		variables.instance.pricing = "";
		variables.instance.tagline = "";
		variables.instance.price = [];
		variables.instance.stock_id = [];
		variables.instance.inventory_id = "";
		variables.instance.passthrough_number = [];
		variables.instance.binding_name = [];
		variables.instance.artist_id = 0;
	</cfscript>
		
		<cfreturn this />
	</cffunction>

	<cffunction name="setCatalog_number" access="public" returntype="void" output="false">
		<cfargument name="catalog_number" type="string" required="true" />
		<cfset variables.instance.catalog_number = arguments.catalog_number />
	</cffunction>
	<cffunction name="getCatalog_number" access="public" returntype="string" output="false">
		<cfreturn variables.instance.catalog_number />
	</cffunction>

	
	<cffunction name="setTitle" access="public" returntype="void" output="false">
		<cfargument name="title" type="string" required="true" />
		<cfset variables.instance.title = replace(arguments.title,'.','','ALL') />
	</cffunction>
	<cffunction name="getTitle" access="public" returntype="string" output="false">
		<cfreturn variables.instance.title />
	</cffunction>

	<cffunction name="setAuthor" access="public" returntype="void" output="false">
		<cfargument name="author" type="string" required="true" />
		<cfset variables.instance.author = arguments.author />
	</cffunction>
	<cffunction name="getAuthor" access="public" returntype="string" output="false">
		<cfreturn variables.instance.author />
	</cffunction>

	<cffunction name="setDescription" access="public" returntype="void" output="false">
		<cfargument name="description" type="string" required="true" />
		<cfset variables.instance.description = arguments.description />
	</cffunction>
	<cffunction name="getDescription" access="public" returntype="string" output="false">
		<cfreturn variables.instance.description />
	</cffunction>

	<cffunction name="setFull_authors" access="public" returntype="void" output="false">
		<cfargument name="full_authors" type="string" required="true" />
		<cfset variables.instance.full_authors = arguments.full_authors />
	</cffunction>
	<cffunction name="getFull_authors" access="public" returntype="string" output="false">
		<cfreturn variables.instance.full_authors />
	</cffunction>

	<cffunction name="setSubtitle" access="public" returntype="void" output="false">
		<cfargument name="subtitle" type="string" required="true" />
		<cfset variables.instance.subtitle = arguments.subtitle />
	</cffunction>
	<cffunction name="getSubtitle" access="public" returntype="string" output="false">
		<cfreturn variables.instance.subtitle />
	</cffunction>

	<cffunction name="setPage_count" access="public" returntype="void" output="false">
		<cfargument name="page_count" type="any" required="true" />
		<cfset variables.instance.page_count = trim(arguments.page_count) />
	</cffunction>
	<cffunction name="getPage_count" access="public" returntype="any" output="false">
		<cfreturn variables.instance.page_count />
	</cffunction>

	<cffunction name="setIllustration_count" access="public" returntype="void" output="false">
		<cfargument name="illustration_count" type="string" required="true" />
		<cfset variables.instance.illustration_count = arguments.illustration_count />
	</cffunction>
	<cffunction name="getIllustration_count" access="public" returntype="string" output="false">
		<cfreturn variables.instance.illustration_count />
	</cffunction>

	<cffunction name="setHb_due_date" access="public" returntype="void" output="false">
		<cfargument name="hb_due_date" type="string" required="true" />
		<cfif isDate(arguments.hb_due_date)>
			<cfset arguments.hb_due_date = dateformat(arguments.hb_due_date,"MM/DD/YYYY") />
		</cfif>
		<cfset variables.instance.hb_due_date = trim(arguments.hb_due_date) />
	</cffunction>
	<cffunction name="getHb_due_date" access="public" returntype="string" output="false">
		<cfreturn variables.instance.hb_due_date />
	</cffunction>

	<cffunction name="setSb_due_date" access="public" returntype="void" output="false">
		<cfargument name="sb_due_date" type="string" required="true" />
		<cfif isDate(arguments.sb_due_date)>
			<cfset arguments.sb_due_date = dateformat(arguments.sb_due_date,"MM/DD/YYYY") />
		</cfif>
		<cfset variables.instance.sb_due_date = trim(arguments.sb_due_date) />
	</cffunction>
	<cffunction name="getSb_due_date" access="public" returntype="string" output="false">
		<cfreturn variables.instance.sb_due_date />
	</cffunction>

	<cffunction name="setHb_not_yet_published" access="public" returntype="void" output="false">
		<cfargument name="hb_not_yet_published" type="any" required="true" />
		<cfset variables.instance.hb_not_yet_published = arguments.hb_not_yet_published />
	</cffunction>
	<cffunction name="getHb_not_yet_published" access="public" returntype="any" output="false">
		<cfreturn variables.instance.hb_not_yet_published />
	</cffunction>

	<cffunction name="setSb_not_yet_published" access="public" returntype="void" output="false">
		<cfargument name="sb_not_yet_published" type="any" required="true" />
		<cfset variables.instance.sb_not_yet_published = arguments.sb_not_yet_published />
	</cffunction>
	<cffunction name="getSb_not_yet_published" access="public" returntype="any" output="false">
		<cfreturn variables.instance.sb_not_yet_published />
	</cffunction>

	<cffunction name="setPricing" access="public" returntype="void" output="false">
		<cfargument name="pricing" type="any" required="true" />
		<cfset variables.instance.pricing = arguments.pricing />
	</cffunction>
	<cffunction name="getPricing" access="public" returntype="String" output="false">
		<cfreturn variables.instance.pricing />
	</cffunction>
	
	<cffunction name="setTagline" access="public" returntype="void" output="false">
		<cfargument name="tagline" type="any" required="true" />
		<cfset variables.instance.tagline = arguments.tagline />
	</cffunction>
	<cffunction name="getTagline" access="public" returntype="String" output="false">
		<cfreturn variables.instance.tagline />
	</cffunction>
	
	<cffunction name="setPrice" access="public" returntype="void" output="false">
		<cfargument name="price" type="any" required="true" />
		<cfset ArrayAppend(variables.instance.price, trim(arguments.price)) />
	</cffunction>
	<cffunction name="getPrice" access="public" returntype="String" output="false">
		<cfreturn variables.instance.price />
	</cffunction>

	<cffunction name="setStock_id" access="public" returntype="void" output="false">
		<cfargument name="stock_id" type="any" required="true" />
		<cfset ArrayAppend(variables.instance.stock_id, trim(arguments.stock_id)) />
	</cffunction>
	<cffunction name="getStock_id" access="public" returntype="String" output="false">
		<cfreturn variables.instance.stock_id />
	</cffunction>	
	
	<cffunction name="setInventory_id" access="public" returntype="void" output="false">
		<cfargument name="inventory_id" type="any" required="true" />
		<cfset variables.instance.inventory_id = arguments.inventory_id />
	</cffunction>
	<cffunction name="getInventory_id" access="public" returntype="String" output="false">
		<cfreturn variables.instance.inventory_id />
	</cffunction>	

	<cffunction name="setPassthrough_number" access="public" returntype="void" output="false">
		<cfargument name="passthrough_number" type="any" required="true" />
		<cfset ArrayAppend(variables.instance.passthrough_number, trim(arguments.passthrough_number)) />
	</cffunction>
	<cffunction name="getPassthrough_number" access="public" returntype="String" output="false">
		<cfreturn variables.instance.passthrough_number />
	</cffunction>	
	
	<cffunction name="setBinding_name" access="public" returntype="void" output="false">
	<cfargument name="binding_name" type="any" required="true" />
		<cfset ArrayAppend(variables.instance.binding_name, trim(arguments.binding_name)) />
	</cffunction>
	<cffunction name="getBinding_name" access="public" returntype="String" output="false">
		<cfreturn variables.instance.binding_name />
	</cffunction>	

	<cffunction name="getImages_path" access="public" returntype="string" output="false">
		<cfreturn "#application.root_path#images/publications/#variables.instance.catalog_number#/" />
	</cffunction>
	
	<cffunction name="setArtist_id" access="public" returntype="void" output="false">
		<cfargument name="artist_id" type="any" required="true" />
		<cfset variables.instance.artist_id = arguments.artist_id />
	</cffunction>
	<cffunction name="getArtist_id" access="public" returntype="any" output="false">
		<cfreturn variables.instance.artist_id />
	</cffunction>
	
	
	<cffunction name="getCover_dimensions">
		<cfif FileExists("#expandPath(this.getImages_path()&'cover_large.jpg')#")>
			<cfimage action="info" source="#expandPath(this.getImages_path()&'cover_large.jpg')#" structname="image_info">
			<cfset variables.instance.cover_width = image_info.width />
			<cfset variables.instance.cover_height = image_info.height />
			<cfreturn image_info />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>
	
	<cffunction name="getTotal_container_images">
		<cfset killswitch = 0 />
		<cfset i = 1 />
 		<cfloop condition="killswitch NEQ 1">
			<cfset expander = '#this.getImages_path()#container#i#.jpg' />
			<cfif FileExists(ExpandPath(expander))>
				<cfset i++ />
			<cfelse>
				<cfset killswitch = 1 />
				<cfbreak />
			</cfif>
		</cfloop>
		<cfset variables.instance.total_container_images = i-1 />
		<cfreturn variables.instance.total_container_images />
	</cffunction>
	
	<cffunction name="getTotal_content_images">
		<cfset killswitch = 0 />
		<cfset i = 1 />
		<cfloop condition="killswitch NEQ 1">
			<cfset expander = '#this.getImages_path()#content#i#.jpg' />
			<cfif FileExists(ExpandPath(expander))>
				<cfset i++ />
			<cfelse>
				<cfset killswitch = 1 />
				<cfbreak />
			</cfif>
		</cfloop> 
		<cfset variables.instance.total_content_images = i-1 />
		<cfreturn variables.instance.total_content_images />
	</cffunction>
	
	
	<cffunction name="getInstance" returnType="struct" access="public" output="false">
		<cfset variables.instance.image_path = this.getImages_path() />
		<cfset this.getTotal_container_images() />
		<cfset this.getTotal_content_images() />
		<cfset this.getCover_dimensions() />
	   <cfreturn duplicate(variables.instance) />
	</cffunction>
	
	<cffunction name="autoSetFromQuery" returnType="boolean" access="public" output="false">
		<cfargument name="passed_query" type="Query" required="true" />
		
		<cfif arguments.passed_query.recordcount>	
			<cfset current_row = arguments.passed_query.currentRow />
			
			<cfloop index="col" list="#arguments.passed_query.columnlist#">
	         <cfinvoke component="#this#" method="set#col#">
	            <cfinvokeargument name="#col#" value="#arguments.passed_query[col][current_row]#">
	         </cfinvoke>
	      	</cfloop>
	      	
	      	<cfreturn true />
	      	
	   	<cfelse>
	   	
	   		<cfreturn false />
		
		</cfif>
		
	</cffunction>

</cfcomponent>