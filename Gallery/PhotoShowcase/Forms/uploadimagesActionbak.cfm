

<CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup
  WHERE Custnumber = #url.custnumber#
</CFQUERY>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Upload Photos Template</title>
</head>

<script language="JavaScript">
function closeWindow()

	if (newWindow && !newWindow.closed) {
	newWindow.close()
	
	}
	
	}

</script>

<!--- <body onLoad="closeWindow(newWin)">  --->
<body>
<cfoutput>

<!---Check to see if directory already exists, if not, create it--->
<CFIF DirectoryExists("e:\http\photoeye\gallery\photoshowcase\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages") is "No">

<CFDIRECTORY ACTION="Create"
    DIRECTORY="e:\http\photoeye\gallery\photoshowcase\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages">

</cfif>

<cfif #form.FileName1# is not "">
<cffile destination="e:\http\photoeye\gallery\photoshowcase\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName1">
</cfif>

<cfif form.FileName2 is not "">
<cffile destination="e:\http\photoeye\gallery\photoshowcase\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName2">
</cfif>

<cfif form.FileName3 is not "">
<cffile destination="e:\http\photoeye\gallery\photoshowcase\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName3">
</cfif>

<cfif form.FileName4 is not "">
<cffile destination="e:\http\photoeye\gallery\photoshowcase\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName4">
</cfif>

<cfif form.FileName5 is not "">
<cffile destination="e:\http\photoeye\gallery\photoshowcase\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName5">
</cfif>

<cfif form.FileName6 is not "">
<cffile destination="e:\http\photoeye\gallery\photoshowcase\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName6">
</cfif>

<cfif form.FileName7 is not "">
<cffile destination="e:\http\photoeye\gallery\photoshowcase\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName7">
</cfif>

<cfif form.FileName8 is not "">
<cffile destination="e:\http\photoeye\gallery\photoshowcase\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName8">
</cfif>

<cfif form.FileName9 is not "">
<cffile destination="e:\http\photoeye\gallery\photoshowcase\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName9">
</cfif>

<cfif form.FileName10 is not "">
<cffile destination="e:\http\photoeye\gallery\photoshowcase\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName10">
</cfif>

<cfif form.FileName11 is not "">
<cffile destination="e:\http\photoeye\gallery\photoshowcase\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName11">
</cfif>

<cfif form.FileName12 is not "">
<cffile destination="e:\http\photoeye\gallery\photoshowcase\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName12">
</cfif>

<cfif form.FileName13 is not "">
<cffile destination="e:\http\photoeye\gallery\photoshowcase\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName13">
</cfif>

<cfif form.FileName14 is not "">
<cffile destination="e:\http\photoeye\gallery\photoshowcase\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName14">
</cfif>

<cfif form.FileName15 is not "">
<cffile destination="e:\http\photoeye\gallery\photoshowcase\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName15">
</cfif>

<cfif form.FileName16 is not "">
<cffile destination="e:\http\photoeye\gallery\photoshowcase\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName16">
</cfif>

<cfif form.FileName17 is not "">
<cffile destination="e:\http\photoeye\gallery\photoshowcase\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName17">
</cfif>

<cfif form.FileName18 is not "">
<cffile destination="e:\http\photoeye\gallery\photoshowcase\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName18">
</cfif>

<cfif form.FileName19 is not "">
<cffile destination="e:\http\photoeye\gallery\photoshowcase\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName19">
</cfif>

<cfif form.FileName20 is not "">
<cffile destination="e:\http\photoeye\gallery\photoshowcase\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName20">
</cfif>

<!--- <cfinclude template="closewindow.cfm"> --->
<center>
File upload was successful!
<br><br>
If you have completed all four Online Application steps, <a href="mailto:photoshowcase@photoeye.com?subject=#qGetShowcaseSetupInfo.Firstname# #qGetShowcaseSetupInfo.Lastname# Images are Uploaded">notify 
      photo-eye</a>.
<br><br>
You will be contacted within 4 business days with further instructions.

<br><br><!---  <a href="javascript:closeWindow()">Close</a> --->
</center>
<hr>
<!--- 
#file.serverdirectory#\#file.serverfile#<br>
#file.clientdirectory#<br>
#file.clientFileName# --->
</cfoutput>
</body>
</html>
