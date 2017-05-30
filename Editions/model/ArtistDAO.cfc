<cfcomponent output="false" displayName="Artist DAO">

<cfset variables.dsn = "">
<cfset variables.LOCK = "photoeye_editions_artist">
   
<cffunction name="init" access="public" returnType="ArtistDAO" output="false">
   <cfargument name="dsn" type="ModelGlue.Bean.CommonBeans.Datasource" required="true">
   
   <cfset variables.dsn = arguments.dsn.getDsn() />
   
   <cfreturn this>
</cffunction>
   
<cffunction name="create" access="public" returnType="ArtistBean" output="false">
   <cfargument name="bean" type="ArtistBean" required="true">
        <cfquery name="createArtist" datasource="#dsn#">
			INSERT INTO editions_artists (first_name, last_name, dob, biography, statement, exhibitions, collections, publications, awards, representation, portrait_credit)
			VALUES (<cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.bean.getFirst_name())#" maxlength="15">,
			<cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.bean.getLast_name())#" maxlength="15">,
			<cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.bean.getDob())#">,
			<cfqueryparam cfsqltype="cf_sql_longvarchar" value="#trim(arguments.bean.getBiography())#">,
			<cfqueryparam cfsqltype="cf_sql_longvarchar" value="#trim(arguments.bean.getStatement())#">,
			<cfqueryparam cfsqltype="cf_sql_longvarchar" value="#trim(arguments.bean.getExhibitions())#">,
			<cfqueryparam cfsqltype="cf_sql_longvarchar" value="#trim(arguments.bean.getCollections())#">,
			<cfqueryparam cfsqltype="cf_sql_longvarchar" value="#trim(arguments.bean.getPublications())#">,
			<cfqueryparam cfsqltype="cf_sql_longvarchar" value="#trim(arguments.bean.getAwards())#">,
			<cfqueryparam cfsqltype="cf_sql_longvarchar" value="#trim(arguments.bean.getRepresentation())#">,
			<cfqueryparam cfsqltype="cf_sql_longvarchar" value="#trim(arguments.bean.getPortrait_credit())#">)

		</cfquery>
   <cfreturn arguments.bean>
</cffunction>
   
<cffunction name="delete" access="public" returnType="void" output="false">
   <cfargument name="id" type="numeric" required="true">
   
</cffunction>
   
<cffunction name="read" access="public" returnType="ArtistBean" output="false">
	<cfargument name="id" required="true" />
	<cfset var artist = createObject("component","ArtistBean").init() />
	<cfset var getit = "" />
	<cfquery name="getit" datasource="#dsn#">
		SELECT id, first_name, last_name, dob, biography, statement, exhibitions, collections, publications, awards, representation, portrait_credit
		FROM editions_artists
		WHERE id = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.id)#" maxlength="3">
	</cfquery>
	<cfset artist.autoSetFromQuery(getit) />

   <!--- <cfif getit.recordCount>
      <cfloop index="col" list="#getit.columnlist#">
         <cfinvoke component="#bean#" method="set#col#">
            <cfinvokeargument name="#col#" value="#getit[col][1]#">
         </cfinvoke>
      </cfloop>
   </cfif> --->
   
   <cfreturn artist />
</cffunction>

<cffunction name="findByName" access="public" returnType="ArtistBean" output="false">
	<cfargument name="last_name" required="true" />
	<cfset var artist = createObject("component","ArtistBean").init() />
	<cfset var getit = "" />
	<cfquery name="getit" datasource="#dsn#">
		SELECT id, first_name, last_name, dob, biography, statement, exhibitions, collections, publications, awards, representation, portrait_credit
		FROM editions_artists
		WHERE last_name = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.last_name)#" maxlength="25">
	</cfquery>
	<cfset artist.autoSetFromQuery(getit) />

   <!--- <cfif getit.recordCount>
      <cfloop index="col" list="#getit.columnlist#">
         <cfinvoke component="#bean#" method="set#col#">
            <cfinvokeargument name="#col#" value="#getit[col][1]#">
         </cfinvoke>
      </cfloop>
   </cfif> --->
   
   <cfreturn artist />
</cffunction>

<cffunction name="update" returnType="ArtistBean" access="public" output="false">
   <cfargument name="bean" type="ArtistBean" required="true">
		<cfquery name="updateArtist" datasource="#dsn#">
			UPDATE editions_artists
			SET 
			first_name = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.bean.getFirst_name())#" maxlength="15">,
			last_name = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.bean.getLast_name())#" maxlength="15">,
			dob = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.bean.getDob())#">,
			biography = <cfqueryparam cfsqltype="cf_sql_longvarchar" value="#trim(arguments.bean.getBiography())#">,
			statement = <cfqueryparam cfsqltype="cf_sql_longvarchar" value="#trim(arguments.bean.getStatement())#">,
			exhibitions = <cfqueryparam cfsqltype="cf_sql_longvarchar" value="#trim(arguments.bean.getExhibitions())#">,
			collections = <cfqueryparam cfsqltype="cf_sql_longvarchar" value="#trim(arguments.bean.getCollections())#">,
			publications = <cfqueryparam cfsqltype="cf_sql_longvarchar" value="#trim(arguments.bean.getPublications())#">,
			awards = <cfqueryparam cfsqltype="cf_sql_longvarchar" value="#trim(arguments.bean.getAwards())#">,
			representation = <cfqueryparam cfsqltype="cf_sql_longvarchar" value="#trim(arguments.bean.getRepresentation())#">,
			portrait_credit = <cfqueryparam cfsqltype="cf_sql_longvarchar" value="#trim(arguments.bean.getPortrait_credit())#">
			
			WHERE id = <cfqueryparam cfsqltype="cf_sql_idstamp" value="#trim(arguments.bean.getID())#">
		</cfquery>
   <cfreturn arguments.bean>
</cffunction>
</cfcomponent>