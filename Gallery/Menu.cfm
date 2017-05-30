<CFSET bGalleryDirectory = "/gallery">
<CFSET aGalleryDirectory = "gallery">

<CFPARAM NAME="xDividerCOlor" DEFAULT="##666666">
<CFPARAM NAME="xShowDropDowns" DEFAULT="1">
<CFPARAM NAME="xShowMenuBar" DEFAULT="1">
<CFPARAM NAME="xPopup" DEFAULT="1">


<!--- menu system for the gallery --->
<CFPARAM NAME="xMenuToShow" DEFAULT="Main">
<CFPARAM NAME="xItemSelected" DEFAULT="">
<CFPARAM NAME="xPathToRoot" DEFAULT="../">


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
		<CFSET ItemLink_1 = 'submissions.cfm'>
		<CFSET ItemPopup_1 = 0>
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
		<TD BGCOLOR="#xRollover_Off#" ALIGN="CENTER" onMouseOver="this.style.backgroundColor='#xRollOver_On#'; this.style.cursor='hand'; TD#xCounter#.style.backgroundColor='#xColorA#';  TD#xCounter#b.style.backgroundColor='#xColorA#';" onMouseOut="this.style.backgroundColor='#xRollover_Off#'; this.style.cursor='pointer'; TD#xCounter#.style.backgroundColor='#xDividerColor#'; TD#xCounter#b.style.backgroundColor='#xDividerColor#';" onClick="javascript:popUp('#xPathToRoot##aGalleryDirectory#/#xLink#', '#xWindowName#', #xPopupWidth#, #xPopupHeight#, '#xPopupScroll#');"><A HREF="javascript:popUp('#xPathToRoot##aGalleryDirectory#/#xLink#', '#xWindowName#', #xPopupWidth#, #xPopupHeight#, '#xPopupScroll#');"><FONT FACE="Verdana" SIZE=1 STYLE="font-size: 10px; text-decoration:none">&nbsp;#xName#&nbsp;</FONT></A></TD>
		<CFELSE>
		<TD BGCOLOR="#xRollover_Off#" ALIGN="CENTER" onMouseOver="this.style.backgroundColor='#xRollOver_On#'; this.style.cursor='hand'; TD#xCounter#.style.backgroundColor='#xColorA#';  TD#xCounter#b.style.backgroundColor='#xColorA#';" onMouseOut="this.style.backgroundColor='#xRollover_Off#'; this.style.cursor='pointer'; TD#xCounter#.style.backgroundColor='#xDividerColor#'; TD#xCounter#b.style.backgroundColor='#xDividerColor#';" <!--- onClick="#xPathToRoot##aGalleryDirectory#/#xLink#" --->><A HREF="#xPathToRoot##aGalleryDirectory#/#xLink#" <cfif xName is "About Purchasing Prints">target="_blank"</cfif>><FONT FACE="Verdana" SIZE=1 STYLE="font-size: 10px; text-decoration:none">&nbsp;#xName#&nbsp;</FONT></A></TD>
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
<CFSET xSubtitle = "c u r r e n t   e x h i b i t i o n">
<cfinclude template="/templates/title.cfm">
<DIV ALIGN="CENTER">
<CFOUTPUT>#xHTMLTitle#</CFOUTPUT>
<br /><br />
<TABLE CELLPADDING="0" CELLSPACING="0" BGCOLOR="##D4C9AE" BORDER="0" ALIGN="CENTER">

<tr><td>
 <div align="center">  



<img src="/emailnewsletter/images/sandsilksnow.jpg" border="0" ALT="Current Show">




<br><br /><table width="400" align="center"><tr><td>
<img src="/Gallery/SharedImages/dot_clear.gif" width="1" height="20"><FONT color="##666666" face="verdana, arial, Helvetica, sans-serif" size="2"><font size="3"><b>Sand &nbsp;&middot;&nbsp; Silk &nbsp;&middot;&nbsp; Snow</b></font><br />`<br />Opening Friday, May 2, 2008 5-7pm at photo-eye Gallery Santa Fe is work by Maria Luisa Morando, Chaco Terada and Lisa M. Robinson.<br /><br />
Exhibition continues through June 21st, 2008
</font>
</td></tr></table>

<br /></div>
</td></tr>
</TABLE>


<cfelse>



<!---<CFIF xShowDropDowns is 1>

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
			<option value="#xURLHome#/#bGalleryDirectory#/#xShowcasedArtistsLink#?Gallery=#xGallery#&ExploreBy=7" <CFIF xExploreBy is 7>SELECTED>Explore by <CFELSE>></CFIF>Selected Artists</option>
	</CFIF>
	
	
	<option value="#xURLHome#/#bGalleryDirectory#/ArtistsIndex.cfm?Gallery=#xGallery#&ExploreBy=1" <CFIF xExploreBy is 1>SELECTED>Explore by <CFELSE>></CFIF>Artist Name</option>
	<!--- <option value="#xURLHome#/#bGalleryDirectory#/ExhibitionDate.cfm?Gallery=#xGallery#&ExploreBy=2" <CFIF xExploreBy is 2>SELECTED>Explore by <CFELSE>></CFIF>Exhibition Date</option> --->
	<option value="#xURLHome#/#bGalleryDirectory#/Genres.cfm?Gallery=#xGallery#&ExploreBy=3" <CFIF xExploreBy is 3>SELECTED>Explore by <CFELSE>></CFIF>Category/Genre</option>
	<option value="#xURLHome#/#bGalleryDirectory#/Formats.cfm?Gallery=#xGallery#&ExploreBy=4" <CFIF xExploreBy is 4>SELECTED>Explore by <CFELSE>></CFIF>Camera Format</option>
	<option value="#xURLHome#/#bGalleryDirectory#/Processes.cfm?Gallery=#xGallery#&ExploreBy=5" <CFIF xExploreBy is 5>SELECTED>Explore by <CFELSE>></CFIF>Print Process</option>
	<option value="#xURLHome#/#bGalleryDirectory#/Keywords.cfm?Gallery=#xGallery#&ExploreBy=6" <CFIF xExploreBy is 6>SELECTED>Explore by <CFELSE>></CFIF>Keyword</option>
</select>

<!--- &nbsp;&nbsp;<INPUT TYPE="SUBMIT" NAME="Random" VALUE="Randomizer" style="font: 9px;"> --->

</TD></FORM></TR>

</TABLE>

</CFIF>--->
</cfif> <!--- If not Santa Fe Gallery --->

</CFOUTPUT>