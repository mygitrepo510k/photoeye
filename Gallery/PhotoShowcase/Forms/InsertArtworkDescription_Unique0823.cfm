<!--- Set Default Variables if they don't already exist --->
<CFPARAM NAME="id" Default="0">

<!--- Get Default Info --->
<CFQUERY NAME="qGetShowcaseDefaultInfo"
         DATASOURCE="photoeyecom">

SELECT *
FROM GalleryDefaultPhotos
WHERE Custnumber = #form.Custnumber# and SubDirectory='#URL.Portfolio#'

</CFQUERY>

<!--- Replace Fields with Defaults--->


<cfif #qGetShowcaseDefaultInfo.NotAvailable# is #form.NotAvailable#>
		 <CFSET #DefaultNFS# = '1'>
		 <CFSET #NotAvailable# = '#form.NotAvailable#'>
<cfelse>
 		 <CFSET #DefaultNFS# = '0'>
		 <CFSET #NotAvailable# = '#form.NotAvailable#'>
</cfif>


<cfif #form.Default1# is 1>
<!--- 	     <CFSET #Title# ="#qGetShowcaseDefaultInfo.Title#"> --->
	     <CFSET #Title# ="">
		 <CFSET #Default1# = 1>
<cfelse>
 	<CFSET #Title# ="#form.Title#">
       <cfset Quote=Chr(34)>
		 <cfset Titlex = "#form.Title#">
		 <cfset #Title#=Replace(Titlex,Quote,"&quot;","ALL")>           
		 <!--- <CFSET #Title# ="#form.Title#" --->
		 <CFSET #Default1# = 0>
</cfif>



<cfif #form.Default2# is 1>
<!--- 		<CFSET #Medium# ="#qGetShowcaseDefaultInfo.Medium#"> --->
		<CFSET #Medium# ="">
<!--- 		<CFSET #OTHERMED# = "#qGetShowcaseDefaultInfo.OtherMed#"> --->
		<CFSET #OTHERMED# = "">
		<CFSET #Default2# = 1>
<cfelse>
		<CFSET #Medium# ="#form.Medium#">
	     <cfset Quote=Chr(34)>
		 <cfset Othermedx = "#form.Othermed#">
		 <cfset #Othermed#=Replace(Othermedx,Quote,"&quot;","ALL")>
<!--- 		<CFSET #OTHERMED# ="#form.OTHERMED#"> --->
		<CFSET #Default2# = 0>
</cfif>

<cfif #form.Default3# is 1>
	   <!--- <CFSET #YearProd# ="#qGetShowcaseDefaultInfo.YearProd#"> --->
	   <CFSET #YearProd# ="">
	   <CFSET #Default3# = 1>
<cfelse>
	  <CFSET #YearProd# ="#form.YearProd#">
	  <CFSET #Default3# = 0>
</cfif>

<cfif #form.Default9# is 1>
	   <!--- <CFSET #Genre1# ="#qGetShowcaseDefaultInfo.Genre1#"> --->
	   <CFSET #Genre1# ="">
	   <CFSET #Default9# = 1>
<cfelse>
	   <CFSET #Genre1# ="#form.Genre1#">
	   <CFSET #Default9# = 0>
</cfif>

<cfif #form.Default6# is 1>
	   <CFSET #Height1# ="">
	   <CFSET #Width1# ="">
	   <CFSET #Default6# = 1>
<cfelse>
	   <CFSET #Height1# ="#form.Height1#">
	   <CFSET #Width1# ="#form.Width1#">
	   <CFSET #Default6# = 0>
</cfif>

<cfif #form.Default4# is 1>
	   <CFSET #MatHeight1# ="">
	   <CFSET #MatWidth1# ="">
	   <CFSET #Unmatted# = "0">
	   <CFSET #Default4# = 1>
<cfelse>
 <!---  	 <CFSET #AddInfo1# ="#form.AddInfo1#"> --->
<!--- 	   	 <CFSET #AddInfo1# ="#form.Price1#"> --->
	 <CFSET #MatHeight1# ="#form.MatHeight1#">
	 <CFSET #MatWidth1# ="#form.MatWidth1#"> 
	 <CFSET #Unmatted# ="#Unmatted#">
   	 <CFSET #Default4# = 0>
</cfif>


<cfif #form.Default7# is 1>
		<!--- <CFSET #Price1# ="#qGetShowcaseDefaultInfo.Price1#"> --->
	   <CFSET #Price1# ="">
	   <CFSET #Default7# = 1>
<cfelse>
  	 <CFSET #Price1# ="#form.Price1#">
   	 <CFSET #Default7# = 0>
</cfif>



<cfif #form.Default8# is 1>
	   <!--- <CFSET #Addinfo1# ="#qGetShowcaseDefaultInfo.Addinfo1#"> --->
	   <CFSET #Addinfo1# ="">
	   <CFSET #Default8# = 1>
<cfelse>
<!---   	 <CFSET #AddInfo1# ="#form.Price1#"> --->
     <cfset Quote=Chr(34)>
	 <cfset AddInfo1x = "#form.AddInfo1#">
	 <cfset #AddInfo1#=Replace(AddInfo1x,Quote,"&quot;","ALL")>
<!--- 	 <CFSET #AddInfo1# ="#form.AddInfo1#"> --->
   	 <CFSET #Default8# = 0>
</cfif>

<cfif #form.Default5# is 1>
	   <CFSET #Editioned1# ="">
	   <CFSET #EditionSz1# ="">
	   <CFSET #EditionNo1# ="">   
	   <CFSET #Default5# = 1>
<cfelse>
	   <CFSET #Editioned1# ="#form.Editionedx#">
	   <CFSET #EditionSz1# ="#Form.EditionSz1#">
	   <CFSET #EditionNo1# ="#Form.EditionNo1#"> 
   	   <CFSET #Default5# = 0>
</cfif>

<cfif #form.Default10# is 1>
	   	<!--- <CFSET #LocContin# ="#qGetShowcaseDefaultInfo.LocContin#"> --->
		<CFSET #LocContin# ="">
		<CFSET #Default10# = 1>
<cfelse>


	   	<CFSET #LocContin# ="#form.LocContin#">
		<CFSET #Default10# = 0>
</cfif>

<cfif #form.Default11# is 1>
	   	<!--- <CFSET #Keywords# ="#qGetShowcaseDefaultInfo.Keywords#"> --->
		<CFSET #Keywords# ="">
		<CFSET #Default11# = 1>
<cfelse>
		 <cfset Quote=Chr(34)>
		 <cfset Keywordsx = "#form.Keywords#">
		 <cfset #Keywords#=Replace(Keywordsx,Quote,"&quot;","ALL")>

	   	<!--- <CFSET #Keywords# ="#form.Keywords#"> --->
		<CFSET #Default11# = 0>
</cfif>

<!--- Now Check for Quotes in the other text boxes --->

<cfset Quote=Chr(34)>

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


<CFQUERY NAME="qGetShowcaseUniqueInfo"
         DATASOURCE="photoeyecom">

SELECT *
FROM GalleryIndividualPhotos
WHERE Custnumber = #form.Custnumber# and ImageNumber = #FORM.imagenumber# and PortfolioName='#URL.Portfolio#'

</CFQUERY>

<cfif #qGetShowcaseUniqueInfo.custnumber# is #form.Custnumber#>

<CFTRANSACTION>
	<CFQUERY NAME="qUpdatePhotographersSetup2Info"  DATASOURCE="photoeyecom">
  UPDATE GalleryIndividualPhotos
   SET Title = '#Title#',
   	Caption1 = '#form.Caption#',
  	PortfolioName = '#Url.Portfolio#',
    NotAvailable= '#NotAvailable#',
	DefaultNFS='#DefaultNFS#',	
    Default1 = '#Default1#',
    Medium = '#Medium#',
	OtherMed = '#OtherMed#',
	Default2 = '#Default2#',
	Default3 = '#Default3#',
	Default4 = '#Default4#',
	YearProd = '#YearProd#',
	Default6 = '#Default6#',
	Genre1 = '#Genre1#',
	Default9 = '#Default9#',
	Format1 = '#Format1#',
	DefaultFormat = '#DefaultFormat#',	
	Height1 = '#Height1#',
	Width1 = '#Width1#',
	UnMatted = '#Unmatted#',
	MatWidth1 = '#MatWidth1#',
	MatHeight1 = '#MatHeight1#',
	Price1 = '#Price1#',
	Default7 = '#Default7#',
	Default8 = '#Default8#',
	Default5 = '#Default5#',
 	Editioned1 = '#form.Editionedx#',
	EditionSz1 = '#Form.EditionSz1#',
	EditionNo1 = '#Form.EditionNo1#',	
 	AddInfo1 = '#Form.AddInfo1#',
   	Genre2 = '#Genre2x#',
   	Format2 = '#Format2x#',	
    Default10 = '#Default10#',  
 	LocContin = '#LocContin#',	
	LocCountry = '#LocCountryx#',	
	LocRegion = '#LocRegionx#',	
	LocState = '#LocStatex#',		
	LocCity = '#LocCityx#',	
    Default11 = '#Default11#',	
	Changed = '#Form.Changed#',
	Completed = 1		 
	WHERE CustNumber = '#form.CustNumber#' and ImageNumber = #form.imagenumber# and PortfolioName='#URL.Portfolio#'
</CFQUERY>

<!---Add Keywords--->

<!---Query to see if the keyword exists --->
<CFQUERY NAME="qGetShowcaseUniqueKeywords"
        DATASOURCE="photoeyecom">

SELECT *
FROM GalleryKeywords
WHERE Custnumber = #form.Custnumber# and DefaultKW=0 and  Catalog=#qGetShowcaseUniqueInfo.Catalog#

</CFQUERY>

<CFLOOP INDEX="KeywordinLoop"
    LIST="#form.keywords#"
    DELIMITERS=",">
	
	<cfif #qGetShowcaseUniqueKeywords.Keywords# GT 0>
	
		<cfloop query="qGetShowcaseUniqueKeywords">
		
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
				VALUES (#form.Custnumber#, #qGetShowcaseUniqueInfo.Catalog#, 0, '#TRIM(KeywordinLoop)#', '#url.Portfolio#')
				</CFQUERY>
		</cfif>
	<cfelse>
		<CFQUERY NAME="qInsert"
        		 DATASOURCE="photoeyecom">
				INSERT INTO
				GalleryKeywords (Custnumber, Catalog, DefaultKW, Keywords, Portfolio)
				VALUES (#form.Custnumber#, #qGetShowcaseUniqueInfo.Catalog#, 0, '#TRIM(KeywordinLoop)#', '#url.Portfolio#')
			</CFQUERY>

	</cfif>

	
</CFLOOP>

<!---Delete Keywords--->

<cfloop query="qGetShowcaseUniqueKeywords">
		
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
				
				<CFQUERY NAME="qInsert"
        		 DATASOURCE="photoeyecom">
				DELETE
				GalleryKeywords WHERE KEYWORDS='#KEYWORDS#' AND CATALOG=#qGetShowcaseUniqueInfo.Catalog#
				</CFQUERY>
		</cfif>

</CFLOOP>




</CFTRANSACTION>

<cfelse>

<CFTRANSACTION>
<CFINSERT DATASOURCE="photoeyecom" TABLENAME="GalleryIndividualPhotos" dbtype="ODBC">
</CFTRANSACTION>

</cfif>


<!--- Insert into Inventory if not already inserted ---->

<!--- Run this query again as it has now been updated --->
<CFQUERY NAME="qGetShowcaseUniqueInfo"
         DATASOURCE="photoeyecom">

SELECT *
FROM GalleryIndividualPhotos
WHERE Custnumber = #form.Custnumber# and ImageNumber = #FORM.imagenumber# and PortfolioName='#URL.Portfolio#'

</CFQUERY>


<!---Get Setup Information--->
<cfquery name="qGetGallerySetup" DATASOURCE="photoeyecom" dbtype="ODBC">
	SELECT * FROM GALLERYSETUP WHERE CUSTNUMBER=#form.custnumber#;
</cfquery>

<!--- Check to see if Inventory item is already in the database --->
<cfquery name="qInventoryCheck" DATASOURCE="photoeyecom" dbtype="ODBC">
	SELECT * FROM INVENTORY WHERE CATALOG='#qGetShowcaseUniqueInfo.Catalog#'
</cfquery>
<!--- #qGetShowcaseUniqueInfo.Catalog#; --->
<!--- Price1 DataType Converts from Character to Number so that it can Update the Inventory Price as a Number --->
	<cfif #Val(qGetShowcaseUniqueInfo.price1)# GT 0>
		<cfset InventoryPrice = qGetShowcaseUniqueInfo.price1>
	<cfelseif #Val(qGetShowcaseDefaultInfo.price1)# GT 0>
		<cfset InventoryPrice = qGetShowcaseDefaultInfo.price1>
	<cfelse>
		<cfset InventoryPrice = 0>
	</cfif>

<!--- #qGetShowcaseUniqueInfo.Catalog# --->
<cfif len(#qInventoryCheck.Catalog#) is 0>


	
	<!---Insert the new row--->
	<cfquery name="qInsertNewInventory" DATASOURCE="photoeyecom" dbtype="ODBC">
	 
		INSERT INTO Inventory  
		(CATALOG, HARDBOUND, HARD_PRICE,  HARD_SALE, HARD_OP,
		HARD_ISBN, SOFTBOUND, SOFT_PRICE, SOFT_SALE, SOFT_OP, SOFT_ISBN, LTD_EDITIO,
		LTD_OP, VIDEO, BOOKTEASE, BOOKTEASE2, BT2WIDTH, BT2HEIGHT, TITLE2, TITLE2X,
		SUBTITLE, SUBTITLEX, AUTHORS, AUTHORSX, 
		PUBLISHER, PUBLISHERX, CITY, CITYX, DATEPUB, PAGES, SIZEX, NUDES, CATEGORYNO, 
		SUBJECT, SUBJECTX, ABSTRACT, ABSTRACTX,
		OCR, OCRX, THUMBH, THUMBW, BIGH, BIGW, 
		CUSTOM1, CUSTOM2, CUSTOM3, CUSTOM4) VALUES
		
		(#qGetShowcaseUniqueInfo.catalog#, 0, NULL, NULL, 0, 
		NULL, 1, #InventoryPrice#, NULL, 0, NULL, 0, 
		0, 0,  0, 0, NULL, NULL, NULL, '#qGetShowcaseUniqueInfo.title#',
		NULL, NULL, NULL, 'Photograph by #qGetGallerySetup.firstname# #qGetGallerySetup.lastname#',
		NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 13, 
		NULL, '#qGetGallerySetup.lastname#,#qGetGallerySetup.firstname#', NULL, NULL, 
		NULL, NULL, NULL, NULL, NULL, NULL,
		NULL, NULL, 0, 0);
	</cfquery>


<cfelse>

	<!---Update the Old Information--->
	<cfquery name="qUpdateInventory" DATASOURCE="photoeyecom" dbtype="ODBC">
		UPDATE Inventory 
		SET
		SUBJECTX='#qGetGallerySetup.lastname#,#qGetGallerySetup.firstname#',
		CATEGORYNO=13,
		AUTHORSX='Photograph by #qGetGallerySetup.firstname# #qGetGallerySetup.lastname#',
		SOFTBOUND=1,
		SOFT_PRICE=#InventoryPrice#
		WHERE Catalog='#qGetShowcaseUniqueInfo.CATALOG#';
	</cfquery>
	
		<!--- SOFT_PRICE=#qGetShowcaseUniqueInfo.price1# --->

</cfif>












 <!--- <CFQUERY NAME="qInsertPhotographersSetup2Info"  DATASOURCE="photoeyecom">
       Insert INTO GalleryIndividualPhotos
                  (Title, Medium, Editioned1, CustNumber)
           VALUES ('#Form.Title#', '#Form.Medium#', '#Form.Editioned1#', #URL.CustNumber#)
   </CFQUERY>
 --->
 
<!---

<cfinsert DATASOURCE="photoeyecom" tablename="GalleryIndividualPhotos" dbtype="ODBC" formfields="Title, Medium, Editioned1, Editioned2, Editioned3, NoSale, Default1, Default2, Default3, Default6, Default7, Default8, Default9, Default10, Default11, Label, Soldout, Inshow, Custnumber"> <!---OtherMedium, YearProduced, Caption1, Caption2, Height1, Width1, MatHeight1, MatWidth1, Editioned1, EditionSiz1, EditionNo1, AddInfo1, Height2, Width2, MatHeight2, MatWidth2, Editioned2, EditionSiz2, EditionNo2, AddInfo2, Height3, Width3, MatHeight3, MatWidth3, Editioned3, EditionSiz3, EditionNo3, AddInfo3, Changed---> --->


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase | Setup</title>
</head>

<body>
<p align="center"><center>
<font color="Black" face="Verdana, Helvetica, Arial, San-Serif"><b>	
Image Update Successful!<br>
<br>
  <cfif id is "0">
 	<center>
 	<cfoutput>
	<form method="post" action="Step12ArtworkDescriptionForm.cfm?portfolio=#url.portfolio#">
		<cfset imagenumberCounter = #ImageNumber# + 1>
		<INPUT TYPE="HIDDEN" NAME="Custnumber" value="#Custnumber#">
		<INPUT TYPE="HIDDEN" NAME="ImageNumberCounter" value="#ImageNumberCounter#">
		<INPUT TYPE="HIDDEN" NAME="ImageNumber" value="#ImageNumber#">
  		<input type="SUBMIT" value="Continue to Next Image" name="SUBMIT">
	</cfoutput>
	</form>
	</center>
  <cfelse>
  	<center>
	<cfoutput>
 	<form method="post" action="Step10ChangeImageOrderURL.cfm?Custnumber=#Custnumber#&portfolio=#url.portfolio#">
		<cfset imagenumberCounter = #ImageNumber# + 1>
		<INPUT TYPE="HIDDEN" NAME="Custnumber" value="#Custnumber#">
		<INPUT TYPE="HIDDEN" NAME="ImageNumberCounter" value="#ImageNumberCounter#">
		<INPUT TYPE="HIDDEN" NAME="ImageNumber" value="#ImageNumber#">
    	<input type="SUBMIT" value="Continue Sequencing" name="SUBMIT">
	</cfoutput>
	</form> 
	</center>
  </cfif>
</center></p>
</body>
</html>
