<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>


<!--- Now Create the directories--->
<CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
  SELECT SubDirectory, Gallery
  FROM GallerySetup where Custnumber=94694
</CFQUERY>

<CFSET SUBDIRECTORY1 = #qGetShowcaseSetupInfo.Subdirectory#>

<cfoutput query="qGetShowcaseSetupInfo">
<CFSET thisDirectory = "d:\html\users\cfxa905\photoeyecom\html\gallery\#qGetShowcaseSetupInfo.GALLERY#\Artists\#Subdirectory1#">
#thisdirectory#
<!--- <cfif DirectoryExists(thisDirectory) is 'NO'>
	<cfdirectory action="CREATE" DIRECTORY="d:\html\users\cfxa905\photoeyecom\html\gallery\#form.GALLERY#\Artists\#Subdirectory1#"> --->
<!--- </cfif> --->
</cfoutput>


</body>
</html>
