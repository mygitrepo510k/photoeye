<!--- 06/29/2003 RR --->
<!--- 1. A server cfCache is created that expires everyday at 12:25 pm MDT - the time this was first run. Any New Content will show at that time automatically--->
<!--- <cfcache action="Flush"> --->

<CFIF xSwitch is 1>
<!---<cfcache action="Cache" Timeout="#DateAdd('d',-1, Now())#"> 
---></CFIF>

<CFPARAM NAME="url.Include" DEFAULT="1">


<cfif IsDefined("RadioInclude")>
	<cfset include=#form.RadioInclude#>
<cfelse>
	<cfset include=#url.Include#>
</cfif>

<CFQUERY NAME="qGetShowcaseGetProcess"  DATASOURCE="photoeyecom">
SELECT Distinct  *
FROM       GalleryDirectories
WHERE     (Directory = 'Process') 
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
	<CFSET xThisSubtitle = "Print Processes">
	<CFSET xMenuToShow = "Santa Fe">
	
<cfelseif xGallery is 2>
	<CFSET xTitle="Photographer's Showcase">
	<CFSET xThisSubtitle = "Print Processes">
	<CFSET xMenuToShow = "Showcase">

<cfelseif xGallery is 3>
	<CFSET xTitle="Magnum Photos">
	<CFSET xThisSubtitle = "Print Processes">
	<CFSET xMenuToShow = "Magnum">
	
<cfelse>
	<CFSET xTitle="Galleries">
	<CFSET xThisSubtitle = "Print Processes - All Galleries">
	<CFSET xMenuToShow = "Main">
	
</cfif>

<!---<CFSET xPathToRoot="../">
<CFSET xShowBackButton = 1>
<CFSET xShowMenu = 1>
<cfinclude template="../templates/Header.cfm">--->
<cfinclude template="includes/dsp_galleries_index_top.cfm">
	
<CFSET xExploreBy=5>
<CFINCLUDE TEMPLATE="Menu.cfm">
<BR>
<CFSET xSubtitle = xThisSubtitle>
<cfinclude template="../templates/title.cfm">
<DIV ALIGN="CENTER"><CFOUTPUT>#xHTMLTitle#</CFOUTPUT></DIV>

<TABLE><TR><TD HEIGHT="7"></TD></TR></TABLE>
	
	<cfset ImageNumber = 1>
	<cfset ImagePosition = 1>
	
	<cfset Processx= "x">  	

<cfset NewName = ''>
<cfset Qty=0>
<cfset var=1>

   <cfset HeaderFirstTime=0>

	
	<cfloop query="qGetShowcaseGetProcess">
		<table width="500" border="0" cellspacing="6" cellpadding="5" align="center">
		<!--- Part 1, Get Next Process that is different --->
		<cfif qGetShowcaseGetProcess.Header is not #NewName#>
			<cfset compound = "Process" & #var#> 
			<cfset "#compound#" = qGetShowcaseGetProcess.Header >
			<cfset NewName=#qGetShowcaseGetProcess.Header#>
			<cfset var=var+1>
			
			<!--- Part 2, Count Number of Portfolios that use this Process --->
			
<!--- 			<CFQUERY NAME="qGetSpecificProcessAll"  DATASOURCE="photoeyecom">

SELECT DISTINCT 
       G.Subdirectory AS SubDirectory, G.FirstName AS Firstname, P.ImgQty AS ImageQTy, G.LastName AS Lastname, G.Gallery AS Gallery, G.Custnumber, 
P.SubDirectory AS Portfolio, D.Medium1 AS D_Medium1, D.Process2 AS D_Process2, I.Medium1 AS I_Medium1, I.Process2 AS I_Process2, 
I.DEFAULT9, D.ProcessRandomNo, G.LastName AS Expr1
FROM  GallerySetup G INNER JOIN
      GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
      GalleryDefaultPhotos D ON G.Custnumber = D.Custnumber AND P.SubDirectory = D.SubDirectory INNER JOIN
      GalleryIndividualPhotos I ON G.Custnumber = I.Custnumber AND P.SubDirectory = I.PortfolioName
WHERE ((P.ImgQty > 0) AND 
(I.ImageNumber = 1) AND 
(D.Medium1 = '#evaluate(compound)#') AND 
(I.DEFAULT9 = 1) OR (P.ImgQty > 0) AND 
(I.ImageNumber = 1) AND 
(I.DEFAULT9 = 0) AND 
(I.Medium1 = '#evaluate(compound)#')) AND G.TIER=1
ORDER BY D.Medium1, D.ProcessRandomNo, G.LastName

			</cfquery> --->
						
			<CFQUERY NAME="qGetSpecificMedium1"  DATASOURCE="photoeyecom">

SELECT DISTINCT 
       G.Subdirectory AS SubDirectory, G.FirstName AS Firstname, P.ImgQty AS ImageQTy, G.LastName AS Lastname, G.Gallery AS Gallery, G.Custnumber, 
P.SubDirectory AS Portfolio, D.Medium AS D_Medium, D.OtherMed AS D_OtherMed, I.Medium AS I_Medium, I.OtherMed AS I_OtherMed, 
I.Default3, D.MediumRandomNo, G.LastName AS Expr1, G.Tier as Tier, I.ImagePosition, I.ImageNumber
FROM  GallerySetup G INNER JOIN
      GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
      GalleryDefaultPhotos D ON G.Custnumber = D.Custnumber AND P.SubDirectory = D.SubDirectory INNER JOIN
      GalleryIndividualPhotos I ON G.Custnumber = I.Custnumber AND P.SubDirectory = I.PortfolioName
WHERE ((P.ImgQty > 0) AND 
(I.ImagePosition = 1) AND 
(D.Medium = '#evaluate(compound)#')OR (P.ImgQty > 0) AND 
(I.ImagePosition = 1) AND 
(I.Default3 = 0) AND 
(I.Medium = '#evaluate(compound)#')) and P.ShowcaseOK=1  <cfif xGallery GT 0> and G.Gallery='#xGalleryName#'</cfif><!--- <cfif include is 2>AND G.Tier=3<cfelseif include is 1>AND (G.Tier=1 OR G.Tier=2)<cfelseif include is 3>AND G.Tier>0</cfif> --->
ORDER BY D.Medium, D.MediumRandomNo, G.LastName 


			</cfquery>
			
<!--- Get Tier 2 Processs --->
<!--- 			<CFQUERY NAME="qGetSpecificProcess2"  DATASOURCE="photoeyecom">

SELECT DISTINCT 
       G.Subdirectory AS SubDirectory, G.FirstName AS Firstname, P.ImgQty AS ImageQTy, G.LastName AS Lastname, G.Gallery AS Gallery, G.Custnumber, 
P.SubDirectory AS Portfolio, D.Medium1 AS D_Medium1, D.Process2 AS D_Process2, I.Medium1 AS I_Medium1, I.Process2 AS I_Process2, 
I.DEFAULT9, D.ProcessRandomNo, G.LastName AS Expr1
FROM  GallerySetup G INNER JOIN
      GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
      GalleryDefaultPhotos D ON G.Custnumber = D.Custnumber AND P.SubDirectory = D.SubDirectory INNER JOIN
      GalleryIndividualPhotos I ON G.Custnumber = I.Custnumber AND P.SubDirectory = I.PortfolioName
WHERE ((P.ImgQty > 0) AND 
(I.ImageNumber = 1) AND 
(D.Medium1 = '#evaluate(compound)#') AND 
(I.DEFAULT9 = 1) OR (P.ImgQty > 0) AND 
(I.ImageNumber = 1) AND 
(I.DEFAULT9 = 0) AND 
(I.Medium1 = '#evaluate(compound)#')) AND G.TIER=2
ORDER BY D.Medium1, D.ProcessRandomNo, G.LastName

			</cfquery> --->
			
 	<!--- Get Tier 3 Processs --->
<!--- 			<CFQUERY NAME="qGetSpecificProcess3"  DATASOURCE="photoeyecom">

SELECT DISTINCT 
       G.Subdirectory AS SubDirectory, G.FirstName AS Firstname, P.ImgQty AS ImageQTy, G.LastName AS Lastname, G.Gallery AS Gallery, G.Custnumber, 
P.SubDirectory AS Portfolio, D.Medium1 AS D_Medium1, D.Process2 AS D_Process2, I.Medium1 AS I_Medium1, I.Process2 AS I_Process2, 
I.DEFAULT9, D.ProcessRandomNo, G.LastName AS Expr1
FROM  GallerySetup G INNER JOIN
      GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
      GalleryDefaultPhotos D ON G.Custnumber = D.Custnumber AND P.SubDirectory = D.SubDirectory INNER JOIN
      GalleryIndividualPhotos I ON G.Custnumber = I.Custnumber AND P.SubDirectory = I.PortfolioName
WHERE ((P.ImgQty > 0) AND 
(I.ImageNumber = 1) AND 
(D.Medium1 = '#evaluate(compound)#') AND 
(I.DEFAULT9 = 1) OR (P.ImgQty > 0) AND 
(I.ImageNumber = 1) AND 
(I.DEFAULT9 = 0) AND 
(I.Medium1 = '#evaluate(compound)#')) AND G.TIER=3
ORDER BY D.Medium1, D.ProcessRandomNo, G.LastName
</cfquery> --->
			
			<!--- Part 3, set variables that define the More in the header --->
			<cfset MoreSpecificProcess=qGetSpecificMedium1.RecordCount - 6>
			<cfset SpecificProcessCounter=0>
			
			<!--- Part 4, Produce the header if RecordCount GT 0--->
			<cfif #qGetSpecificMedium1.RecordCount# GT 0>
				<tr valign="top">
				<td colspan="5" bgcolor="Black">
				<table width="100%" CELLPADDING="0" CELLSPACING="0"><tr><td width="99%" align="left"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="Silver">
				<cfif qGetSpecificMedium1.RecordCount LT 7>
					<cfoutput>#qGetShowcaseGetProcess.Header#</cfoutput> </font><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="Silver"></font></b>
				<cfelse> 
	<!--- Take out any spaces in the URL parameter and replace them with an obvious set of characters that may be then replaced at the beginning of the MoreFormats page--->				
<cfset CategoryURL =  #Replace(qGetShowcaseGetProcess.Header," ","%20","All")#>					
					
					<cfoutput>#qGetShowcaseGetProcess.Header#</cfoutput> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<cfoutput><a href="MoreProcesses.cfm?Category1=#CategoryURL#&Include=#Include#&Gallery=#xGallery#"><FONT color="silver" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='silver';"  style="TEXT-DECORATION: none"><b>#MoreSpecificProcess#&nbsp;More&nbsp;<cfif #MoreSpecificProcess# is 1>Artist<cfelse>Artists</cfif></b></font></a></cfoutput>
				</cfif>
			<cfset CategoryURL =  #Replace(qGetShowcaseGetProcess.Header," ","","All")#>	
				</td><td width="1" align="right"> 
				<a href="javascript:popUp('Definitions.cfm#<cfoutput>#CategoryURL#</cfoutput>','Definitions','600','450', 'yes');"><img src="SharedImages/questionmark.gif" width="10" height="10" alt="" border="0"></td></tr></table>
    			</td>
				</tr>
			</cfif>

	<cfset Column = 1>
	<cfset counter=1>

<cfloop query="qGetSpecificMedium1"><cfoutput>
		 <cfif Column is 1 and Counter LT 7>

 	 
	  <tr>
<td width="100" height="77" valign="middle"><a href="/gallery/forms2/index.cfm?image=#ImageNumber#&id=#qGetSpecificMedium1.Custnumber#&imagePosition=#ImagePosition#&Door=7&Portfolio=#qGetSpecificMedium1.Portfolio#&Gallery=#xGallery#"><FONT color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='##333333';"  style="TEXT-DECORATION: none"><b>
		#qGetSpecificMedium1.FirstName# #qGetSpecificMedium1.LastName#</a><br><br></b></font>
		
			 <cfset ArtistGallery =''>
	 <cfif UCASE(qGetSpecificMedium1.Gallery) is 'REPRESENTEDARTISTS'>
	 	<cfset ArtistGallery = 'Santa Fe<br>Gallery Artist'>
	 <cfelseif UCASE(qGetSpecificMedium1.Gallery) is 'PHOTOSHOWCASE'>
	 	<cfif qGetSpecificMedium1.Tier is 1>
			<cfset ArtistGallery = 'Photographer&lsquo;s<br>Showcase Artist'>
		<cfelseif qGetSpecificMedium1.Tier is 2>
			<cfset ArtistGallery = 'Photographer&lsquo;s<br>Showcase Artist'>
		<cfelseif qGetSpecificMedium1.Tier is 3>
			<cfset ArtistGallery = 'Photographer&lsquo;s<br>Showcase Artist'>
		</cfif>			
	 <cfelseif UCASE(qGetSpecificMedium1.Gallery) is 'MAGNUMARTISTS'>
	 	<cfset ArtistGallery = 'Magnum<br>Photos Artist'>
     </cfif> 
	<FONT color="##666666" face="verdana, arial, Helvetica, sans-serif" size="1"><b>#ArtistGallery# <br>  #qGetSpecificMedium1.ImageQty# Images</b></font></td>
 	<td width="100" valign="middle">
		<a href="/gallery/forms2/index.cfm?image=#ImageNumber#&id=#qGetSpecificMedium1.Custnumber#&imagePosition=#ImagePosition#&Door=7&Portfolio=#qGetSpecificMedium1.Portfolio#&Gallery=#xGallery#">

<!--- ImageSizer --->									
<cfset xheight=64>
<cfset xwidth=75>
<cfset xImageAddress="#xRelativePath#\Artists\#qGetSpecificMedium1.Subdirectory#\#qGetSpecificMedium1.Portfolio#\Images_Large\">

<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image#qGetSpecificMedium1.ImageNumber#.jpg">

<cfinclude template="/templates/imagesizer.cfm">

<img src="/_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a>
<!--- End ImageSizer --->
	</td>
	<!--- Center Column --->
	<td>&nbsp;
		
	</td>
	<!--- If there is only one record, include a blank cell so that the only image is properly Processted--->
	<cfif qGetSpecificMedium1.recordcount is 1>
		<td width="100" height="77">&nbsp;
		
		</td>
	</cfif>

	<cfset Column = 2>
	<cfset counter=counter+1>
	
	<cfelseif Column is 2 and Counter LT 7>
	 
    	<td width="100" height="77" valign="middle"><a href="/gallery/forms2/index.cfm?image=#ImageNumber#&id=#qGetSpecificMedium1.Custnumber#&imagePosition=#ImagePosition#&Door=7&Portfolio=#qGetSpecificMedium1.Portfolio#&Gallery=#xGallery#"><FONT color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='##333333';"  style="TEXT-DECORATION: none"><b>
		#qGetSpecificMedium1.FirstName# #qGetSpecificMedium1.LastName#</a><br><br></b></font>
			 <cfset ArtistGallery =''>
	 <cfif UCASE(qGetSpecificMedium1.Gallery) is 'REPRESENTEDARTISTS'>
	 	<cfset ArtistGallery = 'Santa Fe<br>Gallery Artist'>
	 <cfelseif UCASE(qGetSpecificMedium1.Gallery) is 'PHOTOSHOWCASE'>
	 	<cfif qGetSpecificMedium1.Tier is 1>
			<cfset ArtistGallery = 'Photographer&lsquo;s<br>Showcase Artist'>
		<cfelseif qGetSpecificMedium1.Tier is 2>
			<cfset ArtistGallery = 'Photographer&lsquo;s<br>Showcase Artist'>
		<cfelseif qGetSpecificMedium1.Tier is 3>
			<cfset ArtistGallery = 'Photographer&lsquo;s<br>Showcase Artist'>
		</cfif>			
	 <cfelseif UCASE(qGetSpecificMedium1.Gallery) is 'MAGNUMARTISTS'>
	 	<cfset ArtistGallery = 'Magnum<br>Photos Artist'>
     </cfif> 
	<FONT color="##666666" face="verdana, arial, Helvetica, sans-serif" size="1"><b> #ArtistGallery# <br>  
    	  #qGetSpecificMedium1.ImageQty# Images</b></font></td>
 	<td width="100" align="left" valign="middle">
			<a href="/gallery/forms2/index.cfm?image=#ImageNumber#&id=#qGetSpecificMedium1.Custnumber#&imagePosition=#ImagePosition#&Door=7&Portfolio=#qGetSpecificMedium1.Portfolio#&Gallery=#xGallery#">

<!--- ImageSizer --->									
<cfset xheight=64>
<cfset xwidth=75>
<cfset xImageAddress="#xRelativePath#\Artists\#qGetSpecificMedium1.Subdirectory#\#qGetSpecificMedium1.Portfolio#\Images_Large\">
<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image#qGetSpecificMedium1.ImageNumber#.jpg">

<cfinclude template="/templates/imagesizer.cfm">

<img src="/_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a>
<!--- End ImageSizer --->
	

		</td>
		<cfset Column =1 >	
		<cfset counter=counter+1>
	</tr>
	</cfif>
	</cfoutput>
		</cfloop>
	<!--- Added End Table here so that separate tables are built for each category --->
		</table>
	</cfif>
</cfloop>

<!--- </cfoutput> --->
<!--- </table> --->
<br>
<cfinclude template="includes/dsp_galleries_index_bottom.cfm">
