<CFIF ISDefined("url.Custnumber")>
	<CFSET xCustNumber = url.Custnumber>
<CFELSEIF isDefined("form.Custnumber")>
	<CFSET xCustNumber = form.Custnumber>
</CFIF>

<CFQUERY NAME="qGetShowcaseSetup"
         DATASOURCE="photoeyecom">

SELECT *
FROM GallerySetup
WHERE Custnumber = #xCustnumber#
</cfquery>

<CFQUERY NAME="qGetShowcasePortfolio"
         DATASOURCE="photoeyecom">

SELECT *
FROM GalleryPortfolio
WHERE Custnumber = #xCustnumber# and SubDirectory='#URL.Portfolio#'
</cfquery>


<CFQUERY NAME="qShowcaseGalleryIndividualPhotos"  DATASOURCE="photoeyecom">
  	SELECT *
 	FROM GalleryIndividualPhotos where custnumber='#xCustnumber#' and PortfolioName='#URL.Portfolio#'
	order by imageposition;
</CFQUERY>	

<CFQUERY NAME="qUpdatePhotographersSetupInfo"  DATASOURCE="photoeyecom">
  UPDATE GallerySetup
   SET Step12='1'
  WHERE CustNumber = '#xCustnumber#'
</CFQUERY>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Gallery | Photographer's Showcase</title>
</head>

<body>

<cfoutput>

	
<!--- Count the number of images in the thumbs Directory --->
<cfset imagecount = 0>
<cfloop index="fieldincrementer" from="1" to="25" step="1">

		<cfif fileexists(Expandpath("../../../../../visualservercom/html/artists/#qGetShowcaseSetup.Subdirectory#/#qGetShowcasePortfolio.SubDirectory#/Images_Large/image#fieldincrementer#.jpg"))>	
		<!--- <cfif fileexists(Expandpath("../../Artists/#qGetShowcaseSetup.Subdirectory#/#qGetShowcasePortfolio.SubDirectory#/Images_Large/image#fieldincrementer#.jpg")) or fileexists(Expandpath("../../#qGetShowcaseSetup.Gallery#/Artists/#qGetShowcaseSetup.Subdirectory#/#qGetShowcasePortfolio.SubDirectory#/Images_Large/image#fieldincrementer#a.jpg"))>	 --->
			<cfset imagecount = imagecount + 1>
		</cfif>
</cfloop>

<cfset fieldincrementer=0>
<cfloop QUERY=qShowcaseGalleryIndividualPhotos startrow="1" endrow="#imagecount#">
	<cfset fieldincrementer=#fieldincrementer#+1>
	<!---Define which text input field on form we're using--->
	<cfset xForm="form.image#fieldincrementer#">
 	<cfset newposition=#Evaluate(xForm)#>
	<cfset oldposition=#qShowcaseGalleryIndividualPhotos.imageposition#>
	<cfset imagenumber=#qShowcaseGalleryIndividualPhotos.imagenumber#> 
	
	<cfif #oldposition# is not #newposition#>
 		<CFQUERY DATASOURCE="photoeyecom" dbtype="ODBC">
  		 	UPDATE GalleryIndividualPhotos
   			SET imageposition = '#newposition#'
   			WHERE custnumber='#xCustnumber#' AND IMAGENUMBER='#IMAGENUMBER#' AND PORTFOLIONAME='#URL.Portfolio#';
		</CFQUERY>
<!--- 		fieldincrementer #fieldincrementer#<br>
		oldposition #oldposition#<br>
		form #form#<br>
		imagenumber #imagenumber#<br>
		newposition #newposition#<br> 	 --->	
	</cfif>
</cfloop>	
		
</cfoutput>

<div align="center"><center>
<form  method="post" action="Step10changeimageorderURL.cfm?custnumber=<cfoutput>#xCustnumber#&Portfolio=#qGetShowcasePortfolio.SubDirectory#</cfoutput>">

<!---<cfoutput>#xCustnumber#</cfoutput>--->
<!--- <form action="Step10changeimageorder.cfm"> --->
Your changes have been completed! <br>
<INPUT TYPE="SUBMIT" VALUE="See Changes">
</form>
</center></div>
</body>
</html>

