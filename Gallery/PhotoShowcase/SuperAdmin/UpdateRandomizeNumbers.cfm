<!--- Seed General Random Number in Setup --->
<!--- First Delete all Random Numbers --->
<cfquery name="qDeleteRandomNumbers" DATASOURCE="photoeyecom" dbtype="ODBC">
 	  	Update gallerySETUP set GeneralRandomNo=''
</cfquery>

<CFQUERY NAME="qGetSetup" DATASOURCE="photoeyecom" dbtype="ODBC">
   SELECT RECORDNO, RECORDNUMBER FROM GALLERYSETUP
</CFQUERY>
<cfset counter=1>
<cfset recordnumbercounter=1>
<cfset Randomx=0>

<cfoutput query="qGetSetup">
	<cfset recordnumbercounter=#qGetsetup.Recordnumber#>
	<!--- Loop until all random numbers have been used --->
	<cfloop index="RandomGenerateUniqueNumbers" from="1" to="5000" step="1">
		<cfset Randomx=RandRange(1,#qGetSetup.RecordCount#)>
		<cfquery name="qGetRandom" DATASOURCE="photoeyecom" dbtype="ODBC">
			SELECT GeneralRandomNo 
			FROM gallerySETUP 
			WHERE GeneralRandomNo=#RandomX#
		</cfquery>
		<!--- If Random Number can't be found, we have a unique number. Then break the loop--->
		<cfif qGetRandom.RecordCount is 0>
			<cfbreak>
		</cfif>
	</cfloop>

<cfquery name="qGetSetup" DATASOURCE="photoeyecom" dbtype="ODBC">
 	  	Update gallerySETUP set GeneralRandomNo=#RandomX# where  recordnumber=#recordnumbercounter#
</cfquery>
	<cfset counter=counter+1>
</cfoutput>

 


<!--- Seed General Random Number in GalleryDefaultPhotos --->

<!--- First Delete all Random Numbers --->
<cfquery name="qDeleteRandomNumbers" DATASOURCE="photoeyecom" dbtype="ODBC">
 	  	Update galleryDefaultPhotos set GeneralRandomNo=''
</cfquery>


<CFQUERY NAME="qGetDefaultPhotos" DATASOURCE="photoeyecom" dbtype="ODBC">
   SELECT GeneralRandomNo, RecordNo FROM GalleryDefaultPhotos
</CFQUERY>
<cfset counter=1>
<cfset recordnumbercounter=1>


<cfoutput query="qGetDefaultPhotos">
	<cfset recordNocounter=#qGetDefaultPhotos.RecordNo#>
	<!--- Loop until all random numbers have been used --->
	<cfloop index="RandomGenerateUniqueNumbers" from="1" to="5000" step="1">
		<cfset Randomx=RandRange(1,#qGetDefaultPhotos.RecordCount#)>
		<cfquery name="qGetRandom" DATASOURCE="photoeyecom" dbtype="ODBC">
			SELECT GeneralRandomNo 
			FROM galleryDefaultPhotos
			WHERE GeneralRandomNo=#RandomX#
		</cfquery>
		<!--- If Random Number can't be found, we have a unique number. Then break the loop--->
		<cfif qGetRandom.RecordCount is 0>
			<cfbreak>
		</cfif>
	</cfloop>

<cfquery name="qGetDefaultPhotos" DATASOURCE="photoeyecom" dbtype="ODBC">
 	  	Update galleryDefaultPhotos set GeneralRandomNo=#RandomX# where  recordno=#recordnocounter#
</cfquery>
	<cfset counter=counter+1>
</cfoutput>




<!--- Reindex Medium Random No GalleryDefaultPhotos --->
<!--- First Delete all Random Numbers --->
<cfquery name="qDeleteRandomNumbers" DATASOURCE="photoeyecom" dbtype="ODBC">
 	  	Update galleryDefaultPhotos set MediumRandomNo=''
</cfquery>

		<CFQUERY NAME="qGetDefaultPhotos" DATASOURCE="photoeyecom" dbtype="ODBC">
   SELECT MediumRandomNo, RecordNo, Medium FROM GalleryDefaultPhotos ORDER BY Medium, RecordNo
</CFQUERY>

<cfset counter=0>
<cfset mediumx="">
<cfset Randomx=0>
<!--- Count records for this particular Medium --->
<CFQUERY NAME="qGetDefaultPhotos2" DATASOURCE="photoeyecom" dbtype="ODBC">
   SELECT MediumRandomNo FROM GalleryDefaultPhotos WHERE Medium='#MediumX#'
</CFQUERY>

<cfoutput query="qGetDefaultPhotos">	
	<cfset MediumX=qGetDefaultPhotos.Medium>
	<!--- Check to see Medium is different, If it is, reset the counter to 0--->
	<cfif qGetDefaultPhotos.Medium is not #MediumX#>
		<!--- Count records for this particular Medium --->
		<CFQUERY NAME="qGetDefaultPhotos2" DATASOURCE="photoeyecom" dbtype="ODBC">
   			SELECT MediumRandomNo FROM GalleryDefaultPhotos WHERE Medium='#MediumX#'
		</CFQUERY>
	</cfif>
	<cfset recordnocounter=#qGetDefaultPhotos.RecordNo#>
	<!--- Count records for this particular Medium --->
	<CFQUERY NAME="qGetDefaultPhotos2" DATASOURCE="photoeyecom" dbtype="ODBC">
   		SELECT MediumRandomNo FROM GalleryDefaultPhotos WHERE Medium='#MediumX#'
	</CFQUERY>
	<!--- Loop until all random numbers have been used --->
	<cfloop index="RandomGenerateUniqueNumbers" from="1" to="5000" step="1">
		<cfset Randomx=RandRange(1,#qGetDefaultPhotos2.RecordCount#)>
		<cfquery name="qGetRandom" DATASOURCE="photoeyecom" dbtype="ODBC">
			SELECT MediumRandomNo 
			FROM galleryDefaultPhotos
			WHERE MediumRandomNo=#RandomX# and Medium='#MediumX#'
		</cfquery>
		<!--- If Random Number can't be found, we have a unique number. Then break the loop--->
		<cfif qGetRandom.RecordCount is 0>
			<cfbreak>
		</cfif>
		
	</cfloop>
		
	<cfquery name="qGetDefaultPhotos" DATASOURCE="photoeyecom" dbtype="ODBC">
 	  	Update galleryDefaultPhotos set MediumRandomNo=#Randomx# where  recordno=#recordnocounter#
	</cfquery>

</cfoutput> 




<!--- Reindex Genre1 Random No GalleryDefaultPhotos --->
<!--- First Delete all Random Numbers --->
<cfquery name="qDeleteRandomNumbers" DATASOURCE="photoeyecom" dbtype="ODBC">
 	  	Update galleryDefaultPhotos set GenreRandomNo=''
</cfquery>

		<CFQUERY NAME="qGetDefaultPhotos" DATASOURCE="photoeyecom" dbtype="ODBC">
   SELECT GenreRandomNo, RecordNo, Genre1 FROM GalleryDefaultPhotos ORDER BY Genre1, RecordNo
</CFQUERY>

<cfset counter=0>
<cfset Genre1x="">
<cfset Randomx=0>
<!--- Count records for this particular Genre1 --->
<CFQUERY NAME="qGetDefaultPhotos2" DATASOURCE="photoeyecom" dbtype="ODBC">
   SELECT GenreRandomNo FROM GalleryDefaultPhotos WHERE Genre1='#Genre1X#'
</CFQUERY>

<cfoutput query="qGetDefaultPhotos">	
	<cfset Genre1X=qGetDefaultPhotos.Genre1>
	<!--- Check to see Genre1 is different, If it is, reset the counter to 0--->
	<cfif qGetDefaultPhotos.Genre1 is not #Genre1X#>
		<!--- Count records for this particular Genre1 --->
		<CFQUERY NAME="qGetDefaultPhotos2" DATASOURCE="photoeyecom" dbtype="ODBC">
   			SELECT GenreRandomNo FROM GalleryDefaultPhotos WHERE Genre1='#Genre1X#'
		</CFQUERY>
	</cfif>
	<cfset recordnocounter=#qGetDefaultPhotos.RecordNo#>
	<!--- Count records for this particular Genre1 --->
	<CFQUERY NAME="qGetDefaultPhotos2" DATASOURCE="photoeyecom" dbtype="ODBC">
   		SELECT GenreRandomNo FROM GalleryDefaultPhotos WHERE Genre1='#Genre1X#'
	</CFQUERY>
	<!--- Loop until all random numbers have been used --->
	<cfloop index="RandomGenerateUniqueNumbers" from="1" to="5000" step="1">
		<cfset Randomx=RandRange(1,#qGetDefaultPhotos2.RecordCount#)>
		<cfquery name="qGetRandom" DATASOURCE="photoeyecom" dbtype="ODBC">
			SELECT GenreRandomNo 
			FROM galleryDefaultPhotos
			WHERE GenreRandomNo=#RandomX# and Genre1='#Genre1X#'
		</cfquery>
		<!--- If Random Number can't be found, we have a unique number. Then break the loop--->
		<cfif qGetRandom.RecordCount is 0>
			<cfbreak>
		</cfif>
		
	</cfloop>
		
	<cfquery name="qGetDefaultPhotos" DATASOURCE="photoeyecom" dbtype="ODBC">
 	  	Update galleryDefaultPhotos set GenreRandomNo=#Randomx# where  recordno=#recordnocounter#
	</cfquery>

</cfoutput>


<!--- Reindex Format1 Random No GalleryDefaultPhotos --->
<!--- First Delete all Random Numbers --->
<cfquery name="qDeleteRandomNumbers" DATASOURCE="photoeyecom" dbtype="ODBC">
 	  	Update galleryDefaultPhotos set FormatRandomNo=''
</cfquery>

		<CFQUERY NAME="qGetDefaultPhotos" DATASOURCE="photoeyecom" dbtype="ODBC">
   SELECT FormatRandomNo, RecordNo, Format1 FROM GalleryDefaultPhotos ORDER BY Format1, RecordNo
</CFQUERY>

<cfset counter=0>
<cfset Format1x="">
<cfset Randomx=0>
<!--- Count records for this particular Format --->
<CFQUERY NAME="qGetDefaultPhotos2" DATASOURCE="photoeyecom" dbtype="ODBC">
   SELECT FormatRandomNo FROM GalleryDefaultPhotos WHERE Format1='#Format1X#'
</CFQUERY>

<cfoutput query="qGetDefaultPhotos">	
	<cfset Format1X=qGetDefaultPhotos.Format1>
	<!--- Check to see Format1 is different, If it is, reset the counter to 0--->
	<cfif qGetDefaultPhotos.Format1 is not #Format1X#>
		<!--- Count records for this particular Format1 --->
		<CFQUERY NAME="qGetDefaultPhotos2" DATASOURCE="photoeyecom" dbtype="ODBC">
   			SELECT FormatRandomNo FROM GalleryDefaultPhotos WHERE Format1='#Format1X#'
		</CFQUERY>
	</cfif>
	<cfset recordnocounter=#qGetDefaultPhotos.RecordNo#>
	<!--- Count records for this particular Format1 --->
	<CFQUERY NAME="qGetDefaultPhotos2" DATASOURCE="photoeyecom" dbtype="ODBC">
   		SELECT FormatRandomNo FROM GalleryDefaultPhotos WHERE Format1='#Format1X#'
	</CFQUERY>
	<!--- Loop until all random numbers have been used --->
	<cfloop index="RandomGenerateUniqueNumbers" from="1" to="5000" step="1">
		
		<cfset Randomx=RandRange(1,#qGetDefaultPhotos2.RecordCount#)>
		
		<cfquery name="qGetRandom" DATASOURCE="photoeyecom" dbtype="ODBC">
			SELECT FormatRandomNo 
			FROM galleryDefaultPhotos
			WHERE FormatRandomNo=#RandomX# and Format1='#Format1X#'
		</cfquery>
		
		<!--- If Random Number can't be found, we have a unique number. Then break the loop--->
		<cfif qGetRandom.RecordCount is 0>
			<cfbreak>
		</cfif>
		
	</cfloop>
		
	<cfquery name="qGetDefaultPhotos" DATASOURCE="photoeyecom" dbtype="ODBC">
 	  	Update galleryDefaultPhotos set FormatRandomNo=#Randomx# where  recordno=#recordnocounter#
	</cfquery>

</cfoutput>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase</title>
</head>

<body bgcolor="#333333" link="#000080" vlink="#000080">
<font face="Verdana,Geneva,Arial,Helvetica,sans-serif" color="White" size="2">

<br><br><br><br>
<p align="center">


Finished Randomizing All Setup and Default Photo Records!
</p>

</font>

</body>
</html>
