	<cfparam name="xURLHome" default="">
	<cfparam name="bGalleryDirectory" default="GALLERY">
	
<CFIF xShowDropDowns is 1>
<CFPARAM NAME="xShowArtistLogin" DEFAULT="1">


<!--- menu system for the gallery --->
<CFPARAM NAME="xMenuToShow" DEFAULT="Showcase">
<CFPARAM NAME="xItemSelected" DEFAULT="">
<CFPARAM NAME="xPathToRoot" DEFAULT="../">

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
		<CFSET ItemName_0 = "Send Comments">
		<CFSET ItemLink_0 = "WebsiteComments.cfm?Gallery=1">
		<CFSET ItemPopup_0 = 0>
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
		<CFSET ItemName_0 = "Send Comments">
		<CFSET ItemLink_0 = "WebsiteComments.cfm?Gallery=2">
		<CFSET ItemPopup_0 = 0>
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
		<CFSET ItemName_0 = "Send Comments">
		<CFSET ItemLink_0 = "WebsiteComments.cfm?Gallery=3">
		<CFSET ItemPopup_0 = 0>
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




<CFIF IsDefined("url.ExploreBy")>
	<CFSET xExploreBy = url.ExploreBy>
</CFIF>





<!---<TABLE CELLPADDING="0" CELLSPACING="0" BGCOLOR="##D4C9AE" BORDER="0" BORDERCOLOR="Gray" ALIGN="CENTER">
<TR><TD BORDERCOLOR="##D4C9AE" ALIGN="CENTER">--->


<!---<FORM ACTION="#xURLHome#/#aGalleryDirectory#/Randomizer.cfm" METHOD="POST" >
--->

<INPUT TYPE="HIDDEN" NAME="Gallery" VALUE="#xGallery#">
<cfif CGI.HTTP_USER_AGENT CONTAINS "IE">
	<select name="ExploreBy" style="font-size: 9px; margin-top:1px; margin-left:2px; margin-right:0px; color: ##aaa; font-family:inherit; BACKGROUND-COLOR:##fff;float:left;" onChange="jumpMenu('parent',this,0)">
<cfelse>
	<select name="ExploreBy" style="font-size: 13px; color: ##aaa; font-family:inherit; BACKGROUND-COLOR:##fff;float:left;" onChange="jumpMenu('parent',this,0)">
</cfif>
	<CFIF xMenuToShow is "Main">
		<CFPARAM NAME="xExploreBy" DEFAULT="0">
		<cfoutput><option value="?Gallery=#xGallery#&ExploreBy=0" <CFIF xExploreBy is 0>SELECTED</CFIF>>Explore Portfolios by...</option></cfoutput>
	<CFELSE>
		<CFIF IsDefined("url.Image")>
			<CFSET xExploreBy = 0>
			<cfoutput><option value="?Gallery=#xGallery#&ExploreBy=0" <CFIF xExploreBy is 0>SELECTED</CFIF>>Explore Portfolios by...</option></cfoutput>
		</CFIF>
			
		<CFPARAM NAME="xExploreBy" DEFAULT="7">
		<CFIF xGallery is 1>
			<CFSET xShowcasedArtistsLink = "RepresentedArtists/HomepagePE.cfm">
		<CFELSEIF xGallery is 2>
			<CFSET xShowcasedArtistsLink = "Photoshowcase/HomepagePSnew.cfm">
		<CFELSEIF xGallery is 3>
			<CFSET xShowcasedArtistsLink = "MagnumArtists/HomepageMA.cfm">
		</CFIF>
			<option value="/#bGalleryDirectory#/#xShowcasedArtistsLink#?Gallery=#xGallery#&ExploreBy=7" <CFIF xExploreBy is 7>SELECTED>Explore by <CFELSE>></CFIF>Selected Artists</option>
	</CFIF>
	


	<cfoutput><option value="/#bGalleryDirectory#/ArtistsIndex.cfm?Gallery=#xGallery#&ExploreBy=1" <CFIF xExploreBy is 1>SELECTED>Explore by <CFELSE>></CFIF>Artist Name</option>
	<!--- <option value="#xURLHome#/#bGalleryDirectory#/ExhibitionDate.cfm?Gallery=#xGallery#&ExploreBy=2" <CFIF xExploreBy is 2>SELECTED>Explore by <CFELSE>></CFIF>Exhibition Date</option> --->
	<option value="/#bGalleryDirectory#/Genres.cfm?Gallery=#xGallery#&ExploreBy=3" <CFIF xExploreBy is 3>SELECTED>Explore by <CFELSE>></CFIF>Category/Genre</option>
	<option value="/#bGalleryDirectory#/Formats.cfm?Gallery=#xGallery#&ExploreBy=4" <CFIF xExploreBy is 4>SELECTED>Explore by <CFELSE>></CFIF>Camera Format</option>
	<option value="/#bGalleryDirectory#/Processes.cfm?Gallery=#xGallery#&ExploreBy=5" <CFIF xExploreBy is 5>SELECTED>Explore by <CFELSE>></CFIF>Print Process</option>
	<option value="/#bGalleryDirectory#/Keywords.cfm?Gallery=#xGallery#&ExploreBy=6" <CFIF xExploreBy is 6>SELECTED>Explore by <CFELSE>></CFIF>Keyword</option></cfoutput>
</select>

<!--- &nbsp;&nbsp;<INPUT TYPE="SUBMIT" NAME="Random" VALUE="Randomizer" style="font: 9px;"> --->

<!---</TD></FORM></TR>

</TABLE>--->


<!---</form>--->

</CFIF>