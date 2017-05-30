<CFPARAM NAME="Season" DEFAULT="Spring">
<CFPARAM NAME="Year" DEFAULT="2007">

<CFSET xPage="photo-eye booklist">
<CFSET xTitle="Magazine">
<CFSET xPathToRoot="../">
<CFSET xShowBackButton = 1>
<CFPARAM NAME="Page" DEFAULT="Photo-Eye Booklist">

<cfinclude template="../templates/Header.cfm">
<div align="left">
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
  <br>
  <br>
  <TABLE WIDTH="700">
    <TR> 
      <td width="276" valign="top"><img src="../Booklist/2007_Summer/2007-summer-COVER-3D-BIG.jpg" width="276" height="365"> 
        <BR> <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><br>
        &quot;With the number of important photography books increasing every 
        year, a selective, intelligent, and lively guide to the best of those 
        titles has never been so essential. The <em>photo-eye Booklist</em> fills 
        that bill quite nicely. <br>
        Without it, I&#8217;d be lost.&quot; &#8212;Vince Aletti </font> <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">&quot;</font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">The 
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
          the current issue of <i>photo-eye Booklist</i>. </font></p></td>
      <td width="25">&nbsp; </td>
      <TD width="383" ALIGN="right"><div align="left"><font face="Verdana, Arial, Helvetica, sans-serif">LETTER 
          FROM THE EDITOR</font><BR>
        </div>
        <p align="left">Truly it is easier to &quot;speculate&quot; about what 
          Aristotle thought, even if such speculation must be supported by the 
          most careful adduction of evidences, than it is to speculate, as Aristotle 
          did, about the nature of things. --Mortimer Adler</p>
        <p align="left">To speculate about the nature of things, as the everyman 
          philosopher Mortimer Adler encouraged in the short, lucid essay &quot;Docility 
          and History,&quot; (The Commonweal, April 26, 1940) is to engage in 
          philosophy rather than historical scholarship. And much of the history 
          of the 20th century has been a battle zone of contention as to the value 
          of such speculation based on the open doubting of the possibility of 
          knowing the nature of things. </p>
        <p align="left">Photography too has played its role in this philosophical 
          tug-of-war. The unquestioned veracity of photographic images and their 
          ability to shed light on both delightful and dire worldly circumstances 
          is a thread that has remained unbroken since the beginning of the medium. 
          Reflected light forever captured on light sensitive materials has the 
          ability to tell something of the &quot;world out there.&quot; Photojournalists 
          from whatever age&#8212;starting with Roger Fenton and leading directly 
          to James Nachtwey and younger practitioners like Cuny Janssen and Aaron 
          Huey&#8212;have rested entire careers on this fundamental fact. But 
          the amount of &quot;truth&quot; that an image can portray, and how easily 
          that truth can be manipulated to the point of presenting entire falsehoods 
          under a truthful guise, is a big part of the last 40 years of art and 
          image making. The work of Cindy Sherman, Nikki S. Lee and the playful 
          Joan Fontcuberta immediately comes to mind in this context. </p>
        <p align="left">In between these two points lies the rich diversity of 
          artists using the photographic medium (in all of its historical variety). 
        </p>
        <p align="left">The issue you hold in your hands celebrates that diversity. 
          In our cover story, Richard Woodward has a conversation with British 
          photographer Paul Graham about his newest project, a set of small books 
          inspired by Chekhov short stories. Jen Bekman interviews the uneasy 
          and very occasional fashion photographer Alec Soth on his new project 
          from the Paris office of Magnum, Fashion Magazine: Paris Minesota. Mary 
          Anne Redding interviews the influential and enigmatic Lucy Lippard, 
          and Avis Cardella, happily ensconced in her Parisian home, inaugurates 
          a new column entitled Roving Eye. </p>
        <p align="left">We hope you enjoy this issue.</p>
        <p align="left"> DARIUS HIMES, Editor darius@photoeye.com </p>
        <div align="left"><BR>
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong><font color="NAVY">Fall 
          2007 <font size="2">&middot; TABLE OF CONTENTS</font></font></strong><BR>
          <BR>
          <A HREF="../Booklist/2007_Fall/2007_Fall_About.cfm" style="color: Maroon"><strong>About 
          Our Cover (full text)</strong></A><BR>
          Paul Graham's Chekhov-inspired work shimmers with possibility.<br>
          » interview by Richard Woodward<br>
          </FONT> </div>
        <p align="left"><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><A HREF="../Booklist/2007_Fall/2007_Fall_Eye_on%20_P.cfm" style="color: Maroon"><strong>Eye 
          on Publishers (full text) </strong></A><BR>
          One by one, we interview the publishers of the books we love.<br>
          » a photo-eye questionnaire <br>
          <BR>
          <A HREF="../Booklist/2007_Fall/2007_Fall_Survey.cfm" style="color: Maroon"><strong>Survey 
          of New Books</strong> </A><BR>
          </FONT><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">The 
          quarterly survey of the best new photography books.<br>
          » by various contributors<BR>
          <br>
          <A HREF="../Booklist/2007_Fall/2007_Fall_Lucy_Lippard.cfm" style="color: Maroon"><strong>Rooted 
          to Place</strong></A><BR>
          An Influential career seen through a lifetime of books</FONT><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">.<br>
          » by Mary Anne Redding<BR>
          <br>
          <A HREF="../Booklist/2007_Fall/2007_Fall_Taryn_Simon.cfm" style="color: Maroon"><strong>Out 
          There, Hidden</strong></A><BR>
          This new book by Taryn Simon will take you by suprise.<br>
          » a photo-eye presentation<br>
          <br>
          <A HREF="../Booklist/2007_Fall/2007_Fall_Publishing.cfm" style="color: Maroon"><strong>Publishing 
          the Photography Book</strong></A></FONT><br>
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">A</FONT><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          column about the ins-and-outs of publishing photography books. <br>
          » by Mary Virginia Swanson and Darius Himes</FONT> <br>
          <br>
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          <A HREF="../Booklist/2007_Fall/2007_Fall_Old_and_Rare.cfm" style="color: Maroon"><strong>The 
          Old & Rare Survey</strong></A><BR>
          A regular column that surveys important books of the past.<br>
          » by Eric Miles <br>
          <br>
          <A HREF="../Booklist/2007_Fall/2007_Fall_Editor%27s_Choice.cfm" style="color: Maroon"><strong>Editor’s 
          Choice</strong></A><BR>
          In this new column, our editor reviews a singular title of the season.<br>
          » by Darius Himes</font></p>
        <p align="left"><strong><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">CO</font></strong><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>NTRIBUTORS</strong><br>
          <br>
          </font> JEN BEKMAN owns a gallery (www.jenbekman.com), writes a blog 
          called Personism (www.personism.com) and runs a quarterly photo competition, 
          Hey, Hot Shot! (www.heyhotshot.com). Her latest endeavor is 20&times;200 
          (www.20&times;200.com), a place to buy editioned prints and photos at 
          ridiculously affordable prices. </p>
        <p align="left">AVIS CARDELLA is a freelance writer specializing in the 
          areas of photography, art and pop culture. Her work has appeared in 
          various publications, including <em>American Photo</em>, <em>ArtReview</em>, 
          <em>Picture</em>, <em>Surface</em> and <em>British Vogue</em>. A born 
          and bred New Yorker, she currently resides in Paris, France.</p>
        <p align="left">DEBRA KLOMP CHING gained her M.A. in critical history 
          and theory of photography from the University of Derby (UK) in 1998. 
          The former director of Pavilion (UK), she now resides in New York, where 
          she is an independent curator, writer and photographer. </p>
        <p align="left">MARY GOODWIN is an M.F.A. candidate in photography at 
          the University of New Mexico. She was a guest student at the Hochschule 
          f&uuml;r Graphik und Buchkunst in Leipzig, Germany, in the Summer 2006 
          semester.</p>
        <p align="left">PHIL HARRIS is a photographer, teacher and writer who 
          lives in Portland, Oregon. In 2000, he published a twenty-year photographic 
          retrospective book, <EM>Fact Fiction Fabrication</EM>.</p>
        <p align="left">ANTHONY LASALA is a senior editor at Photo District News 
          magazine and has freelanced for a host of other publications including 
          Time Out NY, Billboard, Yankee Magazine, Sights and TV Guide. LaSala 
          has authored two books, The Worlds Top Photographers: Nudes (Rotovision, 
          2005) and The Brooklynites (powerHouse, 2007) and was nominated as photo 
          editor of the year by the International Photography Awards in 2003 and 
          2004. He lives in beautiful Brooklyn, New York.</p>
        <p align="left">LARISSA LECLAIR is a photographer, writer and traveler. 
          Her work focuses on visual history and culture, and international photography. 
          She lives in the Washington, D.C. area.</p>
        <p align="left">ERIC MILES, an art historian, is photo-eye&#8217;s rare-book 
          specialist. He writes a regular column on rare and collectible photobooks 
          for <em>photo-eye Booklist</em>. He relocated from New York City to 
          Santa Fe, New Mexico, in 2003.</p>
        <p align="left">EUGENIA PARRY has written pioneering books and articles 
          about art and photography for nearly forty years. Her Crime Album Stories 
          (Scalo, 2000), a book of meta-fiction, based on a Paris police album 
          of photographs of violent crimes from around 1900, won the International 
          Center for Photography's &quot;Infinity&quot; award for writing in 2001. 
          She lives in Cerrillos, New Mexico.</p>
        <p align="left">JOHN PILSON is a photographer and filmmaker. His work 
          has been featured in recent exhibitions at the Museum of Modern Art, 
          The Guggenheim Museum and the Centre Pompidou in Paris. His first book 
          of photographs &quot;Interregna&quot; (Hatje Cantz) was published this 
          year. He currently holds teaching positions at Bard College and The 
          Yale School of Art. He lives and works in New York City.</p>
        <p align="left">MARY ANNE REDDING is an independent curator and writer 
          who lives in Santa Fe, New Mexico. Previous professional experience 
          includes authoring essays for numerous exhibition catalogues and stints 
          at New Mexico State University, the Light Factory, the Center for Creative 
          Photography, the photography department of the Art Institute of Chicago, 
          and Northlight Gallery at Arizona State University.</p>
        <p align="left">MARY VIRGINIA SWANSON is an author, educator and consultant 
          committed to helping photographers advance their careers. She lives 
          and works in Tucson and New York City. Visit her at www.mvswanson.com.</p>
        <p align="left">RICHARD B. WOODWARD is an arts critic in New York who 
          contributes regularly to <EM>The Wall Street Journal</EM> and <EM>The 
          New York Times</EM>. His most recent essay on photography appears in 
          <EM>South Central</EM>, a monograph by Mark Steinmetz (Nazraeli Press). 
          <br>
        </p>
        <p align="left"><br>
          <br></FONT>
          </p>
        <p align="left"><br>
        </p>
        <p align="left"><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          </FONT> </p></TD>
    </TR>
  </TABLE>
  <BR>
  <cfinclude template="../templates/footer_site.cfm">
</div>
