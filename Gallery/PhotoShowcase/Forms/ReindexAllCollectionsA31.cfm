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

		
	<cfquery name="qGetGenres2" DATASOURCE="photoeyecom" dbtype="ODBC">
		Update GalleryDefaultPhotos set GeneralRandomNo=#Rand()#, MediumRandomNo=#Rand()#, FormatRandomNo=#Rand()#, GenreRandomNo=#Rand()#  where  recordno=#recordnocounter#
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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase | Randomize Keywords</title>
</head>

<body>

Part One has completed!

<!--- Now Produce 10 Static Selected Images Pages --->
<cfinclude template="../../DynamictoStaticSelectedImagesLocalA31.cfm">
Part Two has completed!


<!--- Now Reindex Keywords --->
<cfinclude template="../../../templates/VeritybyShowcaseKeyword.cfm">
Part Three has completed!

<!--- Now Make The Guide's Static Pages--->
<!--- No longer using StaticDirectories --->
<!--- <cfinclude template="../../../TheGuide/DynamictoStaticDirectories.cfm> --->

<!--- Refresh The Guide's Verity Search Indicies --->
<!--- <cfinclude template="../../../TheGuide/VerityKeywords.cfm">
Part Four has completed! --->
<br><br>

<!--- Refresh The Guide's Verity Search Indicies --->
<cfinclude template="../../../templates/Admin/VeritybyAbstract.cfm">
<cfinclude template="../../../templates/Admin/VeritybyPublisher.cfm">
<cfinclude template="../../../templates/Admin/VeritybySubject.cfm">
<cfinclude template="../../../templates/Admin/VeritybyTitle.cfm">
<cfinclude template="../../../templates/Admin/VeritybyAuthor.cfm">
Part Five has completed!
<br><br>

CFCollections Reindexing and Randomizer is finished!

</body>
</html>
