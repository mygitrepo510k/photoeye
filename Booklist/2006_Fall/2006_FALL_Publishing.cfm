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
<td colspan="3" align="center"> <font color="#333333" size="3" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong>PUBLISHING THE PHOTOGRAPHY BOOK<br>
        </strong></font><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong>Extending 
        the Life of Your Project. In this ongoing column, MARY VIRGINIA SWANSON 
        and DARIUS HIMES <br>
        explore all avenues for extending the life of your book project beyond 
        the initial launch party.</strong></font></td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="200" valign="top" align="right">

<cfoutput>
		
<cfset xImage = "Publishing_Photobook_1_Jenn.jpg">
	<cfset xPath = "../../booklist/2006_Fall">
	<CFSET xHEIGHT = "400">
	<CFSET xWidth = "400">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Jenny Lynn">
	<cfset xBorder="0">

	<img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a>
	<br>
          <font size="1" color="##333333" face="Arial, Helvetica, sans-serif"><a href="http://www.jennylynn.com"> 
          JennyLynn.com</a></font><br>
          <br>
		  
		  
	<cfset xImage = "Publishing_Photobook_2_Eiri.jpg">
	<cfset xPath = "../../booklist/2006_Fall">
	<CFSET xHEIGHT = "400">
	<CFSET xWidth = "400">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Eirik Johnson">
	<cfset xBorder="0">

	<img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br>
         <font size="1" color="##333333" face="Arial, Helvetica, sans-serif"><a href="http://www.eirikjohnson.com"> 
          EirikJohnson.com</a></font><br><br>
		  
		</cfoutput>
			<cfoutput>
<cfset xImage = "Publishing_photobook_3_Davi.jpg">
	<cfset xPath = "../../booklist/2006_Fall">
	<CFSET xHEIGHT = "400">
	<CFSET xWidth = "400">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="David Maisel">
	<cfset xBorder="0">

	<img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br>
	<font size="1" color="##333333" face="Arial, Helvetica, sans-serif"><a href="http://www.davidmaisel.com"> 
          DavidMaisel.com</a></font><br><br>
		  
	<cfset xImage = "Publishing_photobook_4_Bosn.jpg">
	<cfset xPath = "../../booklist/2006_Fall">
	<CFSET xHEIGHT = "400">
	<CFSET xWidth = "400">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Bosnia Aftermath">
	<cfset xBorder="0">

	<img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br>
      <font size="1" color="##333333" face="Arial, Helvetica, sans-serif"><a href="http://www.bosniaaftermath.com"> 
          BosniaAftermath.com</a></font><br><br>
		  </cfoutput>
		  <cfoutput>
	<cfset xImage = "Publishing_Photobook_5.jpg">
	<cfset xPath = "../../booklist/2006_Fall">
	<CFSET xHEIGHT = "400">
	<CFSET xWidth = "400">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Kim Stringfellow">
	<cfset xBorder="0">

	<img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br>
	<font size="1" color="##333333" face="Arial, Helvetica, sans-serif"><a href="http://www.greetingsfromsaltonsea.com"> 
          GreetingsFromSaltonSea.com</a></font><br>
	</cfoutput>
		</TD>
   <td width="20">&nbsp;
  </td>
      <td width="480" valign="top"> <p><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"> 
          Over the next few issues, we will fully explore ways to extend the life 
          of a book beyond its publication date and the initial launch, a topic 
          we began in our last issue. In that installment we discussed the value 
          of an accompanying exhibition, which can help to keep the title &#8220;fresh&#8221; 
          for new audiences. In this issue and the upcoming Winter issue, we will 
          outline what makes a useful website, which is an excellent and vital 
          way to promote a book. </font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"> 
          An effective website designed to specifically promote your book should 
          be identical to both a print format (a &#8220;hardcopy&#8221;) press 
          kit and a CD-ROM version. Providing potential reviewers and editors, 
          buyers and readers with identical information and with a strong graphic 
          identity in all three formats&#8212;website, press kit, and CD-ROM&#8212;shows 
          not only professionalism, but truly makes your title stand out. Critics, 
          curators, and their associates and assistants may all prefer different 
          formats for review; having options available will assure that you are 
          meeting each individual&#8217;s preference for reviewing materials. 
          </font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"> 
          What follows is a list of the must-haves for your website. Following 
          that are numerous examples of websites that we think are simply outstanding. 
          </font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif">...</font></p>
        <p>Note from the authors: Only so many websites for projects could be 
          included in this column. If you have other websites to suggest, please 
          email darius@photoeye.com or vswanson@earthlink.net and if possible 
          we will list them in a future resource section of this column.<br>
          <font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><br>
          </font> <font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"> 
          Continue reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=PE028"><br>
          ordering the current issue</a> of photo-eye Booklist.<br />
          <br>
          <a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a> 
          to the photo-eye Booklist <br>
          </font></p>
        </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




