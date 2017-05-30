<cfparam default="1" name="url.image">
<cfparam default="#url.image#" name="url.imageposition">
<cfparam name="url.portfolio" default="" />

<cfif not isNumeric(url.id)>
	<cfif isNumeric(getToken(url.id,1, '-'))>
		<cfset url.id = getToken(url.id,1, '-')/>
	<cfelse>
		<cfset url.id = 1 />
	</cfif>
</cfif>

<cfif url.imageposition is "" or url.imageposition is 0>
	<cfset url.imageposition = 1>
</cfif>


<!--- Get the Artist name --->
<CFQUERY NAME="qShowcaseArtist"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup where Custnumber= <cfqueryparam value="#url.id#" />
</CFQUERY>

<CFQUERY NAME="qShowcaseGalleryDefaultPhotos"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryDefaultPhotos where custnumber= <cfqueryparam value="#url.id#" />
</CFQUERY>

<CFQUERY NAME="qShowcasePortfolio"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryPortfolio where Custnumber= <cfqueryparam value="#url.id#" /> and SUBDIRECTORY = <cfqueryparam value='#url.portfolio#' />
</CFQUERY>

<!--- Get the artist copyright --->
	<CFQUERY NAME="qShowcaseGalleryIndividualPhotos"  DATASOURCE="photoeyecom">
	  SELECT *
  FROM GalleryIndividualPhotos where custnumber= <cfqueryparam value="#url.id#" /> AND IMAGEposition='#url.imageposition#' and PortfolioName = <cfqueryparam value='#url.portfolio#' />
	</CFQUERY>

<!--- Get the current image --->
<CFQUERY NAME="qImage_Current"  DATASOURCE="photoeyecom">
	  SELECT *
	  FROM GalleryIndividualPhotos where custnumber= <cfqueryparam value="#url.id#" /> AND IMAGEPOSITION='#url.imageposition#' and PortfolioName = <cfqueryparam value='#url.portfolio#' />
</CFQUERY>

<!--- Get the image count --->
	<CFQUERY NAME="qImage_Count"  DATASOURCE="photoeyecom">
	  SELECT *
  FROM GalleryIndividualPhotos where custnumber= <cfqueryparam value="#url.id#" /> and showcaseok=1 and notavailable<>4 and PortfolioName = <cfqueryparam value='#url.portfolio#' />
	</CFQUERY>

<!--- Get the next image --->
	<CFQUERY NAME="qImage_Next"  DATASOURCE="photoeyecom">
	  SELECT *
  FROM GalleryIndividualPhotos where custnumber= <cfqueryparam value="#url.id#" /> 
  	and PortfolioName = <cfqueryparam value='#url.portfolio#' /> 
  	and showcaseok=1 
  	and notavailable<>4 
  	and ImagePosition > <cfif len(qImage_Current.imageposition)><cfqueryparam value="#qImage_Current.imageposition#"><cfelse>1000000</cfif> 
order by PortfolioName ASC, ImagePosition ASC
	</CFQUERY>


<!--- Get the previous image --->
	<CFQUERY NAME="qImage_Previous"  DATASOURCE="photoeyecom">
	  SELECT *
  FROM  GalleryIndividualPhotos where custnumber= <cfqueryparam value="#url.id#" /> 
  	and PortfolioName = <cfqueryparam value='#url.portfolio#' /> 
  	and showcaseok=1 and notavailable<>4 
  	and ImagePosition < <cfif len(qImage_Current.imageposition)><cfqueryparam value="#qImage_Current.imageposition#"><cfelse>-1</cfif> 
 order by PortfolioName ASC, ImagePosition DESC
	</CFQUERY>
	
	<!--- If we are now at the first position, qImage_Previous.count will be 0 --->
	<cfif qImage_Previous.recordcount is 0>
		<CFQUERY NAME="qImage_Previous"  DATASOURCE="photoeyecom">
		  SELECT top 1 *
	  FROM ArtistIndividualWorks 
	  where custnumber= <cfqueryparam value="#url.id#" /> 
	  	and PortfolioName = <cfqueryparam value='#url.portfolio#' /> 
	  	and showcaseok=1 
	  	and notavailable<>4  
	order by PortfolioName ASC, ImagePosition DESC
		</CFQUERY>
	</cfif>
	
<!--- Get the first image --->
	<CFQUERY NAME="qImage_First"  DATASOURCE="photoeyecom">
	  SELECT *
	  FROM GalleryIndividualPhotos 
	  where custnumber= <cfqueryparam value="#url.id#" /> 
	  	and PortfolioName = <cfqueryparam value='#url.portfolio#' /> 
	  	and showcaseok=1 
	  	and notavailable<>4 
	  	and ImagePosition>0 
	 order by PortfolioName ASC, ImagePosition ASC
	</CFQUERY>



	
<cfset xcount=#qImage_Count.recordcount#>
<cfset xcurrent=#qImage_Current.ImagePosition#>

<cfset xfirst=#qImage_First.ImagePosition#>

<cfif qImage_Next.ImagePosition GT 0>
	<cfset xnext=#qImage_Next.ImagePosition#>
<cfelse>
	<cfset xnext=#xfirst#>
</cfif>

<cfif qImage_Previous.ImagePosition GT 0>
	<cfset xprevious=#qImage_Previous.ImagePosition#>
<cfelse>
	<cfset xprevious=#xcount#>
</cfif>



<cfparam name="xpan" default="0">							



<CFIF qShowcasePortfolio.Panorama is 1>
	<CFSET xPan = 1>
</CFIF>

<cfif #len(qShowcasePortfolio.Backgroundcolor)# GT 0>
	<cfset Background = "#trim(qShowcasePortfolio.Backgroundcolor)#">
<cfelse>
	<cfset Background = "000000">
</cfif>

<!---Stats--->

<cfset month=MONTH(Now())>

<cfif len(qShowcaseGalleryIndividualPhotos.imagenumber)>
<CFQUERY NAME="UpdateStats" DATASOURCE="photoeyecom">
UPDATE GALLERYSTATS
SET Imagenumber=#qShowcaseGalleryIndividualPhotos.imagenumber#,
Page=3,
PV_Total=PV_Total+1,
PV_YTD=PV_YTD+1,
Hits_Total=Hits_Total+2,
Hits_YTD=Hits_YTD+2
	WHERE 
		custnumber = <cfqueryparam value="#url.id#"> 
		AND ImageNumber = <cfqueryparam value="#qShowcaseGalleryIndividualPhotos.imagenumber#">
		AND Portfolio = <cfqueryparam value="#url.portfolio#" />
</cfquery>
</cfif>



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
<body bgcolor="###Background#" link="###Background#" vlink="###Background#" topmargin="0" onLoad="opener.close()"> 

<!--- ImageSizer --->	


<table height="700" width="100%" cellpadding="0" cellpadding="0">
	<tr>
		<td align="center" valign="middle">

		<table align="center" height="700">

  			<tr> 
   				 <td>
	
<!--- ImageSizer --->	
				<cfif qShowcaseGalleryIndividualPhotos.recordCount>

<cfif xpan is 1>							
	<cfset xheight=500>
	<cfset xwidth=3000>
<cfelse>
	<cfset xheight=600>
	<cfset xwidth=900>
</cfif>
<cfset xImageAddress="#xRelativePath#\Artists\#qShowcaseArtist.Subdirectory#\#Portfolio#\Images_Large\">
<cfset xAlt = "Enter Gallery">
<cfset xImageFormat = "jpg">
<cfset xImage = "Image#qShowcaseGalleryIndividualPhotos.imageNUMBER#">
<cfif NOT ListFindNoCase(qShowcaseGalleryIndividualPhotos.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")>
	<cfinclude template="../../../templates/imagesizercreate.cfm">
	<cfquery name="qUpdate"  datasource="photoeyecom">
		Update GalleryIndividualPhotos
		Set ImageSizeList = '#ListAppend(qShowcaseGalleryIndividualPhotos.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")#'
		Where RecordNo = #qShowcaseGalleryIndividualPhotos.RecordNo#
	</cfquery>
</cfif>
<cfif xnext gt 0 and xnext neq xfirst>
<!---<cfif xnext gt 0>--->
	<a href="image1.cfm?id=#url.id#&imageposition=#xNext#&Portfolio=#url.portfolio#">
<cfelse>
	<a href="image1.cfm?id=#url.id#&imageposition=#xFirst#&Portfolio=#url.portfolio#">
</cfif>
<img src="../../../artists/#qShowcaseArtist.Subdirectory#/#qShowcaseGalleryIndividualPhotos.PortfolioName#/Images_Large/#xImage#_H#xHeight#xW#xWidth#.#xImageFormat#" border="0" ALT="#xAlt#"></a></td>

				</cfif>
<!--- End ImageSizer --->


  </tr>
  <tr valign="middle"> 
    <td height="20"> 
      <div align="center"> 
<!---	  <cfif xprevious neq 0>--->
	 <a href="image1.cfm?id=#url.id#&imageposition=#xPrevious#&Portfolio=#url.portfolio#"><font face="verdana, arial, helvetica, sans-serif" size="1" color="##999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##999999';">< </font><a href="image1.cfm?id=#url.id#&imageposition=#xPrevious#&Portfolio=#url.portfolio#"><font face="verdana, arial, helvetica, sans-serif" size="1" color="##999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##999999';">Previous</font></a>
	 
	  &nbsp;&nbsp;&nbsp;&nbsp;
	  
	<!---  <cfelse>

	  <a href="image1.cfm?id=#url.id#&imageposition=#xCount#&Portfolio=#url.portfolio#"><font face="verdana, arial, helvetica, sans-serif" size="1" color="##999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##999999';">< </font></a>
	  	  <a href="image1.cfm?id=#url.id#&imageposition=#xCount#&Portfolio=#url.portfolio#"><font face="verdana, arial, helvetica, sans-serif" size="1" color="##999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##999999';">Last</font></a>
	 
	  &nbsp;&nbsp;&nbsp;&nbsp;
	  </cfif>--->
	<!---  <cfif xnext lte xcount and xnext neq xfirst>--->
	<cfif xnext gt 0 and xnext neq xfirst>
	    <a href="image1.cfm?id=#url.id#&imageposition=#xNext#&Portfolio=#url.portfolio#"><font face="verdana, arial, helvetica, sans-serif" size="1" color="##999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##999999';">Next</font></a>
		<a href="image1.cfm?id=#url.id#&imageposition=#xNext#&Portfolio=#url.portfolio#"><font face="verdana, arial, helvetica, sans-serif" size="1" color="##999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##999999';">> </font></a>
	 &nbsp;&nbsp;&nbsp;&nbsp; 
	  <cfelse>
		 <a href="image1.cfm?id=#url.id#&imageposition=#xFirst#&Portfolio=#url.portfolio#"><font face="verdana, arial, helvetica, sans-serif" size="1" color="##999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##999999';">First</font></a>
		    <a href="image1.cfm?id=#url.id#&imageposition=#xFirst#&Portfolio=#url.portfolio#"><font face="verdana, arial, helvetica, sans-serif" size="1" color="##999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##999999';">> </font></a>
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
</body></cfoutput>

</html>
