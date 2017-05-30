<CFPARAM NAME="Season" DEFAULT="Summer">
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
<img src="about_cover.jpg" width="298" height="438"><br><br>
<cfoutput>
<cfset Catalog="ZC426">
<cfset xImage = "#Catalog#b.jpg">
	<cfset xPath = "..\..\img\Bigillus">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Daido Moriyama: Remix">
	<cfset xBorder="1">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=ZC426"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a></cfoutput>
      </p>
  </TD>
   <td width="20">&nbsp;
  </td>
  <td width="480" valign="top">
    <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">
  <strong>MOVING PICTURES.</strong> <br>
  Daido Moriyama’s <em>Remix</em> shuffles things up.<br>
  <br>
  Try this. Get a copy of Daido Moriyama’s latest book, <em>Remix</em> and crack its delicate spine. Let the crisp matte pages fan randomly and after two, maybe three times, they will inevitably fall open to an almost center point featuring a full bleed, two page color photograph of pale pink cherry blossoms against a faded blue sky.  Flanked on either side by scores of Moriyama’s characteristically gritty, chaotic, and often brutally distorted images, these pretty blossoms, placed at the center of the book, appear anomalous. They are out of place in the world of prostitutes, mangy mutts, and lonesome, sometimes dangerous, highways and alleyways that are this lensman’s signature. The blossoms could easily be critiqued as a symbol of Japan’s purity, history, an ode to youth and strength and heroic death. Maybe. But in <em>Remix</em>, they could very well serve as a resting spot, a visual palette cleanser in a book that takes its viewers on a kaleidoscopic joyride. If you need to catch your breath, just return to the cherry blossoms.<br>
  <br>
  Moriyama has built a solid reputation over four decades as a rebel and innovator. He’s the guy who began taking photographs on American naval bases in Japan in the 1960's, capturing their inherently sleazy culture and, in the process, redefining the notion of what acceptable photographic material could be. He’s the guy who launched the magazine Scandal, with experimental theater group leader Shuji Terayama, and then went on to join the innovative creative team behind the influential publication Provoke. He’s the guy who, long before it became fashionable, was shooting from the hip, rat-a-tat-tat snapshot style, while running down the street or from a moving vehicle. In <em>Remix's</em> sole essay, writer Patrick Remy describes him as just that: “a photographer in perpetual motion, like the passenger from a runaway car that shoots the landscape racing by.” 
      <br>
	  <br>
	  Moriyama dedicated his 1972 book Hunter to Jack Kerouac, a significant influence on his work. It’s not surprising, then, to learn that his given name, Hiromichi, means “great road.” Reprinted in <em>Remix</em> are many of Moriyama’s “road” images, taken from moving vehicles and depicting Japanese culture and life while at same time caressing the sensibility of Kerouac’s distinctly American experience. Another distinctly American influence for Moriyama was Andy Warhol. A series of shots taken in a convenience store capture floor to ceiling stacks of V-8 juice, crates of  Coca-Cola, Fanta, and Pepsi and whole walls of Japanese detergent. What keeps these images from devolving into mere Warhol imitations is Moriyama’s trademark urgency. The off-kilter framing, slightly soft focus, point-and-shoot style makes them believable. Nothing has been calculated here. These are subjects that genuinely grabbed the photographer’s immediate attention. <br>
	  <br>
	  If there is one thing <em>Remix</em> portrays, it’s that Moriyama remains as restless as ever, not only with his camera but, by extension, with his entire existing body of work. He has been quoted as saying, “It is annoying for me to be revered or interpreted for individual images. I believe a photographer is an organizer of visual images, not only organizing his own work, but also reconstructing photographs of others.” The constant organizing and reorganizing has given this book its name. Apparently, Moriyama works tirelessly with his prints, reworking, reprinting, rearranging. One of his most famous images, Stray Dog, taken in 1971, appears here twice; in one, the symbolic wayward hound is looking to the right, in the other, to the left. How it was originally produced, nobody seems to remember. Several versions from his series on fishnet tights are included as well as are the grainy Car Crash, from 1969, his inky and oiled Beach Boys from 1967, and his idiot Boy from 1973. The previously mentioned Cherry Blossoms, both in the repose worthy color and more sinister black-and-white versions, have appeared in 1972, then 1983 and again in 1987. <br>
	  <br>
	  In the book’s essay, Patrick Remy writes, “He is the photographer who wants to wear his subject right out... like a DJ, he continuously reinterprets his photography.” This reinterpreting, juxtaposing and sampling means that <em>Remix</em> offers yet another level of intimacy, in the form of the book itself. The photographer has not only taken the photo, but he’s reselected them, remixed them, and offered another version of how he sees the world. Which leads things back to how <em>Remix</em> may best be read:  crack its delicate spine and get ready to be taken on a ride. </font><br>
    <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">-- Avis Cardella</font>        </p>
	 <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=zc426"><strong>Order Remix</strong></a>    </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




