<CFPARAM NAME="Season" DEFAULT="Winter">
<CFPARAM NAME="Year" DEFAULT="2006">

<cfset page="Where To Find Us">
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
<br><br />
 <cfinclude template="include_menu.cfm">

<FONT FACE="verdana Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333">

<TABLE WIDTH="700" height="50"><TR><TABLE WIDTH="700"><TR>
  <td width="250" valign="top"><p><a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=pe028"><img src="../Booklist/2006_Fall/BOOKLIST-covers-grid.jpg" width="242" HEIGHT="496" border="0"></a> 
      </td>
   <td width="10">&nbsp;</td>
      <td align="center" valign="top">
<table width="423" align="left">
          <tr> 
            <td width="415"> <p> The <em>photo-eye Booklist</em> may be found 
                at the following locations:</p>
              <p><br />
                ALABAMA<br>
                Fairhope Newsstand, Inc., Fairhope<br>
                <br>
                ARIZONA<br>
                <a href="http://dizzy.library.arizona.edu/branches/ccp/information/information.html" target="_blank">Center 
                for Contemporary Photography</a>, Tucson<br>
                <a href="http://www.ethertongallery.com/html/hourslocation.htm" target="_blank">Terry 
                Etherton Gallery</a>, Tucson<br>
				Crescent Tobacco Shop & Newsstand, Tucson<br>
				New Crescent Smoke Shop, Tucson</p>
              	
              <p>CALIFORNIA<br>
                <a href="http://www.northtownbooks.com" target="_blank">Northtown 
                Books</a>, Arcata<br>
                <a href="http://www.codysbooks.com" target="_blank">Cody's Books 
                II Inc.</a>, Berkeley<br>
                Dave's Smoke Shop, Berkeley<br>
                <a href="http://www.capitolabookcafe.com/" target="blank">Capitola 
                Book Café</a>, Capitola<br>
                Daily Planet Books, Hollywood <br>
                Stef-Jen Inc., Hollywood <br>
                Universal News, Hollywood <br>
                Universal News, Los Angeles<br>
                <a href="http://www.mccloudbookgallery.com/" target="_blank">McCloud 
                Book Gallery</a>, McCloud<br>
                <a href="http://www.depotbookstore.com/" target="_blank">Depot 
                Bookstore & Café</a>, Mill Valley<br>
                <a href="http://bookends.booksense.com/NASApp/store/IndexJsp" target="_blank">Bookends 
                Bookstore</a>, Napa<br>
                <a href="http://www.vromansbookstore.com/NASApp/store/IndexJsp" target="_blank">Vroman's 
                Bookstore</a>, Pasadena<br>
                <a href="http://www.copperfieldsbooks.com/NASApp/store/IndexJsp" target="_blank">Copperfield's 
                Books</a>, Petaluma<br>
                Paras News, San Diego<br>
              	<a href="http://www.bird-beckett.com/" target="_blank">Bird & Beckett Books</a>, San Francisco<br>
                <a href="http://www.booksmith.com/" target="_blank">Booksmith</a>, San Francisco<br>
                <a href="http://www.codysbooks.com/" target="_blank">Cody's Books</a>, San Francisco<br>
                <a href="http://www.fogcitynews.com/home.html" target="_blank">Fog City News</a>, San Francisco<br>
                Good News, San Francisco<br>
                <a href="http://www.greenapplebooks.com/cgi-bin/mergatroid/index.html" target="_blank">Green Apple Books</a>, San Francisco<br>
                <a href="http://www.fraenkelgallery.com" target="_blank">Fraenkel 
                Gallery</a>, San Francisco<br>
				<a href="http://www.bookshopsantacruz.com/NASApp/store/IndexJsp" target="blank">Bookshop Santa Cruz</a>, Santa Cruz <br>
                <a href="http://www.stephencohengallery.com" target="_blank">Stephen 
                Cohen Gallery</a>, Santa Monica<br>
				<a href="http://www.neighborsbookstore.com/" target="_blank">Neighbors Bookstore</a>, South Lake Tahoe <br>
				No Limit News Stand, Valencia </p>
				
				<p>COLORADO<br>
				Aurora Newsland, Aurora<br>
				<a href="http://boulderbookstore.booksense.com/NASApp/store/IndexJsp" target="_blank">Boulder Book Store</a>, Boulder<br>
				<a href="http://www.tatteredcover.com/NASApp/store/IndexJsp" target="_blank">Tattered Cover</a>, Denver<br>
				<a href="http://www.tatteredcover.com/NASApp/store/IndexJsp" target="_blank">Tattered Cover #2</a>, Denver<br>
				Westminster Newsland, Westminster</p>
				
				<p>CONNECTICUT<br>
				News Haven, New Haven<br>
				News Services LLC, New Haven<br>
				Magazines & More, Norwich</p>

				<p>DELAWARE<br>
				Newark Newsstand, Newark</p>

				<p>DISTRICT OF COLUMBIA<br>
				News World, 1001 Connecticut Ave.<br>
				Newsroom</p>

				<p>FLORIDA<br>
				Bob's News & Books, Fort Lauderdale<br>
				F.B.E Inc, North Miami Beach</P>
				
                
              <p>ILLINOIS<br>
                <a href="http://www.citynewsstand.com/index.html" target="_blank">City 
                News Stand</a>, Chicago<br>
                <a href="http://www.mocp.org/" target="_blank">Museum of Contemporary 
                Photography</a>, Chicago<br>
              	<a href="http://www.verdant-systems.com/" target="_blank">Verdant News & Coffee</a>, Champaign<br>
                City News, Chicago<br>
              	<a href="http://www.quimbys.com/" target="_blank">Quimby's Books</a>, Chicago<br>
                Chicago-Main Newsstand, Evanston<br>
              	D & F Flammini, LLC, Zion</p>
              
			  <p>INDIANA<br>
				Book Corner, Bloomington<br>
				Verdant News & Coffee, Indianapolis</p>
				
				<p>IOWA<br>
				<a href="http://www.prairielights.com" target="_blank">Prairie Lights</a>, Iowa City</p>

				<p>LOUISIANA<br>
				LBCS, LLC, Brunswick<br>
				Lakeside News, Metairie<br>
				Acme Booksellers, Portland</p>			
			  
				<p>MAINE<br>
                <a href="http://twphotobooks.com/html/index2.html" target="_blank"> 
               Tim Whelan, Bookseller</a>, Rockport</p>
			   
			   <p>MARYLAND<br>
				<a href="http://www.atomicbooks.com/" target="_blank">Atomic Books</a>, Baltimore<br>
				Harbor News, Baltimore</p>
				
				<p>MASSACHUSETTS<br>
				<a href="http://www.tridentbookscafe.com/NASApp/store/IndexJsp;jsessionid=aCJ8gKw6OgFckKDkN3" target="_blank">Trident Booksellers Inc.</a>, Boston<br>
				Newsbreak-Middletown, New Bedford<br>
				Read All About It, Provincetown<br>
				<a href="http://www.redlionsmoke.com/" target="_blank">Red Lion Smoke Shop</a>, Salem<br>
				Newsbreak, Swansea</p>

				<p>MICHIGAN<br>
				RB Books, Inc, Grand Rapids
				<a href="http://www.schulerbooks.com/" target="_blank">Schuler Books & Music</a>, Grand Rapids<br>
				Book Mark, Mt. Pleasant<br>
				<a href="http://www.horizonbooks.com/" target="_blank">Horizon Bookstore</a>, Traverse City</p>
				
				<p>MINNESOTA<br>
				<a href="http://www.sunhillowbooks.com">Sunhillow Books</a>, Duluth</p>

				<p>MISSOURI<br>
				World News, Clayton<br>
				Electric Newsstand, Springfield</p>

				
              <p>MONTANA<br>
				Poor Richard's News, Bozeman</p>

				<p>NEW HAMPSHIRE<br>
				<a href="http://www.toadbooks.com/NASApp/store/IndexJsp" target="_blank">Toadstool Bookshop</a>, Keene<br>
				Market Square News, Portsmouth</p>

				<p>NEW MEXICO<br>
				<a href="http://www.flyingstarcafe.com/" target="_blank">Flying Star Café I</a>, Albuquerque<br>
				Newsland Book Store, Albuquerque<br>
				<a href="http://www.page1book.com/" target="_blank">Page One, Inc.</a>, Albuquerque</p>

              <p>NEW YORK <br>
                World Wide News, Rochester
              <p>NEW YORK-Manhattan & Brooklyn<br>
                Dekalb Convenience<br>
                <a href="http://www.powerhousebooks.com" target="_blank">powerHouse 
                Bookstore</a><br />
                <a href="http://www.aperture.org" target="_blank"> Aperture </a> 
                <br />
                <a href="http://www.hastedhunt.com" target="_blank"> Hasted Hunt 
                Gallery</a><br>
                <a href="http://www.gittermangallery.com" target="_blank">Tom 
                Gitterman Gallery</a><br>
                <a href="http://www.dashwoodbooks.com" target="_blank"> Dashwood 
                Books</a><br>
                BJ Magazines<br>
                <a href="http://www.coliseumbooks.com/" target="_blank">Coliseum 
                Books</a><br>
                Dina Magazines #1<br>
                Global Ink, 2876 Broadway<br>
                Global News, 22 8th Ave.<br>
                Hudson News, Grand Central Station<br>
                Ink on A<br>
                Khawaja News<br>
                Magazine & Cards Store<br>
                <a href="http://www.mcnallyrobinsonnyc.com/" target="_blank">McNally 
                Robinson Booksellers</a><br>
                Nikos Smoke Shop<br>
                Shelly Gift Shop<br>
                <a href="http://www.stmarksbookshop.com/NASApp/store/IndexJsp" target="_blank">St. 
                Marks Bookshop</a><br>
                Union Square Magazine Shop<br>
                <a href="http://www.universalnewsusa.com/" target="_blank">Universal 
                News, 11 W. 14th St.</a><br>
                <a href="http://www.universalnewsusa.com/" target="_blank">Universal 
                News, 1381 6th Ave.</a><br>
                <a href="http://www.universalnewsusa.com/" target="_blank">Universal 
                News, 234 W. 42nd St.</a><br>
                <a href="http://www.universalnewsusa.com/" target="_blank">Universal 
                News, 29 W. 35th St.</a><br>
                <a href="http://www.universalnewsusa.com/" target="_blank">Universal 
                News, 484 Broadway</a><br>
                <a href="http://www.universalnewsusa.com/" target="_blank">Universal 
                News, 50 W. 23rd St.</a><br>
                <a href="http://www.universalnewsusa.com/" target="_blank">Universal 
                News, 676 Lexington</a><br>
                <a href="http://www.universalnewsusa.com/" target="_blank">Universal 
                News, 977 8th Ave.</a></p>
              <p>NORTH CAROLINA<br>
                Downtown Books &amp; News, Asheville<br>
                Highland Newsstand, Boone<br>
                Island Bookstore, Kitty Hawk</p>
              <p>OHIO<br>
                Little Professor Books, Athens<br>
                Cincinnati Fountain Square News, Cincinnati<br>
                Bank News, Cleveland<br>
                Mac's Back Paperbacks Inc, Cleveland Heights<br>
                Liberty Books &amp; News, Columbus<br>
                Monkey&#8217;s Retreat, Columbus<br>
                News-Readers Inc., Fairborn<br>
                News &amp; Photo #1, Kent</p>
              
              <p>OREGON <br />
			  	Oregon Art Supply, Eugene<br>
				Rich's Cigar Store, Inc., Portland<br> 
				<a href="http://www.blueskygallery.org" target="_blank"> Blue 
                Sky Gallery</a>, Portland<br />
                <a href="http://www.newspacephoto.com" target="_blank">Newspace 
                Center for Photography,</a> Portland </p>
				
				<p>PENNSYLVANIA<br>
				The Doylestown Bookshop, Doylestown<br>
				Avril 50, Philadelphia<br>
				Chester County Book Co., West Chester</p>

				<p>TEXAS<br>
				MAC Newsstand, McAllen</p>

              <p>VERMONT<br>
                 <a href="http://www.pinestreetartworks.com" target="_blank">Pine Street Art Works</a>, Burlington</p>
              <p>WASHINGTON<br />
			  	The Newsstand, Bellingham<br>
				Port Book & News, Port Angeles<br>
				Glazer's Camera Supply, Seattle<br>
                <a href="http://www.pcnw.org" target="_blank"> Photographic Center 
                Northwest</a>, Seattle</p>
				
				<p>WEST VIRGINIA<br>
				Vandalia Educational Svs, Buckhannon<br>
				Empire Books & News, Huntington</p>

				<p>WISCONSIN<br>
				Greenfield News & History, Greenfield<br>
				University Book Store, Madison</p>

				<p>CANADA, ONTARIO<br>
				Mags & Fags, INS News Service, Ottawa</p>
				
				<p>EUROPE, GERMANY<br>
				<a href-"http://www.schaden.com/index.php" target="_blank">Schaden.com</a>, Koln</p>

              <p>We are proud to be distributed by <a href="http://www.ubiquitymags.com/magazines/view_publ_details.php?temp_publ_id=8929&l_back=%2Fmagazines%2Falphabet_listing.php%3F%26categ_page%3D%26temp_categ_id%3D%26pagesize%3D300%26publ_page%3D6%26%26&" target="_blank"> 
                Ubiquity Distributors</a>, based in the New York metropolitan 
                area, and also by <a href="http://www.ingramperiodicals.com" target="_blank"> 
                Ingram Periodicals</a>. If you are a bookstore and are interested 
                in carrying the <em>photo-eye Booklist</em>, please don't hesitate 
                to contact either of these companies. <br />
              </p>
              </td></tr></table>
</td></tr>
</TABLE>


<BR>
<cfinclude template="../templates/footer_site.cfm">




