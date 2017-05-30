<cfset Categoryx =  #Replace(Category1,"%20"," ","All")#>	

<!--- Creates variable to Not Show All images from a particular category --->
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

<CFSET xExploreBy = 4> 

<cfif xGallery is 1>
	<CFSET xTitle="Gallery - Santa Fe">
	<CFSET xThisSubtitle = "Camera Formats">
	<CFSET xMenuToShow = "Santa Fe">
	
<cfelseif xGallery is 2>
	<CFSET xTitle="Photographer's Showcase">
	<CFSET xThisSubtitle = "Camera Formats">
	<CFSET xMenuToShow = "Showcase">

<cfelseif xGallery is 3>
	<CFSET xTitle="Magnum Photos">
	<CFSET xThisSubtitle = "Camera Formats">
	<CFSET xMenuToShow = "Magnum">
	
<cfelse>
	<CFSET xTitle="Galleries">
	<CFSET xThisSubtitle = "Camera Formats - All Galleries">
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

<!--- 
<CFQUERY NAME="qGetFormats"  DATASOURCE="photoeyecom">
SELECT DISTINCT Header, D.Format1 as D_Format1
FROM     GalleryIndividualPhotos as I,  GalleryDirectories as H INNER JOIN
      GalleryDefaultPhotos D ON H.Header = D.Format1 
WHERE     (Directory = 'Format') and  (I.DefaultFormat=1 and (D.Format1 <> '' or  D.Format1 is not Null) )
or (I.DefaultFormat=0 and (I.Format1 <> '' or  I.Format1 is not Null) )
ORDER BY HEADER
</cfquery> --->
<CFQUERY NAME="qGetFormats"  DATASOURCE="photoeyecom">
SELECT DISTINCT R.Header
FROM         dbo.GalleryDirectories R INNER JOIN
                      GalleryDefaultPhotos D ON R.Header = D.Format1 INNER JOIN
                      GallerySetup S ON S.Custnumber = D.Custnumber INNER JOIN
                      GalleryIndividualPhotos I ON S.Custnumber = I.Custnumber
WHERE     (<cfif xGAllery is 0>S.Gallery = 'MAGNUMARTISTS' or  S.Gallery = 'PHOTOSHOWCASE' or S.Gallery = 'REPRESENTEDARTISTS' <cfelse>S.Gallery = '#xGalleryName#'</cfif>) AND (I.DEFAULTFormat = 1) OR
                      (<cfif xGAllery is 0>S.Gallery = 'MAGNUMARTISTS' or  S.Gallery = 'PHOTOSHOWCASE' or S.Gallery = 'REPRESENTEDARTISTS' <cfelse>S.Gallery = '#xGalleryName#'</cfif>) AND (I.DEFAULTFormat = 0) AND (I.Format1 <> '')
</cfquery>


<cfif #URL.Category1# is ''>

<!--- 5/20/02 Took out the Non-Default Image Format Option--->	
<CFQUERY NAME="qGetShowcaseFormat"  DATASOURCE="photoeyecom">
SELECT DISTINCT 
       G.Subdirectory AS SubDirectory, G.FirstName AS Firstname, P.ImgQty AS ImageQTy, G.LastName AS Lastname, G.Gallery AS Gallery, G.Custnumber as Custnumber, 
P.SubDirectory AS Portfolio, D.Format1 AS D_Format1, D.Format2 AS D_Format2, I.Format1 AS I_Format1, I.Format2 AS I_Format2, 
I.DEFAULTFormat, D.FormatRandomNo, G.LastName AS Expr1, G.Tier as Tier, I.Imagenumber, I.Imageposition
FROM  GallerySetup G INNER JOIN
      GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
      GalleryDefaultPhotos D ON G.Custnumber = D.Custnumber AND P.SubDirectory = D.SubDirectory INNER JOIN
      GalleryIndividualPhotos I ON G.Custnumber = I.Custnumber AND P.SubDirectory = I.PortfolioName
WHERE (P.ImgQty > 0) AND 
(I.ImagePosition = 1) AND 
(D.Format1 is Null or D.Format1='') <!---  OR (P.ImgQty > 0) AND 
(I.ImagePosition = 1) AND 
(I.DEFAULTFormat = 0) AND 
(I.Format1 is Null or I.Format1=''))---> and  P.ShowcaseOK=1 <cfif include is 2>AND G.Tier=3<cfelseif include is 1>AND (G.Tier=1 OR G.Tier=2)<cfelseif include is 3>AND G.Tier>0</cfif> and P.ShowcaseOK=1 <cfif xGallery GT 0> and G.Gallery='#xGalleryName#'</cfif>
ORDER BY D.Format1, G.Tier, D.FormatRandomNo, G.LastName
<!--- ORDER BY  FormatRandomNo  --->



</cfquery>

<!--- AND 
(I.DEFAULTFormat = 1)  --->

<cfelse>

<!--- 5/20/02 Took out the Non-Default Image Format Option--->
<CFQUERY NAME="qGetShowcaseFormat"  DATASOURCE="photoeyecom">
SELECT DISTINCT 
       G.Subdirectory AS SubDirectory, G.FirstName AS Firstname, P.ImgQty AS ImageQTy, G.LastName AS Lastname, G.Gallery AS Gallery, G.Custnumber as Custnumber, 
P.SubDirectory AS Portfolio, D.Format1 AS D_Format1, D.Format2 AS D_Format2, I.Format1 AS I_Format1, I.Format2 AS I_Format2, 
I.DEFAULTFormat, D.FormatRandomNo, G.LastName AS Expr1, G.Tier as Tier, I.ImageNumber, I.ImagePosition
FROM  GallerySetup G INNER JOIN
      GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
      GalleryDefaultPhotos D ON G.Custnumber = D.Custnumber AND P.SubDirectory = D.SubDirectory INNER JOIN
      GalleryIndividualPhotos I ON G.Custnumber = I.Custnumber AND P.SubDirectory = I.PortfolioName
<!--- WHERE ((P.ImgQty > 0) AND 
(I.ImagePosition = 1) AND 
(D.Format1 = '#Categoryx#') AND 
(I.DEFAULTFormat = 1) OR (P.ImgQty > 0) AND 
(I.ImagePosition = 1) AND 
(I.DEFAULTFormat = 0) AND 
(I.Format1 = '#Categoryx#'))  and P.ShowcaseOK=1 <cfif include is 2>AND G.Tier=3<cfelseif include is 1>AND (G.Tier=1 OR G.Tier=2)<cfelseif include is 3>AND G.Tier>0</cfif> and P.ShowcaseOK=1 <cfif xGallery GT 0> and G.Gallery='#xGalleryName#'</cfif> --->
WHERE (P.ImgQty > 0) AND 
(I.ImagePosition = 1) AND 
(D.Format1 = '#Categoryx#') <!--- or (P.ImgQty > 0)  AND 
(I.ImagePosition = 1) AND 
(I.DEFAULTFormat = 0) AND 
(I.Format1 = '#Categoryx#')) --->  and P.ShowcaseOK=1 <cfif include is 2>AND G.Tier=3<cfelseif include is 1>AND (G.Tier=1 OR G.Tier=2)<cfelseif include is 3>AND G.Tier>0</cfif> and P.ShowcaseOK=1 <cfif xGallery GT 0> and G.Gallery='#xGalleryName#'</cfif>

ORDER BY D.Format1, G.Tier, D.FormatRandomNo, G.LastName
<!--- ORDER BY D.Format1, G.Tier, D.FormatRandomNo, G.LastName
ORDER BY  FormatRandomNo  --->
</cfquery>


<!--- AND 
(I.DEFAULTFormat = 1)
 --->

</cfif>

		
	<cfset ImageNumber = 1>
	<cfset ImagePosition = 1>
	
	<cfset Formatx= "x">  	
	<cfset Column = 1>
	<cfset counter=1>


  
  
<cfoutput>

			
			
		<table width="500" border="0" cellspacing="6" cellpadding="5" align="center">
  
  		<tr> 
			<cfif #URL.Category1# is ''>
						<td colspan="5" bgcolor="Black"><TABLE WIDTH="100%"><TR><TD VALIGN="TOP"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="Silver"><b>Undefined Format</b>
			<cfelse>
			<td colspan="5"  width="565"  bgcolor="Black"><TABLE WIDTH="100%"><TR><TD VALIGN="TOP"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="Silver"><b>#Categoryx#</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<cfif All is 0>
<a href="javascript:history.back();"><FONT color="silver" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='silver';"  style="TEXT-DECORATION: none"><b>Previous Page</b></font></a>
</cfif>
			
	</cfif>		
	
	</TD><td colspan="5"  align="right">
			 <form method=POST enctype="text/plain" name="menu" action="">
				<select name="newLocation" style="font: 9px; BACKGROUND-COLOR:##eeeeee;" onChange="jumpMenu('parent',this,0)">
                <option value="##TOP" selected >Select&nbsp;Another&nbsp;Format&nbsp;</option>
				
                <cfloop query="qGetFormats">
	<!--- Take out any spaces in the URL parameter and replace them with an obvious set of characters that may be then replaced at the beginning of the MoreFormats page--->	
<cfset CategoryURL =  #Replace(qGetFormats.Header," ","%20","All")#>	
	<option
					 value="MoreFormats.cfm?Category1=#CategoryURL#&Include=#Include#&Gallery=#Gallery#&All=1" >#Header#</option>
				</cfloop>
				<option
					 value="Formats.cfm?Gallery=#Gallery#" >> Show All Formats</option>
	            </select>
    		</td></form></tr></TABLE>
		
			</td>
			
			
		</tr>
	
	
	<cfset Column=1>
	<cfset counter=1>
	<cfset HeaderFirstTime=1>	
	
   	<cfloop query="qGetShowcaseFormat">
	
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
	<a href="/gallery/forms2/index.cfm?image=#ImageNumber#&id=#qGetShowcaseFormat.Custnumber#&imagePosition=#ImagePosition#&Door=9&Portfolio=#qGetShowcaseFormat.Portfolio#&Gallery=#url.Gallery#"><FONT color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='##333333';"  style="TEXT-DECORATION: none"><b>
	#qGetShowcaseFormat.FirstName# #qGetShowcaseFormat.LastName#<br><br></b></font></a>
	 <cfset ArtistGallery =''>
	 <cfif UCASE(qGetShowcaseFormat.Gallery) is 'REPRESENTEDARTISTS'>
	 	<cfset ArtistGallery = 'Santa Fe<br>Gallery Artist'>
	 <cfelseif UCASE(qGetShowcaseFormat.Gallery) is 'PHOTOSHOWCASE'>
	 	<cfif qGetShowcaseFormat.Tier is 1>
			<cfset ArtistGallery = 'Photographer&lsquo;s<br>Showcase Artist'>
		<cfelseif qGetShowcaseFormat.Tier is 2>
			<cfset ArtistGallery = 'Photographer&lsquo;s<br>Showcase Artist'>
		<cfelseif qGetShowcaseFormat.Tier is 3>
			<cfset ArtistGallery = 'Photographer&lsquo;s<br>Showcase Artist'>
		</cfif>			
	 <cfelseif UCASE(qGetShowcaseFormat.Gallery) is 'MAGNUMARTISTS'>
	 	<cfset ArtistGallery = 'Magnum<br>Photos Artist'> 
     </cfif><FONT color="##666666" face="verdana, arial, Helvetica, sans-serif" size="1"><b>#ArtistGallery#<br>
	#qGetShowcaseFormat.ImageQty# Images</b></font></td>
 	<td width="100">
			<a href="/gallery/forms2/index.cfm?image=#ImageNumber#&id=#qGetShowcaseFormat.Custnumber#&imagePosition=#ImagePosition#&Door=9&Portfolio=#qGetShowcaseFormat.Portfolio#&Gallery=#url.Gallery#">

<!--- ImageSizer --->									
<cfset xheight=64>
<cfset xwidth=75>
<cfset xImageAddress="#xRelativePath#\Artists\#qGetShowcaseFormat.Subdirectory#\#qGetShowcaseFormat.Portfolio#\Images_Large\">

<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image#qGetShowcaseFormat.ImageNumber#.jpg">

<cfinclude template="../templates/imagesizer.cfm">

<img src="../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a>
<!--- End ImageSizer --->

		</td>
	<!--- Center Column --->
	<td>&nbsp;
		
	</td>
	<!--- If there is only one record, include a blank cell so that the only image is properly formatted--->
	<cfif qGetShowcaseFormat.recordcount is 1>
		<td width="100" height="77">&nbsp;
		
		</td>
	</cfif>
	<cfset Column = 2>
	<cfset counter=counter+1>
	
	<cfelseif Column is 2>
    <td width="100" height="77"> 
	<a href="/gallery/forms2/index.cfm?image=#ImageNumber#&id=#qGetShowcaseFormat.Custnumber#&imagePosition=#ImagePosition#&Door=9&Portfolio=#qGetShowcaseFormat.Portfolio#&Gallery=#url.Gallery#"><FONT color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='##333333';"  style="TEXT-DECORATION: none"><b>
	#qGetShowcaseFormat.FirstName# #qGetShowcaseFormat.LastName#<br><br></b></font></a>
	
	 <cfset ArtistGallery =''>
	 <cfif UCASE(qGetShowcaseFormat.Gallery) is 'REPRESENTEDARTISTS'>
	 	<cfset ArtistGallery = 'Santa Fe<br>Gallery Artist'>
	 <cfelseif UCASE(qGetShowcaseFormat.Gallery) is 'PHOTOSHOWCASE'>
	 	<cfif qGetShowcaseFormat.Tier is 1>
			<cfset ArtistGallery = 'Photographer&lsquo;s<br>Showcase Artist'>
		<cfelseif qGetShowcaseFormat.Tier is 2>
			<cfset ArtistGallery = 'Photographer&lsquo;s<br>Showcase Artist'>
		<cfelseif qGetShowcaseFormat.Tier is 3>
			<cfset ArtistGallery = 'Photographer&lsquo;s<br>Showcase Artist'>
		</cfif>			
	 <cfelseif UCASE(qGetShowcaseFormat.Gallery) is 'MAGNUMARTISTS'>
	 	<cfset ArtistGallery = 'Magnum<br>Photos Artist'> 
     </cfif><FONT color="##666666" face="verdana, arial, Helvetica, sans-serif" size="1"><b>#ArtistGallery#<br>#qGetShowcaseFormat.ImageQty# Images</b></font></td>
 	<td width="100">
			<a href="/gallery/forms2/index.cfm?image=#ImageNumber#&id=#qGetShowcaseFormat.Custnumber#&imagePosition=#ImagePosition#&Door=9&Portfolio=#qGetShowcaseFormat.Portfolio#&Gallery=#url.Gallery#">
	
<!--- ImageSizer --->									
<cfset xheight=64>
<cfset xwidth=75>
<cfset xImageAddress="#xRelativePath#\Artists\#qGetShowcaseFormat.Subdirectory#\#qGetShowcaseFormat.Portfolio#\Images_Large\">

<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image#qGetShowcaseFormat.ImageNumber#.jpg">

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
  
