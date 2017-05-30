<CFQUERY NAME="qGallerySetup"  DATASOURCE="photoeyecom">
  SELECT * FROM GallerySetup
  WHERE CustNumber = '#form.custnumber#'
</CFQUERY>

<!--- Build the HTML Code--->
<!--- Go down the list in terms of html files that are needed to be built--->


<!---books--->

<cfhttp
URL="HTTP://photoeyecom.dom.cfxhosting.com/gallery/#qGallerySetup.gallery#/artists/#qGallerySetup.subdirectory#/books.cfm?id=#form.custnumber#"
METHOD="Get">

<cfset Contents="#CFHTTP.FILECONTENT#">
</cfhttp>

<cffile action="WRITE" file="d:\html\users\cfxa905\photoeyecom\html\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\books.html" 
output="#contents#" addnewline="Yes">

<!---bio--->

<cfhttp
URL="HTTP://photoeyecom.dom.cfxhosting.com/gallery/#qGallerySetup.gallery#/artists/#qGallerySetup.subdirectory#/bio.cfm?id=#form.custnumber#"
METHOD="Get">

<cfset Contents="#CFHTTP.FILECONTENT#">
</cfhttp>

<cffile action="WRITE" file="d:\html\users\cfxa905\photoeyecom\html\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\bio.html" 
output="#contents#" addnewline="Yes">
