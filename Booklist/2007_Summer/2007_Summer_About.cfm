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
          <cfset Catalog="zd066">
          <cfset xImage = "PARR-ataturk-small.jpg">
          <cfset xPath = "../../booklist/2007_Summer">
          <CFSET xHEIGHT = "320">
          <CFSET xWidth = "320">
          <cfinclude template="../../templates/imagesizer.cfm">
          <CFSET xCoverHeight = imagecr.height>
          <CFSET xCoverWidth = imagecr.width>
          <cfset xTitle2x="Parrjective">
          <cfset xBorder="1">
          <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
          <a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=ZD066&CFID=5471729&CFTOKEN=67441906"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br>
          <br>
		  <cfset Catalog="zd066">
          <cfset xImage = "PARR-tray-of-tea.jpg">
          <cfset xPath = "../../booklist/2007_Summer">
          <CFSET xHEIGHT = "320">
          <CFSET xWidth = "320">
          <cfinclude template="../../templates/imagesizer.cfm">
          <CFSET xCoverHeight = imagecr.height>
          <CFSET xCoverWidth = imagecr.width>
          <cfset xTitle2x="Parrjective">
          <cfset xBorder="1">
          <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
          <a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=ZD066&CFID=5471729&CFTOKEN=67441906"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br>
          <br>
          <cfset Catalog="zd066">
          <cfset xImage = "ZD066B.jpg">
          <cfset xPath = "../../booklist/2007_Summer">
          <CFSET xHEIGHT = "120">
          <CFSET xWidth = "120">
          <cfinclude template="../../templates/imagesizer.cfm">
          <CFSET xCoverHeight = imagecr.height>
          <CFSET xCoverWidth = imagecr.width>
          <cfset xTitle2x="Parrjective">
          <cfset xBorder="0">
          <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
          <a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=ZD066&CFID=5471729&CFTOKEN=67441906"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a></cfoutput> </p> 
      </TD>
      <td width="20">&nbsp; </td>
      <td width="480" valign="top"> <p><b>Parrjective<br>
          </b>Istanbul style, as seen through the lens of Martin Parr.<br>
          BY AVIS CARDELLA<br>
          <br>
          IT WAS WRITER HENRY DAVID THOREAU WHO SAID,<br>
          &#8220;It&#8217;s not what you look at that matters, it&#8217;s what 
          you see.&#8221; And
          while this is an oft-used accolade for many photographers, Martin
          Parr has taken it to another level. His projects have a way of showing 
          us things that are right in front of us but that often go unseen,
          of showing us what others choose to ignore. His unique eye for
          modern society&#8217;s foibles, follies and globalization&#8217;s attendant
          ironies has won him much-deserved praise during the past two
          decades. Often shot at close range and utilizing garish color, Parr&#8217;s
          photographs are distinct and at times disturbing, cutting close to
          the bone with enough humor to make it palatable.<br>
          <br>
          While he has had his share of detractors&#8212;accusations typically
          range from &#8220;exploitation&#8221; to being just plain mean&#8212;overall, 
          his
          talent is greatly admired. He has even managed to win the affections
          of the fashion world, a notoriously snobby world that fields
          its own fair share of accusations of exploitation and exclusivity.
          Fashion Magazine was Parr&#8217;s 2005 parody of fashion publications,
          rife with self-referential fun-poking and high jinks (Parr appears as
          the cover model in a goofy self-portrait, for example), and the
          publication has quickly become a fashionista collector&#8217;s item.<br>
          <br>
          Parr has also frequently been hired by international brands for commercial 
          assignments. One such clothier, Mavi jeans, has been so smitten with 
          Parr&#8217;s work that they have commissioned him on several occasions 
          to photograph their seasonal campaigns. Now, in celebration of the Istanbul-based 
          manufacturer&#8217;s fifteenth birthday, Mavi (which means &#8220;blue&#8221; 
          in Turkish) has collaborated with Parr to
          produce a photobook titled Parrjective: Style Hunting in Istanbul.<br>
          <br>
          Jacketed in vivid turquoise faux velveteen, Parrjective contains more 
          than 100 images. Shot in the streets of Istanbul over four days, the 
          images cover familiar Parr territory. There are portraits, primarily 
          of 35 Turkish style-setters hand-picked by Mavi, a few shots of Istanbul 
          street youth and several still-life images, mostly involving food and 
          bazaar-stall items.<br>
          <br>
          According to Mavi&#8217;s Elif Akarlilar, Parrjective is a natural outcome
          of two dovetailing philosophies. First, Parr&#8217;s, which she
          describes as being unafraid of the current moment. &#8220;He understands
          and enjoys consumer culture and is brave enough to go into
          the street and get close to the ordinary and create something that
          is totally unique,&#8221; she explains. And second, Mavi&#8217;s, which 
          is proud
          of &#8220;not being exclusive and being in touch with the street.&#8221;<br>
          <br>
          Being in touch with the street is the backbone of Parr&#8217;s oeuvre. 
          Throughout his career, most of his photographs have been created in 
          public places like shopping centers, beachside resorts, parking lots 
          and city sidewalks. His photographs of Britons on vacation, for example, 
          are priceless for their spot-on depiction of the happy holiday-makers, 
          in all their pale-skinned glory, displaying their distinctly British 
          manners, (or lack thereof ).<br>
          <br>
          That said, what, if anything, does Parr&#8217;s &#8220;style hunt&#8221; 
          in the
          streets of Istanbul reveal? Not surprisingly, the search for a unique
          Istanbul style appears to have come up globalized and teeming with ingredients 
          of the urban one-world melting pot. Nike baseball caps, pierced lips, 
          hoodies, tight jeans, cargo pants, little black dresses and the ubiquitous 
          pet Chihuahua all make an appearance. Parr&#8217; lens searched for, 
          and found, a few subjects with quirky, Turkishstyle tics: dropped-crotch 
          harem-pants paired with Converse sneakers, for instance, look cool and 
          may also inadvertently illustrate the East-West push-pull that is so 
          much a part of Turkey&#8217;s history.<br><br> 
		  Parr balances the bounty with 
          still-life shots of items for sale at shops and open-air markets: a 
          display of neatly folded local newspapers, vintage LPs from long-forgotten 
          Turkish pop stars, cans of Yaksi sardines and colorful pillow-shaped 
          hard candies on display in cylindrical glass jars. All look undeniably 
          Turkish.<br><br> The one page of introductory text to Parrjective describes 
          Parr's photography as being neither subjective nor objective, thus the 
          book&#8217;s inventive title. If the term &#8220;Parrjective&#8221; 
          could be further defined, it would simply be synonymous with &#8220;a 
          mirror for society,&#8221; that keenest of observers. The success of 
          Parrjective as a project is in how deftly Parr has honed in on what&#8217;s 
          happening there. But he is, after all, just doing what he has always 
          done. He sees what&#8217;s going on rather than merely looking at it. 
          And then he takes the shot. </p>
        <p><em>Parrjective: Style Hunting in Istanbul</em>. Photographs by Martin 
          Parr. Introduction by &Iacute;zzeddin &Ccedil;alislar. Mavi Jeans, Istanbul, 
          2007. Designed by Esen Karol. Printed by Mas Matbaacilik A.S. Clothwrapped 
          boards with printed belly-band. 132 pp., 102 four-color illustrations, 
          9&frac34; &times; 12&frac34; $60.00<br>
          <BR />
          <a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=ZD066&CFID=5471729&CFTOKEN=67441906">Order</a> 
          <em>Parrjective: Style Hunting in Istanbul</em>.<br>
          <br>
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE031">Order</a> 
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




