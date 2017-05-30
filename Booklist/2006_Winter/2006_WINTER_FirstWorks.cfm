<CFPARAM NAME="Season" DEFAULT="Fall">
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
 
<TABLE WIDTH="700"><TR>
      <td colspan="3" align="center"> <p><font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>WHO'S 
          ON FIRST?<br>
          </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>A fascinating new book explores the 'first works' of today's artists.</strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong><br>
          BY FRANCESCA RICHER AND MATTHEW ROSENWEIG<br>
          </strong></font></p>
        </td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="297" valign="top" align="right">
      <p>
	  <cfoutput>

	<cfset Catalog=" DP271">
<cfset xImage = "DIJKSTRA-BIG-2.jpg">
	<cfset xPath = "../../booklist/2006_Winter">
	<CFSET xHEIGHT = "320">
	<CFSET xWidth = "320">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="First Works">
	<cfset xBorder="0">
	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
	<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP271"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
			
	<cfset Catalog=" DP271">
<cfset xImage = "neshat-big-2.jpg">
	<cfset xPath = "../../booklist/2006_Winter">
	<CFSET xHEIGHT = "320">
	<CFSET xWidth = "320">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="First Works">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP271"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
	
	<cfset Catalog=" DP271">
<cfset xImage = "MIKHAILOV-PAGE.jpg">
	<cfset xPath = "../../booklist/2006_Winter">
	<CFSET xHEIGHT = "320">
	<CFSET xWidth = "320">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="First Works">
	<cfset xBorder="0">
	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
	<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP271"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
				
		<cfset Catalog=" DP271">
<cfset xImage = "first-works-cover.jpg">
	<cfset xPath = "../../booklist/2006_Winter">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="First Works">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP271"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>	
		
		</cfoutput>
		
      </p>
      </TD>
   <td width="13">&nbsp;
  </td>
      <td width="374" valign="top"> <p>&#8220;WHAT WAS YOUR FIRST WORK OF ART?&#8221; 
          This is the question that editors Francesca Richer and Matthew Rosenzweig 
          posed to over 300 photographers, sculptors, contemporary painters and 
          filmmakers. The answers they received are astounding. These artists 
          were asked to submit their &#8220;first&#8221;art work&#8212;the piece 
          that marked either the beginning of their mature artistic life or a 
          pivotal point in their career&#8212;along with a brief statement about 
          the piece. Compiled and presented in alphabetical order in a handsomely 
          designed book, the works, and thus the book, stand out as an education 
          into the creative process of artists from across the disciplines. Richer 
          and Rosenzweig discuss the genesis of the project in their introduction, 
          reproduced below. 
        <p>....</p>
        <p><em>No. 1 First Works by 362 Artists</em>. Edited by Francesca Richer and Matthew Rosenzweig. Distributed Art Publishers, New York, 2006. Designed by Francesca Richer. Printed by Palace Press International, China. Cloth over thin boards with flexi-binding. 424pp., 356 color and 142 b&w illustrations, 7¾ × 9¼ $39.95 <br>
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><br>
          </font> <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">Continue 
          reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=pe029">ordering</a> 
		  the<br> current issue of <i>photo-eye Booklist</i>. <br>
          </font><br>
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP271">Order</a> 
          <i>No. 1 First Works by 362 Artists</i></font>. <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><br>
          </font> <br />
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a> 
          to the <em>photo-eye Booklist</em>.<br>
          </font> </p>
        </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




