<CFQUERY NAME="qGetShowcase"
         DATASOURCE="photoeyecom">

SELECT *
FROM GalleryIndividualPhotos
WHERE CUSTNUMBER='10045'
</cfquery>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase</title>
</head>

<body bgcolor="Silver" link="#000080" vlink="#000080">

<p align="center">
<center>

You have created the following portfolio showcases: 
<cfoutput>
<cfset cPortfolioName=''>

<cfloop query="qgetshowcase">
<!--- cPortfolioName=#qGetShowcase.PortfolioName#  <br>
GetShowcase.Title = #qGetShowcase.Title#<br> --->
<cfif #qgetshowcase.PortfolioName# is not cPortfolioName>
		#qGetShowcase.Title#<br>
		#qGetShowcase.title#<br>
</cfif>
<cfset cPortfolioName=#qGetShowcase.Title#>
</cfloop>
</cfoutput>

</center>
</p>
</body>
</html>
