<CFPARAM NAME="Season" DEFAULT="Fall">
<CFPARAM NAME="Year" DEFAULT="2006">

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
	
	<CFINCLUDE TEMPLATE="../../templates/Title.cfm">
	
	<CFOUTPUT>#xHTMLTitle#</CFOUTPUT> <!--- <FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" style="font-size:30px" COLOR="##333333">
	 <strong>photo-eye Booklist</strong>
	</font> --->
	<BR><BR>
<FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333">

<cfset page="About">
<cfset xmenupath="../">
 <cfinclude template="../include_menu.cfm">
 <br /><br />


<TABLE WIDTH="700">

<tr><td colspan="3" ALIGN="CENTER"><p><font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>The 
          Old &amp; Rare Survey<br>
          </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>A 
          regular column that surveys important books of the past.<br>
          By ERIC MILES</strong></font></p>
        </td></tr>
<tr><td colspan="3" ALIGN="CENTER">&nbsp;</td></tr>
<TR>
 
 
    <td width="298" valign="top" align="right">
<cfoutput>
<cfset Catalog="http://www.photoeye.com/auctions/auctionfrontpage.cfm">
<cfset xImage = "NARAHARA-BIG.jpg">
	<cfset xPath = "../../booklist/2006_Fall">
	<CFSET xHEIGHT = "400">
	<CFSET xWidth = "400">
	<cfinclude template="../../templates/imagesizer.cfm">  
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Narahara">
	<cfset xBorder="1">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE028"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>

<cfset Catalog="http://www.photoeye.com/auctions/auctionfrontpage.cfm">
<cfset xImage = "NARAHARA-VANISHED.jpg">
	<cfset xPath = "../../booklist/2006_Fall">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">	
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Narahara">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE028"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a></cfoutput>
      </p>
  </TD>
   <td width="20">&nbsp;
  </td>
      <td width="480" valign="top"> <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">SINCE 
        ITS INCEPTION <em> the core of the photo-eye Booklist has always been 
        our survey of new books. While at times these include monographs and anthologies 
        of older work, in this issue we continue with a new column that adds a 
        wide-ranging historical dimension to our pages. To this end, Eric Miles, 
        photo-eye&#8217;s Auction Coordinator, contributes his own idiosyncratic 
        survey of old books. In this issue, he explores a relatively unknown Japanese 
        photographer, Ikko Narahara.&#8212;</em>Darius Himes, Editor.<em> </em></font> 
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          The history of photography could be narrated as a series of episodes 
          in the eternal struggle&#8212;more of an unhappy <br>
          marriage really&#8212;between the inherent objectivity of the medium 
          and its potential to be used as a more subjective means of expression. 
          In Japan, this was never a fair fight. Realism in art and the medium 
          of photography arrived in Japan at around the same time. The Japanese 
          word for photography, shashin, to draw truth, implied a fairly strong 
          bias against the overtly personalized image. Following WWII, Ken Domon 
          proselytized in favor of a straightforward, almost mechanistic, social 
          realism, believing that photographers had a moral imperative to tell 
          the story of the postwar struggles that Japan faced in a clear manner, 
          uninflected by any stylistic obfuscation. Though certainly influenced 
          by them, he avoided the more sentimental humanism of Kert&eacute;sz, 
          Cartier-Bresson or Doisneau. Backlash was inevitable. Among a generation 
          of innovative young Turks that includes Shomei Tomatsu, Daido Moriyama 
          and Eikoh Hosoe, Ikko Narahara stands out for several brilliant books 
          released between 1967 and 1975.</font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">...</font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          Continue reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE028"><strong><br>
          ordering</strong></a> the Fall issue of the <em>photo-eye Booklist</em>.</font></p>
        </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




