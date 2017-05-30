<!--- 06/29/2003 RR --->
<!--- 1. A server cfCache is created that expires everyday at 12:23 pm MDT - the time this was first run. Any New Content will show at that time automatically--->
<!--- <cfcache action="Flush"> --->


<CFIF xSwitch is 1>

<!---<cfcache action="Cache" Timeout="#DateAdd('d',-1, Now())#"> --->
</CFIF>

<CFPARAM NAME="url.Include" DEFAULT="1">

<cfif IsDefined("RadioInclude")>
	<cfset include=#form.RadioInclude#>
<cfelse>
	<cfset include=#url.Include#>
</cfif>


<CFQUERY NAME="qGetShowcaseGetFormat"  DATASOURCE="photoeyecom">
SELECT  Distinct *
FROM       GalleryDirectories
WHERE     (Directory = 'Format') 
</cfquery>

<CFPARAM NAME="url.Gallery" DEFAULT="0">
<CFSET xGallery = url.Gallery>

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

<!---<CFSET xPathToRoot="../">
<CFSET xShowBackButton = 1>
<CFSET xShowMenu = 1>
<cfinclude template="../templates/Header.cfm">--->

<cfinclude template="includes/dsp_galleries_index_top.cfm">
	
<CFSET xExploreBy = 4>
<CFINCLUDE TEMPLATE="Menu.cfm">
<BR>
<CFSET xSubtitle = xThisSubtitle>
<cfinclude template="../templates/title.cfm">
<DIV ALIGN="CENTER"><CFOUTPUT>#xHTMLTitle#</CFOUTPUT></DIV>

<TABLE><TR><TD HEIGHT="7"></TD></TR></TABLE>


	<cfset ImageNumber = 1>
	<cfset ImagePosition = 1>
	
	<cfset Formatx= "x">  	

<cfset NewName = ''>
<cfset Qty=0>
<cfset var=1>
<cfoutput>

   <cfset HeaderFirstTime=0>

	<cfloop query="qGetShowcaseGetFormat">
	<table width="500" border="0" cellspacing="6" cellpadding="5" align="center">
		<!--- Part 1, Get Next Format that is different --->
		<cfif qGetShowcaseGetFormat.Header is not #NewName#>
			<cfset compound = "Format" & #var#> 
			<cfset "#compound#" = qGetShowcaseGetFormat.Header >
			<cfset NewName=#qGetShowcaseGetFormat.Header#>
			<cfset var=var+1>
			
			<!--- Part 2, Count Number of Portfolios that use this Format --->
			
<!--- 			<CFQUERY NAME="qGetSpecificFormatAll"  DATASOURCE="photoeyecom">

SELECT DISTINCT 
       G.Subdirectory AS SubDirectory, G.FirstName AS Firstname, P.ImgQty AS ImageQTy, G.LastName AS Lastname, G.Gallery AS Gallery, G.Custnumber, 
P.SubDirectory AS Portfolio, D.Format1 AS D_Format1, D.Format2 AS D_Format2, I.Format1 AS I_Format1, I.Format2 AS I_Format2, 
I.DEFAULT9, D.FormatRandomNo, G.LastName AS Expr1
FROM  GallerySetup G INNER JOIN
      GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
      GalleryDefaultPhotos D ON G.Custnumber = D.Custnumber AND P.SubDirectory = D.SubDirectory INNER JOIN
      GalleryIndividualPhotos I ON G.Custnumber = I.Custnumber AND P.SubDirectory = I.PortfolioName
WHERE ((P.ImgQty > 0) AND 
(I.ImageNumber = 1) AND 
(D.Format1 = '#evaluate(compound)#') AND 
(I.DEFAULT9 = 1) OR (P.ImgQty > 0) AND 
(I.ImageNumber = 1) AND 
(I.DEFAULT9 = 0) AND 
(I.Format1 = '#evaluate(compound)#')) AND G.TIER=1
ORDER BY D.Format1, D.FormatRandomNo, G.LastName

			</cfquery> --->
		
	<!--- 5/20/02 Took out the Non-Default Image Format Option--->					
			<CFQUERY NAME="qGetSpecificFormat1"  DATASOURCE="photoeyecom">
SELECT DISTINCT 
       G.Subdirectory AS SubDirectory, G.FirstName AS Firstname, P.ImgQty AS ImageQTy, G.LastName AS Lastname, G.Gallery AS Gallery, G.Custnumber, 
P.SubDirectory AS Portfolio, D.Format1 AS D_Format1, D.Format2 AS D_Format2, I.Format1 AS I_Format1, I.Format2 AS I_Format2, G.Tier as Tier, 
I.DEFAULTFormat, D.FormatRandomNo, G.LastName AS Expr1, I.Imagenumber, I.Imageposition
FROM  GallerySetup G INNER JOIN
      GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
      GalleryDefaultPhotos D ON G.Custnumber = D.Custnumber AND P.SubDirectory = D.SubDirectory INNER JOIN
      GalleryIndividualPhotos I ON G.Custnumber = I.Custnumber AND P.SubDirectory = I.PortfolioName
WHERE (P.ImgQty > 0) AND 
(I.ImagePosition = 1) AND 
(D.Format1 = '#evaluate(compound)#') and P.ShowcaseOK=1 <cfif include is 2>AND G.Tier=3<cfelseif include is 1>AND (G.Tier=1 OR G.Tier=2)<cfelseif include is 3>AND G.Tier>0</cfif> <cfif xGallery GT 0> and G.Gallery='#xGalleryName#'</cfif>
ORDER BY D.Format1, G.Tier, D.FormatRandomNo, G.LastName


	<!---		<CFQUERY NAME="qGetSpecificFormat1"  DATASOURCE="photoeyecom">
			
 5/20/02 Took out the Non-Default Image Format Option
SELECT DISTINCT 
       G.Subdirectory AS SubDirectory, G.FirstName AS Firstname, P.ImgQty AS ImageQTy, G.LastName AS Lastname, G.Gallery AS Gallery, G.Custnumber, 
P.SubDirectory AS Portfolio, D.Format1 AS D_Format1, D.Format2 AS D_Format2, I.Format1 AS I_Format1, I.Format2 AS I_Format2, G.Tier as Tier, 
I.DEFAULTFormat, D.FormatRandomNo, G.LastName AS Expr1, I.Imagenumber, I.Imageposition
FROM  GallerySetup G INNER JOIN
      GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
      GalleryDefaultPhotos D ON G.Custnumber = D.Custnumber AND P.SubDirectory = D.SubDirectory INNER JOIN
      GalleryIndividualPhotos I ON G.Custnumber = I.Custnumber AND P.SubDirectory = I.PortfolioName
WHERE ((P.ImgQty > 0) AND 
(I.ImagePosition = 1) AND 
(D.Format1 = '#evaluate(compound)#')  AND 
(I.DEFAULTFormat = 1) <!--- OR (P.ImgQty > 0) AND 
(I.ImagePosition = 1) AND 
(I.DEFAULTFormat = 0) AND 
(I.Format1 = '#evaluate(compound)#')) --->  and P.ShowcaseOK=1 <cfif include is 2>AND G.Tier=3<cfelseif include is 1>AND (G.Tier=1 OR G.Tier=2)<cfelseif include is 3>AND G.Tier>0</cfif> and P.ShowcaseOK=1 <cfif xGallery GT 0> and G.Gallery='#xGallery#'</cfif>
<!--- (I.Format1 = '#evaluate(compound)#')) and P.ShowcaseOK=1  <cfif xGallery GT 0> and G.Gallery='#xGallery#'</cfif><!--- <cfif include is 2>AND G.Tier=3<cfelseif include is 1>AND (G.Tier=1 OR G.Tier=2)<cfelseif include is 3>AND G.Tier>0</cfif> ---> --->
ORDER BY D.Format1, G.Tier, D.FormatRandomNo, G.LastName --->

			</cfquery>
			
<!--- Get Tier 2 Formats --->
<!--- 			<CFQUERY NAME="qGetSpecificFormat2"  DATASOURCE="photoeyecom">

SELECT DISTINCT 
       G.Subdirectory AS SubDirectory, G.FirstName AS Firstname, P.ImgQty AS ImageQTy, G.LastName AS Lastname, G.Gallery AS Gallery, G.Custnumber, 
P.SubDirectory AS Portfolio, D.Format1 AS D_Format1, D.Format2 AS D_Format2, I.Format1 AS I_Format1, I.Format2 AS I_Format2, 
I.DEFAULT9, D.FormatRandomNo, G.LastName AS Expr1
FROM  GallerySetup G INNER JOIN
      GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
      GalleryDefaultPhotos D ON G.Custnumber = D.Custnumber AND P.SubDirectory = D.SubDirectory INNER JOIN
      GalleryIndividualPhotos I ON G.Custnumber = I.Custnumber AND P.SubDirectory = I.PortfolioName
WHERE ((P.ImgQty > 0) AND 
(I.ImageNumber = 1) AND 
(D.Format1 = '#evaluate(compound)#') AND 
(I.DEFAULT9 = 1) OR (P.ImgQty > 0) AND 
(I.ImageNumber = 1) AND 
(I.DEFAULT9 = 0) AND 
(I.Format1 = '#evaluate(compound)#')) AND G.TIER=2
ORDER BY D.Format1, D.FormatRandomNo, G.LastName

			</cfquery> --->
			
 	<!--- Get Tier 3 Formats --->
<!--- 			<CFQUERY NAME="qGetSpecificFormat3"  DATASOURCE="photoeyecom">

SELECT DISTINCT 
       G.Subdirectory AS SubDirectory, G.FirstName AS Firstname, P.ImgQty AS ImageQTy, G.LastName AS Lastname, G.Gallery AS Gallery, G.Custnumber, 
P.SubDirectory AS Portfolio, D.Format1 AS D_Format1, D.Format2 AS D_Format2, I.Format1 AS I_Format1, I.Format2 AS I_Format2, 
I.DEFAULT9, D.FormatRandomNo, G.LastName AS Expr1
FROM  GallerySetup G INNER JOIN
      GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
      GalleryDefaultPhotos D ON G.Custnumber = D.Custnumber AND P.SubDirectory = D.SubDirectory INNER JOIN
      GalleryIndividualPhotos I ON G.Custnumber = I.Custnumber AND P.SubDirectory = I.PortfolioName
WHERE ((P.ImgQty > 0) AND 
(I.ImageNumber = 1) AND 
(D.Format1 = '#evaluate(compound)#') AND 
(I.DEFAULT9 = 1) OR (P.ImgQty > 0) AND 
(I.ImageNumber = 1) AND 
(I.DEFAULT9 = 0) AND 
(I.Format1 = '#evaluate(compound)#')) AND G.TIER=3
ORDER BY D.Format1, D.FormatRandomNo, G.LastName
</cfquery> --->
			
			<!--- Part 3, set variables that define the More in the header ---> 
			<cfset MoreSpecificFormat=qGetSpecificFormat1.RecordCount - 6>
			<!--- <cfset MoreSpecificFormat=qGetSpecificFormat1.RecordCount - 6> --->
			<cfset SpecificFormatCounter=0>
			
			<!--- Part 4, Produce the header if RecordCount GT 0--->
			<cfif #qGetSpecificFormat1.RecordCount# GT 0>
				<tr valign="top">
				<td colspan="5" bgcolor="Black"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="Silver">
				<cfif qGetSpecificFormat1.RecordCount LT 7>
					#qGetShowcaseGetFormat.Header# </font><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="Silver"></font></b>
				<cfelse> 

	<!--- Take out any spaces in the URL parameter and replace them with an obvious set of characters that may be then replaced at the beginning of the MoreFormats page--->
	<cfset CategoryURL =  #Replace(qGetShowcaseGetFormat.Header," ","%20","All")#>

					#qGetShowcaseGetFormat.Header#  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="MoreFormats.cfm?Category1=#CategoryURL#&Include=#Include#&Gallery=#xGallery#" target="_parent"><FONT color="silver" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='silver';"  style="TEXT-DECORATION: none"><b>#MoreSpecificFormat# More <cfif #MoreSpecificFormat# is 1>Artist<cfelse>Artists</cfif></b></font></a>
				</cfif>
    			</td>
				</tr>
			</cfif>
	<cfset Column = 1>
	<cfset counter=1>
<cfloop query="qGetSpecificFormat1">

		 <cfif Column is 1 and Counter LT 7>

 
	  <tr>
<td width="100" height="77" valign="middle"><a href="forms2/index.cfm?image=#ImageNumber#&id=#qGetSpecificFormat1.Custnumber#&imagePosition=#ImagePosition#&Door=9&Portfolio=#qGetSpecificFormat1.Portfolio#&Gallery=#xGallery#"><FONT color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='##333333';"  style="TEXT-DECORATION: none"><b>
		#qGetSpecificFormat1.FirstName# #qGetSpecificFormat1.LastName#</a><br><br></b></font><FONT color="##666666" face="verdana, arial, Helvetica, sans-serif" size="1"><b>
    	 	 <cfset ArtistGallery =''>
	 <cfif UCASE(qGetSpecificFormat1.Gallery) is 'REPRESENTEDARTISTS'>
	 	<cfset ArtistGallery = 'Santa Fe<br>Gallery Artist'>
	 <cfelseif UCASE(qGetSpecificFormat1.Gallery) is 'PHOTOSHOWCASE'>
	 	<cfif qGetSpecificFormat1.Tier is 1>
			<cfset ArtistGallery = 'Photographer&lsquo;s<br>Showcase Artist'>
		<cfelseif qGetSpecificFormat1.Tier is 2>
			<cfset ArtistGallery = 'Photographer&lsquo;s<br>Showcase Artist'>
		<cfelseif qGetSpecificFormat1.Tier is 3>
			<cfset ArtistGallery = 'Photographer&lsquo;s<br>Showcase Artist'>
		</cfif>			
	 <cfelseif UCASE(qGetSpecificFormat1.Gallery) is 'MAGNUMARTISTS'>
	 	<cfset ArtistGallery = 'Magnum<br>Photos Artist'>
     </cfif>#ArtistGallery#<br>
#qGetSpecificFormat1.ImageQty# Images</b></font></td>
 	<td width="100" valign="middle">
		<a href="forms2/index.cfm?image=#ImageNumber#&id=#qGetSpecificFormat1.Custnumber#&imagePosition=#ImagePosition#&Door=9&Portfolio=#qGetSpecificFormat1.Portfolio#&Gallery=#xGallery#">
		
<!--- ImageSizer --->									
<cfset xheight=64>
<cfset xwidth=75>
<cfset xImageAddress="#xRelativePath#\Artists\#qGetSpecificFormat1.Subdirectory#\#qGetSpecificFormat1.Portfolio#\Images_Large\">

<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image#qGetSpecificFormat1.ImageNumber#.jpg">

<cfinclude template="/templates/imagesizer.cfm">

<img src="/_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a>
<!--- End ImageSizer --->

	</td>
	<!--- Center Column --->
	<td>&nbsp;
		
	</td>
	<!--- If there is only one record, include a blank cell so that the only image is properly Formatted--->
	<cfif qGetSpecificFormat1.recordcount is 1>
		<td width="100" height="77">&nbsp;
		
		</td>
	</cfif>

	<cfset Column = 2>
	<cfset counter=counter+1>
	
	<cfelseif Column is 2 and Counter LT 7>
	 
    	<td width="100" height="77" valign="middle"><a href="forms2/index.cfm?image=#ImageNumber#&id=#qGetSpecificFormat1.Custnumber#&imagePosition=#ImagePosition#&Door=9&Portfolio=#qGetSpecificFormat1.Portfolio#&Gallery=#xGallery#"><FONT color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='##333333';"  style="TEXT-DECORATION: none"><b>
		#qGetSpecificFormat1.FirstName# #qGetSpecificFormat1.LastName#</a><br><br></b></font>
<FONT color="##666666" face="verdana, arial, Helvetica, sans-serif" size="1"><b>
    	 	 <cfset ArtistGallery =''>
	 <cfif UCASE(qGetSpecificFormat1.Gallery) is 'REPRESENTEDARTISTS'>
	 	<cfset ArtistGallery = 'Santa Fe<br>Gallery Artist'>
	 <cfelseif UCASE(qGetSpecificFormat1.Gallery) is 'PHOTOSHOWCASE'>
	 	<cfif qGetSpecificFormat1.Tier is 1>
			<cfset ArtistGallery = 'Photographer&lsquo;s<br>Showcase Artist'>
		<cfelseif qGetSpecificFormat1.Tier is 2>
			<cfset ArtistGallery = 'Photographer&lsquo;s<br>Showcase Artist'>
		<cfelseif qGetSpecificFormat1.Tier is 3>
			<cfset ArtistGallery = 'Photographer&lsquo;s<br>Showcase Artist'>
		</cfif>			
	 <cfelseif UCASE(qGetSpecificFormat1.Gallery) is 'MAGNUMARTISTS'>
	 	<cfset ArtistGallery = 'Magnum<br>Photos Artist'>
     </cfif>#ArtistGallery#<br>
	  #qGetSpecificFormat1.ImageQty# Images</b></font></td>
 	<td width="100" align="left" valign="middle">
			<a href="forms2/index.cfm?image=#ImageNumber#&id=#qGetSpecificFormat1.Custnumber#&imagePosition=#ImagePosition#&Door=9&Portfolio=#qGetSpecificFormat1.Portfolio#&Gallery=#xGallery#">
			
<!--- ImageSizer --->									
<cfset xheight=64>
<cfset xwidth=75>
<cfset xImageAddress="#xRelativePath#\Artists\#qGetSpecificFormat1.Subdirectory#\#qGetSpecificFormat1.Portfolio#\Images_Large\">

<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image#qGetSpecificFormat1.ImageNumber#.jpg">

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

