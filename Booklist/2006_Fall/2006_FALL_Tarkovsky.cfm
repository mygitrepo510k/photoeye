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
      <td colspan="3" align="center"> <font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>SALAMANDER 
        OF THE HUMAN SOUL<br>
        </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>A 
        book of Polaroids by the great Russian filmmaker is reviewed.<br />
        BY KRISHNAN VENKATESH</strong></font></td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="400" valign="top" align="right">
      <p>
	  <cfoutput>
<cfset Catalog="NT176">
<cfset xImage = "TARKOVSKY-pg-79.jpg">
	<cfset xPath = "../../booklist/2006_Fall">
	<CFSET xHEIGHT = "400">
	<CFSET xWidth = "400">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Instant Light">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=NT176"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
		
		<cfset Catalog="NT176">
<cfset xImage = "INSTANT-LIGHT-COVER.jpg">
	<cfset xPath = "../../booklist/2006_Fall">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Instant Light">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=NT176"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>	
		
		</cfoutput>
		
      </p>
      </TD>
   <td width="20">&nbsp;
  </td>
      <td width="480" valign="top"> <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          ONE OF THE GREATEST VISUAL ARTISTS of the 20th century, Andrey A. Tarkovsky 
          (1932&#8211;86) is best known for a small body of cinematic masterpieces 
          that includes <em>Andrei Rublev, Mirror, Solaris</em>, and <em>Stalker</em>. 
          These are films about the darkest spiritual despair as well as the discovery 
          of hope and love, but they are also films of striking beauty, in which 
          the texture of each cloth and tree bark emerges so clearly as to make 
          every inch of the screen seem to tremble with life, and in which the 
          elemental flow of light bathes animate and inanimate alike with soul. 
          His book <em>Sculpting in Time</em> (1986) may be the most wonderful 
          book ever written on cinema, and throughout the book Tarkovsky points 
          to the rhythm and motion of time as the director&#8217;s medium and 
          instrument. Strange, then, to find out that Tarkovsky took Polaroids, 
          that peculiarly momentary and unsculptable form of photograph that seems 
          antithetical to the large movements of the cinematic project.</font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><em> 
          Instant Light</em> is a remarkable collection of images and words. It 
          contains 60 Polaroids taken between 1979 and 1986 in Russia and Italy, 
          interspersed with comments taken from Tarkovsky&#8217;s writings, with 
          an introduction by screenwriter Tonino Guerra, and a rich little meditative 
          essay by photographer Giovanni Chiaramonte that itself is worth the 
          price of the book.</font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">...</font></p>
        <p><em>Instant Light</em>. Photographs by Andrey A. Tarkovsky. Edited 
          by Giovanni Chiaramonte and Andrey A. Tarkovsky. Introduction by Tonino 
          Guerra. Essay by Giovanni Chiaramonte. Thames &amp; Hudson, London, 
          2006. Softbound. 136 pp., 7 black-and-white and 62 color illustrations, 
          6&frac14; x 8&frac12; $24.95 All images &copy; Andrey A. Tarkovsky. 
          All Rights Reserved.<br>
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><br>
          </font> <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">Continue 
          reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE028"><br>
          ordering the current issue</a> of <i>photo-eye Booklist</i>. </font></p>
        <!---   <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">--Karen Sinsheimer</font></p> --->
        <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=NT176"><strong>Order</strong></a> 
        <i>Instant Light.</i><br>
        <br />
	<a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a> to the photo-eye Booklist<br></p>
    </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




