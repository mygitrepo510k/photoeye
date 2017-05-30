<!--- Include Checkbox Default --->
<CFPARAM NAME="Unmatted" Default="0">


<!--- Now Check for Quotes in the other text boxes --->

<cfset Quote=Chr(34)>

<cfset Titlex = "#form.Title#">
<cfset #Title#=Replace(Titlex,Quote,"&quot;","ALL")> 

<cfset PortfolioNamex = "#form.PortfolioName#">
<cfset #PortfolioName#=Replace(PortfolioNamex,Quote,"&quot;","ALL")>

<cfset PortfolioIntrox = "#form.PortfolioIntro#">
<cfset #PortfolioIntro#=Replace(PortfolioIntrox,Quote,"&quot;","ALL")>

<cfset Othermedx = "#form.Othermed#">
<cfset #Othermed#=Replace(Othermedx,Quote,"&quot;","ALL")>

<cfset AddInfo1x = "#form.AddInfo1#">
<cfset #AddInfo1#=Replace(AddInfo1x,Quote,"&quot;","ALL")>

<cfset Genre2x = "#form.Genre2#">
<cfset Genre2x = Replace(Genre2x,Quote,"&quot;","ALL")>

<cfset Format2x = "#form.Format2#">
<cfset Format2x = Replace(Format2x,Quote,"&quot;","ALL")>

<cfset LocRegionx = "#form.LocRegion#">
<cfset LocRegionx = Replace(LocRegionx,Quote,"&quot;","ALL")>

<cfset LocStatex = "#form.LocState#">
<cfset LocStatex = Replace(LocStatex,Quote,"&quot;","ALL")>

<cfset LocCityx = "#form.LocCity#">
<cfset LocCityx = Replace(LocCityx,Quote,"&quot;","ALL")>

<cfset LocCountryx = "#form.LocCountry#">
<cfset LocCountryx = Replace(LocCountryx,Quote,"&quot;","ALL")>

  <CFQUERY DATASOURCE="photoeyecom" dbtype="ODBC">
   UPDATE GalleryPortfolio
   SET PortfolioIntro = '#PortfolioIntrox#'
   WHERE Custnumber = '#Form.Custnumber#' and SubDirectory='#URL.Portfolio#'
   </cfquery>
<!---    
   Title='#PortfolioNamex#', --->

  <CFQUERY DATASOURCE="photoeyecom" dbtype="ODBC">
   UPDATE GalleryDefaultPhotos
   SET Title = '#Titlex#',
   PortfolioName= '#PortfolioNamex#',
   NotAvailable='#Form.NotAvailable#',
   Copyright='#Form.Copyright#',
   SubDirectory= '#url.Portfolio#',
   Medium = '#Form.Medium#',   
   OtherMed = '#OtherMedx#',
   YearProd= '#Form.YearProd#',
   Height1= '#Form.Height1#',
   Width1 = '#Form.Width1#', 
   Price1 = '#Form.Price1#',
   Unmatted= '#Unmatted#',
   MatHeight1 = '#Form.MatHeight1#',
   MatWidth1 = '#Form.MatWidth1#',
   Editioned1 = '#Form.Editioned1#',
   EditionSz1 = '#Form.EditionSz1#',
   EditionNo1 = '#Form.EditionNo1#',
   AddInfo1 = '#AddInfo1x#',
   Genre1 = '#Form.Genre1#',
   Genre2 = '#Genre2x#',
   Format1 = '#Form.Format1#',
   Format2 = '#Format2x#',  
   LocContin = '#Form.LocContin#',
   LocCountry = '#LocCountryx#',
   LocRegion = '#LocRegionx#',
   LocState = '#LocStatex#',
   LocCity = '#LocCityx#'
   WHERE Custnumber = '#Form.Custnumber#' and SubDirectory='#URL.Portfolio#'
</CFQUERY>


<!--- Update the Inventory for any Default Price Changes --->

  <CFQUERY Name='qGetIndividualPhotoswithDefaultPrice' DATASOURCE="photoeyecom" dbtype="ODBC">
   SELECT CATALOG, CUSTNUMBER, PORTFOLIONAME, PRICE1, TITLE FROM  GalleryIndividualPhotos
     WHERE Custnumber = '#Form.Custnumber#' and PortfolioName='#URL.Portfolio#' and default7=1
  </CFQUERY>
  
  <CFQUERY Name='qGetDefaultPrice' DATASOURCE="photoeyecom" dbtype="ODBC">
   SELECT PRICE1, Subdirectory, custnumber FROM  GalleryDefaultPhotos
     WHERE Custnumber = '#Form.Custnumber#' and Subdirectory='#URL.Portfolio#' 
  </CFQUERY>
  
    <CFQUERY Name='qGetGallerySetup' DATASOURCE="photoeyecom" dbtype="ODBC">
   SELECT firstname, lastname FROM Gallerysetup
     WHERE Custnumber = '#Form.Custnumber#'
  </CFQUERY>
  
  
   <CFOUTPUT query="qGetIndividualPhotoswithDefaultPrice">
   
   	<CFQUERY datasource="photoeyecom" dbtype="ODBC">
		Update Inventory set 
		SOFT_PRICE=#qGetDefaultPrice.price1#, 
		TITLE2X='#Title#', 
		AUTHORSX='Photograph by #qGetGallerySetup.firstname# #qGetGallerySetup.lastname#', 
		SUBJECTX='#qGetGallerySetup.lastname#,#qGetGallerySetup.firstname#'
		where catalog='#catalog#'
	</CFQUERY>
   
   </CFOUTPUT>

  

<!---    Keywords = '#Form.Keywords#' --->

<!---Query to see if the keyword exists --->
<CFQUERY NAME="qGetShowcaseKeywords"
        DATASOURCE="photoeyecom">

SELECT *
FROM GalleryKeywords
WHERE Custnumber = #form.Custnumber#  and Portfolio='#URL.Portfolio#' and catalog=0

</CFQUERY>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase</title>
</head>

<body>
<!--- Image Update Successful! ---><br><br></center>

<!---Add Keywords--->

<CFLOOP INDEX="KeywordinLoop"
    LIST="#form.keywords#"
    DELIMITERS=",">
	
	<cfif #qGetShowcaseKeywords.Keywords# GT 0>
	
		<cfloop query="qGetShowcaseKeywords">
		
			<cfset matchedkeyword=0>
			<cfif  #Ucase(TRIM(Keywords))# is #Ucase(TRIM(KeywordinLoop))#>
				<cfset matchedkeyword=1>
				<cfbreak>
			</cfif>	
		</cfloop>
					
		<cfif matchedkeyword is 0>
				
				<CFQUERY NAME="qInsert"
        		 DATASOURCE="photoeyecom">
				INSERT INTO
				GalleryKeywords (Custnumber, Catalog, DefaultKW, Keywords, Portfolio)
				VALUES (#form.Custnumber#, 0, 1, '#TRIM(KeywordinLoop)#', '#url.Portfolio#')
				</CFQUERY>
		</cfif>
	<cfelse>
		<CFQUERY NAME="qInsert"
        		 DATASOURCE="photoeyecom">
				INSERT INTO
				GalleryKeywords (Custnumber, Catalog, DefaultKW, Keywords, Portfolio)
				VALUES (#form.Custnumber#, 0, 1, '#TRIM(KeywordinLoop)#', '#url.Portfolio#')
			</CFQUERY>

	</cfif>

	
</CFLOOP>

<!---Delete Keywords--->

<cfloop query="qGetShowcaseKeywords">
	<cfset matchedkeyword=0>	
	<CFLOOP INDEX="KeywordinLoop"
    LIST="#form.Keywords#"
    DELIMITERS=",">
		
			<cfset matchedkeyword=0>	
			<cfif  #Ucase(TRIM(Keywords))# is #Ucase(TRIM(KeywordinLoop))#>
				<cfset matchedkeyword=1>
				<cfbreak>
			</cfif>	
	</cfloop>
					
		<cfif matchedkeyword is 0>
				
				<CFQUERY NAME="qDelete"
        		 DATASOURCE="photoeyecom">
				DELETE
				GalleryKeywords WHERE KEYWORDS='#KEYWORDS#' AND DEFAULTKW=1
				</CFQUERY>
		</cfif>

</CFLOOP>




<!--- #Form.Custnumber# --->
<!--- <cfinsert DATASOURCE="photoeyecom" tablename="IndependentsDefaultPhotos" dbtype="ODBC"> ---> 




<CFQUERY NAME="qUpdatePhotographersSetupInfo"  DATASOURCE="photoeyecom">
  UPDATE GalleryPortfolio
   SET Step11='1'
  WHERE CustNumber = '#Form.CustNumber#' and SubDirectory='#URL.Portfolio#'
</CFQUERY>


<center><p align="center">

<br>
<br>
<br>
<font face="verdana, helvetica, arial, sans-serif" size="2" color="Black"><b>
Update Successful!</b>
<cfoutput>
<form method="post" action="Step10ChangeImageOrderURL.cfm?custnumber=#form.custnumber#&portfolio=#url.portfolio#">

</cfoutput>

<input type="SUBMIT" value="Edit/Sequence Individual Images" name="SUBMIT"></center>
</p>
</font>
</center>

</form> 
</body>
</html>