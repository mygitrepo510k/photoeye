<CFPARAM NAME="Email" DEFAULT="">
<CFPARAM NAME="Custnumber" DEFAULT="">

<cfquery name="qInsertEmail" datasource="photoeyecom">
	Insert into Promo (email, custnumber, phone) values ('#trim(form.email)#', '#trim(form.custnumber)#', '#trim(form.phone)#')
</cfquery>

<cfmail to="rick@photoeye.com" from="webmaster@photoeye.com" subject="photo-eye Magazine Promo Addition">
#trim(form.email)# '#trim(form.custnumber)# #trim(form.phone)#
</cfmail>

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
	<CFOUTPUT>#xHTMLTitle#</CFOUTPUT> <br>
  <FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" style="font-size:14 px" COLOR="##333333"> 
  The International Magazine of Photography Books</font> - <em>the only magazine 
  devoted to photography books!</em><br>
  <br>
  
<TABLE WIDTH="700" align="center"><TR>
      <td  valign="top">
     
      <div align="center">Thank you! We will announce the deadline on May 1st, 2008.</strong><br /><br />
      </div>

        </td>    
</TR></TABLE>
</DIV>

<BR>
<cfinclude template="../templates/footer_site.cfm">


