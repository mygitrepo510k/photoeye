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
	
<cfset xmenupath="../">
 <cfinclude template="../include_menu.cfm">
 <br /><br />

<FONT FACE="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333">

<TABLE WIDTH="700"><TR>
<td colspan="3" align="center"> <font color="#333333" size="3" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong>PUBLISHING 
          THE PHOTOGRAPHY BOOK<br>
          </strong></font><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong>The 
          acclaimed column on publishing photography books.<br>
          BY MARY VIRGINIA SWANSON & DARIUS HIMES</strong></font></td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="200" valign="top" align="right">
<cfoutput>

<cfset xImage = "ulrich_screenshot.jpg">
	<cfset xPath = "../../booklist/2006_Winter">
	<CFSET xHEIGHT = "320">
	<CFSET xWidth = "320">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Website">
	<cfset xBorder="0">
<a href="http://www.notifbutwhen.com">
	<img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a>
	<br><br>         
        		  
	<cfset xImage = "Pickett-screenshot.jpg">
	<cfset xPath = "../../booklist/2006_Winter">
	<CFSET xHEIGHT = "320">
	<CFSET xWidth = "320">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Website">
	<cfset xBorder="0">
<a href="http://www.savingbodyandsoul.com">
	<img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br>
    </cfoutput>
		</TD>
   <td width="20">&nbsp;
  </td>
      <td width="480" valign="top"> <p>SINCE THE SUMMER OF 2004, noted author 
          and photography consultant Mary Virginia Swanson and our own editor, 
          Darius Himes, have been co-authoring an ongoing column about the ins-and-outs 
          of publishing a book of photography. Written for active photographers, 
          the column has explored the full range of this topic, from the initial 
          concept of the book, to researching appropriate publishers and examining 
          their contracts, through to seeing the book on-press. The last two articles 
          (Summer and Fall 2006) have focused on post-publication promotion of 
          the book. In their 11th installment, they talk with two very different 
          photographers, with recent publications to promote, who have used their 
          websites to maximum effect.
        </p>
       <p>...</p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          </font> <font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"> 
          Continue reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=PE029"> 
          ordering</a> the <br>current issue of <em>photo-eye Booklist.</em><br />
          <br>
          <a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a> 
          to the <em>photo-eye Booklist.</em> <br>
          </font></p>
        </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




