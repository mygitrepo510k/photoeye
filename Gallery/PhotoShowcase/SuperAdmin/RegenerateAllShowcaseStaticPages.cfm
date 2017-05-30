

<CFQUERY NAME="qGallerySetup"  DATASOURCE="photoeyecom">
  SELECT * FROM GallerySetup
  WHERE LEN(RTRIM(SUBDIRECTORY))>0 AND LEN(RTRIM(GALLERY))>0 AND CUSTNUMBER>0
</CFQUERY>

<cfloop query="qGallerySetup">

<CFQUERY NAME="qGalleryPortfolio"  DATASOURCE="photoeyecom">
  SELECT Subdirectory FROM GalleryPortfolio
  WHERE CustNumber = #qGallerySetup.custnumber# and UPPER(SubDirectory)='PORTFOLIO1'
</CFQUERY>


<!--- Build the HTML Code--->
<!--- Go down the list in terms of html files that are needed to be built--->

<!---scroll3--->

<cfhttp
URL="HTTP://www.photoeye.com/gallery/#qGallerySetup.gallery#/artists/#qGallerySetup.subdirectory#/#qGalleryPortfolio.subdirectory#/scroll3.cfm?id=#custnumber#"
METHOD="Get">

<cfset Contents="#CFHTTP.FILECONTENT#">
</cfhttp>

<cffile action="WRITE" file="e:\http\photoeye\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\#qGalleryPortfolio.subdirectory#\scroll3.html" 
output="#contents#" addnewline="Yes">

<!---scroll640--->

<cfhttp
URL="HTTP://www.photoeye.com/gallery/#qGallerySetup.gallery#/artists/#qGallerySetup.subdirectory#/#qGalleryPortfolio.subdirectory#/scroll640.cfm?id=#custnumber#"
METHOD="Get">

<cfset Contents="#CFHTTP.FILECONTENT#">
</cfhttp>

<cffile action="WRITE" file="e:\http\photoeye\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\#qGalleryPortfolio.subdirectory#\scroll640.html" 
output="#contents#" addnewline="Yes">


<!---bio--->

<cfhttp
URL="HTTP://www.photoeye.com/gallery/#qGallerySetup.gallery#/artists/#qGallerySetup.subdirectory#/bio.cfm?id=#custnumber#"
METHOD="Get">

<cfset Contents="#CFHTTP.FILECONTENT#">
</cfhttp>

<cffile action="WRITE" file="e:\http\photoeye\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\bio.html" 
output="#contents#" addnewline="Yes">

<!---books--->

<cfhttp
URL="HTTP://www.photoeye.com/gallery/#qGallerySetup.gallery#/artists/#qGallerySetup.subdirectory#/books.cfm?id=#custnumber#"
METHOD="Get">

<cfset Contents="#CFHTTP.FILECONTENT#">
</cfhttp>

<cffile action="WRITE" file="e:\http\photoeye\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\books.html" 
output="#contents#" addnewline="Yes">

<!---statement--->

<cfhttp
URL="HTTP://www.photoeye.com/gallery/#qGallerySetup.gallery#/artists/#qGallerySetup.subdirectory#/statement.cfm?id=#custnumber#"
METHOD="Get">

<cfset Contents="#CFHTTP.FILECONTENT#">
</cfhttp>

<cffile action="WRITE" file="e:\http\photoeye\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\statement.html" 
output="#contents#" addnewline="Yes">

<!---header1--->

<cfhttp
URL="HTTP://www.photoeye.com/gallery/#qGallerySetup.gallery#/artists/#qGallerySetup.subdirectory#/#qGalleryPortfolio.subdirectory#/header1.cfm?id=#custnumber#&image=1&imagePosition=1&Door=1"
METHOD="Get">

<cfset Contents="#CFHTTP.FILECONTENT#">
</cfhttp>

<cffile action="WRITE" file="e:\http\photoeye\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\#qGalleryPortfolio.subdirectory#\Header1.html" 
output="#contents#" addnewline="Yes">

<!---header640--->

<cfhttp
URL="HTTP://www.photoeye.com/gallery/#qGallerySetup.gallery#/artists/#qGallerySetup.subdirectory#/#qGallerySetup.subdirectory#/#qGalleryPortfolio.subdirectory#/header640.cfm?id=#custnumber#&image=1&imagePosition=1&Door=1"
METHOD="Get">

<cfset Contents="#CFHTTP.FILECONTENT#">
</cfhttp>

<cffile action="WRITE" file="e:\http\photoeye\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\#qGalleryPortfolio.subdirectory#\Header640.html" 
output="#contents#" addnewline="Yes">

<!---bottom--->

<cfhttp
URL="HTTP://www.photoeye.com/gallery/#qGallerySetup.gallery#/artists/#qGallerySetup.subdirectory#/bottom.cfm?id=#custnumber#"
METHOD="Get">

<cfset Contents="#CFHTTP.FILECONTENT#">
</cfhttp>

<cffile action="WRITE" file="e:\http\photoeye\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\bottom.html" 
output="#contents#" addnewline="Yes"> 

<!---bottom640--->

<cfhttp
URL="HTTP://www.photoeye.com/gallery/#qGallerySetup.gallery#/artists/#qGallerySetup.subdirectory#/bottom640.cfm?id=#custnumber#"
METHOD="Get">

<cfset Contents="#CFHTTP.FILECONTENT#">
</cfhttp>

<cffile action="WRITE" file="e:\http\photoeye\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\bottom640.html" 
output="#contents#" addnewline="Yes"> 


<!---Left--->

<cfhttp
URL="HTTP://www.photoeye.com/gallery/#qGallerySetup.gallery#/artists/#qGallerySetup.subdirectory#/left.cfm?id=#custnumber#"
METHOD="Get">

<cfset Contents="#CFHTTP.FILECONTENT#">
</cfhttp>

<cffile action="WRITE" file="e:\http\photoeye\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\left.html" 
output="#contents#" addnewline="Yes"> 
</cfloop>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>


Finished Regenerating All Showcase Static Pages!


</body>
</html>

