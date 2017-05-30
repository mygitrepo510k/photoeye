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
	
	<cfset page="Article">
	<CFINCLUDE TEMPLATE="../../templates/Title.cfm">
	<CFOUTPUT>#xHTMLTitle#</CFOUTPUT>
	<BR><BR>


<FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333">

<cfset xmenupath="../">
 <cfinclude template="../include_menu.cfm">
<br><br> 
<TABLE WIDTH="700"><TR>
      <td colspan="3" align="center"> <p><font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>PUBLISHER 
          PROFILE: PRINCETON ARCHITECTURAL PRESS<br>
          </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>A 
          new column surveys the field of publishers&#8212;one by one&#8212;that 
          create the books we love.</strong></font></p>
        </td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="400" valign="top" align="right">
      <p>
	  <cfoutput>
<cfset xPath = "http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=39">
<cfset xImage = "PAP_masoniclodge.jpg">
	<cfset xPath = "../../booklist/2006_Summer">
	<CFSET xHEIGHT = "400">
	<CFSET xWidth = "400">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="In Katrina's Wake">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=39"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
		
		<cfset Catalog="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=39">
<cfset xImage = "PAP_In-Katrina's-Wake.jpg">
	<cfset xPath = "../../booklist/2006_Summer">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="In Katrina's Wake">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=39"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
		</cfoutput>
		
      </p>
      </TD>
   <td width="20">&nbsp;
  </td>
      <td width="480" valign="top"> <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          PHOTOGRAPHERS AND PUBLISHERS form the X and Y axes upon which great 
          photobooks are crafted. This new column will explore the vast continuum 
          of publishers, from small art presses to mid-size publishers to the 
          large houses that have survived the decades. </font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          <em>Q: What is your vision of photography and publishing?</em> <br>
          A: Jennifer Thompson: What constitutes the proper subject of a Princeton 
          Architectural Press book is a matter of ongoing debate at the press. 
          Obviously, architecture is the primary subject area of our program, 
          but a few years ago we decided to broaden our scope to include &#8220;design,&#8221; 
          very broadly conceived, and so have published books on typography, book 
          arts, graphic design, industrial design, design history, design monographs, 
          illustration (including books on mapmaking and journaling, board games, 
          street graphics, political cartoons and posters, including even lost-and-found 
          pet posters). In fact, the list got so long we just lumped everything 
          into the catchall phrase &#8220;visual culture,&#8221; meaning anything 
          in the built or designed environment. And, of course, photography is 
          an essential element of all these books, either photography as its own 
          subject, or, as in the case of architecture, which can&#8217;t be published 
          without photography, as the medium of representation of another subject. 
          And while some of our photography books have been &#8220;straightforward&#8221; 
          monographs on a single subject and/or by a single photographer&#8212;<em>Mythic 
          City, New York Changing, Visions of Heaven, Butabu</em> as examples 
          of the former, and Jem Southam&#8217;s <em>Landscape Stories</em>, the 
          latter&#8212;several of our most recent photography books, and the ones 
          I&#8217;ve edited, have dealt as much with the collection, formatting 
          and presentation of photographs as with their subjects. For example, 
          <em>PhotoBooth, Love Letters Lost, Real Photo Postcards</em> and <em>Snapshot 
          Chronicles</em>: books that remind us of the truism that you can&#8217;t 
          separate the art from the frame, even when that frame is a book. It&#8217;s 
          this question of what gets collected, and how the photographs are stored, 
          grouped and presented that interests me the most and has resulted, I 
          think, in some of our most interesting photobooks. </font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          <em>Q: Who do you see as your audience?</em><br>
          A: We hope our audience is anybody who&#8217;s looking at the world 
          around them, or open to looking at the world. As an editor, the biggest 
          compliment you can hope for is a reader who says, &#8220;I never saw 
          that until I read your book, and now I see what you (or the author or 
          the photographer) mean.&#8221; That process of making people aware that 
          everything around them is the result of a conscious design process or 
          framing is one of my goals as an editor and, I think, one of the goals 
          of the Press overall. It&#8217;s a process of mutual discovery, like 
          showing something really interesting you just discovered to a friend.</font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          <em>Q: What quantity of books do you publish per year/season?</em><br>
          A: We published 61 titles last year.</font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          <em>Q: How do you acquire new titles?</em><br>
          A: Many times it&#8217;s word of mouth. When an author has a good experience 
          with the Press, they tend to tell their friends and colleagues, but 
          also just through people who know and respect our books. Also, we have 
          seven editors who all do acquisitions, so when we see something we like 
          or that interests us personally, we bring it in so that the editorial 
          board can review it. And we get blind submissions in for all kinds of 
          projects.</font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          <em>Q: What future projects really excite you right now?</em><br>
          A: I&#8217;m working with Chris Jordan, the Seattle photographer, on 
          his Katrina photographs, which are just amazing. It&#8217;s a Northwest 
          kind of season, as I&#8217;m also working with Tom Kundig, a Seattle 
          architect, on his monograph. His work is just so inspirational and really 
          combines all forms of craft, like metalworking and masonry, with a site 
          to create these incredible pieces of built work. Another book on my 
          list is on hand-drawn type by Mike Perry, a graphic designer in Philadelphia. 
          And there is a wonderful book coming in soon by Joshua Glenn and Carol 
          Hayes about the stories behind weird objects people have in their homes. 
          So just in one season I&#8217;m working on all these books that incorporate 
          all of these different mediums. </font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          <em>Q: What are your submission guidelines?</em><br>
          A: We have a page on our website that provides </font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">information 
          on how to submit a manuscript. </font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          Contact Information: Princeton Architectural Press, 37 East 7th Street, 
          New York, NY 10003. www.papress.com, Jennifer@papress.com</font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          To see a list of the publishers to be featured in Publisher Profile 
          <a href="http://www.photoeye.com/templates/PubShowCase_home.cfm">click 
          here.</a> </font><br>
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><br />
          <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=pe027">Order</a> the Summer issue of the <i>photo-eye Booklist</i>. </font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">  <a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a> 
          to the <i>photo-eye Booklist</i></font><br>
        </p>
    </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




