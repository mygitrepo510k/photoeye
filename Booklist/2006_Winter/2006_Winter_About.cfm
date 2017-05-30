<CFPARAM NAME="Season" DEFAULT="FALL">
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
          <cfset xImage = "hokkaido-big.jpg">
          <cfset xPath = "../../booklist/2006_Winter">
          <CFSET xHEIGHT = "320">
          <CFSET xWidth = "320">
          <cfinclude template="../../templates/imagesizer.cfm">
          <CFSET xCoverHeight = imagecr.height>
          <CFSET xCoverWidth = imagecr.width>
          <cfset xTitle2x="Hokkaido">
          <cfset xBorder="1">
          <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
          <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=tr197"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br>
          <br>
          <cfset Catalog="tr197">
          <cfset xImage = "tr197b.jpg">
          <cfset xPath = "../../booklist/2006_Winter">
          <CFSET xHEIGHT = "120">
          <CFSET xWidth = "120">
          <cfinclude template="../../templates/imagesizer.cfm">
          <CFSET xCoverHeight = imagecr.height>
          <CFSET xCoverWidth = imagecr.width>
          <cfset xTitle2x="Hokkaido">
          <cfset xBorder="0">
          <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
          <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=tr197"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a></cfoutput> </p> 
      </TD>
      <td width="20">&nbsp; </td>
      <td width="480" valign="top"> <p><b>A Shock of Freshness.<br>
          </b>Michael Kenna's stunning study of Hokkaido, Japan.<br> BY AVIS CARDELLA<br>
          <br>
          IF THERE IS ONE BOOK I would like to put in a time capsule, to be preserved 
          and unearthed many, many years from now, it is Michael Kenna&#8217;s 
          newly published Hokkaido, a photographic exploration of the landscape 
          of this remote northern Japanese island. Kenna&#8217;s Hokkaido is, 
          as fellow photographer Daido Moriyama writes in the book&#8217;s introduction, 
          &#8220;a shock of freshness&#8221;; it is a study of humanity without 
          a human in sight; it is captivating and mysterious, and deeply moving. 
          Like Kenna&#8217;s now-legendary book Japan, published in 2003, Hokkaido 
          is simply a beautiful monograph. Perhaps one of the most beautiful ever 
          published. </p>
        <p>But beyond that, what would Hokkaido offer to someone who may be lucky 
          enough to discover it at some point in the future? I like to imagine 
          this exquisitely printed tome being representative of the nature of 
          photography itself. Kenna is a lover of photography and a lover of simple 
          photographic technique. He works with a medium-format camera, and photographs 
          in both daylight and at night. The 84 black-and-white images presented 
          here are void of any pyrotechnics or high-tech manipulations. They have 
          been created over several years under the harshest of weather conditions 
          (Hokkaido, the northernmost of Japan&#8217;s four major islands, is 
          known for its brutal winters). And as the digital age continues to swallow 
          up traditional photographic technique, Kenna&#8217;s images take on 
          an even greater import. It&#8217;s easy to imagine a future where photographs 
          no longer exist, even if photographers do. Yet, the pictures compiled 
          here seem to speak to the purity of the photographic process as it was 
          originally conceived.</p>
        <p>The second compelling element of Hokkaido is Kenna&#8217;s artistic 
          vision as the subject matter. Moriyama (who has also photographed Hokkaido) 
          points out in his introduction that the two photographers&#8217; methods 
          differ dramatically. &#8220;Michael steps outside of emotion to seek 
          out the essence of physical beauty in nature. I take my sentiment with 
          me and focus on people on the streets. I am not suggesting that one 
          approach is better than the other, it is simply a matter of each of 
          us selecting different codes among those that are assigned to photographers.&#8221;</p>
        <p>Kenna&#8217;s selected code of landscape and environment has led him 
          to photograph in far-flung places ranging from England, his homeland, 
          to Auschwitz, to Upstate New York. Yet, in both Japan and Hokkaido he 
          appears to have refined his vision to a new level. A picture of 21 fence 
          posts in the snow reads like a new graphic language, and the image Kato&#8217;s 
          Bench is a visual poem, a haiku. Each of the photos presented here appears 
          weightless and effortless, as if magically pulled through the lens and 
          onto the printed page. The essence of physical beauty is abundant, and 
          yet, without a single human present in front of the camera, Kenna has 
          captured the essence of what it is to commune with nature.</p>
        <p>Perhaps Kenna himself makes the best argument for my time capsule bid. 
          In a 2003 interview in Photo Review magazine he says: &#8220;An aspect 
          of my work relates to memory and time. I am interested in how we interact 
          with our environment and what we leave behind on the planet. I like 
          to photograph traces of our past activities and I try to reflect the 
          atmospheres that remain.&#8221; Hokkaido comes bound in thin maple wood 
          boards and is housed in a slender slipcase. All the better for traveling 
          into the future and bearing traces of activities past.</p>
        <p>Hokkaido. Photographs by Michael Kenna. Introduction by Daido Moriyama. 
          Nazraeli Press, Portland, 2006. Designed by Hideyuki Taguchi. Printed 
          by Toppan, Japan. Edition of 5000.<br>
          Bound in maple boards, in slipcase. 104 pp., 84 duotone plates, 12 x 
          13 $85.00<br>
       
          <BR />
          <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=TR197">Order</a> 
          <i>Hokkaido</i>.<br><br>
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=pe029">Order</a> 
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




