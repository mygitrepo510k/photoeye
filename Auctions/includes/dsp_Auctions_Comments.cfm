<cflock scope="session" timeout="5" type="readonly">
<cfif IsDefined("session.acctid")>

<CFQUERY NAME="qGetCustomerAccount"  DATASOURCE="photoeyecom">
  SELECT *
  FROM MailingList_OM 
  WHERE Custnumber = #Session.AcctID#
</CFQUERY> 

</CFIF>
</CFLOCK>

<DIV ALIGN="CENTER"><CENTER>

<!--- Page Title --->
<table width="600" align="center" cellpadding="0" cellspacing="0">
  <tr>
  <TD WIDTH="100"></TD>
  
        <td align="center" class="Header"><font color="Black" face="Times, 'Times-Roman', serif" size="5"><BR>
F</font><font color="Black" face="Times, 'Times-Roman', serif" size="4">EEDBACK</FONT><font color="Black" face="Times, 'Times-Roman', serif" size="5"></FONT></b>
</FONT></td>
<TD WIDTH="100" ALIGN="CENTER"></TD>
  </tr></table>
<CFOUTPUT>
<TABLE  CELLPADDING="5"><TR><TD  ALIGN="LEFT">
<CFform action="includes/act_Auctions_Comments.cfm" method="post">

<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
Please give us your comments/suggestions for our Auctions. Thanks! </FONT>
<BR>

<CFIF IsDefined("qGetCustomerAccount.Email")>
Your Email: <cfinput type="Text" name="email" value="#qGetCustomerAccount.Email#" message="Please enter a valid e-mail address." required="Yes" size="50" maxlength="100">
<CFELSE>
Your Email: <cfinput type="Text" name="email" value="" message="Please enter a valid e-mail address." required="Yes" size="50" maxlength="100">
</CFIF>
</TD></TR><TR><TD ALIGN="LEFT">
Your Comments/Suggestions:<BR>
<textarea cols="60" rows="6" name="comment"></textarea>
</TD></TR><TR><TD ALIGN="CENTER">
<INPUT NAME="SUBMIT" TYPE="SUBMIT" class="input_submit" VALUE="Send Comments" Class="input_button">
</TD></TR></TABLE>
</FONT>
</CFFORM>
</CFOUTPUT>

