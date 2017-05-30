<!--- This program Randomizes all Random columns --->
	<cfquery name="qGetKeywords2" DATASOURCE="photoeyecom">
		Update GalleryKeywords set RandomNo=NewID()
	</cfquery>

part1a
<cfflush>


<!--- Count records for this particular Format --->
	
	<cfquery name="qGetGenres2" DATASOURCE="photoeyecom">
		Update GalleryDefaultPhotos set GeneralRandomNo=NewID(), MediumRandomNo=NewID(), FormatRandomNo=NewID(), GenreRandomNo=NewID()
	</cfquery>
	
part 2a
<cfflush>

<!--- Now do Individual Photos--->
<cfquery name="qGetIndividualPhotos2" DATASOURCE="photoeyecom">
		Update GalleryIndividualPhotos set GeneralRandomNo=NewID()
	</cfquery>


part 3a
<cfflush>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase | Randomize Keywords</title>
</head>

<body>

Part One has completed! 
begin
<cfflush>

<!--- Now Produce 10 Static Selected Images Pages --->
<cfinclude template="DynamictoStaticSelectedImages.cfm">
Part Two has completed! 
<cfflush>

<!--- Now Reindex Keywords --->
<cfinclude template="../templates/VeritybyShowcaseKeyword.cfm">
Part Three has completed!

<!--- Now Make The Guide's Static Pages--->
<!--- No longer using StaticDirectories --->
<!--- <cfinclude template="../../../TheGuide/DynamictoStaticDirectories.cfm> --->

<!--- Refresh The Guide's Verity Search Indicies --->
<!--- <cfinclude template="../../../TheGuide/VerityKeywords.cfm">
Part Four has completed! --->
<br><br>

Randomizer is finished!

</body>
</html>
