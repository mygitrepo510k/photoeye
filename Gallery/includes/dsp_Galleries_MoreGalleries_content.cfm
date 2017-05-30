<cfoutput>
<cfif isdefined("url.d")>
	<cfset xDay=#url.d#>
<cfelse>
	<!--- Check to see if day or night on the East Coast --->
	<cfif timeformat(now(), "HH") GT 19 or timeformat(now(), "HH") LT 6>
		<cfset xDay=0>
	<cfelse>
		<cfset xDay=1>
	</cfif> 
</cfif>
<cfset xTreePath = "">

<!--- Carrying over the site index page image to the gallery index --->
<CFIF IsDefined("url.P")  and IsDefined("url.G") and IsDefined("url.A")>
	<CFSET xUseSpecificPortfolio = url.G>
<CFELSE>
	<CFSET xUseSpecificPortfolio = 0>
</CFIF>

<cftry>
<cfquery name="qGetMagnum"  datasource="photoeyecom">
	
	SELECT  DISTINCT top 1  NewID() as RandomOrder, G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
    P.Subdirectory as Portfolio, D.GeneralRandomNo, I.RecordNo, I.ImageSizeList, CONVERT(char(20), P.ExhibitionOpened, 102) AS Expr1, I.ImageNumber AS Imagenumber, I.ImagePosition AS IMAGEPOSITION, D.PortfolioName, I.Title
FROM GallerySetup G 
	INNER JOIN GalleryPortfolio P ON G.Custnumber = P.Custnumber 
	INNER JOIN GalleryDefaultPhotos D ON P.Custnumber = D.Custnumber 
	INNER JOIN GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 AND G.Gallery='MagnumArtists' and P.ShowcaseOK=1  and I.NotAvailable <> 4
order by randomorder
</cfquery>  


<!--- Magnum Photos --->
				
					<cfset xLink="Gallery/forms2/index.cfm?id=#qGetMagnum.Custnumber#&image=#qGetMagnum.ImageNumber#&imagePosition=#qGetMagnum.ImagePosition#&Door=3&Portfolio=#qGetMagnum.Portfolio#&Gallery=4">
					<!--- ImageSizer --->									
					<cfset xheight=402>
					<cfset xwidth=402>
					<cfset xImageAddress="#xRelativePath#\Artists\#qGetMagnum.Subdirectory#\#qGetMagnum.Portfolio#\Images_Large\">
					<CFSET xAlt = "&copy; #trim(qGetMagnum.Firstname)# #trim(qGetMagnum.Lastname)#">
					<cfset xImage = "Image#qGetMagnum.ImageNumber#">
					<cfset xImageFormat = "jpg">
					<cfif NOT ListFindNoCase(qGetMagnum.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")>
						<cfinclude template="/templates/ImageSizerCreatewithheightwidth.cfm">
						<cfquery name="qUpdate"  datasource="photoeyecom">
							Update GalleryIndividualPhotos
							Set ImageSizeList = '#ListAppend(qGetMagnum.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")#'
							Where RecordNo = #qGetMagnum.RecordNo#
						</cfquery>
					</cfif>
						
				
					<cfx_imagecr3_3 getimageinfo="#xImageAddress##xImage#_H#xHeight#xW#xWidth#.#xImageFormat#"> 
				
<div class="Centered_Container">
<div class="Title">MORE GALLERIES</div>

<div class="FeatureSpot" style="height:300px;">
		<div class="FeatureSpotImage"><a href="/#xlink#"><img src="/artists/#qGetMagnum.Subdirectory#/#qGetMagnum.Portfolio#/Images_Large/#xImage#_H#xHeight#xW#xWidth#.#xImageFormat#" border="0" ALT="#xAlt#" height="#imagecr.height#" width="#imagecr.width#"></a><span class="GalleryImageAuthor">#trim(qGetMagnum.Firstname)# #trim(qGetMagnum.Lastname)#</span></div>
            <div class="FeatureSpotText" ><div class="FeatureSpotH1"><a href="MagnumArtists/index.cfm">Magnum Photos&reg; Collector's Prints</a> </div>
Magnum Photos Collectors' Prints by great Magnum photographers are available on demand. These are authorized, signed (if the photographer is alive), archivally-produced, fine prints made from the original negative either by the photographer or under the photographer's supervision. Prices vary from photographer to photographer. Please expect 2-4 weeks for delivery. Order by clicking the [$ Purchase Print] button next to the photograph you wish to buy.<div class="FeatureSpotLink"><a href="MagnumArtists/index.cfm">enter gallery...</a></div>
			</div>
		</div>

<cfcatch>
<cfquery name="qGetMagnum"  datasource="photoeyecom">
	
	SELECT  DISTINCT top 1  NewID() as RandomOrder, G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
    P.Subdirectory as Portfolio, D.GeneralRandomNo, I.RecordNo, I.ImageSizeList, CONVERT(char(20), P.ExhibitionOpened, 102) AS Expr1, I.ImageNumber AS Imagenumber, I.ImagePosition AS IMAGEPOSITION, D.PortfolioName, I.Title
FROM GallerySetup G 
	INNER JOIN GalleryPortfolio P ON G.Custnumber = P.Custnumber 
	INNER JOIN GalleryDefaultPhotos D ON P.Custnumber = D.Custnumber 
	INNER JOIN GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 AND G.Gallery='MagnumArtists' and P.ShowcaseOK=1  and I.NotAvailable <> 4
order by randomorder
</cfquery>  


<!--- Magnum Photos --->
				
					<cfset xLink="Gallery/forms2/index.cfm?id=#qGetMagnum.Custnumber#&image=#qGetMagnum.ImageNumber#&imagePosition=#qGetMagnum.ImagePosition#&Door=3&Portfolio=#qGetMagnum.Portfolio#&Gallery=4">
					<!--- ImageSizer --->									
					<cfset xheight=402>
					<cfset xwidth=402>
					<cfset xImageAddress="#xRelativePath#\Artists\#qGetMagnum.Subdirectory#\#qGetMagnum.Portfolio#\Images_Large\">
					<CFSET xAlt = "&copy; #trim(qGetMagnum.Firstname)# #trim(qGetMagnum.Lastname)#">
					<cfset xImage = "Image#qGetMagnum.ImageNumber#">
					<cfset xImageFormat = "jpg">
					<cfif NOT ListFindNoCase(qGetMagnum.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")>
						<cfinclude template="/templates/ImageSizerCreatewithheightwidth.cfm">
						<cfquery name="qUpdate"  datasource="photoeyecom">
							Update GalleryIndividualPhotos
							Set ImageSizeList = '#ListAppend(qGetMagnum.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")#'
							Where RecordNo = #qGetMagnum.RecordNo#
						</cfquery>
					</cfif>
						
				
					<cfx_imagecr3_3 getimageinfo="#xImageAddress##xImage#_H#xHeight#xW#xWidth#.#xImageFormat#"> 
				
<div class="Centered_Container">
<div class="Title">MORE GALLERIES</div>

<div class="FeatureSpot" style="height:300px;">
		<div class="FeatureSpotImage"><a href="/#xlink#"><img src="/artists/#qGetMagnum.Subdirectory#/#qGetMagnum.Portfolio#/Images_Large/#xImage#_H#xHeight#xW#xWidth#.#xImageFormat#" border="0" ALT="#xAlt#" height="#imagecr.height#" width="#imagecr.width#"></a><span class="GalleryImageAuthor">#trim(qGetMagnum.Firstname)# #trim(qGetMagnum.Lastname)#</span></div>
            <div class="FeatureSpotText" ><div class="FeatureSpotH1"><a href="MagnumArtists/index.cfm">Magnum Photos&reg; Collector's Prints</a> </div>
Magnum Photos Collectors' Prints by great Magnum photographers are available on demand. These are authorized, signed (if the photographer is alive), archivally-produced, fine prints made from the original negative either by the photographer or under the photographer's supervision. Prices vary from photographer to photographer. Please expect 2-4 weeks for delivery. Order by clicking the [$ Purchase Print] button next to the photograph you wish to buy.<div class="FeatureSpotLink"><a href="MagnumArtists/index.cfm">enter gallery...</a></div>
			</div>
		</div>

</cfcatch>
</cftry>
		
<!--- Photo Bistro --->

<cftry>
<cfquery name="qGetBistroSetupInfo"  datasource="photoeyecom">
	
	SELECT  DISTINCT top 1  NewID() as RandomOrder, G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
    P.Subdirectory as Portfolio, I.RecordNo, I.ImageSizeList, CONVERT(char(20), P.ExhibitionOpened, 102) AS Expr1, I.ImageNumber AS Imagenumber, I.ImagePosition AS IMAGEPOSITION, I.Title
FROM ArtistSetup G 
	INNER JOIN ArtistPortfolios P ON G.Custnumber = P.Custnumber 
	INNER JOIN ArtistIndividualWorks I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
WHERE   G.Custnumber = P.Custnumber  AND P.ImgQty>0 and P.ShowcaseOK=1  and I.NotAvailable <> 4
order by randomorder
</cfquery>  

<!---
'<cfset page=1>
'<cfset imgBegin=0>
' <cfset imgbeginType1=RAND()>
'	
'<!--- Get 6 Most Recent Openings (show only first below) --->
'<cfquery name="qGetBistroSetupInfo" datasource="photoeyecom">
'SELECT DISTINCT G.SubDirectory as SubDirectory, G.Firstname as Firstname, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, I.ImageNumber as Imagenumber, I.ImagePosition as ImagePosition, I.GeneralRandomNo as GeneralRandomNo,  p.ImgQty as ImageQTy,  P.Subdirectory as Portfolio, P.DateTime as DateTime,  p.ExhibitionOpened,  P.RandomNo, P.AutoID as AutoID, I.RecordNo
'FROM ArtistSetup G INNER JOIN
'     ArtistPortfolios P ON G.Custnumber = P.Custnumber INNER JOIN
'     ArtistIndividualWorks I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
'WHERE  P.ImgQty>0 AND G.Gallery='PhotoBistro' and I.ImagePosition=1  and P.ShowcaseOK=1 
'</cfquery>
'
'<!--- Pick a random number in the right range --->
'<CFSET xRandomNumber = Int(RAND()*qGetBistroSetupInfo.RecordCount)>
'<CFIF xRandomNumber gt qGetBistroSetupInfo.RecordCount>
'	<CFSET xRandomNumber = qGetBistroSetupInfo.RecordCount>
'<CFELSEIF xRandomNumber lt 1>
'	<CFSET xRandomNumber = 1>
'</CFIF>
'
'
'<!--- Set List variable based on autoids retrieved from above query.
'These will be excluded from a future query --->
'<cfset xAutoIDList=ValueList(qGetBistroSetupInfo.AutoID)>
'--->
<cfquery name="qArtistCount" datasource="photoeyecom">
	SELECT Count(*) as Total
	FROM ArtistSetup
	WHERE ShowcaseOK = 1
</cfquery> 

<cfquery name="qImageCount" datasource="photoeyecom">
SELECT Round(Sum(ImgQty), -1) AS Total
FROM ArtistPortfolios
WHERE ShowcaseOK=1 
</cfquery>



<div class="FeatureSpot">
		<div class="FeatureSpotImage" >
		

<cfset xLink="gallery/forms/index.cfm?id=#qGetBistroSetupInfo.Custnumber#&image=#qGetBistroSetupInfo.ImageNumber#&imagePosition=#qGetBistroSetupInfo.ImagePosition#&Door=2&Portfolio=#qGetBistroSetupInfo.Portfolio#&Gallery=4&D=#xday#">
<!--- ImageSizer --->
<cfset xheight=400>
<cfset xwidth=400>
<!---<cfset xsharpen = 0.8>
<cfset xbrightness = 110>--->
<cfset xImageAddress="#xRelativePath#\Artists\#qGetBistroSetupInfo.Subdirectory#\#qGetBistroSetupInfo.Portfolio#\Images_Large\">
<!--- <CFSET xPath =  "http://www.visualserver.com/Artists/#qGetBistroSetupInfo.Subdirectory#/#qGetBistroSetupInfo.Portfolio#/Images_large"> --->
<cfset xImage = "Image#qGetBistroSetupInfo.ImageNumber#.jpg">
<cfset xAlt = "&copy; #qGetBistroSetupInfo.Firstname# #qGetBistroSetupInfo.Lastname#">
<cfset xpath=''>
<!---<cfinclude template="/templates/imagesizer.cfm">
--->	<cfset xImageAddress="#xImageAddress##xImage#">
	
<cfx_imagecr3_3
     load="#xImageAddress#"
     save="c:\inetpub\wwwroot\clients\photoeyecom\html\_cache"
     resize=">#xwidth#x>#xheight#"
     nocache="0"
     strip=0
     rotate=360
	 autocontrast=0
  > 
  
    <cfx_imagecr3_3
 getimageinfo="#expandpath('\_cache\#imagecr.filename#')#"> 
<a href="http://www.photobistro.com/#xlink#" target="_blank"><img src="/_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a><span class="GalleryImageAuthor">#qGetBistroSetupInfo.Firstname# #qGetBistroSetupInfo.Lastname#</span></div>
                        <div class="FeatureSpotText"><div class="FeatureSpotH1"><a href="http://www.photobistro.com" target="_blank">PhotoBistro</a></div>
PhotoBistro is an eclectic mix of art & documentary photography from throughout the world. To keep quality high, acceptance into PhotoBistro is based on a photographer's r&eacute;sum&eacute; or the power
of their imagery.  PhotoBistro artists are not represented by photo-eye but may be contacted directly through their artist pages.<BR><br />PhotoBistro features more than 
 <b>#qImageCount.Total#</b> works from <b>#qArtistCount.Total#</b> photographers worldwide!
<div class="FeatureSpotLink"><a href="http://www.photobistro.com">enter gallery...</a></div>
			</div>
		</div>

<cfcatch>



<div class="FeatureSpot">
		<div class="FeatureSpotImage" >
		

<cfset xLink="Gallery/forms2/index.cfm?id=#qGetBistroSetupInfo.Custnumber#&image=#qGetBistroSetupInfo.ImageNumber#&imagePosition=#qGetBistroSetupInfo.ImagePosition#&Door=2&Portfolio=#qGetBistroSetupInfo.Portfolio#&Gallery=4&D=#xday#">
<!--- ImageSizer --->
<cfset xheight=400>
<cfset xwidth=400>
<!---<cfset xsharpen = 0.8>
<cfset xbrightness = 110>--->
<cfset xImageAddress="#xRelativePath#\Artists\#qGetBistroSetupInfo.Subdirectory#\#qGetBistroSetupInfo.Portfolio#\Images_Large\">
<!--- <CFSET xPath =  "http://www.visualserver.com/Artists/#qGetBistroSetupInfo.Subdirectory#/#qGetBistroSetupInfo.Portfolio#/Images_large"> --->
<cfset xImage = "Image#qGetBistroSetupInfo.ImageNumber#.jpg">
<cfset xAlt = "&copy; #qGetBistroSetupInfo.Firstname# #qGetBistroSetupInfo.Lastname#">
<cfset xpath=''>
<!---<cfinclude template="/templates/imagesizer.cfm">
--->	<cfset xImageAddress="#xImageAddress##xImage#">
	
<cfx_imagecr3_3
     load="#xImageAddress#"
     save="c:\inetpub\wwwroot\clients\photoeyecom\html\_cache"
     resize=">#xwidth#x>#xheight#"
     nocache="0"
     strip=0
     rotate=360
	 autocontrast=0
  > 
  
    <cfx_imagecr3_3
 getimageinfo="#expandpath('\_cache\#imagecr.filename#')#"> 
<a href="http://www.photobistro.com/#xlink#"><img src="/_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a><span class="GalleryImageAuthor">#qGetBistroSetupInfo.Firstname# #qGetBistroSetupInfo.Lastname#</span></div>
            <div class="FeatureSpotText"><div class="FeatureSpotH1"><a href="http://www.photobistro.com" target="_blank">PhotoBistro</a></div>
PhotoBistro is an eclectic mix of art & documentary photography from throughout the world. To keep quality high, acceptance into PhotoBistro is based on a photographer's r&eacute;sum&eacute; or the power
of their imagery.  PhotoBistro artists are not represented by photo-eye but may be contacted directly through their artist pages.<BR><br />PhotoBistro features more than 
 <b>#qImageCount.Total#</b> works from <b>#qArtistCount.Total#</b> photographers worldwide!
<div class="FeatureSpotLink"><a href="http://www.photobistro.com">enter gallery...</a></div>
			</div>
		</div>
</cfcatch>
</cftry>


<cftry>
<!--- PhotoBeijing  custnumber = 10129--->
<!--- Visualserverimages is a virtual directory --->
<cfset xCustnumber=10129>
<cfquery name="qGetFotoFest"  datasource="photoeyecom">
	SELECT  DISTINCT top 1 *, NewID() as RandomOrder from vs3_images where custnumber=#xCustnumber# order by RandomOrder
</cfquery>  

<cfquery name="qGetFotoFestArtist"  datasource="photoeyecom">
	SELECT  DISTINCT top 1 title from vs3_portfolios where custnumber=#xCustnumber# and PortfolioID=#qGetFotofest.portfolioid# 
</cfquery>  


<!--- ImageSizer --->
<cfset xheight=400>
<cfset xwidth=400>
<cfset xImageAddress="#xRelativePath#\vs\userimages\#qGetFotoFest.container#\#xCustnumber#\#qGetFotoFest.bin#\">
<!--- <CFSET xPath =  "http://www.visualserver.com/Artists/#qGetBistroSetupInfo.Subdirectory#/#qGetBistroSetupInfo.Portfolio#/Images_large"> --->
<cfset xImage = "#qGetFotofest.Imageid#_large.jpg"> <!--- #qGetBistroSetupInfo.Firstname# #qGetBistroSetupInfo.Lastname# --->
<cfset xAlt = "&copy; #qGetFotoFestArtist.title#">
<cfset xpath=''>
<!--- Can't get the imagesizer to work each time. It results in a black image sometimes --->
<!---<cfinclude template="/templates/imagesizer.cfm">
--->
<cfset xImageAddress="#xImageAddress##xImage#">
	
<cfx_imagecr3_3
     load="#xImageAddress#"
     save="c:\inetpub\wwwroot\clients\photoeyecom\html\_cache"
     resize=">#xwidth#x>#xheight#"
     nocache="0"
     strip=0
     rotate=360
	 autocontrast=0
  > 
  
    <cfx_imagecr3_3
 getimageinfo="#expandpath('\_cache\#imagecr.filename#')#"> 
  
<div class="FeatureSpot" style="height:350px;">
		<div class="FeatureSpotImage"><a href="http://fotofestbeijing.visualserver.com" target="_blank"><img src="/_cache/#imagecr.filename#" border="0" ALT="#xAlt#"  height='#imagecr.height#' width='#imagecr.width#'/></a><span class="GalleryImageAuthor">#qGetFotoFestArtist.title#</span></div>
            <div class="FeatureSpotText"><div class="FeatureSpotH1"><a href="http://fotofestbeijing.visualserver.com">Meeting Place
FotoFest Beijing 2006</a> </div>
In October 2006, FotoFest International, China Hewlett Packard and a team of Chinese photographers and businessmen collaborated to create an international portfolio review program for Chinese photographers. Modeled on FotoFest's portfolio review program in Houston, TX, the Meeting Place FotoFest Beijing was an unprecedented event in China.<br /><br />

From 278 Chinese photographic artists, this web gallery, developed and hosted by photo-eye using <a href="../visualserver/">VisualServer</a>--photo-eye's website creator and content manager tools--presents 34 artists selected by participating reviewers.<div class="FeatureSpotLink"><a href="http://fotofestbeijing.visualserver.com" target="_blank">enter gallery...</a></div>
			</div>
		</div>
		
</div>

<cfcatch>
<!--- PhotoBeijing  custnumber = 10129--->
<!--- Visualserverimages is a virtual directory --->
<cfset xCustnumber=10129>
<cfquery name="qGetFotoFest"  datasource="photoeyecom">
	SELECT  DISTINCT top 1 *, NewID() as RandomOrder from vs3_images where custnumber=#xCustnumber# order by RandomOrder
</cfquery>  

<cfquery name="qGetFotoFestArtist"  datasource="photoeyecom">
	SELECT  DISTINCT top 1 title from vs3_portfolios where custnumber=#xCustnumber# and PortfolioID=#qGetFotofest.portfolioid# 
</cfquery>  


<!--- ImageSizer --->
<cfset xheight=400>
<cfset xwidth=400>
<cfset xImageAddress="#xRelativePath#\vs\userimages\#qGetFotoFest.container#\#xCustnumber#\#qGetFotoFest.bin#\">
<!--- <CFSET xPath =  "http://www.visualserver.com/Artists/#qGetBistroSetupInfo.Subdirectory#/#qGetBistroSetupInfo.Portfolio#/Images_large"> --->
<cfset xImage = "#qGetFotofest.Imageid#_large.jpg"> <!--- #qGetBistroSetupInfo.Firstname# #qGetBistroSetupInfo.Lastname# --->
<cfset xAlt = "&copy; #qGetFotoFestArtist.title#">
<cfset xpath=''>
<!--- Can't get the imagesizer to work each time. It results in a black image sometimes --->
<!---<cfinclude template="/templates/imagesizer.cfm">
--->
<cfset xImageAddress="#xImageAddress##xImage#">
	
<cfx_imagecr3_3
     load="#xImageAddress#"
     save="c:\inetpub\wwwroot\clients\photoeyecom\html\_cache"
     resize=">#xwidth#x>#xheight#"
     nocache="0"
     strip=0
     rotate=360
	 autocontrast=0
  > 
  
    <cfx_imagecr3_3
 getimageinfo="#expandpath('\_cache\#imagecr.filename#')#"> 
  
<div class="FeatureSpot" style="height:350px;">
		<div class="FeatureSpotImage"><a href="http://fotofestbeijing.visualserver.com"><img src="/_cache/#imagecr.filename#" border="0" ALT="#xAlt#"  height='#imagecr.height#' width='#imagecr.width#'/></a><span class="GalleryImageAuthor">#qGetFotoFestArtist.title#</span></div>
            <div class="FeatureSpotText"><div class="FeatureSpotH1"><a href="http://fotofestbeijing.visualserver.com">Meeting Place
FotoFest Beijing 2006</a> </div>
In October 2006, FotoFest International, China Hewlett Packard and a team of Chinese photographers and businessmen collaborated to create an international portfolio review program for Chinese photographers. Modeled on FotoFest's portfolio review program in Houston, TX, the Meeting Place FotoFest Beijing was an unprecedented event in China.<br /><br />

From 278 Chinese photographic artists, this web gallery, developed and hosted by photo-eye using <a href="../visualserver/">VisualServer</a>--photo-eye's website creator and content manager tools--presents 34 artists selected by participating reviewers.<div class="FeatureSpotLink"><a href="http://fotofestbeijing.visualserver.com">enter gallery...</a></div>
			</div>
		</div>
		
</div>
</cfcatch>
</cftry>

</cfoutput>
