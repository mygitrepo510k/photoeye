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
 <br /><br />
 
  <TABLE WIDTH="700">
    <TR> 
      <td colspan="3" align="center"> <font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>INTERVIEW 
        WITH EGGLESTON:<br>
        </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>The 
        Surprising Man from Memphis<BR>
        <br />
        William Eggleston has just published a new book of older work. ERIC MILES 
        and our editor DARIUS HIMES catch up with him to hear about the past, 
        present and future.</strong></font></td>
    </tr>
    <tr> 
      <td colspan="3">&nbsp; </td>
    </tr>
    <td width="400" valign="top" align="right"> <p> <cfoutput> 
	          <cfset Catalog="tr197">
          <cfset xImage = "Black-woman-in-violet-dress.jpg">
          <cfset xPath = "../../booklist/2007_Spring">
          <CFSET xHEIGHT = "320">
          <CFSET xWidth = "320">
          <cfinclude template="../../templates/imagesizer.cfm">
          <CFSET xCoverHeight = imagecr.height>
          <CFSET xCoverWidth = imagecr.width>
          <cfset xTitle2x="5x7">
          <cfset xBorder="1">
            <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
            <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=TT142"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"> 
            <br>
            <br><cfset xImage = "Eggleston-cover.jpg">
          <cfset xPath = "../../booklist/2007_Spring">
          <CFSET xHEIGHT = "320">
          <CFSET xWidth = "320">
          <cfinclude template="../../templates/imagesizer.cfm">
          <CFSET xCoverHeight = imagecr.height>
          <CFSET xCoverWidth = imagecr.width>
          <cfset xTitle2x="5x7">
          <cfset xBorder="0">
            <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
            <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=TT142"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a> 
            <br>
        </cfoutput> </p></TD>
    <td width="20">&nbsp; </td>
      <td width="480" valign="top"> <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          </font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          </font>In 1976, WILLIAM EGGLESTON&#8217;S vibrant color pictures of 
          seemingly banal subject matter, taken in and around his hometown of 
          Memphis, Tennessee, were exhibited at the Museum of Modern Art in New 
          York City. Curated and championed by the legendary John Szarkowski, 
          it was the first one-man show of color photographs ever mounted by the 
          museum. Exhibited at a time when color photographs were relegated to 
          either the commercial world or the family snapshot, his work was received 
          with a great deal of bewilderment. <i>The New York Times</i> described it as 
          &#8220;the most hated show of the year.&#8221;<br><br>
          Nonetheless, the groundbreaking exhibition and the accompanying catalogue&#8212;the 
          now classic <i>William Eggleston&#8217;s Guide</i>&#8212;put both the 37-year-old 
          photographer and color photography on the map. During the intervening 
          three decades since that show, Eggleston&#8217;s vernacular style of 
          photography, coupled with a sensitive attention to color and commonplace 
          objects, has had a profound and sweeping influence on a younger generation 
          of artists.<br><br>
          Twin Palms Publishers has just published a book entitled <i>5x7</i> which presents 
          some surprising work by the man most of us know primarily through his 
          handheld 35mm work. Frequenting the bars and nightclubs around Memphis, 
          Eggleston would occasionally bring along a large-format view camera, 
          which produced 5x7 inch negatives. It was hardly a handheld, spur-of-the-moment 
          kind of camera. Yet, Eggleston produced a group of portraits, almost 
          all of which are detail-rich head and torso views, that are surprisingly 
          original and spontaneous. <br><br>
          <i>5x7</i> presents 60 photographs, mostly portraits interspersed with the 
          intermittent picture of a building, or a car lot, or the interior of 
          a diner. The book is divided evenly between color and black-and-white 
          work, and Michael Almereyda, who produced the documentary film <i>William 
          Eggleston in the Real World</i> (2006), provides a cogent essay. <br><br>
          Shortly before the winter holidays, Eggleston spoke to us over the phone, 
          happy to hear about the reception of the book and eager to tell us of 
          his current adventures. </p>
        <p>&#8230;</p>
        <p><i>5x7</i>. Photographs by William Eggleston. Text by Michael Almereyda. Twin 
          Palms Publishers, Santa Fe, 2006. Clothbound with photo-illustrated 
          dustjacket. 96pp., 29 black-and-white and 32 four color plates, 11 &times; 
          14 $65.00<br>
        </p>
        <p> <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          Continue reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE030
		 ">ordering</a> 
		  the<br> current issue of <i>photo-eye Booklist</i>. </font><br>
          <br />
          <a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a> 
          to the <em>photo-eye Booklist. </em> <br>
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




