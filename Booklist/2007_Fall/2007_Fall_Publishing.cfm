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
        <p><font color="#333333" size="3" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong>PUBLISHING 
          THE PHOTOGRAPHY BOOK:</strong></font><br>
          <font color="#333333" size="3" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong>LIMITED 
          EDITIONS, PART II</strong></font> 
        <p><font color="#333333" size="3" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong> 
          <font size="2">A column about the ins-and-outs of publishing.</font></strong></font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong> 
          BY MARY VIRGINIA SWANSON AND DARIUS HIMES</strong></font></p></td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="200" valign="top" align="right">
<cfoutput>

<cfset xImage = "Sean_Perry.jpg">
	<cfset xPath = "../../booklist/2007_Summer">
	<CFSET xHEIGHT = "320">
	<CFSET xWidth = "320">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Sean Perry">
	<cfset xBorder="0">
          <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=ZD133"><img src="Sean_Perry.jpg"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="494" WIDTH="360"></a> 
          <br>
          <br>
          <br>
    </cfoutput>
		</TD>
   <td width="20">&nbsp;
  </td>
      <td width="480" valign="top"> <p>SINCE SUMMER 2004, Mary Virginia Swanson 
          and Darius Himes have presented, in a column that appears in each issue 
          of photo-eye Booklist, detailed steps that outline the process of having 
          a book of photographs published. Entering the third year of this acclaimed 
          column, they now turn their attention to the practice of publishing 
          a limited edition book along with the trade edition. The market for 
          collectible photography books and prints has never been better. Many 
          publishers produce photography books in deluxe editions, hoping to capitalize 
          on the marketplace.</p>
        <p> In this second installment of a three-part series, the authors talk 
          with two photographers&#8212;LA-based photographer Hiroshi Watanabe 
          and NY-based Sean Perry&#8212;that have self-published books of their 
          work and have met with success in the process. <br>
          &#8230; </p>
        <p><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif">Continue 
          reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=PE032"> 
          ordering</a> the <br>
          current issue of <em>photo-eye Booklist.</em><br />
          <br>
          <a href="http://www.photoeye.com/booklist/subscribe.cfm" target="_blank">Subscribe</a> 
          to the <em>photo-eye Booklist.</em> <br>
          </font></p>
       </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




