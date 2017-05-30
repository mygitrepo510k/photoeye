
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
<!--- ShowcaseOK=1 was taken out because of the discontinuous portfolio ok anomoly --->
<!--- However it seems like this would be just fine --->

<CFQUERY NAME="qGetPortfolios"
         DATASOURCE="photoeyecom">
SELECT *
FROM GALLERYPORTFOLIO
WHERE CUSTNUMBER = #URL.id#  and ShowcaseOK=1 <!--- and Step11=1 ---> <!--- and ShowcaseOK=1 ---> Order by DateTime DESC
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
<cfset PortfolioNo=1>

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


<!--- ImageSizer --->		
<CFIF xPan is 1>
	<cfset xheight=220>
	<cfset xwidth=610>
<CFELSE>
	<cfset xheight=120>
	<cfset xwidth=120>
</CFIF>
<cfset xImageAddress="#xRelativePath#\Artists\#qGetSetup.Subdirectory#\#Subdirectory#\Images_Large\">							
<cfset xAlt = "Enter Gallery">
<!--- <cfset xImage = "Image#qGetIndividualPhotos.ImageNumber#.jpg"> --->
<cfset xImage = "Image1.jpg">

<cfinclude template="../../templates/imagesizer.cfm">

<img src="../../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a>
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




	

