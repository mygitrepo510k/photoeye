
<CFIF xSwitch is 1>
	<!---<cfcache action="Cache" Timeout="#DateAdd('d',-1, Now())#"> --->
</CFIF>

<CFPARAM NAME="url.Include" DEFAULT="1">

<cfif IsDefined("RadioInclude")>
	<cfset include=#form.RadioInclude#>
<cfelse>
	<cfset include=#url.Include#>
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
	<CFSET xThisSubtitle = "Categories / Genres">
	<CFSET xMenuToShow = "Santa Fe">
	
<cfelseif xGallery is 2>
	<CFSET xTitle="Photographer's Showcase">
	<CFSET xThisSubtitle = "Categories / Genres">
	<CFSET xMenuToShow = "Showcase">

<cfelseif xGallery is 3>
	<CFSET xTitle="Magnum Photos">
	<CFSET xThisSubtitle = "Categories / Genres">
	<CFSET xMenuToShow = "Magnum">
	
<cfelse>
	<CFSET xTitle="Galleries">
	<CFSET xThisSubtitle = "Categories / Genres - All Galleries">
	<CFSET xMenuToShow = "Main">
	
</cfif>

	
<cfinclude template="includes/dsp_galleries_index_top.cfm">

<CFINCLUDE TEMPLATE="Menu.cfm">

<BR>
<CFSET xSubtitle = xThisSubtitle>
<cfinclude template="../templates/title.cfm">
<DIV ALIGN="CENTER"><CFOUTPUT>#xHTMLTitle#</CFOUTPUT></DIV>

<TABLE><TR><TD HEIGHT="7"></TD></TR></TABLE>

<!--- 06/29/2003 RR --->
<!--- 1. A server cfCache is created that expires everyday at 12:19 pm MDT - the time this was first run. Any New Content will show at that time automatically--->
<!--- <cfcache action="Flush"> 
<cfcache action="Cache" Timeout="#DateAdd('d',-1, Now())#"> --->




<CFQUERY NAME="qGetShowcaseGetGenre"  DATASOURCE="photoeyecom">
SELECT Distinct *
FROM       GalleryDirectories
WHERE     (Directory = 'Genre') 
</cfquery>


	<cfset ImageNumber = 1>
	<cfset ImagePosition = 1>
	
	<cfset Genrex= "x">  	


<cfset NewName = ''>
<cfset Qty=0>
<cfset var=1>
<cfoutput>

   <cfset HeaderFirstTime=0>

	<cfloop query="qGetShowcaseGetGenre">
   <table width="500" border="0" cellspacing="6" cellpadding="5" align="center">
		<!--- Part 1, Get Next Genre that is different --->
		<cfif qGetShowcaseGetGenre.Header is not #NewName#>
			<cfset compound = "Genre" & #var#> 
			<cfset "#compound#" = qGetShowcaseGetGenre.Header >
			<cfset NewName=#qGetShowcaseGetGenre.Header#>
			<cfset var=var+1>

						
			<CFQUERY NAME="qGetSpecificGenre1"  DATASOURCE="photoeyecom">

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
(D.Genre1 = '#evaluate(compound)#') AND 
(I.DEFAULT9 = 1) and P.ShowcaseOK=1 <cfif include is 2>AND G.Tier=3<cfelseif include is 1>AND (G.Tier=1 OR G.Tier=2)<cfelseif include is 3>AND G.Tier>0</cfif> <cfif xGallery GT 0> and G.Gallery='#xGalleryName#'</cfif>
ORDER BY D.Genre1, D.GenreRandomNo, G.LastName

			</cfquery>
		
			<!--- Part 3, set variables that define the More in the header --->
			<cfset MoreSpecificGenre=qGetSpecificGenre1.RecordCount - 6>
			<cfset SpecificGenreCounter=0>
			
			<!--- Part 4, Produce the header if RecordCount GT 0--->
			<cfif #qGetSpecificGenre1.RecordCount# GT 0>
				<tr valign="top">
				<td colspan="5" bgcolor="Black"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="Silver">
				<cfif qGetSpecificGenre1.RecordCount LT 7>
					#qGetShowcaseGetGenre.Header# </font><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="Silver"></font></b>
				<cfelse> 
	<!--- Take out any spaces in the URL parameter and replace them with an obvious set of characters that may be then replaced at the beginning of the MoreFormats page--->				
<cfset CategoryURL =  #Replace(qGetShowcaseGetGenre.Header," ","%20","All")#>	
				
					#qGetShowcaseGetGenre.Header# &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="MoreGenres.cfm?Category1=#CategoryURL#&Include=#Include#&Gallery=#xGallery#" target="_parent"><FONT color="Silver" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Silver';"  style="TEXT-DECORATION: none"><!--- <a href="MoreGenres.cfm?Category1=#qGetShowcaseGetGenre.Header#&Include=#Include#"><FONT color="Silver" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Silver';"  style="TEXT-DECORATION: none"> ---><b>#MoreSpecificGenre# More <cfif #MoreSpecificGenre# is 1>Artist Portfolio<cfelse>Artist Portfolios</cfif></b></font></a>
				</cfif>
    			</td>
				</tr>
			</cfif>
	
	<cfset Column = 1>
	<cfset counter=1>
<cfloop query="qGetSpecificGenre1">
		 <cfif Column is 1 and Counter LT 7>

 
	  <tr>
<td width="100" height="77" valign="middle"><a href="/gallery/forms2/index.cfm?image=#ImageNumber#&id=#qGetSpecificGenre1.Custnumber#&imagePosition=#ImagePosition#&Door=6&Portfolio=#qGetSpecificGenre1.Portfolio#&Gallery=#xGallery#"><FONT color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='##333333';"  style="TEXT-DECORATION: none"><b>
		#qGetSpecificGenre1.FirstName#<br>#qGetSpecificGenre1.LastName#</a><br><br></b></font>
			 <cfset ArtistGallery =''>
	 <cfif UCASE(qGetSpecificGenre1.Gallery) is 'REPRESENTEDARTISTS'>
	 	<cfset ArtistGallery = 'Santa Fe<br>Gallery Artist'>
	 <cfelseif UCASE(qGetSpecificGenre1.Gallery) is 'PHOTOSHOWCASE'>
	 	<cfif qGetSpecificGenre1.Tier is 1>
			<cfset ArtistGallery = 'Photographer&lsquo;s<br>Showcase Artist'>
		<cfelseif qGetSpecificGenre1.Tier is 2>
			<cfset ArtistGallery = 'Photographer&lsquo;s<br>Showcase Artist'>
		<cfelseif qGetSpecificGenre1.Tier is 3>
			<cfset ArtistGallery = 'Photographer&lsquo;s<br>Showcase Artist'>
		</cfif>			
	 <cfelseif UCASE(qGetSpecificGenre1.Gallery) is 'MAGNUMARTISTS'>
	 	<cfset ArtistGallery = 'Magnum<br>Photos Artist'>
     </cfif> 
	<FONT color="##666666" face="verdana, arial, Helvetica, sans-serif" size="1"><b> #ArtistGallery# <br> 
<FONT color="##666666" face="verdana, arial, Helvetica, sans-serif" size="1"><b>#qGetSpecificGenre1.ImageQty# Images</b></font></td>
 	<td width="100" valign="middle">
		<a href="/gallery/forms2/index.cfm?image=#ImageNumber#&id=#qGetSpecificGenre1.Custnumber#&imagePosition=#ImagePosition#&Door=6&Portfolio=#qGetSpecificGenre1.Portfolio#&Gallery=#xGallery#">
		
<!--- ImageSizer --->									
<cfset xheight=64>
<cfset xwidth=75>
<cfset xImageAddress="#xRelativePath#\Artists\#qGetSpecificGenre1.Subdirectory#\#qGetSpecificGenre1.Portfolio#\Images_Large\">

<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image#qGetSpecificGenre1.ImageNumber#.jpg">

<cfinclude template="/templates/imagesizer.cfm">

<img src="/_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a>
<!--- End ImageSizer --->

	</td>
	<!--- Center Column --->
	<td>&nbsp;
		
	</td>
	<!--- If there is only one record, include a blank cell so that the only image is properly Genreted--->
	<cfif qGetSpecificGenre1.recordcount is 1>
		<td width="100" height="77">&nbsp;
		
		</td>
	</cfif>

	<cfset Column = 2>
	<cfset counter=counter+1>
	
	<cfelseif Column is 2 and Counter LT 7>
	 
    	<td width="100" height="77" valign="middle"><a href="/gallery/forms2/index.cfm?image=#ImageNumber#&id=#qGetSpecificGenre1.Custnumber#&imagePosition=#ImagePosition#&Door=6&Portfolio=#qGetSpecificGenre1.Portfolio#&Gallery=#xGallery#"><FONT color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='##333333';"  style="TEXT-DECORATION: none"><b>
		#qGetSpecificGenre1.FirstName#<br>#qGetSpecificGenre1.LastName#</a><br><br></b></font>
			 <cfset ArtistGallery =''>
	 <cfif UCASE(qGetSpecificGenre1.Gallery) is 'REPRESENTEDARTISTS'>
	 	<cfset ArtistGallery = 'Santa Fe<br>Gallery Artist'>
	 <cfelseif UCASE(qGetSpecificGenre1.Gallery) is 'PHOTOSHOWCASE'>
	 	<cfif qGetSpecificGenre1.Tier is 1>
			<cfset ArtistGallery = 'Photographer&lsquo;s<br>Showcase Artist'>
		<cfelseif qGetSpecificGenre1.Tier is 2>
			<cfset ArtistGallery = 'Photographer&lsquo;s<br>Showcase Artist'>
		<cfelseif qGetSpecificGenre1.Tier is 3>
			<cfset ArtistGallery = 'Photographer&lsquo;s<br>Showcase Artist'>
		</cfif>			
	 <cfelseif UCASE(qGetSpecificGenre1.Gallery) is 'MAGNUMARTISTS'>
	 	<cfset ArtistGallery = 'Magnum<br>Photos Artist'>
     </cfif> 
	<FONT color="##666666" face="verdana, arial, Helvetica, sans-serif" size="1"><b> #ArtistGallery# <br> 
<FONT color="##666666" face="verdana, arial, Helvetica, sans-serif" size="1"><b>
    	  #qGetSpecificGenre1.ImageQty# Images</b></font></td>
 	<td width="100" align="left" valign="middle">
			<a href="/gallery/forms2/index.cfm?image=#ImageNumber#&id=#qGetSpecificGenre1.Custnumber#&imagePosition=#ImagePosition#&Door=6&Portfolio=#qGetSpecificGenre1.Portfolio#&Gallery=#xGallery#">

<!--- ImageSizer --->									
<cfset xheight=64>
<cfset xwidth=75>
<cfset xImageAddress="#xRelativePath#\Artists\#qGetSpecificGenre1.Subdirectory#\#qGetSpecificGenre1.Portfolio#\Images_Large\">

<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image#qGetSpecificGenre1.ImageNumber#.jpg">

<cfinclude template="/templates/imagesizer.cfm">

<img src="/_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a>
<!--- End ImageSizer --->
		</td>
		<cfset Column =1 >	
		<cfset counter=counter+1>
	</tr>
	</cfif>
		</cfloop>	
		</table>
	</cfif>
</cfloop>

</cfoutput>
<br>

<cfinclude template="includes/dsp_galleries_index_bottom.cfm">

