<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>
<!--- Count records for this particular Format --->
<CFQUERY NAME="qGetIndividualPhotos" DATASOURCE="photoeyecom" dbtype="ODBC">
   SELECT * FROM GalleryIndividualPhotos
</CFQUERY>
<!--- Now do Individual Photos--->
<cfoutput query="qGetIndividualPhotos">	

	<cfset recordnocounter=#recordno#>
	#recordnoCounter#
	
<cfquery name="qGetIndividualPhotos2" DATASOURCE="photoeyecom" dbtype="ODBC">
		Update GalleryIndividualPhotos set GeneralRandomNo=#Rand()# where  recordno=#recordnocounter#
	</cfquery>
	
</cfoutput>
Randomizer is complete!
</body>
</html>
