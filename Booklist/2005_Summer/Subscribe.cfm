<CFPARAM NAME="Season" DEFAULT="Summer">
<CFPARAM NAME="Year" DEFAULT="2005">

<cfset page="Subscriptions">
<CFSET xTitle="Booklist">
<CFSET xSubPage="1">
<CFSET xPathToRoot="../">
<CFSET xShowBackButton = 1>
<CFPARAM NAME="Page" DEFAULT="Photo-Eye Booklist">

<cfinclude template="../templates/Header.cfm">
<DIV ALIGN="CENTER">

	<CFSET xFontColor = "Black">
	
	<CFIF Page is "Reviews">
		<CFSET xSubTitle = "New Books Reviewed">
	<CFELSEIF Page is "Contact">
		<CFSET xSubtitle = "Contact Us">
	<CFELSE>
		<CFSET xSubTitle=Page>
	</CFIF>
<!--- 	<img src="2005_Summer/PHOTO-EYE-BOOKLIST-LOGO.gif" width="257" height="54"><br> --->
	<CFINCLUDE TEMPLATE="../templates/Title.cfm">
  <CFOUTPUT>#xHTMLTitle#</CFOUTPUT>
	<BR>
<br>

<FONT FACE="verdana Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333">

<TABLE WIDTH="700" height="50"><TR><TABLE WIDTH="700"><TR>
  <td width="250" valign="top"><p><img src="2005-Summer-Cover-3D.jpg" width="250" height="343">
   </td>
   <td width="10">&nbsp;</td>
<td align="center" valign="top">  <FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" class="text"><p align="left"><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">
 Your subscription will begin with our Fall 2005 issue. If you would like to order the current issue, available now, click Order Current Issue </font>
 </p> <p align="center">
 <form action="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" method="post" target="_blank"><input name="Subscribe" type="submit" value="Subscribe Now"></form>
  
   <form action="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=PE023" method="post"><input name="Order Current Issue" type="submit" value="Order Current Issue"></form></p>   
   <br>
   <table width="150" align="center"><tr><td>
  General Inquiries about Subscriptions:<BR>
  <a href="https://www.themagstore.com/?ProductCode=PHE"><strong>Subscription Customer Service</strong></a><br>
  (954) 772-6659<br>
  (954) 772-6823<br>
  (954) 772-6848</td></tr></table>
</td></tr>
</TABLE>


<BR>
<cfinclude template="../templates/footer_site.cfm">




