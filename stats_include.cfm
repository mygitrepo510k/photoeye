<!--- Disable these stats 7.22.2013 --->
<!---
<cfsilent>
<CFPARAM NAME="url.portfolio" DEFAULT="Portfolio1">

<cfthread action="run" priority="low" name="#cgi.path_info#.#cgi.remote_addr#.#cgi.x_forwarded_for#" cgi="#cgi#" url="#url#">

		<!--- If this is the Gallery, just keep the useful bits of the query string --->
		<CFIF cgi.path_info eq "/gallery/forms/index.cfm">
			<CFQUERY NAME="qGetArtist" DATASOURCE="photoeyecom">
			SELECT subdirectory FROM GallerySetup WHERE custnumber= <cfqueryparam value="#url.id#">
			</CFQUERY>
			<CFSET PageName = "#qGetArtist.subdirectory# - #url.portfolio#">
		<CFELSE>
			<CFSET PageName = "#cgi.path_info#">
		</CFIF>
		<!--- END: Gallery check --->

		<CFQUERY NAME="qGetStats" DATASOURCE="photoeyecom">
		SELECT autoid, pageViews FROM Stats WHERE page = <cfqueryparam cfsqltype="cf_sql_varchar" value="#pageName#">
		</CFQUERY>

		<CFIF qGetStats.RecordCount gt 0>
			<CFQUERY NAME="qUpdateStats" DATASOURCE="photoeyecom">
			UPDATE Stats SET PageViews = PageViews + 1 WHERE autoid = <cfqueryparam cfsqltype="cf_sql_integer" value="#qGetStats.autoId#">
			</CFQUERY>
		<CFELSE>
			<CFQUERY NAME="qInsertStats" DATASOURCE="photoeyecom">
			INSERT INTO Stats (page, pageviews) VALUES (<cfqueryparam cfsqltype="cf_sql_varchar" value="#pageName#"> ,1)
			</CFQUERY>
		</CFIF>

</cfthread>
</cfsilent>

--->