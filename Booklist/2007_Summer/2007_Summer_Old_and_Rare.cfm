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

<tr><td colspan="3" ALIGN="CENTER"><p><font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>THE 
          OLD &amp; RARE SURVEY<br>
          <br>
          </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>With 
          the publication of influential surveys of photobooks in recent years, 
          ERIC MILES pauses to reflect on the nature of collecting. This second 
          of a two-part essay explores <br>
          the methods and ideas behind building a 
          collection.<br>
          <br>
          </strong></font></p>
        </td></tr>
<tr><td colspan="3" ALIGN="CENTER">&nbsp;</td></tr>
<TR>
 
 
    <td width="298" valign="top" align="right">
 <p>
	  <cfoutput>
	  <cfset xImage = "SOTH-sleeping-big.jpg">
	<cfset xPath = "../../booklist/2007_Summer">
	<CFSET xHEIGHT = "320">
	<CFSET xWidth = "320">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Collecting pt2">
	<cfset xBorder="0">

	<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP252"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a>
	<br><br>
</cfoutput>
		
      </p>
  </TD>
   <td width="20">&nbsp;
  </td>
      <td width="480" valign="top"> <p>As the historian Robert Darnton has suggested, 
          the catalogue of a personal library can function as a &#8220;profile 
          of a reader,&#8221; permitting us to &#8220;inspect the furnishings&#8221; 
          of its owner&#8217;s mind (<em>History of Reading</em>, 162), even if 
          said owner has not read all of the books in his collection. The flaneur 
          and the physiognomist, whom we met in our last installment of The Old 
          &amp; Rare Survey, represent fairly distinct styles of collecting. &#8220;Though 
          certainly related, we can think of each as characterized by a particular 
          sort of gaze. The flaneur wanders with a certain &#8216;purposeful aimlessness&#8217; 
          through the byways of culture [...] while the physiognomist, ever eager 
          to discern meaning via surface appearance, is often seduced by production 
          value, never losing sight of the material qualities of the books in 
          her collection.&#8221;<br><br>
          For photobook collectors, the seductions of production value have multiplied 
          exponentially over the past decade. Because the demand for them exists&#8212;the 
          Platinum or Classic Series, the museum or deluxe edition, each in very 
          limited supply&#8212;publishers tread a fine line between making work 
          affordable and craftily playing on the self-image of the collector as 
          a connoisseur of rare luxury goods. <br><br>
          The production of popular photographic titles in multiple editions at 
          different price points is not new, however; in Europe, even as far back 
          as the 1920s, publishers of photo-illustrated books produced editions 
          that might be priced several times higher than trade editions.<br>
          There are other ways of thinking about limited editions, though. In 
          hindsight, the accidental &#8220;limited edition&#8221; would happen 
          when midway through a print run, materials might change; or again, it 
          occurs when a book is translated into another language. Certain editions 
          from this fertile period in the history of publishing are now exceptionally 
          rare; just try to find the Norwegian edition of Blossfeldt&#8217;s seminal 
          <em>Urformen der Kunst</em>. 
        <p>&#8230; 
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          Continue reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE031
		  "> ordering</a> the <br>
          current issue of <em>photo-eye Booklist</em>.</font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a> 
          to the <em>photo-eye Booklist.</em> </font></p>
        </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




