<!--- Check to see which type of custnumber variable there is--->
<cfif IsDefined("form.custnumber")>
	<cfset custnumber="#custnumber#">
<cfelse>
	<cfset custnumber=url.custnumber>
</cfif>

<CFQUERY NAME="qGallerySetup"  DATASOURCE="photoeyecom">
  SELECT * FROM GallerySetup
  WHERE CustNumber = '#custnumber#'
</CFQUERY>

<CFQUERY NAME="qGalleryPortfolio"  DATASOURCE="photoeyecom">
  SELECT Subdirectory FROM GalleryPortfolio
  WHERE CustNumber = '#custnumber#' and SubDirectory='#url.portfolio#'
</CFQUERY>


<!--- Build the HTML Code--->
<!--- Go down the list in terms of html files that are needed to be built--->

<!---scroll3--->


<!--- <cfhttp
URL="HTTP://www.photoeye.com/gallery/#qGallerySetup.gallery#/artists/#qGallerySetup.subdirectory#/#qGalleryPortfolio.subdirectory#/scroll3.cfm?id=#custnumber#&Portfolio=#url.portfolio#" --->

<!--- <cfhttp
PATH="d:\html\users\username\domainnamecom\html\gallery/#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\#qGalleryPortfolio.subdirectory#"
FILE="scroll3.cfm?id=#custnumber#&Portfolio=#url.portfolio#"
METHOD="Get">



<cfset Contents="#CFHTTP.FILECONTENT#">
</cfhttp> --->

<!--- <cffile action="WRITE" file="d:\html\users\cfxa905\photoeyecom\html\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\#qGalleryPortfolio.subdirectory#\scroll3.html" 
output="#contents#" addnewline="Yes"> 
 --->


<!--- get the scroll3 page --->

<cfhttp
URL="HTTP://www.photoeye.com/gallery/#qGallerySetup.gallery#/artists/#qGallerySetup.subdirectory#/#qGalleryPortfolio.subdirectory#/scroll3.cfm?id=#custnumber#&Portfolio=#url.portfolio#"

path="d:\html\users\cfxa905\photoeyecom\html\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\#qGalleryPortfolio.subdirectory#\" file="temp.txt"

METHOD="Get">

</cfhttp>

<!--- read the page into a variable named contents--->
<cffile action="read"
file="d:\html\users\cfxa905\photoeyecom\html\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\#qGalleryPortfolio.subdirectory#\temp.txt" variable="contents">


<!--- write the page --->
<cffile action="WRITE" file="d:\html\users\cfxa905\photoeyecom\html\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\#qGalleryPortfolio.subdirectory#\scroll3.html" 
output="#contents#" addnewline="Yes"> 

<!--- get the scroll640 page --->

<cfhttp
URL="HTTP://www.photoeye.com/gallery/#qGallerySetup.gallery#/artists/#qGallerySetup.subdirectory#/#qGalleryPortfolio.subdirectory#/scroll640.cfm?id=#custnumber#&Portfolio=#url.portfolio#"

path="d:\html\users\cfxa905\photoeyecom\html\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\#qGalleryPortfolio.subdirectory#\" file="temp.txt"

METHOD="Get">

</cfhttp>

<!--- read the page into a variable named contents--->
<cffile action="read"
file="d:\html\users\cfxa905\photoeyecom\html\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\#qGalleryPortfolio.subdirectory#\temp.txt" variable="contents">


<!--- write the page --->
<cffile action="WRITE" file="d:\html\users\cfxa905\photoeyecom\html\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\#qGalleryPortfolio.subdirectory#\scroll640.html" 
output="#contents#" addnewline="Yes">  
 

<!--- get the bio page --->

<cfhttp
URL="HTTP://www.photoeye.com/gallery/forms/bio.cfm?id=#custnumber#&Portfolio=#url.portfolio#"

path="d:\html\users\cfxa905\photoeyecom\html\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\" file="temp.txt"

METHOD="Get">

</cfhttp>

<!--- read the page into a variable named contents--->
<cffile action="read"
file="d:\html\users\cfxa905\photoeyecom\html\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\temp.txt" variable="contents">


<!--- write the page --->
<cffile action="WRITE" file="d:\html\users\cfxa905\photoeyecom\html\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\bio.html" 
output="#contents#" addnewline="Yes">  



<!--- get the statement page --->

<cfhttp
URL="HTTP://www.photoeye.com/gallery/#qGallerySetup.gallery#/artists/#qGallerySetup.subdirectory#/statement.cfm?id=#custnumber#&Portfolio=#url.portfolio#"

path="d:\html\users\cfxa905\photoeyecom\html\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\" file="temp.txt"

METHOD="Get">

</cfhttp>

<!--- read the page into a variable named contents--->
<cffile action="read"
file="d:\html\users\cfxa905\photoeyecom\html\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\temp.txt" variable="contents">


<!--- write the page --->
<cffile action="WRITE" file="d:\html\users\cfxa905\photoeyecom\html\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\statement.html" 
output="#contents#" addnewline="Yes"> 



<!--- get the image1.cfm page --->

<cfhttp
URL="HTTP://www.photoeye.com/gallery/#qGallerySetup.gallery#/artists/#qGallerySetup.subdirectory#/#qGalleryPortfolio.subdirectory#/pages_middle\image1.cfm?id=#custnumber#&Portfolio=#url.portfolio#"

path="d:\html\users\cfxa905\photoeyecom\html\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\#qGalleryPortfolio.subdirectory#\" file="temp.txt"

METHOD="Get">

</cfhttp>

<!--- read the page into a variable named contents--->
<cffile action="read"
file="d:\html\users\cfxa905\photoeyecom\html\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\temp.txt" variable="contents">


<!--- write the page --->
<cffile action="WRITE" file="d:\html\users\cfxa905\photoeyecom\html\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\#qGalleryPortfolio.subdirectory#\pages_middle\image1.html" 
output="#contents#" addnewline="Yes"> 



<!--- get the books page --->

<cfhttp
URL="HTTP://www.photoeye.com/gallery/#qGallerySetup.gallery#/artists/#qGallerySetup.subdirectory#/books.cfm?id=#custnumber#&Portfolio=#url.portfolio#"

path="d:\html\users\cfxa905\photoeyecom\html\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\" file="temp.txt"

METHOD="Get">

</cfhttp>

<!--- read the page into a variable named contents--->
<cffile action="read"
file="d:\html\users\cfxa905\photoeyecom\html\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\temp.txt" variable="contents">


<!--- write the page --->
<cffile action="WRITE" file="d:\html\users\cfxa905\photoeyecom\html\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\books.html" 
output="#contents#" addnewline="Yes"> 

<!--- <!--- get the header page --->

<cfhttp
URL="HTTP://www.photoeye.com/gallery/#qGallerySetup.gallery#/artists/#qGallerySetup.subdirectory#/#qGalleryPortfolio.subdirectory#/header1.cfm?id=#custnumber#&image=1&imagePosition=1&Door=1&Portfolio='#url.portfolio#'"

path="d:\html\users\cfxa905\photoeyecom\html\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\" file="temp.txt"

METHOD="Get">

</cfhttp>

<!--- read the page into a variable named contents--->
<cffile action="read"
file="d:\html\users\cfxa905\photoeyecom\html\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\temp.txt" variable="contents">


<!--- write the page --->
<cffile action="WRITE" file="d:\html\users\cfxa905\photoeyecom\html\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\#qGalleryPortfolio.subdirectory#\header1.html?id=#custnumber#&image=1&imagePosition=1&Door=1&Portfolio='#url.portfolio#'"
output="#contents#" addnewline="Yes">  --->



<!---

<!---header640--->

<cfhttp
URL="HTTP://photoeyecom.dom.cfxhosting.com/gallery/#qGallerySetup.gallery#/artists/#qGallerySetup.subdirectory#/#qGallerySetup.subdirectory#/#qGalleryPortfolio.subdirectory#/header640.cfm?id=#custnumber#&image=1&imagePosition=1&Door=1&Portfolio='#url.portfolio#'"
METHOD="Get">

<cfset Contents="#CFHTTP.FILECONTENT#">
</cfhttp>
<!--- 
<cffile action="WRITE" file="d:\html\users\cfxa905\photoeyecom\html\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\#qGalleryPortfolio.subdirectory#\Header640.html" 
output="#contents#" addnewline="Yes"> --->

<!---bottom--->

<cfhttp
URL="HTTP://photoeyecom.dom.cfxhosting.com/gallery/#qGallerySetup.gallery#/artists/#qGallerySetup.subdirectory#/bottom.cfm?id=#custnumber#&Portfolio='#url.portfolio#'"
METHOD="Get">

<cfset Contents="#CFHTTP.FILECONTENT#">
</cfhttp>

<!--- <cffile action="WRITE" file="d:\cfxa905\photoeyecom\html\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\bottom.html" 
output="#contents#" addnewline="Yes">  --->

<!---bottom640--->

<cfhttp
URL="HTTP://photoeyecom.dom.cfxhosting.com/gallery/#qGallerySetup.gallery#/artists/#qGallerySetup.subdirectory#/bottom640.cfm?id=#custnumber#&Portfolio='#url.portfolio#'"
METHOD="Get">

<cfset Contents="#CFHTTP.FILECONTENT#">
</cfhttp>

<!--- <cffile action="WRITE" file="d:\html\users\cfxa905\photoeyecom\html\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\bottom640.html" 
output="#contents#" addnewline="Yes">  --->


<!---Left--->

<cfhttp
URL="HTTP://photoeyecom.dom.cfxhosting.com/gallery/#qGallerySetup.gallery#/artists/#qGallerySetup.subdirectory#/left.cfm?id=#custnumber#&Portfolio='#url.portfolio#'"
METHOD="Get">

<cfset Contents="#CFHTTP.FILECONTENT#">
</cfhttp>
<!--- 
<cffile action="WRITE" file="d:\html\users\cfxa905\photoeyecom\html\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\left.html" 
output="#contents#" addnewline="Yes">  ---> --->

