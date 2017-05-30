<!--- <cfif not isDefined("form.SearchCriteria")>
	<cfset form.SearchCriteria = "#url.keyword#">
</cfif> --->

<!--- Reindex Genres Random No GalleryGenres --->
<!--- First Delete all Random Numbers --->
<!---  <cfquery name="qDeleteRandomNumbers" DATASOURCE="photoeyecom" dbtype="ODBC">
 	  	Update GalleryGenres set RandomNo=#Rand()#
</cfquery>  --->

<!--- 		

<cfset counter=0>
<cfset Randomx=0> --->

<!--- Count records for this particular Format --->
<CFQUERY NAME="qGetGenres" DATASOURCE="photoeyecom" dbtype="ODBC">
   SELECT * FROM GalleryDefaultPhotos
</CFQUERY>

<cfoutput query="qGetGenres">	

	<cfset recordnocounter=#recordno#>
	#recordnoCounter#

	<!--- Loop until all random numbers have been used --->
	<!---  <cfloop index="RandomGenerateUniqueNumbers" from="1" to="#qGetGenres.RecordCount#" step="1">
		
			
	<cfset Randomx=RandRange(1,#qGetGenres.RecordCount#)>

		<cfquery name="qGetRandom" DATASOURCE="photoeyecom" dbtype="ODBC">
			SELECT id 
			FROM galleryGenres
			WHERE RandomNo=#RandomX# 
		</cfquery>
		
		<!--- If Random Number can't be found, we have a unique number. Then break the loop--->
		<cfif qGetRandom.RecordCount is 0>
			<cfbreak>
		</cfif> 
		
	</cfloop> --->
		
	<cfquery name="qGetGenres2" DATASOURCE="photoeyecom" dbtype="ODBC">
		Update GalleryDefaultPHotos set GenreRandomNo=#Rand()#, GeneralRandomNo=#Rand()# where  recordno=#recordnocounter#
	</cfquery>

</cfoutput> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase | Randomize Genres</title>
</head>

<body>

Randomize Genres is compeleted!

</body>
</html>

<!--- 
<CFLOCATION URL="../../../templates/searchshowcase.cfm?keyword=#url.keyword#" ADDTOKEN="No"> --->