<CFContent Type = "application/javascript"   reset="yes"> 
<cfsetting showDebugOutput="no">	

<cfquery name="qAllLiveAds" dataSource="photoeyecom">
	Select * from Ad_spot where expired is null order by last_viewed asc
</cfquery>

<cfset totalToShow = 1 />

<cfif qAllLiveAds.recordcount GT 4>
	<cfset totalToShow += Ceiling((qAllLiveAds.recordcount-5)/3) />
</cfif>

<cfquery name="qGetCurrentAdLink" datasource="photoeyecom">
	Select top 1 link_url from ad_description order by last_viewed desc
</cfquery>

<cfoutput>
	<cfset renderedAds = ArrayNew(1) />
	<cfloop from="1" to="#totalToShow#" index="i">
		<CFINCLUDE template="/magazine/includes/act_Magazine_Ad_Puller.cfm">
		<cfsavecontent variable="adJS">
			document.write('<a href="http://www.photoeye.com/magazine/ads/clickthrough.cfm?PEurl=#qGetAd.link_url#&PEid=#qGetAd.ad_id#" target="_blank"><img src="http://www.photoeye.com/magazine/ads/#qGetAd.image_filename#" id="Advert99" /></a><div style="margin:10px auto;width:298px;">&nbsp;</div>');
		</cfsavecontent>
		<cfset ArrayAppend(renderedAds, adJS) />
	</cfloop>
	<cfset CreateObject("java","java.util.Collections").Shuffle(renderedAds) />
	<cfloop from="1" to="#totalToShow#" index="i">
		#renderedAds[i]#
	</cfloop>
</cfoutput>
