<cfparam name="url.id" default = "0" type="Integer">
<cfparam name="url.portfolio" default = "Portfolio1" type="String">
<cfparam name="URL.Page" default="" type="String">


<cfif url.id is "">
	<div align="center">Sorry, there is no id number number for this photographer.</div>
</cfif>


<CFQUERY NAME="qShowcaseArtist"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM GallerySetup where custnumber=<cfqueryparam value="#url.id#" cfsqltype="CF_SQL_INTEGER"> 
</CFQUERY>

<cfset ArtistF =  #Replace(qShowcaseArtist.FirstName," ","","All")#>
<cfset ArtistL =  #Replace(qShowcaseArtist.LastName," ","","All")#>

<!--- RR 05/21/2012 added and showcaseok=1 --->
<CFQUERY NAME="qShowcaseGalleryIndividualPhotos"  DATASOURCE="photoeyecom">
  	SELECT Distinct *
 	FROM GalleryIndividualPhotos where Custnumber=<cfqueryparam value="#url.id#" cfsqltype="CF_SQL_INTEGER"> and PortfolioName=<cfqueryparam value="#url.portfolio#" cfsqltype="CF_SQL_CHAR"> and NOT (notavailable=4 and imagenumber>0) and showcaseok=1
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

<!--- Get all Portfolios regardless of whether or not the showcase ok=1 --->
<CFQUERY NAME="qGetPortfolios"
         DATASOURCE="photoeyecom">
SELECT *
FROM GALLERYPORTFOLIO
WHERE Custnumber=<cfqueryparam value="#url.id#" cfsqltype="CF_SQL_INTEGER">  and ShowcaseOK=1 Order by DateTime DESC
</CFQUERY>

<!--- Count the number of portfolios. If GT 1 and there is not portfolio title
Show default Portfolio 1, Portfolio 2, etc as the portfolio title--->
<CFQUERY NAME="qShowcasePortfolioQTY"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryPortfolio where Custnumber=<cfqueryparam value="#url.id#" cfsqltype="CF_SQL_INTEGER">
</CFQUERY>



  <!--- Panorama? --->
<CFIF qShowcasePortfolio.Panorama is 1>
 <CFSET xPan = 1>
<CFELSE>
 <CFSET xPan = 0>
</CFIF>


<CFQUERY NAME="qGalleryStatements"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryArtistStatements where Custnumber=<cfqueryparam value="#url.id#" cfsqltype="CF_SQL_INTEGER">
</CFQUERY>

<CFQUERY NAME="qGalleryBibliography"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryBibliography where Custnumber=<cfqueryparam value="#url.id#" cfsqltype="CF_SQL_INTEGER"> and LEN(Catalog)>0 
  ORDER BY YEAR DESC
</CFQUERY>

<CFQUERY NAME="qGetDetails"
         DATASOURCE="photoeyecom">
SELECT *
FROM Inventory
WHERE CATALOG = <cfqueryparam value="#qShowcaseGalleryIndividualPhotos.catalog#" cfsqltype="CF_SQL_CHAR">
</CFQUERY>

<!---<cfif qShowcaseArtist.recordcount is 0 or qShowcaseGalleryIndividualPhotos.recordcount is 0 or qShowcasePortfolio.recordcount is 0>
	Sorry, there are no portfolios available for viewing.
</cfif>
--->
<!--- Portfolio Title --->
<cfif len(#qShowcaseGalleryDefaultPhotos.portfolioName#) is 0 and #qShowcasePortfolioQTY.recordcount# GT 1>
	 <cfset xPortfolioTitle="#left(qShowcasePortfolio.Subdirectory,9)# #mid(qShowcasePortfolio.Subdirectory,10,2)#">
<cfelse>
	<cfset xPortfolioTitle="#qShowcaseGalleryDefaultPhotos.portfolioName#">
</cfif>


<!--- Get the Setup Information --->
<CFQUERY NAME="qGetSetup"
         DATASOURCE="photoeyecom">
SELECT *
FROM GALLERYSETUP
WHERE Custnumber=<cfqueryparam value="#url.id#" cfsqltype="CF_SQL_INTEGER">
</CFQUERY> 



