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
      <td colspan="3" align="center"> <font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>THE 
        CREATIVITY OF LIMITATIONS<br>
        </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>Raymond 
        Meeks talks about using books in his creative process.<br />
        BY DARIUS HIMES</strong></font></td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="400" valign="top" align="right">
      <p>
	  <cfoutput>
<cfset Catalog="">
<cfset xImage = "MINNA-1.jpg">
	<cfset xPath = "../../booklist/2006_Fall">
	<CFSET xHEIGHT = "400">
	<CFSET xWidth = "400">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Raymond Meeks">
	<cfset xBorder="0">

		<img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
		
		<cfset Catalog="">
<cfset xImage = "MINNA-COVER.jpg">
	<cfset xPath = "../../booklist/2006_Fall">
	<CFSET xHEIGHT = "200">
	<CFSET xWidth = "200">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Raymond Meeks">
	<cfset xBorder="0">

		<img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>	
		
		</cfoutput>
		
      </p>
      </TD>
   <td width="20">&nbsp;
  </td>
      <td width="480" valign="top"> <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          AT PHOTO LA, BACK IN JANUARY, amidst the packed aisles, some used books 
          caught my eye. It was a collection of artists&#8217; books made by Raymond 
          Meeks. Meeks, whose work first came to greater public notice with the 
          2004 publication <em>Sound of Summer Running</em>, has been essentially 
          collaborating with various used volumes by adding his own photographs, 
          altering the page count in certain cases, and somewhat rebinding the 
          books. What struck me was the spontaneous spirit that these books embodied; 
          they didn&#8217;t seem belabored. I became curious about the role that 
          these books seem to play as a place to work out editing and sequencing 
          and ultimately furthering a body of work. We spoke over email recently 
          about this creative process. </font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">...</font></p>
        <p>View Meeks&#8217;s work at <a href="http://www.raymondmeeks.net" target="_blank">his 
          website</a> . </p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">Continue 
          reading this article by<br>
          <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE028">ordering 
          the current issue</a> of <i>photo-eye Booklist</i>. </font></p>
        <a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a> 
        to the photo-eye Booklist<br>
        </p>
    </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




