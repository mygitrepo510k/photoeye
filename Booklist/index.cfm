<cflocation url="http://www.photoeye.com/magazine/index.cfm">

<!---<CFPARAM NAME="Season" DEFAULT="Spring">
<CFPARAM NAME="Year" DEFAULT="2007">

<CFSET xPage="photo-eye booklist">
<CFSET xTitle="Magazine">
<CFSET xPathToRoot="../">
<CFSET xShowBackButton = 1>
<CFPARAM NAME="Page" DEFAULT="Photo-Eye Booklist">

<cfinclude template="../templates/Header.cfm">
<DIV ALIGN="CENTER">

	<CFSET xFontColor = "Black">
	
	<CFIF Page is "Reviews">
		<CFSET xSubTitle = "New Books Reviewed">
	<CFELSEIF Page is "Contact">
		<CFSET xSubtitle = "Contact Us">
	<CFELSEIF Page is "BackIssues">
		<CFSET xSubtitle = "Back Issues">
	<CFELSE>
		<CFSET xSubTitle=Page>
	</CFIF>
	
	 <CFINCLUDE TEMPLATE="../templates/Title.cfm">
	<!---<CFOUTPUT>#xHTMLTitle#</CFOUTPUT> <br>--->
<FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" style="font-size:14 px" COLOR="##333333"> 
 <br /> <strong><font size="3">photo-eye <font color="Maroon">Magazine</font></font></strong><br /><br />The International Magazine of Photography Books<br /><br /><em>Launching in July!</font> </em><br>
  <br>
<!--- 	<FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" style="font-size:30px" COLOR="##333333">
	 <strong>photo-eye Booklist</strong>
	</font> --->
	<!---<cfinclude template="include_menu.cfm">--->
<br><br>
<!---<TABLE WIDTH="700"><TR>
      <td width="276" valign="top"><img src="PE033.jpg" width="288" height="374"> 
        <BR>
        <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><br>
        &quot;With the number of important photography books increasing every 
        year, a selective, intelligent, and lively guide to the best of those 
        titles has never been so essential. The <em>photo-eye Booklist</em> fills 
        that bill quite nicely. <br>
        Without it, I&#8217;d be lost.&quot; &#8212;Vince Aletti </font> 
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">&quot;</font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">The 
          <em>photo-eye Booklist</em> is an indispensable source to identify current 
          publications in photography. Even more important, in terms of discrimination 
          and selection, are the insightful comments on new titles.&quot; <br>
          &#8212;Peter C. Bunnell, McAlpin Professor Emeritus, Princeton University</font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">&quot;The 
          people at photo-eye bring more than knowledge, more than experience; 
          they bring love and passion to their viewpoint. The <em>photo-eye Booklist</em> 
          is the equivalent of having a dear friend with more time than I, and 
          a broader perspective to point out treasures while their bindings are 
          new and the ink still fresh.&quot;&#8212;Frish Brandt, Director, Fraenkel 
          Gallery</font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE033">Order</a>  
		  the current issue of <i>photo-eye Booklist</i>. </font></p>
        </td>    
      <td width="27">&nbsp; </td>
      <TD width="381" ALIGN="LEFT">LETTER FROM THE EDITOR<BR>
        <p align="left"><em>A photobook is an autonomous art form, comparable 
          with a piece of sculpture, a play or a film. The photographs lose their 
          own photographic character as things &#8220;in themselves&#8221; and 
          become parts, translated into printing ink, of a dramatic event called 
          a book. </em>&#8212;Dutch photography critic Ralph Prins</p>
        <p align="left">For the past five years, this magazine has been a celebration 
          of the &#8220;dramatic event called a book.&#8221; The landscape of 
          photobook publishing has changed and expanded rapidly over the course 
          of the last fifteen years, with exciting new publishing companies cropping 
          up around the globe. It has been a joy to survey that landscape and 
          to provide you&#8212;our readers and avid collectors&#8212;with commissioned 
          reviews and interviews by photographers and wri ters on some of the best 
          titles out there.</p>
        <p align="left">The primary and most fundamental function of the arts 
          is to engage their audience and spark dialogue, in whatever manner seems 
          best. This journal has attempted to do just that, by creating a space 
          for reflection and insight, and providing an opportunity for conversation 
          and questions to sprout and find life within the broader context of 
          contemporary photography and the visual arts.</p>
        <p align="left">Our cover image is by Lisa Robinson from her series and 
          first monograph <em>Snowbound</em>, accompanied by an interview with 
          Patrick Amsellem, associate curator of photography at the Brooklyn Museum. 
          I have followed Lisa&#8217;s work for the past three years while she 
          searched for a publisher, and am proud to feature the work and congratulate 
          Kehrer Verlag for believing in it. Having been raised myself in a village 
          in Eastern Iowa, it also brings me pleasure to feature an interview 
          with Danny Wilcox Frazier, winner of this year&#8217;s Honickman First 
          Book Prize in Photography. Frazier is also a native Iowan and his work 
          brilliantly distills the experience of life on the farms and in the 
          small towns that dot that agrarian and mythical landscape.</p>
        <p align="left">As always, our intention with this photography magazine-<em>cum</em>-book 
          journal is to inspire dialogue and discuss inspiration. We hope you 
          enjoy the issue.</p>
        <p> DARIUS HIMES, Editor</p>
        <BR>
        <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong><font color="NAVY">WINTER 
        2007 <font size="2">&middot; TABLE OF CONTENTS</font></font></strong><BR>
        <BR>
        <A HREF="../Booklist/2007_Winter/2007_Winter_About.cfm" style="color: Maroon"><strong>About 
        Our Cover (full text)</strong></A><BR>
        Lisa Robinson&#8217;s first monograph is a quiet meditation on Winter. 
        <br>
        » INTERVIEW BY PATRICK AMSELLEM<br>
        </FONT> <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><A HREF="../Booklist/2007_Winter/2007_Winter_Eye_on _P.cfm" style="color: Maroon"><strong>Eye 
          on Publishers (full text) </strong></A><BR>
          One by one, we interview the publishers of the books we love.<br>
          » A PHOTO-EYE QUESTIONNAIRE<br>
          <BR>
          <A HREF="../Booklist/2007_Winter/2007_Winter_Survey.cfm" style="color: Maroon"><strong>Survey 
          of New Books</strong> </A><BR>
          </FONT><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">The 
          quarterly survey of the best new photography books.<br>
          » BY VARIOUS CONTRIBUTORS<BR>
          <br>
          <A HREF="../Booklist/2007_Winter/2007_Winter_Tolstoy.cfm" style="color: Maroon"><strong>In 
          the Shadow of Genius</strong></A><BR>
          Countess Sophia Tolstoy was an avid photographer.<br>
          Leah Bendavid-Val presents her work in a touching new volume.</FONT><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><br>
          » INTERVIEW BY DARIUS HIMES<BR>
          <br>
          <A HREF="../Booklist/2007_Winter/2007_Winter_Danny_Frazier.cfm" style="color: Maroon"><strong>Driftless</strong></A><BR>
          Danny Wilcox Frazier wins the Center for Documentary Studies/ Honickman 
          First Book Prize in Photography for his work in Iowa.<br>
          » INTERVIEW BY MARY ANNE REDDING</FONT></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          <A HREF="../Booklist/2007_Winter/2007_Winter_Roving_Eye.cfm" style="color: Maroon"><strong>Roving 
          Eye</strong></A><BR>
          Our Paris-based correspondent goes to Arles!<br>
          » BY AVIS CARDELLA<br>
		  <br>
          <A HREF="../Booklist/2007_Winter/2007_Winter_Publishing.cfm" style="color: Maroon"><strong>Publishing 
          the Photography Book</strong></A><BR>
          The acclaimed column on publishing photography books. <br>
          » BY MARY VIRGINIA SWANSON AND DARIUS HIMES</FONT><br>
                    </font> </FONT> <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><br>
          <A HREF="../Booklist/2007_Winter/2007_Winter_Editor's_Choice.cfm" style="color: Maroon"><strong>Editor’s 
          Choice</strong></A><BR>
          This issue's editor reviews a singular title of the season.<br>
          » BY DARIUS HIMES</font></p>
        <p><strong><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">CO</font></strong><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>NTRIBUTORS</strong></font></p>
        <p>PATRICK AMSELLEM is the associate curator of photography at the Brooklyn 
          Museum. Born in Sweden, he has
          written extensively on art and architecture for newspapers and magazines 
          since 1993. He received a Ph.D. in art History from New York University&#8217;s 
          Institute of Fine Arts.<br>
          <br>
          LEAH BENDAVID-VAL is a writer and curator of photography and as senior 
          editor for National Geographic Books. She has been project director 
          for more than a dozen books for National Geographic, has written about 
          photography for the <em>Washington Post</em>, edited photography for 
          <em>U.S. News &amp; World Report</em>, <em>Science</em> magazine, <em>National 
          Wildlife</em>, and others, and has curated photography exhibitions for 
          the Corcoran Gallery of Art and the National Geographic Society. </p>
        <p>AVIS CARDELLA is a freelance writer specializing in the areas of photography, art and pop culture. Her work has appeared 
          in various publications, including <em>American Photo</em>, <em>ArtReview</em>, <em>Picture</em>, 
          <em>Surface</em> and <em>British Vogue</em>. A born and bred New Yorker, she currently 
          resides in Paris, France.</p>
        <p>DEBRA KLOMP CHING gained her M.A. in Critical History and Theory of 
          Photography from the University of Derby UK). The former Director of 
          Pavilion (UK), she now resides in New York, where she is a freelance 
          writer and the co-owner and director of KLOMPCHING Gallery (www.klompching.com).</p>
        <p>DANNY FRAZIER is a freelance photographer with Redux Pictures. He has 
          a master&#8217;s degree from the University of Iowa, and he has received 
          awards from the University of Missouri&#8217;s Pictures of the Year 
          International, including its 2004 Community Awareness Award for selections 
          of his work from Iowa. He has also received a Stanley Fellowship, as 
          well as awards from the National Press Photographers Association and 
          the Society of Professional Journalists. His images have appeared in 
          such publications as <em>The New York Times</em>, <em>Time</em>, <em>Newsweek</em>, 
          <em>Mother Jones</em>, <em>U.S. News &amp; World Report</em>, <em>Life</em>, 
          and <em>Forbes</em>.</p>
        <p>MARY GOODWIN is an M.F.A. candidate in
          photography at the University of New Mexico.
          She was a guest student at the Hochschule f&uuml;r 
          Graphik und Buchkunst in Leipzig, Germany, 
          in the Summer 2006 semester.</p>
        <p>PHIL HARRIS is a photographer, teacher and writer who lives in Portland, 
          Oregon. In 2000, he published a twenty-year photographic retrospective 
          book, <EM>Fact Fiction Fabrication</EM>.</p>
        <p>PAUL KRANZLER is a Linz-based photographer and artist. He has published 
          two books, <em>Land of Milk and Honey</em> and <em>Tom</em>, both published 
          by Fotohof Editions. Born in 1979 in Austria, he was educated at the 
          University for Arts &amp; Industrial Design in Linz. He has also worked 
          with photographer Nick Waplington in London. Visit him at www.paulkranzler.com.</p>
        <p>LARISSA LECLAIR is a photographer, writer and traveler. Her work focuses 
          on visual history and culture, and international photography. She lives 
          in the Washington, D.C. area.</p>
        <p>HANNAH NEWBURN, an editorial assistant with this magazine, is an art 
          historian and photographer based in Santa Fe.</p>
        <p>ALAN RAPP is a design and photography book editor based in San Francisco. 
          His writing also appears in <em>Dwell</em> and <em>San Francisco </em>magazine.</p>
        <p>MARY ANNE REDDING is the curator of photography at the Palace of the 
          Governors/New Mexico History Museum in Santa Fe, New Mexico. Previous 
          professional experience includes authoring essays for numerous exhibition 
          catalogues and stints at New Mexico State University, the Light Factory, 
          the Center for Creative Photography, the Art Institute of Chicago and 
          Northlight Gallery at Arizona State University.</p>
        <p>LISA ROBINSON is a Fulbright Fellow and has completed artist residencies 
          at Light Work and the MacDowell Colony. Her work has been widely exhibited 
          internationally, most recently at Museo de Arte Contemporaneo in Santiago, 
          Chile; Centro Cultural Recoleta in Buenos Aires, Argentina; and Museo 
          Tambo Quirquincho in La Paz, Bolivia. <em>Snowbound</em> will be exhibited 
          this fall at Etherton Gallery in Tucson, Arizona, and in January in 
          New York at KLOMPCHING Gallery.</p>
        <p>GEORGE SLADE is the artistic director and lead<br>
          curator of the Minnesota Center for Photography, located<br>
          in &#8220;Nordeast&#8221; Minneapolis (www.mncp.org). He is a<br>
          committed photo-bibliophile and a Minnesotan by birth.</p>
        <p>MARY VIRGINIA SWANSON is an author, educator and consultant committed 
          to helping photographers advance their careers. She lives and works 
          in Tucson and New York City. Visit her at www.mvswanson.com.</p>
        <p>&nbsp; </p>
        <p><br>
          <br></FONT>
          </p>
        <p><br>
        </p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          </FONT> </p></TD>
</TR></TABLE>--->



</DIV>

<BR>
<cfinclude template="../templates/footer_site.cfm">--->




