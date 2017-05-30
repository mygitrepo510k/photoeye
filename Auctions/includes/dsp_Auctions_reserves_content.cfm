
<cfquery name="qGetAuctionAdmin" datasource="photoeyecom">
	Select * from AuctionAdmin where auctionid =1
</cfquery>

<cfquery name="qGetAuctionBids" datasource="photoeyecom">
	Select Max(bid) as Bid, Count(autoid) as Count from AuctionBids where auctionid = 1
</cfquery>


<!--- Page Title --->
<table width="800" align="center" cellpadding="0" cellspacing="0">
 <tr height="40"><td></td></tr>
 
  <tr>
        <td align="center" class="Header"><font color="Black" face="Times, 'Times-Roman', serif" size="5">
I</font><font color="Black" face="Times, 'Times-Roman', serif" size="4">NFO</FONT></td>
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
<b>What is an Auction Reserve?</b><br>
An auction reserve is the minimum price that the <b>owner</b> will accept for their item. The reserve amount is not made public. Your bids are accepted even if the reserve has not been attained. However no sale will be finalized unless the reserve price is met. All sales are binding.</font></td>
</tr>
</table>

<DIV ALIGN="CENTER">
<FORM>

<INPUT TYPE="Button" class="input_button"  OnClick="javascript:history.back()" VALUE="Return to Auction">
</FORM>
</DIV>
