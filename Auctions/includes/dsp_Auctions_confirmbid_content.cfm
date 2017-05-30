

<cfparam name="xtitle" default="">

<CFPARAM NAME="form.bid" DEFAULT="">

<CFSET form.bid = replace(form.bid, ".000", "", "all")>
<CFSET form.bid = replace(form.bid, ".00", "", "all")>
<CFSET form.bid = replace(form.bid, ".0", "", "all")>
<CFSET form.bid = replace(form.bid, ",", "", "all")>
<CFSET form.bid = replace(form.bid, "$","","all")>

<!--- Test for logged in --->
<cflock scope="session" timeout="5" type="exclusive">
	<cfif NOT IsDefined("session.acctid")>
		<!--- Set Bid amount and auction for future reference --->
		<CFSET xLoggedIn = 0>
	<CFELSE>
		<CFSET xLoggedIn = 1>
	</cfif>
	<CFIF IsDefined("Session.AuctionID") and IsDefined("Session.Bid")>
		<CFIF IsDefined("form.AuctionID") and IsDefined("form.Bid")>
			<CFSET Session.AuctionID = form.auctionID>
			<CFSET Session.Bid = form.Bid>
		</CFIF>
	</CFIF>
</cflock>

<CFIF xLoggedIn is 0>
	<CFIF IsDefined("form.AuctionID")>
		<CFLOCATION URL="login.cfm?Auction=1&ReturnToAuctionID=#form.AuctionID#">
	<CFELSEIF IsDefined("url.ID")>
		<CFLOCATION URL="login.cfm?Auction=1&ReturnToAuctionID=#url.ID#">
	<CFELSE>
		<CFLOCATION URL="login.cfm?Auction=1">
	</CFIF>
</CFIF>


<!--- Test for numbers only --->
<CFSET IsNumbersOnly = 1>
<CFLOOP index="count" from="1" to="#len(trim(form.bid))#" STEP="1">
	<CFIF asc(trim(mid(form.bid, #count#, 1))) lt 48 or asc(trim(mid(form.bid, #count#, 1))) gt 57>
		<CFSET IsNumbersOnly = 0>
	</CFIF>
</CFLOOP>

<!--- Queries --->

<!--- Get the Auction Admin Information --->
<cfquery name="qGetAuctionAdmin" datasource="photoeyecom">
	Select *
	from AuctionAdmin
	where AuctionID = <cfqueryparam value="#form.AuctionID#" cfsqltype="cf_sql_varchar">
</cfquery>
<CFSET xOpeningBid = qGetAuctionAdmin.OpeningBid>

<CFQUERY NAME="qGetCustomerAccount"  DATASOURCE="photoeyecom">
  SELECT *
  FROM MailingList_OM
  WHERE Custnumber = <cfqueryparam value="#Session.AcctID#" cfsqltype="cf_sql_varchar">
</CFQUERY>

<CFIF IsNumbersOnly is 1>

<!--- Get max Bid Info --->
<CFQUERY NAME="qGetMaxBid"  DATASOURCE="photoeyecom">
  SELECT TOP 1 *
  FROM AuctionMaxBids
  WHERE AuctionID = <cfqueryparam value="#form.AuctionID#" cfsqltype="cf_sql_varchar">
  ORDER BY MaxBid DESC
</CFQUERY>

<CFIF qGetMaxBid.RecordCount is 0>
	<CFSET xMaxBidCustNumber = 0>
	<CFSET xMaxBid = 0>
<CFELSE>
	<CFSET xMaxBidCustNumber = qGetMaxBid.CustNumber>
	<CFSET xMaxBid = qGetMaxBid.MaxBid>
</CFIF>


<!--- Get bid information --->
<cfquery name="qGetAuctionBids" datasource="photoeyecom">
	Select Max(bid) as Bid, Count(autoid) as Count from AuctionBids where AuctionID = #form.AuctionID#
</cfquery>
<CFSET FirstBid =0>
<CFIF qGetAuctionBids.Bid gt 0>
	<cfquery name="qGetHighBidder" datasource="photoeyecom">
		Select NickName, CustNumber from AuctionBids where bid = #qGetAuctionBids.Bid# and AuctionID = #form.AuctionID#
	</cfquery>
	<CFSET xLastHighBid = qGetAuctionBids.Bid>
	<CFSET xHighBidCustNumber =qGetHighBidder.CustNumber>
<CFELSE>
	<CFSET FirstBid =1>
	<CFSET xLastHighBid = 0>
	<CFSET xHighBidCustNumber =0>
</CFIF>
<cfif len(trim(form.bid)) is 0>
	<cfset form.bid = 0>
</cfif>

<cfset xBidIncrease = form.bid-xLastHighBid>
<cfset xNextBid = xLastHighBid+qGetAuctionAdmin.MinimumBidIncrement>
</CFIF>

<cfquery name="qGetCreditCards" datasource="photoeyecom">
	SELECT AUTOID, TABLEID, CUSTNUMBER AS CUSTNUM, CARDDEFAULT, CARDNUM, EXP, CARDHOLDER, CC_CID
	FROM CreditCardsAdditional
	WHERE custnumber=<cfqueryparam value="#Session.AcctID#" cfsqltype="cf_sql_varchar">
	and exp<>'' and CardDefault = 1
</cfquery>

<CFINCLUDE TEMPLATE="/auctions/AuctionTime.cfm">

<CFIF IsDefined("form.AuctionID")>
	<CFSET xID = form.AuctionID>
<CFELSEIF IsDefined("url.ID")>
	<CFSET xID = url.ID>
</CFIF>

<!--- If the Auction is over --->
<CFIF xTime lte 0>
	<br>
	<CFOUTPUT>#xTitle#</CFOUTPUT>
	<BR>
	<BR>
	<div align="center"><center>
	<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">

	<cfoutput>
	<font color="Maroon"><b>The auction for #qGetAuctionAdmin.Title# has ended!</b></font>
	<br><br>
	You placed your bid at <b>#timeformat(now()-CreateTimeSpan(0,2,0,0), "h:mm:ss")#</B> on <B>#dateformat(now()-CreateTimeSpan(0,2,0,0), "mmm dd, yyyy")#</b>
	<BR>
	The auction officially ended at <b>#timeformat(qGetAuctionAdmin.TimeEnd, "h:mm:ss")#</B> on <B>#dateformat(qGetAuctionAdmin.TimeEnd, "mmm dd, yyyy")#</b>
	<BR><BR>
	Please <b><a href="Citation.cfm?ID=#xID#">return</a></b> to the auction to see who won.</font></cfoutput>

<!--- If payment is not credit card --->
<CFELSEIF qGetCustomerAccount.PaymentMethod is not 1>
	<CFLOCATION  url="#xURLPath#templates/OrderFormEditAccountStep4.cfm?Auction=1">



<!--- Credit Card has expired --->
<CFELSEIF right(qGetCreditCards.Exp,2) lt right(datepart("yyyy", Now()),2) and  left(qGetCreditCards.Exp,2) lt left(datepart("m", Now()),2)>
	<CFLOCATION  url="#xURLPath#templates/OrderFormEditAccountStep4.cfm?Auction=1&Expired=1">


<!--- If auction agreement is blank --->
<CFELSEIF len(trim(qGetCustomerAccount.AuctionName)) is 0>
	<CFLOCATION  url="#xURLPath#templates/OrderFormEditAccountStep6.cfm?Auction=1">

<!--- If didn't enter only numbers --->
<CFELSEIF IsNumbersOnly is 0>

	<br>
	<CFOUTPUT>#xTitle#</CFOUTPUT>
	<BR>
	<BR>
	<div align="center"><center>
	<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">

	You bid: <B><FONT COLOR="Maroon">$<CFOUTPUT>#trim(NumberFormat(form.bid,"99,999"))#</CFOUTPUT></FONT></B><BR>
	Your bid must contain only numbers.
	<BR><BR>
	Please <b><a href="javascript:history.back()">return</a></b> to the previous screen to re-enter your bid.</font>

<!--- If bid is empty --->
<cfelseif len(trim(form.bid)) is 0 or form.bid is 0>
	<br>
	<CFOUTPUT>#xTitle#</CFOUTPUT>
	<BR>
	<BR>
	<div align="center"><center>
	<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">

	<cfoutput><font color="Maroon"><b>You have not placed a value in the bid field.</b></font><br>
<br>
Please <b><a href="javascript:history.back()">return</a></b> to the auction to continue bidding.</font></cfoutput>

<!--- If bid is equal to or lower than the last high bid --->
<cfelseif form.bid LTE qGetAuctionBids.Bid>
	<br>
	<CFOUTPUT>#xTitle#</CFOUTPUT>
	<BR>
	<BR>
	<div align="center"><center>
	<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">

	<cfoutput>Your <A HREF="../auctions/MaximumBid.cfm">Maximum Bid</A> of <font color="Maroon"><b>$#trim(NumberFormat(form.bid,"99,999"))#</b></font> must be greater than the last bid of <font color="Maroon"><b>$#trim(NumberFormat(xLastHighBid,"99,999"))#.</b></font><br>
<br>
Please <b><a href="javascript:history.back()">return</a></b> to the auction to continue bidding.</font></cfoutput>

<!--- If bid is equal to or lower than the last high bid --->
<cfelseif form.bid LT xOpeningBid>
	<br>
	<CFOUTPUT>#xTitle#</CFOUTPUT>
	<BR>
	<BR>
	<div align="center"><center>
	<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">

	<cfoutput>Your <A HREF="../auctions/MaximumBid.cfm">Maximum Bid</A> of <font color="Maroon"><b>$#trim(NumberFormat(form.bid,"99,999"))#</b></font> must at least equal the opening bid of <font color="Maroon"><b>$#trim(NumberFormat(xOpeningBid,"99,999"))#.</b></font><br>
<br>
Please <b><a href="javascript:history.back()">return</a></b> to the auction to continue bidding.</font></cfoutput>

<!--- If new max bid is lower than or equal to old max bid --->
<cfelseif form.bid LTE xMaxBid and qGetCustomerAccount.CustNumber is xMaxBidCustNumber>
<br>
	<CFOUTPUT>#xTitle#</CFOUTPUT>
	<BR>
	<BR>
	<div align="center"><center>
	<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">

	<cfoutput>Your new <A HREF="MaximumBid.cfm">Maximum Bid</A> of <font color="Maroon"><b>$#trim(NumberFormat(form.bid,"99,999"))#</b></font>
	<BR> <b>must be greater than</b>
	<BR>Your current maximum bid of <font color="Maroon"><b>$#trim(NumberFormat(xMaxBid,"99,999"))#</b></font><br>
<br>
Please <b><a href="javascript:history.back()">return</a></b> to the auction to re-enter your bid.</font></cfoutput>

<!--- If bidder is trying to bid twice in a row and they are not the max bidder--->
<cfelseif (qGetCustomerAccount.CustNumber is xHighBidCustNumber) and (qGetCustomerAccount.CustNumber is not xMaxBidCustNumber)>
<br>
	<CFOUTPUT>#xTitle#</CFOUTPUT>
	<BR>
	<BR>
	<div align="center"><center>
	<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">

	IS THIS EVER A CASE? If so, fix the below...<BR><BR>


	<cfoutput>Your desired new <A HREF="MaximumBid.cfm">Maximum Bid</A> of <font color="Maroon"><b>$#trim(NumberFormat(form.bid,"99,999"))#</b></font> must be greater than your current maximum bid of <font color="Maroon"><b>$#trim(NumberFormat(xLastHighBid,"99,999"))#.</b></font><br>
<br>
Please <b><a href="javascript:history.back()">return</a></b> to the auction to continue bidding.</font></cfoutput>>


<!--- If bid increment is greater than the minimum bid increment, it must still be in multiples of ten --->
<cfelseif (xBidIncrease gt qGetAuctionAdmin.MinimumBidIncrement) and ((xBidIncrease-qGetAuctionAdmin.MinimumBidIncrement) mod 5 is not 0)>

	<br>
	<CFOUTPUT>#xTitle#</CFOUTPUT>
	<BR>
	<BR>
	<div align="center"><center>
	<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">

	<cfoutput>Bids must be in multiples of <font color="Maroon"><b>$5</b></font>
	<br>
	<br>

Your bid: <font color="Maroon"><b>$#trim(NumberFormat(form.Bid,"99,999"))#</b></font>
<br>

<CFSET xRoundedBid = form.bid + (5 - (form.bid MOD 5))>


<br>An acceptable bid amount is: <font color="Maroon"><b>$#trim(NumberFormat(xRoundedBid,"99,999"))#</b></font><br>
<br>
<form action="ConfirmBid.cfm" method="post" name="SubmitBid" id="SubmitBid">
	<input type="hidden" name="AuctionID" value="#form.AuctionID#">
	<input type="hidden" name="Bid" value="#xRoundedBid#">
	<input name="Submit" type="Submit" class="input_submit" value="Place a bid for $#trim(NumberFormat(xRoundedBid,"99,999"))#">&nbsp;&nbsp;<input type="button" class="input_button" onClick="javascript:history.back()" value="Cancel">
</FORM>
	</CFOUTPUT>

<!--- If bid increment is not an exact multiple of the minimum bid increment --->
<!--- Rather, this should check if the bid is at least the bid increment higher than the last bid or the max bid. --->
<!--- removed: (xBidIncrease MOD qGetAuctionAdmin.MinimumBidIncrement IS not 0) OR --->
<cfelseif (qGetAuctionAdmin.MinimumBidIncrement gt xBidIncrease)
       or (form.bid lt (xLastHighBid + qGetAuctionAdmin.MinimumBidIncrement))
		 or ((xMaxBidCustNumber is qGetCustomerAccount.Custnumber) and (form.bid lt (xMaxBid + qGetAuctionAdmin.MinimumBidIncrement)))
 		 or (form.bid lt xOpeningbid)>
	<br>
	<CFOUTPUT>#xTitle#</cfoutput>
	<BR>
	<BR>
	<div align="center"><center>
	<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">

	<cfoutput>Bids must exceed the previous bid (or hidden maximum bid) <BR> by the minimum bid increment: <font color="Maroon"><b>$#trim(NumberFormat(qGetAuctionAdmin.MinimumBidIncrement,"99,999"))#</b></font><br>
<br>

Your bid: <font color="Maroon"><b>$#trim(NumberFormat(form.bid,"99,999"))#</b></font>
<br>

<Cfif form.bid lt xMaxBid>
	<CFSET xRoundedBid = (form.bid + qGetAuctionAdmin.MinimumBidIncrement) - xBidIncrease>
<cfelse>
	<cfset xRoundedBid = xMaxBid + qGetAuctionAdmin.MinimumBidINcrement>
</cfif>

<br>An acceptable bid amount is: <font color="Maroon"><b>$#trim(NumberFormat(xRoundedBid,"99,999"))#</b></font><br>
<br>
<form action="ConfirmBid.cfm" method="post" name="SubmitBid" id="SubmitBid">
	<input type="hidden" name="AuctionID" value="#form.AuctionID#">
	<input type="hidden" name="Bid" value="#xRoundedBid#">
	<input name="Submit" type="Submit" class="input_submit" value="Place a bid for $#trim(NumberFormat(xRoundedBid,"99,999"))#">&nbsp;&nbsp;<input type="button" class="input_button" onClick="javascript:history.back()" value="Cancel">
</FORM>
	</CFOUTPUT>

<!--- No errors, confirm the bid --->
<CFELSE>
	<BR>
	<form action="/Auctions/AuctionAction.cfm" method="post" name="SubmitBid" id="SubmitBid">
	<CFOUTPUT>
	<input type="hidden" name="AuctionID" value="#form.AuctionID#">
	<input type="hidden" name="Bid" value="#form.bid#">
	</CFOUTPUT>
	<DIV ALIGN="CENTER"><CENTER>

	<!--- Page Title --->
	<table width="800" align="center" cellpadding="0" cellspacing="0">
	  <tr>
	        <td align="center" class="Header"><font color="Black" face="Times, 'Times-Roman', serif" size="5">
	C</font><font color="Black" face="Times, 'Times-Roman', serif" size="4">ONFIRM</FONT>&nbsp;&nbsp;<font color="Black" face="Times, 'Times-Roman', serif" size="5">B</FONT><font color="Black" face="Times, 'Times-Roman', serif" size="4">ID</FONT></td>
	  </tr></table>

	<BR><BR>

	<CFOUTPUT>
	<font color="Maroon" face="Verdana, Arial, Helvetica, sans-serif" size="2">
	Please confirm your new <A HREF="MaximumBid.cfm">Maximum Bid</A> of <b>$#trim(NumberFormat(form.bid,"99,999"))#</b>.
	</FONT>
	</CFOUTPUT>
	<BR><BR>
	<input name="SubmitBid" type="submit" class="input_submit" value="Commit Bid">&nbsp;&nbsp;<input type="button" class="input_button" onClick="javascript:history.back()" value="Cancel">
	</form>
</CFIF>

</div>