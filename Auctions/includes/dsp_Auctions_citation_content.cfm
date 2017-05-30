<CFSET xPage1="index.cfm">
<CFSET xPage2="BidHistory.cfm">
<CFSET xPage3="Enlargement.cfm">
<CFSET xPage4="MoreImages.cfm">

<!--- Test to see if an auction has ended and should be announced --->
<CFINCLUDE TEMPLATE="/templates/auctionscheduler.cfm">
<CFPARAM NAME="URL.UID" DEFAULT="0">
<CFPARAM NAME="URL.TEST" DEFAULT="">
<CFPARAM NAME="URL.ID" DEFAULT="2570">

<!--- This is the auction id --->
<CFIF not IsDefined("url.ID")>
	<CFLOCATION URL="#xPage1#">
</CFIF>

<cfif not isNumeric(url.id)>
	<cfset url.id = 0>
</cfif>


<cfquery name="qGetAuctionAdmin" datasource="photoeyecom">
	Select *
	from AuctionAdmin
	where AuctionID = <cfqueryparam value="#URL.ID#" cfsqltype="cf_sql_integer">
</cfquery>

<CFIF (qGetAuctionAdmin.Publish is 0 and url.Test is not "AuctionTest") or qGetAuctionAdmin.RecordCount is 0>
	<CFLOCATION URL="#xPage1#" addtoken="false">
</CFIF>

<!--- Move this next if to the auction front page --->
<!--- Relocate from the secure version of this page, if necessary
	<CFIF (mid(CGI.HTTP_REFERER, 5, 1) is "s")>
	<CFLOCATION URL="#xURLHome#/auctions/auction.cfm?UID=#url.uid#&ID=#url.id#">
	</CFIF>--->
<!--- Carry over the cookie --->
<CFIF IsDefined("url.UID")>
	<CFIF url.UID is not 0>
		<CFSET cookie.UserIdNumber = url.UID>
	</CFIF>
</CFIF>

<CFINCLUDE template="/templates/UserIdentification.cfm">

<!--- If Session.AcctID is 0, structdelete --->
<CFIF IsDefined("Session.AcctID")>
	<CFIF Session.AcctID is 0>
		<CFSET StructDelete(SESSION, "AcctID")>
	</CFIF>
</CFIF>

<CFIF IsDefined("Url.ID")>
	<CFSET Session.AuctionID = url.ID>
</CFIF>

<!--- Reset form variables from session vars --->
<cflock scope="session" timeout="5" type="readonly">
	<CFIF IsDefined("Session.Bid")>
		<CFIF Session.AuctionID is url.ID>
			<CFSET url.bid = Session.Bid>
		</CFIF>
	</CFIF>
</CFLOCK>

<CFIF ISDEFINED("Session.AcctID")>
	<cflock timeout="5" throwontimeout="No" type="READONLY" scope="SESSION">
		<CFSET xCustomerExists = 1>
		<CFQUERY NAME="qGetCustomerAccount"  DATASOURCE="photoeyecom">
	  SELECT *
	  FROM MailingList_OM
	  WHERE Custnumber = <cfqueryparam value="#Session.AcctID#" cfsqltype="cf_sql_varchar">
	</CFQUERY>
		<CFQUERY NAME="qGetMaxAccount"  DATASOURCE="photoeyecom">
	  SELECT *
	  FROM AuctionMaxBids
	  WHERE Custnumber = <cfqueryparam value="#Session.AcctID#" cfsqltype="cf_sql_varchar">
	  and auctionid = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_varchar">
	</CFQUERY>
	</cflock>
</CFIF>

<cfset xThisPageMenu = 0>

<cfparam name="url.bid" default="">
<CFPARAM NAME="xSeconds" DEFAULT="30">

<cfquery name="qGetAuctionAdmin" datasource="photoeyecom">
	Select * from AuctionAdmin
	where auctionid = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_varchar">
</cfquery>

<cfquery name="qGetAuctionBids" datasource="photoeyecom">
	Select Max(bid) as Bid, Count(autoid) as Count
	from AuctionBids
	where auctionid = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_varchar">
</cfquery>

<cfquery name="qGetAuctionBids2" datasource="photoeyecom">
	Select * from AuctionBids
	where auctionid = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_varchar">
	order by bid desc
</cfquery>

<cfquery name="qGetAuctionBids3" datasource="photoeyecom">
	Select top 3 * from AuctionBids
	where auctionid = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_varchar">
	order by bid desc
</cfquery>

<!--- Auction Time Remaining --->
<CFINCLUDE TEMPLATE="/auctions/AuctionTime.cfm">
<!---<!--- Header --->
<CFSET xWindowTitle = "Auctions">
<CFSET xTitle = "Auctions">
<cfinclude template="../templates/Header.cfm">
--->
<DIV ALIGN="CENTER">
	<CENTER>
		<!--- Page Title --->
		<table width="650" align="center" cellpadding="0" cellspacing="0">
			<tr height="40">
				<td>
				</td>
			</tr>
			<tr>
				<td align="center" class="Header">
					<!---			<CFSET xTitleParse = trim(qGetAuctionAdmin.Title)>
						<CFSET xTitle = "">
						<CFSET xTitleLength = Len(xtitleParse)>
						<cfloop index="Count" from="1" to="#xTitleLength#" step="1">
						<CFSET Letter = Mid(xTitleParse, Count, 1)>
						<CFIF Count gt 1>
						<CFSET PreviousLetter = Mid(xTitleParse, Count-1, 1)>
						</CFIF>
						<!--- if It's a number --->
					<!---			<CFIF asc(Letter) gte 48 and asc(Letter) lte 57>
						<CFSET xTitle = xTitle & '<font color="Black" face="Times, Times-Roman, serif" size="5">'&Letter&'</FONT>'>
					<CFELSEIF Count is 1>
						<CFSET xTitle = '<font color="Black" face="Times, Times-Roman, serif" size="5">'&Letter&'</FONT>'>
					<CFELSEIF (asc(PreviousLetter) is 32 or asc(PreviousLetter) is 45) and (asc(Letter) gte 65 and asc(Letter) lte 90)>
						<CFSET xTitle = xTitle & '<font color="Black" face="Times, Times-Roman, serif" size="5">'&Ucase(Letter)&'</FONT>'>
					<CFELSE>
						<CFSET xTitle = xTitle & '<font color="Black" face="Times, Times-Roman, serif" size="4">'&UCASE(Letter)&'</FONT>'>
						</CFIF>--->
					<CFIF asc(Letter) gte 48 and asc(Letter) lte 57>
						<CFSET xTitle = xTitle & '<font color="Black" face="Arial" size="5">'&Letter&'</FONT>'>
					<CFELSEIF Count is 1>
						<CFSET xTitle = '<font color="Black" face="Arial" size="5" style="line-height:40px;">'&Letter&'</FONT>'>
					<CFELSEIF (asc(PreviousLetter) is 32 or asc(PreviousLetter) is 45) and (asc(Letter) gte 65 and asc(Letter) lte 90)>
						<CFSET xTitle = xTitle & '<font color="Black" face="Arial" size="5" style="line-height:40px;">'&Ucase(Letter)&'</FONT>'>
					<CFELSE>
						<CFSET xTitle = xTitle & '<font color="Black" face="Arial" size="4" style="line-height:30px;">'&UCASE(Letter)&'</FONT>'>
					</CFIF>
					</CFLOOP>--->
					<cfoutput>
						<font color="##333333" face="Arial" style="line-height:30px; font-size:24px;">
							#trim(qGetAuctionAdmin.Title)#
						</font>
					</cfoutput>
					<!---<CFOUTPUT>#xTitle#</CFOUTPUT>--->
				</td>
			</tr>
		</table>
		<form action="ConfirmBid.cfm" method="post" name="SubmitBid" id="SubmitBid">
			<CFOUTPUT>
				<input type="hidden" name="AuctionID" value="#url.id#">
			</CFOUTPUT>
			<CFIF IsDefined("url.Extended")>
				<TABLE WIDTH="550">
					<TR>
						<TD>
							<FONT COLOR="RED">
								<B>
									Auction Extended!
								</B>
							</FONT>
							Since you have placed a bid within five minutes of the end of the auction, the auction has been automatically extended by another five minutes to give other bidders a fair chance to place their bids.
							<A HREF="Extensions.cfm">
								Read
							</A>
							more about auction extensions.
							<BR>
							<BR>
						</TD>
					</TR>
				</TABLE>
			</CFIF>
			<CFIF IsDefined("url.R")>
				<CFOUTPUT>
					<TABLE WIDTH="550">
						<TR>
							<TD>
								<!--- <FONT COLOR="GREEN"><B>Reserve Met!</B></FONT> --->
								Your maximum bid of
								<b>
									$#trim(NumberFormat(qGetMaxAccount.MaxBid,"99,999"))#
								</b>
								<CFIF qGetMaxAccount.MaxBid is qGetAuctionBids.Bid>
									meets
								<CFELSE>
									exceeds
								</CFIF>
								this item's auction reserve of
								<b>
									$#qGetAuctionBids.Bid#
								</b>
								. Thus, a bid of
								<b>
									$#trim(NumberFormat(qGetAuctionBids.Bid,"99,999"))#
								</b>
								has been placed for you.
								<A HREF="Reserves.cfm">
									Read
								</A>
								more about auction reserves.
								<BR>
								<BR>
							</TD>
						</TR>
					</TABLE>
				</CFOUTPUT>
			</CFIF>
			<!--- <table width="600" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr>
				<td align="center">
				<font color="Black"  size="2">
				<cflock scope="session" timeout="5" type="readonly">
				<cfif NOT IsDefined("session.acctid")>
				<CFOUTPUT>
				To bid you must be logged in. <b><a href="../templates/Newpasswordenter.cfm?Auction=1&nobid=1">Login Now</A></B>
				</CFOUTPUT>
			<CFELSE>
				<CFQUERY NAME="qGetCustomerAccount"  DATASOURCE="photoeyecom">
				SELECT *
				FROM MailingList_OM
				WHERE Custnumber = #Session.AcctID#
				</CFQUERY>
				<CFOUTPUT>
				<CFIF Len(Trim(qGetCustomerAccount.AuctionName)) IS 0 or qGetCustomerAccount.PaymentMethod is not 1>You are logged in. <BR>To bid, you must first:
			<CFELSE></FONT><B><FONT  size="2" COLOR="Maroon">#qGetCustomerAccount.AuctionName#</FONT></B><FONT  size="2" COLOR="Black"> you may place a bid</font></CFIF>
				</CFOUTPUT>
				</cfif>
				</cflock>
				</FONT></td></tr></table> --->
			<CFOUTPUT>
				<TABLE align="center">
					<TR>
						<TD align="center">
							<CFIF xAuctionEnded is 0>
								<font color="Maroon" size="2">
									<CFIF IsDefined("xCustomerExists")>
										<CFIF qGetCustomerAccount.AuctionName gt "">
											<B>
												<FONT COLOR="MAROON">
													#qGetCustomerAccount.AuctionName#
												</FONT>
											</B>
										</CFIF>
										<CFIF qGetMaxAccount.RecordCount is 1>
											<FONT COLOR="Black">
												you are currently the highest bidder
												<BR>
												Your
												<cfif qGetMaxAccount.MaxBid gt qGetAuctionBids.Bid>
													secret
												</cfif>
												<A HREF="MaximumBid.cfm">
													Maximum Bid
												</A>
												is set at
											</FONT>
											<b>
												<FONT COLOR="MAROON" SIZE="2">
													$#trim(NumberFormat(qGetMaxAccount.MaxBid,"999,999"))#
											</b>
											</FONT>
										<CFELSE>
											<FONT COLOR="Black">
												place your
												<A HREF="MaximumBid.cfm">
													Maximum Bid
												</A>
											</FONT>
										</CFIF>
										<BR>
										<BR>
									</CFIF>
								</FONT>
								<font color="Maroon" size="2">
									<b>
										US$&nbsp;
										<input name="Bid" type="text" class="input_text" style="FONT-SIZE: 12px" value="#url.bid#" size="10" maxlength="5">
									</b>
								</FONT>
								<input name="SubmitBid" type="submit" class="input_submit" style="FONT-SIZE: 12px" value="Submit <CFIF IsDefined('xCustomerExists')><CFIF qGetMaxAccount.RecordCount is 1>New</CFIF></CFIF> Maximum Bid">
							<CFELSE>
								<font size="2">
									<CFIF qGetAuctionBids3.RecordCount is 0 or qGetAuctionBids.Bid lt qGetAuctionAdmin.Reserve>
										<B>
											Auction Ended: Still Available
											<!--- Reserve Not Met --->
										</B>
										<CFIF qGetAuctionAdmin.PostAuctionSale gt 0>
											<BR>
											Sold!
											<A HREF="PostAuctionSaleInfo.cfm">
												Post-Auction Sale
											</A>
										<CFELSE>
											<BR>
											Still interested?</A> Please
											<A HREF="mailto:auctions@photoeye.com?Subject=#qGetAuctionAdmin.Title#">
												inquire
											</A>
											.
										</CFIF>
									<CFELSE>
										<B>
											Auction Winner:
											<FONT COLOR="Maroon">
												#qGetAuctionBids3.NickName#
											</FONT>
										</B>
									</CFIF>
								</FONT>
							</CFIF>
						</TD>
					</TR>
					<TR>
						<TD align="center">
							<font size="1" COLOR="##666666">
								Bids are placed for you automatically up to your
								<A HREF="MaximumBid.cfm">
									Maximum Bid
								</A>
								<BR>
								Minimum bid increment: $#trim(NumberFormat(qGetAuctionAdmin.MinimumBidIncrement,"99,999"))#&nbsp;&nbsp;&nbsp;
								<A HREF="MaximumBid.cfm">
									Learn More
								</A>
								about bidding
							</FONT>
						</TD>
					</TR>
				</TABLE>
				<TABLE CELLPADDING="10">
					<TR>
						<TD ALIGN="CENTER" VALIGN="TOP">
							<table width="385" border="0" cellspacing="0" cellpadding="0" align="center">
								<tr bgcolor="##800000">
									<td align="center" width="25">
										<font color="White"  size="2">
											<b>
												Bid&nbsp;##
											</b>
										</FONT>
									</td>
									<td align="center" width="100">
										<font color="White"  size="2">
											<b>
												<CFIF qGetAuctionAdmin.OpeningBid gt 0 and qGetAuctionBids2.RecordCount is 0>
													Opening
												<CFELSE>
													High
												</CFIF>
												Bid
											</b>
										</FONT>
									</td>
									<td align="center" width="100">
										<font color="White"  size="2">
											<b>
												Name
											</b>
										</FONT>
									</td>
									<td align="center" width="135">
										<font color="White"  size="2">
											<b>
												Time (MT)
											</b>
										</FONT>
									</td>
								</TR>
								<CFSET BidCounter = 0>
								<cfloop query="qGetAuctionBids3">
									<CFSET BidNumber = qGetAuctionBids.count - BidCounter>
									<!---
										<CFIF BidCounter is 1>
										<tr bgcolor="##DDDDDD">
									<CFELSEIF BidCounter is 2>
										<tr bgcolor="##CCCCCC">
									<CFELSE>
										<TR bgcolor="##EEEEEE">
										</CFIF>
										--->
									<CFIF BidCounter is 1>
										<tr bgcolor="##F5EFCB">
										<CFELSEIF BidCounter is 2>
										<tr bgcolor="##F5EBB5">
										<CFELSE>
										<tr bgcolor="##F4F1E1">
									</CFIF>
									<CFIF BidCounter is 0> <TD align="center" width="20"> <font color="Black"  size="2"> <b>#BidNumber#</b></FONT> </td> <td align="center" width="100"> <font color="Black"  size="2"> <b>$#Trim(NumberFormat(qGetAuctionBids3.Bid,"999,999"))#</b><CFIF qGetAuctionBids3.Bid lt qGetAuctionAdmin.Reserve><FONT FACE="Arial, Helvetica" COLOR="RED">*</FONT></CFIF></FONT> </td> <td align="center" width="100"> <font color="Black"  size="2"> <b>#qGetAuctionBids3.NickName#</b></FONT> </TD> <td align="center" width="135"> <font color="Black"  size="2"> <b>#TimeFormat(qGetAuctionBids3.DateTime-CreateTimeSpan(0,2,0,0), "H:MM:SS")#&nbsp;&nbsp;#DateFormat(qGetAuctionBids3.DateTime-CreateTimeSpan(0,2,0,0), "MMM D")#</b></FONT> </TD> <CFELSE> <TD align="center" width="20"> <font color="Black"  size="2"> #BidNumber#</FONT> </td> <td align="center" width="100"> <font color="Black"  size="2"> $#Trim(NumberFormat(qGetAuctionBids3.Bid,"999,999"))# </FONT> </td> <td align="center" width="100"> <font color="Black"  size="2"> #qGetAuctionBids3.NickName#</FONT> </TD> <td align="center" width="135"> <font color="Black"  size="2"> #TimeFormat(qGetAuctionBids3.DateTime-CreateTimeSpan(0,2,0,0), "H:MM:SS")#&nbsp;&nbsp;#DateFormat(qGetAuctionBids3.DateTime-CreateTimeSpan(0,2,0,0), "MMM D")#</FONT> </TD> </CFIF> </TR>
									<CFSET BidCounter = BidCounter + 1>
								</CFLOOP>
								<!--- Show Opening Bid --->
								<CFIF qGetAuctionAdmin.OpeningBid gt 0 and qGetAuctionBids2.RecordCount is 0>
									<CFIF BidCounter is 0>
										<CFSET OpeningBidColor = "##F4F1E1">
									<CFELSEIF BidCounter is 1>
										<CFSET OpeningBidColor = "##F5EFCB">
									<CFELSEIF BidCOunter is 2>
										<CFSET OpeningBidColor = "##F5EBB5">
									</CFIF>
									<tr bgcolor="#OpeningBidColor#">
										<TD align="center" width="20">
											<font color="Black"  size="2">
												0
											</FONT>
										</td>
										<td align="center" width="100">
											<font color="Black"  size="2">
												$#Trim(NumberFormat(qGetAuctionAdmin.OpeningBid,"999,999"))#
											</FONT>
										</td>
										<td align="center" width="100">
											<font color="Black"  size="2">
											</FONT>
										</TD>
										<td align="center" width="135">
											<font color="Black"  size="2">
											</FONT>
										</TD>
									</TR>
									<CFSET BidCounter = BidCounter+1>
								</CFIF>
								<!--- If there have been no bids --->
								<CFIF BidCounter is 0>
									<tr bgcolor="##F4F1E1">
										<TD align="center" width="20">
											<font color="Black"  size="2">
												<b>
													0
												</b>
											</FONT>
										</td>
										<td align="center" width="100">
											<font color="Black"  size="2">
												<b>
													-
												</b>
											</FONT>
										</td>
										<td align="center" width="100">
											<font color="Black"  size="2">
												<b>
													-
												</b>
											</FONT>
										</TD>
										<td align="center" width="135">
											<font color="Black"  size="2">
												<b>
													-
												</b>
											</FONT>
										</TD>
									</TR>
									<tr bgcolor="##F5EFCB">
										<TD align="center" width="20">
											&nbsp;
										</td>
										<td align="center" width="100">
											&nbsp;
										</td>
										<td align="center" width="100">
											&nbsp;
										</TD>
										<td align="center" width="135">
											&nbsp;
										</TD>
									</TR>
									<tr bgcolor="##F5EBB5">
										<TD align="center" width="20">
											&nbsp;
										</td>
										<td align="center" width="100">
											&nbsp;
										</td>
										<td align="center" width="100">
											&nbsp;
										</TD>
										<td align="center" width="135">
											&nbsp;
										</TD>
									</TR>
								</CFIF>
								<!--- Only One Bid --->
								<CFIF BidCounter is 1>
									<tr bgcolor="##F5EFCB">
										<TD align="center" width="20">
											&nbsp;
										</td>
										<td align="center" width="100">
											&nbsp;
										</td>
										<td align="center" width="100">
											&nbsp;
										</TD>
										<td align="center" width="135">
											&nbsp;
										</TD>
									</TR>
									<tr bgcolor="##F5EBB5">
										<TD align="center" width="20">
											&nbsp;
										</td>
										<td align="center" width="100">
											&nbsp;
										</td>
										<td align="center" width="100">
											&nbsp;
										</TD>
										<td align="center" width="135">
											&nbsp;
										</TD>
									</TR>
								</CFIF>
								<!--- Two Bids --->
								<CFIF BidCounter is 2>
									<tr bgcolor="##F5EBB5">
										<TD align="center" width="20">
											&nbsp;
										</td>
										<td align="center" width="100">
											&nbsp;
										</td>
										<td align="center" width="100">
											&nbsp;
										</TD>
										<td align="center" width="135">
											&nbsp;
										</TD>
									</TR>
								</CFIF>
								<TR>
									<TD HEIGHT="15" ALIGN="LEFT" VALIGN="BOTTOM" COLSPAN="3">
										<CFIF qGetAuctionBids.Bid lt qGetAuctionAdmin.Est_Low>
											<CFIF qGetAuctionAdmin.Est_Low gt 0 or qGetAuctionAdmin.Est_High gt 0>
												<b>
													<font color="Maroon"  size="1">
														<A HREF="Estimates.cfm">
															Estimated Value:
														</A>
														$
														<CFIF qGetAuctionAdmin.Est_Low gt 0>
															#trim(NumberFormat(qGetAuctionAdmin.Est_Low,"99,999"))#
														</CFIF>
														<CFIF qGetAuctionAdmin.Est_Low gt 0 and qGetAuctionAdmin.Est_High gt 0>
															&nbsp;&ndash;&nbsp;
														</CFIF>
														<CFIF qGetAuctionAdmin.Est_High gt 0>
															$#trim(NumberFormat(qGetAuctionAdmin.Est_High,"99,999"))#
														</CFIF>
													</FONT>
												</b>
												<BR>
											</CFIF>
										</CFIF>
										<CFIF QGetAuctionBids2.RecordCount gt 0 and qGetAuctionAdmin.Reserve GT qGetAuctionBids.Bid>
											<FONT FACE="Arial, Helvetica" SIZE="2" COLOR="RED">
												*
											</FONT>
										</CFIF>
										<a href="Reserves.cfm">
											<cfif qGetAuctionAdmin.Reserve GT qGetAuctionBids.Bid>
												<font color="Red"  size="1">
													<!---<b>Reserve Not Met</b>--->
												</font>
											<cfelse>
												<!---<font color="Green"  size="1"><b>Reserve Met</b></font>--->
											</cfif>
										</a>
									</TD>
									<TD HEIGHT="15" ALIGN="RIGHT" VALIGN="TOP" COLSPAN="1">
										<CFIF BidCounter is 3>
											<font color="Black"  size="1">
												<a href="#xpage2#?id=#url.id#">
													View Complete Bid History
												</a>
											</FONT>
										<CFELSE>
											&nbsp;
										</CFIF>
									</TD>
								</TR>
							</TABLE>
						</TD>
						<TD ALIGN="CENTER"  VALIGN="TOP">
							<TABLE cellpadding="0" cellspacing="0" valign="top">
								<CFIF xAuctionEnded is 0>
									<TR>
										<TD ALIGN="CENTER">
											<font color="Black"  size="2">
												<b>
													Auction Countdown
												</b>
											</font>
										</TD>
									</TR>
								</CFIF>
								<TR>
									<TD VALIGN="Middle" ALIGN="CENTER">
										<B>
											<FONT COLOR="MAROON"  size="2">
												<CFIF xAuctionEnded is 0>
													<CFIF xdays gt 0>
														#xdays# day<CFIF xdays gt 1>s</CFIF>
													</CFIF>
													<CFIF xhours gt 0 or xdays gt 0>
														&nbsp;&nbsp;#xhours# hr<CFIF xhours is not 1>s</CFIF>
													</CFIF>
													<CFIF xminutes gt 0 or xdays gt 0 or xhours gt 0>
														&nbsp;&nbsp;#xminutes# min
														<CFIF xhours lte 0 and xdays lte 0>
															&nbsp;&nbsp;#xseconds# sec
														</CFIF>
													<CFELSE>
														#xseconds# sec
													</CFIF>
												<CFELSE>
													Auction Ended
												</CFIF>
											</FONT>
										</B>
									</TD>
								</TR>
								<TR>
									<TD ALIGN="CENTER">
										<FONT  size="2">
											<b>
												<CFIF xAuctionEnded is 0>
													Ends
												</CFIF>
												#DateFormat(qGetAuctionAdmin.TimeEnd, "MMM D, YYYY")# #TimeFormat(qGetAuctionAdmin.TimeEnd, "h:mm")#
												<CFIF DatePart("H", qGetAuctionAdmin.TimeEnd) is 12>
													noon
												<CFELSEIF DatePart("H", qGetAuctionAdmin.TimeEnd) gt 12>
													pm
												<CFELSE>
													am
												</CFIF>
												MT
											</b>
										</FONT>
										<CFIF xAuctionEnded is 0>
											<br>
											<font color="Black"  size="1">
												<img src="/img/dot_clear.gif" width="1" height="20" border="0">
												<input name="" type="button" class="input_button" style="FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif;FONT-SIZE: 10px" onclick="javascript:window.location.href='citation.cfm?id=#url.id#'" value="Refresh Bids / Clock">
												<BR>
												<FONT SIZE="1" >
													<A HREF="Extensions.cfm">
														About Auction Extensions
													</A>
												</FONT>
											</FONT>
										</CFIF>
									</TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
				</TABLE>
				<table width="620" border="0" cellspacing="0" cellpadding="0" align="center">
					<tr>
						<td valign="top">
							<table>
								<tr>
									<td align="left" valign="top">
										<font color="Black"  size="2">
											<CFIF len(trim(qgetauctionadmin.bibliographic)) gt 0>
												#qgetauctionadmin.bibliographic#
												<BR>
												<BR>
											</CFIF>
											#qgetauctionadmin.description#
											<CFIF len(trim(qgetauctionadmin.condition)) gt 0>
												<BR>
												<BR>
												#qgetauctionadmin.condition#
											</CFIF>
										</font>
									</td>
								</tr>
								<CFIF url.id is 1>
									<tr>
										<td align="left">
											<img src="/auctions/Img/1/JPW%20signature_s.gif" width="135" height="72" alt="" border="0">
										</td>
									</tr>
									<tr>
										<td height="20">
											&nbsp;
											<br>
											<font color="Black"  size="2">
												Joel-Peter Witkin
											</font>
										</td>
									</tr>
								</CFIF>
							</table>
						</td>
						<td valign="top" valign="center">
							<table align="center" cellpadding="10">
								<tr>
									<td align="center" valign="top">
										<!--- Rick Added 9/21/06  Set the Directory --->
										<!---<cfset currentDirectory = GetDirectoryFromPath(GetTemplatePath()) & "img\#url.id#">--->
										<!--- Rick Added 9/21/06 See if large.jpg exists in current folder --->
										<!--- Use cfdirectory as it returns a date modified file attribute --->
										<!---  <cfdirectory directory="#currentDirectory#" action="list" name="dirQuery" filter="large.jpg" recurse="no">
											<cfif dirQuery.recordcount gt 0>
											<!--- Get Book image height, incase it's oblong --->
										<!--- Formerly: <CFIF FileExists(ExpandPath("/auctions/img/#url.id#/large.jpg")) is "Yes">--->
										<cfset xcatillus = 1>
										<CFIF  qGetAuctionAdmin.ImageQuality gt 0>
											<CFSET xQuality = qGetAuctionAdmin.ImageQuality>
										</CFIF>
										<cfset xImageAddress=ExpandPath("/auctions/img/#url.id#/")>
										<cfset xImage="Large">
										<cfset xImageFormat = "jpg">
										<CFSET xHeight = "300">
										<CFSET xWidth = "300">
										<CFSET xAlt = "#qGetAuctionAdmin.Title#">
										<cfinclude template="testfindnocase.cfm">
										cover
										<cfflush>
										--->
										<!---<!--- Rick added 9/21/06 --->
										<cfset dImageLastModified = CreateODBCDateTime(dirQuery.DateLastModified)>
										<!--- 9/21/06 Rick added ImageLastModified --->
										<!--- If new file has been uploaded or if the db doesn't have image sizes listed --->
										<cfif  (len(trim(qGetAuctionAdmin.ImageLastModified)) is 0 or qGetAuctionAdmin.ImageLastModified neq dirQuery.dateLastModified) or NOT ListFindNoCase(qGetAuctionAdmin.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~") >
											<!---	Formerly	<cfif NOT ListFindNoCase(qGetAuctionAdmin.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")>--->
											<cfinclude template="../templates/imagesizercreate.cfm">
											<!--- 9/21/06 Rick added ImageLastModified Updated --->
											<!--- 9/21/06 Jeff updates once and includes all list sizes in the ImageSizeList here --->
											<!--- 9/22/06 Rick added this back in to update the Image Size List only if the size is not already in the db --->
											<cfquery name="qUpdate"  datasource="photoeyecom">
				Update AuctionAdmin
				Set
				<cfif NOT ListFindNoCase(qGetAuctionAdmin.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")>
					ImageSizeList = '#ListAppend(qGetAuctionAdmin.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")#',
				</cfif>
				<cfif NOT ListFindNoCase(qGetAuctionAdmin.ImageActualSizeList, "#imagecr.height#x#imagecr.width#", "~")>
				ImageActualSizeList = '#ListAppend(qGetAuctionAdmin.ImageActualSizeList, "#imagecr.height#x#imagecr.width#", "~")#',
				</cfif>
				ImageLastModified=#dImageLastModified#
				Where AuctionID = #qGetAuctionAdmin.AuctionID#
			</cfquery>
											<cfset xBookHeight = imagecr.height>
											<cfset xBookWidth = imagecr.width>
											Yes
										<cfelse>
											<cfset xBookPosition = ListFindNoCase(qGetAuctionAdmin.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")>
											<cfset xBookHeight = ListFirst(ListGetAt(qGetAuctionAdmin.ImageActualSizeList, variables.xBookPosition, "~"), "x")>
											<cfset xBookWidth = ListLast(ListGetAt(qGetAuctionAdmin.ImageActualSizeList, variables.xBookPosition, "~"), "x")>
										</cfif>
										<cfset xBookImage = "#xImage#_H#xHeight#xW#xWidth#.#xImageFormat#">
										--->
										<!---<cfelse>
											<cfset xBookHeight = 300>
											</CFIF>--->
										<!--- END of Book Image Creation --->
										<!--- Spine creation and display --->
										<!--- !!!! change back when we go live !!!! --->
										<!---<cfset currentDirectory = GetDirectoryFromPath(GetTemplatePath()) & "img\#url.id#">--->
										<cfset currentDirectory="C:\inetpub\wwwroot\Clients\photoeyecom\html\auctions\img\#url.id#">
										<!--- Use cfdirectory as it returns a date modified file attribute --->
										<cfdirectory directory="#currentDirectory#" action="list" name="dirQuery" filter="spine.jpg" recurse="no">
										<!--- Rick added 9/22/06 --->
										<CFIF dirQuery.recordcount gt 0>
											<!--- Formerly   <CFIF FileExists(ExpandPath("/auctions/img/#url.id#/spine.jpg")) is "Yes">
												--->
											<cfset xcatillus = 1>
											<cfset xImageAddress=ExpandPath("/auctions/img/#url.id#/")>
											<cfset xImageNewAddress="#xImageAddress#">
											<CFSET xHeight = "300">
											<CFSET xWidth = "50">
											<CFSET xImage = "spine">
											<cfset xImageFormat = "jpg">
											<cfset xId="AuctionId">
											<cfset xDbToUpdate="AuctionAdmin">
											<CFSET xAlt = "#qGetAuctionAdmin.Title#">
											<CFSET xQueryImageSizeList = "#qGetAuctionAdmin.ImageSizeList#">
											<CFSET xQueryActualImageSizeList = "#qGetAuctionAdmin.ImageActualSizeList#">
											<!--- If there is no spine, make one --->
											<!--- 9/21/06 Rick added ImageLastModified --->
											<!--- If new file has been uploaded or if the db doesn't have image sizes listed --->
											<!--- There is only one column for ImageLastModified. That means that if any spine was modified but not the cover, there would always be a different date here for one or the other and one image or the other would always be remade. We could have another datemodifed field, but that is not scalable. There needs to be an image database table that includes id, size, actualsize, etc. Or can there be a datetime appended to the Imagesizelist or a datetime appended to a TEXT ImageLastMofified field. Let's explore that last option. What would the
												<cfif  (len(trim(qGetAuctionAdmin.ImageLastModified)) is 0 or qGetAuctionAdmin.ImageLastModified neq dirQuery.dateLastModified) or NOT ListFindNoCase(qGetAuctionAdmin.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~") >
												look if we want to find the lastmodified in a text field? Append the modified date to the 300x300d9/12/2006 8:13:00 PM~ and not have a datelastmodified field.
												<cfif NOT ListFindNoCase(qGetAuctionAdmin.ImageSizeList, "#variables.xheight#x#variables.xwidth#d#dirQuery.dateLastModified#", "~" >
												height and width and datelastmodified string was not found in the list. So Remake it and update the db. That's the tricky part. How do you replace the db entry for just this one size? First look for the beginning of the height and width string. FindNoCase(qGetAuctionAdmin.ImageSizeList, "#variables.xheight#x#variables.xwidth#) If found, this returns the starting point. If not found this returns 0. Now, we've found the starting point, nstart. let's use ReplaceList(string, list1, list2). We'll first store the existing size and datetime. xExistingImageSizeDateTime=left(ImageSizeList, nstart,1). Let's find the ending character of the datetime string. FindNoCase("~", ImageSizeList, nstart). Does this return the position within the string that starts with nstart? or does it return the position relative to the entire ImageSizeList? !!!! To be determined.
												--->
											<!--- Rick added 9/21/06 --->
											<!---	<cfset dImageLastModified = CreateODBCDateTime(dirQuery.DateLastModified)>
												<cfif  (len(trim(qGetAuctionAdmin.ImageLastModified)) is 0 or qGetAuctionAdmin.ImageLastModified neq dirQuery.dateLastModified) or NOT ListFindNoCase(qGetAuctionAdmin.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~") >
												<cfif NOT FileExists(ExpandPath("/auctions/img/#xImage#_H#xHeight#xW#xWidth#.#xImageFormat#")) is "Yes">
												<cfinclude template="../templates/imagesizercreate.cfm">
												</cfif>		--->
											<cfinclude template="/templates/GetImageInfo.cfm">
											<!---#xImage#_H#xHeight#xW#xWidth#.#xImageFormat#--->
											<a href="#xpage3#?id=#url.id#&Spine=1">
												<img src="/auctions/img/#qGetAuctionAdmin.AuctionID#/#xBookImage#" width="#xBookWidth#" height="#xBookHeight#" alt="#xalt#"
												<CFIF qGetAuctionAdmin.SpineBorder is 1>
													border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"
												<CFELSE>
													border="0"
												</CFIF>
												>
											</a>
									</TD>
									<TD ALIGN="CENTER"> </CFIF> <!--- END of Spine ---> <!--- Display Book Image ---> <!---	<CFIF FileExists(ExpandPath("/auctions/img/#url.id#/large.jpg")) is "Yes">---> <cfdirectory directory="#currentDirectory#" action="list" name="dirQuery" filter="large.jpg" recurse="no"> <!--- Rick added 9/22/06 ---> <CFIF dirQuery.recordcount gt 0> <cfset xcatillus = 1> <CFIF  qGetAuctionAdmin.ImageQuality gt 0> <CFSET xQuality = qGetAuctionAdmin.ImageQuality> </CFIF> <cfset xImageAddress=ExpandPath("/auctions/img/#url.id#/")> <cfset xImage="Large"> <cfset xImageFormat = "jpg"> <CFSET xHeight = "300"> <CFSET xWidth = "300"> <cfset xId="AuctionId"> <cfset xDbToUpdate="AuctionAdmin"> <cfset xQueryName="qGetAuctionAdmin"> <CFSET xAlt = "#qGetAuctionAdmin.Title#"> <CFSET xQueryImageSizeList = "#qGetAuctionAdmin.ImageSizeList#"> <CFSET xQueryActualImageSizeList = "#qGetAuctionAdmin.ImageActualSizeList#"> <CFSET xQueryImageSizeListName="qGetAuctionAdmin.ImageSizeList"> <CFSET xQueryActualImageSizeListName="qGetAuctionAdmin.ImageActualSizeList"> <cfinclude template="/templates/GetImageInfo.cfm"> <cfset xcatillus = 1> <a href="#xpage3#?id=#url.id#"><img src="/auctions/img/#qGetAuctionAdmin.AuctionID#/#xBookImage#" width="#xBookWidth#" height="#xBookHeight#" alt="#xalt#" <CFIF qGetAuctionAdmin.CoverBorder is 1>border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"<CFELSE>border="0"</CFIF>></a> </CFIF> <!--- End of Book Image ---> </TD>
								</TR>
								<TR>
									<TD ALIGN="CENTER" VALIGN="TOP">
										<CFIF FileExists(ExpandPath("/auctions/img/#url.id#/spine.jpg")) is "Yes">
											<cfset xcatillus = 1>
											<font color="Black"  size="1">
												<a href="#xpage3#?id=#url.id#&Spine=1">
													+&nbsp;Enlarge
												</a>
											</font>
									</TD>
									<TD ALIGN="CENTER" VALIGN="TOP"> </CFIF> <font color="Black"  size="1"> <a href="#xpage3#?id=#url.id#">+&nbsp;Enlarge</a></font> </TD>
								</TR>
								<TR>
									<CFIF FileExists(ExpandPath("/auctions/img/#url.id#/spine.jpg")) is "Yes">
										<cfset xcatillus = 1>
										<TD>
										</TD>
									</CFIF>
									<TD ALIGN="CENTER">
										<CFSET xFilePath = expandpath("/auctions/img/#url.id#/#xpage4#")>
										<CFIF qGetAuctionAdmin.MoreImages is 1 and FileExists("#xFilePath#")>
											<font color="Black"  size="2">
												<a href="#xpage3#?id=#url.id#&MoreImages=1">
													View More Images
												</a>
											</font>
										</CFIF>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<table width="620" align="center">
					<tr>
						<td valign="bottom" height="50">
							<br>
							<CFIF url.id is 1>
								<font color="Black"  size="2">
									Please note that the above enlarger is a wall mount D2V. No baseboard is included.
									<br>
									Sorry, the photograph in the above image does not come with the sale.
									<br>
									<br>
								</font>
							</CFIF>
							<div align="center">
								<font color="Black"  size="2">
									<CFIF trim(qGetAuctionAdmin.ShippingCost) is '' or trim(qGetAuctionAdmin.ShippingCost) is 0>
										<A HREF="ShippingInfo.cfm">
											Shipping costs
										</A>
										are additional and are based on your chosen
										<BR>
										default shipping method, unless other arrangements are made.
									<CFELSE>
										Shipping charges are not included in the Auction price.
										<br>
										Domestic Shipping: $#trim(NumberFormat(qGetAuctionAdmin.ShippingCost,"99,999"))# &mdash;
										<A HREF="ShippingInfo.cfm">
											Foreign Shipping
										</A>
										: based on weight, country, and shipping method.
									</CFIF>
									<BR>
									<BR>
								</font>
								<font color="Black"  size="2">
									Good Luck Bidding!
								</font>
							</div>
						</td>
					</tr>
				</table>
			</cfoutput>
	</CENTER>
</DIV>
<br> </form>
