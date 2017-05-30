<cfsetting requestTimeout="1000">
<cftry>

<cflock type="exclusive" TIMEOUT="100">
 
 <cfindex collection = "auctionslive5"
	  action = "purge"
	>
	
<!--- Get all current auctions --->
   <cfquery name="qGetLiveAuctions2" datasource="photoeyecom">
	SELECT *
	FROM AuctionAdmin a
	WHERE publish = 1 
	AND endannounced = 0
	ORDER BY EndAnnounced, TimeEnd
</cfquery>


<cfif qGetLiveAuctions2.recordCount>
	<!--- purge collection --->
	
	<!--- <cfindex collection = "auctionslive2"
	  action = "purge"
	>--->
	<cfindex collection = "auctionslive5"
	  action = "refresh"
	  type = "custom"
	  key = "auctionID"
	  body = "title"
	  query = "qGetLiveAuctions2"
	>
	
	
	<!--- Search auctionslive  --->
	<cfsearch name="search2" 
		collection="auctionslive5" 
		criteria="*"
	>	
	
	<cfoutput>Liveauctions: #search2.RECORDCOUNT#</cfoutput>
</cfif>

</cflock>


<cfcatch>

	qGetLiveAuctions5 is corrupted
<cfmail to="rixon@photoeye.com" from="rixon@photoeye.com" subject="AuctionCollections Corrupted">
xxx	qGetLiveAuctions5 is corrupted
</cfmail>
</cfcatch>

</cftry>
 
 
<cftry>

<cflock type="exclusive" TIMEOUT="100">

<cfindex collection = "auctionsavailable2"
	  action = "purge"
	>
<!--- Query for All items available for Post-Auction Sale--->
<cfquery name="qGetPostSaleAuctions" datasource="photoeyecom">
	SELECT *
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

<!---<cfoutput>postauctionsales: #qGetPostSaleAuctions.recordCount#</cfoutput>--->

<cfif qGetPostSaleAuctions.recordCount>
	<!--- purge collection --->
	
<!---	<cfindex collection = "auctionsavailable3"
	  action = "purge"
	> --->
	<!--- reindex collection --->
	<cfindex collection = "auctionsavailable2"
	  action = "refresh"
	  type = "custom"
	  key = "auctionID"
	  body = "title"
	  query = "qGetPostSaleAuctions"
	>
	
		<!--- Search closed auctions --->
	<cfsearch name="stillAvailableAuctions" 
		collection="auctionsavailable2" 
		criteria="*"
	>	
	 
	<cfoutput>postauctionsales:  #stillAvailableAuctions.recordcount#</cfoutput>
</cfif>

</cflock>

<cfcatch>
auctionsavailable2 is corrupted
<cfmail to="rixon@photoeye.com" from="rixon@photoeye.com" subject="AuctionCollections Corrupted">
	auctionsavailable2 is corrupted
</cfmail>
</cfcatch>



</cftry>

<cftry>

<cflock type="exclusive" TIMEOUT="100">
	<cfindex collection = "auctionsclosed11"
	  action = "purge"
	> 
<!--- Get ended auctions --->
<cfquery name="qGetEndedAuctions" datasource="photoeyecom">
	SELECT *
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

<!--- <cfoutput>closed auctions: #qGetEndedAuctions.recordCount#</cfoutput> --->

<cfif qGetEndedAuctions.recordCount>
	<!--- purge collection --->
	<!--- <cfindex collection = "auctionsclosed11"
	  action = "purge"
	>  --->
	<!--- reindex collection --->
	<cfindex collection = "auctionsclosed11"
	  action = "update"
	  type = "custom"
	  key = "auctionID"
	  body = "title"
	  query = "qGetEndedAuctions"
	>
		<!--- Search closed auctions --->
	<cfsearch name="search3" 
		collection="auctionsclosed11" 
		criteria="*"
	>
	
	<cfoutput>closed auctions: #search3.recordcount#</cfoutput>
</cfif>

</cflock>

<cfcatch>
auctionsclosed11 is corrupted
<cfmail to="rixon@photoeye.com" from="rixon@photoeye.com" subject="AuctionCollections Corrupted">
	auctionsclosed11 is corrupted
</cfmail>
</cfcatch>

</cftry>  
	 