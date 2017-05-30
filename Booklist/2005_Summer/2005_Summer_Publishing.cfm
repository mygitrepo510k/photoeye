<CFPARAM NAME="Season" DEFAULT="Spring">
<CFPARAM NAME="Year" DEFAULT="2005">

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
	
	<CFINCLUDE TEMPLATE="../../templates/Title.cfm">
	<CFOUTPUT>#xHTMLTitle#</CFOUTPUT>
	<BR><BR>


<FONT FACE="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333">

<TABLE WIDTH="700"><TR>
<td colspan="3" align="center"> <font color="#333333" size="3" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong>PUBLISHING THE PHOTOGRAPHY BOOK <br>
</strong></font><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong>Part five in the series on publishing photography books.</strong></font></td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="200" valign="top" align="right"><img src="publishing.jpg" width="306" height="327">
</TD>
   <td width="20">&nbsp;
  </td>
  <td width="480" valign="top">
    <p><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif">  The goal of this series of articles has been to examine the place and role of a book of photographs in one's career as a photographer and to delineate the many steps involved in publishing a photobook. We opened the series with a set of questions designed to clarify what type of book might be appropriate both for one's work and the current stage of one's career.  <br>
<BR>We then heard from several publishers about their publishing programs and preferred method of submissions, followed by a discussion of how best to present work to a publisher, and, more importantly, where to find them. In the last issue, we took into consideration the issue of contracts, a vital part of the publishing process.<br>
<BR>
In this installment, we will talk with two prominent designers about the process of working on a book. ... <br>
--Mary Virginia Swanson and Darius Himes<BR><BR>
<a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=PE023">Purchase Booklist to Read Entire Article</a><br>
<a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a> <br>

    </font></p>
    </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




