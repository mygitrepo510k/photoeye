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



		
<div class="Centered_Container" style="margin-top:0px;">



<!--- Cut here for Feature Showcase Automated --->
                       <!--- ImageSizer --->	
                        <cfset xheight=300>
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

<!--- Cut Here for Non-automated solution for blackmon show --->

    	
<div class="FeatureSpot">


<!---   <cfset qGetSantaFe.Subdirectory = 'JoWhaley'>
		<cfset  qGetSantaFe.Portfolio = 'Portfolio4'>
		<cfset xImage='Image1'>
		<cfset xwidth="400">
		<cfset xHeight="400">
		<cfset qGetSantaFe.firstname="Jo">
		<cfset  qGetSantaFe.Lastname="Whaley"> 
		<cfset qGetSantaFe.ImageNumber = "1">

		<div class="FeatureSpotImage"><a href="RepresentedArtists/">		
					<!--- ImageSizer --->									
					<cfset xImageAddress="#xRelativePath#\Artists\#qGetSantaFe.Subdirectory#\#qGetSantaFe.Portfolio#\Images_Large\">
					<CFSET xAlt = "&copy; #trim(qGetSantaFe.Firstname)# #trim(qGetSantaFe.Lastname)#">
					<cfset xImage = "Image#qGetSantaFe.ImageNumber#">
					<cfset xImageFormat = "jpg">
					
					<cfif NOT ListFindNoCase(qGetSantaFe.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")>
					
					<cfinclude template="/templates/imagesizercreate.cfm">
						<cfquery name="qUpdate"  datasource="photoeyecom">
							Update GalleryIndividualPhotos
							Set ImageSizeList = '#ListAppend(qGetSantaFe.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")#'
							Where RecordNo = #qGetSantaFe.RecordNo#
						</cfquery>
				 	<cfelse>
							<cfinclude template="/templates/imagesizercreate.cfm">
	
					</cfif>	--->
		<div class="FeatureSpotImage">			
					<cfset xalt="Debbie Fleming Caffery Announcement Card">
		
		<a href="RepresentedArtists/"><img src="/img/gallery/kickoff_final-1.jpg" border="0" ALT="#xAlt#">border="0" ALT="#xAlt#"></a><!---<span class="GalleryImageAuthor">#trim(qGetShowcase.Firstname)# #trim(qGetShowcase.Lastname)#</span><img src="/artists/#qGetSantaFe.Subdirectory#/#qGetSantaFe.Portfolio#/Images_Large/#xImage#_H#xWidth#xW#xHeight#.#xImageFormat#" border="0" ALT="#xAlt#"></a><span class="GalleryImageAuthor">#qGetSantaFe.Firstname# #qGetSantaFe.Lastname#</span>---></div>
            <div class="FeatureSpotText"><div class="FeatureSpotH1"><a href="RepresentedArtists/">Santa Fe Gallery</a> </div>June 4th - July 3rd, 2009<br />
<div class="GalleryH1">Debbie Fleming Caffery: The Spirit & The Flesh</div><br />
An exhibition celebrating the publication of Debbie's new monograph, <a href="/bookstore/mShowDetailsbycatAmazon.cfm?Catalog=DQ168&i=9781934435144"><em>The Spirit & The Flesh</em></a> published by Radius Books.
<!---
The inaugural exhibition for a new, ongoing series of shows at photo-eye Gallery, Santa Fe featuring Photographer's Showcase artists. This exhibition includes work by 
<a href="http://www.photoeye.com/ErikBoker" target="_blank">Erik Boker</a>, 
<a href="http://www.photoeye.com/JessicaBruah" target="_blank">Jessica Bruah</a>, 
<a href="http://www.photoeye.com/JeffrisElliott" target="_blank">Jeffris Elliott</a>, 
<a href="http://www.photoeye.com/MihaiMangiulea" target="_blank">Mihai Mangiulea</a>, 
<a href="http://www.photoeye.com/HiroyasuMatsui" target="_blank">Hiroyasu Matsui</a>, 
<a href="http://www.photoeye.com/EricPercher" target="_blank">Eric Percher</a>, and
<a href="http://www.photoeye.com/CarlosTarrats" target="_blank">Carlos Tarrats</a>.<br><br>Opening in May with Debbie Fleming Caffery is Showcase artist <a href="http://www.photoeye.com/MichelleRepici" target="_blank">Michelle Repici</a>.<br><br>
Nearly ten years ago, photo-eye conceived of an online gallery to show the work of talented emerging photographers. Over that time, photo-eye's juried online exhibition space has inspired imitators, but none can boast such a well-rounded and ever-expanding collection of fine art photography. Growing to include outstanding work from photographers across the globe, the Photographer's Showcase has established itself as a resource for curators and galleries, collectors, critics and photography enthusiasts, allowing our audience to discover and purchase exceptional photography. While photo-eye Gallery has at times included work from Showcase artists in exhibitions, the Photographer's Showcase Series marks a new and exciting collaboration between the Photographer's Showcase and photo-eye Gallery with this new ongoing exhibition series. 
--->
<!--- <br /><br />&middot; <a href="RepresentedArtists/PressReleases/20080620_JB.cfm">Domestic Vacations press release...</a><br />

&middot; <a href="RepresentedArtists/Announcements/2008JulieBlackmon.pdf">View the show announcement...</a>--->
<br />
<br /><div class="FeatureSpotLink"><a href="RepresentedArtists/">enter gallery...</a></div>
			</div>
		</div>
        
        

<!--- End Cut Here for Non-Automated Gallery Artist ---> 
<div class="FeatureSpot">
		<div class="FeatureSpotImage"><a href="PhotoShowcase/">   
	<img src="/artists/#qGetShowcase.Subdirectory#/#qGetShowcase.Portfolio#/Images_Large/#xImage#_H#xHeight#xW#xWidth#.#xImageFormat#" border="0" ALT="#xAlt#"></a><span class="GalleryImageAuthor">#trim(qGetShowcase.Firstname)# #trim(qGetShowcase.Lastname)#</span>	
		</div>
            <div class="FeatureSpotText" ><div class="FeatureSpotH1"><a href="PhotoShowcase/">Photographer's Showcase<sup><font size="1">&reg;</font></sup></a> </div>Recent Opening:<br />
<span class="GalleryH1">Susana Raab: Consumed
</span><br /><br />
"a hungry man dreameth, and, behold, he eatheth; but he awaketh, and his soul is empty” –Isaiah, 29:8<BR><BR>
The physical remains of our mass-consumption litter the streets while the cheap foodstuffs pollute our bodies. All the while, the signs of fast food encroach upon us: advertisements and myths promote a brighter scenario allowing us to happily refuel at the drive-through window oblivious to the cycle that we perpetuate. Americans are slaves to an industry whose influence over our society we do not fully comprehend."&##8212;Susana Raab

 <div class="FeatureSpotLink"><a href="PhotoShowcase/">enter gallery...</a></div>
			</div>
		</div>

        
<!--- End Cut Here for Feature Automated Showcase Spot --->

<!--- Cut Here for Non-automated solution for blackmon show --->

   <cfset qGetSantaFe.Subdirectory = 'DaveTrautrimas'>
		<cfset  qGetSantaFe.Portfolio = 'Portfolio1'>
		<cfset xImage='Image1'>
		<cfset xwidth="300">
		<cfset xHeight="400">
		<cfset qGetSantaFe.firstname="David">
		<cfset  qGetSantaFe.Lastname="Trautrimas"> 
		<cfset qGetSantaFe.ImageNumber = "1">
    	
<div class="FeatureSpot">

		<div class="FeatureSpotImage"><a href="/gallery/forms2/index.cfm?image=6&id=199200&imagePosition=1&Door=1&Portfolio=Portfolio1&Gallery=1">		
					<!--- ImageSizer --->									
					<cfset xheight=240>
					<cfset xwidth=500>
					<!---<cfset xheight=200 140>
					<cfset xwidth=300 250>--->
					<cfset xImageAddress="#xRelativePath#\Artists\#qGetSantaFe.Subdirectory#\#qGetSantaFe.Portfolio#\Images_Large\">
					<CFSET xAlt = "&copy; #trim(qGetSantaFe.Firstname)# #trim(qGetSantaFe.Lastname)#">
					<cfset xImage = "Image#qGetSantaFe.ImageNumber#">
					<cfset xImageFormat = "jpg">
					<cfif NOT ListFindNoCase(qGetSantaFe.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")>
					<cfinclude template="/templates/imagesizercreate.cfm">
						<cfquery name="qUpdate"  datasource="photoeyecom">
							Update GalleryIndividualPhotos
							Set ImageSizeList = '#ListAppend(qGetSantaFe.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")#'
							Where RecordNo = #qGetSantaFe.RecordNo#
						</cfquery>
				 	<cfelse>
				
					</cfif>	
						   
					<img src="/artists/#qGetSantaFe.Subdirectory#/#qGetSantaFe.Portfolio#/Images_Large/#xImage#_H#xHeight#xW#xWidth#.#xImageFormat#" border="0" ALT="#xAlt#"></a><span class="GalleryImageAuthor">#qGetSantaFe.Firstname# #qGetSantaFe.Lastname#</span></div>
            <div class="FeatureSpotText"><div class="FeatureSpotH1"><a href="RepresentedArtists/">Santa Fe Gallery</a> </div>New Gallery Artist<br />
<div class="GalleryH1">David Trautrimas</div><br />
"In ‘Habitat Machines’ David Trautrimas’ photo based architecture explores the construct of home with a series of residential buildings born of everyday objects. From Art Deco coffee pots to the Constructivist grid pattern on an old bathroom scale, Trautrimas searches for source materials which allude to a greater architectural doctrine usually unnoticed in these machines. Then, by dramatic distortion of scale and context, elements of these objects are meticulously re-assembled into strikingly original structures that are paradoxically familiar by virtue of their origins."
<!--- <br /><br />&middot; <a href="RepresentedArtists/PressReleases/20080620_JB.cfm">Domestic Vacations press release...</a><br />

&middot; <a href="RepresentedArtists/Announcements/2008JulieBlackmon.pdf">View the show announcement...</a>--->

<br /><div class="FeatureSpotLink"><a href="/gallery/forms2/index.cfm?image=1&id=199200&imagePosition=1&Door=1&Portfolio=Portfolio1&Gallery=1">view portfolio...</a></div>
			</div>
		</div>
        
        

<!--- End Cut Here for Non-Automated Gallery Artist --->









       
   	     
				
   
 
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
		<div class="FeatureSpotImage" ><a href="MoreGalleries.cfm"><img src="/artists/#qGetMagnum.Subdirectory#/#qGetMagnum.Portfolio#/Images_Large/#xImage#_H#xHeight#xW#xWidth#.#xImageFormat#" border="0" ALT="#xAlt#"></a><span class="GalleryImageAuthor">#trim(qGetMagnum.Firstname)# #trim(qGetMagnum.Lastname)#</span></div>
            <div class="FeatureSpotText"><div class="FeatureSpotH1"><a href="MoreGalleries.cfm">More Galleries</a></div>
In addition to our represented artist galleries, we also have a selection of Magnum Photos Collectors' Prints for sale. Photo Bistro is a growing online community gallery and the FotoFest Bejing gallery, an online showcase of Chinese Photography.<div class="FeatureSpotLink"><a href="MoreGalleries.cfm">see more galleries...</a></div>
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
In addition to our represented artist galleries, we also have a selection of Magnum Photos Collectors' Prints for sale. Photo Bistro is a growing online community gallery and the FotoFest Bejing gallery, an online showcase of Chinese Photography.<div class="FeatureSpotLink"><a href="MoreGalleries.cfm">see more galleries...</a></div>
			</div>
		</div>
</div>
</cfcatch>
</cftry>

</cfoutput>