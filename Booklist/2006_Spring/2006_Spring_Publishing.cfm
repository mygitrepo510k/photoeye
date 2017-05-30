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
	
<cfset xmenupath="../">
 <cfinclude template="../include_menu.cfm">
 <br /><br />

<FONT FACE="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333">

<TABLE WIDTH="700"><TR>
<td colspan="3" align="center"> <font color="#333333" size="3" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong>PUBLISHING THE PHOTOGRAPHY BOOK<br>
</strong></font><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong>The acclaimed column on publishing photography books. BY MARY VIRGINIA SWANSON AND DARIUS HIMES
</strong></font></td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="200" valign="top" align="right">
	<cfoutput>

		
<cfset xImage = "anne-arden-##55.jpg">
	<cfset xPath = "../../booklist/2006_Spring">
	<CFSET xHEIGHT = "400">
	<CFSET xWidth = "400">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Anne Arden McDonald">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PK946"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
		
		<cfset xImage = "Anne-Arden-cover.jpg">
	<cfset xPath = "../../booklist/2006_Spring">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Anne Arden McDonald">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PK946"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><font size="1" color="##333333" face="Arial, Helvetica, sans-serif">Anne Arden McDonald</font><br><br />
		
		</cfoutput>
		
</TD>
   <td width="20">&nbsp;
  </td>
  <td width="480" valign="top">
    <p><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"> THE PUBLICATION DATE IS SET FOR YOUR BOOK!
Even before it has been printed and is on a boat headed to you, you
should begin plans to promote your title. What aspects of publicity
should you count on your publisher to assist with, and how can you
as author best assist their efforts on your behalf? What would be the
benefits of hiring an outside publicist? How crucial is an accompanying
exhibition to the success of your book? And lastly, what should
you yourself plan on accomplishing towards promoting your forthcoming
title?<br />
<br />
For this article we asked four seasoned publicists—two in-house
publicists and two independents—to comment on all of these issues.
Additionally, we have turned to Anne Arden McDonald to share the
experience of self-publishing her monograph and wearing the hat of
publicist on her own behalf.<br />
<br />
Here’s our cast: Joan Brookbank, director of the New York office
for London-based Merrell Publishers; Joanna Hurley, president of
HurleyMedia in Santa Fe, which specializes in publicity and
marketing campaigns, agenting and packaging for photography and
art books; Andrea Smith, publicist for the Aperture Foundation in
New York; Shannon Wilkinson, founder and president of Cultural
Communications in New York, an agency that specializes in art,
books, photography, lifestyle and visual culture.<br />
<br />
Continue reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=pe026">ordering the current issue</a> of photo-eye Booklist.<br />

 <br>
--Mary Virginia Swanson and Darius Himes<BR><BR>

<a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a> to the photo-eye Booklist <br>

    </font></p>
    </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




