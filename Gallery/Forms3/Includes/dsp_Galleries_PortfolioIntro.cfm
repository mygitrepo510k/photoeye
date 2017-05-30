<cfparam name="url.id" default = "" type="Integer">
<cfparam name="url.portfolio" default = "" type="String">

<cfif url.id is "" or url.portfolio is "">
	Sorry, there is no id number or portfolio number for this photographer.
</cfif>

<CFQUERY NAME="qShowcaseArtist"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM GallerySetup where custnumber=<cfqueryparam value="#url.id#" cfsqltype="CF_SQL_INTEGER"> 
</CFQUERY>

<CFQUERY NAME="qShowcaseGalleryIndividualPhotos"  DATASOURCE="photoeyecom">
  	SELECT Distinct *
 	FROM GalleryIndividualPhotos where Custnumber=<cfqueryparam value="#url.id#" cfsqltype="CF_SQL_INTEGER"> and PortfolioName=<cfqueryparam value="#url.portfolio#" cfsqltype="CF_SQL_CHAR"> and NOT (notavailable=4 and imagenumber>0)
	order by imageposition;
</CFQUERY>	

<CFQUERY NAME="qShowcaseGalleryDefaultPhotos"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryDefaultPhotos where custnumber=<cfqueryparam value="#url.id#" cfsqltype="CF_SQL_INTEGER"> AND SUBDIRECTORY=<cfqueryparam value="#url.portfolio#" cfsqltype="CF_SQL_CHAR"> 
</CFQUERY>

 <CFQUERY NAME="qShowcasePortfolio"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM GalleryPortfolio where Custnumber=<cfqueryparam value="#url.id#" cfsqltype="CF_SQL_INTEGER">
 AND SUBDIRECTORY=<cfqueryparam value="#url.portfolio#" cfsqltype="CF_SQL_VARCHAR">
</CFQUERY> 

<cfif qShowcaseArtist.recordcount is 0 or qShowcaseGalleryIndividualPhotos.recordcount is 0 or qShowcasePortfolio.recordcount is 0>
	Sorry, there are no portfolios available for viewing.
</cfif>

<!---<!--- Space out the Portfolio and Portfolio Number if together --->
<cfif left(qShowcasePortfolio.Title,9) is "Portfolio">
	<cfset xPortfolioTitle="#left(qShowcasePortfolio.Title,9)#">
	<cfset xPortfolioTitle="#xPortfolioTitle# #mid(qShowcasePortfolio.Title,10,10)#">
<cfelse>
	<cfset xPortfolioTitle="#qShowcasePortfolio.Title#">
</cfif>--->

<!--- Portfolio Title --->
<cfif len(#qShowcaseGalleryDefaultPhotos.portfolioName#) is 0 and #qShowcasePortfolioQTY.recordcount# GT 1>
	 <cfset xPortfolioTitle="#left(qShowcasePortfolio.Subdirectory,9)# #mid(qShowcasePortfolio.Subdirectory,10,2)#">
<cfelse>
	<cfset xPortfolioTitle="#qShowcaseGalleryDefaultPhotos.portfolioName#">
</cfif>

<div align="center" style="line-spacing:34px; font-size:18px; color:#666666; margin-left:150px; margin-top:0px; margin-right: 150px;">
<cfoutput>#qShowcaseArtist.firstname# #qShowcaseArtist.Lastname#: 
#xPortfolioTitle#</cfoutput>
<br />Portfolio Introduction
</div>

<div align="left" style=" text-align:justify; font-size:13px; line-height:18px; color:#333333; margin-left:150px; margin-top:20px; margin-right: 150px; margin-bottom:50px">
<cfoutput>#qShowcasePortfolio.portfoliointro#</cfoutput>
</div>
<br>