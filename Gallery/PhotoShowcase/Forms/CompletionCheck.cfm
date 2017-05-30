<!--- Check to see which type of custnumber variable there is--->
<cfif IsDefined("form.custnumber")>
	<cfset custnumber="#form.custnumber#">
<cfelse>
	<cfset custnumber=url.custnumber>
</cfif>

<CFQUERY NAME="qGallerySetup"  DATASOURCE="photoeyecom">
  SELECT * FROM GallerySetup
  WHERE CustNumber = '#custnumber#'
</CFQUERY>

<cfif qGallerySetup.Gallery is "REPRESENTEDARTISTS">
	<cfset xGallery = 1>
<cfelseif qGallerySetup.Gallery is "PHOTOSHOWCASE">
	<cfset xGallery = 2>
<cfelseif qGallerySetup.Gallery is "MAGNUMARTISTS">
	<cfset xGallery = 3>
<cfelse>
	<cfset xGallery = 0>
</cfif>

<CFQUERY NAME="qGalleryPortfolio"  DATASOURCE="photoeyecom">
  SELECT SubDirectory, Step11 FROM GalleryPortfolio
  WHERE CustNumber = '#custnumber#' and Subdirectory='#URL.Portfolio#'
</CFQUERY>

<CFQUERY NAME="qGalleryIndividualPhotos"  DATASOURCE="photoeyecom">
  SELECT * FROM GalleryIndividualPhotos
  WHERE CustNumber = '#custnumber#' and PortfolioName='#URL.Portfolio#'
</CFQUERY>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase | Completion Check</title>
</head>

<body>
<cfoutput>

<cfset error=0>

<cfif qGallerySetup.step1 is 0>
	<cfset error=1>
</cfif>

<cfif qGallerySetup.step2 is 0>
	<cfset error=1>
</cfif> 

<cfif qGallerySetup.step3 is 0>
	<cfset error=1>
</cfif>

  <cfif qGallerySetup.step4 is 0>
	<cfset error=1>
</cfif>  

<cfif qGallerySetup.step5 is 0>
	<cfset error=1>
</cfif>

<cfif qGallerySetup.step6 is 0>
	<cfset error=1>
</cfif>

<cfif qGallerySetup.step7 is 0>
	<cfset error=1>
</cfif>

<cfif qGallerySetup.step8 is 0>
	<cfset error=1>
</cfif>

<cfif qGallerySetup.step9 is 0>
	<cfset error=1>
</cfif>

<cfif qGallerySetup.step10 is 0>
	<cfset error=1> 
</cfif>

<cfif qGalleryPortfolio.step11 is 0>
	<cfset error=1>
</cfif>

	<cfloop query="qGalleryIndividualPhotos">
		<cfif qGalleryIndividualPhotos.completed is 0>
				<cfset error=1>
		</cfif>
	</cfloop>

<!--- <cfif qGallerySetup.step12 is 0>
	<cfset error=1>
</cfif> --->
	

 <!--- Build the HTML Code--->
<!--- Go down the list in terms of html files that are needed to be built--->

<!--- <!---scroll3--->

<cfhttp
URL="HTTP://www.photoeye.com/gallery/#qGallerySetup.gallery#/artists/#qGallerySetup.subdirectory#/scroll3.cfm?id=#custnumber#"
METHOD="Get">

<cfset Contents="#CFHTTP.FILECONTENT#">
</cfhttp>

<cffile action="WRITE" file="e:\http\photoeye\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\scroll3.html" 
output="#contents#" addnewline="Yes">

<!---scroll640--->

<cfhttp
URL="HTTP://www.photoeye.com/gallery/#qGallerySetup.gallery#/artists/#qGallerySetup.subdirectory#/scroll640.cfm?id=#custnumber#"
METHOD="Get">

<cfset Contents="#CFHTTP.FILECONTENT#">
</cfhttp>

<cffile action="WRITE" file="e:\http\photoeye\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\scroll640.html" 
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
URL="HTTP://www.photoeye.com/gallery/#qGallerySetup.gallery#/artists/#qGallerySetup.subdirectory#/header1.cfm?id=#custnumber#&image=1&imagePosition=1&Door=1"
METHOD="Get">

<cfset Contents="#CFHTTP.FILECONTENT#">
</cfhttp>

<cffile action="WRITE" file="e:\http\photoeye\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\Header1.html" 
output="#contents#" addnewline="Yes">

<!---header640--->

<cfhttp
URL="HTTP://www.photoeye.com/gallery/#qGallerySetup.gallery#/artists/#qGallerySetup.subdirectory#/header640.cfm?id=#custnumber#&image=1&imagePosition=1&Door=1"
METHOD="Get">

<cfset Contents="#CFHTTP.FILECONTENT#">
</cfhttp>

<cffile action="WRITE" file="e:\http\photoeye\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\Header640.html" 
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
output="#contents#" addnewline="Yes">  --->

<!---  <cfinclude template="DynamictoStaticAll.cfm">    --->
	
<cfif #error# is 1>

	<center>
	<br>
	<br>
	<br>
	<br>
	<table width="600">
	<tr><td>
	<font color="Black" size="4" face="Verdana, Helvetica, Arial, Sans-Serif"><b>
	Your Showcase is incomplete...<br><br>
	<img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"><br><br>
	</b></font>

	<font face="Verdana, Helvetica, Arial, Sans-Serif" Size="2" color="Black">
	Before viewing your showcase each step must be completed, even if it doesn't pertain to you and no information has been added to the page. Simply click the &quot;Save Changes&quot; button at the bottom of each page to complete the step. <br>
	<br>
	The following step(s) have not been completed:<br><br>
		<font face="Verdana, Helvetica, Arial, Sans-Serif" Size="2" color="Red"><b>

	<cfif qGallerySetup.step1 is 0>
		<a href="step1basicdata.cfm?custnumber=#custnumber#">Basic Data </a><br><br>
	</cfif>

<!---	<cfif qGallerySetup.step2 is 0>
		<a href="step2Education.cfm?custnumber=#custnumber#">Education</a><br><br>
	</cfif> --->

	<cfif qGallerySetup.step3 is 0>
		<a href="step3CollectionsURLNew.cfm?custnumber=#custnumber#">Collections</a> <br><br>
	</cfif>

	<cfif qGallerySetup.step4 is 0>
		<a href="step4SoloShowsURLNew.cfm?custnumber=#custnumber#">Solo Exhibitions</a> <br><br>
	</cfif>
	
	<cfif qGallerySetup.step5 is 0>
		<a href="step5GroupShowsURLNew.cfm?custnumber=#custnumber#">Group Exhibitions</a> <br><br>
	</cfif>

 <cfif qGallerySetup.step6 is 0>
		<a href="step6AwardsURLNew.cfm?custnumber=#custnumber#">Awards</a><br><br>
	</cfif>

	<cfif qGallerySetup.step7 is 0>
		<a href="step7BibliographyURLNew.cfm?custnumber=#custnumber#">Bibliography</a> <br><br>
	</cfif>

	<cfif qGallerySetup.step8 is 0>
		<a href="step8StatementsURLNew.cfm?custnumber=#custnumber#">Statements</a> <br><br>
	</cfif> 
	
	<cfif qGallerySetup.step9 is 0>
		<a href="step2ChronologyURLNew.cfm?custnumber=#custnumber#">Chronology</a><br><br>
	</cfif> 

	<cfif qGallerySetup.step10 is 0>
		<a href="step9RecommendedBooksURLNew.cfm?custnumber=#custnumber#">Recommended Books</a> <br><br>
	</cfif>

	<cfif qGalleryPortfolio.step11 is 0>
		<a href="step11DefaultTemplateURL.cfm?custnumber=#custnumber#&Portfolio='#url.portfolio#'">
			Default&nbsp;Artwork&nbsp;Template</a><br><br>
	</cfif>

	<!--- <cfif qGallerySetup.step11 is 0>
		<a href="step11DefaultTemplateURL.cfm?custnumber=#custnumber#">Default 
      Template </a><br><br>
	</cfif> --->
	
	<cfset header=1>
	<cfloop query="qGalleryIndividualPhotos">

		<cfif qGalleryIndividualPhotos.completed is 0>
		
		<cfif #header# is 1>
			Step 11 - 
			Edit the text info for the following images:<br><br>
		</cfif>
				<a href="Step12artworkdescriptionformsequence.cfm?custnumber=#custnumber#&imagenumber=#qGalleryIndividualPhotos.imagenumber#&imagenumbercounter=#qGalleryIndividualPhotos.imagenumber#&portfolio=#URL.Portfolio#">
				Image #qGalleryIndividualPhotos.ImageNumber#</a><br><br>
     		 </a>
		  <cfset header=0>
		</cfif>

	</cfloop>

<!--- 	<cfif qGallerySetup.step12 is 0>
		<a href="Step10ChangeImageOrderURL.cfm?custnumber=<cfoutput>#custnumber#</cfoutput>">Sequence/Edit Text</a><br><br>
	</cfif> --->
	</font>
	</td></tr>  
	</table>
	</center>
</cfif>


<cfif #error# is 0>	



	<center>
	<br>
	<br>
	<br>
	<br>
	<table width="600">
	<tr><td>
	<font color="Black" size="4" face="Verdana, Helvetica, Arial, Sans-Serif"><b>
	Congratulations! All steps have been completed. You are ready to view your Showcase!<br><br>
	<img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"><br><br>
	</b></font>
<form method="post" action="../../Forms/index.cfm?id=#custnumber#&image=1&imagePosition=1&Door=0&Portfolio=#url.portfolio#&Keyword=None&Setup=1&Gallery=#xGallery#">
	     <INPUT TYPE="SUBMIT" VALUE="View Your Showcase!">
	</form>
	<br>
	<br>
	</td>
	</tr>
	</table>
	</center>

</cfif>

</cfoutput>
</font>

</body>
</html>


<!---pages_middle/image1.cfm--->
<!--- 
<cfhttp
URL="HTTP://www.photoeye.com/gallery/#qGallerySetup.gallery#/artists/#qGallerySetup.subdirectory#/pages_middle/image1.cfm?id=#custnumber#&image=1&imagePosition=1&Door=1"
METHOD="Get">

<cfset Contents="#CFHTTP.FILECONTENT#">
</cfhttp> 

<cffile action="WRITE" file="e:\http\photoeye\gallery\#qGallerySetup.gallery#\artists\#qGallerySetup.subdirectory#\pages_middle\image1.html" 
output="#contents#" addnewline="Yes">   --->