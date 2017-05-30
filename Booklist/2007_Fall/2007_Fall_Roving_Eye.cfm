<cflocation url="http://www.photoeye.com/magazine" addtoken="no">

<!---<CFPARAM NAME="Season" DEFAULT="Fall">
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
	
	<CFOUTPUT>#xHTMLTitle#</CFOUTPUT> <!--- <FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" style="font-size:30px" COLOR="##333333">
	 <strong>photo-eye Booklist</strong>
	</font> --->
	<BR><BR>
<FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333">

<cfset page="About">
<cfset xmenupath="../">
 <cfinclude template="../include_menu.cfm">
 <br /><br />


<TABLE WIDTH="700">

    <tr> 
      <td colspan="3" ALIGN="CENTER"><p>&nbsp;</p>
        <p><strong><font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">ROVING 
          EYE</font></strong></p>
        <p><strong><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">Kerouac, 
          Coekin, the camera. . .and the open road. A new column</font></strong></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>BY 
          AVIS CARDELLA<br>
          </strong></font></p>
        </td></tr>
<tr><td colspan="3" ALIGN="CENTER">&nbsp;</td></tr>
<TR>
 
 
    <td width="298" valign="top" align="right">
 <p>
	  <cfoutput>
	  <cfset xImage = "Chris_Coekin.jpg">
	<cfset xPath = "../../booklist/2007_Fall">
	<CFSET xHEIGHT = "320">
	<CFSET xWidth = "320">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Chris Coekin, The Hitcher">
	<cfset xBorder="0">

	<a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=ZD186&CFID=5471729&CFTOKEN=67441906"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a>
	<br><br>
</cfoutput>
		
      </p>
  </TD>
   <td width="20">&nbsp;
  </td>
      <td width="480" valign="top"> <p>2007 MARKS THE 50TH ANNIVERSARY OF THE 
          publicaton of Jack Kerouac&#8217;s <em>On the Road,</em> one of the 
          defining books of the beat generation. To commemorate this event there 
          are several new Kerouac publications hitting the bookstores (see sidebar). 
          Meanwhile, the famous &#8220;scroll&#8221; on which the novel was originally 
          written, is continuing its own symbolic &#8220;road trip&#8221; of sorts. 
          The artifact is currently on display in Lowell, Massachusetts, after 
          which it will travel to the New York Public Library, New York City. 
        <p>This current wave of interest in Kerouac&#8217;s iconic novel sparked 
          my imagination and got me wondering about a visual equivalent beyond 
          the obvious example of Robert Frank&#8217;s seminal book <em>The Americans</em>. 
          I immediately thought of Stephen Shore, who, in 1972 created the work 
          for <em>American Surfaces</em>, an informal diary of images depicting 
          the meals, hotel beds, people and places he encountered in a Kerouac 
          style road trip across America. Between 1973 and 1980, again while traveling 
          by car across the U.S., he created a series of images which was eventually 
          published under the title <em>Uncommon Places</em>. Both of these works&#8212;important 
          documents in color photography&#8212;have influenced a generation of 
          photographers.
        <p> Yet, as influential as Frank&#8217;s and Shore&#8217;s photography 
          has been stylistically, I realized that the road trip has not fared 
          as well. There are two notable examples from recent years, such as the 
          2002 release of <em>Winogrand: 1964</em> which follows the from-the-hip 
          shooter on a Guggenheim funded trip around the country, and Alec Soth&#8217;s 
          <em>Sleeping Along the Mississippi</em>, which could be characterized 
          as such. But I would have expected many more photographers to employ 
          the Kerouac template in their photographic journeys over the past few 
          decades. 
        <p> Recently, I was pleasantly surprised to discover the latest work from 
          British photographer Chris Coekin. In his book, <em>The Hitcher</em> 
          (which is also on exhibit at London&#8217;s The Photographers&#8217; 
          Gallery through September 2nd) Coekin records his six years of hitchhiking 
          shenanigans across England, Scotland, Wales and Northern Ireland. 
        <p>&#8230; 
        <p><em>The Hitcher</em>. Photographs by Chris Coekin. Introduction by<br>
          Camilla Brown. Short story by Chris Coekin. Walkout Books in<br>
          association with The Photographers&#8217; Gallery, London, 2007.<br>
          Designed by Why Not Associates. Printed by EBS, Verona.<br>
          Trade edition of 1,000. Hardbound with photo-illustrated dustjacket.<br>
          128 pp., 105 four-color illustrations, 10 x 6&frac12 $49.95 
        <p> <a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=ZD186&CFID=5471729&CFTOKEN=67441906">Order</a> 
          <em>The Hitcher</em> </p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">Continue 
          reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE032
		  "> ordering</a> the <br>
          current issue of <em>photo-eye Booklist</em>.</font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><a href="http://www.photoeye.com/booklist/subscribe.cfm" target="_blank">Subscribe</a> 
          to the <em>photo-eye Booklist.</em> </font></p>
        </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">--->




