
<!--- Reindex General Setup RecordNo --->

<CFQUERY NAME="qGetSetup" DATASOURCE="photoeyecom" dbtype="ODBC">
   SELECT RECORDNO, RECORDNUMBER FROM GALLERYSETUP
</CFQUERY>
<cfset counter=1>
<cfset recordnumbercounter=1>

<cfoutput query="qGetSetup">
<cfset recordnumbercounter=#qGetsetup.Recordnumber#>
<cfquery name="qGetSetup" DATASOURCE="photoeyecom" dbtype="ODBC">
 	  	Update gallerySETUP set RECORDNO=#counter# where  recordnumber=#recordnumbercounter#
</cfquery>
	<cfset counter=counter+1>
</cfoutput>



<!--- Reindex General Random No GalleryDefaultPhotos --->

<CFQUERY NAME="qGetDefaultPhotos" DATASOURCE="photoeyecom" dbtype="ODBC">
   SELECT GeneralRandomNo, RecordNo FROM GalleryDefaultPhotos
</CFQUERY>
<cfset counter=1>
<cfset recordnumbercounter=1>

<cfoutput query="qGetDefaultPhotos">
<cfset recordnocounter=#qGetDefaultPhotos.RecordNo#>
<cfquery name="qGetDefaultPhotos" DATASOURCE="photoeyecom" dbtype="ODBC">
 	  	Update galleryDefaultPhotos set GeneralRandomNo=#counter# where  recordno=#recordnocounter#
</cfquery>
	<cfset counter=counter+1>
</cfoutput> 




<!--- Reindex Medium Random No GalleryDefaultPhotos --->

<CFQUERY NAME="qGetDefaultPhotos" DATASOURCE="photoeyecom" dbtype="ODBC">
   SELECT MediumRandomNo, RecordNo, Medium FROM GalleryDefaultPhotos ORDER BY Medium, RecordNo
</CFQUERY>

<cfset counter=0>
<cfset recordnumbercounter=1>
<cfset mediumx="">

<cfoutput query="qGetDefaultPhotos">
	<!--- Check to see Medium is different, If it is, reset the counter to 0--->
	<cfif qGetDefaultPhotos.Medium is #MediumX#>
		<cfset counter=counter+1>
	<cfelse>
		<cfset counter=1>
	</cfif>
	<cfset recordnocounter=#qGetDefaultPhotos.RecordNo#>
	<cfquery name="qGetDefaultPhotos" DATASOURCE="photoeyecom" dbtype="ODBC">
 	  	Update galleryDefaultPhotos set MediumRandomNo=#counter# where  recordno=#recordnocounter#
	</cfquery>
	<cfset MediumX=qGetDefaultPhotos.Medium>
</cfoutput>


<!--- Reindex Genre Random No GalleryDefaultPhotos --->

<CFQUERY NAME="qGetDefaultPhotos" DATASOURCE="photoeyecom" dbtype="ODBC">
   SELECT GenreRandomNo, RecordNo, Genre1 FROM GalleryDefaultPhotos ORDER BY Genre1, RecordNo
</CFQUERY>

<cfset counter=0>
<cfset recordnumbercounter=1>
<cfset Genrex="">

<cfoutput query="qGetDefaultPhotos">
	<!--- Check to see Genre is different, If it is, reset the counter to 0--->
	<cfif qGetDefaultPhotos.Genre1 is #GenreX#>
		<cfset counter=counter+1>
	<cfelse>
		<cfset counter=1>
	</cfif>
	<cfset recordnocounter=#qGetDefaultPhotos.RecordNo#>
	<cfquery name="qGetDefaultPhotos" DATASOURCE="photoeyecom" dbtype="ODBC">
 	  	Update galleryDefaultPhotos set GenreRandomNo=#counter# where  recordno=#recordnocounter#
	</cfquery>
	<cfset GenreX=qGetDefaultPhotos.Genre1>
</cfoutput>



<!--- Reindex Format Random No GalleryDefaultPhotos --->

<CFQUERY NAME="qGetDefaultPhotos" DATASOURCE="photoeyecom" dbtype="ODBC">
   SELECT FormatRandomNo, RecordNo, Format1 FROM GalleryDefaultPhotos ORDER BY Format1, RecordNo
</CFQUERY>

<cfset counter=0>
<cfset recordnumbercounter=1>
<cfset Formatx="">

<cfoutput query="qGetDefaultPhotos">
	<!--- Check to see Format is different, If it is, reset the counter to 0--->
	<cfif qGetDefaultPhotos.Format1 is #FormatX#>
		<cfset counter=counter+1>
	<cfelse>
		<cfset counter=1>
	</cfif>
	<cfset recordnocounter=#qGetDefaultPhotos.RecordNo#>
	<cfquery name="qGetDefaultPhotos" DATASOURCE="photoeyecom" dbtype="ODBC">
 	  	Update galleryDefaultPhotos set FormatRandomNo=#counter# where  recordno=#recordnocounter#
	</cfquery>
	<cfset FormatX=qGetDefaultPhotos.Format1>
</cfoutput>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase</title>
</head>

<body bgcolor="gray" link="#000080" vlink="#000080">
<font face="Verdana,Geneva,Arial,Helvetica,sans-serif" color="White" size="2">

<br><br><br><br>
<p align="center">

<!--- <CFQUERY NAME="qGetDefaultPhotos" DATASOURCE="photoeyecom" dbtype="ODBC">
   SELECT MediumRandomNo, RecordNo, Medium, Custnumber FROM GalleryDefaultPhotos ORDER BY Medium
</CFQUERY>

<cfoutput query="qGetDefaultPhotos">
	<CFQUERY NAME="qGetDefaultPhotos2" DATASOURCE="photoeyecom" dbtype="ODBC">
   SELECT GeneralRandomNo, RecordNo, Medium, Custnumber FROM GalleryDefaultPhotos where RecordNo=#qGetDefaultPhotos.RecordNo#
</CFQUERY>
	#Medium# #Custnumber# #MediumRandomNo#<br>
</cfoutput> --->
Finished Reindexing RecordNumbers
</p>

</font>

</body>
</html>
