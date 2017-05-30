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
      <td colspan="3" align="center"> <font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>QUARTOS 
        UNDER GLASS<br>
        </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>An 
        exhibition of photobooks at Howard Greenberg Gallery is reviewed.<br />
        BY GEORGE SLADE</strong></font></td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="400" valign="top" align="right">
      <p>
  <cfoutput>
<cfset Catalog="">
<cfset xImage = "Photo-Libris-montage.jpg">
	<cfset xPath = "../../booklist/2006_Fall">
	<CFSET xHEIGHT = "400">
	<CFSET xWidth = "400">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Howard Greenberg">
	<cfset xBorder="0">

	<img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br>          <br><font size="1" color="##333333" face="Arial, Helvetica, sans-serif">Image courtesy Howard Greenberg Gallery</font><br><br>
	
	
	
	
	
		</cfoutput>
		
      </p>
      </TD>
   <td width="20">&nbsp;
  </td>
      <td width="480" valign="top"> <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          WILLIAM KLEIN. EIKOH HOSOE. EDWARD STEICHEN. Bill Burke. Gilles Peress. 
          Bruce Davidson. Dave Heath. Besides being male and having lived in the 
          20th century (at one end of it or the other), what do these photographers 
          have in common? Imagine a gallery show of the seven alongside work by 
          Walker Evans, Dorothea Lange, and Russell Lee: What would be the common 
          thread, the through-line of that exhibition narrative? Books, a prominent 
          New York City photography gallery recently answered. Books marked by 
          the artists (and/or authors) and received from their hands; books that 
          have been celebrated and coveted in the surge of interest in the photography 
          book as a collectible object in recent years. </font></p>
        <p>...<br>
          <br>
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          Continue reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE028"><br>
          ordering the current issue</a> of <i>photo-eye Booklist</i>. </font></p>
        <a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a> 
        to the photo-eye Booklist<br>
        </p>
    </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




