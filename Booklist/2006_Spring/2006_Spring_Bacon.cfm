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
<br><br> 
<TABLE WIDTH="700"><TR>
<td colspan="3" align="center"> <font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>INTO AND THROUGH <br>
</strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>Francis Bacon's relationship to photography is explored. By GEORGE SLADE </strong></font></td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="400" valign="top" align="right">
      <p>
	  <cfoutput>
<cfset Catalog="NT154">
<cfset xImage = "BACON-pl-206-207.jpg">
	<cfset xPath = "../../booklist/2006_Spring">
	<CFSET xHEIGHT = "400">
	<CFSET xWidth = "400">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="In Camera">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=NT154"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
		
		<cfset Catalog="NT154">
<cfset xImage = "BACON-pl-188-189.jpg">
	<cfset xPath = "../../booklist/2006_Spring">
	<CFSET xHEIGHT = "400">
	<CFSET xWidth = "400">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="In Camera">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=NT154"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
		</cfoutput>
		
      </p>
      </TD>
   <td width="20">&nbsp;
  </td>
  <td width="480" valign="top">
    <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">  PHOTOGRAPHY FLOWS INTO AND THROUGH THE
work of Irish-born painter Francis Bacon (1909–1992). Unlike
Robert Rauschenberg and Andy Warhol, both of whom used
photographs as collage or source material, Bacon absorbed photography
as both a bearer of fascinating content and as a transformative
phenomenon. Though he disdained it as an art form—
“I’m not particularly interested in that aspect of photography,” he
once said—he revered photography’s more quotidian products.
“99 per cent of the time,” Bacon claimed in an interview, “I find
that photographs are very much more interesting than abstract or
figurative painting. I have always been haunted by them.” He put
Muybridge on the same plane as Michelangelo for his excellent
renditions of the human form, and may have benefited from
Marey in equal measures as from Picasso.



<br><br />
Continue reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=pe026">ordering the current issue</a> of photo-eye Booklist. 

          </font></p>
 <!---   <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">--Karen Sinsheimer</font></p> --->
    <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><i>In Camera.</i> Francis Bacon. Photography, Film and the Practice
of Painting. Text by Martin Harrison. Thames & Hudson, New
York, 2005. Designed by Martin Harrison and Tony
Waddingham. Printed by Steidl, Göttingen. Clothbound with
photo-illustrated dustjacket. 256 pp., 275 color and black-andwhite
illustrations, 9¼ x 10½ $60.00
Images courtesy of Thames & Hudson.


</font><br><br>
	<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=NT154"><strong>Order</strong></a> <i>In Camera. Francis Bacon. Photography, Film and the Practice of Painting.
</i> Text by Martin Harrison.<br><br />
	<a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a> to the photo-eye Booklist<br></p>
    </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




