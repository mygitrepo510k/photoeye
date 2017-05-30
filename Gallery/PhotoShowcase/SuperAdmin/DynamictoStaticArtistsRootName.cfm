<!--- <cfquery name="qGetArtist" datasource="photoeyecom" dbtype="ODBC">
SELECT * from gallerysetup where custnumber=#url.id# ;
</cfquery> --->

<CFSET xFirstname=REPLACE(qGetArtist.FirstName," ","%20","ALL")>
<CFSET xLastname=REPLACE(qGetArtist.LastName," ","%20","ALL")>

<cfhttp
URL="HTTP://www.photoeye.com/Gallery/Photoshowcase/SuperAdmin/ArtistRootName.cfm?id=#qGetArtist.custnumber#&FirstName=#xfirstname#&LastName=#xlastname#"

path="d:\html\users\cfxa905\photoeyecom\html\Gallery\Photoshowcase\SuperAdmin\" file="temp.txt"

METHOD="Get">

</cfhttp>


<!--- read the page into a variable named contents--->
<cffile action="read"
file="d:\html\users\cfxa905\photoeyecom\html\Gallery\Photoshowcase\SuperAdmin\temp.txt" variable="contents">

<!--- Create the Directory in the Root with the Artist's Name if it doesn't already exist--->

<cfset thisDirectory='d:\html\users\cfxa905\photoeyecom\html\#ArtistSubdirectory#'>

<cfif DirectoryExists(thisDirectory) is 'NO'>
	<cfdirectory action="CREATE" DIRECTORY='d:\html\users\cfxa905\photoeyecom\html\#ArtistSubdirectory#'>
</cfif>

<!--- write the page --->
<cffile action="WRITE" file="d:\html\users\cfxa905\photoeyecom\html\#ArtistSubdirectory#\Index.html" 
output="#contents#" addnewline="Yes"> 

