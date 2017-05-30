<cfcomponent displayname="Publication Gateway" output="false">
	<cffunction name="init" access="public" returnType="PublicationGateway" output="false">
		<cfargument name="dsn" required="true" type="ModelGlue.Bean.CommonBeans.Datasource" />
		<cfargument name="publicationDAO" required="true" type="publicationDAO" />
			<cfset variables.dsn = arguments.dsn.getDsn() />
			<cfset beans.publicationDAO = arguments.publicationDAO />
		<cfreturn this />
	</cffunction>

	<cffunction name="getFeatured" access="public" returnType="PublicationBean" output="false">

		<!--- !TODO: for production, make LIMIT 1 => TOP 1 * --->
		<cfquery name="pub" datasource="#variables.dsn#">
			SELECT TOP 1 *
			FROM editions_publications
		</cfquery>
		
		<cfreturn beans.publicationDAO.read(pub.catalog_number) />
		
	</cffunction>
	
	<cffunction name="getAll" access="public" returnType="Array" output="false">
		<cfargument name="event" />
		
		<cfset var bean_collection = ArrayNew(1) />
		<cfset var q = "" />
			<!--- Here's where we can control this for testing, this excludes elaine ling from everyone but photo-eye--->
			<cfif cgi.x_forwarded_for is '65.100.24.36' or 1 is 1>
				<cfquery name="q" datasource="#variables.dsn#">
					SELECT catalog_number
					FROM editions_publications 
				</cfquery>
			<cfelse>
				<cfquery name="q" datasource="#variables.dsn#">
					SELECT catalog_number
					FROM editions_publications where catalog_number <> 'PE041'
				</cfquery>
					
			</cfif>

		<cfif q.recordcount>
			<cfloop query="q">
				<cfset bean_collection[q.currentRow] = beans.publicationDAO.read(q.catalog_number) />
			</cfloop>
		</cfif>
		
		<cfreturn bean_collection />
	</cffunction>

</cfcomponent>