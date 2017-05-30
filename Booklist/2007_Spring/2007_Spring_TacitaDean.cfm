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
      <td colspan="3" align="center"> <font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>The 
        Joys of Fleeting Time<br><br>
        </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>The work of Tacita Dean is richly layered, exploring coincidence and temporality through a variety of mediums. Three of her recent titles are reviewed by CHARLOTTE COTTON

<br />
        </strong></font></td>
    </tr>
    <tr> 
      <td colspan="3">&nbsp; </td>
    </tr>
    <td width="400" valign="top" align="right"> <p> <cfoutput> 
	          <cfset xImage = "tacita-1.jpg">
          <cfset xPath = "../../booklist/2007_Spring">
          <CFSET xHEIGHT = "320">
          <CFSET xWidth = "320">
          <cfinclude template="../../templates/imagesizer.cfm">
          <CFSET xCoverHeight = imagecr.height>
          <CFSET xCoverWidth = imagecr.width>
          <cfset xTitle2x="Tacita Dean">
          <cfset xBorder="0">
 <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		         	
<img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a>
          <br><br>
		  <cfset xImage = "tacita-2.jpg">
          <cfset xPath = "../../booklist/2007_Spring">
          <CFSET xHEIGHT = "320">
          <CFSET xWidth = "320">
          <cfinclude template="../../templates/imagesizer.cfm">
          <CFSET xCoverHeight = imagecr.height>
          <CFSET xCoverWidth = imagecr.width>
          <cfset xTitle2x="Tacita Dean">
          <cfset xBorder="0">
 <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		         	
<img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a>
          <br><br>
		  <cfset xImage = "tacita-3.jpg">
          <cfset xPath = "../../booklist/2007_Spring">
          <CFSET xHEIGHT = "320">
          <CFSET xWidth = "320">
          <cfinclude template="../../templates/imagesizer.cfm">
          <CFSET xCoverHeight = imagecr.height>
          <CFSET xCoverWidth = imagecr.width>
          <cfset xTitle2x="Tacita Dean">
          <cfset xBorder="0">
 <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP538">         	
<img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a>
          <br><br>
		  <cfset xImage = "tacita-4.jpg">
          <cfset xPath = "../../booklist/2007_Spring">
          <CFSET xHEIGHT = "320">
          <CFSET xWidth = "320">
          <cfinclude template="../../templates/imagesizer.cfm">
          <CFSET xCoverHeight = imagecr.height>
          <CFSET xCoverWidth = imagecr.width>
          <cfset xTitle2x="Tacita Dean">
          <cfset xBorder="0">
 <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PK768">         	
<img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a>
          <br><br>
        </cfoutput> </p></TD>
    <td width="20">&nbsp; </td>
      <td width="480" valign="top"> <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          </font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          </font>TACITA DEAN&#8217;S ART is littered with stories of disappearances 
          and the fading out of ambitious human endeavor&#8212;of legendary artists 
          and explorers, radical architecture, and technologies. The coincidences 
          of history and her own working practices&#8212;the mistakes that give 
          art and life their richness&#8212;ripple through the experience of Dean&#8217;s 
          films, drawings, photographs, prints and writings. If you&#8217;ve had 
          the good fortune to experience Dean&#8217;s artwork &#8220;in the flesh,&#8221; 
          you might speculate that its subtle but deeply memorable effect was 
          predestined by her parents&#8217; naming her after the goddess of silence. 
          Dean&#8217;s art leaks its meaning; there is little hyperbole, no overt 
          dramatization, just a rigor and profound honesty in her process that 
          translates into a remarkably ego-less poetry of intangible or discarded 
          things. <br><br>
          2006 saw the publication of two books that offer good summaries of Dean&#8217;s 
          work since the early 1990s. <i>Tacita Dean</i>, published as part of 
          the Phaidon Contemporary Artists series of monographs, makes a sensitive 
          attempt to explore Dean&#8217;s oeuvre within the format of the series. 
          The book doesn&#8217;t visually tantalize you; the slight over-design 
          means that the artwork is visually indexed rather than translated for 
          the book page. As a result, this book relies heavily on its five main 
          sections of text, with images as their illustrations. <i>Tacita Dean</i> starts 
          with a really substantial interview between the artist and the writer 
          Marina Warner. Their equal intelligence, knowledge and imaginations 
          create an enjoyable sense of the process and layers of meaning in the 
          artworks they discuss as well as the artist&#8217;s intent.</p>
        <p>&#8230;</p>
        <p><i>Tacita Dean, Contemporary Artists Series</i>. Text by Jean-Christophe Royoux, 
          Germaine Greer and Tacita Dean; interview by Marina Warner. Edited by 
          Craig Garrett. Phaidon, London and New York, 2006. Melanie Mues, Mues 
          Design, London. Paperback with photo-illustrated dustjacket. 160 pp., 
          100 color and 25 black-and-white illustrations, 11&frac12; x 10 $39.95</p>
        <p>Analogue. Drawings 1991&#8211;2006. Artwork by Tacita Dean. Interview 
          by Theodora Vischer. Steidl, G&ouml;ttingen, 2006. Softbound. 160 pp., 
          illustrated throughout, 8 x 10 $30.00</p>
        <p>Floh. Edited by Tacita Dean in collaboration with Martyn Ridgewell. 
          Steidl, G&ouml;ttingen, 2001. Clothbound with cardboard slipcase. 176 
          pp., 48 color and 109 black-and-white illustrations, 9&frac12; x 11&frac34; 
          $35.00<br>
        </p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          Continue reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE030
		 ">ordering</a> 
          the<br>
          current issue of <i>photo-eye Booklist</i>. </font><br>
          <br />
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




