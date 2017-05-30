
<!--- Reindex Medium Random No GalleryDefaultPhotos --->
<!--- First Delete all Random Numbers --->
<cfquery name="qDeleteRandomNumbers" DATASOURCE="photoeyecom" dbtype="ODBC">
 	  	Update galleryDefaultPhotos set MediumRandomNo=''
</cfquery>

		<CFQUERY NAME="qGetDefaultPhotos" DATASOURCE="photoeyecom" dbtype="ODBC">
   SELECT MediumRandomNo, RecordNo, Medium FROM GalleryDefaultPhotos ORDER BY Medium, RecordNo
</CFQUERY>

<cfset counter=0>
<cfset Mediumx="">
<cfset Randomx=0>
<!--- Count records for this particular Process --->
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


<CFLOCATION URL="../../processes.cfm" ADDTOKEN="No">