<CFPARAM NAME="Season" DEFAULT="Winter">
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
      <td colspan="3" ALIGN="CENTER"><p><strong><font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">EYE 
          ON PUBLISHERS: </font></strong><strong><font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">PHAIDON</font></strong></p>
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
	  <cfset xImage = "Phaidon_group.jpg">
	<cfset xPath = "../../booklist/2007_Winter">
	<CFSET xHEIGHT = "1000">
	<CFSET xWidth = "1000">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Phaidon images">
	<cfset xBorder="0">
            <a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=7"><img src="Phaidon_group.jpg"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="609" WIDTH="320"></a> 
            <br>
            <br>
</cfoutput>
 </p>
      </TD>
   <td width="20">&nbsp;
  </td>
      <td width="480" valign="top"> <p><font color="#333333">PHOTOGRAPHERS AND 
          PUBLISHERS <em>form the X and Y axes upon which great photobooks are 
          crafted. This column explores the vast continuum of publishers that 
          exists in the world today, from small art presses to mid-size publishers 
          to the large houses that have survived the decades. In this issue we 
          speak with Denise Wolff, Commissioning Editor, Photography at Phaidon, 
          based in London, UK.</em></font></p>
        <p><font color="#333333"><strong>What is your vision of photography and 
          publishing?</strong><br>
          We&#8217;re interested in all different kinds of photography and enjoy 
          working with artists and photographers at the top of their field. We 
          strive to make photography books that are definitive and lasting. It&#8217;s 
          very important to us that each book has its own identity&#8212;a design 
          created especially for the work itself, as well as with the audience 
          in mind. And we collaborate with some of the most innovative designers 
          and production specialists in the world to bring the photographs to 
          life and manifest the photographer&#8217;s vision in book form. Our 
          books, such as <em>Inferno</em>, <em>The Devil&#8217;s Playground</em> 
          and <em>The Fat Baby</em>, resonate well beyond their publication date. 
          As an international trade publisher, we keep our books in print and 
          publish them all over the world in English and in different languages. 
          Behind each book is a massive creative and logistical undertaking and 
          this is absolutely mad and extraordinary and exciting all at once.</font></p>
        <p> <font color="#333333"><strong>Who do you see as your audience?</strong></font> 
          <br>
          <font color="#333333">We publish different books for different audiences. 
          Books like <em>Century</em> and <em>The Photography Book</em> reach 
          a wide general audience. Others, such as Roger Ballen&#8217;s <em>Shadow 
          Chamber</em> and <em>The Photobook: A History Vol. I &amp; II</em>, 
          have a more specialized photographic audience in mind. Our introductory 
          monographs, like the new Martin Parr, are popular with students, and 
          we also publish photography for an art audience with books such as <em>Vitamin 
          PH</em>, <em>Art &amp; Photography</em>, as well as our Contemporary 
          Artist series. It&#8217;s a balancing act, and there are always surprises. 
          </font></p>
        <p><font color="#333333"><strong>What quantity of books do you publish 
          per year/season?</strong> We publish between 50 to 60 books a year in 
          Art, Architecture, Photography, Graphic Design, Children&#8217;s, Travel, 
          Cookery and Contemporary Culture. The photography books make up about 
          ten to twelve books per year.</font></p>
        <p><font color="#333333"><strong>How do you acquire new titles? </strong></font><br>
          <font color="#333333">For the most part, we approach the photographers 
          and estates we’re interested in working with, though we also consider 
          projects that have come in spontaneously. I travel to exhibitions, festivals 
          and review events to see new work and meet photographers. I look at 
          hundreds of pictures a day in magazines and newspapers, on blogs, even 
          on Flickr. And I speak with a lot of photo editors, photographers and 
          professionals who give me great advice and ideas. </font></p>
        <p><font color="#333333"><strong>What future projects really excite you 
          right now?</strong> </font><br>
          <font color="#333333"> I like all the projects I&#8217;m working on 
          and love the variety&#8212;in one day I might get to work on everything 
          from sea creatures to war, Henry Fox Talbot to Mary Ellen Mark. I&#8217;ve 
          spent the last year and a half working with Max Kozloff on an important 
          survey of portrait photography that is just now out on the market: <em>Theatre 
          of the Face</em>. I&#8217;ve learned a tremendous amount about portraiture, 
          and the book introduced me to many photographs I&#8217;d never seen 
          before and also forced me to think in an entirely new way about the 
          photographs I&#8217;ve seen so many times that I had stopped really 
          seeing them. I&#8217;m also having a lot of fun on our forthcoming book 
          with Stephen Shore, <em>A Road Trip Journal</em>. We&#8217;re reproducing 
          the journal Stephen kept of his 1973 road trip across the USA&#8212;with 
          all the Howard Johnsons receipts, parking tickets, postcards and careful 
          notes he kept about what he ate, watched on TV and photographed&#8212;along 
          with all of the photographs he took on the trip. It&#8217;s a fantastic 
          book with a unique design and beautiful materials. We&#8217;re publishing 
          it in a limited-edition run this spring, and it&#8217;s going fast.</font></p>
        <p><font color="#333333"> <strong>What are your submission guidelines?</strong><br>
          Submissions guidelines are posted on our website. Outside of these, 
          we request materials that we do not need to return; electronic is best. 
          I most prefer to see the work by itself rather than in a book dummy. 
          And I appreciate it when photographers do their research on our photography 
          books and think about if and how their project fits on our list before 
          they decide to submit it.</font></p>
        <p><font color="#333333"><strong> Contact Information:</strong><br>
          Denise Wolff, Phaidon Press<br>
          18 Regent&#8217;s Wharf<br>
          All Saints Street<br>
          London N19PA<br>
          www.phaidon.com</font><font color="#333333" size="2"></font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>To 
          see a list of the publishers to be featured in this column</strong> 
          <a href="http://www.photoeye.com/templates/PubShowCase_home.cfm">click 
          here.</a> </font><br>
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><br />
          <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE033">Order</a> 
          the current issue of <i>photo-eye Booklist</i>. </font><br>
        </p>
        </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




