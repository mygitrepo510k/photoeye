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
      <td colspan="3" align="center"> <p>&nbsp;</p>
        <p><font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>ABOUT 
          OUR COVER<br>
          <br>
          </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>Inspired 
          by the short stories of Russian writer Anton Chekhov,<br>
          British photographer Paul Graham offers up a unique view of America.</strong></font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>INTERVIEW 
          BY RICHARD WOODWARD<br />
          </strong></font></p>
        </td>
    </tr>
    <tr> 
      <td colspan="3">&nbsp; </td>
    </tr>
      <td width="400" valign="top" align="right"> <p> <cfoutput> 
    
            <br>
            <cfset xImage = "Graham_lawnmower.jpg">
            <cfset xPath = "../../booklist/2007_Fall">
            <CFSET xHEIGHT = "320">
            <CFSET xWidth = "320">
            <cfinclude template="../../templates/imagesizer.cfm">
            <CFSET xCoverHeight = imagecr.height>
            <CFSET xCoverWidth = imagecr.width>
            <cfset xTitle2x="A Shimmer of Possibility">
            <cfset xBorder="0">
            <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
            <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP773"> <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=dp773">
            <img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a> 
            <br>
            <br>
				<cfset xImage = "Graham_cover.jpg">
            <cfset xPath = "../../booklist/2007_Fall">
            <CFSET xHEIGHT = "120">
            <CFSET xWidth = "120">
            <cfinclude template="../../templates/imagesizer.cfm">
            <CFSET xCoverHeight = imagecr.height>
            <CFSET xCoverWidth = imagecr.width>
            <cfset xTitle2x="A Shimmer of Possibility">
            <cfset xBorder="0">
            <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
           <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=dp773"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  border="#xBorder#" style="border-color: #aBorderColor#" height="#xCoverHeight#" width="#xCoverWidth#">
            </a> <br>
            <br>
          </cfoutput> </p></TD>
    <td width="20">&nbsp; </td>
      <td width="480" valign="top"> <p> EMBEDDED IN THESE TWELVE INDIVIDUAL BOOKS 
          is a vision of America that is, on the surface, about everyday life. 
          Everyday people are portrayed in everyday circumstances&#8212;mowing 
          the lawn, waiting at a bus stop, observing a busy intersection. Nothing 
          special. Below that surface, however, is a current that flows in immeasurable 
          ways. Paul Graham, who stands as one of the most engaging of documentarians, 
          has found a way to slip into the river of the commonness of American 
          life and emerge with short stories that feel, for lack of a better term, 
          real. Richard Woodward interviewed the artist for photo-eye.</p>
        <p><br>
          <strong>Richard Woodward:</strong> Let&#8217;s start with this new book, 
          which is actually a series of books, and work backwards. How did the 
          project originate?<br>
          <strong><font color="#009933">Paul Graham:</font></strong><font color="#80FF80"> 
          </font>My principal sources were Chekhov&#8217;s short stories, and 
          the critical essays around those. A lot of people have tried to understand 
          why this writing works so well, since in the stories there&#8217;s not 
          much happening. They&#8217;re dealing with the simple, everyday things&#8212;in 
          one of them a woman is combing her hair for six pages, remembering that 
          night at the theatre; in another a school teacher is coming home in 
          a cart dreaming of meeting the landowner, who doesride past and they 
          exchange a few pleasantries, but nothing more. But there&#8217;s something 
          magical about how perfectly described they are, the transparency of 
          what&#8217;s happening, without guff or show, simply described, with 
          nothing proscribed. I&#8217;ve been traveling around the States for 
          a while now, and wanted to do something looser and freer, to take pictures 
          of people at the most ordinary, everyday moments &#8212; cutting the 
          grass or waiting for the bus, smoking cigarettes or traveling to and 
          from the supermarket. I wanted to reflect Chekhov&#8217;s openness, 
          his simple transparency; this was something I tried to move toward. 
          I&#8217;m not, of course, literally illustrating Chekhov&#8217;s stories, 
          but similarly isolating a small rivulet of time. So, each of the individual 
          books is a photographic short story, a filmic haiku. They are quite 
          short, but complete in their modest way.<br>
          <strong>RW: </strong>But difficult to convey, I would think, no? The 
          layout must have<br>
          been the crucial step.<br>
          <strong><font color="#009933">PG:</font></strong> Yes, in terms of making 
          them, it was a process of letting go of one&#8217;s own pretensions 
          and not looking for this great summation picture of any given situation. 
          For example, while photographing a man at a bus stop in Vegas, I just 
          had to slow down, take a step back, and realize that the moment before 
          and the moment after are just as valuable as the instant when he takes 
          the perfect drag on the cigarette. The multiple book form is the most 
          logical development of this&#8212; ten or twelve volumes each holding 
          one or two stories within their pages; self-contained yet linked to 
          each other. And I&#8217;m fortunate enough to have Michael Mack and 
          Gerhard Steidl support this. One book has just a single picture in it; 
          another has 64 pages of images taken at an intersection in New Orleans, 
          watching life roll by.<br>
          <strong>RW: </strong>Where was the picture of the lawn-mowing man taken? 
          It&#8217;s fantastic.<br>
          <strong><font color="#009933">PG:</font> </strong>Pittsburgh. That was 
          one of my early road trips and I really wasn&#8217;t expecting much. 
          When I set out I thought, I&#8217;ll never be able to do anything good, 
          so I&#8217;ll just have fun, and see the country a bit. But then I saw 
          this guy cutting the grass. It&#8217;s kind of perfect that his shirt 
          is a riff on the American flag too.<br>
          <strong>RW:</strong> What I like about the work is that you are clearly 
          dissatisfied<br>
          with the confines of traditional documentary, but you haven&#8217;t 
          made the jump, as so many do, to video. You haven&#8217;t given into 
          temptations . . .<br>
          <strong><font color="#009933">PG:</font></strong> . . . like staging 
          my work. I&#8217;ve never wanted to become<br>
          a filmmaker. I&#8217;ve always seen the two major tropes in photography 
          as the studio and the street. And I&#8217;m a street person. I don&#8217;t 
          get tired of trying to understand and look at the wonderful amazing 
          nature of what&#8217;s around us. Yes, I have dissatisfaction with classic 
          documentary language. It was wonderful when it was invented. But it 
          has to be alive,to grow, develop, just like the spoken word. We don&#8217;t 
          speak the same way we spoke in 1938 or 1956, so why should we make pictures 
          the same way?<br>
          <strong>RW:</strong> But the dissatisfaction of others, particularly 
          with the narrative limitations of photography, has led them to add sound 
          or moving image sequences. You seem determined&#8212; and happy&#8212;to 
          stay within the boundaries.<br>
          <strong><font color="#009933">PG:</font> </strong>Well, some might see 
          these books as leading toward<br>
          building a narrative.<br>
          <strong>RW:</strong> Clearly.<br>
          <strong><font color="#009933">PG:</font></strong> Part of this is about 
          the new flexibility of digital photography. You are able to shoot and 
          shoot and then look at everything on screen. The technology does liberate 
          people. You can get remarkable quality, close to 4&times;5, working 
          on the street.<br>
          <strong>RW: </strong>But you are clearly an outsider and we never learn 
          much about these people.<br>
          <strong><font color="#009933">PG:</font> </strong>I have no problem 
          with that. I don&#8217;t want to feign being intimate with somebody 
          I meet five minutes ago. I accept and embrace that so much in life is 
          &#8220;ships passing in the dark.&#8221; The world is comprised of 99.9% 
          strangers.<br>
          <strong>RW:</strong> Is that what you don&#8217;t like about photojournalism, 
          the pretense of intimacy that is there?<br>
          <strong><font color="#009933">PG:</font></strong> It&#8217;s undoubtedly 
          there in some photojournalism. But I have more problems with the motives 
          and uses of photojournalism&#8212; the clich&eacute;d stories they tell, 
          or the way photography is used to service a written story. We have to 
          be honest: so much in photography is pabulum, and aspires to nothing 
          beyond well-worn vernacular.<br>
          <strong>RW: </strong>Let's move backward. Who were the important photographers 
          to you when you were starting out in England?<br>
          <strong><font color="#009933">PG:</font></strong> The important photographers 
          to me belong in that period from 1966 to 1976, mostly American, let&#8217;s 
          say from &#8220;New Documents&#8221; to &#8220;New Topographics.&#8221; 
          It was a profound creative period for photography. Szarkowski at MoMA 
          radicalized things for photographers by creating an artistic territory 
          to operate in that wasn&#8217;t there before. Before, you were either 
          an editorial photographer working for magazines in a semi-documentary 
          style, or a fine-art photographer making pictures of landscapes or nudes 
          or rocks. He swept aside that division and showed that people like Diane 
          Arbus and Garry Winogrand were making the most profound photographic 
          work of our time, and though it looked like &#8220;documentary,&#8221; 
          it was far more than that, and it didn&#8217;t belong in magazines, 
          but in museums. This was transformative: bringing &#8220;documentary 
          style&#8221; work into the highest museum of our country. It&#8217;s 
          little appreciated, but was perhaps Szarkowski&#8217;s greatest gift&#8212;recognizing 
          and defining a new artistic space.<br>
          <strong>RW: </strong>How was that work translated for someone growing 
          up<br>
          in England?<br>
          <strong><font color="#009933">PG:</font></strong><font color="#009933"> 
          </font>When I became aware of it in the mid-70s, it was through<br>
          books. Hence my great emphasis on books more than exhibitions. Reading 
          Public Relations, and the Diane Arbus monograph and Lee Friedlander 
          books, was very important. I didn&#8217;t get Robert Frank at first, 
          because it seemed almost photojournalistic, but strangely I got Eggleston 
          right away.<br>
          <strong>RW:</strong> Really?<br>
          <strong><font color="#009933">PG:</font></strong> It was an instinctual 
          rather than an intellectual understanding.<br>
          The first thing I saw of Eggleston&#8217;s was a promotional pamphlet 
          for Election Eve. A friend came back from the states, and he gave me 
          this brochure with six pictures in it. I was struck by his elliptical, 
          tangential approach. So elegant and beautiful.<br>
          <strong>RW:</strong> So you were taking pictures by then?<br>
          <strong><font color="#009933">PG:</font></strong> I learned how a camera 
          works early on, maybe even in the Boy Scouts! But there was no concept 
          of what you could do with it. Seeing the work of Winogrand or Friedlander 
          was like the proverbial light going on. The fact that you could say 
          something profound about the world through photographs was a life-changing 
          revelation.<br>
          <strong>RW: </strong>That&#8217;s a bold leap to make right out of the 
          box, from<br>
          the Scouts to understanding a Winogrand or Friedlander photograph.<br>
          <strong><font color="#009933">PG:</font></strong>Well there were a few 
          years between the two! I wouldn&#8217;t<br>
          claim to understand everything about Winogrand&#8217;s work, though 
          essays like Tod Papageorge&#8217;s in Public Relations are wonderful 
          reading for anyone who cares about photography.One of the great things 
          about this medium is that you don&#8217;t need to have an academic degree 
          to get it; photography can be so visceral, it cuts right through language 
          that way. <br>
          <strong>RW:</strong> Did you go out and try to take Eggleston pictures?<br>
          <strong><font color="#009933">PG:</font></strong>Well, yes and no. (Laughs. 
          hop, which meant I could order anything I wanted. We had these amazing 
          titles: New Topographics catalogs, Robert Adams&#8217; The New West, 
          early Ed Ruscha books, etc. We never managed to sell any of them&#8212;they 
          were eventually remaindered for 50 cents.<br>
          <strong>RW:</strong> But if you&#8217;re going to travel to Europe and 
          Japan you must have figured out ways to support yourself.<br>
          <strong><font color="#009933">PG:</font></strong> You sleep on friend&#8217;s 
          floors. I traveled in an old Mini&#8212;the original Mini&#8212;and 
          I slept in the back of that for a long time. I ate in truck drivers&#8217; 
          cafes. I had a friend who found out-of-date film for me. Then you do 
          some teaching and get a small grant. The documentary-style tradition 
          is very strong in England. Eventually I met up with Martin Parr, Chris 
          Killip, Graham Smith, John Davis. Then my first book, <em>A-1 The Great 
          North Road</em>, came out in 1983. It was a journey along the main artery 
          of the UK, much like Alec Soth did with the Mississippi recently. Large 
          format, color, landscapes, portraits, buildings, etc. The book proved 
          quite poisonous to that black-and-white tradition. It&#8217;s been forgotten 
          how radical it was to work within the social documentary tradition in 
          color, at that time. Now it&#8217;s so commonplace, people wonder what 
          the issue was. Within four years I published three books: <em>A1</em>, 
          <em>Beyond Caring</em> and. But by 1987, I could see this juggernaut 
          of color documentary photography in England; it had really taken off. 
          Martin Parr switched to color, so did people like Tom Wood, and then 
          our students, like Paul Seawright or Richard Billingham too. But I felt 
          it was time to move on from that, before it became exhausted. For example, 
          the mixing of landscape with war photography in <em>Troubled Land</em> 
          was striking and quite successful&#8212;I had shows in NYC galleries&#8212;but 
          what happens is that you hit this resonant note and everyone wants you 
          to repeat it. I was invited to duplicate Troubled Land in Israel and 
          South Africa. Commissions, dollars, travel, the whole nine yards. But 
          I thought, I can&#8217;t do this. For better or worse, I&#8217;m one 
          of those artists who once something is &#8220;proven,&#8221; have to 
          drop it and find another way to scare myself.<br>
          <strong>RW:</strong> So you went to Europe?<br>
          <strong><font color="#009933">PG:</font></strong> In the early to mid 
          80s I had made friends with a group of German photographers who were 
          quite distinct from the Bechers&#8217; D&uuml;sseldorf school. They 
          were mostly around Essen- Berlin: Volker Heinze, Joachim Brohm, Gosbert 
          Adler and Michael Schmidt too, who was running these workshops in Berlin 
          and inviting people like John Gossage and Lewis Baltz to come over.<br>
          <strong>RW: </strong>It&#8217;s funny that school is so unknown here. 
          Michael Schmidt even had a one-man show at MoMA.<br>
          <strong><font color="#009933">PG:</font></strong>Yes, a great show and 
          few remember it. It&#8217;s as though the Gursky show wiped out people&#8217;s 
          understanding of everything else in Germany. Gursky is much more accessible. 
          He goes for the jugular because it is about &#8220;the great photograph.&#8221; 
          Of course, he succeeds, but it&#8217;s recidivist, in a way. Photographers 
          have been trying for years to make bodies of work where images work 
          incrementally to build up a coherent statement. It&#8217;s not about 
          one great picture by Robert Adams; it&#8217;s about twenty or thirty 
          pictures that build a sensitive, intelligent reflection of the world. 
          It&#8217;s the same with Garry Winogrand, or Robert Frank. Gursky brings 
          it back to that &#8220;wow&#8221; moment. It sort of undoes that way 
          of working, and reduces things to the &#8220;What a great shot!&#8221; 
          appreciation of photography. I&#8217;m a sucker for that as much as 
          anyone, but want people to appreciate what Robert Adams does more so.<br>
          <strong>RW:</strong> So you were hanging out with these guys and going<br>
          back and forth to Europe?<br>
          <strong><font color="#009933">PG:</font></strong> I actually lived in 
          England most of the time, but I would go stay with Volker in Essen or 
          visit Michael in Berlin. I lived in Berlin one summer; one photograph 
          in New Europe is inside Michael&#8217;s apartment. We all came and went. 
          It was a reciprocal thing. Somehow I went from being part of this English 
          group with Martin Parr et al, to being an honorary member of this German 
          alliance. They became much more influential on my way of working and 
          seeing the world. My work grew quite a bit, as all of ours did in that 
          grouping, and when it was finished, in 1992, I released the book New 
          Europe. That was made for the opening exhibition for the Fotomuseum 
          Winterthur in Switzerland, but the book was never distributed here in 
          the U.S. so it&#8217;s not so well known. Gerry Badger insisted it be 
          included in The Photobook II so at least s omeone saw it!<br>
          <strong>RW:</strong> One of the paradoxes of our time, and I&#8217;ve 
          discussed this with many people, is this explosion of photography books 
          at the same time as the explosion in new media. Every photographer has 
          his or her own website and gets their information on-line. And yet they 
          all still want to make books. What is the enduring appeal?<br>
          <strong><font color="#009933">PG:</font></strong> John Gossage made 
          a great comment that his books are the original work. It&#8217;s the 
          summation of his endeavors&#8212;the book is the work. Now, a painter 
          or a sculptor can have a catalogue of their work but&#8230; it&#8217;s 
          completely different in photography. It is the exact thing&#8212;maybe 
          a little smaller scale&#8212;but with a one-on-one dialogue when you 
          read it. Looking at a Nan Goldin book is quite different from viewing 
          her photographs on the wall with other people around you. The book is 
          personal and direct, from the artist to you, complete and faithful.<br>
          <strong>RW:</strong> That&#8217;s true. When you&#8217;re looking at 
          images on-line, it&#8217;s a<br>
          much more public experience than with a book. You&#8217;re part of a 
          community and reading in a public square when you go to your computer.<br>
          <strong><font color="#009933">PG:</font></strong>Yes, you&#8217;re right. 
          It&#8217;s something I wonder about with A Shimmer of Possibility. Am 
          I diffusing that intimate experience by doing twelve books with Steidl? 
          Or am I taking it to the maximum degree by separating each piece of 
          work into its own volume, allowing each story to have that precious 
          moment of intimacy with you? So much art relies on the confidence transaction. 
          I know this is different, doing ten or twelve books. I know it seems 
          crazy, but I&#8217;m asking you to trust me and enjoy this quiet journey. 
          Just slow down and look at this ordinary moment of life. See how beautiful 
          it is, see how life flows around us, how everything shimmers with possibility. 
        </p>
        <p><em><br>
          A Shimmer of Possibility</em>. Photographs by Paul Graham. Edited by 
          Michael Mack. SteidlMACK, G&ouml;ttingen, 2007. Designed by Paul Graham 
          and Michael Mack. Printed by Steidl, G&ouml;ttingen. Softbound books 
          in a clothbound slipcase. Trade edition of 1000 copies. 12 volumes from 
          8 pp to 64 pp, c. 160 color illustrations, 9&frac12; &times; 12&frac12; 
          $250.00</p>
        <p><br>
          <a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=DP773&CFID=5471729&CFTOKEN=67441906">Order</a> 
          <em>A Shimmer of Possiblity</em> </p>
        <p><font color="#333333"><a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE032">Order</a></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          the current issue of <i>photo-eye Booklist</i>.</font></p>
          <p> <a href="http://www.photoeye.com/booklist/subscribe.cfm">Subscribe</a> 
          to the <em>photo-eye Booklist.</em><br>
        </p>
        <p><br>
        </p>
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




