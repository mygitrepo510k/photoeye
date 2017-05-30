
<!--- Somehow lots of people link in without definining url.id, it seems silly to pick this for them, so if it's undefined send them to the gallery home page --->
<CFIF not IsDefined("url.id")>
	<CFLOCATION URL="../index.cfm">
</CFIF>

<cfif isdefined("URL.Page")>
	<cfset xPage = #URL.Page#>
<cfelse>
	<cfset xPage = "">
</cfif>	

<!--- Get all Portfolios regardless of whether or not the showcase ok=1 --->

<CFQUERY NAME="qGetPortfolios"
         DATASOURCE="photoeyecom">
SELECT *
FROM GALLERYPORTFOLIO
WHERE CUSTNUMBER = #URL.id#  and ShowcaseOK=1 Order by DateTime DESC



<!--- and Step11=1 ---> <!--- and ShowcaseOK=1 ---> 
</CFQUERY> 

<!--- <CFQUERY NAME="qGetPortfoliosToShow"
         DATASOURCE="photoeyecom">
SELECT *
FROM GALLERYPORTFOLIO
WHERE CUSTNUMBER = #URL.id# and DoNotShow=0 <!--- and Step11=1 ---> <!--- and ShowcaseOK=1 ---> Order by DateTime DESC
</CFQUERY>  --->



<!--- Get the Setup Information --->
<CFQUERY NAME="qGetSetup"
         DATASOURCE="photoeyecom">
SELECT *
FROM GALLERYSETUP
WHERE CUSTNUMBER = #URL.id#
</CFQUERY> 

<!--- Set variables based on what kind of Gallery we have here --->

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


<CFSET xShowMenu = 0>
<CFSET xShowDropDowns = 0>
<CFSET xShowHome = 1>

<!--- Set variables based on what kind of Gallery we have here --->
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

<!--- Set the page title so photographer get's indexed by google, etc. --->
<cfif xtitle is "Photographer's Showcase" or xtitle is "Gallery - Santa Fe" or xtitle is "Magnum Photos">
	<cfparam name="xWindowTitle" default = "#qGetSetup.FirstName# #qGetSetup.LastName#">
</cfif>

<!--- Header --->
<cfinclude template="../../templates/Header.cfm">

<DIV ALIGN="CENTER">
<CFOUTPUT>

<!--- If this is a Popup window show close window --->
<cfif #url.door# is 4><a href="javascript:window.close()">
	<FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Maroon';"  style="TEXT-DECORATION: none"><b>Close Window</b></font></a>
</CFIF>

<!--- Show Artists Name --->
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

<!--- 2/7/05 Added by Rick. Copied this from PhotoBistro to Photoshowcase. In Bistro, to correct Ronn Spencer's Bistro where he had turned off portfolio 1. It was getting portfolio 1 thumb instead of the portfolio 2 thumb since the max number of portfolios was 1 and we artificially started it with 1 --->

<!--- <CFQUERY NAME="qGetPortfoliosStart"
         DATASOURCE="photoeyecom">
		 

SELECT  top 1 *
FROM         GalleryPortfolio INNER JOIN
                      GalleryIndividualPhotos ON GalleryPortfolio.Custnumber = GalleryIndividualPhotos.Custnumber
WHERE     (GalleryPortfolio.Custnumber = #URL.id#) AND (GalleryPortfolio.ShowcaseOK = 1)
<!---

SELECT top 1 *
FROM ArtistPortfolios
WHERE CUSTNUMBER = #URL.id# and SHOWCASEOK=1 --->
</CFQUERY> --->

<!--- This will work up to 8 different portfolios that are not used --->
	
	<!--- RR 20060507 removed this unused line --->
	<!--- <cfset xPortfolioNo=#mid(qGetPortfoliosStart.Subdirectory,10,1)#> --->

<!--- Make New Table --->
<div align="center">
<cfset NumberTableCells = 0>
<table cellspacing="10" align="center">
<!--- Make New Row --->
<tr align="center">
<cfloop query="qGetPortfolios" startrow="1" endrow="#MaxPortfolios#">

	<td width="100" height="90" align="center" valign="bottom">			
	<!--- Panorama? --->
	<CFIF Panorama is 1>
		<CFSET xPan = 1>
	<CFELSE>	
		<CFSET xPan = 0>
	</CFIF>
		

		<a href="index.cfm?image=1&id=#url.id#&imagePosition=1&Door=#url.door#&Portfolio=#Subdirectory#&Gallery=#url.gallery#&Page=#xpage#">

<CFQUERY NAME="qGetImagePosition" DATASOURCE="photoeyecom">
	SELECT TOP 1 GalleryIndividualPhotos.ImagePosition, GalleryIndividualPhotos.ImageNumber, GalleryPortfolio.Custnumber, GalleryPortfolio.SubDirectory, GalleryIndividualPhotos.ImageSizeList, GalleryIndividualPhotos.RecordNo, GalleryIndividualPhotos.PortfolioName
	FROM GalleryPortfolio INNER JOIN GalleryIndividualPhotos ON GalleryPortfolio.Custnumber = GalleryIndividualPhotos.Custnumber
	WHERE (GalleryPortfolio.Custnumber = #URL.id#) AND (GalleryPortfolio.ShowcaseOK = 1) AND (GalleryIndividualPhotos.PortfolioName = '#SubDirectory#')
	ORDER BY GalleryIndividualPhotos.ImagePosition
</CFQUERY>

<!--- ImageSizer --->		
<CFIF xPan is 1>
	<cfset xheight=220>
	<cfset xwidth=610>
<CFELSE>
	<cfset xheight=120>
	<cfset xwidth=120>
</CFIF>
<cfset xImage = "Image#qGetImagePosition.ImageNumber#">
<cfset xImageAddress="#xRelativePath#\Artists\#qGetSetup.Subdirectory#\#Subdirectory#\Images_Large\">							
<cfset xAlt = "Enter Gallery">
<cfset xImageFormat = "jpg">
<cfif NOT ListFindNoCase(qGetImagePosition.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")>
	<cfinclude template="../../templates/imagesizercreate.cfm">
	<cfquery name="qUpdate"  datasource="photoeyecom">
		Update GalleryIndividualPhotos
		Set ImageSizeList = '#ListAppend(qGetImagePosition.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")#'
		Where RecordNo = #qGetImagePosition.RecordNo#
	</cfquery>
</cfif>

<img src="../../artists/#qGetSetup.Subdirectory#/#qGetImagePosition.PortfolioName#/Images_Large/#xImage#_H#xHeight#xW#xWidth#.#xImageFormat#" border="0" ALT="#xAlt#"></a>
<!--- End ImageSizer --->



</td>
			
<cfset NumberTableCells = NumberTableCells+1>
<cfif NumberTableCells is 5>
	<cfset NumberTableCells = 0>
	</tr>
	<tr><td colspan="5" align="center">
		 <img src="../SharedImages/dot_clear.gif" width="1" height="1">
	<img src="../sharedimages/Redlinetoc.gif" width="400" height="1" alt="" border="0"><br>
 		 <img src="../SharedImages/dot_clear.gif" width="1" height="1">
	</td></tr>
	<tr>
</cfif>
</cfloop>

</div>

<cfinclude template="../../templates/footer_site.cfm">
</cfoutput>




	

