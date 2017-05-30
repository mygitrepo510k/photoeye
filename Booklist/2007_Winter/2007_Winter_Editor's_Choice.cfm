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
	
	<CFOUTPUT>#xHTMLTitle#</CFOUTPUT> 
<!--- <FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" style="font-size:30px" COLOR="##333333">
	 <strong>photo-eye Booklist</strong>
	</font> --->
<BR><BR> <FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333"> 
<cfset page="About"> <cfset xmenupath="../"> <cfinclude template="../include_menu.cfm"> 
<br /><br /> <TABLE WIDTH="700"> <tr> <td height="125" colspan="3" ALIGN="CENTER"> 
<p>&nbsp;</p>
        <p><font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>EDITOR'S 
          CHOICE <br>
          <br>
          </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>Each 
          season yields scores of books worthy of note. Our editor, DARIUS HIMES, 
          chooses one title or photographer that stands head-and-shoulders above 
          the others..<br>
          <br>
          <br>
          </strong></font></p></td></tr> <tr><td colspan="3" ALIGN="CENTER">&nbsp;</td></tr> 
<TR> <td width="298" valign="top" align="right"> <p> <cfoutput> <cfset xImage = "Editors_Choice.jpg"> 
<cfset xPath = "../../booklist/2007_Winter"> <CFSET xHEIGHT = "320"> <CFSET xWidth = "320"> 
<cfinclude template="../../templates/imagesizer.cfm"> <CFSET xCoverHeight = imagecr.height> 
<CFSET xCoverWidth = imagecr.width> <cfset xTitle2x="Editor's Choice"> <cfset xBorder="0">
            <a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=ID396&CFID=5471729&CFTOKEN=67441906"><img src="Editors_choice.jpg"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="328" WIDTH="320"></a> 
            <br>
            <br> </cfoutput> </p></TD><td width="20">&nbsp; </td>
      <td width="480" valign="top"> <p>I&#8217;VE ALWAYS HAD A THING FOR SMALL 
          BOOKS. Reading a book is an intimate and very tactile experience and 
          a small book plays into that feeling. In general, however, art and photobooks 
          are larger than your average book of literature, which makes reading 
          them a different experience altogether.
        <p> Another attraction of mine is books in a set or series. The world 
          of literature is full of brilliant series: the Everyman&#8217;s Library 
          by Knopf and most Penguin&#8217;s Great Ideas series immediately come 
          to mind.
        <p> It is therefore a distinct pleasure to come across photobooks that, 
          in size at least, are akin to their literary cousins. Several running 
          feet of my shelf space at home are dedicated to photobooks that are 
          either a smaller trim size than average or quite thin, hovering around 
          two or three signatures at most. And it is doubly thrilling to come 
          across a publisher that is exploring the world of photography through 
          a series of small books.
        <p> A handful of publishers are currently doing just that. Both Phaidon 
          and Thames &amp; Hudson&#8212;two of Europe&#8217;s most well known 
          and well established art book houses&#8212;have, in recent years, tested 
          the market with series of small, traditional biographical monographs 
          on important historical and contemporary photographers. In America the 
          most notable example is the exquisite One Picture Book series, by Nazraeli 
          Press. Each of the books in these series is an engaging and considered 
          object, with a small, coherent body of work forming the core. 
        <p> What the small book format provides for a photographer is a chance 
          to explore a limited body of work or a singular idea that falls outside 
          the scope of their larger bodies of work. Or, in the curious case of 
          Dutch photographer Paul Kooiker, it really lets you encapsulate an obsession. 
          <em>Seminar</em> is the third book in an unnamed series from Kooiker 
          published by Amsterdam-based Van Zoetendaal. The other two titles are 
          <em>Hunting and Fishing</em> and <em>Showground</em>. 
        <p>Each of the books perfectly reveals an id&eacute;e fixe&#8212;Seminar 
          is filled with cropped and grainy photographs of a woman&#8217;s feet 
          clad in modest but sexy black, French court shoes with kitten heels 
          and a bow and eyelet in the back. Every image has the appearance of 
          being surreptitiously snapped by a seminarstalker, as it were&#8212;we 
          catch glimpses of the woman taking notes and sitting in the audience 
          in a folding metal chair. Kooiker has given every image in the book 
          a pink overwash, which only serves to overemphasize the femininity of 
          the work. 
        <p> The effect is thoroughly engrossing (it also helps to be attracted 
          to heels) and much like reading a short story. In this case, all three 
          of Kooiker&#8217;s titles seem to embody the effect that Lewis Baltz 
          has stated so clearly: &#8220;It might be more useful, if not necessarily 
          true, to think of photography as a narrow, deep area between the novel 
          and film.&#8221; 
        <p><em>Hunting and Fishing</em>, <em>Showground</em>, and <em>Seminar</em>. 
          Photographs by Paul Kooiker. Published by Van Zoetendaal, Amsterdam, 
          1998, 2004 and 2006. www.vanzoetendaal.nl 
        <p><a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=ID396&CFID=5471729&CFTOKEN=67441906">Order</a> 
          <em>Hunting and Fishing</em><i></i>. 
        <p><a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=ID697&CFID=5471729&CFTOKEN=67441906">Order</a> 
          <em>Showground</em><i></i>. 
        <p><a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=ID822&CFID=5471729&CFTOKEN=67441906">Order</a> 
          <em>Seminar</em><i></i>. 
        <p> <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE033">Order</a> 
          the current issue of <i>photo-eye Booklist</i>.</p>
        </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




