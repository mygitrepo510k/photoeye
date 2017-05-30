<CFContent Type = "application/javascript" reset="yes">
<cfheader name="Cache-Control" value="max-age=1, no-cache, no-store, must-revalidate" />
<cfset xTreePath = "http://www.photoeye.com/magazine/" /> 
<cfinclude template="/magazine/includes/act_Magazine_Ad_Puller.cfm">

<cfoutput>
	<cfloop from="1" to="#totalToShow#" index="i">
		document.write('#ReReplaceNoCase(renderedAds[i],'\n','','ALL')#');
	</cfloop>
</cfoutput>