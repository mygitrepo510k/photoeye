<cfset Categoryx =  #Replace(Category1,"%20"," ","All")#>	

<cfif IsDefined("All")>
	<cfset All=#url.All#>
<cfelse>
	<cfset All=0>
</cfif>

<CFSET xShowHome = 1>
<cfif Isdefined("url.Gallery")>
	<cfif url.Gallery is 1>
		<cfset xGallery=0>
		<cfset xGalleryName='REPRESENTEDARTISTS'>
		<CFSET xHomeLink = "#aGalleryDirectory#/RepresentedArtists/HomepagePE.cfm">
	<cfelseif url.Gallery is 2>
		<cfset xGallery=0>
		<cfset xGalleryName='PHOTOSHOWCASE'>
		<CFSET xHomeLink = "#aGalleryDirectory#/Photoshowcase/HomepagePSnew.cfm">
	<cfelseif url.Gallery is 3>
		<cfset xGallery=0>
		<cfset xGalleryName='MAGNUMARTISTS'>
		<CFSET xHomeLink = "#aGalleryDirectory#/MagnumArtists/HomepageMA.cfm">
	<CFELSE>
		<cfset xGallery=0>
		<cfset xGalleryName=''>
		<CFSET xHomeLink = "#aGalleryDirectory#/index.cfm">
	</CFIF>
<cfelse>
	<cfset xGallery=0>
	<cfset xGalleryName=''>
	<CFSET xHomeLink = "#aGalleryDirectory#/index.cfm">
</cfif>

<CFSET xExploreBy = 3> 

<cfif xGallery is 1>
	<CFSET xTitle="Gallery - Santa Fe">
	<CFSET xThisSubtitle = "Catagories / Genres">
	<CFSET xMenuToShow = "Santa Fe">
	
<cfelseif xGallery is 2>
	<CFSET xTitle="Photographer's Showcase">
	<CFSET xThisSubtitle = "Catagories / Genres">
	<CFSET xMenuToShow = "Showcase">
<cfelseif xGallery is 3>
	<CFSET xTitle="Magnum Photos">
	<CFSET xThisSubtitle = "Catagories / Genres">
	<CFSET xMenuToShow = "Magnum">
	
<cfelse>
	<CFSET xTitle="Galleries">
	<CFSET xThisSubtitle = "Catagories / Genres - All Galleries">
	<CFSET xMenuToShow = "Main">
	
</cfif>

<CFSET xPathToRoot="../">
<CFSET xShowBackButton = 1>
<CFSET xShowMenu = 1>
<cfinclude template="includes/dsp_galleries_index_top.cfm">
	

<CFINCLUDE TEMPLATE="Menu.cfm">

<BR>
<CFSET xSubtitle = xThisSubtitle>
<cfinclude template="../templates/title.cfm">
<DIV ALIGN="CENTER"><CFOUTPUT>#xHTMLTitle#</CFOUTPUT></DIV>
<TABLE><TR><TD HEIGHT="7"></TD></TR></TABLE>


<!---<CFQUERY NAME="qGetGenres"  DATASOURCE="photoeyecom">
SELECT   DISTINCT Header, D.Genre1
FROM       GalleryIndividualPhotos as I,  GalleryDirectories as H INNER JOIN
      GalleryDefaultPhotos D ON H.Header = D.Genre1 
WHERE     (Directory = 'Genre') and  (I.Default9=1 and (D.Genre1 <> '' or  D.Genre1 is not Null) )
or (I.Default9=0 and (I.Genre1 <> '' or  I.Genre1 is not Null) ) and G.Gallery='#xGalleryName#'</cfif>
ORDER BY HEADER
</cfquery>  --->

<CFQUERY NAME="qGetGenres"  DATASOURCE="photoeyecom">
SELECT DISTINCT R.Header
FROM         dbo.GalleryDirectories R INNER JOIN
                      GalleryDefaultPhotos D ON R.Header = D.GENRE1 INNER JOIN
                      GallerySetup S ON S.Custnumber = D.Custnumber INNER JOIN
                      GalleryIndividualPhotos I ON I.Custnumber = S.Custnumber
WHERE    ((<cfif xGAllery is 0>S.Gallery = 'MAGNUMARTISTS' or  S.Gallery = 'PHOTOSHOWCASE' or S.Gallery = 'REPRESENTEDARTISTS' <cfelse>S.Gallery = '#xGalleryName#'</cfif>) AND (I.DEFAULT9 = 1)) OR
                      ((<cfif xGAllery is 0>S.Gallery = 'MAGNUMARTISTS' or  S.Gallery = 'PHOTOSHOWCASE' or S.Gallery = 'REPRESENTEDARTISTS' <cfelse>S.Gallery = '#xGalleryName#'</cfif>) AND (I.DEFAULT9 = 0) AND (I.GENRE1 <> ''))
</cfquery>

<cfif #URL.Category1# is ''>
	
<CFQUERY NAME="qGetShowcaseGenre"  DATASOURCE="PhotoEyecom">
SELECT DISTINCT 
       G.Subdirectory AS SubDirectory, G.FirstName AS Firstname, P.ImgQty AS ImageQTy, G.LastName AS Lastname, G.Gallery AS Gallery, G.Custnumber, 
P.SubDirectory AS Portfolio, D.Genre1 AS D_Genre1, D.Genre2 AS D_Genre2, I.Genre1 AS I_Genre1, I.Genre2 AS I_Genre2, 
I.DEFAULT9, D.GenreRandomNo, G.LastName AS Expr1,  I.ImageNumber, I.ImagePosition
FROM  GallerySetup G INNER JOIN
      GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
      GalleryDefaultPhotos D ON G.Custnumber = D.Custnumber AND P.SubDirectory = D.SubDirectory INNER JOIN
      GalleryIndividualPhotos I ON G.Custnumber = I.Custnumber AND P.SubDirectory = I.PortfolioName
WHERE (P.ImgQty > 0) AND 
(I.ImagePosition = 1) AND 
(D.Genre1 is Null or  D.Genre1='') AND 
(I.DEFAULT9 = 1) and P.ShowcaseOK=1 <cfif include is 2>AND G.Tier=3<cfelseif include is 1>AND (G.Tier=1 OR G.Tier=2)<cfelseif include is 3>AND G.Tier>0</cfif> and P.ShowcaseOK=1 <cfif xGallery GT 0> and G.Gallery='#xGalleryName#'</cfif>
ORDER BY D.Genre1, G.Tier, D.GenreRandomNo, G.LastName
<!--- ORDER BY  GenreRandomNo  --->

</cfquery>

<cfelse>

					
	<!--- 		<CFQUERY NAME="qGetShowcaseGenre"  DATASOURCE="photoeyecom">

SELECT DISTINCT 
       G.Subdirectory AS SubDirectory, G.FirstName AS Firstname, P.ImgQty AS ImageQTy, G.LastName AS Lastname, G.Gallery AS Gallery, G.Custnumber, 
P.SubDirectory AS Portfolio, D.Genre1 AS D_Genre1, D.Genre2 AS D_Genre2, I.Genre1 AS I_Genre1, I.Genre2 AS I_Genre2, G.Tier as Tier, 
I.DEFAULT9, D.GenreRandomNo, G.LastName AS Expr1
FROM  GallerySetup G INNER JOIN
      GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
      GalleryDefaultPhotos D ON G.Custnumber = D.Custnumber AND P.SubDirectory = D.SubDirectory INNER JOIN
      GalleryIndividualPhotos I ON G.Custnumber = I.Custnumber AND P.SubDirectory = I.PortfolioName
WHERE ((P.ImgQty > 0) AND 
(I.ImageNumber = 1) AND 
(D.Genre1 = '#URL.Category1#') AND 
(I.DEFAULT9 = 1) OR (P.ImgQty > 0) AND 
(I.ImageNumber = 1) AND 
(I.DEFAULT9 = 0) AND 
(I.Genre1 = '#URL.Category1#') AND G.TIER>0
ORDER BY (D.Genre1, G.Tier, D.GenreRandomNo, G.LastName) DESC

			</cfquery>
			 --->

<CFQUERY NAME="qGetShowcaseGenre"  DATASOURCE="PhotoEyecom">

SELECT DISTINCT 
       G.Subdirectory AS SubDirectory, G.FirstName AS Firstname, P.ImgQty AS ImageQTy, G.LastName AS Lastname, G.Gallery AS Gallery, G.Custnumber, 
P.SubDirectory AS Portfolio, D.Genre1 AS D_Genre1, D.Genre2 AS D_Genre2, I.Genre1 AS I_Genre1, I.Genre2 AS I_Genre2, G.Tier as Tier, 
I.DEFAULT9, D.GenreRandomNo, G.LastName AS Expr1, I.ImageNumber, I.ImagePosition
FROM  GallerySetup G INNER JOIN
      GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
      GalleryDefaultPhotos D ON G.Custnumber = D.Custnumber AND P.SubDirectory = D.SubDirectory INNER JOIN
      GalleryIndividualPhotos I ON G.Custnumber = I.Custnumber AND P.SubDirectory = I.PortfolioName
WHERE (P.ImgQty > 0) AND 
(I.ImagePosition = 1) AND 
(D.Genre1 = '#Categoryx#') AND 
(I.DEFAULT9 = 1)  and P.ShowcaseOK=1 <cfif include is 2>AND G.Tier=3<cfelseif include is 1>AND (G.Tier=1 OR G.Tier=2)<cfelseif include is 3>AND G.Tier>0</cfif> and P.ShowcaseOK=1 <cfif xGallery GT 0> and G.Gallery='#xGalleryName#'</cfif><!--- <cfif include is 2>AND G.Tier=3<cfelseif include is 1>AND (G.Tier=1 OR G.Tier=2)<cfelseif include is 3>AND G.Tier>0</cfif> --->
ORDER BY D.Genre1, G.Tier, D.GenreRandomNo, G.LastName
<!--- ORDER BY GenreRandomNo  --->

</cfquery> 
</cfif>

		
	<cfset ImageNumber = 1>
	<cfset ImagePosition = 1>
	
	<cfset genrex= "x">  	


<cfoutput>

			
			
		<table width="500" border="0" cellspacing="6" cellpadding="5" align="center">
  
  		<tr>
	<cfif #URL.Category1# is ''>
						<td colspan="5" bgcolor="Black"><TABLE WIDTH="100%"><TR><TD VALIGN="TOP"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="Silver"><b>Undefined Genre</b>
			<cfelse>
			<td colspan="5"  width="565"  bgcolor="Black"><TABLE WIDTH="100%"><TR><TD VALIGN="TOP"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="Silver"><b>#Categoryx#</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<cfif All is 0>
<a href="javascript:history.back();"><FONT color="silver" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='silver';"  style="TEXT-DECORATION: none"><b>Previous Page</b></font></a>
</cfif>
			
	</cfif>	

</TD><td colspan="5"  align="right">
			 <form method=POST enctype="text/plain" name="menu" action="">
				<select name="newLocation" style="font: 9px; BACKGROUND-COLOR:##eeeeee;" onChange="jumpMenu('parent',this,0)">
                <option value="##TOP" selected >Select&nbsp;Another&nbsp;Genre&nbsp;</option>
				
                <cfloop query="qGetGenres">
	<!--- Take out any spaces in the URL parameter and replace them with an obvious set of characters that may be then replaced at the beginning of the MoreFormats page--->	
<cfset CategoryURL =  #Replace(qGetGenres.Header," ","%20","All")#>	
	<option
					 value="MoreGenres.cfm?Category1=#CategoryURL#&Include=#Include#&Gallery=#Gallery#&All=1" >#Header#</option>
				</cfloop>
				<option
					 value="Genres.cfm?Gallery=#Gallery#" >> Show All Genres</option>
	            </select>
    		</td></form></tr></TABLE>
			
			</td>
		</tr>
		
	<!--- Begin Tier 1 Loop --->	
	<!--- #qGetShowcaseGenre.recordcount# --->

<!--- <CFQUERY NAME="qGetShowcaseGenre"  DATASOURCE="PhotoEyecom">
SELECT DISTINCT 
       G.Subdirectory AS SubDirectory, G.FirstName AS Firstname, P.ImgQty AS ImageQTy, G.LastName AS Lastname, G.Gallery AS Gallery, G.Custnumber, 
P.SubDirectory AS Portfolio, D.Genre1 AS D_Genre1, D.Genre2 AS D_Genre2, I.Genre1 AS I_Genre1, I.Genre2 AS I_Genre2, 
I.DEFAULT9, D.GenreRandomNo, G.LastName AS Expr1, G.Tier as Tier
FROM  GallerySetup G INNER JOIN
      GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
      GalleryDefaultPhotos D ON G.Custnumber = D.Custnumber AND P.SubDirectory = D.SubDirectory INNER JOIN
      GalleryIndividualPhotos I ON G.Custnumber = I.Custnumber AND P.SubDirectory = I.PortfolioName
WHERE ((P.ImgQty > 0) AND 
(I.ImageNumber = 1) AND 
(D.Genre1 = '#URL.Category1#') AND 
(I.DEFAULT9 = 1) and G.Tier>0) OR ((P.ImgQty > 0) AND 
(I.ImageNumber = 1) AND 
(I.DEFAULT9 = 0) AND 
(I.Genre1 = '#URL.Category1#') and G.Tier>0)
ORDER BY Tier DESC, GenreRandomNo DESC
</cfquery>  --->
	
	<cfset Column=1>
	<cfset counter=1>
	<cfset HeaderFirstTime=1>
	<cfloop query="qGetShowcaseGenre">
	<cfif All is 1>
		<cfset BeginCounter=0>
	<cfelse>
		<cfset BeginCounter=6>
	</cfif>
	<cfif counter gt BeginCounter>
	 	<cfif Column is 1>
    		 <cfif HeaderFirstTime is 1>
   				<tr><td colspan="5">
  			 	<cfset HeaderFirstTime=0>
   				</td></tr>
   			</cfif>
   <tr>
    <td width="100" height="77">
	<a href="/gallery/forms2/index.cfm?image=#ImageNumber#&id=#qGetShowcaseGenre.Custnumber#&imagePosition=#ImagePosition#&Door=6&Portfolio=#qGetShowcaseGenre.Portfolio#&Gallery=#url.Gallery#"><FONT color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='##333333';"  style="TEXT-DECORATION: none"><b>
	#qGetShowcaseGenre.FirstName# #qGetShowcaseGenre.LastName#<br><br></b></font></a> 
	
 <cfset ArtistGallery =''>
	 <cfif UCASE(qGetShowcaseGenre.Gallery) is 'REPRESENTEDARTISTS'>
	 	<cfset ArtistGallery = 'Santa Fe<br>Gallery Artist'>
	 <cfelseif UCASE(qGetShowcaseGenre.Gallery) is 'PHOTOSHOWCASE'>
	 	<cfif qGetShowcaseGenre.Tier is 1>
			<cfset ArtistGallery = "Photographer's<br>Showcase Artist">
		<cfelseif qGetShowcaseGenre.Tier is 2>
			<cfset ArtistGallery = "Photographer's<br>Showcase Artist">
		<cfelseif qGetShowcaseGenre.Tier is 3>
			<cfset ArtistGallery = "Photographer's<br>Showcase Artist">
		</cfif>			
	 <cfelseif UCASE(qGetShowcaseGenre.Gallery) is 'MAGNUMARTISTS'>
	 	<cfset ArtistGallery = 'Magnum<br>Photos Artist'>
     </cfif>
	<FONT color="##666666" face="verdana, arial, Helvetica, sans-serif" size="1"><b>#ArtistGallery#<br>  #qGetShowcaseGenre.ImageQty# Images</b></font></td>
 	<td width="100">
			<a href="/gallery/forms2/index.cfm?image=#ImageNumber#&id=#qGetShowcaseGenre.Custnumber#&imagePosition=#ImagePosition#&Door=6&Portfolio=#qGetShowcaseGenre.Portfolio#&Gallery=#url.Gallery#">

<!--- ImageSizer --->									
<cfset xheight=64>
<cfset xwidth=75>
<cfset xImageAddress="#xRelativePath#\Artists\#qGetShowcaseGenre.Subdirectory#\#qGetShowcaseGenre.Portfolio#\Images_Large\">

<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image#qGetShowcaseGenre.ImageNumber#.jpg">

<cfinclude template="../templates/imagesizer.cfm">

<img src="../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a>
<!--- End ImageSizer --->

		</td>
	<!--- Center Column --->
	<td>&nbsp;
		
	</td>
	<!--- If there is only one record, include a blank cell so that the only image is properly Genreted--->
			<cfif qGetShowcaseGenre.recordcount is 1>
		<td width="100" height="77">&nbsp;
		
		</td>
			</cfif>
			<cfset Column = 2>
			<cfset counter=counter+1>

		<cfelseif Column is 2>
    <td width="100" height="77"> 
	<a href="/gallery/forms2/index.cfm?image=#ImageNumber#&id=#qGetShowcaseGenre.Custnumber#&imagePosition=#ImagePosition#&Door=6&Portfolio=#qGetShowcaseGenre.Portfolio#&Gallery=#url.Gallery#"><FONT color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='##333333';"  style="TEXT-DECORATION: none"><b>
	#qGetShowcaseGenre.FirstName# #qGetShowcaseGenre.LastName#<br><br></b></font></a>
	
 <cfset ArtistGallery =''>
	 <cfif UCASE(qGetShowcaseGenre.Gallery) is 'REPRESENTEDARTISTS'>
	 	<cfset ArtistGallery = 'Santa Fe<br>Gallery Artist'>
	 <cfelseif UCASE(qGetShowcaseGenre.Gallery) is 'PHOTOSHOWCASE'>
	 	<cfif qGetShowcaseGenre.Tier is 1>
			<cfset ArtistGallery = "Photographer's<br>Showcase Artist">
		<cfelseif qGetShowcaseGenre.Tier is 2>
			<cfset ArtistGallery = "Photographer's<br>Showcase Artist">
		<cfelseif qGetShowcaseGenre.Tier is 3>
			<cfset ArtistGallery = "Photographer's<br>Showcase Artist">
		</cfif>			
	 <cfelseif UCASE(qGetShowcaseGenre.Gallery) is 'MAGNUMARTISTS'>
	 	<cfset ArtistGallery = 'Magnum<br>Photos Artist'>
     </cfif>
	<FONT color="##666666" face="verdana, arial, Helvetica, sans-serif" size="1"><b>#ArtistGallery#<br>  <b>#qGetShowcaseGenre.ImageQty# Images</b></font></td>
 	<td width="100">
			<a href="/gallery/forms2/index.cfm?image=#ImageNumber#&id=#qGetShowcaseGenre.Custnumber#&imagePosition=#ImagePosition#&Door=6&Portfolio=#qGetShowcaseGenre.Portfolio#&Gallery=#url.Gallery#">
			
<!--- ImageSizer --->									
<cfset xheight=64>
<cfset xwidth=75>
<cfset xImageAddress="#xRelativePath#\Artists\#qGetShowcaseGenre.Subdirectory#\#qGetShowcaseGenre.Portfolio#\Images_Large\">

<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image#qGetShowcaseGenre.ImageNumber#.jpg">

<cfinclude template="../templates/imagesizer.cfm">

<img src="../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a>
<!--- End ImageSizer --->

		</td>
			<cfset Column =1 >	
			<!--- <cfset counter=counter+1> --->
	</tr>
  		</cfif>
	</cfif>
	<cfset counter=counter+1>
	</cfloop>

  
  </table>
  </cfoutput>
  
  <BR>
<cfinclude template="includes/dsp_galleries_index_bottom.cfm">
