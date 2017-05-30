<CFPARAM NAME="Season" DEFAULT="Spring">
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
<br><br> 
<TABLE WIDTH="700"><TR>
      <td colspan="3" align="center"> <p><font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>PUBLISHER 
          PROFILE: University of Texas Press<br>
          </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>A 
          new column surveys the field of publishers&#8212;one by one&#8212;that 
          create the books we love.</strong></font></p>
        </td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="400" valign="top" align="right">
 <p>
	  <cfoutput>

<cfset xImage = "Texas1.jpg">
	<cfset xPath = "../../booklist/2007_Summer">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="U Texas">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
	<a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=24"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
		
		<cfset xImage = "Texas2.jpg">
	<cfset xPath = "../../booklist/2007_Summer">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="U Texas">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
	<a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=24"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br>
          
          
			<cfset xImage = "Texas3.jpg">
	<cfset xPath = "../../booklist/2007_Summer">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="U Texas">
	<cfset xBorder="0"><br>
	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
	
	<a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=24"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
		<cfset xImage = "Texas4.jpg">
	<cfset xPath = "../../booklist/2007_Summer">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm"> 
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="U Texas">
	<cfset xBorder="0">
            <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
     <a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=24"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a> 
          </cfoutput> </p>
      </TD>
   <td width="20">&nbsp;
  </td>
      <td width="480" valign="top"> <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          photographers and publishers form the X and Y axes upon which great 
          photobooks are crafted. This column explores the vast continuum of publishers 
          that exists in the world today, from small art presses to mid-size publishers 
          to the large houses that have survived the decades. In this issue we 
          spoke with Theresa May, assistant director and editor-in-chief at the 
          University of Texas Press. She has been with the Press for nearly thirty 
          years.</font></p>
        <p>What is your vision of photography and publishing?<br>
          In an age of streaming video, it feels as if we never quite see anything 
          clearly, in detail. Contemporary photography is a mirror in which we 
          are caught, both reflected and reflected upon, as individuals and as 
          societies. Publishing contemporary photography seems a cultural imperative, 
          especially in our region where so many different vectors cross, but 
          it is also a joy to showcase incredible work.<br>
          We are looking for two things in a book: the quality of the work, and 
          the resonance of the work with our larger list. We do hope, of course, 
          for some sales potential, since most of these books have to be subsidized 
          in order to maintain our very high production values. In the end, though, 
          it&#8217;s the things that speak to us personally, the ineffable intangibles, 
          that help us decide among the many projects that we see. We are almost 
          always in agreement about which ones to pursue.<br>
          <br>
          Who do you see as your audience?<br>
          Art and photography professionals, as well as general readers.<br>
          <br>
          What quantity of books do you publish per year/season?<br>
          We publish four to six pure photography titles per year. Many of the 
          100+ books that we publish annually have a significant photographic 
          component. Our photography books fall into two categories. Wittliff 
          Gallery Series books are chosen and edited by Bill Wittliff. The photographers 
          come from the Wittliff Gallery Collection of Southwestern and Mexican 
          Photography, housed at Texas State University in San Marcos. The second 
          category comprises books that we choose in-house, usually cooperatively 
          between the marketing manager, Dave Hamrick, and the editorial staff. 
          <br>
          <br>
          How do you acquire new titles? <br>
          About half of our photography titles are part of a series in Southwestern 
          and Mexican photography, edited by Bill Wittliff. Others come by referrals 
          from other authors or photographers or through active research. Photographers 
          are attracted to us not only by our high production values and the quality 
          of the photographers we have published, but also the authors and critics 
          who have written for us, notably John Szarkowski, Anne Wilkes Tucker, 
          A. D. Coleman, Larry McMurtry, John Wood, John Berendt, Elena Poniatowska 
          and Charles Bowden. <br>
          <br>
          What future projects really excite you right now?<br>
          This Fall we are anticipating a true landmark at the intersection of 
          popular culture, literature and photography. Bill Wittliff&#8217;s iconic 
          photographs taken on the set of Lonesome Dove will be published for 
          the first time in a gorgeous book with texts by Wittliff, Larry McMurtry 
          and Steve Harrigan. In the Spring of 2008, we will publish a stunning 
          group of New Orleans, post-Katrina photographs by digital techniques 
          pioneer Dan Burkholder, with text by Andrei Codrescu. Later in 2008, 
          we have a new collection by O. Rufus Lovett and a two-volume abridged 
          edition of Anita Brenner&#8217;s journals illustrated with more than 
          600 works of art, including some 375 Edward Weston photographs. <br>
          <br>
          What are your submission guidelines?<br>
          Our submission guidelines are on our website (www.utexas.edu/utpress) 
          under Author Guidelines. <br>
          <br>
          Contact Information: <br>
          Theresa May: theresa@utpress.ppb.utexas.edu <br>
          <br>
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">To 
          see a list of the publishers to be featured in Publisher Profile <a href="http://www.photoeye.com/templates/PubShowCase_home.cfm">click 
          here.</a> </font><br>
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><br />
          <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE031">Order</a> 
          the current issue of <i>photo-eye Booklist</i>. </font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">
		<a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a> 
          to the <i>photo-eye Booklist</i></font>.<br>
        </p>
        </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




