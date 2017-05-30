<cfparam name="url.id" default = "0" type="Integer">
<cfparam name="url.portfolio" default = "" type="String">
<cfparam name="URL.Page" default="" type="String">

<!--- CLEAR THE PRICE VARIABLE, OTHERWISE IT MAJORLY F*CKS UP THE SEARCH DE 6/18/09 --->
<cfset xPrice = "" />

<cfset url.id="#qGetResults.custnumber#">
<cfset url.portfolio="#qGetResults.PortfolioName#">


<!---<cfif url.id is "" or url.portfolio is "">
	Sorry, there is no id number or portfolio number for this photographer.
</cfif>--->

<CFQUERY NAME="qShowcaseArtist"  DATASOURCE="photoeyecom">
  SELECT Distinct Subdirectory, FirstName, LastName, Gallery
  FROM GallerySetup where custnumber=<cfqueryparam value="#url.id#" cfsqltype="CF_SQL_INTEGER"> 
</CFQUERY>

<cfset ArtistF =  #Replace(qShowcaseArtist.FirstName," ","","All")#>
<cfset ArtistL =  #Replace(qShowcaseArtist.LastName," ","","All")#>

<!---<CFQUERY NAME="qShowcaseGalleryIndividualPhotos"  DATASOURCE="photoeyecom">
  	SELECT Distinct caption1, title, addinfo1, catalog, ImagePosition, ImageNumber, NotAvailable
 	FROM GalleryIndividualPhotos where Custnumber=<cfqueryparam value="#url.id#" cfsqltype="CF_SQL_INTEGER"> and PortfolioName=<cfqueryparam value="#url.portfolio#" cfsqltype="CF_SQL_CHAR"> and NOT (notavailable=4 and imagenumber>0)
	order by imageposition;
</CFQUERY>--->

<CFQUERY NAME="qShowcaseGalleryDefaultPhotos"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryDefaultPhotos where custnumber=<cfqueryparam value="#url.id#" cfsqltype="CF_SQL_INTEGER"> AND SUBDIRECTORY=<cfqueryparam value="#url.portfolio#" cfsqltype="CF_SQL_CHAR"> 
</CFQUERY>

 <CFQUERY NAME="qShowcasePortfolio"  DATASOURCE="photoeyecom">
  SELECT Distinct panorama, subdirectory
  FROM GalleryPortfolio where Custnumber=<cfqueryparam value="#url.id#" cfsqltype="CF_SQL_INTEGER">
 AND SUBDIRECTORY=<cfqueryparam value="#url.portfolio#" cfsqltype="CF_SQL_VARCHAR">
</CFQUERY> 


  <!--- Panorama? --->
<CFIF qShowcasePortfolio.Panorama is 1>
 <CFSET xPan = 1>
<CFELSE>
 <CFSET xPan = 0>
</CFIF>


<!---
<!--- Get all Portfolios regardless of whether or not the showcase ok=1 --->
<CFQUERY NAME="qGetPortfolios"
         DATASOURCE="photoeyecom">
SELECT *
FROM GALLERYPORTFOLIO
WHERE Custnumber=<cfqueryparam value="#url.id#" cfsqltype="CF_SQL_INTEGER">  and ShowcaseOK=1 Order by DateTime DESC
</CFQUERY> --->

<!--- Count the number of portfolios. If GT 1 and there is not portfolio title
Show default Portfolio 1, Portfolio 2, etc as the portfolio title--->
<CFQUERY NAME="qShowcasePortfolioQTY"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryPortfolio where Custnumber=<cfqueryparam value="#url.id#" cfsqltype="CF_SQL_INTEGER">
</CFQUERY>




<!---<CFQUERY NAME="qGalleryStatements"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryArtistStatements where Custnumber=<cfqueryparam value="#url.id#" cfsqltype="CF_SQL_INTEGER">
</CFQUERY>

<CFQUERY NAME="qGalleryBibliography"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryBibliography where Custnumber=<cfqueryparam value="#url.id#" cfsqltype="CF_SQL_INTEGER"> and LEN(Catalog)>0 
  ORDER BY YEAR DESC
</CFQUERY>--->

<CFQUERY NAME="qGetDetails"
         DATASOURCE="photoeyecom">
SELECT *
FROM Inventory
WHERE CATALOG = <cfqueryparam value="#qGetResults.catalog#" cfsqltype="CF_SQL_CHAR">
</CFQUERY>

<cfif qShowcaseArtist.recordcount is 0 or qGetResults.recordcount is 0 or qShowcasePortfolio.recordcount is 0>
	Sorry, there are no portfolios available for viewing.
</cfif>

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

	<cfparam name="xPrice" default="Price upon request">
	<!--- Image Title --->
	<cfif len(#qGetResults.title#) GT 0>
		 <cfif len(trim(#qGetResults.yearprod#)) GT 0  and FIND(#qGetResults.yearprod#,#qGetResults.title#) is 0>
			<cfset xTitle ="#qGetResults.title#,">
		 <cfelse>
			<cfset xTitle ="#qGetResults.title#">
		 </cfif>
	<cfelse>
		 <cfif len(trim(#qGetResults.yearprod#)) GT 0  and FIND(#qGetResults.yearprod#,#qGetResults.title#) is 0>
			<cfset xTitle ="#qShowcaseGalleryDefaultPhotos.title#,">
		 <cfelse>
			<cfset xTitle ="#qShowcaseGalleryDefaultPhotos.title#">
		 </cfif>
	</cfif>
	
	<cfif len(trim(#qGetResults.yearprod#)) GT 0 and FIND(#qGetResults.yearprod#,#qGetResults.title#) is 0>
		 <cfset xTitle="#xTitle# #qGetResults.yearprod#">
	<cfelseif len(trim(#qShowcaseGalleryDefaultPhotos.yearprod#)) GT 0 and #qGetResults.default3# is 1 and FIND(#qGetResults.yearprod#,#qGetResults.title#) is 0>
		  <cfset xTitle="#xTitle# #qShowcaseGalleryDefaultPhotos.yearprod#">
	</cfif>	
	
	
	<!--- Medium --->
	<cfif len(#qGetResults.medium#) GT 0 and #qGetResults.medium# is NOT 'Other Medium'>
		<cfset xMedium="#qGetResults.medium#"> 
	<cfelseif len(#qGetResults.othermed#) GT 0> 			
		<cfset xMedium="#qGetResults.othermed#">
	<cfelseif len(#qShowcaseGalleryDefaultPhotos.othermed#) GT 0> 				
		<cfset xMedium="#qShowcaseGalleryDefaultPhotos.othermed#">
	<cfelseif len(#qShowcaseGalleryDefaultPhotos.medium#) GT 0> 										 
		<cfset xMedium="#qShowcaseGalleryDefaultPhotos.medium#">
	</cfif>
	 
	<!--- Image Size --->
	<cfif val(#qGetResults.width1#) GT 1>
		<cfset xSize="#qGetResults.height1#x#qGetResults.width1#&quot; Image">
		<!--- Make sure that there is a width size that exists --->
	<cfelseif val(#qShowcaseGalleryDefaultPhotos.width1#) is 1 and val(#qShowcaseGalleryDefaultPhotos.height1#) is 1>
		<cfset xSize="Image Size Varies">
	<cfelseif val(#qShowcaseGalleryDefaultPhotos.width1#) GT 0>
		<cfset xSize="#qShowcaseGalleryDefaultPhotos.height1#x#qShowcaseGalleryDefaultPhotos.width1#&quot; Image">
	<cfelse>
		<cfset xSize="">
	</cfif> 
	
	<!--- AddInfo --->
	<cfif len(trim(qGetResults.addinfo1)) gt 0>
		 <!--- <cfset qGetResults.addinfo1 = "#qGetResults.addinfo1#"> --->
	<cfelse>
		<cfset  qGetResults.addinfo1  = "#qShowcaseGalleryDefaultPhotos.addinfo1#"> 
	</cfif> 
	
	<!--- CaptionInfo --->
	<cfif len(trim(qGetResults.caption1)) gt 0>
		 <!--- <cfset qGetResults.addinfo1 = "#qGetResults.addinfo1#"> --->
	<cfelse>
		<cfset  qGetResults.caption1  = "#qShowcaseGalleryDefaultPhotos.caption1#"> 
	</cfif>
	
	<!--- Mat Size --->
	<!--- Mat --->
	<!--- Individual Photos --->
	<cfif (val(#qGetResults.Matwidth1#) GT 0) or (VAL(#qGetResults.default4#) is 0)>
		<cfif #qGetResults.unmatted# is 1>
			<cfset xMat="Unmatted">
		<!--- Make sure that there is a mat size that exists --->
		<cfelseif val(#qGetResults.Matwidth1#) GT 1>
			<!--- if Default Mat is the same size as the print, assume that it is unmatted>--->
			<cfif #qGetResults.matheight1# is #qGetResults.height1# and #qGetResults.matwidth1# is #qGetResults.width1#>
				<cfset xMat="Mat size varies">
			<cfelse> 				
				<cfset xMat="#qGetResults.matheight1#x#qGetResults.matwidth1#&quot; Mat">
			</cfif>
		</cfif>  		
	<cfelse>
		<!--- Default Photos --->
		<cfif #qShowcaseGalleryDefaultPhotos.unmatted# is 1 >
			<cfset xMat="Unmatted">
		<!--- Make sure that there is a mat size that exists --->
		<cfelseif val(#qShowcaseGalleryDefaultPhotos.Matwidth1#) GT 0>
			<!--- if Mat is the same size as the print, assume that it is unmatted>--->
			<cfif #qShowcaseGalleryDefaultPhotos.matheight1# is #qShowcaseGalleryDefaultPhotos.height1# and 
			#qShowcaseGalleryDefaultPhotos.matwidth1# is #qShowcaseGalleryDefaultPhotos.width1#>
				<cfset xMat="Mat size varies">
			<cfelse>
				<cfset xMat="#qShowcaseGalleryDefaultPhotos.matheight1#x#qShowcaseGalleryDefaultPhotos.matwidth1#&quot; Mat">			
			</cfif>
		</cfif> 	 
	</cfif>	
	
	<!--- If len(Edition No) is 0 --->
	<cfif #qGetResults.Editioned1# is 1 and (#len(trim(qGetResults.EditionNo1))# is 0 or #qGetResults.EditionNo1# is 0) and #len(trim(qGetResults.EditionSz1))# GT 0>
		<cfset xEdition="Edition of #qGetResults.EditionSz1#">
	
	 <cfelseif #qGetResults.Default5# is 1 and  #qShowcaseGalleryDefaultPhotos.Editioned1# is 1 and (#len(trim(qShowcaseGalleryDefaultPhotos.EditionNo1))# is 0 or #qGetResults.EditionNo1# is 0)>		
		<cfset xEdition="Edition of #qShowcaseGalleryDefaultPhotos.EditionSz1#">  
		 <cfelseif #qGetResults.Editioned1# is 1 and #len(qGetResults.EditionNo1)# GT 0 and #len(qGetResults.EditionSz1)# GT 0>		
		 <cfset xEdition="#qGetResults.EditionNo1#/#qGetResults.EditionSz1#"> 
		 <cfelseif #qGetResults.Default5# is 1 and  #qShowcaseGalleryDefaultPhotos.Editioned1# is 1>			
		 <cfset xEdition="#qShowcaseGalleryDefaultPhotos.EditionNo1#/#qShowcaseGalleryDefaultPhotos.EditionSz1#">
		<cfelse>
		 <cfset xEdition="Not Editioned">
		 </cfif>		 
		
	<!--- Price --->
	  <cfif (#qGetResults.defaultnfs# is 1 and qShowcaseGalleryDefaultPhotos.notavailable is 5) or (#qGetResults.defaultnfs# is 0 and qGetResults.notavailable is 5)>				
		  <cfelseif #qGetResults.price1# GT 0 and  qGetResults.NotAvailable is 0 and #qGetResults.defaultNFS# is 1>
				<cfif #qShowcaseGalleryDefaultPhotos.PortfolioPrice# is 1>
					<cfset xPrice="$#qGetResults.price1# Portfolio Price">
				<cfelse>
					<cfset xPrice="$#qGetResults.price1#">
				</cfif>
	 <cfelseif #qShowcaseGalleryDefaultPhotos.price1# GT 0 and #qShowcaseGalleryDefaultPhotos.NotAvailable# is 0 and #qGetResults.defaultNFS# is  1>
			<cfif qShowcaseGalleryDefaultPhotos.PortfolioPrice is 1>
				<cfset xPrice="$#qShowcaseGalleryDefaultPhotos.price1# Portfolio Price">
			<cfelse>
				<cfset xPrice="$#qShowcaseGalleryDefaultPhotos.price1#">
			</cfif>
		<cfelse>
		<cfset xPrice="Price upon request">
	 </cfif> 
	 
	
	<!--- Purchase --->
		<cfif (qGetResults.NotAvailable is 5 and #qGetResults.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 5 and #qGetResults.defaultNFS# is 1)>
		 <cfset xPurchase="<a href='mailto:gallery@photoeye.com?Subject=#qShowcaseArtist.FirstName# #qShowcaseArtist.LastName# Price Inquiry'>Price Upon Request</a>">
		<cfelseif (qGetResults.NotAvailable is 0 and #qGetResults.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 0 and #qGetResults.defaultNFS# is 1)>
		<cfset xPurchase="<input type='image' src='/gallery/sharedimages/purchaseprintGray.gif' align='absmiddle' width='90' height='15' border='0'>">
		<cfelseif (qGetResults.NotAvailable is 1 and #qGetResults.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 1 and #qGetResults.defaultNFS# is 1)>
		 <cfset xPurchase="Sold Out">
		<cfelseif (qGetResults.NotAvailable is 2 and #qGetResults.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 2 and #qGetResults.defaultNFS# is 1)>
		  <cfset xPurchase="Reserved">
		<cfelseif (qGetResults.NotAvailable is 3 and #qGetResults.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 3 and #qGetResults.defaultNFS# is 1)>
		  <cfset xPurchase="Not for Sale">
		</cfif>



