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
 
  <TABLE WIDTH="700">
    <TR> 
      <td colspan="3" align="center"> <font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>TREASURES 
        IN LEIPZIG<br>
        </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>Our 
        foreign correspondent discovers a treasure trove in Germany.<br />
        BY MARY GOODWIN</strong></font></td>
    </tr>
    <tr> 
      <td colspan="3">&nbsp; </td>
    </tr>
    <td width="400" valign="top" align="right"> <p> <cfoutput> 
            <cfset Catalog="Leipzig Library">
          <cfset xImage = "Leipzig-library.jpg">
          <cfset xPath = "../../booklist/2006_Fall">
          <CFSET xHEIGHT = "400">
          <CFSET xWidth = "400">
          <cfinclude template="../../templates/imagesizer.cfm">
          <CFSET xCoverHeight = imagecr.height>
          <CFSET xCoverWidth = imagecr.width>
          <cfset xTitle2x="Leipzig Library">
          <cfset xBorder="0">
          	
<img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a>
          <br><font size="1" color="##333333" face="Arial, Helvetica, sans-serif">© Mary Goodwin</font><br> <br>
        </cfoutput> </p></TD>
    <td width="20">&nbsp; </td>
    <td width="480" valign="top"> <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          LEIPZIG, GERMANY, has been on the book lover&#8217;s map for centuries. 
          This mid-sized town deep in the heart of the state of Sachsen boasts 
          a tradition rich in literature and publishing; the first book published 
          in Leipzig came out in 1481, and in 1900, 144 book publishers operated 
          in the city center. Today, the Leipzig Book Fair draws international 
          authors and publishers to the city each spring.<br>
          <br>
          Clearly, Leipzig loves books. It comes as no surprise, then, that the 
          City of Limes is also the home of the German National Library, one of 
          three national archives that collect, house and preserve printed material 
          published in Germany after the year 1913, a year after the library&#8217;s 
          founding. While the collections offer an astonishing range of historical 
          and current titles, of particular interest is the library&#8217;s holdings 
          of photobooks. In this area, the German National Library delivers the 
          unique opportunity to view some of Germany&#8217;s most treasured and 
          controversial masterworks.</font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          Anyone over the age of 18 with a current form of identification can 
          place a request to view the library&#8217;s holdings. (In order to view 
          certain rare or extremely valuable titles, visitors must prove that 
          the materials are necessary for their scientific or professional research.) 
          The library&#8217;s <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><a href="http://dbl-opac.ddb.de/" target="_blank">online catalog and request form</a> </font> 
          make it easy to order up to six books a day, and pending review and 
          available personnel to pull the books from the archive, titles are generally 
          ready to be picked up two to three hours after submitting a request. 
          </font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          After paying a small fee of 5 Euro (about US $6) for a day pass, visitors 
          are free to take their books to the library&#8217;s massive main reading 
          room to leaf through at their leisure; this is a reading library, so 
          no books may be checked out. Tip for non-German-speaking photobook fans: 
          You are advised to stroll through the <a href="http://www.ddb.de/eng/service/index.htm" target="_blank">library&#8217;s English-language 
          web pages</a> before visiting the archive; while the front desk attendants are extremely friendly and knowledgable 
          about Library procedures, speaking English is not a requisite for the 
          job. Be ready to drop off your purse, briefcase or backpack at the coat 
          check directly to the left as you enter the building.</font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          A typical session at the library might include hours spent with a 1936 
          printing of Karl Blossfeldt&#8217;s gorgeous 1928 <em>Archetypal Forms 
          of Art</em>, Dr. Hans Killian&#8217;s 1934 <em>Facies Dolorosa: The 
          Face of Pain</em>, or for a taste of the postwar German photobook, a 
          little face time with <em>Subjective Photography: A Collection of Modern 
          European Photography</em>, 1952, edited by Otto Steinert. Titles from 
          the Nazi era, such as <em>USA Naked!: Photographs from God&#8217;s Own 
          Country</em>, edited by Erwin Berghaus, are also available. Those with 
          an interest in propaganda books produced in the former East German Republic 
          should avail themselves of the library&#8217;s copy of <em>Stalinallee: 
          The National Reconstruction Programme</em>, 1952, edited by Gerhard 
          Puhlmann.</font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          While photobook tourism has yet to catch on in the mainstream, those 
          in the know who count photobooks as one of life&#8217;s great pleasures 
          will consider an afternoon with the German National Library&#8217;s 
          offerings a high point of any visit to Leipzig.<br>
          </font><br>
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE028">Order 
          the current issue</a> of <i>photo-eye Booklist</i>. </font><br>
          <br />
          <a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a> 
          to the photo-eye Booklist.<br>
          </p>
          </p>
      </TD>
    </TR>
    <tr>
      <td valign="top" align="right">&nbsp;</TD>
      <td>&nbsp;</td>
      <td valign="top">&nbsp;</TD>
    </TR>
  </TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




