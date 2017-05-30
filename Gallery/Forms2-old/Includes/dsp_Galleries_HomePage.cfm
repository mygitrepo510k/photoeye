<cfparam name="url.page" default="" type="string">
<cfparam name="url.id" default="">
<!--- Somehow lots of people link in without definining url.id, it seems silly to pick this for them, so if it's undefined send them to the gallery home page --->
<CFIF url.id IS "">
	<CFLOCATION URL="../../forms2/index.cfm">
</CFIF>

<cfif URL.Page IS NOT "">
	<cfset xPage = #URL.Page#>
<cfelse>
	<cfset xPage = "">
</cfif>	

<cfinclude template="/gallery/forms2/includes/qry_Galleries.cfm">
<cfset xPageTitle = "#qGetSetup.FirstName# #qGetSetup.LastName# at photo-eye Gallery">
<cfinclude template="../../Includes/dsp_Galleries_index_top.cfm">

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

<cfif qGetSetup.Gallery is "RepresentedArtists">
		<CFSET xTitle = "Gallery - Santa Fe">
		<cfset xGallery=1>
		<cfset xGalleryName='REPRESENTEDARTISTS'>
		<CFSET xHomeLink = "#aGalleryDirectory#/RepresentedArtists/HomepagePE.cfm">
<cfelseif qGetSetup.Gallery is "PhotographersShowcase">
		<CFSET xTitle = "Photographer's Showcase">
		<cfset xGallery=2>
		<cfset xGalleryName='PHOTOSHOWCASE'>
		<CFSET xHomeLink = "#aGalleryDirectory#/Photoshowcase/HomepagePSnew.cfm">
<cfelseif qGetSetup.Gallery is "RepresentedArtists">
		<CFSET xTitle = "Magnum Photos">
		<cfset xGallery=3>
		<cfset xGalleryName='MagnumArtists'>
		<CFSET xHomeLink = "#aGalleryDirectory#/MagnumArtists/HomepageMA.cfm">
</cfif>
<CFSET xPathToRoot="../../">
<CFSET xShowBackButton = 1>
<CFSET xShowMenu = 1>

<!--- Set the page title so photographer gets indexed by google, etc. --->
<cfif xtitle is "Photographer's Showcase" or xtitle is "Gallery - Santa Fe" or xtitle is "Magnum Photos">
	<cfparam name="xWindowTitle" default = "#qGetSetup.FirstName# #qGetSetup.LastName#">
</cfif>



<CFOUTPUT>

<!--- If this is a Popup window show close window --->
<cfif StructKeyExists(URL,'DOOR') AND url.door is 4><a href="javascript:window.close()">
	<FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Maroon';"  style="TEXT-DECORATION: none"><b>Close Window</b></font></a>
</CFIF>

<!--- Show Artists Name --->
<div id="Artist_Info" style="text-align:center;margin-left:0;">#qGetSetup.FirstName# #qGetSetup.LastName#
 <cfif qGetSetup.FirstName is "Nick" and qGetSetup.LastName is "Brandt">
	 <!--- <div style="font-size:18px;margin-top:5px;line-height:18px;">New Work Release Date</div>
	<div style="font-size:18px;">Wednesday, September 14th</div>
	<!--- <div style="font-size:14px; margin-top:5px; line-height:18px;">To be notified of this important new work as soon as it is released,</div> --->
	<div style="font-size:14px;">   contact Anne Kelly 505.988.5152 x121, <a href="mailto:anne@photoeye.com?Subject=Nick Brandt New Work Notification">anne@photoeye.com</a>.<br><br>View Nick Brandt's previous work below.</div>	 --->
</cfif> 
</div>
<!---<div style="text-align:center;">
<cfif qGetPortfolios.recordcount GT 1>
	P O R T F O L I O S
<cfelse>
	P O R T F O L I O
</cfif></div>--->

<br>

  
<CFSET MaxPortfolios=qGetPortfolios.recordcount>

<!--- 09/20/2010 Added by Daniel.  For problem when panoramics are shown alongside regular portfolios. --->
<cfset TotalPanos = 0>
<cfloop query="qGetPortfolios">
	<cfif Panorama IS 1>
		<cfset TotalPanos += 1 />
	</cfif>
</cfloop>

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

<div align="center">

<!---
Modified 09/20/2010 by Daniel, to account for Panoramic / Standard mix
--->
<div id="Portfolios" style="display:table;text-align:center;<cfif MaxPortfolios LT 5 AND TotalPanos LTE 0>width:<cfif CGI.HTTP_USER_AGENT CONTAINS 'IE'>#((MaxPortfolios)*130)#<cfelse>#((MaxPortfolios+1)*120)#</cfif>px;overflow:hidden;<cfelse>height:#ceiling((MaxPortfolios+1)/5)+TotalPanos*500#px</cfif>">
<div id="Img_Container">
<cfloop query="qGetPortfolios" startrow="1" endrow="#MaxPortfolios#">

	<!--- Panorama? --->
	<CFIF Panorama is 1>
		<CFSET xPan = 1>
	<CFELSE>	
		<CFSET xPan = 0>
	</CFIF>
		
<!---
Added 09/20/2010 by Daniel
--->
<cfif xPan>
	<div style='width:610px;'>
<cfelse>
	<div>
</cfif>

<a href="/gallery/forms2/index.cfm?image=1&id=#url.id#&imagePosition=1&Door=#url.door#&Portfolio=#Subdirectory#&Gallery=#url.gallery#&Page=#xpage#">

<CFQUERY NAME="qGetImagePosition" DATASOURCE="photoeyecom">
	SELECT TOP 1 GalleryIndividualPhotos.ImagePosition, GalleryIndividualPhotos.ImageNumber, GalleryPortfolio.Custnumber, GalleryPortfolio.SubDirectory, GalleryIndividualPhotos.ImageSizeList, GalleryIndividualPhotos.RecordNo, GalleryIndividualPhotos.PortfolioName
	FROM GalleryPortfolio INNER JOIN GalleryIndividualPhotos ON GalleryPortfolio.Custnumber = GalleryIndividualPhotos.Custnumber
	WHERE (GalleryPortfolio.Custnumber = <cfqueryparam value="#url.id#" cfsqltype="CF_SQL_INTEGER">) AND (GalleryPortfolio.ShowcaseOK = 1) AND (GalleryIndividualPhotos.PortfolioName = '#SubDirectory#')
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
<!--- Before Raymond Meeks --->
<!--- This broke when image1 was NOT the image chosen as Position 1 --->
<!--- <cfset xImage = "Image#qGetImagePosition.ImageNumber#">--->
<cfif qGetSetup.Custnumber is 52739>
<cfset xImage = "Image#qGetImagePosition.ImagePosition#">
<cfelse>
<cfset xImage = "Image#qGetImagePosition.ImageNumber#">
</cfif>
<cfset xImageAddress="#xRelativePath#\Artists\#qGetSetup.Subdirectory#\#Subdirectory#\Images_Large\">							
<cfset xAlt = "Enter Gallery">
<cfset xImageFormat = "jpg">

<!--- Test purposes --->
<cfif qGetSetup.Custnumber is 0>
<cfif NOT ListFindNoCase(qGetImagePosition.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")>
yes<br />Image#qGetImagePosition.ImagePosition#<br />
#xRelativePath#\Artists\#qGetSetup.Subdirectory#\#Subdirectory#\Images_Large\"
	
"Image#qGetImagePosition.ImageNumber#">
	No #variables.xheight#x#variables.xwidth#<br />
	list=#ListFindNoCase(qGetImagePosition.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")#<br />
	findnocase=#qGetImagePosition.ImageSizeList#, #variables.xheight#x#variables.xwidth#", "~")<br />
		SELECT TOP 1 GalleryIndividualPhotos.ImagePosition, GalleryIndividualPhotos.ImageNumber, GalleryPortfolio.Custnumber, GalleryPortfolio.SubDirectory, GalleryIndividualPhotos.ImageSizeList, GalleryIndividualPhotos.RecordNo, GalleryIndividualPhotos.PortfolioName
	FROM GalleryPortfolio INNER JOIN GalleryIndividualPhotos ON GalleryPortfolio.Custnumber = GalleryIndividualPhotos.Custnumber
	WHERE (GalleryPortfolio.Custnumber = <cfqueryparam value="#url.id#" cfsqltype="CF_SQL_INTEGER"> ) AND (GalleryPortfolio.ShowcaseOK = 1) AND (GalleryIndividualPhotos.PortfolioName = '#SubDirectory#')
	ORDER BY GalleryIndividualPhotos.ImagePosition
	<cfinclude template="/templates/imagesizercreateRaymond.cfm">
	<cfquery name="qUpdate"  datasource="photoeyecom">
		Update GalleryIndividualPhotos
		Set ImageSizeList = '#ListAppend(qGetImagePosition.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")#'
		Where RecordNo = #qGetImagePosition.RecordNo#
	</cfquery>
	<cfelse>
	<br />Image#qGetImagePosition.ImagePosition#<br />#xRelativePath#\Artists\#qGetSetup.Subdirectory#\#Subdirectory#\Images_Large\"
	
"Image#qGetImagePosition.ImageNumber#">
	No #variables.xheight#x#variables.xwidth#<br />
	list=#ListFindNoCase(qGetImagePosition.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")#<br />
	findnocase=#qGetImagePosition.ImageSizeList#, #variables.xheight#x#variables.xwidth#", "~")<br />
		SELECT TOP 1 GalleryIndividualPhotos.ImagePosition, GalleryIndividualPhotos.ImageNumber, GalleryPortfolio.Custnumber, GalleryPortfolio.SubDirectory, GalleryIndividualPhotos.ImageSizeList, GalleryIndividualPhotos.RecordNo, GalleryIndividualPhotos.PortfolioName
	FROM GalleryPortfolio INNER JOIN GalleryIndividualPhotos ON GalleryPortfolio.Custnumber = GalleryIndividualPhotos.Custnumber
	WHERE (GalleryPortfolio.Custnumber = <cfqueryparam value="#url.id#" cfsqltype="CF_SQL_INTEGER">) AND (GalleryPortfolio.ShowcaseOK = 1) AND (GalleryIndividualPhotos.PortfolioName = '#SubDirectory#')
	ORDER BY GalleryIndividualPhotos.ImagePosition
</cfif>

<CFQUERY NAME="qShowcaseGalleryDefaultPhotos"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryDefaultPhotos where custnumber=<cfqueryparam value="#url.id#" cfsqltype="CF_SQL_INTEGER"> AND SUBDIRECTORY=<cfqueryparam value="#qGetImagePosition.PortfolioName#" cfsqltype="CF_SQL_CHAR"> 
</CFQUERY>

<!--- Portfolio Title --->
<cfif len(#qShowcaseGalleryDefaultPhotos.portfolioName#) is 0 and #qShowcasePortfolioQTY.recordcount# GT 1>
	 <cfset xPortfolioTitle="#left(qShowcasePortfolio.Subdirectory,9)# #mid(qShowcasePortfolio.Subdirectory,10,2)#">
<cfelse>
	<cfset xPortfolioTitle="#qShowcasePortfolio.Subdirectory#">
</cfif>


<img src="/artists/#qGetSetup.Subdirectory#/#qGetImagePosition.PortfolioName#/Images_Large/#xImage#_H#xHeight#xW#xWidth#.#xImageFormat#" border="0" title="#qGetSetup.firstname# #qGetSetup.lastname#: #xPortfolioTitle#" ALT="#qGetSetup.firstname# #qGetSetup.lastname#: #xPortfolioTitle#"></a><br />
#xPortfolioTitle#
<!--- End ImageSizer --->

<cfelse>

<cfif NOT ListFindNoCase(qGetImagePosition.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")>
	<cfinclude template="/templates/imagesizercreate.cfm">
	<cfquery name="qUpdate"  datasource="photoeyecom">
		Update GalleryIndividualPhotos
		Set ImageSizeList = '#ListAppend(qGetImagePosition.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")#'
		Where RecordNo = #qGetImagePosition.RecordNo#
	</cfquery>
</cfif>

<CFQUERY NAME="qShowcaseGalleryDefaultPhotos"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryDefaultPhotos where custnumber=<cfqueryparam value="#url.id#" cfsqltype="CF_SQL_INTEGER"> AND SUBDIRECTORY=<cfqueryparam value="#qGetImagePosition.PortfolioName#" cfsqltype="CF_SQL_CHAR"> 
</CFQUERY>

<!--- Portfolio Title --->
<cfif len(#qShowcaseGalleryDefaultPhotos.portfolioName#) is 0 and #qShowcasePortfolioQTY.recordcount# GT 1>
	 <cfset xPortfolioTitle="#left(qShowcasePortfolio.Subdirectory,9)# #mid(qShowcasePortfolio.Subdirectory,10,2)#">
<cfelse>
	<cfset xPortfolioTitle="#qShowcaseGalleryDefaultPhotos.portfolioName#">
</cfif>


<img src="/artists/#qGetSetup.Subdirectory#/#qGetImagePosition.PortfolioName#/Images_Large/#xImage#_H#xHeight#xW#xWidth#.#xImageFormat#" border="0" title="#qGetSetup.firstname# #qGetSetup.lastname#: #xPortfolioTitle#" ALT="#qGetSetup.firstname# #qGetSetup.lastname#: #xPortfolioTitle#"></a><br /><br />#xPortfolioTitle#</div>

<!--- End ImageSizer --->


</cfif>

</cfloop>
</div>
</div>
</cfoutput>
<script type="text/javascript">
function sizeImgContainers(){
	imgarr = $$('#Img_Container div img');
	divarr = $$('#Img_Container div');
	counter = 0;
	while(counter < imgarr.length){
		if(imgarr[counter].getHeight() < 120){
		<cfif CGI.HTTP_USER_AGENT CONTAINS "IE">divarr[counter].setStyle({paddingTop: ((122-imgarr[counter].getHeight())+'px')});<cfelse>divarr[counter].setStyle({height: ((185-(122-imgarr[counter].getHeight()))+'px'), paddingTop: ((122-imgarr[counter].getHeight())+'px')});</cfif>
		}
		divarr[counter].hide();
		new Effect.Appear(divarr[counter], {duration: .2, queue: 'end'});
		counter++;
	}
}
</script>
</div>


	

