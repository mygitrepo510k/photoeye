<cfcomponent displayname="Artist Bean" output="false">
	<cffunction name="init" returntype="any" access="public" output="false">
			<cfscript>
				variables.instance = structNew();
				variables.instance.first_name = "";
				variables.instance.last_name = "";
				variables.instance.name = "";
				variables.instance.statement = "";
				variables.instance.biography = "";
				variables.instance.exhibitions = "No exhibition history currently available.";
				variables.instance.collections = "No collection information currently available.";
				variables.instance.publications = "No bibliography currently available.";
				variables.instance.awards = "No awards currently listed.";
				variables.instance.representation = "No representation currently listed.";
				variables.instance.id = 0;
				variables.instance.dob = "";
				variables.instance.resize_dimensions = "480";
				variables.instance.portrait_credit = "";
				variables.instance.publication_array = "";
			</cfscript>
		<cfreturn this />
	</cffunction>
	<!--- Getters and setter for database attributes --->
	<cffunction name="setID" access="public" returntype="void" output="false">
		<cfargument name="id" type="numeric" required="true" />
		<cfset variables.instance.id = arguments.id />
	</cffunction>
	<cffunction name="getID" access="public" returntype="numeric" output="false">
		<cfreturn variables.instance.id />
	</cffunction>

	<cffunction name="setFirst_name" access="public" returntype="void" output="false">
		<cfargument name="first_name" type="string" required="true" />
		<cfset variables.instance.first_name = arguments.first_name  />
	</cffunction>
	<cffunction name="getFirst_name" access="public" returntype="string" output="false">
		<cfreturn variables.instance.first_name />
	</cffunction>
	
	<cffunction name="setLast_name" access="public" returntype="void" output="false">
		<cfargument name="last_name" type="string" required="true" />

		<cfset variables.instance.last_name = arguments.last_name  />
	</cffunction>
	<cffunction name="getLast_name" access="public" returntype="string" output="false">
		<cfreturn variables.instance.last_name />
	</cffunction>
	
	<cffunction name="setDob" access="public" returntype="void" output="false">
		<cfargument name="dob" type="string" required="true" />
		<cfset variables.instance.dob = arguments.dob  />
	</cffunction>
	<cffunction name="getDob" access="public" returntype="string" output="false">
		<cfreturn variables.instance.dob />
	</cffunction>
	
<!--- Biography not currently in use --->	
	<cffunction name="setBiography" access="public" returntype="void" output="false">
		<cfargument name="biography" type="string" required="true" />
		<cfset variables.instance.biography = arguments.biography  />
	</cffunction>
	<cffunction name="getBiography" access="public" returntype="string" output="false">
		<cfreturn variables.instance.biography />
	</cffunction>

	<cffunction name="setStatement" access="public" returntype="void" output="false">
		<cfargument name="statement" type="string" required="true" />
		<cfset variables.instance.statement = arguments.statement  />
	</cffunction>
	<cffunction name="getStatement" access="public" returntype="string" output="false">
		<cfreturn variables.instance.statement />
	</cffunction>
	
	<cffunction name="setExhibitions" access="public" returntype="void" output="false">
		<cfargument name="exhibitions" type="string" required="true" />
		<cfset variables.instance.exhibitions = arguments.exhibitions  />
	</cffunction>
	<cffunction name="getExhibitions" access="public" returntype="string" output="false">
		<cfreturn variables.instance.exhibitions />
	</cffunction>
	
	<cffunction name="setCollections" access="public" returntype="void" output="false">
		<cfargument name="collections" type="string" required="true" />
		<cfset variables.instance.collections = arguments.collections  />
	</cffunction>
	<cffunction name="getCollections" access="public" returntype="string" output="false">
		<cfreturn variables.instance.collections />
	</cffunction>
	
	<cffunction name="setPublications" access="public" returntype="void" output="false">
		<cfargument name="publications" type="string" required="true" />
		<cfset variables.instance.publications = arguments.publications  />
	</cffunction>
	<cffunction name="getPublications" access="public" returntype="string" output="false">
		<cfreturn variables.instance.publications />
	</cffunction>
	
	<cffunction name="setResize_dimensions" access="public" returntype="void" output="false">
		<cfargument name="resize_dimensions" type="any" required="true" />
		<cfset variables.instance.resize_dimensions = arguments.resize_dimensions />
	</cffunction>
	<cffunction name="getResize_dimensions" access="public" returntype="any" output="false">
		<cfreturn variables.instance.resize_dimensions />
	</cffunction>

	<cffunction name="setAwards" access="public" returntype="void" output="false">
		<cfargument name="awards" type="any" required="true" />
		<cfset variables.instance.awards = arguments.awards />
	</cffunction>	
	<cffunction name="getAwards" access="public" returntype="any" output="false">
		<cfreturn variables.instance.awards />
	</cffunction>
	
	<cffunction name="setRepresentation" access="public" returntype="void" output="false">
		<cfargument name="representation" type="any" required="true" />
		<cfset variables.instance.representation = arguments.representation />
	</cffunction>
	<cffunction name="getRepresentation" access="public" returntype="any" output="false">
		<cfreturn variables.instance.representation />
	</cffunction>
	
	<cffunction name="setPortrait_credit" access="public" returntype="void" output="false">
		<cfargument name="portrait_credit" type="any" required="true" />
		<cfset variables.instance.portrait_credit = arguments.portrait_credit />
	</cffunction>
	<cffunction name="getPortrait_credit" access="public" returntype="any" output="false">
		<cfreturn variables.instance.portrait_credit />
	</cffunction>

	<!--- additional getters --->
	<cffunction name="getName" returnType="string" access="public" output="false">
		<cfreturn variables.instance.first_name & " " & variables.instance.last_name />
	</cffunction>
	
	<cffunction name="getImages_path" access="public" returntype="string" output="false">
		<cfreturn "#application.root_path#images/artists/#variables.instance.last_name#/" />
	</cffunction>
	
	<cffunction name="getPortrait_dimensions">
		<cftry>
		<cfimage action="info" source="#expandPath(this.getImages_path()&'portrait.jpg')#" structname="image_info">
		<cfset variables.instance.portrait_width = image_info.width />
		<cfset variables.instance.portrait_height = image_info.height />
		<cfreturn image_info />
		<cfcatch>
			<cfset variables.instance.portrait_width = 0 />
			<cfset variables.instance.portrait_height = 0 />
			<cfset image_info = StructNew() />
			<cfset image_info.width = 0 />
			<cfset image_info.height = 0 />
			<cfreturn image_info />
		</cfcatch>
		</cftry>
	</cffunction>
		
	<cffunction name="getInstance" returnType="struct" access="public" output="false">
		<cfset variables.instance.name = this.getName() />
		<cfset variables.instance.portrait = "#this.getImages_path()#portrait.jpg" />
		<cfset this.getPortrait_dimensions() />
	   <cfreturn duplicate(variables.instance) />
	</cffunction>
	
	<!--- additional functions --->
	<cffunction name="autoSetFromQuery" returnType="boolean" access="public" output="false">
		<cfargument name="passed_query" type="Query" required="true" />
		<cfargument name="row" type="any" required="false" default="1" />
		
		<cfif arguments.passed_query.recordcount>	
		
			<cfloop index="col" list="#arguments.passed_query.columnlist#">
	         <cfinvoke component="#this#" method="set#col#">
	            <cfinvokeargument name="#col#" value="#arguments.passed_query[col][arguments.row]#">
	         </cfinvoke>
	      	</cfloop>
	      	
	      	<cfreturn true />
	      	
	   	<cfelse>
	   	
	   		<cfreturn false />
		
		</cfif>
		
	</cffunction>

</cfcomponent>