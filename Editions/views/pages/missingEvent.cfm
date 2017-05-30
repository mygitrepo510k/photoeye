<!--- !total monkey-patch --->
<cfif event.getValue("missingEvent") EQ "photoeye_editions">
	<cfset event.forward('page.index') />
</cfif>
<!--- end monkey-patch --->

<cfoutput>
page called "#event.getValue("missingEvent")#" does not exist.
</cfoutput>