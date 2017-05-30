<!--- This program Randomizes all Random columns --->

<!--- Count records for this particular Format --->
<CFQUERY NAME="qGetKeywords" DATASOURCE="photoeyecom" dbtype="ODBC">
   SELECT * FROM GalleryKeywords
</CFQUERY>

<cfoutput query="qGetKeywords">	
	<cfset recordnocounter=#id#>

	<cfquery name="qGetKeywords2" DATASOURCE="photoeyecom" dbtype="ODBC">
		Update GalleryKeywords set RandomNo=#Rand()# where  id=#recordnocounter#
	</cfquery>

</cfoutput> 

<!--- Count records for this particular Format --->
<CFQUERY NAME="qGetGenres" DATASOURCE="photoeyecom" dbtype="ODBC">
   SELECT * FROM GalleryDefaultPhotos
</CFQUERY>

<cfoutput query="qGetGenres">	

	<cfset recordnocounter=#recordno#>
	#recordnoCounter#

		<!--- There is no Format Random number here --->
	<cfquery name="qGetGenres2" DATASOURCE="photoeyecom" dbtype="ODBC">
		Update GalleryDefaultPhotos set GeneralRandomNo=#Rand()#, MediumRandomNo=#Rand()#, GenreRandomNo=#Rand()#  where  recordno=#recordnocounter#
	</cfquery>
	


</cfoutput> 

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

<!--- Now Produce 10 Static Selected Images Pages --->

<cfinclude template="../../DynamictoStaticSelectedImages.cfm>

<!--- Now Reindex Keywords --->

<cfinclude template="../../../templates/VeritybyShowcaseKeyword.cfm>

<!--- Now Make The Guide's Static Pages--->
<!--- <cfinclude template="../../../TheGuide/DynamictoStaticDirectories.cfm> --->

<!--- Refresh The Guide's Verity Search Indicies --->
<cfinclude template="../../../TheGuide/VerityKeywords.cfm>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase | Randomize Keywords</title>
</head>

<body>

Randomizer is finished!

</body>
</html>
