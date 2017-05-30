<CFPARAM NAME="Season" DEFAULT="Spring">
<CFPARAM NAME="Year" DEFAULT="2006">

<cfset page="Advertise">
<CFSET xTitle="Magazine">
<CFSET xSubPage="1">
<CFSET xPathToRoot="../">
<CFSET xShowBackButton = 1>
<CFPARAM NAME="Page" DEFAULT="Photo-Eye Booklist">

<cfinclude template="../templates/Header.cfm">
<DIV ALIGN="CENTER">

	<CFSET xFontColor = "Black">
	
	<CFIF Page is "Reviews">
		<CFSET xSubTitle = "New Books Reviewed">
	<CFELSEIF Page is "Contact">
		<CFSET xSubtitle = "Contact Us">
	<CFELSE>
		<CFSET xSubTitle=Page>
	</CFIF>
<!--- 	<img src="2005_Summer/PHOTO-EYE-BOOKLIST-LOGO.gif" width="257" height="54"><br> --->
	<CFINCLUDE TEMPLATE="../templates/Title.cfm">
  <CFOUTPUT>#xHTMLTitle#</CFOUTPUT>
	<BR>
	
<br>
 <cfinclude template="include_menu.cfm">
 <br /><br />

<FONT FACE="'Trebuchet MS', verdana, Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333">


<TABLE WIDTH="700"><TR>
      <td align="center" height="50"> <FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" class="text">photo-eye 
        Booklist is the world's only magazine devoted to photography books</A>.<br>
        Contact our offices by <a href="mailto:hannah@photoeye.com?subject=Advertising">email</a> 
        or phone 505-988-5152, x114.</FONT></td>
</tr>
</TABLE>

  <TABLE CELLPADDING="5" ALIGN="CENTER" width="700">
    <TR>
      <TD VALIGN="TOP" width="148"> 
	 
	    <cfset xImage = "pe033.jpg"> <cfset xPath = "..\Booklist\2007_Winter"> 
        <CFSET xHeight = "280"> <CFSET xWidth = "200"> <CFSET xALT="Winter 2007 Booklist"> 
        <cfinclude template="../templates/imagesizer.cfm"> <CFOUTPUT> <A HREF="../templates/mShowDetailsbyCat.cfm?Catalog=pe033"><img src="../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT='#xAlt#' Align='center' style="border-color:Silver" vspace="5"></A> 
        </CFOUTPUT>
		
		<cfset xImage = "pe032.jpg"> <cfset xPath = "..\Booklist\2007_Fall"> 
        <cfinclude template="../templates/imagesizer.cfm"> <CFOUTPUT> <A HREF="../templates/mShowDetailsbyCat.cfm?Catalog=pe032"><img src="../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT='#xAlt#' Align='center' style="border-color:Silver" vspace="5"></A> 
        </CFOUTPUT> 
		
		<cfset xImage = "pe031.jpg"> <cfset xPath = "..\Booklist\2007_Summer"> 
        <cfinclude template="../templates/imagesizer.cfm"> <CFOUTPUT> <A HREF="../templates/mShowDetailsbyCat.cfm?Catalog=pe031"><img src="../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT='#xAlt#' Align='center' style="border-color:Silver" vspace="5"></A> 
        </CFOUTPUT> 
		
		<cfset xImage = "pe030.jpg"> <cfset xPath = "..\Booklist\2007_Spring"> 
        <cfinclude template="../templates/imagesizer.cfm"> <CFOUTPUT> <A HREF="../templates/mShowDetailsbyCat.cfm?Catalog=pe030"><img src="../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT='#xAlt#' Align='center' style="border-color:Silver" vspace="5"></A> 
        </CFOUTPUT> 
		
			<cfset xImage = "pe029.jpg"> <cfset xPath = "..\Booklist\2006_Winter"> 
        <cfinclude template="../templates/imagesizer.cfm"> <CFOUTPUT> <A HREF="../templates/mShowDetailsbyCat.cfm?Catalog=pe029"><img src="../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT='#xAlt#' Align='center' style="border-color:Silver" vspace="5"></A> 
        </CFOUTPUT> 

		<cfset xImage = "pe028.jpg"> <cfset xPath = "..\Booklist\2006_Fall"> 
        <cfinclude template="../templates/imagesizer.cfm"> <CFOUTPUT> <A HREF="../templates/mShowDetailsbyCat.cfm?Catalog=pe028"><img src="../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT='#xAlt#' Align='center' style="border-color:Silver" vspace="5"></A> 
        </CFOUTPUT> 
		
		</TD>
      <td width="10">&nbsp;</td>
      <td width="497"> <p><A HREF="2007-08 Media kit.pdf"><strong>DOWNLOAD</strong></A> our 2007-08 
          Media Kit (PDF)<br>
          <A HREF="2007 Ad Contract.pdf"><strong>DOWNLOAD  </strong></A>our 2007 Ad Contract 
          (PDF)<br>
          <br>
          FROM OUR READERS<br>
          &quot;Photo-eye has been selling the best photobooks published round 
          the world, so it was only a question of time before they should also 
          publish a magazine that deals with books with equal intelligence. It 
          is a most instructive read where the most poignant new books are reviewed, 
          and book topics are discussed and given the status they richly deserve. 
          As we are now beginning to truly appreciate the importance of the photobook 
          to our photographic culture, photo-eye Booklist is essential reading.&quot;<br>
          &#8212;Martin Parr, Magnum photographer and photobook historian </p>
        <p>FROM OUR ADVERTISERS<br>
          &#8220;I have to say that our ad is stunning. I don&#8217;t think we 
          have ever had an ad so well printed and can&#8217;t get over how well 
          the Harry Callahan image was reproduced. Please pass along my compliments 
          to Stinehour Press.&#8221;<br>
          &#8212;Terry Etherton, Director, Etherton Gallery <br>
          <br>
          ABOUT OUR READERS: <br />
          Average Annual Income is over $100,000.<br />
          Average degree held: a 4-year college degree.<br />
          Average number of books purchased: double digits. <br />
          Average annual photography book budget OVER $500.<br />
          2/3rds of our readers collect photography, with 15 years the average 
          number of years they've been collecting.<br />
          50% of our readers work in the photography industry. <br />
          Over 1/3 of them belong to photography organizations. <br />
          AND BEST OF ALL: Nearly 2/3rds of our readers STATE that they act on 
          advertisements they read in the photo-eye Booklist!<br />
          <br />
          <strong>Recent Advertisers: PUBLISHERS</strong><br>
          <a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=12">powerHouse 
          Books</a><br>
          <a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=2">Nazraeli 
          Press</a><br>
          <a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=MW091">	
          R.A.M.</a><br>
          <a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=9">Distributed 
          Art Publishers (D.A.P.)</a><br>
          <a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=6">Aperture</a><br>
          <a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=8">Yale 
          University Press</a><br>
          <a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=27">Little, 
          Brown and Company / Bulfinch Press</a><br>
          <a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=13">Center 
          for American Places</a><br>
          <a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=46">Getty 
          Publications</a><br>
          <a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=32">21ST 
          Journal of Contemporary Photography</a><br>
          <a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=6">Hatje 
          Cantz</a><br>
          <a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=6">Aperture</a><br>
          <a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=28">Duke 
          University Press</a><br>
          <a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=7">Phaidon</a><br>
          <a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=25">National 
          Geographic</a><br>
          <a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=55">teNeues</a><br>
          <a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=62">Trinity 
          University Press</a><br>
          <a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=33">Stanford 
          University Press</a><br />
          <a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=63">University 
          of Pittsburgh Press</a><br>
          <a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=22">University 
          of California Press</a><br>
          <a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=64">Thames 
          &amp Hudson</a><br>
          <a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=22">The 
          Perpetua Press</a><br>
          <a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=ZC740">Modern 
          Book</a><br>
          <a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=86">Dewi 
          Lewis</a><br>
          <a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=85">The 
          Ice Plant</a><br>
          <a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=82">Kehrer 
          Verlag</a><br>
          <a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=22">Minotaurus 
          Verlag</a><br>
          <a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=10">Scalo</a><br>
          <a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=22">University 
          Press of Kentucky</a><br>
          <a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=22">Thistle 
          Hill Publications</a><br>
          <a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=22">The 
          University of Alberta Press</a><br>
          <br />
          <strong>GALLERIES</strong></br><br>
          <a href="http://www.fraenkelgallery.com">Fraenkel Gallery</a><br />
          <a href="http://www.gittermangallery.com">Gitterman Gallery</a><br />
          <a href="http://www.vervefinearts.com">Verve Fine Arts</a><br />
          <a href="http://www.fettermangallery.com">Peter Fetterman Gallery</a><br />
          <a href="http://www.blueskygallery.org" target="_blank">Blue Sky Gallery</a><br>
          <br>
          <strong>OTHERS</strong><br />
          <a href="http://www.stinehourpress.com">The Stinehour Press</a><br />
          <a href="http://www.visualserver.com">VisualServer</a><br />
          <a href="http://www.aipad.com">AIPAD</a>, The Association of International 
          Photography Art Dealers<br />
          <a href="http://www.mvswanson.com">Mary Virginia Swanson</a><br />
          <a href="http://www.swanngalleries.com">Swann Auctions</a><br />
          <a href="http://www.photoserve.com">PDN * IPNSTOCK.COM * PhotoServe.com</a><br />
          <a href="http://www.photobistro.com">PhotoBistro</a><br />
          <a href="http://www.artfairsinc.com">Art Fairs, Inc (photo LA, photo 
          San Francisco, photo New York)</a><br />
          <a href="http://www.pcnw.org" target="_blank">Photographic Center Northwest</a><br>
          <a href="http://www.sfcp.org">The Santa Fe Center for Photography</a><br />
          <a href="http://www.swanngalleries.com" target="_blank">Swann Auctions</a><br>
          <a href="http://www.santafeworkshops.com" target="_blank">Santa Fe Workshops</a><br>
          <a href="http://www.newspacephoto.org" target="_blank">Newspace Center 
          for Photography</a><br>
          <a href="http://www.thefoundphoto.com" target="_blank">The Found Photo</a><br>
          <a href="http://www.elleonliteraryarts.com" target="_blank">Isaias Orozco-Lang</a><br>
          <a href="http://www.beasleyphotography.com" target="_blank">Doug Beasley</a><br>
          <a href="http://www.tomatwood.com" target="_blank">Tom Atwood</a><br>
          <a href="http://www.DougPlummer.com" target="_blank">Doug Plummer</a><br>
          <a href="http://www.garyauerbach.com" target="_blank">Gary Auerbach</a><br>
          <a href="http://www.lightstruckpress.com" target="_blank">Jon Spence</a><br>
          <a href="http://www.amyaglar.com" target="_blank">Amy Aglar</a><br>
          <a href="http://www.jennylynn.com" target="_blank">Jenny Lynn</a><br>
          <a href="http://www.garyauerbach.com" target="_blank">Gary Auerbach</a><br>
          <a href="http://www.davidswonderworld.com" target="_blank">David Robinson</a><br>
      </td>
    </TR>
    <TR>
      <TD VALIGN="TOP">&nbsp;</TD>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </TR>
  </TABLE>


</DIV>

<BR>
<cfinclude template="../templates/footer_site.cfm">




