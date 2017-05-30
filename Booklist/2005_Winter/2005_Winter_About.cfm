<CFPARAM NAME="Season" DEFAULT="Winter">
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
	
	<CFOUTPUT>#xHTMLTitle#</CFOUTPUT> <!--- <FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" style="font-size:30px" COLOR="##333333">
	 <strong>photo-eye Booklist</strong>
	</font> --->
	<BR><BR>
<FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333">

<cfinclude template="../include_menu.cfm">




<br>
<br>
<TABLE WIDTH="700">

<tr><td colspan="3" ALIGN="CENTER"><font color="#333333" size="3" face="'Trebuchet MS', 'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>ABOUT OUR COVER</strong></FONT></td></tr>
<tr><td colspan="3" ALIGN="CENTER">&nbsp;</td></tr>
<TR>
 
 
    <td width="298" valign="top" align="right">
<cfoutput>
<cfset Catalog="MW091">
<cfset xImage = "baltzFullimages.jpg">
	<cfset xPath = "../../booklist/2005_Winter">
	<CFSET xHEIGHT = "300">
	<CFSET xWidth = "300">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Lewis Baltz: New Industrial Park">
	<cfset xBorder="1">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=MW091"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>

<cfset Catalog="MW091">
<cfset xImage = "baltz-cover.jpg">
	<cfset xPath = "../../booklist/2005_Winter">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Lewis Baltz: 3 Volume Set">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=MW091"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a></cfoutput>
      </p>
  </TD>
   <td width="20">&nbsp;
  </td>
  <td width="480" valign="top">
    <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">
  <strong>Renewed Topographics.</strong> <br>
A trilogy of Lewis Baltz’s seminal works. BY AVIS CARDELLA<br>
  <br>
THE CURRENT FANFARE around color photography
from the 70s has left me hankering for a healthy dose of the
era’s stunning black-and-white. So the arrival of Lewis Baltz:
The Tract Houses/The Prototype Works/New Industrial Parks
Near Irvine, California (RAM/Steidl/Whitney), an exquisite
three-volume slipcased presentation of this American-born
photographer’s three earliest works, is just what the doctor
ordered.<br />
<br />
While Baltz did eventually move into color photography
later in his career, his early-career documentation of the
changing American landscape of the 70s relied on the
meticulous control and formality that only the black-and-white
print could offer. But, as one of the publication’s two
essayists, Sheryl Conkelton, explains, what set apart Baltz’s
depictions of stark, monotonous man-made environments—
parking lots, industrial parks, tract houses—was
that “they maintained narrative content even as they foregrounded
form as a newly different signifier of meaning.”
His sticking with the black-and-white paradigm may have
been a “clear reference to modernism,” but ultimately, it was
Baltz’s subject matter that separated this early work from
other photographic precedents of the time.<br />
<br />
Baltz chose to photograph the man-made landscape he
saw emerging around him. In the late 60s and 70s,
California, where Baltz grew up, was a hotbed for the kind
of modern architectural nightmares that have now come to
define suburban sprawl. These anonymous, repetitive and
often cheaply built structures, defined by their sameness,
not only became his subjects, but gave form to his presentation
as well. Baltz photographed The Tract Houses and The
New Industrial Parks Near Irvine, California as series,
exhibiting them in wall grids designed to mimic a capitalistic
world being increasingly mapped out in lines and grids.
It was this gesture that ended up defining Baltz as a groundbreaker
in conceptual photography.<br />
<br />
But it was influential gallery owner Leo Castelli, who initially
recognized the significance of Baltz’s work. He purchased
and showed The Tract Houses in late 1971, a time
when the phrase “conceptual photography” was barely on
anyone’s lips. Castelli, and other East Coast gallerists, were
the first to forge a close link between art and photography
in the 70s with their acquisition of works from talents such
as Baltz, Bernd and Hilla Becher, and Robert Adams.
It was four years later, in 1975, that Baltz, along with his
peers the Bechers and Adams, participated in a traveling
photography exhibition titled New Topographics:
Photographs of a Man-Altered Environment. Baltz showed his
series The New Industrial Parks, depicting the poured-concrete
foundations and breeze-block walls of emerging warehouse
structures, car lots and loading docks, all barren and
foreboding of spiritual ennui. The exhibit closed, the
term “new topographics” had been coined and Baltz’s
work began to be identified as architectural, “topographic”
pictures.<br />
<br />
Thirty years hence, being confronted with this body
of work today, I’m again drawn to Baltz’s tenacity. I just
can’t stop looking at the tediously technically perfected
black-and-white prints. The shadowy walls of his The
Tract Houses, and the inky black car-lots of The New
Industrial Parks, appear to still hold mysteries of a future
that has already happened.<br />
<br />
Perhaps Adam D. Weinberg, of the Whitney Museum
of American Art, begins to explain when he writes:
“Baltz’s low-key, understated and elemental works reveal
subjects that are inexorably temporary, yet they have an
inevitability, an inscrutability, a permanence, even a
stateliness. His images demand more than contemplation
and delectation, they demand reckoning.”

<br />
<br>
       Lewis Baltz (The Tract Houses, The Prototype Works,
The New Industrial Parks Near Irvine, California). Three volume
set. Photographs by Lewis Baltz. RAM/Steidl/Whitney Museum of American Art, Santa Monica, 2005. Clothbound with a printed dustjacket. 292 pp., 133 duotone illustrations, 11 x 11 $225.00
</p>
	<BR />
	 <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=MW091"><strong>Order Lewis Baltz, (The Tract Houses, The Prototype Works,
The New Industrial Parks Near Irvine, California). Three volume
set.
</strong></a></TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




