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
          <cfset Catalog="DP490">
          <cfset xImage = "new_and_used_BIG.jpg">
          <cfset xPath = "../../booklist/2006_FALL">
          <CFSET xHEIGHT = "400">
          <CFSET xWidth = "400">
          <cfinclude template="../../templates/imagesizer.cfm">
          <CFSET xCoverHeight = imagecr.height>
          <CFSET xCoverWidth = imagecr.width>
          <cfset xTitle2x="Hackney Wick">
          <cfset xBorder="1">
          <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
          <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP490"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br>
          <br>
          <cfset Catalog="DP490">
          <cfset xImage = "dp490b.jpg">
          <cfset xPath = "../../booklist/2006_Fall">
          <CFSET xHEIGHT = "120">
          <CFSET xWidth = "120">
          <cfinclude template="../../templates/imagesizer.cfm">
          <CFSET xCoverHeight = imagecr.height>
          <CFSET xCoverWidth = imagecr.width>
          <cfset xTitle2x="Hackney Wick">
          <cfset xBorder="0">
          <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
          <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP490"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a></cfoutput> </p> 
      </TD>
      <td width="20">&nbsp; </td>
      <td width="480" valign="top"> <p><b>Object Lessons.<br>
          </b>Marc Joseph&#8217;s <em>New and Used</em> takes a look at the meaning 
          of objects. BY AVIS CARDELLA<br>
          <br>
          MARC JOSEPH'S LATEST EFFORT, <em>New and Used</em>, brings to mind a 
          quote: &#8220;In America, extravagance is passed into things not culture; 
          so the culture is in the things not the people&#8221; In his critically 
          acclaimed first monograph, <em>American Pitbull</em>, a visual study 
          of this beloved and misunderstood breed and their owners&#8217;, Joseph 
          brought this observation into sharp focus. <em>Pitbull</em> was lauded 
          for being an original view on American culture, rich with metaphor and 
          exemplary of the extravagance that can be passed into things, in this 
          case, an animal.</p>
        <p> With <em>New and Used</em>, Joseph presents a visual record of another 
          aspect of American culture; the relationship we forge with books, music 
          and art. In richly detailed color photographs, he presents hardcovers, 
          paperbacks, LPs, CDs, and cassettes boxed, shelved, binned, or stacked. 
          Visiting their &#8220;increasingly endangered natural environments, 
          independent bookstores and record shops&#8221; he shows them as found 
          or silhouetted against a black backdrop like shadow boxed artifacts, 
          or specimens. Also included in this volume are writings: short fiction, 
          poems, personal essays, from artists, musicians and poets (Jonathan 
          Lethem, Thurston Moore and Eileen Myles to name a few) all weighing 
          in on their own &#8220;new and used&#8221; experiences.</p>
        <p> Presented as such, these items are not mere objects, but take on the 
          aura of talismans and cultural icons. And as with <em>American Pitbull</em>, 
          Joseph appears to confront their meaning by occasionally isolating them 
          as photographic typologies. But while they may be typological in style, 
          Joseph insists his intent was not to create a typological photographic 
          study. In his own words: &#8220;The body of work that became <em>American 
          Pitbull</em> is about identity including some of my own. The pictures 
          that are now part of <em>New and Used</em> are also about identity, 
          even more of my own.&#8221;</p>
        <p> Growing up in Ohio in the 1970s, Joseph was first exposed to art, 
          writing, and music in the smaller, eccentric book and record shops in 
          downtown Cleveland. Thus began his permanent fascination with books 
          and records&#8212;both as public artworks and formative private experiences. 
          In his youth, he spent countless hours combing the stacks in search 
          of a purchase&#8212;one of his memorable firsts being <em>London Calling</em> 
          by the Clash.</p>
        <p> Who among us hasn&#8217;t had a similar experience? Even the most 
          tightly locked memory box will be jimmied open by at least some of these 
          evocative images: the invitingly cluttered shelves of New York&#8217;s 
          Strand bookstore, a sun faded and stained copy of Patti Smith&#8217;s 
          LP, <em>Wave</em>, or a triumvirate of biographical book spines: <em>Woody 
          Guthrie: A Life, Please Kill Me</em>, and <em>Room Full of Mirrors: 
          A Biography of Jimi Hendrix</em>. And anyone who has attended high school 
          in the U.S. will immediately feel a wave of recognition (if not anxiety) 
          when confronted with a photo of a row of Cliffs Notes with their familiar 
          graphic yellow and black covers.</p>
        <p> That said, it&#8217;s difficult to deny the contemporary adult fascination 
          with adolescence and youth looming just outside these frames. Joseph, 
          like other artists of his generation, may be prone to over romanticizing 
          the culture of their youth.</p>
        <p> Included in the book&#8217;s many writings is a postscript conversation 
          between gallerist and independent curator, Aaron Rose and Joseph. In 
          it Joseph speaks about his first encounter with London Calling as a 
          fifteen year old in Ohio. He says: &#8220;When I brought that record 
          home and listened to it for the first time, it scared me. There was 
          something about it&#8212;the sounds, the pictures, the scrawled handwriting 
          on the inside sleeves, but particularly the sound of it, and just holding 
          the thing in my hands. It was intimate and frightening and a real shift 
          happened. This was pretty much my first experience with punk rock, and 
          it kind of made everything change.&#8221;</p>
        <p> Ironic that an album inspired by rebellion becomes, decades later, 
          so romanced, as do the disappearing retail temples where these relics 
          can still be purchased. There was a time when certain &#8220;independent&#8221; 
          bookstores sold both music and literature that was considered anti-social 
          if not illegal. The greatest praise for <em>New and Used</em> is for 
          how it brilliantly highlights a generation&#8217;s lack of firsthand 
          experience. The books, LPs and cassettes here appear like hand-me-down 
          symbols of the revolution Joseph&#8217;s generation never had&#8212;the 
          objects that hold his generation&#8217;s culture so firmly in their 
          grip.<br>
          <br>
          <em>New and Used</em>. Photographs by Marc Joseph. Text by Lydia Davis, 
          Stephen Elliott, Shelley Jackson, Damon Krukowski, Jonathan Lethem, 
          Thurston Moore, Eileen Myles, Bob Nickas, Aaron Rose, Jeremy Sigler, 
          Stephanie Snyder, Ian Svenonius, Nick Tosches. Steidl, G&ouml;ttingen, 
          2006. Designed by Lorraine Wilde, Robert Ruehlman at Green Dragon, Los 
          Angeles, and Gerhard Steidl and Marc Joseph. Printed by Steidl, G&ouml;ttingen. 
          Edition of 5000. Clothbound with tip-in plate. 192 pp., 52 four-color 
          illus., 9 x 11 $45.00<br>
          <BR />
          <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP490"><strong>Order</strong></a> 
          <i>New and Used</i>.
        <br><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=pe028">Order</a> 
          the Fall issue of the <i>photo-eye Booklist</i>. </font><br>
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a> 
          to the <i>photo-eye Booklist</i></font></p>
        
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




