
<cfparam name="view" default="CurrentAuctions">

 	
		<cfoutput>

<!--- Intro --->
<table width="850" align="center" cellpadding="0" cellspacing="0">
<tr height="10"><td></td></tr>
<tr>
	<td align="center">
	<font color="##333" face="Verdana, Arial, Helvetica, sans-serif" size="2">

	<cfif IsDefined("session.acctid")>
	
		<cfquery name="qGetCustomerAccount"  datasource="photoeyecom">
			SELECT *
			FROM MailingList_OM 
			WHERE Custnumber =  <cfqueryparam value="#Session.AcctID#" cfsqltype="cf_sql_integer">
		</cfquery> 
		
		<cfquery name="qGetCreditCards" datasource="photoeyecom">
			SELECT AUTOID, TABLEID, CUSTNUMBER AS CUSTNUM, CARDDEFAULT, CARDNUM, EXP, CARDHOLDER, CC_CID 
			FROM CreditCardsAdditional 
			WHERE custnumber=#qGetCustomerAccount.Custnumber# 
			AND exp <> '' 
			AND CardDefault = 1
		</cfquery>
	
		<!--- If logged in, but Auction is not setup --->
		<cfif Len(Trim(qGetCustomerAccount.AuctionName)) EQ 0>
			<font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="Black"> 
			<b><a href="../templates/OrderFormEditAccountStep6.cfm?Auction=1&nobid=1">Create an Auction Nickname</a></b> to bid | <b> 
			<a href="AuctionInfo.cfm">Consign</a></b> auction items</font>
		<!--- If logged in, but Payment is not setup --->
		<cfelseif qGetCustomerAccount.PaymentMethod NEQ 1>
			<font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="Black"> 
			<b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="maroon">#qGetCustomerAccount.AuctionName#</font> <br><a href="../templates/OrderFormEditAccountStep4.cfm?Auction=1&nobid=1">Setup your Payment Method</a></b> to bid | <b><a href="AuctionInfo.cfm">Consign</a></b> auction items</font>
		<!--- If Credit Card has expired --->
		<cfelseif right(qGetCreditCards.Exp, 2) LT right(datepart("yyyy", Now()), 2) AND left(qGetCreditCards.Exp, 2) LT left(datepart("m", Now()), 2)>
			<font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="Black"> 
			<b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="maroon">#qGetCustomerAccount.AuctionName#</font> Your Credit Card has expired!<br><a href="../templates/OrderFormEditAccountStep4.cfm?Auction=1&nobid=1">Setup your Payment Method</a></b> to bid | <b><a href="AuctionInfo.cfm">Consign</a></b> auction items</font>
		<!--- iF LOGGed in and Auction is setup --->
		<cfelse>
			</font><B><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="maroon">#qGetCustomerAccount.AuctionName#</font></b><br><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="Black"> Click any auction item below | <b><a href="AuctionInfo.cfm">Consign</a></b> auction items</font>
		</cfif>
		
	<cfelse>
		<br><font face="Verdana, Arial, Helvetica, sans-serif" size="3" color="##666"><b><span style="line-height:24px;">Welcome to the new photo-eye Weekly Auctions!</b><br>This weeks auctions close Thursday, January 5th.</span><br /><br></font>
	<div align="left">
	
								 						
									<div class='revealable'> 
										<div class='revealer button'>
											<font color="blue">Read What's New!</font> Weekly Auctions, No Reserves, Video Presentations, Expanded Listings and more to come!
										</div> 
										<div class='revealee' style='display:none;'>
										<font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="##666"> Important updates to our platform include:<br>
<li><b>Weekly Auctions.</b> All lots open on Saturday and end on the following Thursday afternoon. Each week's new auction items will be announced in the weekly New Arrivals+ newsletter. For maximum convenience ending times are closely spaced in the mid-afternoon.</li>
<li><b>No Reserves.</b> Opening bid takes the item unless outbid.</li>
<li><b>Weekly Video Presentations.</b> Eric Miles, now in his eighth year as rare book and photo specialist at photo-eye, will take an in-depth look at one or more of the week's most important auction items. </li>
<li><b>Expanded Individual Listings.</b> Including additional video presentations and slide shows.</li>
<li><b>Past Auction Results.</b> Continued access to nearly eight years worth results, with descriptions, for thousands of photobooks makes photo-eye Auctions one the finest educational tools in the field. </li>
<li><b>And More to Come.</b> Stay tuned in the weeks ahead for a mix of special offers, Limited Editions, prints and 'Buy it Now' books.</li>  
<br>
In our new listings for rare, out-of-print, and limited edition photobooks, we will use all the tools the web now offers to provide context and offer insight into the material on offer, making photo-eye Auctions singular place for learning and an invaluable destination on the web for collectors, artists, and dealers. 
<br><br>
	<!--- We've updated our platform to include exciting new features: <br>
<b>Weekly auctions.</b> All lots open on Saturday and end on the following Thursday afternoon. Each week's new auction items will be announced in the weekly New Arrivals + newsletter.<br>
<b>No reserves:</b> Opening bid will take the item unless outbid. <br>
<b>Video Presentations!</b> Rare book and print specialist Eric Miles will take an in-depth look at one or more of the week's most important auction items. <br>
<b>And more!</b> Stay tuned in the weeks ahead for a mix of special offers, Limited Editions, prints and 'Buy it Now' books. <br><br> --->
	

	</font>
										</div> 
									</div> 
							 
	
	
		<div align="left">
<iframe src="http://player.vimeo.com/video/34401326?title=0&byline=0&portrait=0" width="400" height="300" frameborder="0" style="float:left;margin:5px 15px 0 15px;border:1px solid ##999" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe><p><font face="Verdana, Arial, Helvetica, sans-serif" style="font-size:16px; line-height:24px;" color="##666"> In this week's feature presentation, Eric Miles takes a look at three rare pieces of Chinese propaganda photography, including the work of Hou Bo. For twelve years, as Mao's personal portrait photographer, her work was published in the hundreds of millions and seen in almost every home and place of work in China. Thanks for watching!
</font><br><br><!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style " 
	addthis:url="http://vimeo.com/34401326">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>
<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div><script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js##pubid=ra-4eedfea006dcdc6b"></script></p>

		
</div>

	<div align="left">
<iframe src="http://player.vimeo.com/video/34401194?title=0&byline=0&portrait=0" width="400" height="300" frameborder="0" style="float:left;margin:5px 15px 0 15px;border:1px solid ##999" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe><p><font face="Verdana, Arial, Helvetica, sans-serif" style="font-size:16px; line-height:24px;" color="##666"> This weeks overview presentation includes three rare Maoist propaganda photo books, Garry Winogrand: Women Are Beautiful, Lee D. Witkin and Barbara London: The Photograph Collector's Guide, Bruce Davidson: Outside Inside and East 100th Street, and an Allen Ginsberg Photograph.   Thanks for watching!
</font><br><br><!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style " 
	addthis:url="http://vimeo.com/34401194">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>
<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div><script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js##pubid=ra-4eedfea006dcdc6b"></script></p>

		
</div>


</td></tr>
	</cfif> <!--- end if (IsDefined("session.acctid")) --->
	</font>
	</td>
</tr>


</table>
  
<cfif url.View EQ "CurrentAuctions">

	<!--- Get all current auctions --->
	<cfquery name="qGetAuctionAdmin" datasource="photoeyecom">
		SELECT AuctionID, SpineBorder, ImageSizeList, ImageActualSizeList, Title, Description, TimeEnd, (datediff(day, TimeEnd, getdate())) AS DaysEnded, EndAnnounced, PostAuctionSale, Reserve, PhotoBook, Book101Books, OpenBook, FotografiaPublica, OpeningBid
		FROM AuctionAdmin a
		WHERE (publish = 1 
		AND endannounced = 0)
		ORDER BY EndAnnounced, TimeEnd
	</cfquery>
	<!---  and auctionid<6519 --->
 
	
	<!--- Get most recently ended but not won auctions --->
	<cfquery name="qGetEndedAuctions" datasource="photoeyecom">
		SELECT top 15 AuctionID,  ImageSizeList, ImageActualSizeList, Title, TimeEnd, (datediff(day, TimeEnd, getdate())) AS DaysEnded, EndAnnounced, PostAuctionSale, Reserve, Description
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
	
	<!--- Append ended auctions to current auctions query --->
	<cfloop query="qGetEndedAuctions">
		<cfscript>
			queryAddRow(qGetAuctionAdmin);
			querySetCell(qGetAuctionAdmin, "AuctionID", qGetEndedAuctions.AuctionID);
			querySetCell(qGetAuctionAdmin, "ImageSizeList", qGetEndedAuctions.ImageSizeList);
			querySetCell(qGetAuctionAdmin, "ImageActualSizeList", qGetEndedAuctions.ImageActualSizeList);
			querySetCell(qGetAuctionAdmin, "Title", qGetEndedAuctions.Title);
			querySetCell(qGetAuctionAdmin, "TimeEnd", qGetEndedAuctions.TimeEnd);
			querySetCell(qGetAuctionAdmin, "DaysEnded", qGetEndedAuctions.DaysEnded);
			querySetCell(qGetAuctionAdmin, "EndAnnounced", qGetEndedAuctions.EndAnnounced);
			querySetCell(qGetAuctionAdmin, "PostAuctionSale", qGetEndedAuctions.PostAuctionSale);
			querySetCell(qGetAuctionAdmin, "Reserve", qGetEndedAuctions.Reserve);	
			querySetCell(qGetAuctionAdmin, "Description", qGetEndedAuctions.Description);	
		</cfscript>
	</cfloop>

	<!--- Main Current Auction Grid --->
	<table width = "800" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr bordercolor="White">
	<td align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="Black"> </td>
<!---	<form name="searchFrm" method="post" action="AuctionSearchResults.cfm">
	<td align="right" style="padding-bottom:6px">Search Auctions:&nbsp;<input type="text" value="Enter search words here…" name="searchInput" size="25" onFocus="if(this.value=='Enter search words here…')this.value='';" style="FONT-FAMILY: Arial, Helvetica, sans-serif;FONT-SIZE: 10px">&nbsp;</td>
	<td align="right" style="padding-bottom:6px" width="1%"><input name="btnSearch" type="submit" value="Search" style="font-family:"Verdana, Arial, Helvetica, sans-serifArial, Helvetica, sans-serif;font-size:10px"></td>
	</form>---> 
	</tr>
</table>
	<br>
	
		<table width = "850" cellspacing="0" cellpadding="5" align="center" border="1">
	<tr bordercolor="White" height="10" bgcolor="##ffffff"><td colspan="1" align="left"  style="vertical-align:middle;"><span style="padding-top:0px;">
		<span style="align:left"><b><a href="mailto:info@photoeye.com?Subject=Consignments">Consign to photo-eye Auctions</a></b></span><br>
		photo-eye Auctions provides expert photobook search service, appraisal of libraries and photo collections and consulting for all of your library and photography collecting needs. 
</font></span></td></tr></table>
		<br>

	<table width = "850" cellspacing="0" cellpadding="5" align="center" border="1">
	<tr bordercolor="White" height="10" bgcolor="##ffffff"><td colspan="1" align="center"  style="vertical-align:middle;"><span style="padding-top:0px;">
		<b><a href="login.cfm?Auction=1&nobid=1">Login or Register</a></b> to bid | <b><a href="AuctionInfo.cfm">Consign</a></b> auction items
</font></span></td></tr></table>
		<br>
<table width = "850" cellspacing="0" cellpadding="5" align="center" border="1">	 
	<tr bordercolor="White" bgcolor="##dddddd">
		<!--- <td align="center" width="50"><font color="White" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b></b></font></td> --->
		<td align="center"><font color="maroon" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Items Open for Bids</b></font>&nbsp;&nbsp;&nbsp;</td>
		<td colspan="1" width="150" style="vertical-align:top"><span style="vertical-align:top"><input name="" type="button" class="input_button"  style="margin-bottom:10px;" id="Auctions_Input" onclick="javascript:window.location.href='index.cfm'" value="Refresh Bids / Clock" /></span></td>
		<td align="center" width="155"><font color="maroon" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Starting or<br>High Bid</b></font></td>
		<td align="center" width="25"><font color="maroon" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Bids</b></font></td>
	</tr>
	</table>
	
	<cfset LineCounter = 0> 
	
	<cfloop query="qGetAuctionAdmin">

		<!--- Get Auction Time Remaining --->
		<cfinclude template="/auctions/AuctionTime.cfm">
	
		<cfquery name="qGetAuctionBids" datasource="photoeyecom">
			SELECT Max(bid) as Bid, Count(autoid) as Count 
			FROM AuctionBids 
			WHERE auctionid =  <cfqueryparam value="#auctionid#" cfsqltype="cf_sql_integer">
		</cfquery>
		
		<cfif NOT xStillAvailableHeaderShown AND qGetAuctionAdmin.PostAuctionSale EQ 0 AND EndAnnounced> 
			<br>
			<table height="60" align="center">
			<tr>
				<td>
					<table height="40" width="850" border="1" cellspacing="0" cellpadding="5" align="center" bordercolor="white" bgcolor="##dddddd">	
					<tr bordercolor="maroon">
						<td align="center" class="Global_Font"><font color="black">Bidding for the following items has ended; they can now be purchased at the prices shown.</font><!--- <br />Click 'Inquire' if interested.---></td>
					</tr>
					</table>
				</td>
			</tr>
			</table>
			<cfset xStillAvailableHeaderShown = 1>
		
		</cfif>
	
		<table width="850" border="0" cellspacing="0" cellpadding="5" align="center">
			
		<cfif LineCounter>
		&nbsp;
			<tr bgcolor="##F4F1E1">
		<cfelse>
			&nbsp;
			<tr bgcolor="##eeeeee">
		</cfif>
		
		 <cfif LineCounter>
			<td align="left" valign="top" style="padding-top:20px; padding-bottom:20px;" width="600" colspan="2">
		
<!---			<cfset currentDirectory = GetDirectoryFromPath(GetTemplatePath()) & "img\#auctionid#">--->
            
            
            <cfset currentDirectory = expandPath("\auctions\img\#auctionid#")>
			
			<cfdirectory directory="#currentDirectory#" action="list" name="dirQuery" filter="large.jpg" recurse="no">
			<CFIF dirQuery.recordcount gt 0>
				<cfset xcatillus = 1>
				<cfset url.id 	="#auctionid#">
				<cfset xImageAddress=ExpandPath("/auctions/img/#auctionid#/")>
				<cfset xImageNewAddress="#xImageAddress#">
				
<!---				<cfset xImageNewAddress=ExpandPath("/auctions/img/#url.id#/")>--->
				<cfif (qGetAuctionAdmin.PostAuctionSale EQ 0 AND EndAnnounced)> 
					<CFSET xHeight = "200">	
					<CFSET xWidth = "200">
				<cfelse>
					<CFSET xHeight = "300">	
					<CFSET xWidth = "300">				
				</cfif>
				<CFSET xImage = "large">
				<cfset xImageFormat = "jpg">
				<cfset xId="AuctionId">
				<cfset xDbToUpdate="AuctionAdmin">
				<cfset xQueryName="qGetAuctionAdmin">
				<cfset xAlt = "Go to this Auction">	
				<CFSET xQueryImageSizeList = "#ImageSizeList#">
				<CFSET xQueryActualImageSizeList = "#ImageActualSizeList#">	

				<cfinclude template="/templates/GetImageInfo.cfm">
		<cfparam name="xpage1" default="citation.cfm">
				<a href="#xpage1#?id=#auctionid#">
				<img src="/auctions/img/#qGetAuctionAdmin.AuctionID#/#xBookImage#" width="#xBookWidth#" height="#xBookHeight#" alt="#xAlt#"  style=" float:left;margin:5px 15px 0 15px;border:1px solid ##999" /></a>
			</cfif>
			
			
		<!---	</td> --->
		
		<!--- <td align="left" width="350" valign="top" style="padding-top:20px; padding-bottom:20px;"> --->
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			<b><a href="Citation.cfm?id=#qGetAuctionAdmin.auctionid#">#Title#</a></b><br><br>
			<cfif (qGetAuctionAdmin.PostAuctionSale EQ 0 AND EndAnnounced)>
			#trim(mid(qGetAuctionAdmin.Description,1,200))# . . . <div style="margin-top:5px;"><a href="Citation.cfm?id=#qGetAuctionAdmin.auctionid#"><font color="blue" size="2">[bid or read more]</font></a> <br><br><!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style " 
	addthis:url="http://www.photoeye.com/auctions/citation.cfm?id=#Auctionid#" 
	addthis:title="#title#">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>
<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div>
<script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js##pubid=ra-4eedfea006dcdc6b"></script>
<!-- AddThis Button END --></div>
			<cfelse>
			#trim(mid(qGetAuctionAdmin.Description,1,400))# . . . <div style="margin-top:5px;"><a href="Citation.cfm?id=#qGetAuctionAdmin.auctionid#"><font color="blue" size="2" >[bid or read more]</font></a> <br><br><!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style " 
	addthis:url="http://www.photoeye.com/auctions/citation.cfm?id=#Auctionid#" 
	addthis:title="#title#">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>
<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div><script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js##pubid=ra-4eedfea006dcdc6b"></script>
</div>

			</cfif>
		</td>
		
	<cfelse>
		<td align="left" width="600" valign="top" style="padding-top:20px; padding-bottom:20px;">
		
				<!--- </td>
		<td align="left" valign="top" style="padding-top:20px; padding-bottom:20px;" width="300"> --->
            <cfset currentDirectory = expandPath("\auctions\img\#auctionid#")>
			
			<cfdirectory directory="#currentDirectory#" action="list" name="dirQuery" filter="large.jpg" recurse="no">
			<CFIF dirQuery.recordcount gt 0>
				<cfset xcatillus = 1>
				<cfset url.id 	="#auctionid#">
				<cfset xImageAddress=ExpandPath("/auctions/img/#auctionid#/")>
				<cfset xImageNewAddress="#xImageAddress#">
				
<!---				<cfset xImageNewAddress=ExpandPath("/auctions/img/#url.id#/")>--->
				<cfif (qGetAuctionAdmin.PostAuctionSale EQ 0 AND EndAnnounced)> 
					<CFSET xHeight = "200">	
					<CFSET xWidth = "200">
				<cfelse>
					<CFSET xHeight = "300">	
					<CFSET xWidth = "300">				
				</cfif>
				<CFSET xImage = "large">
				<cfset xImageFormat = "jpg">
				<cfset xId="AuctionId">
				<cfset xDbToUpdate="AuctionAdmin">
				<cfset xQueryName="qGetAuctionAdmin">
				<cfset xAlt = "Go to this Auction">	
				<CFSET xQueryImageSizeList = "#ImageSizeList#">
				<CFSET xQueryActualImageSizeList = "#ImageActualSizeList#">	

				<cfinclude template="/templates/GetImageInfo.cfm">
		<cfparam name="xpage1" default="citation.cfm">
				<a href="#xpage1#?id=#auctionid#">
				<img src="/auctions/img/#qGetAuctionAdmin.AuctionID#/#xBookImage#" width="#xBookWidth#" height="#xBookHeight#" alt="#xAlt#" style="float:right; margin:5px 15px 0 5px;border:1px solid ##999;" ></a>
			</cfif>
			
			
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			<b><a href="Citation.cfm?id=#qGetAuctionAdmin.auctionid#">#Title#</a></b><br><br>
				<cfif (qGetAuctionAdmin.PostAuctionSale EQ 0 AND EndAnnounced)>
			#trim(mid(qGetAuctionAdmin.Description,1,200))# . . . <div style="margin-top:5px;"><a href="Citation.cfm?id=#qGetAuctionAdmin.auctionid#"><font color="blue" size="2">[bid or read more]</font></a> <br><br><!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style " 
	addthis:url="http://www.photoeye.com/auctions/citation.cfm?id=#Auctionid#" 
	addthis:title="#title#">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>

<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div><script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js##pubid=ra-4eedfea006dcdc6b"></script>
</div>
			<cfelse>
			#trim(mid(qGetAuctionAdmin.Description,1,400))# . . . <div style="margin-top:5px;"><a href="Citation.cfm?id=#qGetAuctionAdmin.auctionid#"><font color="blue" size="2" >[bid or read more]</font></a> <br><br><!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style " 
	addthis:url="http://www.photoeye.com/auctions/citation.cfm?id=#Auctionid#" 
	addthis:title="#title#">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>
<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div><script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js##pubid=ra-4eedfea006dcdc6b"></script>
</div>

			</cfif>

			
			
		</td>
		

</cfif>	
		
		<td align="right" width="100" valign="top" style="padding-top:20px; padding-bottom:20px;">
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			<cfif qGetAuctionAdmin.PostAuctionSale EQ 0 AND EndAnnounced> 
					<span style="margin-right:10px;"><font color="Green" face="Verdana, Arial, Helvetica, sans-serif" size="3">$#reserve#</font>	</span>		
			<cfelse>
				<cfif qGetAuctionBids.Bid gt 0>
					<font color="green" face="Verdana, Arial, Helvetica, sans-serif" size="3"><b>$#Trim(NumberFormat(qGetAuctionBids.Bid,"999,999"))#</b></font>
				<cfelse>
					<span style="margin-right:10px;"><font color="green" face="Verdana, Arial, Helvetica, sans-serif" size="3"><b>$#openingbid#</b></font></span>	
				</cfif>
			</cfif>
			</font>
			
			<cfif (qGetAuctionAdmin.PostAuctionSale EQ 0 AND EndAnnounced)> 
				<br><br><a href="mailto:auctions@photoeye.com?Subject=Post Auction Inquiry for #qGetAuctionAdmin.Title#"><font color="Blue" face="Verdana, Arial, Helvetica, sans-serif" size="2">Inquire to<br>Buy it Now</font></a> <!--- Auction Ended --->
			<cfelse>
				<table cellpadding="3" cellspacing="3" border="0" align="center">
				<tr>
				<cfif xdays + xhours + xminutes gt 0>
					<td align="right" width="30">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
						<cfif xdays gt 0>
							#xdays#d
						</cfif>
						</font>
					</td>
					<td align="right">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
						<cfif xhours gt 0>
							#xhours#h
						<cfelseif xdays gt 0>
							0h
						</cfif>
						</font>
					</td>
					<td align="right">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">	
						<cfif xminutes gt 0>
							#xminutes#m
						<cfelse>
							0m
						</cfif>
						
						</font>
					</td>
				<cfelse>
					<td align="right">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">#xseconds# sec</font><br>
						 
					</td>
				</cfif>
				</tr>
				<tr><td colspan="3" align="right"><a href="Citation.cfm?id=#qGetAuctionAdmin.auctionid#"><font color="blue" size="2">[bid]</font></a> 
</td></tr>
				</table>
				
			</cfif>
			
								<table cellpadding="3" cellspacing="3" border="0" align="right">
					<tr>
												<CFSET xreference_qty = 0>
						<td align="center">
							<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
							<CFIF IsDefined("photobook")>
								<cfif photobook is 1> 
									<cfset catalog="PI146">
									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<!--- Set defaults for all images --->
									<cfset xPath = "/img/bigillus">
									<cfset xHeight = "50">	
									<cfset xWidth = "50">

									<cfset xAlt = "The Photo Book">		
									<!--- xCache is set in Application --->
									<cfset xImage = "pi146b.jpg">
									<!---<cfinclude template="/Templates/ImageSizer.cfm">--->
									<cfinclude template="/templates/CreateImageFolders.cfm">
									<a href="/bookstore/mShowDetailsbycat.cfm?Catalog=PI146"><img src="#xImagePath#/PI146_H50xW50.jpg" width="42" height="50" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
									</cfif>
									
<!---									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<!--- Set defaults for all images --->
									<cfset xPath = "/img/bigillus">
									<cfset xHeight = "50">	
									<cfset xWidth = "50">
									<cfset xAlt = "The Photo Book">		
									<!--- xCache is set in Application --->
									<cfset xImage = "pi146b.jpg">
									<cfinclude template="/Templates/ImageSizer.cfm">
									<a href="/templates/mShowDetailsbycat.cfm?Catalog=PI146"><img src="#xRootCache#/#imagecr.filename#" width="#imagecr.width#" height="#imagecr.height#" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
								</cfif>--->
							</CFIF>
							
							
							<CFIF IsDefined("Book101Books")>
								<cfif Book101Books is 1>
									<cfset catalog="PK676">
									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<!--- Set defaults for all images --->
									<cfset xPath = "/img/bigillus">
									<cfset xHeight = "50">	
									<cfset xWidth = "50">
									<cfset xAlt = "The Book of 101 Books">		
									<!--- xCache is set in Application --->
									<cfset xImage = "pk676b.jpg">
									<!---<cfinclude template="/Templates/ImageSizer.cfm">--->
																										                                    <cfinclude template="/templates/CreateImageFolders.cfm">
								<!---	<cfoutput>#xImagePath#</cfoutput><cfflush>--->															
									<a href="/bookstore/mShowDetailsbycat.cfm?Catalog=PK676"><img src="#xImagePath#/PK676_H50xW50.jpg" width="42" height="50" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
								</cfif>
								

<!---								<cfif Book101Books is 1>
									<CFSET xreference_qty = xreference_qty+1>

<!---									<cfset currentDirectory = GetDirectoryFromPath(GetTemplatePath()) & "img\#auctionid#">
						
									<cfdirectory directory="#currentDirectory#" action="list" name="dirQuery" filter="large.jpg" recurse="no">
						
									<CFIF dirQuery.recordcount gt 0>--->
									<cfset Catalog="PK676">
<!---									<cfset xCatalog="#xCatalog#">--->
									<cfset xcatillus = 1>
									<!--- Set defaults for all images --->
									<cfset xPath = "/img/bigillus">
									<!---<cfset url.id 	="#auctionid#">--->
<!---								<cfset xImageAddress=ExpandPath("/img/bigillus/")>
									<cfset xImageNewAddress="#xImageAddress#">--->				
									<CFSET xHeight = "50">	
									<CFSET xWidth = "50">
									<cfset xAlt = "The Book of 101 Books">
									<cfset xImage = "#xCatalog#b">
									<cfset xImageFormat = "jpg">
<!---									<cfset xId="AuctionId">
									<cfset xDbToUpdate="AuctionAdmin">
									<cfset xQueryName="qGetAuctionAdmin">--->

<!---									<CFSET xQueryImageSizeList = "#ImageSizeList#">
									<CFSET xQueryActualImageSizeList = "#ImageActualSizeList#">	--->			
									
									<cfinclude template="/templates/CreateImageFolders.cfm">
									
<!---									<cfinclude template="/templates/GetImageInfo.cfm">--->
									
									<a href="/templates/mShowDetailsbycat.cfm?Catalog=#xCatalog#">
									
									<img src="#xImagePath##xBookImage#" width="#xBookWidth#" height="#xBookHeight#" alt="#xAlt#" <CFIF qGetAuctionAdmin.SpineBorder is 1>border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"<CFELSE>border="0"</CFIF>></a>
									<!---</cfif>	--->								
									
<!---									<cfset xcatillus = 1>
									<!--- Set defaults for all images --->
									<cfset xPath = "/img/bigillus">
									<cfset xHeight = "50">	
									<cfset xWidth = "50">
									<cfset xAlt = "The Book of 101 Books">		
									<!--- xCache is set in Application --->
									<cfset xImage = "pk676b.jpg">
									<cfinclude template="/Templates/ImageSizer.cfm">
									
									<a href="/templates/mShowDetailsbycat.cfm?Catalog=PK676"><img src="#xRootCache#/#imagecr.filename#" width="#imagecr.width#" height="#imagecr.height#" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>--->
									
									
									
								</cfif> --->
							</cfif>
							<CFIF IsDefined("OpenBook")>
								<cfif OpenBook is 1>
									<cfset catalog="ZC553">
									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<!--- Set defaults for all images --->
									<cfset xPath = "/img/bigillus">
									<cfset xHeight = "50">	
									<cfset xWidth = "50">
									<cfset xAlt = "The Open Book">		
									<!--- xCache is set in Application --->
									<cfset xImage = "zc553b.jpg">
<!---									<cfinclude template="/Templates/ImageSizer.cfm">--->
									<cfinclude template="/templates/CreateImageFolders.cfm">
									<a href="/bookstore/mShowDetailsbycat.cfm?Catalog=zc553"><img src="#xImagePath#/ZC553_H50xW50.jpg" width="42" height="50" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>							
								</cfif>

<!---							<cfif OpenBook is 1>
									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<!--- Set defaults for all images --->
									<cfset xPath = "/img/bigillus">
									<cfset xHeight = "50">	
									<cfset xWidth = "50">
									<cfset xAlt = "The Photo Book">		
									<!--- xCache is set in Application --->
									<cfset xImage = "zc553b.jpg">
									<cfinclude template="/Templates/ImageSizer.cfm">
									<a href="/templates/mShowDetailsbycat.cfm?Catalog=ZC553"><img src="#xRootCache#/#imagecr.filename#" width="#imagecr.width#" height="#imagecr.height#" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
								
								</cfif>--->
							</cfif>
								
								<CFIF IsDefined("FotografiaPublica")>
								<!--- Make sure that the qty of 3 hasn't been reached --->
	
									<cfif FotografiaPublica is 1 and  xreference_qty LTE 2>
										<cfset catalog="ZB448">
										<CFSET xreference_qty = xreference_qty+1>
										<cfset xcatillus = 1>
										<!--- Set defaults for all images --->
										<cfset xPath = "/img/bigillus">
										<cfset xHeight = "50">	
										<cfset xWidth = "50">
										<cfset xAlt = "Fotografia Publica">		
										<!--- xCache is set in Application --->
										<cfset xImage = "zb448b.jpg">
										<!---<cfinclude template="/Templates/ImageSizer.cfm">--->
										<cfinclude template="/templates/CreateImageFolders.cfm">
										<a href="/bookstore/mShowDetailsbycat.cfm?Catalog=zb448"><img src="#xImagePath#/ZB448_H50xW50.jpg" width="42" height="50" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
								</cfif>							
								
															<!---	<cfif FotografiaPublica is 1 and  xreference_qty LTE 2>
									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<!--- Set defaults for all images --->
									<cfset xPath = "/img/bigillus">
									<cfset xHeight = "50">	
									<cfset xWidth = "50">
									<cfset xAlt = "Fotografia Publica">		
									<!--- xCache is set in Application --->
									<cfset xImage = "zb448b.jpg">
									<cfinclude template="/Templates/ImageSizer.cfm">
									<a href="/templates/mShowDetailsbycat.cfm?Catalog=ZB448"><img src="#xRootCache#/#imagecr.filename#" width="#imagecr.width#" height="#imagecr.height#" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
								</cfif>--->
							</cfif>
							</font>
						</td>
					</tr>
					</table>
		</td>	


		<td align="center" width="45" valign="top"  style="padding-top:20px; padding-bottom:20px;">
			<font color="GREEN" face="Verdana, Arial, Helvetica, sans-serif" size="3"><B>
			
			<cfif EndAnnounced is 1 or qGetAuctionBids.count is 0 > <cfelse><b>#qGetAuctionBids.count#</b> </cfif></B></font>
		</td>
<!---		<td align="right" width="121" valign="top"> --->
		<!---	<cfif (qGetAuctionAdmin.PostAuctionSale EQ 0 AND EndAnnounced)> 
				<a href="mailto:auctions@photoeye.com?Subject=Post Auction Inquiry for #qGetAuctionAdmin.Title#"><font color="Blue" face="Verdana, Arial, Helvetica, sans-serif" size="2">Buy it Now<br>Please Inquire</font></a> <!--- Auction Ended --->
			<cfelse>
				<table cellpadding="3" cellspacing="3" border="0" align="center">
				<tr>
				<cfif xdays + xhours + xminutes gt 0>
					<td align="right" width="30">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
						<cfif xdays gt 0>
							#xdays#d
						</cfif>
						</font>
					</td>
					<td align="right">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
						<cfif xhours gt 0>
							#xhours#h
						<cfelseif xdays gt 0>
							0h
						</cfif>
						</font>
					</td>
					<td align="right">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">	
						<cfif xminutes gt 0>
							#xminutes#m
						<cfelse>
							0m
						</cfif>
						</font>
					</td>
				<cfelse>
					<td align="right">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">#xseconds# sec</font>
					</td>
				</cfif>
				</tr>
				</table>
			</cfif>
			--->
			
			<!--- </td> --->
			
				<!--- <td align="center" width="105" valign="top">
					<table cellpadding="3" cellspacing="3" border="0" align="center">
					<tr>
												<CFSET xreference_qty = 0>
						<td align="left">
							<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
							<CFIF IsDefined("photobook")>
								<cfif photobook is 1> 
									<cfset catalog="PI146">
									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<!--- Set defaults for all images --->
									<cfset xPath = "/img/bigillus">
									<cfset xHeight = "50">	
									<cfset xWidth = "50">

									<cfset xAlt = "The Photo Book">		
									<!--- xCache is set in Application --->
									<cfset xImage = "pi146b.jpg">
									<!---<cfinclude template="/Templates/ImageSizer.cfm">--->
									<cfinclude template="/templates/CreateImageFolders.cfm">
									<a href="/bookstore/mShowDetailsbycat.cfm?Catalog=PI146"><img src="#xImagePath#/PI146_H50xW50.jpg" width="42" height="50" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
									</cfif>
									
<!---									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<!--- Set defaults for all images --->
									<cfset xPath = "/img/bigillus">
									<cfset xHeight = "50">	
									<cfset xWidth = "50">
									<cfset xAlt = "The Photo Book">		
									<!--- xCache is set in Application --->
									<cfset xImage = "pi146b.jpg">
									<cfinclude template="/Templates/ImageSizer.cfm">
									<a href="/templates/mShowDetailsbycat.cfm?Catalog=PI146"><img src="#xRootCache#/#imagecr.filename#" width="#imagecr.width#" height="#imagecr.height#" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
								</cfif>--->
							</CFIF>
							
							
							<CFIF IsDefined("Book101Books")>
								<cfif Book101Books is 1>
									<cfset catalog="PK676">
									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<!--- Set defaults for all images --->
									<cfset xPath = "/img/bigillus">
									<cfset xHeight = "50">	
									<cfset xWidth = "50">
									<cfset xAlt = "The Book of 101 Books">		
									<!--- xCache is set in Application --->
									<cfset xImage = "pk676b.jpg">
									<!---<cfinclude template="/Templates/ImageSizer.cfm">--->
																										                                    <cfinclude template="/templates/CreateImageFolders.cfm">
								<!---	<cfoutput>#xImagePath#</cfoutput><cfflush>--->															
									<a href="/bookstore/mShowDetailsbycat.cfm?Catalog=PK676"><img src="#xImagePath#/PK676_H50xW50.jpg" width="42" height="50" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
								</cfif>
								

<!---								<cfif Book101Books is 1>
									<CFSET xreference_qty = xreference_qty+1>

<!---									<cfset currentDirectory = GetDirectoryFromPath(GetTemplatePath()) & "img\#auctionid#">
						
									<cfdirectory directory="#currentDirectory#" action="list" name="dirQuery" filter="large.jpg" recurse="no">
						
									<CFIF dirQuery.recordcount gt 0>--->
									<cfset Catalog="PK676">
<!---									<cfset xCatalog="#xCatalog#">--->
									<cfset xcatillus = 1>
									<!--- Set defaults for all images --->
									<cfset xPath = "/img/bigillus">
									<!---<cfset url.id 	="#auctionid#">--->
<!---								<cfset xImageAddress=ExpandPath("/img/bigillus/")>
									<cfset xImageNewAddress="#xImageAddress#">--->				
									<CFSET xHeight = "50">	
									<CFSET xWidth = "50">
									<cfset xAlt = "The Book of 101 Books">
									<cfset xImage = "#xCatalog#b">
									<cfset xImageFormat = "jpg">
<!---									<cfset xId="AuctionId">
									<cfset xDbToUpdate="AuctionAdmin">
									<cfset xQueryName="qGetAuctionAdmin">--->

<!---									<CFSET xQueryImageSizeList = "#ImageSizeList#">
									<CFSET xQueryActualImageSizeList = "#ImageActualSizeList#">	--->			
									
									<cfinclude template="/templates/CreateImageFolders.cfm">
									
<!---									<cfinclude template="/templates/GetImageInfo.cfm">--->
									
									<a href="/templates/mShowDetailsbycat.cfm?Catalog=#xCatalog#">
									
									<img src="#xImagePath##xBookImage#" width="#xBookWidth#" height="#xBookHeight#" alt="#xAlt#" <CFIF qGetAuctionAdmin.SpineBorder is 1>border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"<CFELSE>border="0"</CFIF>></a>
									<!---</cfif>	--->								
									
<!---									<cfset xcatillus = 1>
									<!--- Set defaults for all images --->
									<cfset xPath = "/img/bigillus">
									<cfset xHeight = "50">	
									<cfset xWidth = "50">
									<cfset xAlt = "The Book of 101 Books">		
									<!--- xCache is set in Application --->
									<cfset xImage = "pk676b.jpg">
									<cfinclude template="/Templates/ImageSizer.cfm">
									
									<a href="/templates/mShowDetailsbycat.cfm?Catalog=PK676"><img src="#xRootCache#/#imagecr.filename#" width="#imagecr.width#" height="#imagecr.height#" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>--->
									
									
									
								</cfif> --->
							</cfif>
							<CFIF IsDefined("OpenBook")>
								<cfif OpenBook is 1>
									<cfset catalog="ZC553">
									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<!--- Set defaults for all images --->
									<cfset xPath = "/img/bigillus">
									<cfset xHeight = "50">	
									<cfset xWidth = "50">
									<cfset xAlt = "The Open Book">		
									<!--- xCache is set in Application --->
									<cfset xImage = "zc553b.jpg">
<!---									<cfinclude template="/Templates/ImageSizer.cfm">--->
									<cfinclude template="/templates/CreateImageFolders.cfm">
									<a href="/bookstore/mShowDetailsbycat.cfm?Catalog=zc553"><img src="#xImagePath#/ZC553_H50xW50.jpg" width="42" height="50" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>							
								</cfif>

<!---							<cfif OpenBook is 1>
									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<!--- Set defaults for all images --->
									<cfset xPath = "/img/bigillus">
									<cfset xHeight = "50">	
									<cfset xWidth = "50">
									<cfset xAlt = "The Photo Book">		
									<!--- xCache is set in Application --->
									<cfset xImage = "zc553b.jpg">
									<cfinclude template="/Templates/ImageSizer.cfm">
									<a href="/templates/mShowDetailsbycat.cfm?Catalog=ZC553"><img src="#xRootCache#/#imagecr.filename#" width="#imagecr.width#" height="#imagecr.height#" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
								
								</cfif>--->
							</cfif>
								
								<CFIF IsDefined("FotografiaPublica")>
								<!--- Make sure that the qty of 3 hasn't been reached --->
	
									<cfif FotografiaPublica is 1 and  xreference_qty LTE 2>
										<cfset catalog="ZB448">
										<CFSET xreference_qty = xreference_qty+1>
										<cfset xcatillus = 1>
										<!--- Set defaults for all images --->
										<cfset xPath = "/img/bigillus">
										<cfset xHeight = "50">	
										<cfset xWidth = "50">
										<cfset xAlt = "Fotografia Publica">		
										<!--- xCache is set in Application --->
										<cfset xImage = "zb448b.jpg">
										<!---<cfinclude template="/Templates/ImageSizer.cfm">--->
										<cfinclude template="/templates/CreateImageFolders.cfm">
										<a href="/bookstore/mShowDetailsbycat.cfm?Catalog=zb448"><img src="#xImagePath#/ZB448_H50xW50.jpg" width="42" height="50" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
								</cfif>							
								
															<!---	<cfif FotografiaPublica is 1 and  xreference_qty LTE 2>
									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<!--- Set defaults for all images --->
									<cfset xPath = "/img/bigillus">
									<cfset xHeight = "50">	
									<cfset xWidth = "50">
									<cfset xAlt = "Fotografia Publica">		
									<!--- xCache is set in Application --->
									<cfset xImage = "zb448b.jpg">
									<cfinclude template="/Templates/ImageSizer.cfm">
									<a href="/templates/mShowDetailsbycat.cfm?Catalog=ZB448"><img src="#xRootCache#/#imagecr.filename#" width="#imagecr.width#" height="#imagecr.height#" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
								</cfif>--->
							</cfif>
							</font>
						</td>
					</tr>
					</table>
				</td> --->
		</tr>
		</table>
	
		<cfif NOT LineCounter>
			<cfset LineCounter = 1>
		<cfelse>
			<cfset LineCounter = 0>
		</cfif>
	
	</cfloop> <!--- end loop (query="qGetAuctionAdmin") --->
	
	<cfquery name="qCountAuctionEnded" datasource="photoeyecom">
		SELECT count(*) AS count
		FROM AuctionAdmin a
		WHERE publish = 1 AND 
		endannounced = 1 AND 
		(a.reserve <= 
		 (SELECT Max(b.bid) 
		  FROM AuctionBids b 
		  WHERE b.AuctionID = a.AuctionID) 
		 OR PostAuctionSale > 0)
	</cfquery>
	
	<br>
    <center>
	<table cellpadding="20" bgcolor="##F2DF9F" align="center">
	<tr>
		<td align="center">
			
			<a href="AvailPostAuction.cfm?st=1"><B>View</b></a> the Entire Inventory Available for Post-Auction Sale
		</td>
	</tr>
	</table>
    </center>
	<br>
	 
	View all #qCountAuctionEnded.Count#<b> <a href="index.cfm?View=PastAuctions">Past Auctions</a></b>

<!--- View all count Past Auctions (View all ended auctions)--->	
<cfelse> <!--- else (url.View NEQ "CurrentAuctions") --->
	
	<br>
	<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="3">Return to  <b><a href="index.cfm?View=CurrentAuctions">Current Auctions</a></b></font>
	<br><br>
	
	<cfset LineCounter = 1>
	
	<!--- Get ended auctions --->
	<cfquery name="qGetAuctionAdmin" datasource="photoeyecom">
		SELECT AuctionID, Title, TimeEnd, EndAnnounced, PostAuctionSale, Reserve
		FROM AuctionAdmin a
		WHERE publish = 1 AND 
		endannounced = 1 AND 
		(a.reserve <= 
		 (SELECT Max(b.bid) 
		  FROM AuctionBids b 
		  WHERE b.AuctionID = a.AuctionID) 
		 OR PostAuctionSale > 0)
		ORDER BY TimeEnd DESC 
	</cfquery>
	
	<!--- Display Paging Navigation links --->
	<cfinclude template="/auctions/AuctionFrontPageNav.cfm">
	
	<table width="700" cellspacing="0" width="100%" border="1" bordercolor="white" align="center" cellpadding="5">
	<tr>
		<td align="center" bordercolor="maroon"><font color="maroon"><b>Past Auctions</b></font></td>
		<td align="center" bordercolor="maroon" width="107">&nbsp;&nbsp;<font color="maroon"><b>Winning&nbsp;Bid</b></font>&nbsp;&nbsp;</td>
		<td align="center" bordercolor="maroon" width="32">&nbsp;<font color="maroon"><b>Bids</b></font>&nbsp;</td>
		<td align="center" bordercolor="maroon" width="96"><font color="maroon"><b>Ended On</b></font></td>
		<td align="center" bordercolor="maroon" width="92"><font color="maroon"><b>Reference <a href="reference.cfm">[?]</a> </b></font></td>
	</tr>
	</table>
	
	<cfloop query="qGetAuctionAdmin" startRow="#url.st#" endRow="#variables.endRow#"> <!--- #url.st# #variables.endRow# --->
	
		<!--- Auction Time Remaining --->
		<cfinclude template="/auctions/AuctionTime.cfm" />
		
		<cfif xAuctionEnded>
		
			<cfquery name="qGetAuctionBids" datasource="photoeyecom">
				SELECT Max(bid) as Bid, Count(autoid) as Count 
				FROM AuctionBids 
				WHERE auctionid =  <cfqueryparam value="#auctionid#" cfsqltype="cf_sql_integer">
			</cfquery>
			
			<table width="700" border="0" cellspacing="0" cellpadding="5" align="center">

				<cfif LineCounter>
					<tr bgcolor="##F4F1E1">
				<cfelse>
					<tr bgcolor="white">
				 
				</cfif><td width="50">&nbsp;</td>
				<!--- <cfif BidCounter is 0> --->
				<td align="center" height="50" width="50">
					<cfif FileExists(ExpandPath("/auctions/img/#AuctionID#/large.jpg")) is "Yes">
					<cfset xcatillus = 1>
						<!--- Set defaults for all images --->
						<cfset xPath = "/auctions/img/#AuctionID#">
						<cfset xHeight = "50">	
						<cfset xWidth = "50">
						<cfset xAlt = "Go to this Auction">		
						<!--- xCache is set in Application --->
						<cfset xImage = "large.jpg">
						<cfinclude template="/Templates/ImageSizer.cfm">
						<a href="Citation.cfm?id=#auctionid#"><img src="#xRootCache#/#imagecr.filename#" width="#imagecr.width#" height="#imagecr.height#" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
					<cfelse>
					nope
					</cfif>
				</td>
				<td align="center">
					<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><a href="Citation.cfm?id=#qGetAuctionAdmin.auctionid#">#Title#</a></b></font>
				</td>
				<td align="center" width="110">
					<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
					<cfif qGetAuctionAdmin.PostAuctionSale gt 0> 
						<b>$#Trim(NumberFormat(qGetAuctionAdmin.PostAuctionSale,"999,999"))#</b><br><font size="1"><a href="/auctions/PostAuctionSaleInfo.cfm">Post-Auction Sale</a></font>
					<cfelseif qGetAuctionBids.count is 0 or qGetAuctionBids.Bid lt qGetAuctionAdmin.Reserve>
					<a href="mailto:auctions@photoeye.com?Subject=Post Auction Inquiry for #qGetAuctionAdmin.Title#">Inquire</a> <!--- Still Available --->
					<cfelse>
					<b>$#Trim(NumberFormat(qGetAuctionBids.Bid,"999,999"))#</b></cfif>
					</font>
				</td>
				<td align="center" width="25">
					<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b></b></font> <!--- #qGetAuctionBids.count# --->
				</td>
				<td align="center" width="100">
					<table cellpadding="3" cellspacing="3" border="0" align="center">
					<tr>
						<td align="right">
							<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">#DateFormat(qGetAuctionAdmin.TimeEnd, "m.dd.yyyy")#</font>
						</td>
					</tr>
					</table>
				</td>
				
<td align="center" width="100">
					<table cellpadding="3" cellspacing="3" border="0" align="center">
					<tr>
						<CFSET xreference_qty = 0>
						<td align="left">
							<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
							<CFIF IsDefined("photobook")>
								<cfif photobook is 1> 
									<cfset catalog="PI146">
									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<!--- Set defaults for all images --->
									<cfset xPath = "/img/bigillus">
									<cfset xHeight = "25">	
									<cfset xWidth = "25">

									<cfset xAlt = "The Photo Book">		
									<!--- xCache is set in Application --->
									<cfset xImage = "pi146b.jpg">
									<!---<cfinclude template="../Templates/ImageSizer.cfm">--->
									<cfinclude template="/templates/CreateImageFolders.cfm">
									<a href="/bookstore/mShowDetailsbycat.cfm?Catalog=PI146"><img src="#xImagePath#/PI146_H50xW50.jpg" width="21" height="25" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
									
									
								<!---	 <cfset currentDirectory=ExpandPath("/img/bigillus/")>
		
									
									
									<cfdirectory directory="#currentDirectory#" action="list" name="dirQuery" filter="pi146b.jpg" recurse="no">
								
									<CFIF dirQuery.recordcount gt 0>
										

										<cfset xCat="PI146">
										<cfset xPath="/IMG/P/PI/PI146/">
										
										<cfquery name="qGetInventory" datasource="photoeyecom">
											SELECT * FROM Inventory WHERE CATALOG='#xCat#'
										</cfquery>
										<cfset xcatillus = 1>
										<cfset url.id 	="#auctionid#">
										<cfset xImageAddress=ExpandPath("#xPath#")>
										<cfset xImageNewAddress=ExpandPath("#xPath#")>
										<CFSET xHeight = "25">	
										<CFSET xWidth = "25">
										<CFSET xImage = "#xCat#">
										<cfset xImageFormat = "jpg">
										<cfset xId="Catalog">
										<cfset xDbToUpdate="Inventory">
										<cfset xQueryName="qGetInventory">
										<cfset xAlt = "Book of 101 Books">	
										<CFSET xQueryImageSizeList = "#ImageSizeList#">
										<CFSET xQueryActualImageSizeList = "#ImageActualSizeList#">				
										<cfinclude template="/templates/GetImageInfo.cfm">
								
										<!---<a href="/auctions/#xpage1#?id=#auctionid#">--->
										<img src="#xPath##xBookImage#" width="#xBookWidth#" height="#xBookHeight#" alt="#xAlt#" <CFIF qGetAuctionAdmin.SpineBorder is 1>border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"<CFELSE>border="0"</CFIF>><!---</a>--->
									</cfif>	--->							
									
								</cfif>
							</CFIF>
							<CFIF IsDefined("Book101Books")>
								<cfif Book101Books is 1>
									<cfset catalog="PK676">
									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<!--- Set defaults for all images --->
									<cfset xPath = "/img/bigillus">
									<cfset xHeight = "25">	
									<cfset xWidth = "25">
									<cfset xAlt = "The Book of 101 Books">		
									<!--- xCache is set in Application --->
									<cfset xImage = "pk676b.jpg">
									<!---<cfinclude template="../Templates/ImageSizer.cfm">--->
																										                                    <cfinclude template="/templates/CreateImageFolders.cfm">															
									<a href="/bookstore/mShowDetailsbycat.cfm?Catalog=PK676"><img src="#xImagePath#/PK676_H50xW50.jpg" width="21" height="25" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
								</cfif>
							</cfif>

							<CFIF IsDefined("OpenBook")>
								<cfif OpenBook is 1>
								
									<cfset catalog="ZC553">
									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<!--- Set defaults for all images --->
									<cfset xPath = "/img/bigillus">
									<cfset xHeight = "25">	
									<cfset xWidth = "25">
									<cfset xAlt = "The Open Book">		
									<!--- xCache is set in Application --->
									<cfset xImage = "zc553b.jpg">
<!---									<cfinclude template="../Templates/ImageSizer.cfm">--->
									<cfinclude template="/templates/CreateImageFolders.cfm">
									<a href="/bookstore/mShowDetailsbycat.cfm?Catalog=zc553"><img src="#xImagePath#/ZC553_H50xW50.jpg" width="21" height="25" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
								
								</cfif>
							</cfif>
								
							<CFIF IsDefined("FotografiaPublica")>
								<!--- Make sure that the qty of 3 hasn't been reached --->
								<cfif FotografiaPublica is 1 and  xreference_qty LTE 2>
									<cfset catalog="ZB448">
									<CFSET xreference_qty = xreference_qty+1>
									<cfset xcatillus = 1>
									<!--- Set defaults for all images --->
									<cfset xPath = "/img/bigillus">
									<cfset xHeight = "25">	
									<cfset xWidth = "25">
									<cfset xAlt = "Fotografia Publica">		
									<!--- xCache is set in Application --->
									<cfset xImage = "zb448b.jpg">
									<!---<cfinclude template="../Templates/ImageSizer.cfm">--->
									<cfinclude template="/templates/CreateImageFolders.cfm">
									<a href="/bookstore/mShowDetailsbycat.cfm?Catalog=zb448"><img src="#xImagePath#/ZB448_H50xW50.jpg" width="21" height="25" alt="#xAlt#" border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"></a>
								</cfif>
							</cfif>
							</font>
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
	<hr width="850" size="1">
	</cfloop> <!--- query="qGetAuctionAdmin"--->
	
	<!--- Display Paging Navigation links --->
	<cfset dsp = "Bottom">
	<!---<cfinclude template="/auctions/AuctionFrontPageNav.cfm">	--->
	
	<br>
	<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="3">Return to  <b><a href="/auctions/AuctionFrontPage.cfm?View=CurrentAuctions">Current Auctions</a></b></font>
</cfif>

<br><br>
<!---<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">We'd love to hear about <a href="/auctions/AuctionComments.cfm">your experience</a> with our Auctions. <br></font>--->
</cfoutput>
