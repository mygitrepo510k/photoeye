<!--- Test for logged in --->
<cflock scope="session" timeout="5" type="exclusive">
	<cfif NOT IsDefined("session.acctid")>
		<CFSET xLoggedIn = 0>
	<CFELSE>
		<CFSET xLoggedIn = 1>
	</cfif>
</cflock>

<CFIF xLoggedIn is 0>
	<CFLOCATION URL="../templates/newpasswordenter.cfm?Auction=1&ReturnToAuctionID=#form.AuctionID#">
</CFIF>

<CFPARAM NAME="xReserveMet" DEFAULT="0">
<CFSET xUserUpdatingBid = 0>
<!--- Make sure page is called from the ConfirmBid form --->
<CFIF not IsDefined("form.bid")>
	<CFLOCATION URL="../Auctions/AuctionFrontPage.cfm">
</CFIF>

<!--- Queries --->
<CFQUERY NAME="qGetCustomerAccount"  DATASOURCE="photoeyecom">
  SELECT *
  FROM MailingList_OM 
  WHERE Custnumber = #Session.AcctID#
</CFQUERY> 

<cfquery name="qGetAuctionAdmin" datasource="photoeyecom">
	Select * from AuctionAdmin where AuctionID = #form.AuctionID#
</cfquery>

<cfquery name="qGetAuctionBids" datasource="photoeyecom">
	Select Max(bid) as Bid,  Count(autoid) as Count from AuctionBids where AuctionID = #form.AuctionID#
</cfquery>

<CFQUERY NAME="qGetMaxBid"  DATASOURCE="photoeyecom">
  SELECT TOP 1 *
  FROM AuctionMaxBids
  WHERE AuctionID = #form.AuctionID#
  ORDER BY MaxBid DESC
</CFQUERY> 


<CFIF qGetMaxBid.RecordCount is 0>
	<CFSET xMaxBid = 0>
<CFELSE>
	<CFQUERY NAME="qGetMaxAccount"  DATASOURCE="photoeyecom">
	  SELECT *
	  FROM MailingList_OM 
	  WHERE Custnumber = #qGetMaxBid.Custnumber#
	</CFQUERY> 
	<CFSET xMaxBid = qGetMaxBid.MaxBid>
</CFIF>


<!--- Set time --->
<CFIF xTimeDifference gte 0>
	<cfset xhours=datepart("h",Now() - CreateTime(xTimeDifference, 0, 0))>
<CFELSE>
	<cfset xhours=datepart("h",Now() + CreateTime(Abs(xTimeDifference), 0, 0))>
</CFIF>
<CFSET x24hours = xhours>
<CFIF xhours gt 12>
	<CFSET xhours = xhours-12>
</CFIF>

<cfset xminutes=datepart("n","#Now()#")>
<cfset xseconds=datepart("s","#Now()#")>

<CFIF x24hours gt 12><CFSET xMeridian ="pm"><CFELSE><CFSET xMeridian ="am"></CFIF>

<CFIF xTimeDifference gte 0>
	<CFSET xNowFormatted = DateFormat(Now()-CreateTime(xTimeDifference,0,0), "MMMM DD, YYYY") & " " & TimeFormat(Now()-CreateTime(xTimeDifference,0,0), "h:MM:SS") & " " & xMeridian & " MT">
<CFELSE>
	<CFSET xNowFormatted = DateFormat(Now()+CreateTime(Abs(xTimeDifference),0,0), "MMMM DD, YYYY") & " " & TimeFormat(Now()+CreateTime(Abs(xTimeDifference),0,0), "h:MM:SS") & " " & xMeridian & " MT">
</CFIF>


<!--- Protect against a page reload --->
<CFIF form.bid lte qGetAuctionBids.Bid>
	<CFLOCATION URL="../Auctions/Auction.cfm?ID=#form.AuctionID#">
</CFIF>

<CFINCLUDE TEMPLATE="../Auctions/AuctionTime.cfm">

<!--- Make sure that the auction isn't over! --->
<CFIF (qGetAuctionAdmin.EndAnnounced is 1) or xTime lte 0>
	<CFINCLUDE template="ConfirmBid.cfm">
	<CFABORT>
</CFIF>


<CFSET xExtended = 0>
<!--- Auction Extension? (only do this so long as it isn't the maxbid holder) --->
<CFIF qGetCustomerAccount.CustNumber is not qGetMaxBid.CustNumber>
	<!--- xTime is the time left in the auction in seconds. If there are fewer than 5 minutes left (300 seconds) then add five minutes to the end time and set xExtended to 1 (for use in email messages etc) --->
	
	<CFIF xTime lt 300 and xTime gt 0>
		<CFSET xExtension = CreateDateTime(datepart("yyyy", Now()),datepart("m",Now()), datepart("d",Now()),0,5,0)>
		<CFSET xSubtractNow= CreateDateTime(datepart("yyyy", Now()),datepart("m",Now()), datepart("d",Now()),0,0,0)>
		<CFSET xExtended = 1>
		<cfquery name="qUpdateTime" datasource="photoeyecom">
			 Update AuctionAdmin SET
			 TimeEnd=TimeEnd + #CreateODBCDateTime(xExtension)# - #CreateODBCDateTime(xSubtractNow)#
			 WHERE AuctionID=#form.AuctionID#
		</cfquery>	
	</CFIF>
</CFIF>


<!--- Get end time again, in case it has changed --->
<cfquery name="qGetAuctionAdmin" datasource="photoeyecom">
	Select * from AuctionAdmin where AuctionID = #form.AuctionID#
</cfquery>

<CFSET xTimeEnd= qGetAuctionAdmin.TimeEnd>

<!--- if this is the first bid: max bid = 0 --->
<!--- ------------------------------------- --->
<!--- ------------------------------------- --->
<CFIF xMaxBid is 0>

	<!--- Reserve reached? --->
	<CFIF form.bid gte qGetAuctionAdmin.reserve>
		<CFSET xNewBid = qGetAuctionAdmin.reserve>
		<CFSET xReserveMet = 1>
		
	<!--- If bidding doesn't exceed or match reserve, bet full amount --->
	<CFELSEIF qGetAuctionAdmin.OpeningBid gt 0 and form.bid gte qGetAuctionAdmin.OpeningBid>
		<cfset xNewBid = form.bid - (form.bid mod 5)>
		<!---<CFSET xNewBid = qGetAuctionAdmin.OpeningBid>--->
		
	<CFELSE>
		<CFSET xNewBid = qGetAuctionAdmin.MinimumBidIncrement>
	</CFIF>

	<cfquery name="qInsertNewMaxBid" datasource="photoeyecom">
		Insert Into AuctionMaxBids 
		(AuctionID, MaxBid, DateTime, Custnumber) values (#form.AuctionID#,
			#form.bid#, #Now()#, #qGetCustomerAccount.Custnumber#)
	</cfquery>
	
	<cfquery name="iGetAuctionAdmin" datasource="photoeyecom">
		Insert Into AuctionBids 
		(AuctionID, Bid, DateTime, Custnumber, NickName) values (#form.AuctionID#,
			#xNewBid#,
		    #Now()#, #qGetCustomerAccount.Custnumber#, '#qGetCustomerAccount.auctionname#')
	</cfquery>

	<!--- Email to Auction Admin --->
	<!---The auction reserve has <CFIF xReserveMet is 0>not yet </CFIF>been met. ---> 
<cfmail to="auctions@photoeye.com" from="auctions@photoeye.com" subject="photo-eye Auction update for #qGetAuctionAdmin.Title#">

The first bid has been placed at photo-eye Auctions for:

Auction item: #qGetAuctionAdmin.Title#
Bid time: #xNowFormatted#
High bidder: #qGetCustomerAccount.auctionname#
Bid Amount: $#trim(NumberFormat(xNewBid,"9,999"))#

Auction ends #DateFormat(xTimeEnd, "MMMM DD, YYYY")# #TimeFormat(xTimeEnd, "h:MM:SS")# <CFIF DatePart("H", xTimeEnd) gt 12>pm<CFELSE>am</CFIF> MT.
</cfmail>
	

<!--- If user is updating their max bid --->
<!--- ------------------------------------- --->
<!--- ------------------------------------- --->
<CFELSEIF qGetMaxAccount.CustNumber is qGetCustomerAccount.CustNumber>

	<!--- If the new max bid exceeds the auction reserve and the old one didn't, place the bid --->
	<CFIF (form.bid gte qGetAuctionAdmin.Reserve) and (qGetAuctionBids.Bid lt qGetAuctionAdmin.Reserve)>
		<cfquery name="qInsertNewMaxBid" datasource="photoeyecom">
			 Insert Into AuctionBids 
			(AuctionID, Bid, DateTime, Custnumber, NickName) values (#form.AuctionID#,
				#qGetAuctionAdmin.Reserve#,
			    #Now()#, #qGetCustomerAccount.Custnumber#, '#qGetCustomerAccount.auctionname#')
		</cfquery>	

		<CFSET xReserveMet = 1>
	
	<!--- Otherwise, if the reserve isn't met, bet all --->
	<cfelseif form.bid lt qGetAuctionAdmin.Reserve>
	<cfquery name="qInsertNewMaxBid" datasource="photoeyecom">
		 Insert Into AuctionBids 
		(AuctionID, Bid, DateTime, Custnumber, NickName) values (#form.AuctionID#,
			#form.bid#,
		    #Now()#, #qGetCustomerAccount.Custnumber#, '#qGetCustomerAccount.auctionname#')
	</cfquery>
		
	<CFELSE>
		<!--- For auction reserve message --->
		<CFSET xUserUpdatingBid = 1>
	</CFIF>

	<!--- Update Max Bid --->
	<cfquery name="qUpdateNewMaxBid" datasource="photoeyecom">
		Update AuctionMaxBids SET
		 MaxBid=#form.bid#,
		 DateTime=#Now()#, 
		 Custnumber=#qGetCustomerAccount.Custnumber#
		 WHERE AuctionID=#form.AuctionID#
	</cfquery>	
	
	

<!--- if this bid = the max bid --->
<!--- ------------------------------------- --->
<!--- ------------------------------------- or (xMaxBid-form.bid lt qGetAuctionAdmin.MinimumBidIncrement and xMaxBid-form.bid gt 0) --->
<CFELSEIF (trim(form.bid) is xMaxBid) or (form.bid-xMaxBid lt qGetAuctionAdmin.MinimumBidIncrement and form.bid-xMaxBid gt 0) or  (xMaxBid - form.bid lt qGetAuctionAdmin.MinimumBidIncrement and xMaxBid -form.bid gt 0)>

		<CFSET xNewBid = xMaxBid + qGetAuctionAdmin.MinimumBidIncrement>

	
<!--- Header --->
<!---<CFSET xWindowTitle = "Auctions">
<CFSET xTitle = "Auctions">
<cfinclude template="../templates/Header.cfm">

--->

<cfinclude template="includes/dsp_auctions_index_top.cfm">
	
		<br>
		<table width="800" align="center" cellpadding="0" cellspacing="0"><tr><td align="center" class="Header"><font color="Black" face="Times, Times-Roman, serif" size="5">B</font><font color="Black" face="Times, Times-Roman, serif" size="4">ID</FONT>&nbsp;&nbsp;&nbsp;<font color="Black" face="Times, Times-Roman, serif" size="5">T</font><font color="Black" face="Times, Times-Roman, serif" size="4">AKEN!</FONT></td></tr></table>
		<BR>
		<BR>
		<div align="center"><center>
		<TABLE WIDTH="500"><TR><TD>
		<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
		
		
		<cfoutput>Your bid of <font color="Maroon"><b>$#trim(NumberFormat(form.bid,"99,999"))#</b></font> is <CFIF (trim(form.bid) is not xMaxBid)>within the minimium bid increment of </CFIF>another bidder's maxumum bid! To be the highest bidder you must bid at least <font color="Maroon"><b>$#trim(NumberFormat(xNewBid,"99,999"))#</b></font>.
		</TD></TR></TABLE>
	<BR><BR>
	
<form action="../Auctions/ConfirmBid.cfm" method="post" name="SubmitBid" id="SubmitBid">
	<input type="hidden" name="AuctionID" value="#form.AuctionID#">
	<input type="hidden" name="Bid" value="#xNewBid#">
	<input type="Submit" name="Submit" value="Place a bid for $#trim(NumberFormat(xNewBid,"99,999"))#">&nbsp;&nbsp;<input type="button" value="Cancel" onClick="javascript:history.go(-2)">
</FORM>

	</cfoutput>
	<br>
	</center></div>
	<cfinclude template="includes/dsp_auctions_index_bottom.cfm">

	<CFABORT>


<!--- If the new bid is higher than the AutoBid --->
<!--- ------------------------------------- --->
<!--- ------------------------------------- --->
<CFELSEIF trim(form.bid) gt xMaxBid>	

	<!--- Reserve reached but not passed? --->
	<CFIF (form.bid gte qGetAuctionAdmin.reserve) and (qGetAuctionAdmin.reserve gt xMaxBid)>
			<CFSET xNewBid = qGetAuctionAdmin.reserve>
	<CFELSEif (form.bid gte qGetAuctionAdmin.reserve) and (qGetAuctionAdmin.reserve lte xMaxBid)>
		<CFSET xNewBid = xMaxBid + qGetAuctionAdmin.MinimumBidIncrement>
	<cfelse>
		<cfset xNewBid = form.bid>
	</CFIF>

	<!--- Reserve Met? --->
	<CFIF (xNewBid gte qGetAuctionAdmin.reserve)>
		<CFSET xReserveMet = 1>
	</CFIF>

	<!--- Only insert the max bid if it's not already there (say, from a prior auto-bid) --->
	<CFQUERY NAME="qGetMaxBidAlreadyThere"  DATASOURCE="photoeyecom">
	  SELECT *
	  FROM AuctionBids
	  WHERE AuctionID = #form.AuctionID# and Bid = #qGetMaxBid.MaxBid#
	</CFQUERY> 

	<CFIF qGetMaxBidAlreadyThere.RecordCount is 0>
		<cfquery name="qGetMaxAccount" datasource="photoeyecom">
			Insert Into AuctionBids 
			(AuctionID, Bid, DateTime, Custnumber, NickName) values (#form.AuctionID#,
				#qGetMaxBid.MaxBid#,
			    #Now()#, #qGetMaxAccount.Custnumber#, '#qGetMaxAccount.auctionname#')
		</cfquery>	
	</CFIF>

	<cfquery name="qInsertAuctionBid" datasource="photoeyecom">
		Insert Into AuctionBids 
		(AuctionID, Bid, DateTime, Custnumber, NickName) values (#form.AuctionID#,
			#xNewBid#,
		    #Now()#, #qGetCustomerAccount.Custnumber#, '#qGetCustomerAccount.auctionname#')
	</cfquery>
	
	<cfquery name="qInsertNewMaxBid" datasource="photoeyecom">
		Update AuctionMaxBids SET
		 MaxBid=#form.bid#,
		 DateTime=#Now()#, 
		 Custnumber=#qGetCustomerAccount.Custnumber#
		 WHERE AuctionID=#form.AuctionID#
	</cfquery>


	<!--- Select all but the recent high bidder --->
	<CFQUERY NAME="qGetBidders"  DATASOURCE="photoeyecom">
	  SELECT Distinct CustNumber
	  FROM AuctionBids 
	  WHERE AuctionID = #form.AuctionID# and custnumber <> #qGetCustomerAccount.Custnumber#
	</CFQUERY> 
	
	<cfquery name="qGetOldHighBidder" datasource="photoeyecom">
		Select CustNumber, NickName from AuctionBids where bid = #qGetMaxBid.MaxBid# and auctionid = #form.auctionid#
	</cfquery>
	
	<cfquery name="qGetNewHighBidder" datasource="photoeyecom">
		Select CustNumber, NickName from AuctionBids where bid = #xNewBid# and auctionid = #form.auctionid#
	</cfquery>
	
<CFLOOP QUERY="qGetBidders">

<CFQUERY NAME="qGetBidderInfo"  DATASOURCE="photoeyecom">
  SELECT Distinct CustNumber, FirstName, LastName, Email, AuctionEmail
  FROM MailingList_OM 
  WHERE Custnumber = #qGetBidders.CustNumber#
</CFQUERY> 

<CFIF qGetBidderInfo.AuctionEmail is 1>
<!--- The auction reserve has <CFIF xReserveMet is 0>not yet </CFIF>been met.  --->
<cfmail to="#qGetBidderInfo.Email#" bcc="rixon@photoeye.com" from="auctions@photoeye.com" subject="photo-eye Auction update for #qGetAuctionAdmin.Title#">
#qGetBidderInfo.FirstName# #qGetBidderInfo.LastName#, 

A new bid has been placed at photo-eye Auctions!
<CFIF xExtended is 1>
Auction extended by five minutes, since a bid was placed within five minutes of the end of the auction. This automatically ensures that everyone has a fair chance to place their final bids.
</CFIF>
Auction item: #qGetAuctionAdmin.Title#
Bid time: #xNowFormatted#
High bidder: #qGetNewHighBidder.nickname# 
Bid Amount: $#trim(NumberFormat(xNewBid,"99,999"))#

Bids can be placed for this auction until #DateFormat(xTimeEnd, "MMMM DD, YYYY")# #TimeFormat(xTimeEnd, "h:MM:SS")# <CFIF DatePart("H", xTimeEnd) gt 12>pm<CFELSE>am</CFIF> MT. Good luck!

Visit photo-eye Auctions:
http://www.photoeye.com/auctions/

If you have any questions, please contact auctions@photoeye.com.
</cfmail>
</CFIF>
	
</CFLOOP>

<!--- Email to Auction Admin --->
<!--- The auction reserve has <CFIF xReserveMet is 0>not yet </CFIF>been met.  --->
<cfmail to="auctions@photoeye.com" from="auctions@photoeye.com" bcc="rixon@photoeye.com"  subject="photo-eye Auction update for #qGetAuctionAdmin.Title#">

A new bid has been placed at photo-eye Auctions!

<CFIF xExtended is 1>Auction extended by five minutes!</CFIF>

Auction item: #qGetAuctionAdmin.Title#
Bid time: #xNowFormatted#
High bidder: #qGetNewHighBidder.nickname# 
Bid Amount: $#trim(NumberFormat(xNewBid,"99,999"))#

Auction ends #DateFormat(xTimeEnd, "MMMM DD, YYYY")# #TimeFormat(xTimeEnd, "h:MM:SS")# <CFIF DatePart("H", xTimeEnd) gt 12>pm<CFELSE>am</CFIF> MT.
</cfmail>



<!--- If the new bid is lower than the AutoBid --->
<!--- ------------------------------------- --->
<!--- ------------------------------------- --->
<CFELSEIF trim(form.bid) lt xMaxBid>	
	
	<CFSET xNewBid = trim(form.bid) + qGetAuctionAdmin.MinimumBidIncrement>
	<CFIF xNewBid gt xMaxBid>
		<CFSET xNewBid = xMaxBid>
	</CFIF>
	
	<!--- Reserve Met? --->
	<CFIF (xNewBid gte qGetAuctionAdmin.reserve)>
		<CFSET xReserveMet = 1>
	</CFIF>

	<CFSET xAutoBid =1>
	
	<cfquery name="iGetAuctionAdmin" datasource="photoeyecom">
		Insert Into AuctionBids 
		(AuctionID, Bid, DateTime, Custnumber, NickName) values (#form.AuctionID#,
			#form.bid#,
		    #Now()#, #qGetCustomerAccount.Custnumber#, '#qGetCustomerAccount.auctionname#')
	</cfquery>
	
	<!--- Now Auto bid for the max bidder --->
	<cfquery name="iGetAuctionAdmin" datasource="photoeyecom">
		Insert Into AuctionBids 
		(AuctionID, Bid, DateTime, Custnumber, NickName) values (#form.AuctionID#,
			#xNewBid#, #Now()#, #qGetMaxBid.Custnumber#, '#qGetMaxAccount.AuctionName#')
	</cfquery>
	
	
<!--- Email --->
	<CFQUERY NAME="qGetBidders"  DATASOURCE="photoeyecom">
	  SELECT Distinct CustNumber
	  FROM AuctionBids 
	  WHERE AuctionID = #form.AuctionID#
	</CFQUERY> 
	
	<cfquery name="qGetHighBidder" datasource="photoeyecom">
		Select CustNumber, NickName from AuctionBids where bid = #xNewBid# and auctionid = #form.auctionid#
	</cfquery>
	
<CFLOOP QUERY="qGetBidders">

<CFQUERY NAME="qGetBidderInfo"  DATASOURCE="photoeyecom">
  SELECT Distinct CustNumber, FirstName, LastName, Email, AuctionEmail
  FROM MailingList_OM 
  WHERE Custnumber = #qGetBidders.CustNumber#
</CFQUERY> 

<CFIF qGetBidderInfo.AuctionEmail is 1>
<!--- The auction reserve has <CFIF xReserveMet is 0>not yet </CFIF>been met.  --->
<cfmail to="#qGetBidderInfo.Email#" from="auctions@photoeye.com" bcc="rixon@photoeye.com" subject="photo-eye Auction update for #qGetAuctionAdmin.Title#">
#qGetBidderInfo.FirstName# #qGetBidderInfo.LastName#, 

A new bid has been placed at photo-eye Auctions!

<CFIF xExtended is 1>Auction extended by five minutes, since a bid was placed within five minutes of the end of the auction. This automatically ensures that everyone has a fair chance to place their final bids.</CFIF>

Auction item: #qGetAuctionAdmin.Title#
Bid time: #xNowFormatted#
High bidder: #qGetHighBidder.nickname# 
Bid Amount: $#trim(NumberFormat(xNewBid,"99,999"))# 

Bids can be placed for this auction until #DateFormat(xTimeEnd, "MMMM DD, YYYY")# #TimeFormat(xTimeEnd, "h:MM:SS")# <CFIF DatePart("H", xTimeEnd) gt 12>pm<CFELSE>am</CFIF> MT. Good luck!

Visit photo-eye Auctions:
http://www.photoeye.com/auctions/index.cfm	

If you have any questions, please contact auctions@photoeye.com.
</cfmail>
</CFIF>

</CFLOOP>

<!--- Email to Auction Admin --->
<!--- The auction reserve has <CFIF xReserveMet is 0>not yet </CFIF>been met.  --->
<cfmail to="auctions@photoeye.com" from="auctions@photoeye.com" bcc="rixon@photoeye.com" subject="photo-eye Auction update for #qGetAuctionAdmin.Title#">

A new bid has been placed at photo-eye Auctions!

<CFIF xExtended is 1>Auction extended by five minutes!</CFIF>

Auction item: #qGetAuctionAdmin.Title#
Bid time: #xNowFormatted#
High bidder: #qGetHighBidder.nickname# 
Bid Amount: $#trim(NumberFormat(xNewBid,"99,999"))#

Auction ends #DateFormat(xTimeEnd, "MMMM DD, YYYY")# #TimeFormat(xTimeEnd, "h:MM:SS")# <CFIF DatePart("H", xTimeEnd) gt 12>pm<CFELSE>am</CFIF> MT.
</cfmail>

</CFIF>




<CFIF trim(form.bid) lt xMaxBid>
<!--- Top of the page for all included messages --->
<!--- Header --->
<!---<CFSET xWindowTitle = "Auctions">
<CFSET xTitle = "Auctions">
<cfinclude template="../templates/Header.cfm">--->
<cfinclude template="includes/dsp_auctions_index_top.cfm">

	<table width="800" align="center" cellpadding="0" cellspacing="0">
	  <tr>
	        <td align="center" class="Header"><font color="Black" face="Times, 'Times-Roman', serif" size="5">
	B</font><font color="Black" face="Times, 'Times-Roman', serif" size="4">ID</FONT>&nbsp;&nbsp;<font color="Black" face="Times, 'Times-Roman', serif" size="5">M</FONT><font color="Black" face="Times, 'Times-Roman', serif" size="4">ATCHED</FONT></td>
	  </tr></table>
		<BR>
		<BR>
		<div align="center"><center>
		<font color="Black"  size="2">
		
		<cfoutput>Another bidder has set a maximum bid higher than your bid of <font color="Maroon"><b>$#trim(NumberFormat(form.bid,"99,999"))#</b></font>. 
<BR>
<CFSET xNewHighBid =trim(form.bid) + qGetAuctionAdmin.MinimumBidIncrement>
<CFIF xNewHighBid gt xMaxBid>
	<CFSET xNewHighBid = xMaxBid>
</CFIF>
An automatic counter-bid of <font color="Maroon"><b>$#trim(NumberFormat(xNewHighBid,"99,999"))#</b></FONT> has been placed in their name.
<BR><BR>
To be the highest bidder you will need to place another bid.

<CFIF xExtended is 1>
<TABLE WIDTH="550"><TR><TD>
<font color="Black"  size="2"><BR><BR><FONT COLOR="RED"><B>Auction Extended!</B></FONT> Since you have placed a bid within five minutes of the end of the auction, the auction has been automatically extended by another five minutes to give other bidders a fair chance to place their bids. <A HREF="../Auctions/AboutAuctionExtension.cfm">Read</A> more about auction extensions.</FONT>
</TD></TR></TABLE>
</CFIF>

	<BR><BR>
	<CFIF xExtended is 1>
		<FORM METHOD="POST" ACTION="../Auctions/Auction.cfm?id=#form.AuctionID#&Extended=1">
	<CFELSE>
		<FORM METHOD="POST" ACTION="../Auctions/Auction.cfm?id=#form.AuctionID#">
	</CFIF>
	<INPUT TYPE="submit" VALUE="Return to the Auction">
	</FORM>
	</cfoutput>
	<br>
	</center></div>
	<cfinclude template="includes/dsp_auctions_index_bottom.cfm">
	<CFABORT>
</CFIF>

<cfquery name="qGetAuctionBids" datasource="photoeyecom">
	Select Max(bid) as Bid FROM AuctionBids 
	WHERE AuctionID = #form.AuctionID#
</cfquery>

<cfquery name="qGetPreviousBid" datasource="photoeyecom">
	SELECT     TOP 2 Bid
FROM         AuctionBids
WHERE     AuctionID = #form.AuctionID#
ORDER BY Bid DESC
</cfquery>

<CFSET xPreviousBid = 0>
<CFLOOP QUERY="qGetPreviousBid">
	<CFSET xPreviousBid = Bid>
</CFLOOP>

<CFIF (qGetAuctionBids.Bid gte qGetAuctionAdmin.Reserve) and ((xPreviousBid lt qGetAuctionAdmin.Reserve) or qGetPreviousBid.RecordCount is 1) and xUserUpdatingBid is 0>
	<CFSET xReserveFirstMet = 1>
<CFELSE>
	<CFSET xReserveFirstMet = 0>
</CFIF>

<!--- Send back to auction --->
<CFIF xExtended is 1>
	<CFIF xReserveFirstMet is 1>
		<cflocation url="../Auctions/Auction.cfm?id=#form.AuctionID#&Extended=1&R=1">
	<CFELSE>
		<cflocation url="../Auctions/Auction.cfm?id=#form.AuctionID#&Extended=1">
	</CFIF>
<CFELSE>
	<CFIF xReserveFirstMet is 1>
		<cflocation url="../Auctions/Auction.cfm?id=#form.AuctionID#&R=1">
	<CFELSE>
		<cflocation url="../Auctions/Auction.cfm?id=#form.AuctionID#">
	</CFIF>
</CFIF>