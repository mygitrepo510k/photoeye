<CFPARAM NAME="Season" DEFAULT="Spring">
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
	<CFOUTPUT>#xHTMLTitle#</CFOUTPUT> <br>
  <FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" style="font-size:14 px" COLOR="##333333"> 
  The International Magazine of Photography Books</font> - <em>the only magazine 
  devoted to photography books!</em><br>
  <br>
<!--- 	<FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" style="font-size:30px" COLOR="##333333">
	 <strong>photo-eye Booklist</strong>
	</font> --->
	<cfinclude template="include_menu.cfm">
<br><br>
<TABLE WIDTH="700"><TR>
  <td width="276" valign="top"><img src="../Booklist/2007_Summer/2007-summer-COVER-3D-BIG.jpg" width="276" height="365">
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
          <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE031">Order</a>  
		  the current issue of <i>photo-eye Booklist</i>. </font></p>
        </td>    
      <td width="27">&nbsp; </td>
      <TD width="381" ALIGN="LEFT">LETTER FROM THE EDITOR<BR>
        <p>In my home, on a low-lying bookshelf, I have displayed a humble book 
          published in 1930 with a Rockwell Kent woodcut debossed on the cover. 
          The woodcut depicts a young man leaning against a chest-high tree stump, 
          upon which he has placed the book that he is reading. It is a striking, 
          elegant image that is emblem-atic of the Social Realism he is often 
          associated with. <br>
          <br>
          What continues to strike me about this image is the simple, visual device 
          of letting the book stand-in for the upper reaches of the tree, and 
          in some ways, for the whole tree itself. It is easy to make the leap 
          from the figurative depiction of the book resting on the stump to the 
          metaphorical reading of the book as a source of knowledge, a symbol 
          for the Tree of Knowledge, in other words. <br>
          <br>
          And for an editor of a magazine about books, it is a pretty potent metaphor. <br><br>
          The issue that you hold in your hands is filled with essays and reviews 
          of well-crafted, persuasive, influential books, books that inform and 
          educate and inspire. Several master image-makers are honored on our 
          pages: Richard Woodward reviews two new books about Moholy-Nagy, the 
          Hungarian-born visionary, and Larissa Leclair muses on the steady, powerful 
          voice of South African photographer David Goldblatt. We also have several 
          new voices in the magazine: Jen Bekman, a gallerist from New York, has 
          offered her impressions of an impressive show at the Getty, and Jonanna 
          Widner, a respected and rising young writer on music and pop-culture, 
          contributes a piece on photobooks of specific music scenes. Lastly, 
          I&#8217;m particularly happy to institute a new column at the back of 
          the magazine entitled Editor&#8217;s Choice, which will feature a favorite 
          photobook of the season. <br><br>
          And now for a correction: in our last issue (Spring, 2007), much to 
          our embarrassment, we inadvertently made one of those mistakes that 
          shouldn&#8217;t be made. And, unfortunately, we did it twice. Two fantastic 
          books which we happily reviewed were attributed to the wrong publishers. 
          They were <em>Don&#8217;t Kiss Me</em> (p. 22), a book on the art of Claude Cahun 
          and Marcel Moore, and <em>The Apollo Prophecies</em> (p. 40), with work by the 
          artists known as Kahn &amp; Selesnick. Both of these books were published 
          by Aperture (and if you haven&#8217;t seen them, you should). For the 
          full bibliographic information for these titles, please visit our website. 
          <br><br>
          And, as always, our faithful readers make <em>photo-eye Booklist</em> possible. 
          We thank you for your continued support, and please feel free to send 
          your comments! <br>
          <br>
          DARIUS HIMES, Editor darius@photoeye.com </p>
        <BR>
        <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong><font color="NAVY">SUMMER 
        2007 <font size="2">&middot; TABLE OF CONTENTS</font></font></strong><BR>
        <BR>
        <A HREF="../Booklist/2007_Summer/2007_Summer_About.cfm" style="color: Maroon"><strong>About Our Cover (full text)</strong></A><BR>
        Istanbul style, as seen through the lens of Martin Parr.<br>
        » by Avis Car<br>
        </FONT> <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><A HREF="../Booklist/2007_Summer/2007_Summer_Publisher_Profile.cfm" style="color: Maroon"><strong>Publisher 
          Profile (full text) </strong></A><BR>
          One by one, the publishers of the books we love are interviewed.<br>
          » a photo-eye questionnaire <br>
          <BR>
          <A HREF="../Booklist/2007_Summer/2007_Summer_Survey.cfm" style="color: Maroon"><strong>Survey 
          of New Books</strong> </A><BR>
          </FONT><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">The 
          quarterly survey of the best new photography books.<br>
          » by various contributors<BR>
          <br>
          <A HREF="../Booklist/2007_Summer/2007_Summer_Where_We_Live.cfm" style="color: Maroon"><strong>Where 
          We Live </strong></A><BR>
          The Getty hosts a show that surveys a basic</FONT> <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          human need.<br>
          » by Jen Bekman<BR>
          <br>
          <A HREF="../Booklist/2007_Summer/2007_Summer_Considerable_Sway.cfm" style="color: Maroon"><strong>Considerable 
          Sway</strong></A><BR>
          Two recent titles add depth to the potent vision of Moholy-Nagy.<br>
          » by Richard Woodward<br>
          <br>
          <A HREF="../Booklist/2007_Summer/2007_Summer_Publishing.cfm" style="color: Maroon"><strong>Publishing 
          the Photography Book</strong></A><BR>
          The acclaimed column on publishing photography books. <br>
          » by Mary Virginia Swanson and Darius Himes</FONT> <br>
          <br>
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          <A HREF="../Booklist/2007_Summer/2007_Summer_Old_and_Rare.cfm" style="color: Maroon"><strong>The 
          Old & Rare Survey</strong></A><BR>
          A regular column that surveys important books of the past.<br>
          » by Eric Miles <br>
          <br>
          <A HREF="../Booklist/2007_Summer/2007_Summer_Editor's_Choice.cfm" style="color: Maroon"><strong>Editor’s 
          Choice</strong></A><BR>
          In this new column, our editor reviews a singular title of the season.<br>
          » by Darius Himes</font></p>
        <p><strong><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">CO</font></strong><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>NTRIBUTORS</strong><br>
          <br>
          </font> JEN BEKMAN owns a gallery (www.jenbekman.com), writes a blog 
          called Personism (www.personism.com) and runs a quarterly photo competition, 
          Hey, Hot Shot! (www.heyhotshot.com). Her latest endeavor is 20&times;200 
          (www.20&times;200.com), a place to buy editioned prints and photos at 
          ridiculously affordable prices. </p>
        <p>AVIS CARDELLA is a freelance writer specializing in the areas of photography, art and pop culture. Her work has appeared 
          in various publications, including <em>American Photo</em>, <em>ArtReview</em>, <em>Picture</em>, 
          <em>Surface</em> and <em>British Vogue</em>. A born and bred New Yorker, she currently 
          resides in Paris, France.</p>
        <p>DEBRA KLOMP CHING gained her M.A. in critical history and theory of 
          photography from the University of Derby (UK) in 1998. The former director 
          of Pavilion (UK), she now resides in New York, where she is an independent curator, writer and photographer. </p>
        <p>ZANE FISCHER is an arts-and-culture-preoccupied writer based in Santa 
          Fe, New Mexico. He writes a <br>
          regular column for the alternative weekly <EM>The Santa Fe Reporter</EM> (www.sfreporter.com).</p>
        <p>MARY GOODWIN is an M.F.A. candidate in
          photography at the University of New Mexico.
          She was a guest student at the Hochschule f&uuml;r 
          Graphik und Buchkunst in Leipzig, Germany, 
          in the Summer 2006 semester.</p>
        <p>PHIL HARRIS is a photographer, teacher and writer who lives in Portland, 
          Oregon. In 2000, he published 
          a twenty-year photographic retrospective book, <EM>Fact Fiction Fabrication</EM>.</p>
        <p>LARISSA LECLAIR is a photographer, writer and traveler. Her work focuses 
          on visual history and culture, and international photography. She lives 
          in the Washington, D.C. area.</p>
        <p>THERESA MAY is assistant director and editor-in-chief at the University 
          of Texas Press. She oversees an annual list of some hundred book projects 
          from acquisition through publication. May has a B.A. in the history 
          of art and architecture from Texas Tech University and has done post-baccalaureate 
          work at the University of Houston and the University of Texas at Austin 
          in English, art history, anthropology and applied piano. She has been 
          with UT Press for nearly thirty years. </p>
        <p>ERIC MILES, an art historian, is photo-eye&#8217;s rare-book specialist. 
          He writes a regular column on rare and collectible photobooks for <em>photo-eye Booklist</em>. He relocated 
          from New York City to Santa Fe, New Mexico, in 2003.</p>
        <p>MARY ANNE REDDING is an independent curator and writer who lives in Santa Fe, New Mexico. Previous professional 
          experience includes authoring essays for numerous exhibition catalogues 
          and stints at New Mexico State University, the Light Factory, the Center 
          for Creative Photography, the photography department of the Art Institute 
          of Chicago, and Northlight Gallery at Arizona State University.</p>
        <p>AARON ROTHMAN is an artist living in Phoenix, Arizona. His most recent 
          exhibition was at Gitterman Gallery in New York. View his work at www.aaronrothman.com.</p>
        <p>JIM STONE is an associate professor of photography at the University 
          of New Mexico. His photographs have been exhibited and published internationally 
          and he is the author or co-author of seven books. He has set foot in North Korea.</p>
        <p>MARY VIRGINIA SWANSON is an author,
          educator and consultant committed to helping
          photographers advance their careers. She lives 
          and works in Tucson and New York City. 
          Visit her at www.mvswanson.com.</p>
        <p>JONANNA WIDNER is the music editor for <EM>The Dallas Observer</EM>. She received the first place award in the 2006 
          Alternative Newsweekly Awards for Best Music Criticism (circulation 
          under 50,000) while she was the assistant editor/music columnist for 
          <EM>The Santa Fe Reporter</EM>. </p>
        <p>RICHARD B. WOODWARD is an arts critic in New York who contributes regularly 
          to <EM>The Wall Street Journal</EM> and <EM>The New York Times</EM>. His most recent essay 
          on photography appears in <EM>South Central</EM>, a monograph by Mark Steinmetz 
          (Nazraeli Press). <br>
        </p>
        <p><br>
          <br></FONT>
          </p>
        <p><br>
        </p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          </FONT> </p></TD>
</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../templates/footer_site.cfm">




