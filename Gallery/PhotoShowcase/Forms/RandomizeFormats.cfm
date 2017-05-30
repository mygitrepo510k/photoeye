
<!--- Reindex Format1 Random No GalleryDefaultPhotos --->
<!--- First Delete all Random Numbers --->
<cfquery name="qDeleteRandomNumbers" DATASOURCE="photoeyecom" dbtype="ODBC">
 	  	Update galleryDefaultPhotos set FormatRandomNo=0
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
<!--- 		<CFSET r=randomize(100000)> --->
		<cfquery name="qGetDefaultPhotos" DATASOURCE="photoeyecom" dbtype="ODBC">
 	  			Update galleryDefaultPhotos set FormatRandomNo=#Rand()# where  recordno=#recordnocounter#
		</cfquery>

</cfoutput>


<CFLOCATION URL="../../formats.cfm" ADDTOKEN="No">