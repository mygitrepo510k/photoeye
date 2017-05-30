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
	
<cfset xmenupath="../">
 <cfinclude template="../include_menu.cfm">
 <br /><br />

<FONT FACE="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333">

<TABLE WIDTH="700"><TR>
      <td colspan="3" align="center"> <font color="#333333" size="3" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong>BEST 
        BOOKS OF 2006<br>
        </strong></font><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong><br>
        </strong></font></td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="200" valign="top" align="right">
<cfoutput>

<cfset xImage = "THE-WINNERS.jpg">
	<cfset xPath = "../../booklist/2007_Spring">
	<CFSET xHEIGHT = "320">
	<CFSET xWidth = "320">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Best Of">
	<cfset xBorder="0">

	<img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a>
	<br><br>         
        		  
	</cfoutput>
		</TD>
   <td width="20">&nbsp;
  </td>
      <td width="480" valign="top"> <p>THE WINNERS </p>
        <p><i><a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=AP523" target="_blank">Satellites</a></i>, by Jonas Bendiksen (Aperture/Mets &amp; Schilt)<br>
          <i><a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP355" target="_blank">Things as They Are</a></i>, by Mary Panzer <br>
          (Aperture/Chris Boot and World Press Photo)<br>
          <i><a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PX063" target="_blank">The Travelers</a></i>, by Elizabeth Heyert (Scalo)<br>
          <i><a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP286" target="_blank">Jens F</a></i>, by Collier Schorr (Steidl/Mack)<br>
          <i><a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=NT176&CFID=5471729&CFTOKEN=67441906" target="_blank">Instant Light</a></i>, by Andrei Tarkovsky (Thames and Hudson)<br>
          <i><a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=ZC698" target="_blank">Mask</a></i>, by Adam Fuss (Baldwin Gallery)<br>
          <i><a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=AP524&CFID=5471729&CFTOKEN=67441906" target="_blank">The Apollo Prophecies</a></i>, by Kahn &amp; Selesnick (Aperture)<br>
          <i><a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=ID807" target="_blank">School Days</a></i>, by Tomoko Sawada (Seigensha Art Publishing)<br>
          <i><a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=ZC711" target="_blank">Hackney Wick</a></i>, by Stephen Gill (Nobody)<br>
          <i><a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=TR192&CFID=5471729&CFTOKEN=67441906" target="_blank">On the Sixth Day</a></i>, by Alessandra Sanguinetti (Nazraeli Press)<br>
          <i><a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=TT142" target="_blank">5x7</a></i>, by William Eggleston (Twin Palms Publishers)<br>
          <i><a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP263&CFID=5471729&CFTOKEN=67441906" target="_blank">Sweet Earth</a></i>, by Joel Sternfeld (Steidl)<br>
          <i><a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=TT141&CFID=5471729&CFTOKEN=67441906" target="_blank">Life as a Night Porter</a></i>, by Chris Shaw (Twin Palms Publishers)<br>
          <i><a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=ZC804&CFID=5471729&CFTOKEN=67441906" target="_blank">Alleverythingthatisyou</a></i>, by Mike and Doug Starn (Baldwin Gallery)</p>
        <p>FOR COUNTLESS YEARS NOW, or so it seems, the entire staff at photo-eye 
          has gathered together at the end of the year and had a general and rousing 
          discussion about what constitutes good photography (and art, for that 
          matter), worthy photography projects, and most importantly, what goes 
          into making a stellar photobook. There is never consensus, but there 
          is much discussion, passion, opinions, and soul-searching.<br><br>
          All of this happens under the guise of voting for the best books of 
          the year. Inevitably, we all find ourselves drawn to books that we had 
          passed over earlier in the year, but which are now brought to our attention 
          by the impassioned plea of a fellow staff member, or conversely, we 
          find our opinion waning on a title that seemed &#8220;all that&#8221; 
          earlier in the year.<br>
          One of the joys of being at the center of the photobook universe (such 
          as we humbly are) is that we get a chance to see numerous titles from 
          around the world that simply don&#8217;t appear on the radar of many 
          other venues. We&#8217;re always proud to include a few of these titles 
          on the &#8220;Best Books&#8221; list for the year. <br><br>
          Along those lines, this year we have asked four guests to list two-four 
          books that they felt were both important and probably missed by the 
          rest of the photography world. We wanted to know what were the sleeper 
          titles out there. Vince Aletti, a photography critic based in New York 
          City, Tim Davis, a photographer and professor at Bard College, Molly 
          Logan, an agent, consultant and photobook afficionado, and our very 
          own Rixon Reed, the director of photo-eye, each gathered up their horde 
          of books from the year and sent us a brief selection of great not-to-be-missed 
          books from 2006. We hope you enjoy the lists!</p>
        <p>TIM DAVIS<br>
          <i><a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=DP607&CFID=5471729&CFTOKEN=67441906" target="_blank">Interregna</a></i>, by John Pilson (Hatje Cantz)<br>
          <i>War, the Musical</i>, by Robert Fitterman and Dirk Rountree (Subpress)</p>
        <p>RIXON REED<br>
          <i><a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=ZC916&CFID=5471729&CFTOKEN=67441906" target="_blank">How to Hunt</a></i>, by Trine S&oslash;ndergaard and Nicolai Howalt (Artpeople)<br>
          <i>Boxers</i>, by Trine S&oslash;ndergaard and Nicolai Howalt (Artpeople)<br>
          <i><a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=DP284&CFID=5471729&CFTOKEN=67441906" target="_blank">Moksha</a></i>, by Fazal Sheikh (Steidl)</p>
        <p>MOLLY LOGAN<br>
          <i><a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=YU074" target="_blank">Harry Callahan</a></i>, The Photographer at Work (Yale University Press)<br>
          <i><a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP490" target="_blank"">New &amp; Used</a></i>, by Marc Joseph (Steidl)<br>
          <i><a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=ID816&CFID=5471729&CFTOKEN=67441906" target="_blank">Farewell Photography</a></i>, by Daido Moriyama (PowerShovel)<br>
          <i>It</i>, Daido Moriyama (Nobuhiko Kitamura) </p>
        <p>VINCE ALETTI<br>
          <i>Jo&#8217;burg</i> (Filigranes Editions/STE Publishers) <br>
          <i>Petros Village</i> (Punctum Editions), both by Guy Tillim<br>
          <i><a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP509" target="_blank">Fashion Magazine</a></i>, Bruce Gilden (Magnum Photos)
        </p>
        <p>...</p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          </font> <font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"> 
          Continue reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=PE030"> 
          ordering</a> the <br>current issue of <em>photo-eye Booklist.</em><br />
          <br>
          <a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a> 
          to the <em>photo-eye Booklist.</em> <br>
          </font></p>
        </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




