<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Upload Photos Template</title>
</head>

<body>
<cfoutput>

<!---Check to see if directory already exists, if not, create it--->
<CFIF DirectoryExists("d:\http\photoeye\gallery\photoshowcase\ForReview\#form.name#\") is "No">

<CFDIRECTORY ACTION="Create"
    DIRECTORY="d:\http\photoeye\gallery\photoshowcase\ForReview\#form.name#\">

</cfif>
	
<cffile destination="d:\http\photoeye\gallery\photoshowcase\ForReview\#form.name#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="Filename1">

<cfif form.filename2 is not "">
<cffile destination="d:\http\photoeye\gallery\photoshowcase\ForReview\#form.name#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="Filename2">
</cfif>

<cfif form.filename3 is not "">
<cffile destination="d:\http\photoeye\gallery\photoshowcase\ForReview\#form.name#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="Filename3">
</cfif>

<cfif form.filename4 is not "">
<cffile destination="d:\http\photoeye\gallery\photoshowcase\ForReview\#form.name#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="Filename4">
</cfif>

<cfif form.filename5 is not "">
<cffile destination="d:\http\photoeye\gallery\photoshowcase\ForReview\#form.name#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="Filename5">
</cfif>

<cfif form.filename6 is not "">
<cffile destination="d:\http\photoeye\gallery\photoshowcase\ForReview\#form.name#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="Filename6">
</cfif>

<cfif form.filename7 is not "">
<cffile destination="d:\http\photoeye\gallery\photoshowcase\ForReview\#form.name#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="Filename7">
</cfif>

<cfif form.filename8 is not "">
<cffile destination="d:\http\photoeye\gallery\photoshowcase\ForReview\#form.name#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="Filename8">
</cfif>

<cfif form.filename9 is not "">
<cffile destination="d:\http\photoeye\gallery\photoshowcase\ForReview\#form.name#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="Filename9">
</cfif>

<cfif form.filename10 is not "">
<cffile destination="d:\http\photoeye\gallery\photoshowcase\ForReview\#form.name#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="Filename10">
</cfif>

<cfif form.filename11 is not "">
<cffile destination="d:\http\photoeye\gallery\photoshowcase\ForReview\#form.name#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="Filename11">
</cfif>

<cfif form.filename12 is not "">
<cffile destination="d:\http\photoeye\gallery\photoshowcase\ForReview\#form.name#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="Filename12">
</cfif>

<cfif form.filename13 is not "">
<cffile destination="d:\http\photoeye\gallery\photoshowcase\ForReview\#form.name#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="Filename13">
</cfif>

<cfif form.filename14 is not "">
<cffile destination="d:\http\photoeye\gallery\photoshowcase\ForReview\#form.name#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="Filename14">
</cfif>

<cfif form.filename15 is not "">
<cffile destination="d:\http\photoeye\gallery\photoshowcase\ForReview\#form.name#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="Filename15">
</cfif>

<cfif form.filename16 is not "">
<cffile destination="d:\http\photoeye\gallery\photoshowcase\ForReview\#form.name#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="Filename16">
</cfif>

<cfif form.filename17 is not "">
<cffile destination="d:\http\photoeye\gallery\photoshowcase\ForReview\#form.name#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="Filename17">
</cfif>

<cfif form.filename18 is not "">
<cffile destination="d:\http\photoeye\gallery\photoshowcase\ForReview\#form.name#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="Filename18">
</cfif>

<cfif form.filename19 is not "">
<cffile destination="d:\http\photoeye\gallery\photoshowcase\ForReview\#form.name#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="Filename19">
</cfif>

<cfif form.filename20 is not "">
<cffile destination="d:\http\photoeye\gallery\photoshowcase\ForReview\#form.name#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="Filename20">
</cfif>

<center>
File upload was successful!
</center>
<hr>

#file.serverdirectory#\#file.serverfile#<br>
#file.clientdirectory#<br>
#file.clientfilename#
</cfoutput>
</body>
</html>
