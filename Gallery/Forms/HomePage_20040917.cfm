<!---<CFQUERY NAME="qGetDetails"
         DATASOURCE="PhotoEyeBookStore">
SELECT *
FROM WEB
WHERE CATALOG >= 'AE001' AND CATALOG < 'AF001'
</CFQUERY> --->

<!--- Somehow lots of people link in without definining url.id, it seems silly to pick this for them, so if it's undefined send them to the gallery home page --->
<CFIF not IsDefined("url.id")>
	<CFLOCATION URL="../index.cfm">
</CFIF>

<cfif isdefined("URL.Page")>
	<cfset xPage = #URL.Page#>
<cfelse>
	<cfset xPage = "">
</cfif>	

<CFQUERY NAME="qGetPortfolios"
         DATASOURCE="photoeyecom">
SELECT *
FROM GALLERYPORTFOLIO
WHERE CUSTNUMBER = #URL.id# <!--- and Step11=1 ---> <!--- and ShowcaseOK=1 ---> Order by DateTime DESC
</CFQUERY> 

<!--- <CFQUERY NAME="qGetPortfoliosToShow"
         DATASOURCE="photoeyecom">
SELECT *
FROM GALLERYPORTFOLIO
WHERE CUSTNUMBER = #URL.id# and DoNotShow=0 <!--- and Step11=1 ---> <!--- and ShowcaseOK=1 ---> Order by DateTime DESC
</CFQUERY>  --->



<CFQUERY NAME="qGetSetup"
         DATASOURCE="photoeyecom">
SELECT *
FROM GALLERYSETUP
WHERE CUSTNUMBER = #URL.id#
</CFQUERY> 

<cfif #qGetSetup.Gallery# is "RepresentedArtists">
<cfset pagetitle = "Santa Fe Gallery">
<cfelseif #qGetSetup.Gallery# is "MagnumArtists">
<cfset pagetitle = "Magnum Photos">
<cfelseif #qGetSetup.Gallery# is "Photoshowcase">
<cfset pagetitle = "Photographer's Showcase<SUP><FONT SIZE=1>&reg;</FONT></SUP> Gallery">
</cfif>

<cfif #qGetSetup.Gallery# is "RepresentedArtists">
<cfset link = "homepagePE">
<cfelseif #qGetSetup.Gallery# is "MagnumArtists">
<cfset link = "homepageMA">
<cfelseif #qGetSetup.Gallery# is "Photoshowcase">
<cfset link = "homepagePSNew">
</cfif>

<!--- <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<cfoutput> 

<html>
<head>
	<title>photo-eye #pagetitle#</title>

	</HEAD>
<!--- <body bgcolor="##B3A48E" text="##333333" link="##333333" vlink="##333333" alink="Red">
	 --->
	 <body bgcolor="##B3A48E" text="White" link="##B3A48E" vlink="##B3A48E" alink="Red">
<DIV ALIGN="CENTER">

<table width="95%" height="36" border="0" bgcolor="Black">
<tr>

    <td  width="95%" height="51" align="center"><img src="../sharedimages/photoeyeexplorephotographersshowcase7.jpg" width="384" height="84" alt="" border="0"></td>

</tr>
</table> --->

<CFSET xShowMenu = 0>
<CFSET xShowDropDowns = 0>
<CFSET xShowHome = 1>

<cfif Isdefined("url.Gallery")>
	<cfif url.Gallery is 1>
		<CFSET xTitle = "Gallery - Santa Fe">
		<cfset xGallery=1>
		<cfset xGalleryName='REPRESENTEDARTISTS'>
		<CFSET xHomeLink = "#aGalleryDirectory#/RepresentedArtists/HomepagePE.cfm">
	<cfelseif url.Gallery is 2>
		<CFSET xTitle = "Photographer's Showcase">
		<cfset xGallery=2>
		<cfset xGalleryName='PHOTOSHOWCASE'>
		<CFSET xHomeLink = "#aGalleryDirectory#/Photoshowcase/HomepagePSnew.cfm">
	<cfelseif url.Gallery is 3>
		<CFSET xTitle = "Magnum Photos">
		<cfset xGallery=3>
		<cfset xGalleryName='MAGNUMARTISTS'>
		<CFSET xHomeLink = "#aGalleryDirectory#/MagnumArtists/HomepageMA.cfm">
	<CFELSE>
		<CFSET xTitle = "Galleries">
		<cfset xGallery=0>
		<cfset xGalleryName=''>
	</CFIF>
<cfelse>
	<CFSET xTitle = "Galleries">
	<cfset xGallery=0>
</cfif>

<CFSET xPathToRoot="../../">
<CFSET xShowBackButton = 1>
<CFSET xShowMenu = 1>
<cfinclude template="../../templates/Header.cfm">



<DIV ALIGN="CENTER">
<CFOUTPUT>



<cfif #url.door# is 4><a href="javascript:window.close()"><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Maroon';"  style="TEXT-DECORATION: none"><b>Close Window</a></b></font>


<!--- <CFELSE>
<div align="center"><b><img src="../photoshowcase/SharedImages/dot_clear.gif" width="1" height="1">
<cfif #url.door# is 51 or #url.door# is 52 or #url.door# is 53>
	<cfif url.door is 51>
	<A href="../ArtistsIndex.cfm?Include=1&Gallery=1&Page=#xPage#" target="_top"> 

	<cfelseif url.door is 52>
	<A href="../ArtistsIndex.cfm?Include=1&Gallery=2&Page=#xPage#" target="_top"> 
	
	<cfelseif url.door is 53>
	<A href="../ArtistsIndex.cfm?Include=1&Gallery=3&Page=#xPage#" target="_top"></cfif>
	<FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Maroon';"  style="TEXT-DECORATION: none">#pagetitle# Search Home</font></a><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;| &nbsp;</font>
</cfif>

<a href="../#qGetSetup.Gallery#/#link#.cfm"><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Maroon';"  style="TEXT-DECORATION: none">#pagetitle# Home</font></a><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;| &nbsp;</font><a href="../index.cfm"><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Maroon';"  style="TEXT-DECORATION: none">All Galleries Home</font></a>
</cfif>

<cfif #qGetSetup.Gallery# is "Photoshowcase">
<FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;| &nbsp;</font><a href="javascript:popUp('../photoshowcaseemail2.html','Popup','600','320','no');"><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Maroon';"  style="TEXT-DECORATION: none">Exhibit&nbsp;Your&nbsp;Work!</font></a>
</cfif>
 --->
</CFIF>


  <p align="center"><font face="verdana, arial, helvetica, sans-serif" size="2" color="black"><b>
#qGetSetup.FirstName# #qGetSetup.LastName#<br> 
<cfif qGetPortfolios.recordcount GT 1>
P O R T F O L I O S
<cfelse>
P O R T F O L I O
</cfif></b></font><br>

    <br>
  
  <img src="../sharedimages/Redlinetoc.gif" width="400" height="1" alt="" border="0"><br>
  <img src="SharedImages/dot_clear.gif" width="1" height="1">


	<CFSET MaxPortfolios=qGetPortfolios.recordcount>
	<cfset PortfolioNo=1>

	
	<cfloop query="qGetPortfolios" startrow="1" endrow="#MaxPortfolios#">
		<!--- Make New Table --->
	    <p align="center">
		<table height="150"  cellspacing="10">
		<!--- Make New Row --->
		<tr align="center">
		<cfset NumberTableCells = 0>
		
		<cfloop index="WhichPortfolio" from="1" to="5">
				<CFQUERY NAME="qGetDefaultPhotos"
         DATASOURCE="photoeyecom">
			SELECT *
			FROM GALLERYDEFAULTPHOTOS
			WHERE CUSTNUMBER = #URL.id# and Subdirectory='Portfolio#PortfolioNo#' AND NOTAVAILABLE<>4
		</CFQUERY>
		
		<CFQUERY NAME="qGetIndividualPhotos"
         DATASOURCE="photoeyecom">
			SELECT *
			FROM GALLERYIndividualPHOTOS
			WHERE CUSTNUMBER = #URL.id# and Portfolioname='Portfolio#PortfolioNo#' <!--- AND NOTAVAILABLE=0 ---> ORDER BY IMAGEPOSITION
		</CFQUERY>
		
		<CFQUERY NAME="qGetPortfolio"
         DATASOURCE="photoeyecom">
			SELECT *
			FROM GALLERYPORTFOLIO
			WHERE CUSTNUMBER = #URL.id# and Subdirectory='Portfolio#PortfolioNo#' AND SHOWCASEOK=1 <!--- and notavailable=0 --->
		</CFQUERY>
		
		<CFIF qGetDefaultPhotos.RECORDCOUNT GT 0 AND qGetPortfolio.RECORDCOUNT gt 0 >
			
			<td width="100" height="90" align="center" valign="bottom">			

	<!--- Panorama? --->
	<CFIF qGetPortfolio.Panorama is 1>
		<CFSET xPan = 1>
	<CFELSE>	
		<CFSET xPan = 0>
	</CFIF>
		
		
		<a href="index.cfm?image=1&id=#url.id#&imagePosition=1&Door=#url.door#&Portfolio=Portfolio#PortfolioNo#&Gallery=#url.gallery#&Page=#xpage#"  target="_top">


<!--- ImageSizer --->		
<CFIF xPan is 1>
	<cfset xheight=220>
	<cfset xwidth=610>
<CFELSE>
	<cfset xheight=120>
	<cfset xwidth=120>
</CFIF>
<cfset xImageAddress="#xRelativePath#\Artists\#qGetSetup.Subdirectory#\Portfolio#PortfolioNo#\Images_Large\">							
<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image#qGetIndividualPhotos.ImageNumber#.jpg">

<cfinclude template="../../templates/imagesizer.cfm">

<img src="../../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a>
<!--- End ImageSizer --->


<!--- Portfolio=Portfolio#PortfolioNo# --->
			</td>
			
			</cfif>
			<cfset NumberTableCells = NumberTableCells+1>
			<cfset PortfolioNo=PortfolioNo+1>
			<cfif PortfolioNo GT MaxPortfolios>
				<cfBreak>
			</cfif>
		</cfloop>
		</tr>
		
		<!--- Make Second New Row --->
		<!--- Reset NumberTableCells and PortfolioNo--->
		<cfset PortfolioNo = PortfolioNo-NumberTableCells>	
		<cfset NumberTableCells=0>
		<tr align="center">
		<cfloop index="WhichPortfolio2" from="1" to="5">
		<!--- Check to see if there is an actual portfolio name --->
		<!--- Note that there are two Portfolio Name columns--->
		<!--- One in GalleryPortfolio.Title and the other in GalleryDefaultPhotos.PortfolioName--->
		<!--- GalleryPortfolio.Title is always Portfolio 1, Portfolio 2 etc.--->
		<!--- So it is not used here --->
		<CFQUERY NAME="qGetDefaultPhotos"
         DATASOURCE="photoeyecom">
			SELECT *
			FROM GALLERYDEFAULTPHOTOS
			WHERE CUSTNUMBER = #URL.id# and Subdirectory='Portfolio#PortfolioNo#' AND NOTAVAILABLE<>4 <!--- and notavailable=0 --->
		</CFQUERY>
				
		<CFQUERY NAME="qGetPortfolio"
         DATASOURCE="photoeyecom">
			SELECT *
			FROM GALLERYPORTFOLIO
			WHERE CUSTNUMBER = #URL.id# and Subdirectory='Portfolio#PortfolioNo#' AND SHOWCASEOK=1 <!--- and notavailable=0 --->
		</CFQUERY>
		
		<CFIF qGetDefaultPhotos.RECORDCOUNT GT 0 AND qGetPortfolio.RECORDCOUNT gt 0 >
				<td <CFIF xPan is 0>width="100"</CFIF> height="30" align="center" valign="bottom"><a href="index.cfm?image=1&id=#url.id#&imagePosition=1&Door=#url.door#&Portfolio=Portfolio#PortfolioNo#&Gallery=#url.gallery#&Page=#xpage#"  target="_top"><font color="##333333"><font color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseOver="this.color='Red';" onMouseOut="this.color='##333333';"  style="TEXT-DECORATION: none"><b><cfif len(trim(#qGetDefaultPhotos.PortfolioName#)) GT 0>#qGetDefaultPhotos.PortfolioName#<cfelse>Portfolio #PortfolioNo#</cfif></b></font></a></td>
		</CFIF>
			<cfset NumberTableCells = NumberTableCells+1>
			<cfset PortfolioNo = PortfolioNo+1>
			<cfif PortfolioNo GT MaxPortfolios>
				<cfBreak>
			</cfif>
		</cfloop>
		</tr>
		</table>
		</p>
		


		<cfif PortfolioNo GT MaxPortfolios>
			<cfBreak>
		<CFELSE>
					<img src="../sharedimages/Redlinetoc.gif" width="400" height="1" alt="" border="0"><br>
 		 <img src="../SharedImages/dot_clear.gif" width="1" height="1">
		</cfif>
	</cfloop>


</div><!--- </BODY>
</HTML> --->


<cfinclude template="../../templates/footer_site.cfm">
</cfoutput>




	

