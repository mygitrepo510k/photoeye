<cfif NOT thisTag.HasEndTag>
    <!--- Abort the tag--->
    <cfabort showError="cache:fragment block missing end tag.">
</cfif>
<cfswitch expression=#thisTag.ExecutionMode#>
	<!--- Fires on Opening Tag --->
    <cfcase value= 'start'>
        <cfset caller._ABORT_FRAGMENT_WRITE = false />

    	<!--- Abort if no name passed --->
        <cfif NOT StructKeyExists(attributes,'name')>
		    <cfabort showError="cache:fragment block missing name." />
        </cfif>
        <!--- Initialize the defaults --->
    	<cfif NOT StructKeyExists(request,'_cacheConfig')>
    		<cfmodule template="config.cfm">
    	</cfif>
    	<!--- Merge any passed in attributes with the defaults --->
        <cfloop list="#StructKeyList(request._cacheConfig)#" index="k">
        	<cfparam name="attributes.#k#" default="#request._cacheConfig[k]#" />
        </cfloop>

        <!--- state is returned to caller[attributes.result] --->
		<cfset state = StructNew() />
		<cfset state.nofile  = false />
		<cfset state.expired = false />
		<cfset state.served  = false />
	  	<cfset caller[attributes.result] = state />

		<!--- prefix, but the prefix is not already part of the name --->
		<cfif len(attributes.region) and findNoCase(attributes.region, attributes.name) neq 1>
			<cfset attributes.name = attributes.region & attributes.name>
		</cfif>

		<!--- setup file ID and path --->
		<cfset hashID = Hash(attributes.hashKey,'SHA') />
		<cfset filename = '#attributes.directory#\frg_#attributes.name#_#hashID#.html' />

		<!--- load the cached file --->
		<cfset cacheFile = CreateObject("java", "java.io.File") />
		<cfset cacheFile.init(filename) />

		<cfif request.debug><cfoutput>
			<!-- cache file: #filename# -->
		</cfoutput></cfif>

		<!--- already exists, isn't being refreshed now and is not being forced --->
		<cfif cacheFile.exists()
		  AND NOT StructKeyExists(FORM,'rebuildCache')
		  AND NOT attributes.force>
			<cffile action="read" file="#filename#" variable="cachedContent" charset="utf-16" />
			<!--- get the last modified information as a Date --->
			<cfset last_modified = createObject("java","java.util.Date").init(cacheFile.lastModified()) />

			<!--- a "modified" attribute will ensure that content is newer than given value --->
			<cfif StructKeyExists(attributes, 'modified')>
				<cfset state.expired = DateCompare(last_modified, attributes.modified, 's') LTE 0 />
			</cfif>
			<cfif NOT state.expired>
				<!--- expired? --->
				<cfset state.expired = DateDiff('n', last_modified, Now()) GT attributes.duration-1 />
			</cfif>

			<cfif request.debug><cfoutput>
				<!-- cache last_modified: #dateformat(last_modified, 'mm/dd/yyyy')# #timeformat(last_modified, 'HH:MM:ss')# -->
				<!-- cache expired: #state.expired# -->
			</cfoutput></cfif>

			<cfoutput>
				<cfif NOT state.expired>
					<!--- no: add the normal comment --->
					<!-- frg_#attributes.name#_#hashID# #DateFormat(last_modified,'dd.mm')#:#TimeFormat(last_modified,'HH.mm.ss.l')# #DateDiff('s', last_modified, Now())# -->
				<cfelseif NOT attributes.lazy>
					<!-- >>> frg_#attributes.name#_#hashID# #DateFormat(last_modified,'dd.mm')#:#TimeFormat(last_modified,'HH.mm.ss.l')# -->
				<cfelse>
					<!-- !!! frg_#attributes.name#_#hashID# #DateFormat(last_modified,'dd.mm')#:#TimeFormat(last_modified,'HH.mm.ss.l')# -->
				</cfif>
				<cfif state.expired AND NOT attributes.lazy>
					<!--- recache immediately and show this user new content --->
					<!-- expired content|refreshing -->
					<cfexit method="exitTemplate" />
				</cfif>
				<!--- Send cached data to client --->
				<!-- cached content -->
				#cachedContent#
			</cfoutput>

			<cfif state.expired>
				<!--- Inject script tag to trigger recaching --->
				<script type="text/javascript">
					!function(){
						var r = new XMLHttpRequest();
						var params = "rebuildCache=true";
						r.open("POST", '<cfoutput>#CGI.SCRIPT_NAME#<cfif len(CGI.QUERY_STRING)>?#CGI.QUERY_STRING#</cfif></cfoutput>', true);
						r.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
						r.send(params);
					}();
				</script>
			</cfif>
			<!--- Success. Abort execution of tag body & end code --->
			<cfset state.served = true />
			<cfexit />
		<cfelse>
			<cfset state.nofile = true />
		</cfif>
    </cfcase>
	<!--- Fires on Closing Tag --->
    <cfcase value='end'>
    	<cfif NOT caller._ABORT_FRAGMENT_WRITE>
			<!--- write the cached version --->
			<cfoutput>
			<!-- write to cache #filename# -->
			</cfoutput>
			<cffile action="write"
					file="#filename#"
					output="#thisTag.GeneratedContent#"
					addNewLine="no"
					charset="utf-16" />
    	</cfif>
    </cfcase>
</cfswitch>