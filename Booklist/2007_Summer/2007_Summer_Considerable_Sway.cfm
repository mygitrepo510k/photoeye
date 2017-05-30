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
      <td colspan="3" align="center"> <p><font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>CONSIDERABLE 
          SWAY: <BR>
          The Visionary Art and Practice of L&aacute;szl&oacute; Moholy-Nagy<br>
          <br>
          </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>Two 
          recent titles add depth to the already potent vision of the legendary 
          educator, <br>
          theorist and Bauhaus artist. <br>
          <BR>
          By RICHARD WOODWARD</strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong><br>
          <br />
          </strong></font></p>
        </td>
    </tr>
    <tr> 
      <td colspan="3">&nbsp; </td>
    </tr>
    <td width="400" valign="top" align="right"> <p> <cfoutput> 
	         
		  <cfset xImage = "MOHOLY_019_Nagy.jpg">
          <cfset xPath = "../../booklist/2007_Summer">
          <CFSET xHEIGHT = "320">
          <CFSET xWidth = "320">
          <cfinclude template="../../templates/imagesizer.cfm">
          <CFSET xCoverHeight = imagecr.height>
          <CFSET xCoverWidth = imagecr.width>
          <cfset xTitle2x="Where We Live">
          <cfset xBorder="0">
 <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		         	
<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP557"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a>
          <br><br>
		  <cfset xImage = "MOHOLY_48_LENA.jpg">
          <cfset xPath = "../../booklist/2007_Summer">
          <CFSET xHEIGHT = "320">
          <CFSET xWidth = "320">
          <cfinclude template="../../templates/imagesizer.cfm">
          <CFSET xCoverHeight = imagecr.height>
          <CFSET xCoverWidth = imagecr.width>
          <cfset xTitle2x="Where We Live">
          <cfset xBorder="0">
 <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		         	
<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=YU082"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a>
          <br><br>
		  <cfset xImage = "Moholy_Cover1.jpg">
          <cfset xPath = "../../booklist/2007_Summer">
          <CFSET xHEIGHT = "120">
          <CFSET xWidth = "120">
          <cfinclude template="../../templates/imagesizer.cfm">
          <CFSET xCoverHeight = imagecr.height>
          <CFSET xCoverWidth = imagecr.width>
          <cfset xTitle2x="Moholy-Nagy">
          <cfset xBorder="0">
 <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		         	
<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP557"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a>
          <br><br>
		  <cfset xImage = "Moholy_Cover2.jpg">
          <cfset xPath = "../../booklist/2007_Summer">
          <CFSET xHEIGHT = "120">
          <CFSET xWidth = "120">
          <cfinclude template="../../templates/imagesizer.cfm">
          <CFSET xCoverHeight = imagecr.height>
          <CFSET xCoverWidth = imagecr.width>
          <cfset xTitle2x="Moholy-Nagy">
          <cfset xBorder="0">
 <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		         	
<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=YU082"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a>
          <br><br>
        </cfoutput> </p></TD>
    <td width="20">&nbsp; </td>
      <td width="480" valign="top"> <p>Thirty years ago L&aacute;szl&oacute; Moholy-Nagy 
          still exerted considerable sway over the practice of art photography. 
          Beginning in the late 20s and for the next fifty years his boundary-pushing 
          techniques offered inspiration and guidance to anyone rebelling against 
          the dominant &#8220;straight&#8221; tradition. The many students, or 
          students of students, who read his proselytizing books (such as <em>The 
          New Vision</em> or <em>Vision in Motion</em>) or had enrolled at the Bauhaus in Weimar 
          and Dessau, or the New Bauhaus (later School of Design) when he was 
          in Chicago from 1938 until his death in 1946, advanced his risk-taking 
          legacy themselves. Henry Holmes Smith, Carlotta Capron, Ray Metzker 
          and Ken Josephson are a few who directly or indirectly took sustenance 
          from his example. <br><br>
          Today his presence is harder to discern. Collectors highly value his 
          vintage prints and have pushed his prices well into six figures. But 
          his politics (utopian socialist) seem quaint in the present environment; 
          and his celebration of denatured abstraction and the latest industrial 
          technology&#8212;&#8220;we are all equal before the machine,&#8221; 
          he liked to say&#8212;is more apparent in digital video and computer 
          graphics than the latest art photography, with its pronounced shift 
          in recent decades back to large cameras and a realist aesthetic. Among 
          artists, his reputation has suffered from being associated too closely 
          with his role as an educator and with a few darkroom tricks. Other than 
          Adam Fuss, Todd Watts and first-year art students, does anyone make 
          photograms anymore? <br><br>
          Two recent books offer a welcome chance to re-evaluate what he still 
          means to us. One is a catalogue for a handsome show, organized in 2006 
          by the Tate Modern and exhibited in New York at the Whitney Museum, 
          in which he was paired with his Bauhaus contemporary Josef Albers. Both 
          were dynamic teachers who took divergent paths as personalities and 
          pedagogues. Moholy&#8217;s constructivist penchant&#8212;the vertiginous 
          angles, designed to liberate the eye from a fixed perspective, and the 
          promotion of mechanical means for making art&#8212;derived in part from 
          his brushes with Dada. Albers was less a boisterous radical in outlook, 
          more of a somber and systematic Goethean figure. <br>
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          </font></p>
        <p>&#8230;</p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">Continue 
          reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE031
		 ">ordering</a> the<br>
          current issue of <i>photo-eye Booklist</i>. </font><br>
          <br>
          <a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a> 
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




