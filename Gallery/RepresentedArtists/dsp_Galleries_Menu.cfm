<CFPARAM NAME="xDividerCOlor" DEFAULT="##666666">
<CFPARAM NAME="xShowDropDowns" DEFAULT="1">
<CFPARAM NAME="xShowMenuBar" DEFAULT="1">
<CFPARAM NAME="xPopup" DEFAULT="1">



<!--- menu system for the gallery --->
<CFPARAM NAME="xMenuToShow" DEFAULT="Main">
<CFPARAM NAME="xItemSelected" DEFAULT="">
<!---<CFPARAM NAME="xPathToRoot" DEFAULT="">--->


<!--- Set Menu Colors --->
<CFSET xBGCOLOR="##EEEEEE">
<CFSET xRollover_off="">
<CFSET xRollover_on="##EEEEEE">
<CFSET xColorA = "Silver">

<CFPARAM NAME="xShowArtistLogin" DEFAULT="1">

<CFSWITCH EXPRESSION="#xMenuToShow#">
	<!--- ItemLink_x: "../Gallery/" will automatically be added to the left --->


    <CFCASE VALUE="Main">
		<CFSET xShowMenubar = 0>
		<CFSET xGallery = 0>
		<CFSET ItemName_2 = "What is the Photographer's Showcase?">
		<CFSET ItemLink_2 = "Genres.cfm">
		<CFSET ItemName_3 = "Keywords">
		<CFSET ItemLink_3 = "Keywords.cfm">
		<CFSET ItemName_4 = "Formats">
		<CFSET ItemLink_4 = "Formats.cfm">
		<CFSET ItemName_5 = "Processes">
		<CFSET ItemLink_5 = "Processes.cfm">
		<CFSET ItemName_6 = "Artist Login">
		<CFSET ItemLink_6 = "Photoshowcase/Forms/Password.cfm">
	</CFCASE>
	
	<CFCASE VALUE="Santa Fe">
		<CFSET xGallery = 1>
<!---		<CFSET ItemName_0 = "Send Comments">
		<CFSET ItemLink_0 = "WebsiteComments.cfm?Gallery=1">
		<CFSET ItemPopup_0 = 0>--->
		<CFSET ItemName_1 = "Exhibition Schedule">
		<CFSET ItemLink_1 = "RepresentedArtists/ExhibitionSchedule.cfm">
		<CFSET ItemPopup_1 = 0>
		<CFSET ItemName_2 = "Locator Map">
		<CFSET ItemLink_2 = "RepresentedArtists/Map.cfm">
		<CFSET ItemPopup_2 = 1>
		<CFSET ItemPopupWidth_2 = 550>
		<CFSET ItemPopupHeight_2 = 620>
		<CFSET ItemName_3 = "Shipping Costs">
		<CFSET ItemLink_3 = "ShippingCosts.cfm?Gallery=1">
		<CFSET ItemPopup_3 = 1>
		<CFSET ItemPopupWidth_3 = 450>
		<CFSET ItemPopupHeight_3 = 330>
		<CFIF xShowArtistLogin is 1>
			<CFSET ItemName_4 = "Artist Login">
			<CFSET ItemLink_4 = "Photoshowcase/Forms/Password.cfm">
			<CFSET ItemPopup_4 = 0>
		</CFIF>
	</CFCASE>
	
	<CFCASE VALUE="Showcase">
		<CFSET xGallery = 2>
<!---		<CFSET ItemName_0 = "Send Comments">
		<CFSET ItemLink_0 = "WebsiteComments.cfm?Gallery=2">
		<CFSET ItemPopup_0 = 0>--->
		<CFSET ItemName_1 = "Submit Your Work">
		<CFSET ItemLink_1 = "PhotoShowcase/NewDocumentation/Artists/SubmissionProcess2.cfm">
		<CFSET ItemPopup_1 = 1>
		<CFSET ItemPopupHeight_1 = 260>
		<CFSET ItemName_2 = "About Purchasing Prints">
		<CFSET ItemLink_2 = "PhotoShowcase/NewDocumentation/collectors/index.html">
		<CFSET ItemPopup_2 = 0>
		<CFSET ItemName_3 = "Shipping Costs">
		<CFSET ItemLink_3 = "ShippingCosts.cfm?Gallery=2">
		<CFSET ItemPopup_3 = 1>
		<CFSET ItemPopupWidth_3 = 450>
		<CFSET ItemPopupHeight_3 = 330>
		<CFIF xShowArtistLogin is 1>
			<CFSET ItemName_4 = "Artist Login">
			<CFSET ItemLink_4 = "Photoshowcase/Forms/Password.cfm">
			<CFSET ItemPopup_4 = 0>
		</CFIF>
	</CFCASE>
	
	<CFCASE VALUE="Magnum">
		<CFSET xGallery = 3>
<!---		<CFSET ItemName_0 = "Send Comments">
		<CFSET ItemLink_0 = "WebsiteComments.cfm?Gallery=3">
		<CFSET ItemPopup_0 = 0>--->
		<CFSET ItemName_1 = "About Collector's Prints">
		<CFSET ItemLink_1 = "MagnumArtists/AboutPrints.cfm">
		<CFSET ItemPopup_1 = 1>
		<CFSET ItemPopupWidth_1 = 450>
		<CFSET ItemPopupHeight_1 = 360>
		<CFSET ItemName_2 = "About Magnum Photos">
		<CFSET ItemLink_2 = "MagnumArtists/AboutMagnum.cfm">
		<CFSET ItemPopup_2 = 1>
		<CFSET ItemPopupWidth_2 = 500>
		<CFSET ItemPopupHeight_2 = 450>
		<CFSET ItemPopupScroll_2 = "yes">
		<CFSET ItemName_3 = "Shipping Costs">
		<CFSET ItemLink_3 = "ShippingCosts.cfm?Gallery=3">
		<CFSET ItemPopupWidth_3 = 450>
		<CFSET ItemPopupHeight_3 = 330>
		<CFSET ItemPopup_3 = 1>
		<CFIF xShowArtistLogin is 1>
			<CFSET ItemName_4 = "Artist Login">
			<CFSET ItemLink_4 = "Photoshowcase/Forms/Password.cfm">
			<CFSET ItemPopup_4 = 0>
		</CFIF>
		<CFSET xShowDropDowns = 0>
	</CFCASE>
	
</CFSWITCH>

<CFOUTPUT>
<CFIF xShowMenuBar is 1>


<TABLE CELLPADDING="2" CELLSPACING="0" BORDER="0" ALIGN="CENTER">

<!---<TR>
<CFSET xCounter = 1>
<CFLOOP condition="IsDefined('ItemName_#xCounter#')">
	<CFIF xItemSelected is not xCounter>
		<TD BGCOLOR="#xDividerColor#" ID="TD#xCounter#" HEIGHT="1"></TD>
		<CFSET xCounter = xCounter + 1>
		<CFIF IsDefined('ItemName_#xCounter#')>
			<CFSET xNextCounter = xCounter + 1>
			<CFIF (xCounter is xItemSelected and IsDefined('ItemName_#xNextCounter#')) or (xCounter is not xItemSelected)>
				<TD BGCOLOR="#xDividerColor#" HEIGHT="1"></TD>
			</CFIF>
		</CFIF>
	<CFELSE> 
		<CFSET xCounter = xCounter + 1>
	</CFIF>
</CFLOOP>
</TR>--->
<style>
</style>
<TR id="Menu_TR">
	
<CFSET xCounter = 1>
<CFLOOP condition="IsDefined('ItemName_#xCounter#')">
	<CFIF xItemSelected is not xCounter>
		<CFSET xName = evaluate("ItemName_#xCounter#")>
		<CFSET xWindowName = 'window_#Replace(Replace(xName, " ", "_", "all"), "'", "", "all")#'>
		<CFSET xLink = evaluate("ItemLink_#xCounter#")>
		<CFSET xPopup = evaluate("ItemPopup_#xCounter#")>
		<CFIF IsDefined("ItemPopupWidth_#xCounter#")>
			<CFSET xPopupWidth = evaluate("ItemPopupWidth_#xCounter#")>	
		<CFELSE>
			<CFSET xPopupWidth = 500>
		</CFIF>
		<CFIF IsDefined("ItemPopupHeight_#xCounter#")>
			<CFSET xPopupHeight = evaluate("ItemPopupHeight_#xCounter#")>	
		<CFELSE>
			<CFSET xPopupHeight = 400>
		</CFIF>
		<CFIF IsDefined("ItemPopupScroll_#xCounter#")>
			<CFSET xPopupScroll= evaluate("ItemPopupScroll_#xCounter#")>	
		<CFELSE>
			<CFSET xPopupScroll = "no">
		</CFIF>

		<CFIF xPopup is 1>
		<TD BGCOLOR="#xRollover_Off#" ALIGN="CENTER" onMouseOver="this.style.backgroundColor='#xRollOver_On#'; this.style.cursor='hand'; TD#xCounter#.style.backgroundColor='#xColorA#';  TD#xCounter#b.style.backgroundColor='#xColorA#';" onMouseOut="this.style.backgroundColor='#xRollover_Off#'; this.style.cursor='pointer'; TD#xCounter#.style.backgroundColor='#xDividerColor#'; TD#xCounter#b.style.backgroundColor='#xDividerColor#';" onClick="javascript:popUp('/#aGalleryDirectory#/#xLink#', '#xWindowName#', #xPopupWidth#, #xPopupHeight#, '#xPopupScroll#');"><A HREF="javascript:popUp('/#aGalleryDirectory#/#xLink#', '#xWindowName#', #xPopupWidth#, #xPopupHeight#, '#xPopupScroll#');"><FONT FACE="Verdana" SIZE=1 STYLE="font-size: 10px; text-decoration:none">&nbsp;#xName#&nbsp;</FONT></A></TD>
		<CFELSE>
		<TD BGCOLOR="#xRollover_Off#" ALIGN="CENTER" onMouseOver="this.style.backgroundColor='#xRollOver_On#'; this.style.cursor='hand'; TD#xCounter#.style.backgroundColor='#xColorA#';  TD#xCounter#b.style.backgroundColor='#xColorA#';" onMouseOut="this.style.backgroundColor='#xRollover_Off#'; this.style.cursor='pointer'; TD#xCounter#.style.backgroundColor='#xDividerColor#'; TD#xCounter#b.style.backgroundColor='#xDividerColor#';" <!--- onClick="#xPathToRoot##aGalleryDirectory#/#xLink#" --->><A HREF="/#aGalleryDirectory#/#xLink#"><FONT FACE="Verdana" SIZE=1 STYLE="font-size: 10px; text-decoration:none">&nbsp;#xName#&nbsp;</FONT></A></TD>
		</CFIF>
		<CFSET xCounter = xCounter + 1>
		<CFIF IsDefined('ItemName_#xCounter#')>
			<CFSET xNextCounter = xCounter + 1>
			<CFIF (xCounter is xItemSelected and IsDefined('ItemName_#xNextCounter#')) or (xCounter is not xItemSelected)>
				<TD BGCOLOR="#xRollover_Off#" ALIGN="CENTER"><FONT SIZE="1">&middot;</FONT></TD>
			</CFIF>
		</CFIF>
	<CFELSE> 
		<CFSET xCounter = xCounter + 1>
	</CFIF>
</CFLOOP>

</TR>
<!---<TR>
<CFSET xCounter = 1>
<CFLOOP condition="IsDefined('ItemName_#xCounter#')">
	<CFIF xItemSelected is not xCounter>
		<TD BGCOLOR="#xDividerColor#" ID="TD#xCounter#b" HEIGHT="1"></TD>
		<CFSET xCounter = xCounter + 1>
		<CFIF IsDefined('ItemName_#xCounter#')>
			<CFSET xNextCounter = xCounter + 1>
			<CFIF (xCounter is xItemSelected and IsDefined('ItemName_#xNextCounter#')) or (xCounter is not xItemSelected)>
				<TD BGCOLOR="#xDividerColor#" HEIGHT="1"></TD>
			</CFIF>
		</CFIF>
	<CFELSE> 
		<CFSET xCounter = xCounter + 1>
	</CFIF>
</CFLOOP>
</TR>--->
<TR>

<TR><TD HEIGHT="10"></TD></TR>
</TABLE>
</CFIF>

<cfif xMenuToShow is "Santa Fe"> 
<br />
<CFSET xSubtitle = "u p c o m i n g   e x h i b i t i o n">
<cfinclude template="/templates/title.cfm">
<DIV ALIGN="CENTER">
<CFOUTPUT>#xHTMLTitle#</CFOUTPUT>
<br /><br />
<TABLE CELLPADDING="0" CELLSPACING="0" BGCOLOR="##FFFFFF" BORDER="0" ALIGN="CENTER">

<tr><td>
<div align="center">  

<!--- Carrying over the site index page image to the gallery index --->
<CFIF IsDefined("url.P")  and IsDefined("url.G") and IsDefined("url.A")>
	<CFSET xUseSpecificPortfolio = url.G>
<CFELSE>
	<CFSET xUseSpecificPortfolio = 0>
</CFIF>
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
		
		
					<!--- ImageSizer --->	
                    <cfset  qGetSantaFe.Portfolio = 'Portfolio4'>
					<cfset xImage='Image1'>
                    <cfset qGetSantaFe.Subdirectory = 'JoWhaley'>
                    <cfset qGetSantaFe.firstname="Jo">
                    <cfset  qGetSantaFe.Lastname="Whaley"> 
                    <cfset qGetSantaFe.ImageNumber = "1">								
					<cfset xheight=600>
					<cfset xwidth=400>
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
					


<a href="/gallery/forms2/index.cfm?image=1&id=53445&imagePosition=18&Door=1&Portfolio=Portfolio4&Gallery=1&Page="><img src="/artists/#qGetSantaFe.Subdirectory#/#qGetSantaFe.Portfolio#/Images_Large/#xImage#_H#xHeight#xW#xWidth#.#xImageFormat#" border="0" ALT="#xAlt#"></a>
</div>

</td></tr></TABLE>
<table align="center" width="800"><tr><td>
<div align="center"> 
<br />

<FONT color="##666666" face="verdana, arial, Helvetica, sans-serif" size="2">
<font size="3"><b>J O &nbsp; W H A L E Y: &nbsp; T H E &nbsp; T H E A T E R  &nbsp; O F &nbsp; I N S E C T S</b></font>
<br />`<br />November 7 - January 10, 2009 at photo-eye Gallery, Santa Fe.<BR /><BR /><a href="/bookstore/citation.cfm?Catalog=CI214&i=9780811861557"><em>The Theater of Insects</em></a> published by Chronicle Books.<!---Please join us for an evening of live jazz with the Santa Fe Jazz Quartet to accompany a booksigning and reception for<br /> Julie Blackmon. Julie will be signing her <a href="http://test.photoeye.com/templates/mShowDetailsbycatAmazon.cfm?Catalog=DP941&i=9781934435045">first monograph</a> published by RADIUS BOOKS. --->
</font>


<br /></div>
</td></tr>
</TABLE>
 

<cfelse>


<CFIF xShowDropDowns is 1>

<CFIF IsDefined("url.ExploreBy")>
	<CFSET xExploreBy = url.ExploreBy>
</CFIF>
	
<TABLE CELLPADDING="0" CELLSPACING="0" BGCOLOR="##D4C9AE" BORDER="0" BORDERCOLOR="Gray" ALIGN="CENTER"><!--- <TR><TD ALIGN="CENTER" BORDERCOLOR="#D4C9AE">
<FONT STYLE="Font: 11x; letter-spacing: 5px;" FACE="Verdana, Arial" color="#333333">
VIEW PORTFOLIOS
</TD></TR> --->
<TR><TD BORDERCOLOR="##D4C9AE" ALIGN="CENTER">
<FORM ACTION="#xURLHome#/#aGalleryDirectory#/Randomizer.cfm" METHOD="POST" >
<INPUT TYPE="HIDDEN" NAME="Gallery" VALUE="#xGallery#">
<select name="ExploreBy" style="font: 9px; BACKGROUND-COLOR:##eeeeee;" onChange="jumpMenu('parent',this,0)">
	<CFIF xMenuToShow is "Main">
		<CFPARAM NAME="xExploreBy" DEFAULT="0">
		<option value="?Gallery=#xGallery#&ExploreBy=0" <CFIF xExploreBy is 0>SELECTED</CFIF>>Explore Portfolios by...</option>
	<CFELSE>
		<CFIF IsDefined("url.Image")>
			<CFSET xExploreBy = 0>
			<option value="?Gallery=#xGallery#&ExploreBy=0" <CFIF xExploreBy is 0>SELECTED</CFIF>>Explore Portfolios by...</option>
		</CFIF>
			
		<CFPARAM NAME="xExploreBy" DEFAULT="7">
		<CFIF xGallery is 1>
			<CFSET xShowcasedArtistsLink = "RepresentedArtists/HomepagePE.cfm">
		<CFELSEIF xGallery is 2>
			<CFSET xShowcasedArtistsLink = "Photoshowcase/HomepagePSnew.cfm">
		<CFELSEIF xGallery is 3>
			<CFSET xShowcasedArtistsLink = "MagnumArtists/HomepageMA.cfm">
		</CFIF>
			<option value="#xURLHome#/#aGalleryDirectory#/#xShowcasedArtistsLink#?Gallery=#xGallery#&ExploreBy=7" <CFIF xExploreBy is 7>SELECTED>Explore by <CFELSE>></CFIF>Selected Artists</option>
	</CFIF>
	
	
	<option value="#xURLHome#/#aGalleryDirectory#/ArtistsIndex.cfm?Gallery=#xGallery#&ExploreBy=1" <CFIF xExploreBy is 1>SELECTED>Explore by <CFELSE>></CFIF>Artist Name</option>
	<!--- <option value="#xURLHome#/#aGalleryDirectory#/ExhibitionDate.cfm?Gallery=#xGallery#&ExploreBy=2" <CFIF xExploreBy is 2>SELECTED>Explore by <CFELSE>></CFIF>Exhibition Date</option> --->
	<option value="#xURLHome#/#aGalleryDirectory#/Genres.cfm?Gallery=#xGallery#&ExploreBy=3" <CFIF xExploreBy is 3>SELECTED>Explore by <CFELSE>></CFIF>Category/Genre</option>
	<option value="#xURLHome#/#aGalleryDirectory#/Formats.cfm?Gallery=#xGallery#&ExploreBy=4" <CFIF xExploreBy is 4>SELECTED>Explore by <CFELSE>></CFIF>Camera Format</option>
	<option value="#xURLHome#/#aGalleryDirectory#/Processes.cfm?Gallery=#xGallery#&ExploreBy=5" <CFIF xExploreBy is 5>SELECTED>Explore by <CFELSE>></CFIF>Print Process</option>
	<option value="#xURLHome#/#aGalleryDirectory#/Keywords.cfm?Gallery=#xGallery#&ExploreBy=6" <CFIF xExploreBy is 6>SELECTED>Explore by <CFELSE>></CFIF>Keyword</option>
</select>

<!--- &nbsp;&nbsp;<INPUT TYPE="SUBMIT" NAME="Random" VALUE="Randomizer" style="font: 9px;"> --->

</TD></FORM></TR>

</TABLE>

</CFIF>
</cfif> <!--- If not Santa Fe Gallery --->

</CFOUTPUT>