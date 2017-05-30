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
	
		<cfset page="Article">
	<CFINCLUDE TEMPLATE="../../templates/Title.cfm">
	<CFOUTPUT>#xHTMLTitle#</CFOUTPUT>
	<BR><BR>
	
<cfset xmenupath="../">
 <cfinclude template="../include_menu.cfm">
 <br /><br />

<FONT FACE="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333">

<TABLE WIDTH="700">
    <TR> 
      <td colspan="3" align="center">
<p>&nbsp;
        <p><font color="#333333" size="3" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong>OUT 
          THERE, HIDDEN</strong></font> 
        <p><font color="#333333" size="3" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong> 
          <font size="2">Personal and public identity lies at the heart of the 
          photographic projects of TARYN SIMON. In her newest book, she surveys 
          those places that are fundamentally American and yet inaccessible to 
          the public.</font></strong></font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong> 
          A PHOTO-EYE PRESENTATION</strong></font></p></td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="200" valign="top" align="right">
<cfoutput>

<cfset xImage = "taryn_spread.jpg">
	<cfset xPath = "../../booklist/2007_Fall">
	<CFSET xHEIGHT = "320">
	<CFSET xWidth = "320">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="American Index">
	<cfset xBorder="0">

	<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP657"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a>
	<br><br>
          <br>
</cfoutput>
 </p></TD>
    <td width="20">&nbsp; </td>
      <td width="480" valign="top"> <p><em>An American Index of the Hidden and 
          Unfamiliar</em> is the newest body of work from a young photographer 
          that has already captured national attention. In 2003, Simon published 
          The Innocents (Umbrage Editions), a group of photographs that documented 
          cases of wrongful conviction in the United States, and consisted of 
          straightforward portraits of former convicts, each of whom had been 
          proven inncent through DNA testing. Most of the wrongfully convicted 
          had been misidentified by witnesses. In this new body of work, the sites 
          identified by the lengthy captions rarely receive &#8216;witnesses&#8217; 
          or visitors of any kind. While many of them are controversial and inaccessible, 
          the vast majority are also integral to national identity, thus raising 
          a slew of questions.<font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          </font></p>
        <p>&#8230;</p>
        <p><em>An American Index of the Hidden and Unfamiliar</em>. Photographs 
          by Taryn Simon. Foreword by Salman Rushdie. Commentary by Ronald Dworkin. 
          Essay by Elisabeth Sussman, Christina Kukielski. Text by Taryn Simon, 
          Shannon Simon, and Aliza Wattersetty.Steidl/Whitney Museum, G&ouml;ttingen, 
          2007. Designed by Joseph Logan and Taryn Simon. Printed by Steidl, G&ouml;ttingen. 
          Clothbound with debossed boards. 70 pp., 57 four-color illustrations, 
          10 &times; 13&frac12 $75.00</p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">Continue 
          reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE032
		 ">ordering</a> the<br>
          current issue of <i>photo-eye Booklist</i>. </font><br><br>
          <a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=DP657&CFID=5471729&CFTOKEN=67441906">Order</a> 
          <em>An American Index of the Hidden and Unfamiliar</em> 
        <p> <a href="http://www.photoeye.com/booklist/subscribe.cfm" target="_blank">Subscribe</a> 
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




