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
	
	<CFINCLUDE TEMPLATE="../../templates/Title.cfm">
	
	<CFOUTPUT>#xHTMLTitle#</CFOUTPUT> 
<!--- <FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" style="font-size:30px" COLOR="##333333">
	 <strong>photo-eye Booklist</strong>
	</font> --->
<BR><BR> <FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333"> 
<cfset page="About"> <cfset xmenupath="../"> <cfinclude template="../include_menu.cfm"> 
<br /><br /> <TABLE WIDTH="700"> <tr> <td height="125" colspan="3" ALIGN="CENTER"> 
<p>&nbsp;</p><p><font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>EDITOR'S 
CHOICE <br> <br> </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>Each 
season yields scores of books worthy of note. <br> Our editor, DARIUS HIMES, chooses 
one title from among the many<BR> that stands head-and-shoulders above others.<br> 
<br> <br> </strong></font></p></td></tr> <tr><td colspan="3" ALIGN="CENTER">&nbsp;</td></tr> 
<TR> <td width="298" valign="top" align="right"> <p> <cfoutput> <cfset xImage = "Editors_Choice.jpg"> 
<cfset xPath = "../../booklist/2007_Fall"> <CFSET xHEIGHT = "320"> <CFSET xWidth = "320"> 
<cfinclude template="../../templates/imagesizer.cfm"> <CFSET xCoverHeight = imagecr.height> 
<CFSET xCoverWidth = imagecr.width> <cfset xTitle2x="Editor's Choice"> <cfset xBorder="0"> 
<a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=CA064&CFID=5471729&CFTOKEN=67441906"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a> 
<br><br> </cfoutput> </p></TD><td width="20">&nbsp; </td><td width="480" valign="top"> 
<p>REBECCA SOLNIT HAS REPEATEDLY BEEN DESCRIBED as &#8220;erudite,&#8221; a singular 
adjective that conjures up images of a bespectacled, library-bound scholar. In 
reading through this new collection of essays, however, one begins to see a constellation 
of character traits. Solnit embodies the ideal of the hearty (and wholehearted) 
seeker who has taken it upon herself to independently investigate the truth. Unaligned 
with outside authority, guided by penetrating questions and equipped with only 
(but capably) her rational faculties, intellectual acumen and a ferocious appetite 
for justice and accountability, she has literally and metaphorically andered out 
firsthand to see the natural and social landscape of America. <p> At times gruff 
and judgmental but ever discriminating and poignant, her essays range from current 
affairs to popular culture, history and, of course, photography and the power 
of images. <p> Her approach is engaging, to say the least. Her essays, regardless 
of their length, often begin with a particular event or object or person that 
has caught her eye. This particular serves as the leaping off point for a foray 
into the broad, the sweeping and historical, ever winding through a mental landscape 
that belies how well-read she is, and eventually bringing us back down to the 
surface and the detail from which she began. <p> There is no hesitation to state 
her opinion or to take a position. In fact, this is one of the most striking qualities 
in her writing and serves her well, for it brings a force to her statements that 
cannot be avoided. <p> But this is not a book of rants by a &#8220;grumpy activist. 
While Solnit is not afraid to commit her passionate positions to paper, she is 
also not afraid to place herself in the quietude of the deserts and wilderness 
of the American West and to tell us of the experience in equally quiet terms. 
In a lyrical essay about the &#8220;landscape&#8221; of the sky, she guides the 
reader through a history of constellations and the variety of meaning and uses 
that humans have found therein. &#8220;Constellations are an essential metaphorical 
construct- or one might say that metaphor is an art of making constellations, 
of constellating.&#8221; In the remainder of the paragraph she manages to reference 
Aristotle&#8217;s Poetics, Walter Benjamin and Hannah Arendt, whom she quotes 
as saying, &#8220;Metaphors are the means by which the oneness of the world is 
poetically brought about.&#8221; <p> This attendance to metaphors and their power 
is something she employs throughout the book, returning to again and again, like 
a well. It is from this well that Solnit proffers us a refreshing drink. <p><em>Storming 
the Gates of Paradise: Landscapes for Politics</em>. Text by Rebecca Solnit. University 
of California Press, Berkeley, 2007. Designed by Sandy Drooker. Clothbound with 
photo-illustrated dustjacket. 416 pp., 11 black-and-white illustrations, 6&frac14;&times; 
8&frac14; $24.95 <p><a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=CA064&CFID=5471729&CFTOKEN=67441906">Order</a> 
<em>Storming the Gates of Paradise: Landscapes for Politics</em><i></i>. <p> <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE032">Order</a> 
          the current issue of <i>photo-eye Booklist</i>.</p>
        <p><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><a href="http://www.photoeye.com/booklist/subscribe.cfm" target="_blank">Subscribe</a> 
          to the <em>photo-eye Booklist.</em> </font></p>
        </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




