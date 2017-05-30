<cfinclude template="../templates/codecopyright.cfm">

<!--- Decide where to start the random images based on page number> --->
<!--- <cfset imgbegin=((#url.page#/2)*20)> --->
<cfif Isdefined("url.page")>
	<cfif #url.page# gt 1>
	<cfset imgbegin=4>
	

	<cfelse>
	<cfset imgbegin=0>
	</cfif>
	<cfset additional=#url.additional#>
<cfelse>
	<cfset imgbegin=0>
	<cfset page=1>
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

	<title>photo-eye Galleries | Home Page</title>
	
	
<script language="JavaScript">


<!-- hide from JavaScript-challenged browsers
var popupWin = null;
function popUp(myURL,myWindowName,w,h,scroll,menu){
var myLeft = ((screen.width-w)/2)-5; 
var myTop = ((screen.height-h)/2)-5;
var settings='height='+h+',width='+w+',top='+myTop+',left='+myLeft+',scrollbars=yes,resizable=no,menu='+menu 
popupWin=window.open(myURL,myWindowName,settings);
if(parseInt(navigator.appVersion) >= 4){popupWin.focus();}
}
 
// done hiding -->

</script>

</head>

<body bgcolor="#B3A48E" text="White" link="#B3A48E" vlink="#B3A48E" alink="Red">
<!--- #B3A48E --->

<table width="80%" height="36" border="0" align="center" bgcolor="Black">
<tr>
    <td  width="100%" height="51" align="center"><img src="Photoshowcase/SharedImages/photoeyeexplorephotographersshowcase7.jpg" width="384" height="84" alt="" border="0"></td>

</tr>
</table>
<table width="80%" border="0" align="center">
<tr align="left"><td align="left" valign="top" width="50%"><a href="photoshowcase/newdocumentation/artists/index.html" target="_top"><font face="verdana, arial, helvetica, sans-serif" size="1" color="Maroon" onmouseover="this.color='Red';" onmouseout="this.color='Maroon';"  style="TEXT-DECORATION: none"><b>Submit Your Work</b></font></a>
</td>
<td align="right" valign="top" width="50%"><a href="../../templates/viewshoppingcartcontents.cfm?Showcase=2" target="_top"><font face="verdana, arial, helvetica, sans-serif" size="1" color="Maroon" onmouseover="this.color='Red';" onmouseout="this.color='Maroon';"  style="TEXT-DECORATION: none"><b>View Your Order</b></font></a>
</td>
</tr>
</table>
<!--- <table width="90%" border="0" align="center">
<tr align="center"><td align="center" valign="top">
<!--- <img src="SharedImages/Redlinetoc.gif" width="400" height="1" alt="" border="0"> 
 --->


</td></tr></table>
 --->
 <cfoutput>


  
<cfset ImageNumber = 1>
<cfset ImagePosition = 1>
<cfset FirstTime = 1>
<cfset rowcount =1>

<cfif isdefined("url.GL2")>
	<cfset GL2=#url.GL2#>
<cfelse>
	<cfset GL2=''>
</cfif>


<cfset imgbeginType1=RAND()>
<cfset imgbeginType2=RAND()>
<cfset imgbeginType3=RAND()>
<cfif GL2 is 1 AND isdefined("url.RN")>
	<cfset imgbeginType1=#RN#>
<cfelseif GL2 is 2 AND isdefined("url.RN")>
	<cfset imgbeginType2=#RN#>
<cfelseif GL2 is 3 AND isdefined("url.RN")> 
	<cfset imgbeginType3=#RN#>
</cfif>


<cfquery name="qGetSantaFe"  datasource="photoeyecom">
SELECT  DISTINCT TOP 1 G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
    P.Subdirectory as Portfolio, D.GeneralRandomNo, CONVERT(char(20), P.ExhibitionOpened, 102) AS Expr1, I.ImageNumber AS Imagenumber, I.ImagePosition AS IMAGEPOSITION
FROM GallerySetup G 
	INNER JOIN GalleryPortfolio P ON G.Custnumber = P.Custnumber 
	INNER JOIN GalleryDefaultPhotos D ON P.Custnumber = D.Custnumber 
	INNER JOIN GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 AND D.GeneralRandomNo>#imgbeginType1# AND G.Gallery='RepresentedArtists' and P.ShowcaseOK=1  AND (I.ImagePosition = 1)
ORDER BY  CONVERT(char(20), P.ExhibitionOpened, 102) DESC, D.GeneralRandomNo  
</cfquery>
<!--- ORDER BY D.GeneralRandomNo  --->
<cfif qGetSantaFe.recordcount is 0>

<cfquery name="qGetSantaFe"  datasource="photoeyecom">
SELECT  DISTINCT TOP 1 G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
    P.Subdirectory as Portfolio, D.GeneralRandomNo, CONVERT(char(20), P.ExhibitionOpened, 102) AS Expr1, I.ImageNumber AS Imagenumber, I.ImagePosition AS IMAGEPOSITION
FROM GallerySetup G 
	INNER JOIN GalleryPortfolio P ON G.Custnumber = P.Custnumber 
	INNER JOIN GalleryDefaultPhotos D ON P.Custnumber = D.Custnumber 
	INNER JOIN GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 AND D.GeneralRandomNo<#imgbeginType1# AND G.Gallery='RepresentedArtists' and P.ShowcaseOK=1  AND (I.ImagePosition = 1)
ORDER BY  CONVERT(char(20), P.ExhibitionOpened, 102) DESC, D.GeneralRandomNo  
</cfquery>
</cfif>
<!--- ORDER BY D.GeneralRandomNo DESC --->

<cfquery name="qGetShowcase"  datasource="photoeyecom">
SELECT DISTINCT TOP 1 G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
    P.Subdirectory as Portfolio, D.GeneralRandomNo, CONVERT(char(20), P.ExhibitionOpened, 102) AS Expr1, I.ImageNumber AS Imagenumber, I.ImagePosition AS IMAGEPOSITION
FROM GallerySetup G 
	INNER JOIN GalleryPortfolio P ON G.Custnumber = P.Custnumber 
	INNER JOIN GalleryDefaultPhotos D ON P.Custnumber = D.Custnumber 
	INNER JOIN GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber 
WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 <!--- AND D.GeneralRandomNo>#imgbeginType2#  --->AND G.Gallery='PhotoShowcase' and P.ShowcaseOK=1  AND (I.ImagePosition = 1)
ORDER BY  CONVERT(char(20), P.ExhibitionOpened, 102) DESC, D.GeneralRandomNo 
</cfquery>
<!--- ORDER BY D.GeneralRandomNo --->
<!--- ORDER BY D.GeneralRandomNo --->
<!--- Takes into account random number being too high--->
<cfif qGetShowcase.recordcount is 0>
	<cfquery name="qGetShowcase"  datasource="photoeyecom">
SELECT DISTINCT TOP 1 G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
    P.Subdirectory as Portfolio, D.GeneralRandomNo, CONVERT(char(20), P.ExhibitionOpened, 102) AS Expr1, I.ImageNumber AS Imagenumber, I.ImagePosition AS IMAGEPOSITION
FROM GallerySetup G 
	INNER JOIN GalleryPortfolio P ON G.Custnumber = P.Custnumber 
	INNER JOIN GalleryDefaultPhotos D ON P.Custnumber = D.Custnumber 
	INNER JOIN GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 <!--- AND D.GeneralRandomNo<#imgbeginType2#  --->AND G.Gallery='PhotoShowcase' and P.ShowcaseOK=1  AND (I.ImagePosition = 1)
ORDER BY  CONVERT(char(20), P.ExhibitionOpened, 102) DESC, D.GeneralRandomNo 
	</cfquery>
</cfif>
<!--- ORDER BY D.GeneralRandomNo DESC --->


<cfquery name="qGetMagnum"  datasource="photoeyecom">
SELECT  DISTINCT top 1 G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
    P.Subdirectory as Portfolio, D.GeneralRandomNo, CONVERT(char(20), P.ExhibitionOpened, 102) AS Expr1, I.ImageNumber AS Imagenumber, I.ImagePosition AS IMAGEPOSITION
FROM GallerySetup G 
	INNER JOIN GalleryPortfolio P ON G.Custnumber = P.Custnumber 
	INNER JOIN GalleryDefaultPhotos D ON P.Custnumber = D.Custnumber 
	INNER JOIN GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 AND D.GeneralRandomNo>#imgbeginType3# AND G.Gallery='MagnumArtists' and P.ShowcaseOK=1  AND (I.ImagePosition = 1)
ORDER BY  CONVERT(char(20), P.ExhibitionOpened, 102) DESC, D.GeneralRandomNo 
</cfquery>  
<!--- ORDER BY D.GeneralRandomNo --->
<cfif qGetMagnum.recordcount is 0>

<cfquery name="qGetMagnum"  datasource="photoeyecom">
SELECT  DISTINCT top 1 G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
    P.Subdirectory as Portfolio, D.GeneralRandomNo, CONVERT(char(20), P.ExhibitionOpened, 102) AS Expr1, I.ImageNumber AS Imagenumber, I.ImagePosition AS IMAGEPOSITION
FROM GallerySetup G 
	INNER JOIN GalleryPortfolio P ON G.Custnumber = P.Custnumber 
	INNER JOIN GalleryDefaultPhotos D ON P.Custnumber = D.Custnumber 
	INNER JOIN GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 AND D.GeneralRandomNo<#imgbeginType3# AND G.Gallery='MagnumArtists' and P.ShowcaseOK=1  AND (I.ImagePosition = 1)
ORDER BY  CONVERT(char(20), P.ExhibitionOpened, 102) DESC, D.GeneralRandomNo 
</cfquery> 
<!--- ORDER BY D.GeneralRandomNo DESC --->
</cfif> 
 	    	 <!--- Outer Table --->
	 <table border="0" align="center" width="100%">
	   	<tr align="center"><td align="center" valign="top"><br>
	

	
	 <table width="80%" border="0" cellpadding="3" align="center">
	

		
		<tr align="center" valign="bottom">
		<td align="center" width="33%" valign="bottom" <!--- height="45" --->>

		<a href="RepresentedArtists/homepagePE.cfm" target="_parent"><font color="Navy" face="verdana, arial, Helvetica, sans-serif" size="2" onmouseover="this.color='Red';" onmouseout="this.color='Navy';"  style="TEXT-DECORATION:none"><b>photo-eye<font size="1" color="##B3A48E"><sup>&reg;</sup></font><br>
        Santa Fe Gallery</b><!--- <FONT SIZE="1"><SUP>&nbsp;</SUP></FONT> ---></font></a><br><img src="SharedImages/dot_clear.gif" width="1" height="5"></td>

	<td align="center" width="33%" valign="bottom" <!--- height="45" --->>
	<a href="PhotoShowcase/homepagePSNew.cfm" target="_parent"><font color="Navy" face="verdana, arial, Helvetica, sans-serif" size="2" onmouseover="this.color='Red';" onmouseout="this.color='Navy';"  style="TEXT-DECORATION:none"><b>Photographer's<br> 
       Showcase</b><font size="1"><sup>&reg;</sup></font></font></a><br><img src="SharedImages/dot_clear.gif" width="1" height="5"></td>

	<td align="center" width="33%" valign="bottom" <!--- height="45" --->>
		<a href="MagnumArtists/homepageMA.cfm" target="_parent"><font color="Navy" face="verdana, arial, Helvetica, sans-serif" size="2" onmouseover="this.color='Red';" onmouseout="this.color='Navy';"  style="TEXT-DECORATION:none"><b>Magnum Photos<font size="1" color="##B3A48E"><sup>&reg;</sup></font><br>  
        Collectors' Prints</b><font size="1"><!--- <SUP>&nbsp;</SUP></FONT></font> ---></a><br><img src="SharedImages/dot_clear.gif" width="1" height="5"></td>


			</tr>
			<tr>
			<td align="center" width="33%" valign="bottom" height="115">
			
	<a href="RepresentedArtists/homepagePE.cfm" target="_parent">
	
	
<!--- ImageSizer --->									
<cfset xheight=120>
<cfset xwidth=120>
<cfset xPath= "http://www.visualserver.com/artists/#qGetSantaFe.Subdirectory#/#qGetSantaFe.Portfolio#/Images_Large/">

<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image#qGetSantaFe.ImageNumber#.jpg">

<cfinclude template="../templates/imagesizer.cfm">

<img src="../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a>
<!--- End ImageSizer --->

<br>
<img height=10 src="../dot_clear.gif" width=1> 
 <font color="##666666" face="verdana, arial, Helvetica, sans-serif" size="1">&copy; #qGetSantaFe.Firstname# #qGetSantaFe.Lastname#</font><p align="center"><font color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1">Represented Artists<br>
from our<br>
Santa Fe Gallery<br>&nbsp;
</font></p></td>

	<!--- Panorama? --->
	<CFQUERY NAME="qGetPanorama"  DATASOURCE="photoeyecom">
	 	SELECT Panorama
  		FROM GalleryPortfolio where Custnumber=#qGetShowcase.Custnumber# and SubDirectory = '#qGetShowcase.Portfolio#'
	</CFQUERY>
	
	<CFIF qGetPanorama.Panorama is 1>
		<CFSET xPan = 1>
	<CFELSE>	
		<CFSET xPan = 0>
	</CFIF>

<td align="center" width="33%" valign="bottom" height="115">
	 <a href="PhotoShowcase/homepagePSNew.cfm" target="_parent">
	
<CFIF xPan is 1>									
	<img SRC="http://www.visualserver.com/artists/#qGetShowcase.Subdirectory#/#qGetShowcase.Portfolio#/search.gif">
<CFELSE>
 <!--- ImageSizer --->	
	 <cfset xheight=120>
	 <cfset xwidth=120>
	 <cfset xAlt = "Enter Gallery">
	 <cfset xPath= "http://www.visualserver.com/artists/#qGetShowcase.Subdirectory#/#qGetShowcase.Portfolio#/Images_Large/">
	 <cfset xImage = "Image#qGetShowcase.ImageNumber#.jpg">
	 <cfinclude template="../templates/imagesizer.cfm">

	<img src="../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#">
</CFIF>

</a>
<!--- End ImageSizer --->


<br>
<img height=10 src="../dot_clear.gif" width=1> 
<font color="##666666" face="verdana, arial, Helvetica, sans-serif" size="1">&copy; #qGetShowcase.Firstname# #qGetShowcase.Lastname#</font><p align="center"><font color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1">Our New Online<br>
<!--- <a href="javascript:popUp('PhotoShowcase/juried.html','Popup','500','320','no');"> --->Juried Gallery <!--- </a>  --->Open to<br>
Photographers Worldwide<br>&nbsp;</font></p></td> 

<td align="center" width="33%" valign="bottom" height="115">
	 <a href="MagnumArtists/homepageMA.cfm" target="_parent">
	
<!--- ImageSizer --->									
<cfset xheight=120>
<cfset xwidth=120>
<cfset xPath= "http://www.visualserver.com/artists/#qGetMagnum.Subdirectory#/#qGetMagnum.Portfolio#/Images_Large/">
<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image#qGetMagnum.ImageNumber#.jpg">

<cfinclude template="../templates/imagesizer.cfm">

<img src="../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a>
<!--- End ImageSizer --->
<br>
<img height=10 src="../dot_clear.gif" width=1>  
 <font color="##666666" face="verdana, arial, Helvetica, sans-serif" size="1">&copy; #qGetMagnum.Firstname# #qGetMagnum.Lastname#</font><p align="center"><font color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1">Extraordinary Images<br>
from the World's<br>
Premier Picture Agency<br>&nbsp;
</font></p></td>
			</tr>
			</table>
			</td></tr>
			<TR>
      <TD ALIGN="CENTER"> <a href="http://www.photoeye.com/gallery/forms/homepage_twintowers.cfm?id=81037&image=1&imagePosition=1&Door=2&Portfolio=Portfolio3&Gallery=2" target="_parent"><font color="Navy" face="verdana, arial, Helvetica, sans-serif" size="2" onmouseover="this.color='Red';" onmouseout="this.color='Navy';"  style="TEXT-DECORATION:none"><b>Twin 
        Towers:<br>
        An Elegy</b>
        <!--- <FONT SIZE="1"><SUP>&nbsp;</SUP></FONT> --->
        <br>
        </font></A><br>
        <a href="forms/homepage_twintowers.cfm?id=81037&image=1&imagePosition=1&Door=2&Portfolio=Portfolio3&Gallery=2" target="_parent">

<!--- ImageSizer --->									
<cfset xheight=120>
<cfset xwidth=120>
<cfset xPath= "http://www.visualserver.com/artists/twintowers/portfolio2/Images_Large/">
<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image#qGetShowcase.ImageNumber#.jpg">

<cfinclude template="../templates/imagesizer.cfm">

<img src="../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a>
<!--- End ImageSizer --->

        <br>
        <font color="##666666" face="verdana, arial, Helvetica, sans-serif" size="1">&copy; 
        Tom Baril</font> <font color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1"> 
        <br>
        <br>
        Online Exhibition<br>
        in conjunction with<br>
        the Kennedy Boesky Gallery<br>
        <br>
        </font> </TD>
    </TR>
						<tr><td align="center"><div align="center">
<font color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1"><b>Click Image to Enter a Gallery<br><img height=12 src="../dot_clear.gif" width=1>Explore Artists and Images Across All Galleries Using the Left Side Options<br>
<br>
<font color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1"><b>What is the <a href="photoshowcase/newdocumentation/artists/overviewphotographers2.html"><font color="navy">Photographer's Showcase<SUP><FONT SIZE="1">&reg;</FONT></SUP>?</font></a></b></font></div></td></tr></table>
	
</cfoutput>
<cfinclude template="footer.cfm">
</body>
</html>
