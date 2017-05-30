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


<FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333">

<cfset xmenupath="../">
 <cfinclude template="../include_menu.cfm">
 <br /><br />
 
  <TABLE WIDTH="700">
    <TR> 
      <td colspan="3" align="center"> <p><font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>DRIFTLESS<br>
          <br>
          </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>In 
          an interview with MARY ANNE REDDING, Iowa photographer DANNY WILCOX 
          FRAZIER reveals the very personal impetus behind his prize-winning photographic 
          project about the land of his birth..</strong></font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>INTERVIEW 
          BY MARY ANNE REDDING<br />
          </strong></font></p>
        </td>
    </tr>
    <tr> 
      <td colspan="3">&nbsp; </td>
    </tr>
      <td width="400" valign="top" align="right"> <p> <cfoutput> 
    
            <br>
            <cfset xImage = "Driftless_interior.jpg">
            <cfset xPath = "../../booklist/2007_Winter">
            <CFSET xHEIGHT = "320">
            <CFSET xWidth = "320">
            <cfinclude template="../../templates/imagesizer.cfm">
            <CFSET xCoverHeight = imagecr.height>
            <CFSET xCoverWidth = imagecr.width>
            <cfset xTitle2x="Driftless">
            <cfset xBorder="0">
            <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
            <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DU027"> <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DU027"> 
            <img src="Driftless_interior.jpg"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="213" WIDTH="320"></a> 
            <br>
            <br>
				<cfset xImage = "Driftless_cover.jpg">
            <cfset xPath = "../../booklist/2007_Winter">
            <CFSET xHEIGHT = "120">
            <CFSET xWidth = "120">
            <cfinclude template="../../templates/imagesizer.cfm">
            <CFSET xCoverHeight = imagecr.height>
            <CFSET xCoverWidth = imagecr.width>
            <cfset xTitle2x="Driftless_Cover">
            <cfset xBorder="0">
            <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
            <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DU027"><img src="Driftless_cover.jpg"  alt="'#xTITLE2X#'"  border="#xBorder#" style="border-color: #aBorderColor#" height="120" width="92"> 
            </a> <br>
            <br>
          </cfoutput> </p></TD>
    <td width="20">&nbsp; </td>
      <td width="480" valign="top"> <p>BY WRITING THE POETIC FOREWORD to Driftless, 
          Robert Frank is doing for Danny Wilcox Frazier what Jack Kerouac did 
          for him 50 years ago when Kerouac wrote the introduction to <em>The 
          Americans</em>. As the juror for the 2006 Center for Documentary Studies/Honickman 
          First Book Prize in Photography, Robert Frank selected Frazier&#8217;s 
          work from 400 entries to receive $3,000 in cash, the publication of 
          his first book, and inclusion in the biennial prizewinner&#8217;s exhibition.</p>
        <p><br>
          Frank was an outsider and an immigrant when he traveled across America 
          on a Guggenheim Fellowship in 1955/56. On the road in a secondhand car, 
          Frank looked with one skeptical eye and one romantic eye at his new 
          country. The work he produced was out of focus, coolly removed and all 
          jangled angles. This displaced itinerant photographer was also moved 
          by what he saw; there is a gentleness in the gritty melancholy of his 
          images.</p>
        <p> In contrast to Frank, Frazier is an insider. He grew up in Le Claire, 
          Iowa, a small Mississippi River town. A freelance photographer who now 
          travels the world, Frazier maintains his American roots. Married with 
          two young children, he lives in Iowa City, where he has taught at the 
          University of Iowa. Frazier is, admittedly, influenced by Frank&#8217;s 
          tentative and imperfect imagery. When he first saw <em>The Americans</em>, 
          he recognized his world: &#8220;I was blown away by it. Not necessarily 
          because I understood the photography completely, but because I had lived 
          it&#8212;it reflected how I felt about the world around me. I connected 
          to the emotion of the photographs. And I was completely hooked.&#8221; 
        </p>
        <p><br>
          Making pictures in rural Iowa for four years, Frazier knows firsthand 
          the economic and cultural struggles currently playing out in the Midwest. 
          The black-and-white images poignantly capture the tension of lives in 
          transition. There are lots of guns, dead animals, and, similar to Frank&#8217;s 
          imagery, parades and American flags permeate the pictures. The seemingly 
          careless framing of Frazier&#8217;s photographs shares the same poetic 
          grittiness of Frank&#8217;s in that it sets up a subconscious tension 
          in the viewer.</p>
        <p>A BRIEF CONVERSATION WITH DANNY WILCOX FRAZIER: <br>
          <strong>Mary Anne Redding: </strong>I find one of the most intriguing 
          images in the book to be the image of the toy farmyard. It is the only 
          image where you are not observing &#8220;real life&#8221;; rather the 
          child&#8217;s toys are a simulacrum or stand-in for Iowa&#8217;s farms. 
          What were your motivations for taking this image and including it in 
          the book?<br>
          <strong><font color="#006600">Danny Wilcox Frazier:</font></strong> 
          Iowa, and all of the Midwest, occupies a sentimental and symbolic part 
          of our nation&#8217;s consciousness. The iconic images of Iowa painted 
          on canvas or projected on screens show us a place that no longer exists, 
          if it ever did&#8212;a fantasy of tranquility, of simpler times, a settled 
          landscape full of passive people. Life in Iowa can be punishing. Many 
          Iowans expend their lives sweating over soil and spilling the blood 
          of livestock; they endure the hardships associated with a life inextricably 
          bound to the ups and downs of nature. With my work I am trying to say, 
          here is real life, dilapidated and unpolished. The photo you mention 
          is my one reference to that fairy-tale notion of rural life, and like 
          the plastic figures in the image, it is a fiction.</p>
        <p>&#8230;
        <p><em>Driftless: Photographs From Iowa</em>. Photographs by Danny Wilcox 
          Frazier. Foreword by Robert Frank. Duke University Press in association 
          with the Center for Documentary Studies, Durham, 2007. Hardbound with 
          printed dustjacket. 120 pp., 80 duotone, 9 &times; 12 $39.95</p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">Continue 
          reading this interview by <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE033
		 ">ordering</a> the current issue of <i>photo-eye Booklist</i>. </font><br>
          <br>
          <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DU027">Order</a> 
          <em>Driftless: Photographs from Iowa</em> <br>
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




