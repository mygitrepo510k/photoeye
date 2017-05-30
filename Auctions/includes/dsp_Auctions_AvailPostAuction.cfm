<cfset xpage1="citation.cfm">

<!--- mmafc: 2005.02.25 --->
<!--- Carry over the cookie --->
<cfif IsDefined("url.UID")>
	<cfif url.UID>
		<cfset cookie.UserIdNumber = url.UID>
	</cfif>
</cfif>

<cfinclude template="/templates/UserIdentification.cfm">

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

<!--- Query for All items available for Post-Auction Sale--->
<cfquery name="qGetAuctionAdmin" datasource="photoeyecom" cachedWithin="#createTimeSpan(0,0,10,0)#">
	SELECT AuctionID, SpineBorder, ImageSizeList, ImageActualSizeList, Title, TimeEnd, (datediff(day, TimeEnd, getdate())) AS DaysEnded, EndAnnounced, PostAuctionSale, Reserve, Photobook, Openbook, FotografiaPublica, Book101Books
	FROM AuctionAdmin a
	WHERE publish = 1 
	AND ((a.reserve >
	(SELECT CASE WHEN MAX(b.bid) > 0 THEN MAX(b.bid) ELSE 0 END AS bid 
	 FROM AuctionBids b
	 WHERE b.AuctionID = a.AuctionID) 
	AND EndAnnounced = 1 
	AND PostAuctionSale = 0)) 
	AND TimeEnd > #DateAdd("m", -1, Now())#
	ORDER BY EndAnnounced, TimeEnd DESC
</cfquery>



<div align="center">
<!--- Main Current Auction Grid --->
<br>
<cfoutput>
<cfset xSubtitle = "Items Available for Post-Auction Sale">
<cfinclude template="/templates/title.cfm">

#xHTMLTitle#
<br>

<!--- Display paging navigation links--->
<cfinclude template="/auctions/AvailPostAuctionNav.cfm">

<table width="700" cellpadding="0" cellspacing="0" border="0">
<tr>
	<td style="padding-bottom:3px; padding-top:10px;">
		<table height="40" width="700" border="1" cellspacing="0" cellpadding="5" align="center" BORDERCOLOR="WHITE">
		<tr bordercolor="maroon">
			<td align="center">Bidding for the following items has ended; they can now be purchased at the reserve prices shown. <br />Click 'Inquire' if interested</td>
		</tr>
		</table>
	</td>
</tr>
</table>

<!--- <table width = "780" border="1" bordercolor="##800000" cellspacing="0" cellpadding="5" align="center">
<tr bordercolor="White">
	<!--- <td align="center" width="50">&nbsp;<font color="White" face=""Verdana, Arial, Helvetica, sans-serifVerdana, Arial, Helvetica, sans-serif" size="2"><b></b></font></td>
	 --->
	<td align="center" colspan="2"><font color="Maroon" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Title of Item</b></font><!---<input name="" type="button" onclick="javascript:window.location.href='../auctions/auctionfrontpage.cfm'" value="Refresh Bids / Clock" style="FONT-FAMILY: Arial, Helvetica, sans-serif;FONT-SIZE: 10px">---></td>
	<!--- <td align="center" width="100"><font color="Maroon" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>&nbsp;</b></font></td> --->
	<!---<td align="center" width="25"><font color="Maroon" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>&nbsp;</b></font></td>--->
	<td align="right" width="90"><font color="Maroon" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>&nbsp;</b></font></td>
	<td align="center" width="90"><font color="maroon" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Reference <a href="reference.cfm">[?]</a></b></font></td>
	
</tr>
</table> --->

<cfset LineCounter = 0> 
<cfloop query="qGetAuctionAdmin" startrow="#url.st#" endrow="#variables.endRow#">

	<!--- Auction Time Remaining --->
	<cfinclude template="/auctions/AuctionTime.cfm">

	<cfquery name="qGetAuctionBids" datasource="photoeyecom">
		SELECT Max(bid) AS Bid, Count(autoid) AS Count 
		FROM AuctionBids 
		WHERE auctionid = #auctionid#
	</cfquery>

	<table width="750" border="0" cellspacing="0" cellpadding="5" align="center">
		
	<cfif LineCounter>
		<tr bgcolor="##F4F1E1">
	<cfelse>
		<tr bgcolor="white">
	</cfif> 
	
	<td align="center" height="50" width="50">

	 <cfset currentDirectory = expandPath("\auctions\img\#auctionid#")>	
	<cfdirectory directory="#currentDirectory#" action="list" name="dirQuery" filter="large.jpg" recurse="no">

	<CFIF dirQuery.recordcount gt 0>
		<cfset xcatillus = 1>
		<cfset url.id 	="#auctionid#">
		<cfset xImageAddress=ExpandPath("/auctions/img/#auctionid#/")>
		<cfset xImageNewAddress="#xImageAddress#">
	
<!---				<cfset xImageNewAddress=ExpandPath("../auctions/img/#url.id#/")>--->
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
			
			
	 <!--- <cfif FileExists(ExpandPath("../auctions/img/#AuctionID#/large.jpg")) is "Yes">
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
	<td align="center">
		<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
		<b><a href="citation.cfm?id=#qGetAuctionAdmin.auctionid#">#Title#</a></b></font>
	</td>
	<td align="center" width="110">
		<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
		<cfif qGetAuctionAdmin.PostAuctionSale EQ 0 AND EndAnnounced> 
			<a href="mailto:auctions@photoeye.com?Subject=Post Auction Inquiry for #qGetAuctionAdmin.Title#">Inquire</A>
		<cfelseif qGetAuctionBids.count is 0>-
		<cfelse>
			<b>$#Trim(NumberFormat(qGetAuctionBids.Bid,"999,999"))#</b>
		</cfif>
		</font>
	</td>
	<td align="center" width="25">
		<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
		<!--- <b>#qGetAuctionBids.count#</b> --->	</font>
	</td>
	<td align="right" width="100">
		<cfif (qGetAuctionAdmin.PostAuctionSale EQ 0 and EndAnnounced)> 
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">$#Reserve#</font> <!--- Auction Ended --->
			<CFSET xreference_qty = 0>
						<td align="left" width="80">
							<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">

							<CFIF IsDefined("photobook")>
								<cfif photobook is 1> 
									<cfset catalog="PI146">
									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<cfset xPath = "/img/bigillus">
									<cfset xHeight = "25">	
									<cfset xWidth = "25">
									<cfset xAlt = "The Photo Book">		
									<cfset xImage = "pi146b.jpg">
									<cfinclude template="/templates/CreateImageFolders.cfm">
									<a href="../bookstore/citation.cfm?Catalog=PI146"><img src="#xImagePath#/PI146_H25xW25.jpg" width="21" height="25" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
									</cfif>	
								</CFIF>					
							
<!---							<CFIF IsDefined("photobook")>
								<cfif photobook is 1> 
									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<!--- Set defaults for all images --->
									<cfset xPath = "../img/bigillus">
									<cfset xHeight = "25">	
									<cfset xWidth = "25">
									<cfset xAlt = "The Photo Book">		
									<!--- xCache is set in Application --->
									<cfset xImage = "pi146b.jpg">
									<cfinclude template="../Templates/ImageSizer.cfm">
									<a href="../templates/mShowDetailsbycat.cfm?Catalog=PI146"><img src="#xRootCache#/#imagecr.filename#" width="#imagecr.width#" height="#imagecr.height#" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
								</cfif>
							</CFIF>--->
							

							<CFIF IsDefined("Book101Books")>
								<cfif Book101Books is 1>
									<cfset catalog="PK676">
									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<cfset xPath = "/img/bigillus">
									<cfset xHeight = "25">	
									<cfset xWidth = "25">
									<cfset xAlt = "The Book of 101 Books">		
									<cfset xImage = "pk676b.jpg">																						                                    <cfinclude template="/templates/CreateImageFolders.cfm">												
									<a href="../bookstore/citation.cfm?Catalog=PK676"><img src="#xImagePath#/PK676_H25xW25.jpg" width="21" height="25" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
								</cfif>
							</CFIF>
															
<!---							<CFIF IsDefined("Book101Books")>
								<cfif Book101Books is 1>
									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<!--- Set defaults for all images --->
									<cfset xPath = "../img/bigillus">
									<cfset xHeight = "25">	
									<cfset xWidth = "25">
									<cfset xAlt = "The Book of 101 Books">		
									<!--- xCache is set in Application --->
									<cfset xImage = "pk676b.jpg">
									<cfinclude template="../Templates/ImageSizer.cfm">
									<a href="../templates/mShowDetailsbycat.cfm?Catalog=PK676"><img src="#xRootCache#/#imagecr.filename#" width="#imagecr.width#" height="#imagecr.height#" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
								</cfif>
							</cfif>--->
							
							<CFIF IsDefined("OpenBook")>
								<cfif OpenBook is 1>
									<cfset catalog="ZC553">
									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<cfset xPath = "../img/bigillus">
									<cfset xHeight = "25">	
									<cfset xWidth = "25">
									<cfset xAlt = "The Open Book">		
									<cfset xImage = "zc553b.jpg">
									<cfinclude template="/templates/CreateImageFolders.cfm">
									<a href="../bookstore/citation.cfm?Catalog=zc553"><img src="#xImagePath#/ZC553_H25xW25.jpg" width="21" height="25" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>							
								</cfif>
							</CFIF>
							
<!---							<CFIF IsDefined("OpenBook")>
								<cfif OpenBook is 1>
									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<!--- Set defaults for all images --->
									<cfset xPath = "../img/bigillus">
									<cfset xHeight = "25">	
									<cfset xWidth = "25">
									<cfset xAlt = "The Photo Book">		
									<!--- xCache is set in Application --->
									<cfset xImage = "zc553b.jpg">
									<cfinclude template="../Templates/ImageSizer.cfm">
									<a href="../templates/mShowDetailsbycat.cfm?Catalog=ZC553"><img src="#xRootCache#/#imagecr.filename#" width="#imagecr.width#" height="#imagecr.height#" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
								
								</cfif>
							</cfif>--->

								<CFIF IsDefined("FotografiaPublica")>
								<!--- Make sure that the qty of 3 hasn't been reached --->
	
									<cfif FotografiaPublica is 1 and  xreference_qty LTE 2>
										<cfset catalog="ZB448">
										<CFSET xreference_qty = xreference_qty+1>
										<cfset xcatillus = 1>
										<cfset xPath = "/img/bigillus">
										<cfset xHeight = "25">	
										<cfset xWidth = "25">
										<cfset xAlt = "Fotografia Publica">		
										<cfset xImage = "zb448b.jpg">
										<cfinclude template="/templates/CreateImageFolders.cfm">
										<a href="../bookstore/citation.cfm?Catalog=zb448"><img src="#xImagePath#/ZB448_H25xW25.jpg" width="21" height="25" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
									</cfif>	
								</CFIF>	
															
<!---								<CFIF IsDefined("FotografiaPublica")>
								<!--- Make sure that the qty of 3 hasn't been reached --->
								<cfif FotografiaPublica is 1 and  xreference_qty LTE 2>
									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<!--- Set defaults for all images --->
									<cfset xPath = "../img/bigillus">
									<cfset xHeight = "25">	
									<cfset xWidth = "25">
									<cfset xAlt = "Fotografia Publica">		
									<!--- xCache is set in Application --->
									<cfset xImage = "zb448b.jpg">
									<cfinclude template="../Templates/ImageSizer.cfm">
									<a href="../templates/mShowDetailsbycat.cfm?Catalog=ZB448"><img src="#xRootCache#/#imagecr.filename#" width="#imagecr.width#" height="#imagecr.height#" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
								</cfif>
							</cfif>--->
							</font>
				</td>
				
		<cfelse>
			<table cellpadding="3" cellspacing="3" border="0"><tr>
			<cfif xdays + xhours + xminutes gt 0>
				<td align="right" width="30"><font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
				<cfif xdays gt 0>
					#xdays#d
					</font>
				</cfif>
				</td>
				<td align="right"><font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
				<cfif xhours gt 0>
					#xhours#h
				<cfelseIF xdays gt 0>
					0h
				</cfif>
				</font></td>
				<td align="right"><font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">	
				<cfif xminutes gt 0>
					#xminutes#m
				<cfelse>
					0m
				</cfif>
				</td>
				<CFSET xreference_qty = 0>
						<td align="left" width="80">
							<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
							<CFIF IsDefined("photobook")>
								<cfif photobook is 1> 
									<cfset catalog="PI146">
									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<cfset xPath = "/img/bigillus">
									<cfset xHeight = "25">	
									<cfset xWidth = "25">
									<cfset xAlt = "The Photo Book">		
									<cfset xImage = "pi146b.jpg">
									<cfinclude template="/templates/CreateImageFolders.cfm">
									<a href="../bookstore/citation.cfm?Catalog=PI146"><img src="#xImagePath#/PI146_H25xW25.jpg" width="21" height="25" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
									</cfif>	
								</CFIF>					
							
<!---							<CFIF IsDefined("photobook")>
								<cfif photobook is 1> 
									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<!--- Set defaults for all images --->
									<cfset xPath = "../img/bigillus">
									<cfset xHeight = "25">	
									<cfset xWidth = "25">
									<cfset xAlt = "The Photo Book">		
									<!--- xCache is set in Application --->
									<cfset xImage = "pi146b.jpg">
									<cfinclude template="../Templates/ImageSizer.cfm">
									<a href="../templates/mShowDetailsbycat.cfm?Catalog=PI146"><img src="#xRootCache#/#imagecr.filename#" width="#imagecr.width#" height="#imagecr.height#" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
								</cfif>
							</CFIF>--->
							

							<CFIF IsDefined("Book101Books")>
								<cfif Book101Books is 1>
									<cfset catalog="PK676">
									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<cfset xPath = "/img/bigillus">
									<cfset xHeight = "25">	
									<cfset xWidth = "25">
									<cfset xAlt = "The Book of 101 Books">		
									<cfset xImage = "pk676b.jpg">																						                                    <cfinclude template="/templates/CreateImageFolders.cfm">												
									<a href="../bookstore/citation.cfm?Catalog=PK676"><img src="#xImagePath#/PK676_H25xW25.jpg" width="21" height="25" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
								</cfif>
							</CFIF>
															
<!---							<CFIF IsDefined("Book101Books")>
								<cfif Book101Books is 1>
									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<!--- Set defaults for all images --->
									<cfset xPath = "../img/bigillus">
									<cfset xHeight = "25">	
									<cfset xWidth = "25">
									<cfset xAlt = "The Book of 101 Books">		
									<!--- xCache is set in Application --->
									<cfset xImage = "pk676b.jpg">
									<cfinclude template="../Templates/ImageSizer.cfm">
									<a href="../templates/mShowDetailsbycat.cfm?Catalog=PK676"><img src="#xRootCache#/#imagecr.filename#" width="#imagecr.width#" height="#imagecr.height#" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
								</cfif>
							</cfif>--->
							
							<CFIF IsDefined("OpenBook")>
								<cfif OpenBook is 1>
									<cfset catalog="ZC553">
									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<cfset xPath = "/img/bigillus">
									<cfset xHeight = "25">	
									<cfset xWidth = "25">
									<cfset xAlt = "The Open Book">		
									<cfset xImage = "zc553b.jpg">
									<cfinclude template="/templates/CreateImageFolders.cfm">
									<a href="../bookstore/citation.cfm?Catalog=zc553"><img src="#xImagePath#/ZC553_H25xW25.jpg" width="21" height="25" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>							
								</cfif>
							</CFIF>
							
<!---							<CFIF IsDefined("OpenBook")>
								<cfif OpenBook is 1>
									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<!--- Set defaults for all images --->
									<cfset xPath = "../img/bigillus">
									<cfset xHeight = "25">	
									<cfset xWidth = "25">
									<cfset xAlt = "The Photo Book">		
									<!--- xCache is set in Application --->
									<cfset xImage = "zc553b.jpg">
									<cfinclude template="../Templates/ImageSizer.cfm">
									<a href="../templates/mShowDetailsbycat.cfm?Catalog=ZC553"><img src="#xRootCache#/#imagecr.filename#" width="#imagecr.width#" height="#imagecr.height#" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
								
								</cfif>
							</cfif>--->

								<CFIF IsDefined("FotografiaPublica")>
								<!--- Make sure that the qty of 3 hasn't been reached --->
	
									<cfif FotografiaPublica is 1 and  xreference_qty LTE 2>
										<cfset catalog="ZB448">
										<CFSET xreference_qty = xreference_qty+1>
										<cfset xcatillus = 1>
										<cfset xPath = "/img/bigillus">
										<cfset xHeight = "25">	
										<cfset xWidth = "25">
										<cfset xAlt = "Fotografia Publica">		
										<cfset xImage = "zb448b.jpg">
										<cfinclude template="/templates/CreateImageFolders.cfm">
										<a href="../bookstore/citation.cfm?Catalog=zb448"><img src="#xImagePath#/ZB448_H25xW25.jpg" width="21" height="25" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
									</cfif>	
								</CFIF>	
							</font>
				</td>
			<cfelse>
				<td align="right">
					<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">#xseconds# sec</font>
				</td>
				
				<CFSET xreference_qty = 0>
						<td align="left" width="80">
							<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
							<CFIF IsDefined("photobook")>
								<cfif photobook is 1> 
									<cfset catalog="PI146">
									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<cfset xPath = "/img/bigillus">
									<cfset xHeight = "25">	
									<cfset xWidth = "25">
									<cfset xAlt = "The Photo Book">		
									<cfset xImage = "pi146b.jpg">
									<cfinclude template="/templates/CreateImageFolders.cfm">
									<a href="../bookstore/citation.cfm?Catalog=PI146"><img src="#xImagePath#/PI146_H25xW25.jpg" width="21" height="25" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
									</cfif>	
								</CFIF>					
							
<!---							<CFIF IsDefined("photobook")>
								<cfif photobook is 1> 
									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<!--- Set defaults for all images --->
									<cfset xPath = "../img/bigillus">
									<cfset xHeight = "25">	
									<cfset xWidth = "25">
									<cfset xAlt = "The Photo Book">		
									<!--- xCache is set in Application --->
									<cfset xImage = "pi146b.jpg">
									<cfinclude template="../Templates/ImageSizer.cfm">
									<a href="../templates/mShowDetailsbycat.cfm?Catalog=PI146"><img src="#xRootCache#/#imagecr.filename#" width="#imagecr.width#" height="#imagecr.height#" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
								</cfif>
							</CFIF>--->
							

							<CFIF IsDefined("Book101Books")>
								<cfif Book101Books is 1>
									<cfset catalog="PK676">
									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<cfset xPath = "/img/bigillus">
									<cfset xHeight = "25">	
									<cfset xWidth = "25">
									<cfset xAlt = "The Book of 101 Books">		
									<cfset xImage = "pk676b.jpg">																						                                    <cfinclude template="/templates/CreateImageFolders.cfm">												
									<a href="../bookstore/citation.cfm?Catalog=PK676"><img src="#xImagePath#/PK676_H25xW25.jpg" width="21" height="25" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
								</cfif>
							</CFIF>
															
<!---							<CFIF IsDefined("Book101Books")>
								<cfif Book101Books is 1>
									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<!--- Set defaults for all images --->
									<cfset xPath = "../img/bigillus">
									<cfset xHeight = "25">	
									<cfset xWidth = "25">
									<cfset xAlt = "The Book of 101 Books">		
									<!--- xCache is set in Application --->
									<cfset xImage = "pk676b.jpg">
									<cfinclude template="../Templates/ImageSizer.cfm">
									<a href="../templates/mShowDetailsbycat.cfm?Catalog=PK676"><img src="#xRootCache#/#imagecr.filename#" width="#imagecr.width#" height="#imagecr.height#" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
								</cfif>
							</cfif>--->
							
							<CFIF IsDefined("OpenBook")>
								<cfif OpenBook is 1>
									<cfset catalog="ZC553">
									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<cfset xPath = "/img/bigillus">
									<cfset xHeight = "25">	
									<cfset xWidth = "25">
									<cfset xAlt = "The Open Book">		
									<cfset xImage = "zc553b.jpg">
									<cfinclude template="/templates/CreateImageFolders.cfm">
									<a href="../bookstore/citation.cfm?Catalog=zc553"><img src="#xImagePath#/ZC553_H25xW25.jpg" width="21" height="25" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>							
								</cfif>
							</CFIF>
							
<!---							<CFIF IsDefined("OpenBook")>
								<cfif OpenBook is 1>
									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<!--- Set defaults for all images --->
									<cfset xPath = "../img/bigillus">
									<cfset xHeight = "25">	
									<cfset xWidth = "25">
									<cfset xAlt = "The Photo Book">		
									<!--- xCache is set in Application --->
									<cfset xImage = "zc553b.jpg">
									<cfinclude template="../Templates/ImageSizer.cfm">
									<a href="../templates/mShowDetailsbycat.cfm?Catalog=ZC553"><img src="#xRootCache#/#imagecr.filename#" width="#imagecr.width#" height="#imagecr.height#" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
								
								</cfif>
							</cfif>--->

								<CFIF IsDefined("FotografiaPublica")>
								<!--- Make sure that the qty of 3 hasn't been reached --->
	
									<cfif FotografiaPublica is 1 and  xreference_qty LTE 2>
										<cfset catalog="ZB448">
										<CFSET xreference_qty = xreference_qty+1>
										<cfset xcatillus = 1>
										<cfset xPath = "/img/bigillus">
										<cfset xHeight = "25">	
										<cfset xWidth = "25">
										<cfset xAlt = "Fotografia Publica">		
										<cfset xImage = "zb448b.jpg">
										<cfinclude template="/templates/CreateImageFolders.cfm">
										<a href="../bookstore/citation.cfm?Catalog=zb448"><img src="#xImagePath#/ZB448_H25xW25.jpg" width="21" height="25" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
									</cfif>	
								</CFIF>	
							</font>
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

<!--- Display paging navigation links--->
<cfset dsp = "Bottom">
<cfinclude template="/auctions/AvailPostAuctionNav.cfm">

<cfquery name="qCountAuctionEnded" datasource="photoeyecom">
	SELECT count(*) AS count
	FROM AuctionAdmin  a
	WHERE publish = 1 
	AND endannounced = 1 
	AND (a.reserve <= 
	(SELECT Max(b.bid) 
	 FROM AuctionBids b 
	 WHERE b.AuctionID = a.AuctionID) 
	OR PostAuctionSale > 0)
</cfquery>

<br>
<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="3">Return to <b><A HREF="index.cfm?View=CurrentAuctions">Current Auctions</A></b></font>
<br><br>
<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="3">View all #qCountAuctionEnded.Count#<b> <A HREF="index.cfm?View=PastAuctions">Past Auctions</A></b></font>
<br><br>
<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
<!--- We'd love to hear about <A HREF="../auctions/AuctionComments.cfm">your experience</A> with our new Auctions. <br> --->
</font>
</cfoutput>
</div>

  
