
<CFQUERY NAME="qShowcaseArtist"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup where Custnumber=#url.id#
</CFQUERY>

<!--- <CFQUERY NAME="qImagePosition"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryIndividualPhotos where custnumber='#url.id#' AND PortfolioName='#url.Portfolio#' order by PortfolioName ASC, ImagePosition ASC
</CFQUERY> --->

<cfif isdefined("url.image")>
<CFQUERY NAME="qShowcaseGalleryIndividualPhotos"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryIndividualPhotos where custnumber='#url.id#' AND IMAGENUMBER='#url.image#'
</CFQUERY>
</cfif>

<cfif isdefined("url.ImagePosition")>
<CFQUERY NAME="qShowcaseGalleryIndividualPhotos"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryIndividualPhotos where custnumber='#url.id#' AND PortfolioName='#url.Portfolio#' AND ImagePosition='#url.imageposition#' order by PortfolioName ASC, ImagePosition ASC
</CFQUERY> 
</cfif>

<CFQUERY NAME="qImageCount"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryIndividualPhotos where custnumber='#url.id#' AND PortfolioName='#url.Portfolio#' 
</CFQUERY>

<cfset xCount = qImageCount.recordcount>
<cfset xCurrent=qShowcaseGalleryIndividualPhotos.ImagePosition>
<cfset xNext=qShowcaseGalleryIndividualPhotos.ImagePosition+1>
<cfset xPrevious=qShowcaseGalleryIndividualPhotos.ImagePosition-1>




<CFQUERY NAME="qShowcaseGalleryDefaultPhotos"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryDefaultPhotos where custnumber='#url.id#' 
</CFQUERY>

<cfparam name="xpan" default="0">							

 <CFQUERY NAME="qShowcasePortfolio"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryPortfolio where Custnumber=#url.id# AND SUBDIRECTORY='#url.portfolio#'
</CFQUERY>

<CFIF qShowcasePortfolio.Panorama is 1>
	<CFSET xPan = 1>
</CFIF>

<cfif #len(qShowcasePortfolio.Backgroundcolor)# GT 0>
	<cfset Background = "#trim(qShowcasePortfolio.Backgroundcolor)#">
<cfelse>
	<cfset Background = "000000">
</cfif>

<!---Stats--->

<cfset month=MONTH(#Now()#)>


<CFQUERY NAME="UpdateStats" DATASOURCE="photoeyecom">
UPDATE GALLERYSTATS
SET Imagenumber=#qShowcaseGalleryIndividualPhotos.imagenumber#,
Page=3,
PV_Total=PV_Total+1,
PV_YTD=PV_YTD+1,
Hits_Total=Hits_Total+2,
Hits_YTD=Hits_YTD+2
WHERE custnumber=#url.id# AND ImageNumber=#qShowcaseGalleryIndividualPhotos.imagenumber# AND Portfolio='#url.portfolio#'
</cfquery>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<style type="text/css">
	A   {
		Text-decoration: none;
	}
	A.link, A.visited, A.hover, A.active   {
		
		TEXT-DECORATION: none;
		}
</style>	
<title>photo-eye | <cfoutput>#qShowcaseArtist.FirstName# #qShowcaseArtist.LastName#</cfoutput></title>

</head>
<!---onload="opener.close()"--->
<cfoutput>
<body bgcolor="###Background#" link="###Background#" vlink="###Background#" topmargin="0" onload="opener.close()"> 

<table height="100%" width="100%" cellpadding="0" cellpadding="0">
	<tr>
		<td align="center" valign="middle">

		<table align="center" height="441">

  			<tr> 
   				 <td>
	
<!--- ImageSizer --->	
<cfif xpan is 1>							
	<cfset xheight=500>
	<cfset xwidth=3000>
<cfelse>
	<cfset xheight=600>
	<cfset xwidth=900>
</cfif>	

<!--- <CFIF url.id is 181039>

	<!--- <cfset xquality = 100> --->

	<img src="http://www.visualserver.com/artists/#qShowcaseArtist.Subdirectory#/#Portfolio#/images_large/image#url.image#.jpg" border="0"></td>
<cfelse>

 --->
<cfset xImageAddress="#xRelativePath#\Artists\#qShowcaseArtist.Subdirectory#\#Portfolio#\Images_Large\">

<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image#qShowcaseGalleryIndividualPhotos.imagenumber#.jpg">

<cfinclude template="../../../templates/imagesizer.cfm">

<img src="../../../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></td>
<!--- End ImageSizer --->

<!--- </CFIF> --->



	<!--- <img src="../Images_large/Image<cfoutput>#url.image#</cfoutput>.jpg" alt="" border="0" > --->
  </tr>
  <tr valign="middle"> 
    <td height="20"> 
      <div align="center"> 
	  <cfif xprevious neq 0>
	 <a href="image1.cfm?id=#url.id#&imageposition=#xPrevious#&Portfolio=#url.portfolio#"><font face="verdana, arial, helvetica, sans-serif" size="1" color="##999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##999999';">< </font><a href="image1.cfm?id=#url.id#&imageposition=#xPrevious#&Portfolio=#url.portfolio#"><font face="verdana, arial, helvetica, sans-serif" size="1" color="##999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##999999';">Previous</font></a>
	 
	  &nbsp;&nbsp;&nbsp;&nbsp;
	  
	  <cfelse>

	  <a href="image1.cfm?id=#url.id#&imageposition=#xCount#&Portfolio=#url.portfolio#"><font face="verdana, arial, helvetica, sans-serif" size="1" color="##999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##999999';">< </font></a>
	  	  <a href="image1.cfm?id=#url.id#&imageposition=#xCount#&Portfolio=#url.portfolio#"><font face="verdana, arial, helvetica, sans-serif" size="1" color="##999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##999999';">Last</font></a>
	 
	  &nbsp;&nbsp;&nbsp;&nbsp;
	  </cfif>
	  <cfif xnext lte xcount>
	    <a href="image1.cfm?id=#url.id#&imageposition=#xNext#&Portfolio=#url.portfolio#"><font face="verdana, arial, helvetica, sans-serif" size="1" color="##999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##999999';">Next</font></a>
		<a href="image1.cfm?id=#url.id#&imageposition=#xNext#&Portfolio=#url.portfolio#"><font face="verdana, arial, helvetica, sans-serif" size="1" color="##999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##999999';">> </font></a>
	 &nbsp;&nbsp;&nbsp;&nbsp; 
	  <cfelse>
		 <a href="image1.cfm?id=#url.id#&imageposition=1&Portfolio=#url.portfolio#"><font face="verdana, arial, helvetica, sans-serif" size="1" color="##999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##999999';">First</font></a>
		    <a href="image1.cfm?id=#url.id#&imageposition=1&Portfolio=#url.portfolio#"><font face="verdana, arial, helvetica, sans-serif" size="1" color="##999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##999999';">> </font></a>
	 &nbsp;&nbsp;&nbsp;&nbsp;   
	  
	  </cfif>
	  <a href="javascript:window.close();"><font face="verdana, arial, helvetica, sans-serif" size="1" color="##999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##999999';">[x] </font><a href="javascript:window.close();"><font face="verdana, arial, helvetica, sans-serif" size="1" color="##999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##999999';">Close Window</font></a>
<br><br><cfinclude template = "../Artistcopywrite.cfm"></div>
    				</td>
 			 	</tr>
			</table>
		</td>
	</tr>
</table>
</cfoutput>
</body>
</html>
