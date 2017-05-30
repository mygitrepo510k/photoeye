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
 <br /><br />
 
<TABLE WIDTH="700"><TR>
<td colspan="3" align="center"> <font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>THE BEST BOOKS OF 2005  <br>
</strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>photo-eye presents the best photobooks of last year. </strong><BR />BY DARIUS HIMES, SUMMER FOREST HOECKEL, MELANIE MCWHORTER AND ERIC MILES </font></td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="400" valign="top" align="right">
      <p>
	 
<cfset Catalog="">
<cfset xImage = "BEST-BOOKS-IMAGE.jpg">
	<cfset xPath = "../../booklist/2006_Spring">
	<CFSET xHEIGHT = "400">
	<CFSET xWidth = "400">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Best Books of 2005">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
	<CFOUTPUT><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></CFOUTPUT><br><br>
		
	
		
      </p>
      </TD>
   <td width="20">&nbsp;
  </td>
  <td width="480" valign="top">
    <p><font color="##333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
IT’S THAT TIME OF YEAR AGAIN. All of the year-end “Best Of...”
lists have been published, except for one: Ours. Which, of course, is the only
one that matters, right? Each year, on a blustery eve in January, the photoeye
staff hunker down for some serious wrangling, haggling, laughter,
belittling, scoffing, cheering, empassioned appealing, and food and (lots of )
drinks. And at the end, having come up with a dozen or so titles that we
think are absolutely outstanding, we all stagger home, none too worse for the
wear. So, here they are: fifteen books (in alphabetical order by artist/author)
that we think contribute something to the world. 
<BR /><BR />
Nutshell Studies of Unexplained Death, Corrine May Botz (Monacelli Press).
Nutshell Studies is Botz’s photographic exploration of the ‘dollhouses’ created
by Frances Glessner Lee, an affluent, elderly woman who founded Harvard's
Department of Legal Medicine in 1936. Lee built scale models of unsolved
crimes that were then used as teaching aids. The in-depth essay points out,
however, that Lee projected many of the current views of women and victims
into these nutshell studies. The strength of this book is the abundance of material:
floor plans of the crime scenes, statements by witnesses, evidential notes
and Botz’s photographs of the models all presented on black pages. MM  <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=VK058">Order Book</a>
<BR /><BR />
Echo, Chan Chao (Nazraeli Press). Chao applies the same distanced yet
direct style to his unclothed female friends and acquaintances of Washington
D.C. as he did to an eaerlier series of portraits made in Burma (for which he
was included in the 2002 Whitney Biennial). The result is a challenging, atypical
group of female figure studies. And the book is absolutely stunning. DH <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=TR168">Order Book</a>
<BR /><BR />
The Perfect Medium, Clement Cheroux (Yale University Press).
Undoubtedly, the majority of you are already very much aware of both this
book and the exhibition at the Meropolitan Museum that it accompanied.
The book has been reviewed in just about every major art magazine and
newspaper in recent months, and for good reason. It sheds light not only on
a genre of photography filled with quackery, but also the spiritualist movements
of the early 20th century (in both Europe and North America), and
presages the heated debates over veracity in photography and the manipulations
of Photoshop. DH <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=YU073">Order Book</a>
<BR /><BR />
Portraits. A Retrospective, Rineke Dijkstra (D.A.P./Schirmer Mosel).
Since the early 90s, Dijkstra has recast the genre of portraiture along the
stylistic and conceptual lines first suggested by the Bechers and their
students. Her primary focus remains young people at transitional times—
brand-new mothers, young Israelis about to enter the military, Portuguese
matadors just after bullfights, adolescent club kids and bathers on beaches.
Her combination of classical composition—full frontal poses against stark
backgrounds—and radical objectivity is remarkably effective in uncovering
the psychological vulnerability inherent in such charged moments. EM <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP129">Order Book</a>
<BR /><BR />
Possible Relatives, Tina Enghoff (Journal). Loneliness is both a basic
human emotion and fear; dying alone could be said to represent the ultimate
extreme of loneliness. Enghoff ’s book puts pictures with those fears without
ever portraying a single person. She photographed the rooms and beds of
people who had died alone, arriving seemingly minutes after the bodies had
been removed. A chilling and thought-provoking body of work. DH <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=ID730">Order Book</a>
<BR /><BR />
For Every Minute You Are Angry, You Lose Sixty Seconds of Happiness,
Julian Germain (SteidlMack). Julian Germain stumbled upon the house of
Charles Snelling, a retiree living in Portsmouth, England, by chance one day
while on assignment to photograph a local soccer game. The quiet demeanor
of the man, his attentiveness to flowers, and his bright attitude were enough
to entrance the young photographer. He stayed that day for several hours,
and returned many times to chat and photograph. The message of the book,
so boldly printed on the cover, is spread out over the entirety of the images. Attune your inner ear and listen
intently. DH <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP187">Order Book</a>
<BR /><BR />
David Hilliard (Aperture). David Hilliard is arguably one of the most successful students to emerge from
the ‘School of Crewdson’ as the photography department at Yale came to be known in the mid-1990s. Like
Crewdson, and Philip-Lorca di Corcia who also taught in the department, Hilliard explores the intersection
of photography and narrative, arriving at what is perhaps a stronger synthesis of the photographic and the
cinematic than either of his two mentors. He does this via a canny deconstruction of the conventions of
composition and point of view; using the multi-panel format he directs our gaze to details in ways not
possible in a single frame. For Hilliard, the photograph is no longer a ‘decisive moment’; rather, the instant
of the photograph is distended, our gaze pulled asunder in a deliberately choreographed manner. EM  <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=AP493">Order Book</a>
<BR /><BR />
Kamaitachi, Eikoh Hosoe (Aperture) and The Map, Kikuji Kawada (Nazraeli Press). These two books
are gorgeous reprints of long-out-of-print titles which are integral to an understanding of post-WWII
Japanese photography. Aperture and Nazraeli Press are to be commended for bringing these titles back into
circulation and public discourse. DH <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=AP505">Order Book</a>
<BR /><BR />
Casa Susanna, Michel Hurst and Robert Swope (powerHouse Books). “People take pictures of each
other, just to prove that they really existed,” goes the hook from an old Kinks song. The truth that underlies
this adage informs much of the recent vogue for found and anonymous photographs, but never has it
been demonstrated more vividly than in Casa Susana. This book presents a remarkable New York City fleamarket
find—hundreds of snapshots of drag-queens, decked out as average middle-class suburban women
like something out of Leave it to Beaver, gathered at a nondescript-looking small townhouse in upstate New
York. Susanna, a professional female impersonator, and her friends, reveal that in the days before Stonewall,
what we think of as the ‘closet’ might have looked like a picture of manicured suburbia, not much different
from the Eisenhower-era American Dream. EM  <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PY136">Order Book</a>
<BR /><BR />
Borderlands, Eirik Johnson (Twin Palms). Initially, Borderlands feels awkward in your hands, but the design
perfectly fits Johnson’s full-bleed images, one per page-spread. An image of cold, wet river-stones wraps around
the outside of the book. Once opened, the viewer is confronted with tires mired in the sludge of a receding
tide; orange fabric, reminiscent of flames, flaps in the wind. A variety of wind-blown fabrics appear throughout
the book, like Tibetan prayer flags sending prayers out over a landscape that is passive to man’s encroachment.
It was the wealth of content and overall design that made this book a unanimous staff favorite. MM <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=TT140">Order Book</a>
<BR /><BR />
Why Mister, Why? Iraq 2003-2004, Geert Van Kesteren (Artimo) “What I saw, and what Geert recorded
over the next 48 hours with his camera, I will never forget. As the two of us hustled from house to house
in the middle of the night, joing U.S. soldiers as they busted down doors looking for insurgent ‘cells’, the
suspicions I had long harboured in Washington began to coalesce...I realized that the Bush administration
truly had no clue what it was doing in Iraq.” Michael Hirsh, a senior editor at Newsweek, penned this in
his introduction to Why Mister, Why? Printed on magazine stock paper, the book reads like a 500 page 
engrossing news story filled with images of the current war in Iraq. DH <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP214">Order Book</a>
<BR /><BR />
The Loves of the Poets, Joseph Mills (Nazraeli) Didn’t get enough Dada and Surrealism in your college
diet? Find yourself hankering for collages that allude to religion, death, sex, and dark, animistic practices?
Look no further! Joseph Mills is a master at using both his own photographs and found imagery to
produce eerie, powerful, provocative artworks. Designed like a precious fairytale album, this book delivers
by the wheelbarrow load. DH <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=TR186">Order Book</a>
<BR /><BR />
Chronologies, Richard Misrach (Fraenkel Gallery). In this unconventional retrospective, careful editing
reveals how Misrach established a long-term methodology, cycling through, returning and building on his
various bodies of work. Skillfully designed to echo the great sense of openness in his landscape photographs,
Chronologies places a single image and a blank page per spread, giving the viewer a chance to catch one’s breath
and prepare for the next. In his repeated photographic sojourns through the deserts of California and Nevada,
he seems to ponder who will be the victor: man or the earth? Misrach is non-committal either way, using his
camera instead to reveal the great beauty of the struggle. SH <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP273">Order Book</a>
<BR /><BR />
Fashion Magazine, Martin Parr (Magnum Paris). Fashion Magazine is populated with rubber hotdogs,
vegetables adorned with clunky jewels, and fishnet stockings worn unabashedly with miniskirts and bad
pumps. It is gawdy, bright, tongue-in-cheek and irresistible. Martin Parr is no Anna Wintour but in
creating his own fashion magazine we get all Martin, all the time. Parr confronts fashion through a more
honest lens, one which seems to reveal the craziness of life itself—it is loud, scrambling for your attention,
yet full of beauty and laughter. SH  <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=ZC551">Order Book</a>






          </font></p>
 
	<a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a> to the photo-eye Booklist <br></p>
    </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




