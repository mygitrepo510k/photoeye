<cfif isdefined("url.custnumber")>
	<cfset xCustnumber=#url.custnumber#>
<cfelse>
	<cfif isdefined("form.custnumber")>
			<cfset xCustnumber=#form.custnumber#>
	<cfelse>
		Custnumber is not defined.
	</cfif>
</cfif>

<cfif isdefined("url.portfolio")>
	<cfset xportfolio='Portfolio#url.portfolio#'>
<cfelse>
	<cfif isdefined("form.portfolio")>
			<cfset xportfolio='Portfolio#form.portfolio#'>
	<cfelse>
		portfolio is not defined.
	</cfif>
</cfif>



<CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup
  WHERE Custnumber = #xcustnumber#
</CFQUERY>

<CFQUERY NAME="qGetShowcaseStats"  DATASOURCE="photoeyecom">
  SELECT DISTINCT *
  FROM GalleryStats INNER JOIN 
  GALLERYINDIVIDUALPHOTOS ON GALLERYINDIVIDUALPHOTOS.IMAGENUMBER=GALLERYSTATS.IMAGENUMBER and
GALLERYINDIVIDUALPHOTOS.CUSTNUMBER=GALLERYSTATS.CUSTNUMBER and
GALLERYINDIVIDUALPHOTOS.PORTFOLIONAME=GALLERYSTATS.PORTFOLIO
  WHERE GalleryStats.Custnumber = #xcustnumber# and GalleryStats.Portfolio = '#xportfolio#' ORDER BY Gallerystats.Imagenumber
</CFQUERY>

<CFQUERY NAME="qGetPortfolio"  DATASOURCE="photoeyecom">
  SELECT SubDirectory, Title
  FROM GalleryPortfolio
  WHERE Upper(SubDirectory)='#xportfolio#'

</CFQUERY>


<cfoutput>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>photo-eye Photographer's Showcase | Stats </title>
<style type="text/css">
<!--
.showcasestyles {  
font-family: Verdana, Arial, Helvetica, sans-serif; 
font-size: x-small; font-style: normal; 
line-height: normal; font-weight: 
bold; color: ##000000}
-->
</style>

<style type="text/css"> 
 <!--
 .showcasestylesheader {
 	font-family: Verdana, Arial, Helvetica, sans-serif;
 	font-size: x-small;
 	font-style: normal;
 	line-height: normal;
 	font-weight: bold;
 	color: Red
 }
 -->
 </style>
</head>

<body bgcolor="Silver">
<table width="100%" border="0">
  <tr> 
    <td colspan="2">
      <div align="center" class="showcasestyles">
	  #qGetShowcaseSetupInfo.Firstname#
	  #qGetShowcaseSetupInfo.LastName# Showcase Stats<br>
	 <cfif  #left(qGetPortfolio.Title,9)# is not 'Portfolio' and #val(mid(qGetPortfolio.Title,10,1))# is 0>
	  #qGetPortfolio.Subdirectory#: #qGetPortfolio.Title#
<cfelse>
	#qGetPortfolio.Subdirectory# 
</cfif>
</div></td></tr>
  <tr> 
    <td colspan="2"> 
	</td></tr>
</table>
  <cfset total=0>
  <cfset ytdtotal=0>
  <cfloop query="qGetShowcaseStats" startrow="1" endrow="20">
  	<cfset total=total+pv_total>
	<cfset ytdtotal=ytdtotal+pv_ytd>
  </cfloop>
  
<table width="100%" border="0">
  <tr> 
    <td width="14%" class="showcasestylesheader">Image Views</td>
    <td width="7%" class="showcasestylesheader">Total</td>
    <td width="11%" class="showcasestylesheader">Year-to-Date</td>
    <td width="14%" class="showcasestyles">&nbsp;</td>
    <td width="54%" class="showcasestyles">&nbsp;</td>
  </tr>
  <tr>
  </tr>
  <tr> 
    <td width="14%" class="showcasestyles">Total Images</td>
    <td width="7%" class="showcasestyles">#Total#</td>
    <td width="11%" class="showcasestyles">#YTDtotal#</td>
    <td width="14%" class="showcasestyles">&nbsp;</td>
    <td width="54%" class="showcasestyles">&nbsp;</td>
  </tr>
  
  <cfloop query="qGetShowcaseStats" startrow="1" endrow="20">
  <tr> 
    <td width="14%" height="22" class="showcasestyles">Image #qGetShowcaseStats.ImageNumber#<br>
Position #qGetShowcaseStats.ImagePosition#</td>
    <td width="7%" height="22" class="showcasestyles">#qGetShowcaseStats.pv_Total#</td>
    <td width="11%" height="22" class="showcasestyles">#qGetShowcaseStats.pv_YTD#</td>
    <td width="14%" height="22">
	<!--- ImageSizer --->	
<CFPARAM NAME="xpan" default="0">								
<CFIF xPan is 1>
	<cfset xheight=120>
	<cfset xwidth=500>
<CFELSE>
	<cfset xheight=75>
	<cfset xwidth=75>
</CFIF>		

<cfset xImageAddress="#xRelativePath#\Artists\#qgetshowcasesetupinfo.subdirectory#\#qGetPortfolio.SubDirectory#\Images_Large\">


<cfset xImage = "Image#qGetShowcaseStats.Imagenumber#.jpg">

<cfinclude template="../../../templates/imagesizer.cfm">

<img src="../../../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="">
<!--- 
	<img src="../../#qgetshowcasesetupinfo.Gallery#/artists/#qgetshowcasesetupinfo.subdirectory#/#qGetPortfolio.SubDirectory#/images_thumbs/image#qGetShowcaseStats.Imagenumber#.jpg"> ---></td>
    <td width="54%" height="22">&nbsp;</td>
  </tr>
  </cfloop>

</table>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>
</html>
</cfoutput>
