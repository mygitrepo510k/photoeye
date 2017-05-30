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
      <td colspan="3" ALIGN="CENTER"><p><strong><font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><br>
          <br>
          EYE ON PUBLISHERS: Harry N. Abrams, Inc.<br>
          </font></strong></p>
        <p><strong><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">One 
          by one, we interview the publishers of the books we love.</font></strong></p>
        <strong><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">A 
        PHOTO-EYE QUESTIONNAIRE</font></strong></td>
    </tr>
<tr><td colspan="3" ALIGN="CENTER">&nbsp;</td></tr>
<TR>
 
 
    <td width="298" valign="top" align="right">
 <p>
	  <cfoutput>
	  <cfset xImage = "ABRAMS_PROFILE.jpg">
	<cfset xPath = "../../booklist/2007_Fall">
	<CFSET xHEIGHT = "1000">
	<CFSET xWidth = "1000">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Abrams images">
	<cfset xBorder="0">
            <a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=58"><img src="ABRAMS_PROFILE.jpg"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="220" WIDTH="140"></a> 
            <br>
            <br>
</cfoutput>
 </p>
      </TD>
   <td width="20">&nbsp;
  </td>
      <td width="480" valign="top"> <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          <em>PHOTOGRAPHERS AND PUBLISHERS form the X<br>
          and Y axes upon which great photobooks are crafted. This column explores 
          the vast continuum of publishers that exists in the world today, from 
          small art presses to mid-size publishers to the large houses that have 
          survived the decades. In this issue we spoke with Deborah Aaronson, 
          executive editor at Abrams, an imprint of Harry N. Abrams, Inc.</em></font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>What 
          is your vision of photography and publishing?</strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><br>
          Our goal is to be the preeminent publisher of both serious and popular 
          photography. And part of that goal is to marry great photography with 
          subjects that people are passionate about. The traditional photography 
          monograph is difficult to publish these days; the marketplace is very 
          crowded and it&#8217;s hard for a book with a modest print run (which 
          these books so often have) to make an impact. So although we still publish 
          monographs, we do so very selectively. In the recent past we&#8217;ve 
          published the work of Richard Avedon, Carol Beckwith and Angela Fisher, 
          Harry Benson, Ilse Bing, Karl Bissinger, Yann Arthus Bertrand, Gregory 
          Crewdson, Lennart Nilsson, Shawn Mortensen and William Wegman. And we&#8217;ve 
          also published photography books about jazz, undersea life, the Burning 
          Man Festival, Japanese sex clubs, African predators and much more. </font></br> 
        </p>
        <p><br>
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>Who 
          do you see as your audience?</strong></font> <br>
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">We 
          publish for both people who are devoted to and passionate about photography, 
          and also for a more general audience&#8212; people who may not necessarily 
          think of themselves as photography aficionados, but who are interested 
          in visual culture or in a particular subject. </font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>What 
          quantity of books do you publish per year/season?</strong> Abrams publishes 
          about 85 books a year; approximately 25% of those are photography or 
          photography-related books. </font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>How 
          do you acquire new titles? </strong></font><br>
        <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">At 
          the editorial level, it happens in one of two ways. We actively pursue 
          photographers whose work we are interested in. And we&#8217;re constantly 
          looking at the work of photographers who contact us directly. </font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>What 
          future projects really excite you right now?</strong> </font><br>
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          This fall we have a new Slim Aarons book,<em> Poolside with Slim Aarons</em>; 
          <em>The Last Photographic Heroes</em>, an amazing collection of American 
          photographers from the 60s and 70s; <em>Storm Chaser</em> by extreme-weather 
          photographer Jim Reed; <em>Vanishing World</em>, a thought-provoking 
          book about the impact of global warming on the Arctic; <em>Tribes of 
          the Great Rift Valley</em> by renowned photojournalist Elizabeth L. 
          Gilbert; <em>Rock and Roll</em> by Lynn Goldsmith; and <em>Americans 
          in Space</em> , a tremendous<br>
          book about NASA&#8217;s first 50 years, with many never-beforeseen<br>
          photographs. And in the works is a new monograph by<br>
          Gregory Crewdson, a spectacular Richard Avedon book, and<br>
          a really fun and sexy book by Richard Kern.</font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><br>
          <strong>What are your submission guidelines?</strong><br>
          We&#8217;re relatively open to looking at material in different<br>
          ways: as loose prints, as high-quality color xeroxes, in layouts,<br>
          or in a book dummy. It is, of course, important for<br>
          the images to be accompanied by a written proposal that<br>
          explains what the idea behind the book is, some background<br>
          information about the photographer, and any other<br>
          information that might be helpful in making a decision<br>
          (exhibition plans, etc.), Although we will accept material on<br>
          disc, it should be accompanied by a printout. Our submission<br>
          policy is spelled out more fully on our website:<br>
          www.hnabooks.com.</font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong><br>
          Contact Information:</strong><br>
          Deborah Aaronson, daaronson@hnabooks.com<br>
          To see a list of the publishers to be featured in this column:<br>
          www.photoeye.com/templates/PubShowCase_home.cfm</font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>To 
          see a list of the publishers to be featured in this column</strong> 
          <a href="http://www.photoeye.com/templates/PubShowCase_home.cfm">click 
          here.</a> </font><br>
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><br />
          <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE032">Order</a> 
          the current issue of <i>photo-eye Booklist</i>. </font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">
		<a href="http://www.photoeye.com/booklist/subscribe.cfm" target="_blank">Subscribe</a> 
          to the <i>photo-eye Booklist</i></font>.<br>
        </p>
        </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




