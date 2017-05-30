<!--- <CFQUERY NAME="qShowcaseGalleryIndividualPhotos"  DATASOURCE="photoeyecom">
  	UPDATE GalleryIndividualPhotos 
	SET ImagePosition=0 where custnumber='#url.custnumber#' and PortfolioName='#url.portfolio#' and ImagePosition<>1
</CFQUERY>	 --->

<CFQUERY NAME="qPositions"  DATASOURCE="photoeyecom">
  		SELECT Top 1 * 
 		FROM GalleryIndividualPhotos where custnumber='#url.custnumber#' and PortfolioName='#URL.Portfolio#' order by ImagePosition
</CFQUERY>	
	
<!--- If the Imagenumber is 1, then it is a standard signature image and the standard replacements for the reset will work --->
<cfif qPositions.ImageNumber is 1>
	<CFQUERY NAME="qShowcaseGalleryIndividualPhotos"  DATASOURCE="photoeyecom">
  	UPDATE GalleryIndividualPhotos 
	SET ImagePosition=ImageNumber where custnumber='#url.custnumber#' and PortfolioName='#url.portfolio#' 
	</CFQUERY>
<cfelse>
<!--- ImagePosition 1 <> ImageNumber 1 --->
<!--- Set the Nonstandard Image Number found in qPositions--->
<cfset imageNumberx=qPositions.ImageNumber>
	<!--- Update all images first --->
	<CFQUERY NAME="qShowcaseGalleryIndividualPhotos"  DATASOURCE="photoeyecom">
  	UPDATE GalleryIndividualPhotos 
	SET ImagePosition=ImageNumber where custnumber='#url.custnumber#' and PortfolioName='#url.portfolio#' 
	</CFQUERY>
	<!--- Now update the Image Postition for the Nonstandard Signature Image Number --->
	<CFQUERY NAME="qShowcaseGalleryIndividualPhotos"  DATASOURCE="photoeyecom">
  	UPDATE GalleryIndividualPhotos 
	SET ImagePosition=1 where custnumber='#url.custnumber#' and PortfolioName='#url.portfolio#' and ImageNumber=#ImageNumberx#
	</CFQUERY>
	<!--- Now update the Image Postition for the Nonstandard Signature it replaced above --->
	<CFQUERY NAME="qShowcaseGalleryIndividualPhotos"  DATASOURCE="photoeyecom">
  	UPDATE GalleryIndividualPhotos 
	SET ImagePosition=#ImageNumberx# where custnumber='#url.custnumber#' and PortfolioName='#url.portfolio#' and ImageNumber=1
	</CFQUERY>
	
</cfif>

<!--- <CFQUERY NAME="qShowcaseGalleryIndividualPhotos"  DATASOURCE="photoeyecom">
  	UPDATE GalleryIndividualPhotos 
	SET ImagePosition=ImageNumber where custnumber='#url.custnumber#' and PortfolioName='#url.portfolio#' and Not (ImageNumber<>1 and ImagePosition=1)
</CFQUERY>	 --->



<!--- 
<CFQUERY NAME="qShowcaseGalleryIndividualPhotos"  DATASOURCE="photoeyecom">
  	UPDATE GalleryIndividualPhotos 
	SET ImagePosition=-1 where custnumber='#url.custnumber#' and PortfolioName='#url.portfolio#' and ImagePosition=1
</CFQUERY>	 --->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase - Reposition Images</title>
</head>

<body bgcolor="Gray" link="#000080" vlink="#000080">
<center>
<palign="center">
Your images now have their positions cleared. 
Click the button below to sequence your images. 

<form method="post" action="Step10ChangeImageOrderURL.cfm?clear=1&custnumber=<cfoutput>#url.custnumber#&Portfolio=#url.portfolio#</cfoutput>">
 
 <INPUT TYPE="SUBMIT" VALUE="Reset Positions">

</form>
</p>
</center>


</body>
</html>
