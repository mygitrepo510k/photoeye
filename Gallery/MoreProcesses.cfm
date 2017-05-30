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

<CFSET xExploreBy = 5> 

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


<!--- <CFQUERY NAME="qGetProcesses"  DATASOURCE="photoeyecom">
SELECT   DISTINCT Header, D.Medium
FROM       GalleryIndividualPhotos as I,  GalleryDirectories as H INNER JOIN
      GalleryDefaultPhotos D ON H.Header = D.Medium 
WHERE     (Directory = 'Process') and  (I.Default3=1 and (D.Medium <> '' or  D.Medium is not Null) )
or (I.Default3=0 and (I.Medium <> '' or  I.Medium is not Null) )
ORDER BY HEADER
</cfquery> --->

<CFQUERY NAME="qGetProcesses"  DATASOURCE="photoeyecom">
SELECT DISTINCT R.Header
FROM         dbo.GalleryDirectories R INNER JOIN
                      GalleryDefaultPhotos D ON R.Header = D.MEDIUM INNER JOIN
                      GallerySetup S ON S.Custnumber = D.Custnumber INNER JOIN
                      GalleryIndividualPhotos I ON S.Custnumber = I.Custnumber
WHERE    ((<cfif xGAllery is 0>S.Gallery = 'MAGNUMARTISTS' or  S.Gallery = 'PHOTOSHOWCASE' or S.Gallery = 'REPRESENTEDARTISTS' <cfelse>S.Gallery = '#xGalleryName#'</cfif>) AND (I.DEFAULT3 = 1)) OR
                      ((<cfif xGAllery is 0>S.Gallery = 'MAGNUMARTISTS' or  S.Gallery = 'PHOTOSHOWCASE' or S.Gallery = 'REPRESENTEDARTISTS' <cfelse>S.Gallery = '#xGalleryName#'</cfif>) AND (I.DEFAULT3 = 0) AND (I.Medium <> ''))
</cfquery>


<cfif #URL.Category1# is ''>
	
<CFQUERY NAME="qGetShowcaseMedium"  DATASOURCE="photoeyecom">
SELECT DISTINCT 
       G.Subdirectory AS SubDirectory, G.FirstName AS Firstname, P.ImgQty AS ImageQTy, G.LastName AS Lastname, G.Gallery AS Gallery, G.Custnumber, 
P.SubDirectory AS Portfolio, D.Medium AS D_Medium, D.OtherMed AS D_OtherMed, I.Medium AS I_Medium, I.OtherMed AS I_OtherMed, 
I.Default3, D.FormatRandomNo, G.LastName AS Expr1, G.Tier as Tier, I.ImageNumber, I.ImagePosition
FROM  GallerySetup G INNER JOIN
      GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
      GalleryDefaultPhotos D ON G.Custnumber = D.Custnumber AND P.SubDirectory = D.SubDirectory INNER JOIN
      GalleryIndividualPhotos I ON G.Custnumber = I.Custnumber AND P.SubDirectory = I.PortfolioName
WHERE (P.ImgQty > 0) AND 
(I.ImagePosition = 1) AND 
(D.Medium is Null or D.Medium='') and P.ShowcaseOK=1 <cfif include is 2>AND G.Tier=3<cfelseif include is 1>AND (G.Tier=1 OR G.Tier=2)<cfelseif include is 3>AND G.Tier>0</cfif> and P.ShowcaseOK=1 <cfif xGallery GT 0> and G.Gallery='#xGalleryName#'</cfif>
ORDER BY  MediumRandomNo DESC

</cfquery>
<!--- 
AND 
(I.Default3 = 1)  --->

<cfelse>

<CFQUERY NAME="qGetShowcaseMedium"  DATASOURCE="photoeyecom">
SELECT DISTINCT 
       G.Subdirectory AS SubDirectory, G.FirstName AS Firstname, P.ImgQty AS ImageQTy, G.LastName AS Lastname, G.Gallery AS Gallery, G.Custnumber, 
P.SubDirectory AS Portfolio, D.Medium AS D_Medium, D.OtherMed AS D_OtherMed, I.Medium AS I_Medium, I.OtherMed AS I_OtherMed, 
I.Default3, D.MediumRandomNo, G.LastName AS Expr1, G.Tier as Tier, I.ImagePosition, I.ImageNumber
FROM  GallerySetup G INNER JOIN
      GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
      GalleryDefaultPhotos D ON G.Custnumber = D.Custnumber AND P.SubDirectory = D.SubDirectory INNER JOIN
      GalleryIndividualPhotos I ON G.Custnumber = I.Custnumber AND P.SubDirectory = I.PortfolioName
WHERE (P.ImgQty > 0) AND 
(I.ImagePosition = 1) AND 
(D.Medium = '#Categoryx#') and P.ShowcaseOK=1 <cfif include is 2>AND G.Tier=3<cfelseif include is 1>AND (G.Tier=1 OR G.Tier=2)<cfelseif include is 3>AND G.Tier>0</cfif> and P.ShowcaseOK=1 <cfif xGallery GT 0> and G.Gallery='#xGalleryName#'</cfif>
ORDER BY  MediumRandomNo DESC
</cfquery>


</cfif>
<!---  AND 
(I.Default3 = 1) ---> 

		
	<cfset ImageNumber = 1>
	<cfset ImagePosition = 1>
	
	<cfset Mediumx= "x">  	
	<cfset Column = 1>
	<cfset counter=1>

<CFOUTPUT>
			
			
		<table width="500" border="0" cellspacing="6" cellpadding="5" align="center">
  

  		<tr>
	<cfif #URL.Category1# is ''>
						<td colspan="5" bgcolor="Black"><TABLE WIDTH="100%"><TR><TD VALIGN="TOP"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="Silver"><b>Undefined Process</b>
			<cfelse>
			<td colspan="5"  width="565"  bgcolor="Black"><TABLE WIDTH="100%"><TR><TD VALIGN="TOP"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="Silver"><b>#Categoryx#</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<cfif All is 0>
<a href="javascript:history.back();"><FONT color="silver" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='silver';"  style="TEXT-DECORATION: none"><b>Previous Page</b></font></a>
</cfif>
			
	</cfif>	

</TD>


<td colspan="5"  align="right">
			 <form method=POST enctype="text/plain" name="menu" action="">
				<select name="newLocation" style="font: 9px; BACKGROUND-COLOR:##eeeeee;" onChange="jumpMenu('parent',this,0)">
                <option value="##TOP" selected >Select&nbsp;Another&nbsp;Process&nbsp;</option>
				
                <cfloop query="qGetProcesses">
	<!--- Take out any spaces in the URL parameter and replace them with an obvious set of characters that may be then replaced at the beginning of the MoreFormats page--->	
<cfset CategoryURL =  #Replace(Header," ","%20","All")#>	
	<option
					 value="MoreProcesses.cfm?Category1=#CategoryURL#&Include=#Include#&Gallery=#Gallery#&All=1" >#Header#</option>
				</cfloop>
				<option
					 value="Processes.cfm?Gallery=#Gallery#" >> Show All Processes</option>
	            </select>
    		</td></form>
			
			<td width="1" align="center"> 
<cfset CategoryURL =  #Replace(qGetShowcaseMedium.D_Medium," ","","All")#>

				<a href="javascript:popUp('Definitions.cfm?#CategoryURL#','Definitions','600','450', 'yes');"><img src="SharedImages/questionmark.gif" width="10" height="10" alt="" border="0"></td></tr></TABLE>
			</td>
		</tr>
		

		<cfset Column=1>
	<cfset counter=1>
	<cfset HeaderFirstTime=1>
   	<cfloop query="qGetShowcaseMedium">
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
	<a href="/gallery/forms2/index.cfm?image=#ImageNumber#&id=#qGetShowcaseMedium.Custnumber#&imagePosition=#ImagePosition#&Door=7&Portfolio=#qGetShowcaseMedium.Portfolio#&Gallery=#url.Gallery#"><FONT color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='##333333';"  style="TEXT-DECORATION: none"><b>
	#qGetShowcaseMedium.FirstName# #qGetShowcaseMedium.LastName#<br><br></b></font></a>
	 <cfset ArtistGallery =''>
	 <cfif UCASE(qGetShowcaseMedium.Gallery) is 'REPRESENTEDARTISTS'>
	 	<cfset ArtistGallery = 'Santa Fe<br>Gallery Artist'>
	 <cfelseif UCASE(qGetShowcaseMedium.Gallery) is 'PHOTOSHOWCASE'>
	 	<cfif qGetShowcaseMedium.Tier is 1>
			<cfset ArtistGallery = 'Photographer&lsquo;s<br>Showcase Artist'>
		<cfelseif qGetShowcaseMedium.Tier is 2>
			<cfset ArtistGallery = 'Photographer&lsquo;s<br>Showcase Artist'>
		<cfelseif qGetShowcaseMedium.Tier is 3>
			<cfset ArtistGallery = 'Photographer&lsquo;s<br>Showcase Artist'>
		</cfif>			
	 <cfelseif UCASE(qGetShowcaseMedium.Gallery) is 'MAGNUMARTISTS'>
	 	<cfset ArtistGallery = 'Magnum<br>Photos Artist'>
     </cfif>
	<FONT color="##666666" face="verdana, arial, Helvetica, sans-serif" size="1"><b>#ArtistGallery#<br>  #qGetShowcaseMedium.ImageQty# Images</b></font></td>
 	<td width="100">
			<a href="/gallery/forms2/index.cfm?image=#ImageNumber#&id=#qGetShowcaseMedium.Custnumber#&imagePosition=#ImagePosition#&Door=7&Portfolio=#qGetShowcaseMedium.Portfolio#&Gallery=#url.Gallery#">

<!--- ImageSizer --->									
<cfset xheight=64>
<cfset xwidth=75>
<cfset xImageAddress="#xRelativePath#\Artists\#qGetShowcaseMedium.Subdirectory#\#qGetShowcaseMedium.Portfolio#\Images_Large\">

<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image#qGetShowcaseMedium.ImageNumber#.jpg">

<cfinclude template="../templates/imagesizer.cfm">

<img src="../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a>
<!--- End ImageSizer --->
		</td>
	<!--- Center Column --->
	<td>&nbsp;
		
	</td>
	<!--- If there is only one record, include a blank cell so that the only image is properly Mediumted--->
	<cfif qGetShowcaseMedium.recordcount is 1>
		<td width="100" height="77">&nbsp;
		
		</td>
	</cfif>
	<cfset Column = 2>
	<cfset counter=counter+1>

	<cfset Column = 2>
	<cfset counter=counter+1>
	
	<cfelseif Column is 2>
    <td width="100" height="77">
	<a href="/gallery/forms2/index.cfm?image=#ImageNumber#&id=#qGetShowcaseMedium.Custnumber#&imagePosition=#ImagePosition#&Door=7&Portfolio=#qGetShowcaseMedium.Portfolio#&Gallery=#url.Gallery#"><FONT color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='##333333';"  style="TEXT-DECORATION: none"><b>
	#qGetShowcaseMedium.FirstName# #qGetShowcaseMedium.LastName#<br><br></b></font></a>
	 <cfset ArtistGallery =''>
	 <cfif UCASE(qGetShowcaseMedium.Gallery) is 'REPRESENTEDARTISTS'>
	 	<cfset ArtistGallery = 'Santa Fe<br>Gallery Artist'>
	 <cfelseif UCASE(qGetShowcaseMedium.Gallery) is 'PHOTOSHOWCASE'>
	 	<cfif qGetShowcaseMedium.Tier is 1>
			<cfset ArtistGallery = 'Photographer&lsquo;s<br>Showcase Artist'>
		<cfelseif qGetShowcaseMedium.Tier is 2>
			<cfset ArtistGallery = 'Photographer&lsquo;s<br>Showcase Artist'>
		<cfelseif qGetShowcaseMedium.Tier is 3>
			<cfset ArtistGallery = 'Photographer&lsquo;s<br>Showcase Artist'>
		</cfif>			
	 <cfelseif UCASE(qGetShowcaseMedium.Gallery) is 'MAGNUMARTISTS'>
	 	<cfset ArtistGallery = 'Magnum<br>Photos Artist'>
     </cfif> 
	<FONT color="##666666" face="verdana, arial, Helvetica, sans-serif" size="1"><b>#ArtistGallery#<br> #qGetShowcaseMedium.ImageQty# Images</b></font></td>
 	<td width="100">
			<a href="/gallery/forms2/index.cfm?image=#ImageNumber#&id=#qGetShowcaseMedium.Custnumber#&imagePosition=#ImagePosition#&Door=7&Portfolio=#qGetShowcaseMedium.Portfolio#&Gallery=#url.Gallery#">
			
<!--- ImageSizer --->									
<cfset xheight=64>
<cfset xwidth=75>
<cfset xImageAddress="#xRelativePath#\Artists\#qGetShowcaseMedium.Subdirectory#\#qGetShowcaseMedium.Portfolio#\Images_Large\">

<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image#qGetShowcaseMedium.ImageNumber#.jpg">

<cfinclude template="../templates/imagesizer.cfm">

<img src="../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a>
<!--- End ImageSizer --->
		

	</td>
		<cfset Column =1 >	
	</tr>
	
  		</cfif>
	</cfif>
	<cfset counter=counter+1>
	</cfloop>



  
  </table>
</CFOUTPUT>
<br />
<cfinclude template="includes/dsp_galleries_index_bottom.cfm">
