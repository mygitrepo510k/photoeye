<CFPARAM NAME="Season" DEFAULT="Spring">
<CFPARAM NAME="Year" DEFAULT="2007">

<CFSET xTitle="Magazine">
<CFSET xSubPage="1">
<CFSET xPathToRoot="../../">
<CFSET xShowBackButton = 1>
<CFPARAM NAME="Page" DEFAULT="Photo-Eye Booklist">

<cfinclude template="../../templates/Header.cfm">
<DIV ALIGN="CENTER">

	<CFSET xFontColor = "Black">
	
	<CFIF Page is "Reviews">
		<CFSET xSubTitle = "New Books Reviewed">
	<CFELSEIF Page is "Contact">
		<CFSET xSubtitle = "Contact Us">
	<CFELSE>
		<CFSET xSubTitle=Page>
	</CFIF>
	
		<cfset page="Article">
	<CFINCLUDE TEMPLATE="../../templates/Title.cfm">
	<CFOUTPUT>#xHTMLTitle#</CFOUTPUT>
	<BR><BR>


<FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333">

<cfset xmenupath="../">
 <cfinclude template="../include_menu.cfm">
 <br /><br />
 
  <TABLE WIDTH="700">
    <TR> 
      <td colspan="3" align="center"> <font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>WHERE 
        WE LIVE<br>
        <br>
        </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>On 
        a trip out West, 
        gallerist JEN BEKMAN 
        stops by the Getty and 
        finds herself<br> entranced 
        by photographs of one of our most basic needs:<br>
        the need for shelter.<br>
        <br />
        </strong></font></td>
    </tr>
    <tr> 
      <td colspan="3">&nbsp; </td>
    </tr>
    <td width="400" valign="top" align="right"> <p> <cfoutput> 
	         
		  <cfset xImage = "WWL_Epstein-Pl-20.jpg">
          <cfset xPath = "../../booklist/2007_Summer">
          <CFSET xHEIGHT = "320">
          <CFSET xWidth = "320">
          <cfinclude template="../../templates/imagesizer.cfm">
          <CFSET xCoverHeight = imagecr.height>
          <CFSET xCoverWidth = imagecr.width>
          <cfset xTitle2x="Where We Live">
          <cfset xBorder="0">
 <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		         	
<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=GM052"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a>
          <br><br>
		  <cfset xImage = "WWL_Divola-pl-101.jpg">
          <cfset xPath = "../../booklist/2007_Summer">
          <CFSET xHEIGHT = "320">
          <CFSET xWidth = "320">
          <cfinclude template="../../templates/imagesizer.cfm">
          <CFSET xCoverHeight = imagecr.height>
          <CFSET xCoverWidth = imagecr.width>
          <cfset xTitle2x="Where We Live">
          <cfset xBorder="0">
 <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP538">         	
<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=GM052"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a>
          <br><br>
		  <cfset xImage = "WWL_Cover.jpg">
          <cfset xPath = "../../booklist/2007_Summer">
          <CFSET xHEIGHT = "120">
          <CFSET xWidth = "120">
          <cfinclude template="../../templates/imagesizer.cfm">
          <CFSET xCoverHeight = imagecr.height>
          <CFSET xCoverWidth = imagecr.width>
          <cfset xTitle2x="Where We Live">
          <cfset xBorder="0">
 <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PK768">         	
<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=GM052"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a>
          <br><br>
        </cfoutput> </p></TD>
    <td width="20">&nbsp; </td>
      <td width="480" valign="top"> <p><em>Where We Live</em> was the unexpected highlight 
          of my recent trip out West, to attend Photo LA. I wasn&#8217;t even 
          aware of the exhibition and my Friday evening excursion to the Getty 
          was wedged into a very busy few days. Wandering the galleries with two 
          friends, I coaxed them into the exhibition for what was meant to be 
          a quick peek on our way out of the museum. What a fortuitous detour! 
          Suddenly we were in the midst of an amazing, if somewhat specific, history 
          of American photography. I couldn&#8217;t contain my excitement as I 
          wandered from room to room. I&#8217;ve never before had an opportunity 
          to review such a broad swath of significant works in person. <br><br>
          Even the biggest names in the exhibition&#8212;Robert Adams, William 
          Eggleston and Joel Sternfeld among them&#8212;might not be household 
          names beyond the photography community, but the photos in the exhibition 
          are familiar to most Americans. This is a show that captures America: 
          its barbershops, its lawnchairs, gardens and storefront churches; its 
          well-traveled roads and everything that lines them; gas stations and 
          diners and neon and barns, most of them creeping towards decrepitude; 
          its vistas and landscapes, from cities on out to its loneliest stretches 
          of desert. And Americans as well: individuals, families whole and fractured, 
          our homes and our cars (of course, our cars!).<br><br>
          I was caught off guard by what an emotional experience it was for me. 
          Part of the excitement was seeing the prints in person, often big and 
          always beautiful. <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          </font></p>
        <p>&#8230;</p>
        <p><em>Where We Live: Photographs of America from the Berman Collection</em>. Numerous 
          contributing photographers. Text by Kenneth A. Breisch, Judith Keller 
          and Colin Westerbeck, with an essay by Bruce Wagner. Edited by John 
          Harris. Getty Publications, Los Angeles, 2006. Designed by Jim Drobka. 
          Flexibind with photo-illustrated paper over boards. 227 pp., 170 four-color 
          plates, 11&frac14; &times; 11 $49.95</p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">Continue 
          reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE031
		 ">ordering</a> the<br>
          current issue of <i>photo-eye Booklist</i>. </font><br><br>
		  <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=GM052">Order</a> <em>Where We Live</em>
        
        <p> <a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a> 
          to the <em>photo-eye Booklist. </em> <br>
        </p>
        </p>
      </TD>
    </TR>
    <tr>
      <td valign="top" align="right">&nbsp;</TD>
      <td>&nbsp;</td>
      <td valign="top">&nbsp;</TD>
    </TR>
  </TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




