 

<CFPARAM NAME="url.id" DEFAULT="">


<!--- Page Title --->
<table width="800" align="center" cellpadding="0" cellspacing="0">
<tr height="40"><td></td></tr>
  <tr>
        <td align="center" class="Header"><font color="Black" face="Times, 'Times-Roman', serif" size="5">
I</font><font color="Black" face="Times, 'Times-Roman', serif" size="4">NFORMATION</FONT>&nbsp;<font color="Black" face="Times, 'Times-Roman', serif" size="5">
U</font><font color="Black" face="Times, 'Times-Roman', serif" size="4">PDATED</FONT></td>
  </tr></table>
  
  <!--- Intro --->
<table width="800" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" class="Example"></td>
  </tr></table>
  
  <!--- Table Spacer --->
<!--- <table width="800" align="center" cellpadding="0" cellspacing="0"><tr><td height="20">&nbsp;</td></tr></table> --->

<table width="500" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
<td>
<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
<br>
<b>Changes to your account have been saved.</b><br>
You may see an alert as you cross from the secure area back to the regular area of the web site. Don't be alarmed, no sensitive information is being transfered. Simply agree to the alert to continue. </font></td>
</tr>
</table>
<br />
<DIV ALIGN="CENTER">
<CFOUTPUT>
<CFIF url.id is "">
<FORM METHOD="POST" ACTION="index.cfm">
<CFELSE>
<FORM METHOD="POST" ACTION="citation.cfm?id=#url.id#">
</CFIF>
</CFOUTPUT>
<INPUT NAME="button" TYPE="Submit" class="input_submit" VALUE="Return to Auction"  >
</FORM>
</DIV>
<div style="height:2px;"></div>
