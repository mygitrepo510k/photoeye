<cfif thisTag.ExecutionMode EQ "end">
	<!--- Only ever fire once, ignore closing tags --->
	<cfexit />
</cfif>

<!--- Setup the defaults if not already provided --->
<cfif NOT StructKeyExists(request,'cache')>
	<cfset request._cacheConfig = StructNew() />
	<cfset request._cacheConfig.duration = 10 />
	<!--- Default hashKey is a cleaned up QUERY_STRING --->
	<cfset request._cacheConfig.hashKey  = ReReplaceNoCase(CGI.QUERY_STRING,'(\?|&)(CFID|CFTOKEN|cacheKiller|recachingDirective|refresh)=[a-zA-Z0-9]*','','all').toLowerCase() />
	<cfif request.debug><cfoutput><!-- cacheConfig.hashKey: #request._cacheConfig.hashKey# --></cfoutput></cfif>
	<!--- Default hashKey is a cleaned up QUERY_STRING + protocol --->
	<cfif StructKeyExists(CGI,'HTTPS') AND NOT StructKeyExists(CGI,'HTTP_BIGIPSSL') AND CGI.HTTPS NEQ "off">
		<cfset request._cacheConfig.hashKey = 'https'&request._cacheConfig.hashKey />
	<cfelse>
		<cfset request._cacheConfig.hashKey = 'http' &request._cacheConfig.hashKey />
	</cfif>
	<cfif request.debug><cfoutput><!-- cacheConfig.hashKey: #request._cacheConfig.hashKey# --></cfoutput></cfif>
	<cfset request._cacheConfig.result     = 'cacheState' />
	<cfset request._cacheConfig.directory  = ExpandPath('/_cached_pages') />
	<cfset request._cacheConfig.lazy	   = true />
	<cfset request._cacheConfig.force	   = false />
	<cfset request._cacheConfig.region	   = '' /><!--- Grouping for the cache to do things like clean only certain files --->
</cfif>

<!--- Add any provided attributes to our defaults --->
<cfloop list="#StructKeyList(attributes)#" index="k">
	<cfset request._cacheConfig[k] = attributes[k] />
</cfloop>