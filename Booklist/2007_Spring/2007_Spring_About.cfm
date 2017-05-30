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
    <tr>
      <td colspan="3" ALIGN="CENTER"><font color="#333333" size="3" face="'Trebuchet MS', 'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>ABOUT 
        OUR COVER</strong></FONT></td>
    </tr>
    <tr>
      <td colspan="3" ALIGN="CENTER">&nbsp;</td>
    </tr>
    <TR> 
      <td width="298" valign="top" align="right"> <cfoutput> 
          <cfset Catalog="tr197">
          <cfset xImage = "CONEY-ISLAND-tilt-a-whirl.jpg">
          <cfset xPath = "../../booklist/2007_Spring">
          <CFSET xHEIGHT = "320">
          <CFSET xWidth = "320">
          <cfinclude template="../../templates/imagesizer.cfm">
          <CFSET xCoverHeight = imagecr.height>
          <CFSET xCoverWidth = imagecr.width>
          <cfset xTitle2x="Coney Island">
          <cfset xBorder="1">
          <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
          <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP567"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br>
          <br>
          <cfset Catalog="tr197">
          <cfset xImage = "coney-island-cover.jpg">
          <cfset xPath = "../../booklist/2007_Spring">
          <CFSET xHEIGHT = "120">
          <CFSET xWidth = "120">
          <cfinclude template="../../templates/imagesizer.cfm">
          <CFSET xCoverHeight = imagecr.height>
          <CFSET xCoverWidth = imagecr.width>
          <cfset xTitle2x="Coney Island">
          <cfset xBorder="0">
          <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
          <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP567"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a></cfoutput> </p> 
      </TD>
      <td width="20">&nbsp; </td>
      <td width="480" valign="top"> <p><b>Paradise Lost<br>
          </b>Peter Granser's Coney Island in all its faded glory. <br>
          BY AVIS CARDELLA<br>
          <br>
          Coney Island is a mythical place, a seaside amusement park, summertime 
          utopia that has been chronicled in innumerable photographs over the 
          decades. Bet you can&#8217;t say you haven&#8217;t seen Weegee&#8217;s 
          famous cheek-to-jowl, people-packed shoreline shot, or Lisette Model&#8217;s 
          obese bather in the black maillot or Bruce Davidson&#8217;s glamorous, 
          primping gang members.<br><br>
          In addition to being a significant part of photographic history, Coney 
          Island plays very heavily in my personal memory picture book. I was 
          born and grew up in Brooklyn, and many a sweltering New York summer 
          of my childhood was spent on the Island&#8217;s sandy beaches and rickety 
          rides. In a battered shoebox in one closet or another I know I have 
          a blurry black-and-white snapshot of my brother and me riding the fabulously 
          nauseating Cyclone roller coaster.<br><br>
          This in mind, it was with great anticipation that I greeted photographer 
          Peter Granser&#8217;s new monograph, <i>Coney Island</i>. I was familiar with 
          some of Granser&#8217;s work, most notably 2003&#8217;s <i>Sun City</i>, a 
          keenly observed reportage on America&#8217;s first city built solely 
          as a retirement community, and was hoping that this new volume would 
          carry the same weight. I&#8217;m happy to report that <i>Coney Island</i> does 
          not disappoint. <br><br>
          But Granser&#8217;s Coney Island is no longer Weegee&#8217;s, nor Davidson&#8217;s, 
          nor even my own idealized childhood version. The 72 color photographs 
          in this volume were taken between the years 2000 and 2005, and as writer 
          and critic Vicki Goldberg points out in the book&#8217;s well-researched 
          introduction titled &#8220;The Democratic Paradise,&#8221; the past 
          five years bear witness to this one-time wonderland in the throes of 
          transition. Over the years, Coney Island has morphed from being an &#8220;Electric 
          Eden&#8221; met with worldwide awe and fascination, to a crowded populist 
          escape, to a derelict, crime-ridden no-man&#8217;s land. <br><br>
          Granser captures today&#8217;s Coney Island and its inhabitants and 
          visitors in a state of flux, as somewhat saved from the brink of ruin&#8212;the 
          Cyclone now has &#8220;landmark&#8221; status, a ball park has been 
          erected and crime rates are down&#8212;but still woefully distant from 
          its former glory. His portraits hone in on the local characters and 
          their various masquerades and personas: geriatric cowboys, extravagant 
          mermaids, tattooed and oiled aging body-builders. His landscapes depict 
          a gray sky that&#8217;s trying hard to be blue, a shoreline riddled 
          with beer cans and watermelon rinds, and two girls riding a Tilt-a-Whirl 
          that looks strangely motionless. In fact, almost every image has a trapped-in-amber 
          quality, a stillness that reminds me of the amusement park&#8217;s once 
          popular wax museum. <br><br>
          The British photographer Martin Parr, well known for his humorous social 
          reportage, has clearly been an influence here. (Granser has said that 
          he switched from shooting black-and-white to color after meeting Parr 
          in 1997.) But where Parr is like a heat-seeking missile, targeting consumer 
          culture&#8217;s foibles with no holds barred, Granser&#8217;s is a quieter 
          approach. As he did with <i>Sun City</i>, Granser, an Austrian who now lives 
          in Germany, observes the culture of Coney Island with a foreigner&#8217;s 
          careful precision and reverence. He doesn&#8217;t want to get it wrong. 
          And he doesn&#8217;t. He takes aim but lets his subjects&#8217; humanity 
          take over. The resulting images are poignant, sad, comical, nostalgic, 
          melancholy, absurd and peculiarly charming. <br><br>
          Coney Island may only be a small strip of land, but it has almost always 
          had greater relevance as a metaphor for the optimistic American Dream. 
          This perhaps is what has attracted photographers over the years, and 
          this is what Granser has trained his camera on: everything that happens 
          when that dream gets interpreted, distorted, destroyed or resurrected, 
          rises and falls and rises again, like the human spirit, like the shoreline, 
          and very much like an amusement park ride itself.<br>
          <br>
          <i>Coney Island</i>. Photographs by Peter Granser. Introduction by Vicki Goldberg. 
          Hatje Cantz, Ostfildern, 2006. Designed by Stapelberg &amp; Fritz, Stuttgart. 
          Printed by Cantz'sche Druckerei. Photo-illustrated paper over boards. 
          100 pp., 72 color plates,<br>
          11 x 11 $50.00<br>
                    <BR />
          <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP567">Order</a> 
          <i>Coney Island</i>.<br>
          <br>
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=pe030">Order</a> 
          the current issue of <i>photo-eye Booklist</i>. </font><br>
          <br>
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a> 
          to the <i>photo-eye Booklist.</i></font></p>
        </TD>
    </TR>
    <TR>
      <td valign="top" align="right">&nbsp;</TD>
      <td>&nbsp;</td>
      <td valign="top">&nbsp;</TD>
    </TR>
  </TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




