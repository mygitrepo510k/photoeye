<!--- BLM 06.11.2014, test page for winidows task to restart Efflare service if it's not wokring.
cfx_image_restart.vbs calls this file to see if it need to kill the service and restart, IE on caught error --->
<cftry>

	<!--- do a simple cfx_imagecr thing to see if it's working --->
	<cfset path = expandPath('photoeye_logo.png')>
	<cfx_imagecr3_3 load="#path#" flip="1" save="#path#">
	<cfoutput>success</cfoutput>

	<cfcatch>
		<cfoutput>error</cfoutput>
	</cfcatch>
</cftry>