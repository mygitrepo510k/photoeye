<CFPARAM NAME="Season" DEFAULT="Spring">
<CFPARAM NAME="Year" DEFAULT="2007">

<CFSET xPage="photo-eye Magazine">
<CFSET xTitle="Magazine">
<CFSET xPathToRoot="../">
<CFSET xShowBackButton = 1>
<CFPARAM NAME="Page" DEFAULT="Photo-Eye Magazine">

<cfinclude template="../templates/Header.cfm">
<DIV ALIGN="CENTER">

	<CFSET xFontColor = "Black">
	
	<CFIF Page is "Reviews">
		<CFSET xSubTitle = "New Books Reviewed">
	<CFELSEIF Page is "Contact">
		<CFSET xSubtitle = "Contact Us">
	<CFELSEIF Page is "BackIssues">
		<CFSET xSubtitle = "Back Issues">
	<CFELSE>
		<CFSET xSubTitle=Page>
	</CFIF>
	
	 <CFINCLUDE TEMPLATE="../templates/Title.cfm">
	<!---<CFOUTPUT>#xHTMLTitle#</CFOUTPUT> <br>--->
  <FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" style="font-size:14 px" COLOR="##333333"> 
 <br /> <strong><font size="3">photo-eye <font color="Maroon">Magazine</font></font></strong> - The International Magazine of Photography Books - <em>Online this Spring!</font> </em><br>
  <br>
<!--- 	<FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" style="font-size:30px" COLOR="##333333">
	 <strong>photo-eye Booklist</strong>
	</font> --->
	<!---<cfinclude template="include_menu_new.cfm">--->
<TABLE WIDTH="700" align="center"><TR>
      <td  valign="top">
     
      <div align="left">  Stephen Shore's <a href="http://www.photoeye.com/templates/mShowDetailsbyCatAmazon.cfm?Catalog=PI204" target="_blank">A Road Trip Journal</a>  will be published later this Spring. The deadline for the drawing for a free copy was April 30th, 2008. We will announce the winner by May 30th, 2008.<br />
      </div>

        </td>    
</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../templates/footer_site.cfm">




