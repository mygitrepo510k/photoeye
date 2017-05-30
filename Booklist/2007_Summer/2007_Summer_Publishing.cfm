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
        Limited Editions, Part I<br>
        <br>
        </strong></font><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong>The 
        ongoing column about publishing photobooks.<br>
          By Mary Virginia Swanson and Darius Himes</strong></font></td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="200" valign="top" align="right">
<cfoutput>

<cfset xImage = "Hido-ltd.jpg">
	<cfset xPath = "../../booklist/2007_Summer">
	<CFSET xHEIGHT = "320">
	<CFSET xWidth = "320">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="LE">
	<cfset xBorder="0">

	<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=TR234"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a>
	<br><br>
          <br>
    </cfoutput>
		</TD>
   <td width="20">&nbsp;
  </td>
      <td width="480" valign="top"> <p>Since summer 2004, Mary Virginia Swanson 
          and Darius Himes have presented, in a column that appears in each issue 
          of photo-eye Booklist, detailed steps that outline the process of having 
          a book of photographs published. <br>
          <br>
          Entering the third year of this acclaimed column, they now turn their 
          attention to the practice of publishing a limited edition book along 
          with the trade edition. The market for collectible photography books 
          and prints has never been better. Many publishers produce photography 
          books in deluxe editions, hoping to capitalize on the marketplace. <br>
          <br>
          Over the next three issues, the authors will survey the field of publishers 
          who produce these gorgeous, limited editions. The current installment 
          will focus on two boutique art publishers&#8212;Nazraeli Press, founded 
          by Chris Pichler, and Twin Palms Publishers, founded by Jack Woody. 
          Both of these publishers have years of experience and clout in the fine-art 
          photography community. The second installment will look at two distinctive 
          publishing houses that cater to extremely high-end books, whereas the 
          last column will feature several artists who have self-published limited 
          edition books.<br>
          <br>
          &#8230; </p>
        <p><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif">Continue 
          reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=PE031"> 
          ordering</a> the <br>
          current issue of <em>photo-eye Booklist.</em><br />
          <br>
          <a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a> 
          to the <em>photo-eye Booklist.</em> <br>
          </font></p>
       </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




