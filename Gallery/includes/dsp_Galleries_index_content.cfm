 <cfoutput>

<!--- Carrying over the site index page image to the gallery index --->
<CFIF IsDefined("url.P")  and IsDefined("url.G") and IsDefined("url.A")>
	<CFSET xUseSpecificPortfolio = url.G>
<CFELSE>
	<CFSET xUseSpecificPortfolio = 0>
</CFIF>

<cfset xImgPosition=RANDRANGE(1,5)>
<!--- For specific image --->
<cfset xImgPosition=18>
<cfquery name="qGetSantaFe"  datasource="photoeyecom">
SELECT  DISTINCT TOP 1 G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
	P.Subdirectory as Portfolio, D.GeneralRandomNo, I.RecordNo, I.ImageSizeList, CONVERT(char(20), P.ExhibitionOpened, 102) AS Expr1, I.ImageNumber AS Imagenumber, I.ImagePosition AS IMAGEPOSITION, D.PortfolioName, I.Title
FROM GallerySetup G 
	INNER JOIN GalleryPortfolio P ON G.Custnumber = P.Custnumber 
	INNER JOIN GalleryDefaultPhotos D ON P.Custnumber = D.Custnumber 
	INNER JOIN GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber 
WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 <!---AND D.GeneralRandomNo<#imgbeginType1#---> AND G.Gallery='RepresentedArtists' and P.ShowcaseOK=1  AND (I.ImagePosition = #xImgPosition#) and I.NotAvailable <> 4
<CFIF xUseSpecificPortfolio is 1> AND P.Subdirectory = '#url.P#' AND G.LastName = '#url.A#'</CFIF>
ORDER BY  CONVERT(char(20), P.ExhibitionOpened, 102) DESC, D.GeneralRandomNo  
</cfquery>



<!--- ORDER BY D.GeneralRandomNo  --->
<cfif qGetSantaFe.recordcount is 0>

	<cfset xImgPosition=RANDRANGE(1,5)>
    <!--- For specific image --->
	<cfset xImgPosition=18>
	<cfquery name="qGetSantaFe"  datasource="photoeyecom">
	SELECT  DISTINCT TOP 1 G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
	    P.Subdirectory as Portfolio, D.GeneralRandomNo, I.RecordNo, I.ImageSizeList, CONVERT(char(20), P.ExhibitionOpened, 102) AS Expr1, I.ImageNumber AS Imagenumber, I.ImagePosition AS IMAGEPOSITION, D.PortfolioName, I.Title
	FROM GallerySetup G 
		INNER JOIN GalleryPortfolio P ON G.Custnumber = P.Custnumber 
		INNER JOIN GalleryDefaultPhotos D ON P.Custnumber = D.Custnumber 
		INNER JOIN GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber 
	WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 <!---AND D.GeneralRandomNo<#imgbeginType1#---> AND G.Gallery='RepresentedArtists' and P.ShowcaseOK=1  AND (I.ImagePosition = #xImgPosition#) and I.NotAvailable <> 4
	<CFIF xUseSpecificPortfolio is 1> AND P.Subdirectory = '#url.P#' AND G.LastName = '#url.A#'</CFIF>
	ORDER BY  CONVERT(char(20), P.ExhibitionOpened, 102) DESC, D.GeneralRandomNo  
	</cfquery>
	</cfif>
    
    
	<!--- ORDER BY D.GeneralRandomNo DESC --->
    <cfset xImgPosition=RANDRANGE(1,5)>
	<cfquery name="qGetShowcase"  datasource="photoeyecom">
	SELECT DISTINCT TOP 1 G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
	    P.Subdirectory as Portfolio, D.GeneralRandomNo, I.RecordNo, I.ImageSizeList, CONVERT(char(20), P.ExhibitionOpened, 102) AS Expr1, I.ImageNumber AS Imagenumber, I.ImagePosition AS IMAGEPOSITION, D.PortfolioName, I.Title
	FROM GallerySetup G 
		INNER JOIN GalleryPortfolio P ON G.Custnumber = P.Custnumber 
		INNER JOIN GalleryDefaultPhotos D ON P.Custnumber = D.Custnumber 
		INNER JOIN GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber and I.NotAvailable <> 4
	WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 <!--- AND D.GeneralRandomNo>#imgbeginType2#  --->AND G.Gallery='PhotoShowcase' and P.ShowcaseOK=1  AND (I.ImagePosition =  #xImgPosition#) and I.NotAvailable <> 4
	<CFIF xUseSpecificPortfolio is 2> AND P.Subdirectory = '#url.P#' AND G.LastName = '#url.A#'</CFIF>
	ORDER BY  CONVERT(char(20), P.ExhibitionOpened, 102) DESC, D.GeneralRandomNo 
	</cfquery>
	
	<!--- <cfif CGI.X_FORWARDED_FOR is "71.210.204.102">
	<cfdump var="#qGetShowcase#"> 
	</cfif> --->
	<!--- ORDER BY D.GeneralRandomNo --->
	<!--- ORDER BY D.GeneralRandomNo --->
	<!--- Takes into account random number being too high--->
	<cfif qGetShowcase.recordcount is 0>

    <cfset xImgPosition=RANDRANGE(1,5)>
		<cfquery name="qGetShowcase"  datasource="photoeyecom">
	SELECT DISTINCT TOP 1 G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
	    P.Subdirectory as Portfolio, D.GeneralRandomNo, I.RecordNo, I.ImageSizeList, CONVERT(char(20), P.ExhibitionOpened, 102) AS Expr1, I.ImageNumber AS Imagenumber, I.ImagePosition AS IMAGEPOSITION, D.PortfolioName, I.Title
	FROM GallerySetup G 
		INNER JOIN GalleryPortfolio P ON G.Custnumber = P.Custnumber 
		INNER JOIN GalleryDefaultPhotos D ON P.Custnumber = D.Custnumber 
		INNER JOIN GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber 
	WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 <!--- AND D.GeneralRandomNo<#imgbeginType2#  --->AND G.Gallery='PhotoShowcase' and P.ShowcaseOK=1  AND (I.ImagePosition =  #xImgPosition#) and I.NotAvailable <> 4
	<CFIF xUseSpecificPortfolio is 2> AND P.Subdirectory = '#url.P#' AND G.LastName = '#url.A#'</CFIF>
	ORDER BY  CONVERT(char(20), P.ExhibitionOpened, 102) DESC, D.GeneralRandomNo 
		</cfquery>
</cfif>
<!--- ORDER BY D.GeneralRandomNo DESC --->


<cfquery name="qGetMagnum"  datasource="photoeyecom">
<cfset xImgPosition=RANDRANGE(1,5)>
SELECT  DISTINCT top 1 G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
    P.Subdirectory as Portfolio, D.GeneralRandomNo, I.RecordNo, I.ImageSizeList, CONVERT(char(20), P.ExhibitionOpened, 102) AS Expr1, I.ImageNumber AS Imagenumber, I.ImagePosition AS IMAGEPOSITION, D.PortfolioName, I.Title
FROM GallerySetup G 
	INNER JOIN GalleryPortfolio P ON G.Custnumber = P.Custnumber 
	INNER JOIN GalleryDefaultPhotos D ON P.Custnumber = D.Custnumber 
	INNER JOIN GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 <!---AND D.GeneralRandomNo>#imgbeginType3#---> AND G.Gallery='MagnumArtists' and P.ShowcaseOK=1  AND (I.ImagePosition =  #xImgPosition#) and I.NotAvailable <> 4
<CFIF xUseSpecificPortfolio is 3> AND P.Subdirectory = '#url.P#' AND G.LastName = '#url.A#'</CFIF>
ORDER BY  CONVERT(char(20), P.ExhibitionOpened, 102) DESC, D.GeneralRandomNo 
</cfquery>  


<!--- ORDER BY D.GeneralRandomNo --->

<cfif qGetMagnum.recordcount is 0>
<cfset xImgPosition=RANDRANGE(1,5)>
	<cfquery name="qGetMagnum"  datasource="photoeyecom">
	SELECT  DISTINCT top 1 G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
	    P.Subdirectory as Portfolio, D.GeneralRandomNo, I.RecordNo, I.ImageSizeList, CONVERT(char(20), P.ExhibitionOpened, 102) AS Expr1, I.ImageNumber AS Imagenumber, I.ImagePosition AS IMAGEPOSITION, D.PortfolioName, I.Title
	FROM GallerySetup G 
		INNER JOIN GalleryPortfolio P ON G.Custnumber = P.Custnumber 
		INNER JOIN GalleryDefaultPhotos D ON P.Custnumber = D.Custnumber 
		INNER JOIN GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
	WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 <!---AND D.GeneralRandomNo<#imgbeginType3#---> AND G.Gallery='MagnumArtists' and P.ShowcaseOK=1  AND (I.ImagePosition =  #xImgPosition#)  and I.NotAvailable <> 4
	<CFIF xUseSpecificPortfolio is 3> AND P.Subdirectory = '#url.P#' AND G.LastName = '#url.A#'</CFIF>
	ORDER BY  CONVERT(char(20), P.ExhibitionOpened, 102) DESC, D.GeneralRandomNo 
	</cfquery> 
<!--- ORDER BY D.GeneralRandomNo DESC --->
</cfif> 



<cfset xwebsite="www.photoeye.com">		

<div class="Centered_Container" style="margin-top:0px;">


		<br /><br />
		
		<div> 
		<cfset xArtist1b = "NICK BRANDT">
	<a href="http://www.photoeye.com/nickbrandt" target="_blank"><img src="http://www.photoeye.com/gallery/images/wasteland-with-elephant-1000px.jpg" border="0" width="880" height="420" ALT="Inherit the Dust"></a>
		</div>
		
<div class="Centered_Container" align="center" style="width:800px;">
<p> </p>
           
<span class="GalleryH1"> <a href="http://www.photoeye.com/nickbrandt" target="_blank">#xArtist1b# &mdash; INHERIT THE DUST </a> <br /></span><br />
<p align="left">Three years after the conclusion of his trilogy, On This Earth, A Shadow Falls Across the Ravaged Land, Nick Brandt returns to East Africa to photograph the escalating changes to the continent’s natural world.<br /><br />
In a series of epic panoramas, Brandt records the impact of man in places where animals used to roam, but no longer do. In each location, Brandt erects a life size panel of one of his animal portrait photographs, setting the panels within a world of explosive urban development, factories, wasteland and quarries.<br /><br />
</p>
<br>For more information or to purchase prints contact <br /><a href="mailto:anne@photoeye.com?Subject=#xArtist1b#">Anne Kelly, Gallery Director</a><br /><br />
<p><a href="http://www.photoeye.com/nickbrandt" target="_blank">View the Work</a></p>
</div>
 
<!--- Begin Cut Here for Feature Automated Showcase Spot --->
                       <!--- ImageSizer xheight = 300 formerly before ernie button--->	
                        <cfset xheight=600>
                        <cfset xwidth=400>
                        <CFSET xAlt = "&copy; #trim(qGetShowcase.Firstname)# #trim(qGetShowcase.Lastname)#">
                        <cfset xImageAddress="#xRelativePath#\Artists\#qGetShowcase.Subdirectory#\#qGetShowcase.Portfolio#\Images_Large\">
                        <cfset xImage = "Image#qGetShowcase.ImageNumber#">
                        <cfset xImageFormat = "jpg">
                    <cfif NOT ListFindNoCase(qGetShowcase.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~") and qGetShowcase.RecordNo gt 0>
                        <cfinclude template="/templates/imagesizercreate.cfm">
                        <cfquery name="qUpdate"  datasource="photoeyecom">
                            Update GalleryIndividualPhotos
                            Set ImageSizeList = '#ListAppend(qGetShowcase.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")#'
                            Where RecordNo = #qGetShowcase.RecordNo#
                        </cfquery>
 
                      </cfif>





<div class="FeatureSpot">
		<div class="FeatureSpotImage"><a href="PhotoShowcase/">   
	<cfset xArtist1b = "#trim(qGetShowcase.Firstname)# #trim(qGetShowcase.Lastname)#">
	
	<a href="http://www.photoeye.com/Gallery/forms2/index.cfm?image=3&id=42522&imagePosition=3&Door=1&Portfolio=Portfolio5&Gallery=PhotoShowcase"><img src="/artists/#qGetShowcase.Subdirectory#/#qGetShowcase.Portfolio#/Images_Large/#xImage#_H#xHeight#xW#xWidth#.#xImageFormat#" border="0" ALT="#xAlt#"></a><span class="GalleryImageAuthor">#trim(qGetShowcase.Firstname)# #trim(qGetShowcase.Lastname)# </span>	
		</div>
            <div class="FeatureSpotText" ><div class="FeatureSpotH1"><a href="PhotoShowcase/">Photographer's Showcase</a> </div>
<span class="GalleryH1">#xArtist1b#: The Forest<br /> </span><br />
Ken Rosenthal considers his latest series <em>The Forest</em> his most complicated and personal work to date. Made over the course of four years near Rosenthal's cabin in NE Washington state, the darkly veiled black-and-white images create what the artist terms a "thin place" using natural surrounding to convey internal physical and psychological states. Together the nocturnal and entropic images of <em>The Forest</em> offer a compelling metaphorical narrative about personal turmoil and growth.
	
<br><br>For more information, contact <a href="mailto:anne@photoeye.com?Subject=#xArtist1b#">Anne Kelly, Gallery Director</a>.<div class="FeatureSpotLink"><a href="PhotoShowcase/">enter gallery...</a></div>
	</div>
</div>


<!--- <div class="FeatureSpot">
		<div class="FeatureSpotImage"><a href="PhotoShowcase/">   
	<cfset xArtist1b = "Amy Friend">
	
	<a href="http://www.photoeye.com/Gallery/forms2/index.cfm?image=3&id=197951&imagePosition=3&Door=1&Portfolio=Portfolio2&Gallery=PhotoShowcase"><img src="http://www.photoeye.com/artists/AmyFriend/Portfolio2/Images_Large/Image4_H600xW400.jpg" border="0" ALT="#xArtist1b#"></a><span class="GalleryImageAuthor">#xArtist1b# </span>	
		</div>
            <div class="FeatureSpotText" ><div class="FeatureSpotH1"><a href="PhotoShowcase/">Photographer's Showcase</a> </div>
<span class="GalleryH1">#xArtist1b#:  Dare alla Luce <br /> </span><br />
photo-eye Gallery is proud to announce a new portfolio in the Dare alla Luce series by Canadian Photographer Amy Friend. Dare alla Luce originally debuted on the Photographer’s Showcase in the summer of 2014 and this new portfolio was recently named as one of the Critical Mass Top 50. Dare alla Luce is a collection of pierced and rephotographed vintage images addressing notions of memory, the role of light, permanence, and the photographic object.  Images in the Dare alla Luce series are available as Archival Pigment Prints in small editions. 
<br><br>For more information, contact <a href="mailto:anne@photoeye.com?Subject=#xArtist1b#">Anne Kelly, Gallery Director</a>.<div class="FeatureSpotLink"><a href="PhotoShowcase/">enter gallery...</a></div>
	</div>
</div> --->




  <div class="FeatureSpot">
		<div class="FeatureSpotImage"><a href="RepresentedArtsts/">   
	<cfset xArtist1b = "Alan Friedman and Douglas Levere">
	<cfset xalt = "Alan Friedman and Douglas Levere: FIRE and ICE">
		<a href="http://www.photoeye.com/gallery/representedartists/index.cfm"><img src="/gallery/images/fireandice.jpg" width="400" border="0" ALT="#xAlt#"></a><span class="GalleryImageAuthor">Alan Friedman and Douglas Levere: FIRE and ICE
		</span></div>
            <div class="FeatureSpotText" ><div class="FeatureSpotH1">photo-eye Gallery</div>
<span class="GalleryH1">Alan Friedman<br />Douglas Levere<br/>FIRE and ICE<br /><br /> 
Opening Reception<br /> 
Friday January 29th, 5&ndash;7 pm<br /><br />
Exhibition continues through <br />April 9th, 2016<br /><br />
Artist talk is on Saturday, January 30th at 2:00 pm<br /><br />
photo-eye Gallery<br />541 S. Guadalupe Street<br /> Santa Fe, NM</span><br /><br />
photo-eye Gallery is excited to announce <em>Fire and Ice</em>, a collaborative exhibition by acclaimed astrophotographer Alan Friedman and photomicrographer Douglas Levere. <em>Fire and Ice</em> juxtaposes Friedman’s telescopic images of the Sun’s surface with Levere’s microscopic studies of snowflakes. In this exhibition, Friedman's and Levere's photographs contrast the Sun’s swirling and feathered face with the clean geometric precision of crystalized water in a series of large-scale color photographs.<br />
<br /> <a href="http://www.photoeye.com/gallery/forms2/index.cfm?image=1&id=206210&imagePosition=1&Door=1&Portfolio=Portfolio3&Gallery=1&Page=">View Alan Friedman's photographs</a><br />
<a href="http://www.photoeye.com/gallery/forms2/index.cfm?image=1&id=206211&imagePosition=1&Door=1&Portfolio=Portfolio1&Gallery=1">View Douglas Levere's photographs</a>
<br><br>For more information, contact <a href="mailto:anne@photoeye.com?Subject=#xArtist1b#">Anne Kelly, Gallery Director</a>.<div class="FeatureSpotLink"><a href="representedartists/">enter gallery...</a></div>
	</div>
</div> 

                   
<div class="FeatureSpot">
		<div class="FeatureSpotImage"><a href="PhotoShowcase/">   
	<cfset xArtist1b = "Baron Wolman">
	<a href="http://www.photoeye.com/Gallery/forms2/index.cfm?image=1&id=99995&imagePosition=1&Door=1&Portfolio=Portfolio1&Gallery=PhotoShowcase"><img src="http://www.photoeye.com/artists/BaronWolman/Portfolio1/images_large/image2_h600xw400.jpg" width="400" height="602" alt="Baron Wolman" border="0"></a><span class="GalleryImageAuthor">#xArtist1b# </span>	
		</div>
            <div class="FeatureSpotText" ><div class="FeatureSpotH1"><a href="PhotoShowcase/">Bookstore Project Space</a> </div>
<span class="GalleryH1">#xArtist1b#: WOODSTOCK <br /> </span><br /><b>Exhibition continues through April 30th, 2016</b><br /><br />
Our bookstore's project space is excited to announce WOODSTOCK an exhibition of images from the legendary concert by  Rolling Stone's first photographer Baron Wolman. The exhibition opening is Friday January 15th from 5–7pm, and Wolman will be in attendance signing copies of his book WOODSTOCK as well. Wolman's black-and-white images captured the experience and atmosphere of Woodstock like no other photographer. More interested in the crowd than the performers, his photographs are hugely evocative and offer an insight into this legendary event that is rarely seen.
<br><br>For more information, contact <a href="mailto:anne@photoeye.com?Subject=#xArtist1b#">Anne Kelly, Gallery Director</a>.<div class="FeatureSpotLink"><a href="PhotoShowcase/">enter gallery...</a></div>
	</div>
</div>





   





 
<cftry>

					
					<!--- ImageSizer --->									
					<cfset xheight=300>
					<cfset xwidth=400>
					<cfset xImageAddress="#xRelativePath#\Artists\#qGetMagnum.Subdirectory#\#qGetMagnum.Portfolio#\Images_Large\">
					<CFSET xAlt = "&copy; #trim(qGetMagnum.Firstname)# #trim(qGetMagnum.Lastname)#">
					<cfset xImage = "Image#qGetMagnum.ImageNumber#">
					<cfset xImageFormat = "jpg">
					<cfif NOT ListFindNoCase(qGetMagnum.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")>
						<cfinclude template="/templates/imagesizercreate.cfm">
						<cfquery name="qUpdate"  datasource="photoeyecom">
							Update GalleryIndividualPhotos
							Set ImageSizeList = '#ListAppend(qGetMagnum.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")#'
							Where RecordNo = #qGetMagnum.RecordNo#
						</cfquery>
					</cfif>
					 
							
		

<div class="FeatureSpot">
		<div class="FeatureSpotImage" ><a href="http://www.photoeye.com/gallery/MagnumArtists/index.cfm"><img src="/artists/#qGetMagnum.Subdirectory#/#qGetMagnum.Portfolio#/Images_Large/#xImage#_H#xHeight#xW#xWidth#.#xImageFormat#" border="0" ALT="#xAlt#"></a><span class="GalleryImageAuthor">#trim(qGetMagnum.Firstname)# #trim(qGetMagnum.Lastname)#</span></div>
           <!--- <div class="FeatureSpotText"><div class="FeatureSpotH1"><a href="MoreGalleries.cfm">More Galleries</a></div>
In addition to our represented artist galleries, we also have a selection of Magnum Photos Collectors' Prints for sale. PhotoBistro is a growing online community gallery and the FotoFest Bejing gallery, an online showcase of Chinese Photography.<div class="FeatureSpotLink"><a href="MoreGalleries.cfm">see more galleries...</a></div> --->
<div class="FeatureSpotText" ><div class="FeatureSpotH1"><a href="MagnumArtists/index.cfm">Magnum Photos&reg; Collector's Prints</a> </div>
Magnum Photos Collectors' Prints by great Magnum photographers are available on demand. These are authorized, signed (if the photographer is alive), archivally-produced, fine prints made from the original negative either by the photographer or under the photographer's supervision. Prices vary from photographer to photographer. Please expect 2-4 weeks for delivery. Order by clicking the [$ Purchase Print] button next to the photograph you wish to buy.<div class="FeatureSpotLink"><a href="MagnumArtists/index.cfm">enter gallery...</a></div>
			</div>
		</div>
</div>



 				
					 

<cfcatch>

					
					<!--- ImageSizer --->									
					<cfset xheight=300>
					<cfset xwidth=400>
					<cfset xImageAddress="#xRelativePath#\Artists\#qGetMagnum.Subdirectory#\#qGetMagnum.Portfolio#\Images_Large\">
					<CFSET xAlt = "&copy; #trim(qGetMagnum.Firstname)# #trim(qGetMagnum.Lastname)#">
					<cfset xImage = "Image#qGetMagnum.ImageNumber#">
					<cfset xImageFormat = "jpg">
					<cfif NOT ListFindNoCase(qGetMagnum.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")>
						<cfinclude template="/templates/imagesizercreate.cfm">
						<cfquery name="qUpdate"  datasource="photoeyecom">
							Update GalleryIndividualPhotos
							Set ImageSizeList = '#ListAppend(qGetMagnum.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")#'
							Where RecordNo = #qGetMagnum.RecordNo#
						</cfquery>
					</cfif>
					 
							
		

 <div class="FeatureSpot">
		<div class="FeatureSpotImage" ><a href="MoreGalleries.cfm"><img src="/artists/#qGetMagnum.Subdirectory#/#qGetMagnum.Portfolio#/Images_Large/#xImage#_H#xHeight#xW#xWidth#.#xImageFormat#" border="0" ALT="#xAlt#"></a><span class="GalleryImageAuthor">#trim(qGetMagnum.Firstname)# #trim(qGetMagnum.Lastname)#</span></div>
            <div class="FeatureSpotText"><div class="FeatureSpotH1"><a href="MoreGalleries.cfm">More Galleries</a></div>
In addition to our represented artist galleries, we also have a selection of Magnum Photos Collectors' Prints for sale. PhotoBistro is a growing online community gallery and the FotoFest Bejing gallery, an online showcase of Chinese Photography.<div class="FeatureSpotLink"><a href="MoreGalleries.cfm">see more galleries...</a></div>
			</div>
		</div>
</div> --->
</cfcatch>
</cftry>

</cfoutput>