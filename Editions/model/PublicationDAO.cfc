<cfcomponent output="false" displayName="Publication DAO">

<cfset variables.dsn = "">
<cfset variables.LOCK = "photoeye_editions_publication">
   
<cffunction name="init" access="public" returnType="PublicationDAO" output="false">
   <cfargument name="dsn" type="ModelGlue.Bean.CommonBeans.Datasource" required="true">
   
   <cfset variables.dsn = arguments.dsn.getDsn() />
   
   <cfreturn this>
</cffunction>
   
<cffunction name="create" access="public" returnType="PublicationBean" output="false">
   <cfargument name="bean" type="publicationBean" required="true">
		<cfquery name="createPublication" datasource="#dsn#">
			INSERT INTO editions_publications (catalog_number, pricing, tagline, artist_id)
			VALUES (<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="5" value="#arguments.bean.getCatalog_number()#">, <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.bean.getPricing()#">, <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.bean.getTagline()#">, <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.bean.getArtist_id())#" maxLength="3">)
		</cfquery>
         <cfreturn arguments.bean />
</cffunction>
   
<cffunction name="delete" access="public" returnType="void" output="false">
   <cfargument name="id" type="numeric" required="true">
   
</cffunction>
   
<cffunction name="read" access="public" returnType="PublicationBean" output="false">
	<cfargument name="catalog_number" type="string" required="true" />
	<cfargument name="event" />
	<cfset var bean = createObject("component","PublicationBean").init() />
	<cfquery name="fromEditions" datasource="#dsn#">
		SELECT pricing, tagline, artist_id FROM editions_publications
		WHERE catalog_number = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.catalog_number#" maxlength="5">
	</cfquery>
	<cfif fromEditions.recordcount> 
		<!--- !TODO: ID => RECORDID for production --->
		<!--- 28.Jul 2015 10:21 AM, BLM, added COALESCE(SUBJECT, subjectx) to sql in advent the subject was null, tries to use the upper case version    --->
		<cfquery name="fromInventory" datasource="#dsn#">
			SELECT CATALOG AS catalog_number, TITLE2X AS title, SUBTITLEX AS subtitle, COALESCE(SUBJECT, subjectx) AS author, AUTHORS AS full_authors, OCRX AS description, PAGES AS page_count, ILLUSTRAT AS illustration_count, HARD_DUE AS hb_due_date, SOFT_DUE AS sb_due_date, HARD_NYP AS hb_not_yet_published, SOFT_NYP AS sb_not_yet_published, RECORDID AS inventory_id
			FROM inventory
			WHERE CATALOG = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.catalog_number#" maxlength="5">
		</cfquery>
		<cfif NOT Len(fromInventory.description)>
			<cfquery name="fromInventory" datasource="#dsn#">
				SELECT CATALOG AS catalog_number, TITLE2X AS title, SUBTITLEX AS subtitle, COALESCE(SUBJECT, subjectx) AS author, AUTHORS AS full_authors, ABSTRACTX AS description, PAGES AS page_count, ILLUSTRAT AS illustration_count, HARD_DUE AS hb_due_date, SOFT_DUE AS sb_due_date, HARD_NYP AS hb_not_yet_published, SOFT_NYP AS sb_not_yet_published, RECORDID AS inventory_id
				FROM inventory
				WHERE CATALOG = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.catalog_number#" maxlength="5">
			</cfquery>		
		</cfif>
		<cfquery name="fromStock" datasource="#dsn#">
			SELECT AUTOID AS stock_id, PRICE1 AS price, NUMBER AS passthrough_number, NUMBER_BINDING AS binding_name
			FROM stock
			WHERE NUMBER_ROOT = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.catalog_number#" maxlength="5">
		</cfquery>
		<cfif fromInventory.recordcount>
<!---
			<cfdump var="#fromInventory#" />
			<cfdump var="#fromStock#" />
			<cfdump var="#fromEditions#" />
			<cfabort />
--->
			<cfset bean.autoSetFromQuery(fromInventory) />
			<cfloop query="fromStock">
				<cfset bean.autoSetFromQuery(fromStock) />
			</cfloop>
			<cfset bean.autoSetFromQuery(fromEditions) />
		<cfelse>
			
		</cfif>
	<cfelse>
		
	</cfif>
	
   <!--- <cfif getit.recordCount>
      <cfloop index="col" list="#getit.columnlist#">
         <cfinvoke component="#bean#" method="set#col#">
            <cfinvokeargument name="#col#" value="#getit[col][1]#">
         </cfinvoke>
      </cfloop>
   </cfif> --->
   
   <cfreturn bean>
</cffunction>

<cffunction name="readFromBookstore" access="public" returnType="PublicationBean" output="false">
	<cfargument name="catalog_number" type="string" required="true" />
	<cfargument name="event" />
	<cfset var bean = createObject("component","PublicationBean").init() />
	<cfquery name="fromInventory" datasource="#dsn#">
		SELECT CATALOG AS catalog_number, TITLE2X AS title, SUBTITLEX AS subtitle, SUBJECT AS author, AUTHORS AS full_authors, OCRX AS description, PAGES AS page_count, ILLUSTRAT AS illustration_count, HARD_DUE AS hb_due_date, SOFT_DUE AS sb_due_date, HARD_NYP AS hb_not_yet_published, SOFT_NYP AS sb_not_yet_published, RECORDID AS inventory_id
		FROM inventory
		WHERE CATALOG = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.catalog_number#" maxlength="5">
	</cfquery>
	<cfif fromInventory.recordcount>
		<cfset bean.autoSetFromQuery(fromInventory) />
	</cfif>
	<cfreturn bean />
</cffunction>

<cffunction name="update" returnType="publicationBean" access="public" output="false">
   <cfargument name="bean" type="publicationBean" required="true">
		<cfquery name="updatePublication" datasource="#dsn#">
			UPDATE editions_publications
			SET 
			pricing = <cfqueryparam cfsqltype="cf_sql_longvarchar" value="#trim(arguments.bean.getPricing())#" />,
			tagline = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.bean.getTagline())#" />,
			artist_id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.bean.getArtist_id())#" maxLength="3">
			
			WHERE catalog_number = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.bean.getCatalog_number())#">
		</cfquery>
   <cfreturn arguments.bean>
</cffunction>
</cfcomponent>