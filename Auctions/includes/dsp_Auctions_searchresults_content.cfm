<!--- <div align="center">Our auction search engine is temporarily down for maintenance. <br>We hope to be back up and running on Thursday, June 3rd. <br>Thank you for your patience.</div>
<cfabort> --->

<cfset xpage1="Auction.cfm">

<!--- Carry over the cookie --->
<cfif IsDefined("url.UID")>
	<cfif url.UID>
		<cfset cookie.UserIdNumber = url.UID>
	</cfif>
</cfif>

<cfinclude template="/templates/UserIdentification.cfm">

<cfparam name="form.searchInput" default="">
<cfparam name="url.size" default="1">

<cfif url.Size EQ "2">
	<cfset xFontSize="2">
	<cfset xImageHeight="80">
	<cfset xImageWidth="80">
<cfelse>
	<cfset xFontSize="1">
	<cfset xImageHeight="50">
	<cfset xImageWidth="50">
</cfif>

<div align="center">
<!--- Main Current Auction Grid --->
<br>
<cfoutput>

<cfif len(trim(form.searchInput))>

<!--- <cftry> --->
	
	
	
	<!--- Search Live Auctions --->
	<cfsearch name="liveAuctions" 
		collection="auctionslive5" 
		criteria="#form.searchInput#"
	>	
	
	<!--- Search still available auctions --->
	<cfsearch name="stillAvailableAuctions" 
		collection="auctionsavailable2" 
		criteria="#form.searchInput#"
	>	
	
	<!--- Search closed auctions --->
	<cfsearch name="closedAuctions" 
		collection="auctionsclosed11" 
		criteria="#form.searchInput#"
	>	
	


 <!---	<cfcatch type="any"> 
		<cfmail to="rixon@photoeye.com" from="rixon@photoeye.com" Subject="Auction Collection Disappeared Again!">
			<p>Caught an exception, type = #CFCATCH.TYPE# </p>
		</cfmail>
	</cfcatch>
	
</cftry> --->

	<!--- set records found --->
	<cfset recordsFound = liveAuctions.recordCount + stillAvailableAuctions.recordCount + closedAuctions.recordCount>
	
	<br>
	<p><b>#variables.recordsFound# total search results found for "#form.searchInput#"</b></p>
	
	<!--- Display paging navigation links--->
	<!---<cfinclude template="AvailPostAuctionNav.cfm">--->
	
	<cfif variables.recordsFound>
	
		<!--- Display Live auctions  --->
		<cfif liveAuctions.recordCount>
		
			<!--- Get live auction detail from database --->
			<cfquery name="qGetAuctionAdmin" datasource="photoeyecom">
				SELECT *
				FROM AuctionAdmin
				WHERE AuctionID IN (#valueList(liveAuctions.key)#)
			</cfquery>
		
			<table width="700" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td style="padding-bottom:3px">
					<table height="40" width="700" cellspacing="0" cellpadding="5" align="center" style="border:1px solid ##9496A3">
					<tr><td style="padding-left:20px">The following auction items are currently open for bidding.</td></tr>
					</table>
				</td>
			</tr>	
			<table width = "700" cellspacing="0" cellpadding="5" align="center" style="border:1px solid ##9496A3">
			<tr>
				<td align="center" width="50"><font color="White" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="2"><b>&nbsp;</b></font></td>
				<td style="padding-left:10px"><font color="maroon" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="2"><b>Auction Item</b></font></td>
				<td align="center" width="100"><font color="maroon" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="2"><b>High Bid</b></font></td>
				<td align="center" width="25"><font color="maroon" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="2"><b>Bids</b></font></td>
				<td align="right" width="100"><font color="maroon" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="2"><b>Time Left&nbsp;&nbsp;</b></font></td>
			</tr>
			</table>
			
			<cfset LineCounter = 0> 
			<cfloop query="qGetAuctionAdmin">
			
				<!--- Get Auction Time Remaining --->
				<cfinclude template="/auctions/AuctionTime.cfm">
			
				<cfquery name="qGetAuctionBids" datasource="photoeyecom">
					SELECT Max(bid) as Bid, Count(autoid) as Count 
					FROM AuctionBids 
					WHERE auctionid = #auctionid#
				</cfquery>
			
				<table width="700" border="0" cellspacing="0" cellpadding="5" align="center">
					
				<cfif LineCounter>
					<tr bgcolor="white">
				<cfelse>
					<tr bgcolor="##F4F1E1">
				</cfif> 
				
				<td align="center" height="50" width="50">
					
<!---			<cfset currentDirectory = GetDirectoryFromPath(GetTemplatePath()) & "img\#auctionid#">--->
            <cfset currentDirectory = expandPath("..\..\..\..\..\auctions\img\#auctionid#")>
			
				<cfdirectory directory="#currentDirectory#" action="list" name="dirQuery" filter="large.jpg" recurse="no">
			
				<CFIF dirQuery.recordcount gt 0>
					<cfset xcatillus = 1>
					<cfset url.id 	="#auctionid#">
					<cfset xImageAddress=ExpandPath("/auctions/img/#auctionid#/")>
					<cfset xImageNewAddress="#xImageAddress#">				
<!---					<cfset xImageNewAddress=ExpandPath("../auctions/img/#url.id#/")>--->
					<CFSET xHeight = "50">	
					<CFSET xWidth = "50">
					<CFSET xImage = "large">
					<cfset xImageFormat = "jpg">
					<cfset xId="AuctionId">
					<cfset xDbToUpdate="AuctionAdmin">
					<cfset xQueryName="qGetAuctionAdmin">
					<cfset xAlt = "Go to this Auction">	
					<CFSET xQueryImageSizeList = "#ImageSizeList#">
					<CFSET xQueryActualImageSizeList = "#ImageActualSizeList#">				
					<cfinclude template="/templates/GetImageInfo.cfm">
			
					<a href="#xpage1#?id=#auctionid#">
					<img src="/auctions/img/#qGetAuctionAdmin.AuctionID#/#xBookImage#" width="#xBookWidth#" height="#xBookHeight#" alt="#xAlt#" <CFIF qGetAuctionAdmin.SpineBorder is 1>border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"<CFELSE>border="0"</CFIF>></a>
				</cfif>
					
				<!---	<cfif FileExists(ExpandPath("../auctions/img/#AuctionID#/large.jpg")) EQ "Yes">
						<cfset xcatillus = 1>
						<!--- Set defaults for all images --->
						<cfset xPath = "../auctions/img/#AuctionID#">
						<cfset xHeight = "50">	
						<cfset xWidth = "50">
						<cfset xAlt = "Go to this Auction">		
						<!--- xCache is set in Application --->
						<cfset xImage = "large.jpg">
						<cfinclude template="../Templates/ImageSizer.cfm">
						<a href="../auctions/Auction.cfm?id=#auctionid#"><img src="#xRootCache#/#imagecr.filename#" width="#imagecr.width#" height="#imagecr.height#" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
					</cfif>--->
				</td>
				<td style="padding-left:10px">
					<font color="Black" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="2">
					<b><a href="Auction.cfm?id=#qGetAuctionAdmin.auctionid#">#Title#</a></b></font>
				</td>
				<td align="center" width="110">
					<font color="Black" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="2">
					<cfif qGetAuctionAdmin.PostAuctionSale EQ 0 AND EndAnnounced> 
						<a href="mailto:auctions@photoeye.com?Subject=Post Auction Inquiry for #qGetAuctionAdmin.Title#">Still Available - Inquire</a>
					<cfelseif qGetAuctionBids.count is 0>-
					<cfelse>
						<b>$#Trim(NumberFormat(qGetAuctionBids.Bid,"999,999"))#</b></cfif>
					</font>
				</td>
				<td align="center" width="25">
					<font color="Black" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="2">
					<b>#qGetAuctionBids.count#</b></font>
				</td>
				<td align="right" width="100">
					<cfif (qGetAuctionAdmin.PostAuctionSale EQ 0 AND EndAnnounced)> 
						<font color="Black" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="2">Auction Ended</font>
					<cfelse>
						<table cellpadding="3" cellspacing="3" border="0">
						<tr>
						<cfif xdays + xhours + xminutes gt 0>
							<td align="right" width="30">
								<font color="Black" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="2">
								<cfif xdays gt 0>
									#xdays#d
								</cfif>
								</font>
							</td>
							<td align="right">
								<font color="Black" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="2">
								<cfif xhours gt 0>
									#xhours#h
								<cfelseif xdays gt 0>
									0h
								</cfif>
								</font>
							</td>
							<td align="right">
								<font color="Black" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="2">	
								<cfif xminutes gt 0>
									#xminutes#m
								<cfelse>
									0m
								</cfif>
								</font>
							</td>
						<cfelse>
							<td align="right">
								<font color="Black" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="2">#xseconds# sec</font>
							</td>
						</cfif>
						</tr>
						</table>
					</cfif>
					</td>
				</tr>
				</table>
			
				<cfif NOT LineCounter>
					<cfset LineCounter = 1>
				<cfelse>
					<cfset LineCounter = 0>
				</cfif>
			
			</cfloop> <!--- end loop (query="qGetAuctionAdmin") --->
		
			<br><br>
		</cfif> <!--- end if (liveAuctions.recordCount)--->
		
		<!--- Display "Still Available Auctions" auctions  --->
		<cfif stillAvailableAuctions.recordCount>
		
			<!--- Get "still available" auction detail from database --->
			<cfquery name="qGetAuctionAdmin" datasource="photoeyecom">
				SELECT *
				FROM AuctionAdmin
				WHERE AuctionID IN (#valueList(stillAvailableAuctions.key)#)
			</cfquery>
			
			
			<table width="700" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td style="padding-bottom:3px">
					<table height="40" width="700" cellspacing="0" cellpadding="5" align="center" style="border:1px solid ##9496A3">
					<tr>
						<td style="padding-left:20px">
							Auctions for the following items have ended; they may be purchased for their reserve prices. <br>To inquire about the reserve price, click 'Still Available - Inquire'.
						</td>
					</tr>
					</table>
				</td>
			</tr>
			</table>
			<table width="700" cellspacing="0" cellpadding="5" align="center" style="border:1px solid ##9496A3">
			<tr>
				<td align="center" width="55">&nbsp;</td>
				<td><font color="Maroon" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="2"><b>Auction Item</b></font></td>
				<td align="center" width="100"><font color="Maroon" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="2"><b>&nbsp;</b></font></td>
				<td align="center" width="25"><font color="Maroon" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="2"><b>Bids</b></font></td>
				<td align="right" width="100"><font color="Maroon" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="2"><b>&nbsp;</b></font></td>
			</tr>
			</table>
			
			<cfset LineCounter = 0> 
			<cfloop query="qGetAuctionAdmin">
			
				<!--- Auction Time Remaining --->
				<cfinclude template="/auctions/AuctionTime.cfm">
			
				<cfquery name="qGetAuctionBids" datasource="photoeyecom">
					SELECT Max(bid) AS Bid, Count(autoid) AS Count 
					FROM AuctionBids 
					WHERE auctionid = #qGetAuctionAdmin.auctionid#
				</cfquery>
			
				<table width="700" border="0" cellspacing="0" cellpadding="5" align="center">
					
				<cfif LineCounter>
					<tr bgcolor="white">
				<cfelse>
					<tr bgcolor="##F4F1E1">
				</cfif> 
				
				<td align="center" height="50" width="50">
<!---			<cfset currentDirectory = GetDirectoryFromPath(GetTemplatePath()) & "img\#auctionid#">--->
            <cfset currentDirectory = expandPath("..\..\..\..\..\auctions\img\#auctionid#")>
							
				<cfdirectory directory="#currentDirectory#" action="list" name="dirQuery" filter="large.jpg" recurse="no">
			
				<CFIF dirQuery.recordcount gt 0>
					<cfset xcatillus = 1>
					<cfset url.id 	="#auctionid#">
					<cfset xImageAddress=ExpandPath("/auctions/img/#auctionid#/")>
					<cfset xImageNewAddress="#xImageAddress#">				
<!---					<cfset xImageNewAddress=ExpandPath("../auctions/img/#url.id#/")>--->
					<CFSET xHeight = "50">	
					<CFSET xWidth = "50">
					<CFSET xImage = "large">
					<cfset xImageFormat = "jpg">
					<cfset xId="AuctionId">
					<cfset xDbToUpdate="AuctionAdmin">
					<cfset xQueryName="qGetAuctionAdmin">
					<cfset xAlt = "Go to this Auction">	
					<CFSET xQueryImageSizeList = "#ImageSizeList#">
					<CFSET xQueryActualImageSizeList = "#ImageActualSizeList#">				
					<cfinclude template="/templates/GetImageInfo.cfm">
			
					<a href="#xpage1#?id=#auctionid#">
					<img src="/auctions/img/#qGetAuctionAdmin.AuctionID#/#xBookImage#" width="#xBookWidth#" height="#xBookHeight#" alt="#xAlt#" <CFIF qGetAuctionAdmin.SpineBorder is 1>border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"<CFELSE>border="0"</CFIF>></a>
				</cfif>				
				
	
				<!---  <cfif FileExists(ExpandPath("../auctions/img/#AuctionID#/large.jpg")) is "Yes">
					  	<cfset xcatillus = 1>
						<!--- Set defaults for all images --->
						<cfset xPath = "../auctions/img/#AuctionID#">
						<cfset xHeight = "50">	
						<cfset xWidth = "50">
						<cfset xAlt = "Go to this Auction">		
						<!--- xCache is set in Application --->
						<cfset xImage = "large.jpg">
						<cfinclude template="../Templates/ImageSizer.cfm">
						<a href="../auctions/Auction.cfm?id=#auctionid#"><img src="#xRootCache#/#imagecr.filename#" width="#imagecr.width#" height="#imagecr.height#" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
					</cfif>--->
				</td>
				<td style="padding-left:10px">
					<font color="Black" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="2">
					<b><a href="Auction.cfm?id=#qGetAuctionAdmin.auctionid#">#Title#</a></b></font>
				</td>
				<td align="center" width="135" nowrap>
					<font color="Black" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="2">
					<cfif qGetAuctionAdmin.PostAuctionSale EQ 0 AND EndAnnounced> 
						<a href="mailto:auctions@photoeye.com?Subject=Post Auction Inquiry for #qGetAuctionAdmin.Title#">Still Available - Inquire</A>
					<cfelseif qGetAuctionBids.count is 0>-
					<cfelse>
						<b>$#Trim(NumberFormat(qGetAuctionBids.Bid,"999,999"))#</b>
					</cfif>
					</font>
				</td>
				<td align="center" width="25">
					<font color="Black" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="2">
					<b>#qGetAuctionBids.count#</b></font>
				</td>
				<td align="right" width="100">
					<cfif (qGetAuctionAdmin.PostAuctionSale EQ 0 and EndAnnounced)> 
						<font color="Black" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="2">Auction Ended</font>
					<cfelse>
						<table cellpadding="3" cellspacing="3" border="0"><tr>
						<cfif xdays + xhours + xminutes gt 0>
							<td align="right" width="30"><font color="Black" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="2">
							<cfif xdays gt 0>
								#xdays#d
								</font>
							</cfif>
							</td>
							<td align="right"><font color="Black" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="2">
							<cfif xhours gt 0>
								#xhours#h
							<cfelseIF xdays gt 0>
								0h
							</cfif>
							</font></td>
							<td align="right"><font color="Black" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="2">	
							<cfif xminutes gt 0>
								#xminutes#m
							<cfelse>
								0m
							</cfif>
							</font></td>
						<cfelse>
							<td align="right">
								<font color="Black" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="2">#xseconds# sec</font>
							</td>
						</cfif> <!--- end if ((qGetAuctionAdmin.PostAuctionSale EQ 0 and EndAnnounced)) --->
						</tr>
						</table>
					</cfif>
					</td>
				</tr>
				</table>
				
				<cfif NOT LineCounter>
			 		<cfset LineCounter = 1>
				<cfelse>
					<cfset LineCounter = 0>
				</cfif>
				
			</cfloop>
		
			<br><br>
		</cfif> <!--- end if (stillAvailableAuctions.recordCount) --->
		
		
		<!--- Display closed auctions  --->
		<cfif closedAuctions.recordCount>
		
			<!--- Get "still available" auction detail from database --->
			<cfquery name="qGetAuctionAdmin" datasource="photoeyecom">
				SELECT *
				FROM AuctionAdmin
				WHERE AuctionID IN (#valueList(closedAuctions.key)#)
				ORDER BY TimeEnd DESC
			</cfquery>
			
			
			<table width="700" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td style="padding-bottom:3px">
					<table height="40" width="700" cellspacing="0" cellpadding="5" align="center" style="border:1px solid ##9496A3">
					<tr><td style="padding-left:20px">The following Auctions have closed. All lots have sold.</td></tr>
					</table>
				</td>
			</tr>
			</table>	
		
			<table width = "700" cellspacing="0" width="100%" style="border:1px solid ##9496A3">
			<tr>
				<td align="center" width="65">&nbsp;</td>
				<td><font color="maroon"><b>Past Auctions</b></font></td>
				<td align="center" width="5" bordercolor="white">&nbsp;</td>
				<td align="center" width="75">&nbsp;&nbsp;<font color="maroon"><b>Winning&nbsp;Bid</b></font>&nbsp;&nbsp;</td>
				<td align="center" width="5" bordercolor="white">&nbsp;</td>
				<td align="center" width="30">&nbsp;<font color="maroon"><b>Bids</b></font>&nbsp;</td>
				<td align="center" width="5" bordercolor="white">&nbsp;</td>
				<td align="center" width="100"><font color="maroon"><b>Ended On</b></font></td>
			</tr>
			</table>
		
			<cfset LineCounter = 0> 
			<cfloop query="qGetAuctionAdmin">
			
				<!--- Auction Time Remaining --->
				<cfinclude template="/auctions/AuctionTime.cfm" />
				
				<cfif xAuctionEnded>
				
					<cfquery name="qGetAuctionBids" datasource="photoeyecom">
						SELECT Max(bid) as Bid, Count(autoid) as Count 
						FROM AuctionBids 
						WHERE auctionid = #auctionid#
					</cfquery>
					
					<table width="700" border="0" cellspacing="0" cellpadding="5" align="center">
		
						<cfif LineCounter>
							<tr bgcolor="##F4F1E1">
						<cfelse>
							<tr bgcolor="white">
						</cfif> 
				
						<!--- <cfif BidCounter is 0> --->
						<td align="center" height="50" width="50">
						
						<!---			<cfset currentDirectory = GetDirectoryFromPath(GetTemplatePath()) & "img\#auctionid#">--->
            <cfset currentDirectory = expandPath("..\..\..\..\..\auctions\img\#auctionid#")>
						
						<cfdirectory directory="#currentDirectory#" action="list" name="dirQuery" filter="large.jpg" recurse="no">
			
						<CFIF dirQuery.recordcount gt 0>
							<cfset xcatillus = 1>
							<cfset url.id 	="#auctionid#">
							<cfset xImageAddress=ExpandPath("/auctions/img/#auctionid#/")>
							<cfset xImageNewAddress="#xImageAddress#">				
		<!---					<cfset xImageNewAddress=ExpandPath("../auctions/img/#url.id#/")>--->
							<CFSET xHeight = "50">	
							<CFSET xWidth = "50">
							<CFSET xImage = "large">
							<cfset xImageFormat = "jpg">
							<cfset xId="AuctionId">
							<cfset xDbToUpdate="AuctionAdmin">
							<cfset xQueryName="qGetAuctionAdmin">
							<cfset xAlt = "Go to this Auction">	
							<CFSET xQueryImageSizeList = "#ImageSizeList#">
							<CFSET xQueryActualImageSizeList = "#ImageActualSizeList#">				
							<cfinclude template="/templates/GetImageInfo.cfm">
					
							<a href="#xpage1#?id=#auctionid#">
							<img src="/auctions/img/#qGetAuctionAdmin.AuctionID#/#xBookImage#" width="#xBookWidth#" height="#xBookHeight#" alt="#xAlt#" <CFIF qGetAuctionAdmin.SpineBorder is 1>border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"<CFELSE>border="0"</CFIF>></a>
						</cfif>
				
							<!---<cfif FileExists(ExpandPath("../auctions/img/#AuctionID#/large.jpg")) is "Yes">
								<cfset xcatillus = 1>
								<!--- Set defaults for all images --->
								<cfset xPath = "../auctions/img/#AuctionID#">
								<cfset xHeight = "50">	
								<cfset xWidth = "50">
								<cfset xAlt = "Go to this Auction">		
								<!--- xCache is set in Application --->
								<cfset xImage = "large.jpg">
								<cfinclude template="../Templates/ImageSizer.cfm">
								<a href="../auctions/Auction.cfm?id=#auctionid#"><img src="#xRootCache#/#imagecr.filename#" width="#imagecr.width#" height="#imagecr.height#" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
							</cfif>--->
						</td>
						<td style="padding-left:10px">
							<font color="Black" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="2"><b><a href="Auction.cfm?id=#qGetAuctionAdmin.auctionid#">#Title#</a></b></font>
						</td>
						<td align="center" width="110">
							<font color="Black" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="2">
							<cfif qGetAuctionAdmin.PostAuctionSale gt 0> 
								<b>$#Trim(NumberFormat(qGetAuctionAdmin.PostAuctionSale,"999,999"))#</b><br><font size="1"><a href="PostAuctionSaleInfo.cfm">Post-Auction Sale</a></font>
							<cfelseif qGetAuctionBids.count is 0 or qGetAuctionBids.Bid lt qGetAuctionAdmin.Reserve>
							<a href="mailto:auctions@photoeye.com?Subject=Post Auction Inquiry for #qGetAuctionAdmin.Title#">Still Available - Inquire</a>
							<cfelse>
							<b>$#Trim(NumberFormat(qGetAuctionBids.Bid,"999,999"))#</b></cfif>
							</font>
						</td>
						<td align="center" width="25">
							<font color="Black" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="2"><b>#qGetAuctionBids.count#</b></font>
						</td>
						<td align="center" width="100">
							<table cellpadding="3" cellspacing="3" border="0">
							<tr>
								<td align="right">
									<font color="Black" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="2">#DateFormat(qGetAuctionAdmin.TimeEnd, "m.dd.yyyy")#</font>
								</td>
							</tr>
							</table>
						</td>
						</tr>
					</table>
					<cfif NOT LineCounter>
				 		<cfset LineCounter = 1>
					<cfelse>
						<cfset LineCounter = 0>
					</cfif>
					
				</cfif> <!--- end if (xAuctionEnded)--->
			
			</cfloop> <!--- query="qGetAuctionAdmin"--->	
		
		</cfif> <!--- end if (closedAuctions.recordCount) --->
	
	</cfif> <!--- end if (variables.recordsFound)>--->

	<!--- Display paging navigation links--->
	<cfset dsp = "Bottom">
	<!---<cfinclude template="AvailPostAuctionNav.cfm">--->
	
<cfelse>

	<br>
	<p><b>Please enter keyword(s) to search for auction items.</b></p>

</cfif>
	

</cfoutput>
</div>

  
