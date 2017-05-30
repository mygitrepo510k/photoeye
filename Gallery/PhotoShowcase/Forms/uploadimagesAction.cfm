<cfset UploadsDirectory="#xServerPath#">
<!--- <cfset UploadsDirectory="c:\photoeye.com.new\photoeye.com"> --->

<CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup
  WHERE Custnumber = #url.id#
</CFQUERY>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Upload Images</title>
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
<!--- <CFIF DirectoryExists("d:\html\users\cfxa905\photoeyecom\html\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages") is "No"> --->

<CFIF DirectoryExists("#UploadsDirectory#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#") is "No">

<!--- <CFDIRECTORY ACTION="Create"
DIRECTORY="d:\html\users\cfxa905\photoeyecom\html\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages"> --->

<CFDIRECTORY ACTION="Create"
DIRECTORY="#UploadsDirectory#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#">

</cfif>


<CFIF DirectoryExists("#UploadsDirectory#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages") is "No">

<!--- <CFDIRECTORY ACTION="Create"
DIRECTORY="d:\html\users\cfxa905\photoeyecom\html\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages"> --->

<CFDIRECTORY ACTION="Create"
DIRECTORY="#UploadsDirectory#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages">

</cfif>

<cfif #form.FileName1# is not "">
<!--- <cffile destination="#UploadsDirectory#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName1"> --->
<cffile destination="#UploadsDirectory#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName1">
</cfif>

<cfif form.FileName2 is not "">
<cffile destination="#UploadsDirectory#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName2">
</cfif>

<cfif form.FileName3 is not "">
<cffile destination="#UploadsDirectory#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName3">
</cfif>

<cfif form.FileName4 is not "">
<cffile destination="#UploadsDirectory#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName4">
</cfif>

<cfif form.FileName5 is not "">
<cffile destination="#UploadsDirectory#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName5">
</cfif>

<cfif form.FileName6 is not "">
<cffile destination="#UploadsDirectory#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName6">
</cfif>

<cfif form.FileName7 is not "">
<cffile destination="#UploadsDirectory#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName7">
</cfif>

<cfif form.FileName8 is not "">
<cffile destination="#UploadsDirectory#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName8">
</cfif>

<cfif form.FileName9 is not "">
<cffile destination="#UploadsDirectory#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName9">
</cfif>

<cfif form.FileName10 is not "">
<cffile destination="#UploadsDirectory#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName10">
</cfif>

<cfif form.FileName11 is not "">
<cffile destination="#UploadsDirectory#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName11">
</cfif>

<cfif form.FileName12 is not "">
<cffile destination="#UploadsDirectory#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName12">
</cfif>

<cfif form.FileName13 is not "">
<cffile destination="#UploadsDirectory#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName13">
</cfif>

<cfif form.FileName14 is not "">
<cffile destination="#UploadsDirectory#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName14">
</cfif>

<cfif form.FileName15 is not "">
<cffile destination="#UploadsDirectory#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName15">
</cfif>

<cfif form.FileName16 is not "">
<cffile destination="#UploadsDirectory#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName16">
</cfif>

<cfif form.FileName17 is not "">
<cffile destination="#UploadsDirectory#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName17">
</cfif>

<cfif form.FileName18 is not "">
<cffile destination="#UploadsDirectory#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName18">
</cfif>

<cfif form.FileName19 is not "">
<cffile destination="#UploadsDirectory#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName19">
</cfif>

<cfif form.FileName20 is not "">
<cffile destination="#UploadsDirectory#\gallery\#qGetShowcaseSetupInfo.Gallery#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#URL.Portfolio#\RawImages\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName20">
</cfif>

<!--- Notify Photo-Eye that images were uploaded --->
<!--- <cfinclude template="EmailPortfolioUploaded.cfm"> --->

<cfinclude template="closewindow.cfm">
<center>
File upload was successful!
<br><br>
<!--- If you have completed all four Online Application steps, <a href="mailto:photoshowcase@photoeye.com?subject=#qGetShowcaseSetupInfo.Firstname# #qGetShowcaseSetupInfo.Lastname# Images are Uploaded to #qGetShowcaseSetupInfo.Gallery#">notify 
      photo-eye</a>. 

<br><br> --->

Your images are now ready to be distilled into the custom sizes required for our online portfolio system. You will be contacted by our staff, usually within one week of the upload, when your images are ready to be sequenced and described. <br><br>

Click to <a href="multipleportfolios.cfm?id=#qGetShowcaseSetupInfo.custnumber#">add more portfolios</a>. Or return to photo-eye <a href="../../index.cfm">Gallery</a> or <a href="../../../indexbookstore.html">Bookstore</a>.

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
