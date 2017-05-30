<!--- Get Max recordno from Gallery Individual Photos --->
<CFQUERY NAME="qGetGalleryIndividualPhotos" DATASOURCE="photoeyecom">
  SELECT * FROM GALLERYINDIVIDUALPHOTOS ORDER BY RECORDNO
</CFQUERY>

<cfset maxrecordno=0>
<cfloop query="qGetGalleryIndividualPhotos">
	<cfif #recordno# GT maxrecordno>
		<cfset maxrecordno=#recordno#>
	</cfif>
</cfloop>
<cfset nextrecordno=#maxrecordno#>


<!--- Get last imagenumber used for this portfolio and this custnumber --->
<!--- Get Max recordno from Gallery Individual Photos --->
<CFQUERY NAME="qGetGalleryIndividualPhotos" DATASOURCE="photoeyecom">
  SELECT Count(*) as ncount  FROM GALLERYINDIVIDUALPHOTOS where custnumber=#Form.Custnumber# and PortfolioName='#Form.Title#'
</CFQUERY>

<!--- Make sure records are found --->
<cfif qGetGalleryIndividualPhotos.ncount GT 0>

<cfset ImageNumber = qGetGalleryIndividualPhotos.ncount+1>

<!--- Image Quantity to Insert --->
<cfloop index="ImageQtyx" from="1" to="#form.imageqty#">
<cfset nextrecordno=nextrecordno+1>



<CFQUERY NAME="qInsertNewCustomer2" DATASOURCE="photoeyecom">
  INSERT INTO GALLERYINDIVIDUALPHOTOS  (RecordNo, Custnumber, PortfolioName, ImageNumber, ImagePosition, NotAvailable, Selected, ShowcaseOK)
           VALUES (#nextrecordno#, #Form.Custnumber#, '#Form.Title#', #ImageNumber#, #ImageNumber#, 4, 1, 1)
</CFQUERY>

<cfset Imagenumber=Imagenumber+1>

</cfloop>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body bgcolor="#cccc99" link="BLUE" vlink="#000080">
<cfoutput>
	Inserted #form.imageqty# New Row(s) in GalleryIndividualPhotos!
</cfoutput>
</body>
</html>

<cfelse>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body bgcolor="#cccc99" link="BLUE" vlink="#000080">
<cfoutput>
	 Sorry, #form.firstname# #form.lastname# #form.custnumber# #form.title# was not found!
</cfoutput>
</body>
</html>

</cfif>
