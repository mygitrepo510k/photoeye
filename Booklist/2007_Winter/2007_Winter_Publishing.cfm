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
      <td colspan="3" align="center"><p><font color="#333333" size="3" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong>PUBLISHING 
          THE PHOTOGRAPHY BOOK:</strong></font><br>
          <font color="#333333" size="3" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong>LIMITED 
          EDITIONS, PART III</strong></font> 
        <p><font color="#333333" size="3" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong> 
          <font size="2">A column about the ins-and-outs of publishing.</font></strong></font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong> 
          BY MARY VIRGINIA SWANSON AND DARIUS HIMES</strong></font></p></td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="200" valign="top" align="right">
<cfoutput>

<cfset xImage = "Publishing_1.jpg">
	<cfset xPath = "../../booklist/2007_Winter">
	<CFSET xHEIGHT = "320">
	<CFSET xWidth = "320">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Publishing_1">
	<cfset xBorder="0">
          <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=ZC158"><img src="Publishing_1.jpg"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="435" WIDTH="320"></a> 
          <br>
          <br>
          <br>
    </cfoutput>
		</TD>
   <td width="20">&nbsp;
  </td>
      <td width="480" valign="top"> <p>PREMIERING IN OUR REDESIGNED SUMMER 2004 
          issue, Publishing the Photography Book has been an ongoing column detailing 
          the intricacies and complexity and hard work of publishing a book of 
          photographs. In quarterly installments, our two co-authors have presented 
          brief synopses of prominent figures in the current field of photobook 
          publishing along with extensive insights on topics that range from working 
          with a designer, getting a handle on the vocabulary of the printing 
          process, hiring a publicist and developing a website that promotes an 
          overall photographic career as well as promoting a new book.</p>
        <p> In this last of three focused installments on the diversity and role 
          of limited editions in the world of photobooks, Swanson and Himes spoke 
          with the founders of 21ST Editions, a publishing enterprise that creates 
          gorgeous, high-end books as collaborations with major living photographers 
          aimed at collectors and collecting institutions across the world.<br>
          &#8230; </p>
        <p><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif">Continue 
          reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=PE033"> 
          ordering</a> the <br>
          current issue of <em>photo-eye Booklist.</em><br />
          <br>
          </font></p>
       </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




