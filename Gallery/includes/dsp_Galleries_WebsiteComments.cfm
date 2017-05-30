<cflock scope="session" timeout="5" type="readonly">
<cfif IsDefined("session.acctid")>

<CFQUERY NAME="qGetCustomerAccount"  DATASOURCE="photoeyecom">
  SELECT *
  FROM MailingList_OM 
  WHERE Custnumber = #Session.AcctID#
</CFQUERY> 

</CFIF>
</CFLOCK>

<CFPARAM NAME="url.Gallery" DEFAULT="">
<CFIF url.Gallery is "">
	<CFSET xGallery = "photo-eye Galleries">
<CFELSEIF url.Gallery is 1>
	<CFSET xGallery = "photo-eye Santa Fe Gallery">
<CFELSEIF url.Gallery is 2>
	<CFSET xGallery = "Photographer's Showcase">
<CFELSEIF url.Gallery is 3>
	<CFSET xGallery = "Magnum Photos Collector's Prints">
</CFIF>

<!--- Header --->
<cfif url.Gallery is 1>
	<CFSET xTitle="Gallery - Santa Fe">
	<CFSET xMenuToShow = "Santa Fe">
	<CFSET xItemSelected = "3">
	
<cfelseif url.Gallery is 2>
	<CFSET xTitle="Photographer's Showcase">
	<CFSET xMenuToShow = "Showcase">
	<CFSET xItemSelected = "2">

<cfelseif url.Gallery is 3>
	<CFSET xTitle="Magnum Photos">
	<CFSET xMenuToShow = "Magnum">
	<CFSET xItemSelected = "3">
	
<cfelse>
	<CFSET xTitle="Galleries">
	<CFSET xMenuToShow = "Main">
	<CFSET xItemSelected = "">
	
</cfif>
<!---<cfinclude template="../templates/Header.cfm">--->




<DIV ALIGN="CENTER"><CENTER>

<!--- Page Title --->
<table width="600" align="center" cellpadding="0" cellspacing="0">
  <tr>
  <TD WIDTH="100"></TD>
  
        <td align="center" class="Header"><font color="Black" face="Times, 'Times-Roman', serif" size="5">
C</font><font color="Black" face="Times, 'Times-Roman', serif" size="4">OMMENTS</FONT><font color="Black" face="Times, 'Times-Roman', serif" size="5"></FONT></b>
</FONT></td>
<TD WIDTH="100" ALIGN="CENTER"></TD>
  </tr></table>
<BR>
<CFOUTPUT>
<TABLE  CELLPADDING="5"><TR><TD  ALIGN="LEFT">
<CFform action="WebsiteComments_action.cfm?Gallery=#url.Gallery#" method="post">

<font color="Black" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="2">
We'd love to hear your comments about the #xGallery#! </FONT>
<BR>

<CFIF IsDefined("qGetCustomerAccount.Email")>
Your Email: <cfinput type="Text" name="email" value="#qGetCustomerAccount.Email#" message="Please enter a valid e-mail address." required="Yes" size="50" maxlength="100">
<CFELSE>
Your Email: <cfinput type="Text" name="email" value="" message="Please enter a valid e-mail address." required="Yes" size="50" maxlength="100">
</CFIF>
<BR>
</TD></TR><TR><TD ALIGN="LEFT">
Your Comments:<BR>
<textarea cols="60" rows="6" name="comment"></textarea>
</TD></TR><TR><TD ALIGN="CENTER">
<INPUT TYPE="SUBMIT" NAME="SUBMIT" VALUE="Send Comments">
<INPUT TYPE="HIDDEN" NAME="Gallery" VALUE="#xGallery#">
</TD></TR></TABLE>

</CFFORM>
</CFOUTPUT>
</center></div>
<!---<BR>
<cfinclude template="../templates/footer_site.cfm">
</body>
</html>--->
