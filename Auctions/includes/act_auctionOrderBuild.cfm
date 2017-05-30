<!---
[7/11/13 5:10:50 PM] Rob G: so user wins an auctionÉ we put an entry for it into auctionUser Info...
[7/11/13 5:11:19 PM] Rob G: but then we query auctionOrderInfo looking for an existing entry of his customer number
[7/11/13 5:11:34 PM] Rixon Reed: right
[7/11/13 5:11:45 PM] Rob G: then I'm thining we have to do a compare on the address info to see if it's the same right?
[7/11/13 5:12:08 PM] Rixon Reed: I think there is a custnumber for the bill to and a custnumber for the ship to, isn't there?
[7/11/13 5:12:19 PM] Rixon Reed: you compare both of those to see if they are the same.
[7/11/13 5:12:23 PM] Rob G: yeah
[7/11/13 5:13:00 PM] Rob G: okÉ so let's say we find an entry indicating an existing order
[7/11/13 5:13:09 PM] Rixon Reed: If it exists as the same, then just add the auctionOrderInfo and not an AuctionUserInfo record and use the custnumber from the auctionUserInfo.
--->


<cftry>

	<!--- This value should come from the file including this one. --->
	<cfparam name="qhighbidder.custnumber" default="0">

	<cfset custnumber = qhighbidder.custnumber>

	<cfquery name="qCheckExisting" datasource="#dsn#">
	select custNumber
	FROM auctionOrderInfo
	WHERE Custnumber = <cfqueryparam value="#custNumber#" cfsqltype="cf_sql_integer">
	</cfquery>

	<cftransaction>

		<cfif qCheckExisting.recordcount eq 0>

			<cfquery name="qMailing" datasource="#dsn#">
			SELECT address1, address2, altnum, city, comment, company, country, custnumber, datechanged,
			deleteaddress, email, emailnewsletter, exempt, extension, extension2, firstname, hint,
			lastname, norent, password, paymentmethod, phone, phone2, plaintextversion, shipvia, showcase,
			specialinstructions, state, title, tpshipacct, username, zip
			FROM mailinglist_om
			WHERE Custnumber = <cfqueryparam value="#custNumber#" cfsqltype="cf_sql_integer">
			</cfquery>

			<cfquery name="qAddress" datasource="#dsn#">
			select *
			from addressBook
			WHERE Custnumber = <cfqueryparam value="#custNumber#" cfsqltype="cf_sql_integer">
			and DefaultAddress_S = 'true'
			</cfquery>

			<cfset ship = StructNew()>

			<cfif qAddress.recordcount eq 0>

				<cfquery name="qAddress" datasource="#dsn#">
				select *
				from addressBook
				WHERE Custnumber = <cfqueryparam value="#custNumber#" cfsqltype="cf_sql_integer">
				</cfquery>

				<cfif qAddress.recordcount eq 0>

					<cfoutput query="qMailing">
						<cfset ship.firstname = Trim(firstname)>
						<cfset ship.lastname = Trim(lastname)>
						<cfset ship.address1 = Trim(address1)>
						<cfset ship.address2 = Trim(address2)>
						<cfset ship.city = Trim(city)>
						<cfset ship.state = Trim(state)>
						<cfset ship.zip = Trim(zip)>
						<cfset ship.country = Trim(country)>
						<cfset ship.email = Trim(email)>
						<cfset ship.phone = Trim(phone)>
						<cfset ship.phone2 = Trim(phone2)>
						<cfset ship.company = Trim(company)>
						<cfset ship.title = Trim(title)>
					</cfoutput>

				</cfif>

			</cfif>

			<cfoutput query="qAddress">
				<cfset ship.firstname = Trim(firstname)>
				<cfset ship.lastname = Trim(lastname)>
				<cfset ship.address1 = Trim(address1)>
				<cfset ship.address2 = Trim(address2)>
				<cfset ship.city = Trim(city)>
				<cfset ship.state = Trim(state)>
				<cfset ship.zip = Trim(zip)>
				<cfset ship.country = Trim(country)>
				<cfset ship.email = Trim(email)>
				<cfset ship.phone = Trim(phone)>
				<cfset ship.phone2 = Trim(phone2)>
				<cfset ship.company = Trim(company)>
				<cfset ship.title = Trim(title)>
			</cfoutput>

			<cfquery name="qAuctionUserInfoInsert" datasource="#dsn#">
			insert into AuctionUserInfo (address1, address2, altnum, city, comment, company, country, custnumber, datechanged,
			deleteaddress, email, emailnewsletter, exempt, extension, extension2, firstname, hint,
			lastname, norent, password, paymentmethod, phone, phone2, plaintextversion, shipvia, showcase,
			specialinstructions, state, title, tpshipacct, username, zip,
			ship_firstname, ship_lastname, ship_company, ship_1address, ship_2address, ship_city, ship_state, ship_zip, ship_country, ship_email, ship_phone, ship_phone2, ship_title
			)
			values (
					<cfqueryparam value="#Trim(qMailing.address1)#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Trim(qMailing.address2)#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Trim(qMailing.altnum)#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Trim(qMailing.city)#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Trim(qMailing.comment)#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Trim(qMailing.company)#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Trim(qMailing.country)#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Trim(qMailing.custnumber)#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Trim(qMailing.datechanged)#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Trim(qMailing.deleteaddress)#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Trim(qMailing.email)#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Trim(qMailing.emailnewsletter)#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Trim(qMailing.exempt)#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Trim(qMailing.extension)#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Trim(qMailing.extension2)#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Trim(qMailing.firstname)#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Trim(qMailing.hint)#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Trim(qMailing.lastname)#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Trim(qMailing.norent)#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Trim(qMailing.password)#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Trim(qMailing.paymentmethod)#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Trim(qMailing.phone)#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Trim(qMailing.phone2)#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Trim(qMailing.plaintextversion)#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Trim(qMailing.shipvia)#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Trim(qMailing.showcase)#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Trim(qMailing.specialinstructions)#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Trim(qMailing.state)#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Trim(qMailing.title)#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Trim(qMailing.tpshipacct)#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Trim(qMailing.username)#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Trim(qMailing.zip)#" cfsqltype="cf_sql_varchar">,
			 		<cfqueryparam value="#Left(ship.firstname, 15)#" maxlength="15" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Left(ship.lastname, 20)#" maxlength="20" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Left(ship.company, 40)#" maxlength="40" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Left(ship.address1, 40)#" maxlength="40" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Left(ship.address2, 40)#" maxlength="40" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Left(ship.city, 20)#" maxlength="20" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Left(ship.state, 3)#" maxlength="3" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Left(ship.zip, 10)#" maxlength="10" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Left(ship.country, 3)#" maxlength="3" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Left(ship.email, 50)#" maxlength="50" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Left(ship.phone, 14)#" maxlength="14" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Left(ship.phone2, 14)#" maxlength="14" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#Left(ship.title, 40)#" maxlength="40" cfsqltype="cf_sql_varchar">
			)
			</cfquery>

		</cfif>


		<cfquery name="qAuctionAdmin" datasource="#dsn#">
		select auctionid, catnum, title
		from auctionadmin
		WHERE winnercustnum = <cfqueryparam value="#custNumber#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cfquery name="qSalePrice" datasource="#dsn#">
		select max(bid) as saleprice
		from auctionbids
		WHERE Custnumber = <cfqueryparam value="#custNumber#" cfsqltype="cf_sql_integer">
		and auctionid = <cfqueryparam value="#qAuctionAdmin.auctionid#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cfif Trim(ship.state) eq "NM">
			<cfquery name="qTax" datasource="#dsn#" cachedwithin="#CreateTimeSpan(0,1,0,0)#">
			select salesTax
			from globalVars
			</cfquery>

			<cfset saleprice = qTax.salestax * 100 * saleprice>

		<cfelse>
			<cfset saleprice = qSaleprice.saleprice>
		</cfif>

		<cfquery name="qSec" datasource="#dsn#">
		select max(orderid) as seq
		from auctionorderinfo
		</cfquery>

		<cfif NOT IsNumeric(qSec.seq)>
			<cfset seq = 10000>
		<cfelse>
			<cfset seq = qSec.seq>
		</cfif>

		<cfquery name="InsertOrder" datasource="#dsn#">
		insert into auctionorderinfo (orderid, catnum, custnumber, number, saleprice, listprice, title, numcopies, removeItem)
		values (
			<cfqueryparam value="#seq#" cfsqltype="cf_sql_integer">,
			<cfqueryparam value="#qAuctionAdmin.catnum#" cfsqltype="cf_sql_varchar">,
			<cfqueryparam value="#custnumber#" cfsqltype="cf_sql_varchar">,
			<cfqueryparam value="#qAuctionAdmin.auctionid#" cfsqltype="cf_sql_varchar">,
			<cfqueryparam value="#saleprice#" cfsqltype="cf_sql_varchar">,
			<cfqueryparam value="#saleprice#" cfsqltype="cf_sql_varchar">,
			<cfqueryparam value="#Left(qAuctionAdmin.title, 40)#" cfsqltype="cf_sql_varchar">,
			1,
			0
		)
		</cfquery>

		<cftransaction action="rollback" />

	</cftransaction>

	<cfcatch type="any">
		<cfdump var="#cfcatch#">
		<cfabort>
	</cfcatch>

</cftry>
