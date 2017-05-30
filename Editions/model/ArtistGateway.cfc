<cfcomponent displayname="Artist Gateway" output="false">
	
	<cffunction name="init" access="public" returnType="ArtistGateway" output="false">
		<cfargument name="dsn" required="true" type="ModelGlue.Bean.CommonBeans.Datasource" />
			<cfset variables.dsn = arguments.dsn.getDsn() />
<!--- ! monkeypatch, this needs to be changed to a coldspring dependency, and in the meantime changed by hand --->
			<cfset variables.publicationDAO = CreateObject('component', '#application.cfc_root#model.PublicationDAO').init(arguments.dsn) />		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getAll" access="public" returnType="any" output="false">
		<cfquery name="q_artists" datasource="#dsn#">
			SELECT ID, first_name, last_name, statement  
			FROM editions_artists
		</cfquery>
		<cfif q_artists.recordcount>
			<cfset artists = ArrayNew(1) />			
			<cfloop query="q_artists">
				<cfset artist = createObject("component","ArtistBean").init() />
				<cfset artist.autoSetFromQuery(q_artists,"#q_artists.currentRow#") />
				<cfset ArrayAppend(artists, artist) />
			</cfloop>
			
			<cfreturn artists />
		</cfif>
	</cffunction>
	
	<cffunction name="getPublications" access="public" returnType="any" output="false">
		<cfargument name="artist" type="artistBean" required="true" />
		<cfquery name="q_artist_publications" dataSource="#dsn#">
			SELECT * FROM editions_publications
			WHERE artist_id = <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#arguments.artist.getId()#" maxLength="3">
		</cfquery>
		<cfif q_artist_publications.recordcount>
<!--- ! this will need to be pluralized eventually in case of multiple publications by the same artist, some of that code roughed in below.
			<cfset publications = ArrayNew(1) />			
			<cfloop query="q_artist_publications">
				<cfset ArrayAppend(publications, "#q_artist_publications.catalog_number#") />
			</cfloop>
--->
			<cfset publication = variables.publicationDAO.read('#q_artist_publications.catalog_number#') />
			<cfreturn publication />
		</cfif>
	</cffunction>

</cfcomponent>