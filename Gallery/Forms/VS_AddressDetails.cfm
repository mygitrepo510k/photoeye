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

<!--- <CFQUERY NAME="qGetVS_Galleries"
         DATASOURCE="photoeyecom">
SELECT *
FROM VS_Galleries
WHERE AutoID = #URL.id2# and CUSTNUMBER = 52772 
</CFQUERY>  --->

<!--- Custnumber=#URL.id# --->
<CFQUERY NAME="qGetVS_Galleries"
         DATASOURCE="photoeyecom">
SELECT g.*, c.country AS CountryName
FROM VS_Galleries g INNER JOIN Country C ON g.Country = c.CountryCode
WHERE AutoID = #URL.id2# and CUSTNUMBER = 52772 
</CFQUERY> 
<!--- Custnumber=#URL.id# --->
<br><br>

<cfset link="Menu">

<cfoutput>
<!--- <form action="../SearchArtistKeywords.cfm?Gallery=0&d=#xday#" method="post"> --->
<DIV ALIGN="CENTER">



<!--- Show Galleries  --->

<Cfif qGetVS_Galleries.recordcount gt 0>
	<table width="300" align="center">
		<tr align="center">				
			<td  height="30" align="left" valign="bottom">
			<font face="verdana, arial, helvetica, sans-serif" size="2" color="#xcolor#">
<CFIF len(qGetVS_Galleries.Company) gt 0><b>#qGetVS_Galleries.Company#<BR></b></CFIF>
#qGetVS_Galleries.FirstName# #qGetVS_Galleries.LastName#<BR>
<CFIF len(qGetVS_Galleries.Title) gt 0>#qGetVS_Galleries.Title#<BR></CFIF>
<BR>
#qGetVS_Galleries.Address1#<br>
<CFIF len(qGetVS_Galleries.Address2) gt 0>#qGetVS_Galleries.Address2#<br></CFIF>
#qGetVS_Galleries.City#, #qGetVS_Galleries.State# #qGetVS_Galleries.Zip#<br>
#qGetVS_Galleries.CountryName#<br>
<br>
Phone: #qGetVS_Galleries.Phone# <cfif len(trim(qGetVS_Galleries.Extension)) GT 0>Ext: #qGetVS_Galleries.Extension#</cfif> 
<BR><BR>
<a href="index6.cfm?id=#url.id#&Contact=1"  target="_self">Contact by E-mail</a><br>
<br><br>

	</font></td></tr></table>
</CFIF>
	
	
<!--- Show Artist  --->

	<Cfif qGetVS_Galleries.recordcount is 0>

	<table width="300" align="center">
		<tr align="center">				
			<td  height="30" align="left" valign="bottom">
			<font face="verdana, arial, helvetica, sans-serif" size="2" color="#xcolor#"> 
#qGetVS_Setup.FirstName# #qGetVS_Setup.LastName#<BR>
#qGetVS_Setup.Address1#<br>
#qGetVS_Setup.Address2#<br>
#qGetVS_Setup.City#, #qGetVS_Setup.State#<br>
#qGetVS_Setup.Country#<br>
<br>
<a href="index6.cfm?id=#url.id#&Contact=1"  target="_self">E-mail</a><br>
#qGetVS_Setup.Phone# <cfif len(trim(qGetVS_Setup.Extension)) GT 0>Ext: #qGetVS_Setup.Extension#</cfif><br><br>
	</font></td></tr></table>
	
	</cfif>
<!---   <form action="Javascript:window.close();">
 	 <input type="Button" name="Close" value="Back" STYLE="font-size:10px;" onclick="javascript:history.back()"> <input type="submit" name="Close" value="Close Window" STYLE="font-size:10px;">
  </form> --->
</div></form>

<A href="javascript:history.back();"><font face="Verdana, Arial, Helvetica, Sans-Serif" size="1"><b>Back</b></FONT></A>

</cfoutput>
