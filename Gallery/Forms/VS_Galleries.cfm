<cfparam name="url.d" default="0">
<cfparam name="url.door" default="1">
<cfparam name="url.gallery" default="1">
<!--- Check for Day/Night Variable --->
<cfif isdefined("url.d")>
	<cfset xDay=#url.d#>
<cfelse>
	<cfset xDay=0>
</cfif>

	<cfset xcolor="##333333">
	<cfset xNamecolor="Black">
	<cfset xtablebgcolor="Black">
	<cfset xReverseColor="##ffffcc">
	<cfset xName="Black">
	<cfset xBackground="##ffffcc">


<!--- Check for Page Variable --->
<cfif isdefined("url.page")>
	<cfset xPage=url.page>
<cfelse>
	<cfset xPage=0>
</cfif>


<cfif Isdefined("url.Gallery")>
	<cfset xGallery=#url.Gallery#>
<cfelse>
	<cfset xGallery=0>
</cfif>

<CFQUERY NAME="qGetVS_Setup"
         DATASOURCE="photoeyecom">
SELECT *
FROM VS_Setup
WHERE CUSTNUMBER = #URL.id# 
</CFQUERY> 


<!--- 
<CFQUERY NAME="qGetVS_Galleries"
         DATASOURCE="photoeyecom">
SELECT g.*, c.country AS CountryName
FROM ArtistGalleries g INNER JOIN Country C ON g.Country = c.CountryCode
WHERE g.CUSTNUMBER = #URL.id# and g.Agent_Type='G' 
		AND (company > '' OR lastname > '')
</CFQUERY>  --->


<CFQUERY NAME="qGetVS_Galleries"
         DATASOURCE="photoeyecom">
SELECT g.*, c.country AS CountryName
FROM VS_Galleries g INNER JOIN Country C ON g.Country = c.CountryCode
WHERE g.CUSTNUMBER = 52772 and g.Agent_Type='G' 
		AND (company > '' OR lastname > '')
</CFQUERY> 

<CFQUERY NAME="qGetVs_Agents"
         DATASOURCE="photoeyecom">
SELECT g.*, c.country AS CountryName
FROM VS_Galleries g INNER JOIN Country C ON g.Country = c.CountryCode
WHERE g.CUSTNUMBER = #URL.id# and (g.Agent_Type='S' or g.Agent_Type='A') 
		AND (company > '' OR lastname > '')
</CFQUERY> 


<cfoutput>
<cfset pagetitle = "PhotoBistro">
<cfset link="Menu">


<!--- <form action="../SearchArtistKeywords.cfm?Gallery=0&d=#xday#" method="post"> --->


<font face="verdana, arial, helvetica, sans-serif" size="4" color="#xcolor#"><b><BR>
<cfif qGetVS_Galleries.recordcount GT 0 AND qGetVs_Agents.recordcount is 0>
Galleries
<!--- G A L L E R I E S --->
<cfelseif qGetVS_Galleries.recordcount GT 0 AND qGetVs_Agents.recordcount GT 0>
Galleries/Agents
<!--- G A L L E R I E S / A G E N T S --->
<cfelseif qGetVs_Agents.recordcount GT 0>
Agents
<!--- A G E N T S --->
</cfif>

        <HR ALIGN="center" SIZE="1" WIDTH="200" COLOR="red">
</b></font><br>


<!--- Show Agents --->
<font face="verdana, arial, helvetica, sans-serif" size="1" color="#xcolor#">
<div align="center">
	<Cfif (qGetVS_Galleries.recordcount is 0 and qGetVs_Agents.recordcount is 0)>
	<b><FONT SIZE="2">Print inquiries:</FONT></b> <BR>Please use the "e-mail" link to contact the photographer.
	<CFELSE>
	<br>
	<cfif qGetVS_Galleries.recordcount is 1>
		To purchase a print, contact the gallery below:
	<cfelseif qGetVS_Galleries.recordcount gt 1>
		To purchase a print, contact any of the galleries below:
	<cfelseif qGetVS_Galleries.recordcount GT 0 AND qGetVs_Agents.recordcount GT 0>
		To purchase a print, contact any of the galleries or agents below:
	<cfelseif qGetVs_Agents.recordcount is 1>
		To purchase a print, contact the agent below:
	<cfelseif qGetVs_Agents.recordcount gt 1>
		To purchase a print, contact any of the agents below:
	</cfif>
	<br><br>
	<a href="javascript:history.back()">Back</a>
	</CFIF>
	</div>
		<BR>
	<Cfif qGetVs_Agents.recordcount gt 0>

	<table width="100%" align="center">
		<tr align="center">				
			<td  height="30" align="left" valign="bottom"><font face="verdana, arial, helvetica, sans-serif" size="2" color="#xcolor#">Agent<cfif qGetVs_Agents.recordcount gt 1>s</cfif><br>
	<cfloop query="qGetVs_Agents" startrow="1" endrow="#qGetVs_Agents.recordcount#">

<CFIF len(qGetVs_Agents.Company) gt 0>
<a href="index6.cfm?id=#url.id#&gallerydetails=1&id2=#qGetVs_Agents.autoid#"  target="_top">#qGetVs_Agents.Company#</a>, #qGetVs_Agents.FirstName# #qGetVs_Agents.LastName#
<CFELSE>
<a href="index6.cfm?id=#url.id#&gallerydetails=1&id2=#qGetVs_Agents.autoid#"  target="_top">#qGetVs_Agents.FirstName# #qGetVs_Agents.LastName#</A>
</CFIF>
<br>

	</cfloop>
	</font></td></tr></table>

	
	</cfif>



<!--- Show Galleries  --->

	<Cfif qGetVS_Galleries.recordcount gt 0>
	<cfif  qGetVs_Agents.recordcount gt 0>
		<br>
	</cfif>
	<table width="80%" align="center">
		<tr align="center">				
			<td  height="30" align="left" valign="bottom">
			<font face="verdana, arial, helvetica, sans-serif" size="2" color="#xcolor#"><cfif qGetVS_Galleries.recordcount gt 1 and qGetVs_Agents.recordcount gt 0>Galleries<cfelseif qGetVS_Galleries.recordcount is 1 and qGetVs_Agents.recordcount gt 0>Gallery</cfif><br>
	<cfloop query="qGetVS_Galleries" startrow="1" endrow="#qGetVS_Galleries.recordcount#">
<cfif len(trim(City)) GT 0><a href="index6.cfm?id=#url.id#&gallerydetails=1&id2=#qGetVS_Galleries.autoid#"  target="_top">#qGetVS_Galleries.Company#</a>,
#trim(qGetVS_Galleries.City)#, #trim(qGetVS_Galleries.State)#,  #qGetVS_Galleries.CountryName#<br><br></cfif>
	</cfloop>
	</font></td></tr></table>
	
	</cfif>
	
	
<!--- Show Artist  --->

	<Cfif qGetVS_Galleries.recordcount is 0 and qGetVs_Agents.recordcount is 0>

	<table width="100%" align="center">
		<tr align="center">				
			<td  height="30" align="left" valign="bottom">
			<font face="verdana, arial, helvetica, sans-serif" size="2" color="#xcolor#"> 
#qGetVS_Setup.FirstName# #qGetVS_Setup.LastName#<BR>
#qGetVS_Setup.City#, #qGetVS_Setup.State#<br>
#qGetVS_Setup.Country#<br>
<br>
<a href="contact.cfm?id=#url.id#">Contact by E-mail</a><br>
<br><br>
	</font></td></tr></table>
	
	</cfif>
  <br>


<!--- <cfinclude template="../Gallery/footer.cfm"> --->
</cfoutput>
