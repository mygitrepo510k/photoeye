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
          </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>Continuing this new column, ERIC MILES surveys the published<br> work of the enigmatic
Frederick Sommer
<br>
          </strong></font></p>
        </td></tr>
<tr><td colspan="3" ALIGN="CENTER">&nbsp;</td></tr>
<TR>
 
 
    <td width="298" valign="top" align="right">
 <p>
	  <cfoutput>

	
<cfset xImage = "SOMMER_The-Birth-of-Venus.jpg">
	<cfset xPath = "../../booklist/2006_Winter">
	<CFSET xHEIGHT = "320">
	<CFSET xWidth = "320">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Sommer">
	<cfset xBorder="0">
	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
	<img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
			
	
<cfset xImage = "LU004b.jpg">
	<cfset xPath = "../../booklist/2006_Winter">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Sommer">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=LU004&CFID=4014026&CFTOKEN=57906120"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
	
	
<cfset xImage = "TR015b.jpg">
	<cfset xPath = "../../booklist/2006_Winter">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Sommer">
	<cfset xBorder="0">
	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
	<a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=TR015&CFID=5471729&CFTOKEN=67441906"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
	
	
<cfset xImage = "YU067b.jpg">
	<cfset xPath = "../../booklist/2006_Winter">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Sommer">
	<cfset xBorder="0">
	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
	<a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=YU067&CFID=5471729&CFTOKEN=67441906"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
							
		
<cfset xImage = "CC023b.jpg">
	<cfset xPath = "../../booklist/2006_Winter">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Sommer">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=CC023&CFID=5471729&CFTOKEN=67441906"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>	
		
		</cfoutput>
		
      </p>
  </TD>
   <td width="20">&nbsp;
  </td>
      <td width="480" valign="top"> <p> THE WORK OF FREDERICK SOMMER, widely respected 
          and highly influential, has always remained something of an enigma. 
          He produced a body of work that was remarkable for its erudition, formal 
          inventiveness and downright strangeness. While some of his work is quite 
          well known, major monographs of his output were strangely lacking until 
          the publication last year of the superb Frederick Sommer: Photography, 
          Drawing, Collage (Yale University Press). The scarce Aperture 10:4 (also 
          known as Frederick Sommer 1939&#8211;1962) was the only &#8216;primary 
          source&#8217; available for many years. It encapsulated his vision in 
          what David Levi-Strauss describes &#8220;an almost perfect monograph.&#8221; 
          Prior to the 1990s, available Sommer titles were limited to fairly slight 
          catalogues, some of which can be still be found for fairly reasonable 
          prices. These include: Frederick Sommer, an exhibition of photographs 
          at Philadelphia College of Art (1968); The Mistress of this World has 
          No Name (Denver Art Museum, 1987); Venus, Jupiter, and Mars (Delaware 
          Art Museum, 1980); Frederick Sommer at Seventy- Five, A Retrospective 
          (The Art Museum and Galleries, California State University, 1980) the 
          fine two-volume collection Words/Images (1984) assembled by the Center 
          for Creative Photography. A slim, enigmatic volume of writings, heavily 
          influenced by Wittgenstein, titled The Poetic Logic of Art and Aesthetics 
          appeared in 1972. In short, fairly slim and fragmentary offerings for 
          a photographer whose work entered the collection of the Museum of Modern 
          Art as early as 1941. 
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">...</font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          Continue reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE029"> 
          ordering</a> the <br> current issue of <em>photo-eye Booklist</em>.</font></p>
        </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




