<CFPARAM NAME="Season" DEFAULT="Fall">
<CFPARAM NAME="Year" DEFAULT="2006">

<cfset page="Booklist Subscriptions">
<CFSET xTitle="Magazine">
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
<!--- 	<img src="2005_Winter/PHOTO-EYE-BOOKLIST-LOGO.gif" width="257" height="54"><br> --->
	<CFINCLUDE TEMPLATE="../templates/Title.cfm">
  <CFOUTPUT>#xHTMLTitle#</CFOUTPUT>
<br><br />
 <cfinclude template="include_menu.cfm">

<FONT FACE="verdana Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333">

<TABLE WIDTH="700" height="50"><TR><TABLE WIDTH="700"><TR>
  <td width="250" valign="top"><p><a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=pe033"><img src="PE033.jpg" width="288" height="374" border="0"></a> 
      </td>
   <td width="10">&nbsp;</td>
      <td align="center" valign="top"> 
        <p align="left"><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">The 
          <em>photo-eye Booklist</em> is published four times a year. Copies are 
          roughly available on the following schedule: The Spring issue in mid-February, 
          Summer issue in mid-May, Fall issue in mid-August, Winter issue in mid-November. 
          </font></p>
        <p align="left"><strong>Subscribe Now</strong>:<br>
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">If 
          you subscribe now, your subscription will begin with the <em>next</em> 
          published issue. If you would like to purchase a copy of the current 
          issue, click Order Current Issue. </font>
        <p align="left">&nbsp;
        <form action="https://www.themagstore.com/?ProductCode=PHE" method="post" target="_blank"><input name="Subscribe" type="submit" value="Subscribe Now"></form><br />
 <br />
  
   <form action="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=pe033" method="post"><input name="Order Current Issue" type="submit" value="Order Current Issue"></form></p>   
   <br>
   <table width="340" align="left">
          <tr> 
            <td width="332">
<p><strong>Problems</strong>:<br>
If you are having problems receiving your subscription, want to change 
                your mailing address, or have any other subscription-related problems, 
                please contact our subscription fulfillment company.<BR>
                <br>
                <a href="https://www.themagstore.com/?ProductCode=PHE"><strong>Subscription 
                Customer Service</strong></a><br>
                (954) 772-6659<br>
                (954) 772-6823<br>
                (954) 772-6848<br />
                <br />
              </p>
              </td></tr></table>
</td></tr>
</TABLE>


<BR>
<cfinclude template="../templates/footer_site.cfm">




