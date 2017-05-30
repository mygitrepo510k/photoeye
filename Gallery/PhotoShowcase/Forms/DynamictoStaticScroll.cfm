<CFQUERY NAME="qGallerySetup"  DATASOURCE="photoeyecom">
  SELECT * FROM GallerySetup
  WHERE CustNumber = '#form.custnumber#'
</CFQUERY>

<CFQUERY NAME="qGalleryPortfolio"  DATASOURCE="photoeyecom">
  SELECT Subdirectory FROM GalleryPortfolio
  WHERE CustNumber = '#custnumber#' and UPPER(SubDirectory)='PORTFOLIO1'
</CFQUERY>


<!---scroll3--->

<cfhttp
URL="HTTP://photoeyecom.dom.cfxhosting.com/gallery/#qGallerySetup.gallery#/artists/#qGallerySetup.subdirectory#/scroll3.cfm?id=#form.custnumber#&Portfolio='#url.portfolio#'"
METHOD="Get">

<cfset Contents="#CFHTTP.FILECONTENT#">
</cfhttp>

<cffile action="WRITE" file="d:\html\users\cfxa905\photoeyecom\html\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\scroll3.html" 
output="#contents#" addnewline="Yes">

<!---scroll640--->

<cfhttp
URL="HTTP://www.photoeye.com/gallery/#qGallerySetup.gallery#/artists/#qGallerySetup.subdirectory#/scroll640.cfm?id=#form.custnumber#&Portfolio='#url.portfolio#'"
METHOD="Get">

<cfset Contents="#CFHTTP.FILECONTENT#">
</cfhttp>

<cffile action="WRITE" file="d:\html\users\cfxa905\photoeyecom\html\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\scroll640.html" 
output="#contents#" addnewline="Yes">


<!--- <!---Image Info Middle--->

<cfhttp
URL="HTTP://www.photoeye.com/gallery/#qGallerySetup.gallery#/artists/#qGallerySetup.subdirectory#/#qGalleryPortfolio.subdirectory#/PrintInfoMiddle.cfm?id=#custnumber#"
METHOD="Get">

<cfset Contents="#CFHTTP.FILECONTENT#">
</cfhttp>

<cffile action="WRITE" file="d:\cfxa905\photoeyecom\html\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\#qGalleryPortfolio.subdirectory#\PrintInfoMiddle.html" 
output="#contents#" addnewline="Yes">

 --->