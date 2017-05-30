<CFPARAM NAME="Season" DEFAULT="Fall">
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
	
<cfset xmenupath="../">
 <cfinclude template="../include_menu.cfm">
 <br /><br />

<FONT FACE="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333">

<TABLE WIDTH="700">
    <TR> 
      <td colspan="3" align="center">
<p>&nbsp;
        <p><font color="#333333" size="3" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong>ROOTED 
          TO PLACE</strong></font>
        <p><font color="#333333" size="3" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong> 
          <font size="2">Lucy R. Lippard&#8217;s career seen through a lifetime 
          of books.</font></strong></font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong> 
          INTERVIEW BY MARY ANNE REDDING</strong></font></p></td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="200" valign="top" align="right">
<cfoutput>

<cfset xImage = "Lucy_Lippard.jpg">
	<cfset xPath = "../../booklist/2007_Fall">
	<CFSET xHEIGHT = "320">
	<CFSET xWidth = "320">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Lippard">
	<cfset xBorder="0">
          <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=NT054"><img src="Lucy_Lippard.jpg"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="382" WIDTH="360"></a> 
          <br>
          <br>
          <br>
        </cfoutput> </p></TD>
    <td width="20">&nbsp; </td>
      <td width="480" valign="top"> <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">IN 
          THE INTRODUCTION TO ON THE BEATEN TRACK, Lucy Lippard has written: &#8220;Photography 
          and public art operate most effectively in the gap between art and life 
          where I too like to work.&#8221; A self-proclaimed rubbernecker since 
          she was a child, Lippard looks Longingly at the world, particularly 
          the world of art and the place of art within the world, which leads 
          her ultimately back to place, with or without art. &#8220;Place for 
          me is the locus of desire. Places have influenced my life as much as, 
          perhaps more than, people. I fall for (or into) places faster and less 
          conditionally than I do for people.&#8221; And having looked with a 
          lover&#8217;s eyes, she writes about what it is she sees. As photography 
          is, ultimately, also about seeing and recording, not with words but 
          with light what it is one sees, it seems natural to compile a bibliography 
          of books that Lucy Lippard has written or contributed to that contain 
          her musings on photography, photographers, artists who use photography 
          in their creative work, and activists for whom the image is important. 
          Lippard also makes pictures, although I suspect she would not call herself 
          a photographer; many of her books contain quite nice images she has 
          made to accompany her text. Not that Lippard hasn&#8217;t ruminated 
          much on other things in addition to the photographic, she has for many 
          years<br>
          written and lectured nationally on issues of place, public art, environmental 
          art, as well as about feminist, Native, Hispano and Latin artists. She 
          has also received for her words and critical thinking, a Guggenheim 
          fellowship, two NEA grants, and the College Art Association&#8217;s 
          Mather Award for Art Criticism, as well as honorary doctorates from 
          the Moore College of Art, the San Francisco Art Institute, the Massachusetts 
          College of Art, and the Maine College of Art. The Smithsonian Archives 
          of American Art is the major repository for her professional papers. 
          And, what Lippard considers one of her major achievements, she is the 
          founding editor of the community newsletter, <em>El Puente de Galisteo</em>, 
          published monthly in her hometown of Galisteo, NM, where she lives in 
          a small house, &#8220;off the grid,&#8221; with lots of windows and 
          little wall space in the Galisteo Basin about thirty minutes southwest 
          of Santa Fe. </font></p>
        <p>&#8230;</p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">Continue 
          reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE032
		 ">ordering</a> the<br>
          current issue of <i>photo-eye Booklist</i>. </font><br>
          <br>
          <a href="http://www.photoeye.com/booklist/subscribe.cfm" target="_blank">Subscribe</a> 
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




