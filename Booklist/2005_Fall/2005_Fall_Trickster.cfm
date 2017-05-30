<CFPARAM NAME="Season" DEFAULT="Fall">
<CFPARAM NAME="Year" DEFAULT="2005">

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
	<CFOUTPUT>#xHTMLTitle#</CFOUTPUT>
	<BR><BR>


<FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333">

<!--- <cfinclude template="../include_menu.cfm">
<br><br> --->
<TABLE WIDTH="700"><TR>
<td colspan="3" align="center"> <font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>TRICKSTER'S PHOTOGRAPHY<br>
</strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>Hosoe Eikoh's 1966 classic, <i>Kamaitachi</i> is sumptuously reprinted by Aperture.<br />
IVAN VARTANIAN guides us through the history of this book.
</strong></font></td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="400" valign="top" align="right">
      <p>
	  <cfoutput>
<cfset Catalog="AP505">
<cfset xImage = "HOSOE1.jpg">
	<cfset xPath = "img">
	<CFSET xHEIGHT = "400">
	<CFSET xWidth = "400">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Eikoh Hosoe: Kamaitachi ">
	<cfset xBorder="1">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=AP505"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
		
		<cfset Catalog="AP505">
<cfset xImage = "HOSOE2.jpg">
	<cfset xPath = "img">
	<CFSET xHEIGHT = "400">
	<CFSET xWidth = "400">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Eikoh Hosoe: Kamaitachi">
	<cfset xBorder="1">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=AP505"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
		</cfoutput>
		
		<cfoutput>
<cfset Catalog="AP505">
<cfset xImage = "#Catalog#b.jpg">
	<cfset xPath = "..\..\img\Bigillus">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Eikoh Hosoe: Kamaitachi">
	<cfset xBorder="1">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=AP505"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a></cfoutput>
      </p>
      </TD>
   <td width="20">&nbsp;
  </td>
  <td width="480" valign="top">
    <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">  THE LATE 1960S AND EARLY 1970S was a period of dramatic change
for Japan on all fronts. While its economy continued to grapple with postwar
recovery and Allied nations quickly established the country’s role in
world politics, domestically, a cultural crisis was brewing that permeated
all
aspects of identity, tradition, and spirituality. With concrete high-rises
springing up where once there were only rice crops, the very roots of
Japanese identity were being shaken. Japan’s relationship to its own past
had
been made precarious by the war’s outcome, the continued presence of the
American military, and their concomitant effect of reconfiguring the basics
of daily Japanese life. The effort to rejuvenate the country fueled an
abnormal
rate of industrial growth and expansion. In the process, much was lost
or permanently altered.
<BR /><BR />
The arts of this time responded with extremes of expression and form,
thus establishing an avant-garde movement. This free-for-all in explosive
experimentation was an attempt to piece together a new cultural fabric out
of the fragments of what remained as well as nostalgia for what was being
lost. Butoh dance, the most recognizable of the avant-garde movement, was
an example of the elegiac and self-expressive nature found across the board
in the arts. It paired the overarching theme of demolition with a reaching
out
towards the void. Photographers, too, were at a crossroads, questioning both
the veracity of the photographic image and traditional photographic
practice.
<BR /><BR />
Eikoh Hosoe was a young boy when he was evacuated with his family
from their Tokyo home to Japan’s northern region, where he was taken care
of by relatives. In 1965, as a young photographer in his twenties, Hosoe
returned to create what he refers to as a “personal documentary” of his
memories of what he encountered there. This project was a collaboration
with dancer Tatsumi Hijikata, the founder of the Ankoku Butoh (or
“darkness dance”) and one of the principal creators of the dance form
itself. Together, they traveled the countryside of the Tohoku area and
performed
a series of “happenings”. (The project was continued intermittently
over the course of a few years and also included shoots in Tokyo.)
<BR /><BR />
Their activity was a sort of dance itself. Hijikata would improvise
movements while Hosoe would race alongside or ahead to find the right
angle to shoot or direct. The farmers of the region were incorporated into
the dance, most of the times unwittingly. Hijikata would leap into the air
or writhe on the ground —even absconding with someone’s baby for a
few moments —while the farmers and children would look on curiously.
“A photographer was a bit of a trickster,” says Hosoe, describing how we
would slip in and out of scenes to quickly take a shot.
<BR /><BR />
Hosoe and Hijikata’s activities were in keeping with the Japanese myth
surrounding kamaitachi. According to Japanese lore, the pouncing
kamaitachi are tricksters, creatures that slash their victims, producing a
deep gash. Metaphorically, they embody an aspect of Nature’s power,
namely unpredictability and a refusal to be tamed. The collaboration
between Hosoe and Hijikata was one incarnation of this uniquely
Japanese myth.
<BR /><BR />
The book itself was no less of a troublemaker. In the 1960s, printing
and bookmaking techniques had advanced to new heights (albeit far
from economical) and this set many designers on the task of pushing all
boundaries. Kamaitachi was an ambition of design, printing, and binding
devised by Japan’s legendary designer Ikko Tanaka. It was comprised
of 42 gatefold images, the underside of each sheet printed in a deep blue.
Originally published in 1969 in a limited edition of 1,000 copies at a
retail price of ¥12,000 (about US$110, which was quite a cost at the
time).
<BR /><BR />
My involvement with Aperture’s reproduction edition included supervision
of the production of the book, which began with new gelatin silver
prints from Hosoe, all of which needed to be scanned and separated.
And in working on the project, I felt the sting of the kamaitachi’s strike.
Despite the limited print run—a combined total of only 1,000 copies—
the on-press time took four solid weeks, an unheard of amount of time
for a book with only 34 plates. The unique nature of the binding, quality
of images, and format of pagination made for a seemingly endless
series of hurdles to surmount. The kamaitachi seemed to have gotten the
better of me.
<BR /><BR />
In the midst of all these logistic and mechanical issues, there was the
greater question of choosing where to follow the original book and deciding
where we needed the book to be a product of contemporary times.
The principal difference between the original and this new edition is the
printing method. The original had been printed in photogravure, a
process that has lamentably disappeared from the commercial printing
world. Our choice was made for us, then, when it came to printing. We
couldn’t use photogravure. The new reproduction edition was printed
using gravure’s successor, offset printing.
<BR /><BR />
Photogravure can be identified by several signature features, most
notably rich, matte blacks, the soft-edged contours of the print, an
increased contrast, and lack of mid-tone gradient, all of which gave
images printed in gravure a bold, weighty quality. With offset printing,
however, the images are far less grainy, there is a gain in sharpness and
detail,
and the mid-tones are far more varied. We also chose to print the book in
tri-tone (two black inks and one gray), making for a real depth of tonality,
further enhanced by the choice of paper stock. It was amazing to witness how
a change in printing technique could effect the imagery itself. But what was
most exciting was simply standing witness to the power of Hosoe’s
photographs.
Even with the strong book design, the photography shines through.
After nearly forty years, the work is still fresh and engrossing.
<BR /><BR />
Kamaitachi is an exquisite example of the photography book as a malleable
form. This new incarnation of Hosoe’s photography has resulted in a
fresh creation, directly springing from the original body of work. Fine
craftsmanship
underscores the entire project. The trickster nature of Hosoe’s photography
demanded such extremes of printing and bookmaking. Ultimately,
it was great to see how devilish fun can be the wellspring of such beauty
and
refinement.
<br><br />
<!---
Continue reading this interview by <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE024">ordering the current issue</a> of photo-eye Booklist. --->

          </font></p>
 <!---   <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">--Karen Sinsheimer</font></p> --->
    <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><i>Kamaitachi. </i> Photographs by Eikoh Hosoe, Dance by Tatsumi Hijikata,
Preface by Shuzo Takiguchi, Poem by Toyoichiro Miyoshi, Book design
by Ikko Tanaka. 37 x 30 cm, Tri-tone, 42 gatefold sheets, Silk-screen cloth
cover, with acetate jacket, with exterior case. All copies are signed and
numbered by the photographer. The reproduction edition is limited to
1000 copies (with 25 AP copies) co-published by the Aperture
Foundation, New York, and Seigensha Art Publishing, Kyoto. The principal
difference between the 500 copies of the Japanese edition and the
500 copies of the US edition is the exterior design. For the Aperture
edition,
the original slipcase designed by Ikko Tanaka was replaced with a
deluxe clamshell box newly designed by Tadanori Yokoo and printed in
five colors. $350.00</font><br><br>
	<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=AP505"><strong>Order</strong></a> <i>Kamaitachi</i><br></p>
    </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




