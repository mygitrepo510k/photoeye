<CFPARAM NAME="Season" DEFAULT="Spring">
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
      <td colspan="3" align="center"> <font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>FRAENKEL 
        GALLERY IN PRINT<br>
        </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>An exhibition of books and announcements is reviewed.<br />
        BY ALAN RAPP</strong></font></td>
    </tr>
    <tr> 
      <td colspan="3">&nbsp; </td>
    </tr>
    <td width="400" valign="top" align="right"> <p> <cfoutput> 
	          <cfset xImage = "fraenkel-gallery.jpg">
          <cfset xPath = "../../booklist/2006_Winter">
          <CFSET xHEIGHT = "320">
          <CFSET xWidth = "320">
          <cfinclude template="../../templates/imagesizer.cfm">
          <CFSET xCoverHeight = imagecr.height>
          <CFSET xCoverWidth = imagecr.width>
          <cfset xTitle2x="Fraenkel">
          <cfset xBorder="0">
 <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=74">         	
<img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a>
          <br>
        </cfoutput> </p></TD>
    <td width="20">&nbsp; </td>
      <td width="480" valign="top"> <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          </font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          </font>THERE ARE CONVENTIONAL retrospective exhibitions, and then there 
          are shows that take a different perspective on history. For a commercial 
          photography gallery, the former would involve selecting and presenting 
          key artists and works; the memory is in the art itself. San Francisco&#8217;s 
          Fraenkel Gallery has already mounted a few of this variety. But for 
          their recent show, A Gallery in Ink, they have presented instead the 
          variety and depth of the printed matter&#8212;books, posters and announcements&#8212;produced 
          for nearly three decades of exhibitions. &#8220;We have this habit of 
          producing a lot of interesting exhibition announcements, books and posters,&#8221; 
          says gallery director Frish Brandt. &#8220;From the very beginning of 
          the gallery, and Jeffrey [Fraenkel] with a five-year head-start before 
          me, we thought there would be many, many people who would know of the 
          gallery but never visit it. It was very important that what we send out in the mail stand the same ground. It&#8217;s 
          a virtual-reality sense of the gallery.&#8221;</p>
        <p>...</p>
        <p>The exhibition A Gallery in Ink: Books, Posters, Announcements &amp; 
          Ephemera since 1979 ran from 7 September&#8211;30 September, 2006. Visit 
          more installation views and a complete bibliography of publications 
          at www.FraenkelGallery.com.</p>
        <p> <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          Continue reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE029">ordering</a> 
		  the<br> current issue of <i>photo-eye Booklist</i>. </font><br>
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




