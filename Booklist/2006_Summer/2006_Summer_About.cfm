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
          <cfset Catalog="ZC711">
          <cfset xImage = "HACKNEY-WICK-BOOKLIST-COVER.jpg">
          <cfset xPath = "../../booklist/2006_Summer">
          <CFSET xHEIGHT = "300">
          <CFSET xWidth = "300">
          <cfinclude template="../../templates/imagesizer.cfm">
          <CFSET xCoverHeight = imagecr.height>
          <CFSET xCoverWidth = imagecr.width>
          <cfset xTitle2x="Hackney Wick">
          <cfset xBorder="1">
          <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
          <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=ZC711"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br>
          <br>
          <cfset Catalog="ZC711">
          <cfset xImage = "HackneyWick_cover.jpg">
          <cfset xPath = "../../booklist/2006_Summer">
          <CFSET xHEIGHT = "120">
          <CFSET xWidth = "120">
          <cfinclude template="../../templates/imagesizer.cfm">
          <CFSET xCoverHeight = imagecr.height>
          <CFSET xCoverWidth = imagecr.width>
          <cfset xTitle2x="Hackney Wick">
          <cfset xBorder="0">
          <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
          <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=ZC711"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a></cfoutput> </p> 
      </TD>
      <td width="20">&nbsp; </td>
      <td width="480" valign="top"> <b>Ordinary Pictures.<br>
        </b>Stephen Gill's <i>Hackney Wick</i>. BY AVIS CARDELLA<br> <br>
        IT&#8217;S EASY TO MISTAKE Stephen Gill&#8217;s latest book, <i>Hackney 
        Wick</i>, for a collection of ordinary snapshots, something an ambitious 
        amateur may have pieced together in a hurry&#8212;click, click, click&#8212;some 
        random street portraits, some nature, some blurry and sun-flared stuff.
<p> But deceptively ordinary images are Gill&#8217;s forte. This young 
          Briton has built a reputation as an astute documentarian of urban England, 
          whose previous books have included social surveys of such mundane subjects 
          as road works, women pushing shopping carts and people listening to 
          their walkmans. </p>
        <p> In this publication, Gill turns his lens on the East London neighborhood 
          Hackney Wick, in particular the former Sunday market frequented by many 
          of the area&#8217;s immigrant population. After having purchased a plastic 
          camera for 50 pence at one of the market stalls, he proceeded to photograph 
          what he describes as &#8220;items on sale that looked like scrap,&#8221; 
          which seemed to exist for &#8220;people who were struggling to keep 
          afloat themselves.&#8221; </p>
        <p> Indeed, these images depict a no-man&#8217;s land of detritus&#8212;heaps 
          of cast-off white goods, squadrons of old televisions, blankets of junked-out 
          electronics with missing parts and frayed wires&#8212;along with an 
          eclectic cast of characters who are both buying and selling it all. 
        </p>
        <p> Yet, Gill&#8217;s camera hones in on all the chaos and clutter from 
          a uniquely poetic angle. He manages to find the melancholic, humorous 
          and ironic within this sprawling exchange: a mountain of abandoned exercise 
          machines, chairs and bicycles looks like an avant-garde modern sculpture; 
          an ice-cream vendor hanging a sign outside her van appears to have suddenly, 
          and rather awkwardly, collapsed; a potbellied mechanic peering under 
          the hood of his car has coincidentally broken down in front of a billboard 
          depicting a more svelte &#8220;champion&#8221; version of himself.</p>
        <p> Like fellow British photographer Martin Parr, Gill takes jabs at modern 
          Britain. But where Parr highlights human foibles in glaring sunlight 
          and high-voltage color, Gill opts for more subtle exposure. Colors are 
          muted, softened, and so is the message. His camera seems to have a soft 
          spot for his subjects and, aptly, his photographs have been described 
          as &#8220;human&#8221; and &#8220;mercifully lacking in malevolence.&#8221;</p>
        <p> In the book&#8217;s text Gill writes that for him Hackney Wick &#8220;especially 
          reflects the great diversity that is London.&#8221; Interspersed between 
          pages and pages of his social studies are photos of the nature that 
          mysteriously, and almost miraculously, still surrounds Hackney Wick. 
          Wild roses grow amidst the milkweed, garden allotments are secretly 
          tended, and swans swim in the Grand Union Canal. The juxtaposition of 
          nature&#8217;s simplicity against the chaos of man-made environments 
          reflects this place&#8217;s particular diversity as well.</p>
        <p> But Gill laments that the area is about to undergo more change. Hackney 
          Wick will be the site of London&#8217;s 2012 Olympic games. While he 
          acknowledges that this will bring good things, such as much-needed transport 
          lines and infrastructure, there will inevitably be losses. The market 
          has already been closed down for years, the stadium where it took place, 
          long destroyed. Secret gardens, home to many birds and animals, will 
          disappear. How the ordinary residents of Hackney Wick will cope with 
          such an extraordinary event coming to their part of town is anyone&#8217;s 
          guess. . . which makes Gill&#8217;s perfectly ordinary photographs of 
          them, and this place, all the more meaningful. <br>
          <br />
          <i>Hackney Wick</i>. Photographs by Stephen Gill. Nobody, London, in association 
          with the Archive of Modern Conflict, 2005. Designed by Melanie Mues. 
          Printed by EBS, Italy. Illustrated cloth binding. Edition of 1500 and 
          100 signed and numbered copies with type-C print in a slipcase (sold 
          out). 124 pp., with 1 trifold and an additional printed section including 
          flowers and pictures from Hackney Wick and paintings by Laure Prouvost, 
          9 x 9 $69.00 <br>
        </p>
        <BR /> <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=ZC711"><strong>Order</strong></a> 
        <i>Hackney Wick</i>.</TD>
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




