<!---  <cfcontent type="image/jpeg" file="c:\inetpub\wwwroot\clients\photoeyecom\html\magazine\ads\2009_05_Workshops.jpg">  --->
  
  <!--- Pull the ad to show --->
<cfparam name="caller.blog" default="1">
	<cfif StructKeyExists(URL,'showad')>
		<cfquery name="qGetAd" datasource="photoeyecom">
			Select * from Ad_description where ad_id=#url.showad#
		</cfquery>
	<cfelse>
		<CFINCLUDE template="/magazine/includes/act_Magazine_Ad_Puller.cfm">
	</cfif>


<cfcontent type="image/jpeg" file="c:\inetpub\wwwroot\clients\photoeyecom\html\magazine\ads\#qGetAd.image_filename#">
