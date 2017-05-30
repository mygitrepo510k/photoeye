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
<cfset Catalog="TT139">
<cfset xImage = "about_cover.jpg">
	<cfset xPath = "img">
	<CFSET xHEIGHT = "300">
	<CFSET xWidth = "300">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Lisa Sarfati: The New Life">
	<cfset xBorder="1">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=TT139"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>

<cfset Catalog="TT139">
<cfset xImage = "#Catalog#b.jpg">
	<cfset xPath = "..\..\img\Bigillus">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Lisa Sarfati: The New Life">
	<cfset xBorder="1">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=TT139"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a></cfoutput>
      </p>
  </TD>
   <td width="20">&nbsp;
  </td>
  <td width="480" valign="top">
    <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">
  <strong>GROWING PAINS.</strong> <br>
  Lise Sarfati and adolescent ennui.<br>
  <br>
 Adolescents, annoying as they can be at times, make fascinating photographic
subjects. More than a few contemporary shooters seem to think so. Rineke
Dijkstra has depicted gangly-limbed teenagers, awkward and exposed on the
beach, or has monitored the progressive stages of their physical and social
development. Jenny Gage & Tom Betterton have viewed the burgeoning sexuality
and beauty of young girls through a fashion focused lens and Hellen Van
Meene makes a visual metaphor of the discomforts of youth with her quirky,
staged portraits.
<br /><br />
But Paris based, documentary photographer Lise Sarfati (a Magnum
photographer) evokes a slightly more troubling view of adolescents. In her
first published monograph, Acta Est (phaidon, 2000), Sarfati chronicled a
world of post-Soviet decay, which included stark and emotionally dark
portraits of youths. The book won her praise and put her name firmly on the
photo world map. In her newly published monograph, The New Life (Twin Palms,
2005), Sarfati turns her gaze on American teens, with equally disturbing yet
captivating results.
<br /><br />
The American Series, as these images have been titled in Sarfati's recent
show at London’s The Photographers’ Gallery, were created over only two
journeys to America, where she recorded young people in Texas, Georgia,
North Carolina, Oregon and California. Introspective, aimless and often
looking bored and deeply depressed, Sarfati’s subjects (almost all of which
are female) appear to be out of their own bodies, dispossessed and floating,
ghostlike, through their lives. Frozen in pose and dead eyed, many possess a
frighteningly zombie-like expression. Questions spring to mind: Are they
trapped in some strange holding pen of consciousness? Are their lives really
so purposeless? Is it really that bad?
<br /><br />
Maybe it is. Whether portrayed in their bedrooms, backyards, supermarkets
and cafeterias, amidst their own clutter or in barren, seemingly abandoned
locations, they all appear unattached to their environments. Beyond bored,
they appear as ill-at-ease as extraterrestrials, only trying out these new
places, new faces, new bodies, to see where, how, and if, they may actually
fit in.
<br /><br />
It’s clear that Sarfati is mining a rich vein of material here—what
teenager, American or other, is not afflicted with some sense of detachment
or alienation? But unlike her peers, Sarfati photographs these
verging-on-the-brink-of-adulthood subjects with a detachment that almost
mirrors their own. Her refusal to objectify, patronize or project on to her
subjects makes for an eerie and raw visual message. In what turns out to be
a not-so-subtle distinction, these images fall short of being sympathetic,
but do manage to be entirely empathetic. Her  uncontrived use of color and
flair for composition only add to their convincing authenticity.
<br /><br />
Sarfati first began taking photos as a teenager in France’s coastal town of
Nice, where she grew up. At the age of 15 she traveled to Russia for the
first time, where she holidayed on the coast of the Black Sea. Subsequently
she wrote her thesis on 1920’s Russian photography and obtained a master’s
degree in Russian studies from the Sorbonne. In 1989 she returned to Russia
and devoted nearly a decade to studying this transitional country and
visually exploring both its people and architecture.
<br /><br />
It’s not surprising to find Russian art critic Olga Medvedkova contributing
a provocative essay to The New Life. In it, she makes reference to Sarfati’s
comment “I hate old people.” Sounds very much like the comment of a
teenager, although Sarfati, born in 1958, is very much an adult. But it does
spark even more curiosity about the kind of work we may be seeing from her
in the future.


 </font><br>
    <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">--By Avis Cardella</font>        </p>
	<BR />
	 <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=tt139"><strong>Order </strong></a>The New Life, La Vie Nouvelle    </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




