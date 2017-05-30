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
	
<cfset xmenupath="../">
 <cfinclude template="../include_menu.cfm">
 <br /><br />

<FONT FACE="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333">

<TABLE WIDTH="700"><TR>
      <td colspan="3" align="center"> <font color="#333333" size="3" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong>Publishing 
        the Photography Book: <br>
		Extending the Life of Your Project<br><br>
        </strong></font><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong>The ongoing column about publishing photobooks.<br>
          By Mary Virginia Swanson and Darius Himes</strong></font></td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="200" valign="top" align="right">
<cfoutput>

<cfset xImage = "BREAKING-BOUNDS-CALENDAR.jpg">
	<cfset xPath = "../../booklist/2007_Spring">
	<CFSET xHEIGHT = "320">
	<CFSET xWidth = "320">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Calendar">
	<cfset xBorder="0">

	<img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a>
	<br><br>         
        		  
	<cfset xImage = "Kenna-2007-Calendar.jpg">
	<cfset xPath = "../../booklist/2007_Spring">
	<CFSET xHEIGHT = "320">
	<CFSET xWidth = "320">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Calendar">
	<cfset xBorder="0">

	<img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br>
    </cfoutput>
		</TD>
   <td width="20">&nbsp;
  </td>
      <td width="480" valign="top"> <p>OVER THE PAST FEW ISSUES, we have focused 
          on ways that photographers can keep their newly published book in the 
          eye and mind of the public. Promoting a book via a traveling exhibition 
          and having a dedicated website for the publication have both proven 
          invaluable. In this issue, we address a few of the issues surrounding 
          the reproduction of one&#8217;s photographic images in products other 
          than the book, fine prints or online. <br><br>
          The market for ancillary products, or &#8220;paper products&#8221; as 
          they are often referred to in publishing contracts, is one that many 
          photographers choose to pursue, and the inherent potential for revenue 
          is huge. Ancillary products include everything from note card sets and 
          calendars to posters aimed at the residential, hospitality or d&eacute;cor 
          markets. <br><br>
          There are many quality publishers for these products. When researching 
          whether or not to pursue this market, the first step is to gauge a company&#8217;s 
          production values&#8212;the type of paper and card stock used, the quality 
          of the printing, the elegance or style of the packaging and design&#8212;by 
          going out and simply looking at their products on the shelves or online. 
          <br><br>
          In order to get a sense of the diversity of issues involved, we spoke 
          with a renowned fine art photographer, Michael Kenna, as well as Leigh 
          Anna MacFadden, senior editor in the gift division at Chronicle Books, 
          both of whom have been very successful in this market, though in different 
          ways and with radically different work.<br>
          <br>
          &#8230;
        </p>
       <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          </font> <font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"> 
          Continue reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=PE030"> 
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




