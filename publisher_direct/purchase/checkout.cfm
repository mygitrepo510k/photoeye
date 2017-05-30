<!--- <cfdump var="#form#" /> --->
<cftry>
	<cfif NOT Len(FORM.firstname)>
		<cfset pdError('firstname','Please enter your firstname') />
	</cfif>
	<cfif NOT Len(FORM.lastname)>
		<cfset pdError('lastname','Please enter your lastname') />
	</cfif>
	<cfif NOT Len(FORM.address1)>
		<cfset pdError('address1','Please enter your address') />
	</cfif>
	<cfif NOT Len(FORM.city)>
		<cfset pdError('city','Please enter your city') />
	</cfif>
	<cfif NOT Len(FORM.zip)>
		<cfset pdError('zip','Please enter your zip code') />
	</cfif>
	<cfif NOT Len(FORM.country)>
		<cfset pdError('country','Please select your country') />
	</cfif>
	<cfif NOT Len(FORM.phone)>
		<cfset pdError('phone','Please enter your phone number') />
	</cfif>
	
	<cfif NOT Len(FORM.cardnumber)>
		<cfset pdError('cardnumber','Please enter your credit card number') />
	</cfif>
	<cfif NOT Len(FORM.cardmonth)>
		<cfset pdError('cardmonth','Please select your credit card expiration month') />
	</cfif>
	<cfif NOT Len(FORM.cardyear)>
		<cfset pdError('cardyear','Please enter your credit card expiration year') />
	</cfif>
	<cfif NOT Len(FORM.securitycode)>
		<cfset pdError('securitycode','Please enter your credit card security code (CID)') />
	</cfif>
	
	<cfif NOT StructKeyExists(FORM,'TOS_done')>
		<cfif NOT StructKeyExists(FORM,'TOS_Agree') OR FORM.TOS_Agree NEQ 1>
			<cfset pdError('TOS_Agree','Please read and agree to the Terms of Service') />
		</cfif>
		<cfif NOT StructKeyExists(FORM,'TOS_Initials') OR NOT Len(FORM.TOS_Initials)>
			<cfset pdError('TOS_Agree','Please include your initials to agree to the Terms of Service') />
		<cfelseif Len(FORM.TOS_Initials) GT 4>
			<cfset pdError('TOS_Agree','Please limit your initials to 4 characters.') />
		</cfif>
	</cfif>
	
	<cfif isDefined("_errors")>
		<cfinclude template="confirmation.cfm" /><cfabort />
	</cfif>
	
	<!--- Set active token --->
	<cflock type="readOnly" scope="Session" timeout="5">
		<cfset activeToken = SESSION.publisher_direct_redeeming_token />
	</cflock>
	
	<!--- Get token data --->
	<cfquery name="qToken" dataSource="#application.dsn#">
		SELECT * FROM publisher_direct_token
		WHERE publisher_direct_id = #request.qPD_user.id#
		AND token = '#activeToken#'
	</cfquery>
	
	<!--- set prices --->
	<cfset prices = application.PD_prices[qToken.service_level] />
	
	<cfif qToken.qty GT 0>
		<cfset totalSetupPrice = qToken.qty*prices.setup />
		<cfset totalBookPrice = qToken.qty*prices.initial_book />
	</cfif>
	
	<cfset setup_total = totalSetupPrice />
	<cfset book_total = totalBookPrice />
	<cfset booktease_total = FORM.booktease_qty*prices.booktease />
	<cfset booktease_reduced_total = FORM.booktease_reduced_qty*prices.booktease_reduced />
	
	<!--- Setup Reoccurring --->
	<cfset ReRecipe="Annual">
	<cfset ReDescription="photo-eye Publisher Direct Annual Listing Fee">
	<cfset Expiration = DateAdd("yyyy", 1, now())>
	<cfset ReReps="9999">
	<cfset ReTotal="#book_total#">
	
	<cfset services = StructNew() />
	<cfset services.servicecode = ArrayNew(1) />
	<cfset services.servicename = ArrayNew(1) />
	<cfset services.qty = ArrayNew(1) />
	<cfset services.amount = ArrayNew(1) />
	
	<cfset ArrayAppend(services.servicecode,'(ABK-#Left(qToken.service_level,1)#)') />
	<cfset ArrayAppend(services.servicename,'Publisher Direct Marketing Fees') />
	<cfset ArrayAppend(services.qty,FORM.book_qty) />
	<cfset ArrayAppend(services.amount,prices.setup) />	
	
	<cfset ArrayAppend(services.servicecode,'(ABK-#Left(qToken.service_level,1)#)') />
	<cfset ArrayAppend(services.servicename,'Publisher Direct Books') />
	<cfset ArrayAppend(services.qty,FORM.book_qty) />
	<cfset ArrayAppend(services.amount,prices.initial_book) />	
	
	
	<cfif FORM.booktease_qty GT 0>
		<cfset ArrayAppend(services.servicecode,'(BKT-#Left(qToken.service_level,1)#)') />
		<cfset ArrayAppend(services.servicename,'Full-Service Booktease Production') />
		<cfset ArrayAppend(services.qty,FORM.booktease_qty) />
		<cfset ArrayAppend(services.amount,prices.booktease) />
	</cfif>
	
	<cfif FORM.booktease_reduced_qty GT 0>
		<cfset ArrayAppend(services.servicecode,'(BKTR-#Left(qToken.service_level,1)#)') />
		<cfset ArrayAppend(services.servicename,'User-Supplied Booktease Production') />
		<cfset ArrayAppend(services.qty,FORM.booktease_reduced_qty) />
		<cfset ArrayAppend(services.amount,prices.booktease_reduced) />
	</cfif>
	
	
	<cfif application.env.production>
		<!--- Live --->

		<!--- <cfset gatewayID = "Wj2ySKgVC26P736zB3Xx" /> old VS gateway --->
		<!--- <cfset gatewayID = "83346" /> DE updated 04-17-2012 -- new PD dedicated iTransact gateway (why a different number format?) --->
		<!--- DE 5/7/12 
		 ! 	Apparently what we were calling a gatewayID in this code, is what iTransact refers to as a UID.  
		 !  A gatewayID is something else, and that's the 83346 number above.
		 !--->

		<cfset gatewayID = "w9Z4yeN5jjGGVTQK6T" />

	<cfelse>
		<!--- Testing --->
		<cfset gatewayID = "57269" />
	</cfif>
	
	<cfmodule template="includes/Ecommerce_Transaction.cfm"
		GatewayID="#gatewayID#"
		Domain="photoeye.com"
		CardNumber="#form.CardNumber#"
		CardMonth="#form.CardMonth#"
		CardYear="#form.CardYear#"
		CardSecurityCode="#form.securitycode#"
		Phone="#form.Phone#"
		Email="#request.qPD_user.email#"
		Firstname="#form.firstname#"
		Lastname="#form.lastname#"
		Address="#form.address1#"
		Address2="#form.address2#"
		City="#form.city#"
		State="#form.state#"
		Zip="#form.zip#"
		Country="#form.Country#"
		ProductCodes="#ArraytoList(services.servicecode, "~")#"
		ProductNames="#ArraytoList(services.servicename, "~")#"
		ProductQty="#ArraytoList(services.qty, "~")#"
		ProductCosts="#ArraytoList(services.amount, "~")#"
		ReRecipe="#ReRecipe#"
		ReReps="#ReReps#"
		ReDescription="#ReDescription#"
		ReTotal="#ReTotal#"
	>	 
	
	<!--- If payment fails, alert user --->
	<cfif NOT EcommerceTransaction.Status>
		
		<!--- Alert User	 --->	
		<cfset pdError('transaction','Transaction error: #EcommerceTransaction.Message#') />
		<cfinclude template="confirmation.cfm" /><cfabort />
		
	<!--- If successful, update IPI table, create VS accounts and show landing page --->
	<cfelse>
		Payment Successful!<br /><br />
		
		<!--- update billing information in database --->
		<cfquery name="qUpdateAccountInfo" datasource="#application.dsn#">
			UPDATE publisher_direct_accounts
			SET firstname = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#FORM.firstname#" />
				, lastname = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#FORM.lastname#" />
				, company = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#FORM.company#" />
				, address1 = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#FORM.address1#" />
				, address2 = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#FORM.address2#" />
				, city = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#FORM.city#" />
				, state = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#FORM.state#" />
				, zip = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#FORM.zip#" />
				, country = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#FORM.country#" />
				, phone = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#FORM.phone#" />
				, phone2 = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#FORM.phone2#" />
				<cfif NOT StructKeyExists(FORM,'TOS_Done')>
					, TOS_Agree = 1
					, TOS_Initials = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#FORM.TOS_Initials#" maxLength="4" />
				</cfif>
			WHERE id = #request.qPD_User.id#
		</cfquery>
		
		<cfquery name="qLastCatnum" dataSource="#application.dsn#">
			SELECT TOP 1 catalog, subject FROM inventory
			WHERE catalog LIKE 'I%'
			AND subject = 'PUBLISHER DIRECT'
			ORDER BY catalog DESC 
		</cfquery>
		<cfif qLastCatnum.recordcount>
			<cfset newCatNum = "I"&(Right(qLastCatnum.catalog,4)+1) />
		<cfelse>
			<cfset newCatNum = "I1000" />
		</cfif>
		<cfset insertedCatNums = "" />
		<cftransaction>
			<cfloop from="1" to="#FORM.book_qty#" index="i">
				<cfset ListAppend(insertedCatNums,newCatNum) />
				INSERTING INVENTORY
				<cfquery name="qCreateInventoryItem" dataSource="#application.dsn#">
					INSERT INTO inventory (catalog, subject, subjectx) VALUES ('#newCatNum#','PUBLISHER DIRECT','DIRECT, PUBLISHER')
				</cfquery>
				INSERTING PD_CAT
				<cfquery name="qCreateLinkInPD" dataSource="#application.dsn#">
					INSERT INTO publisher_direct_catalog (publisher_direct_id,catalog,purchase_date,purchase_token,page_views) 
					VALUES ('#request.qPD_user.id#','#newCatNum#',#CreateODBCDateTime(Now())#,'#activeToken#',0)
				</cfquery>
				<cfset newCatNum = "I"&(Right(newCatNum,4)+1) />		
			</cfloop>
	
			<!--- redeem token --->
			UPDATING TOKEN
			<cfquery name="qRedeemToken" dataSource="#application.dsn#">
				UPDATE publisher_direct_token
				SET redeemed = 1,
					redeemed_at = #CreateODBCDateTime(Now())#,
					cc_type = #Left(trim(form.CardNumber),1)#,
					cc_last_four = #Right(trim(form.CardNumber),4)#,
					cc_expire = '#Trim(form.CardMonth)#/#Trim(Right(form.CardYear,2))#'
				WHERE token = '#activeToken#'
					AND publisher_direct_id = #request.qPD_user.id#
			</cfquery>
	
			<cflock scope="Session" type="exclusive" timeout="5">
				<cfset StructDelete(SESSION,'publisher_direct_redeeming_token') />
			</cflock>
	
		</cftransaction>
				
		<!--- email admin --->
		<cfmail to="#application.admin_email#" from="publisher_direct@photoeye.com" subject="New publisher direct created! (books: #FORM.book_qty#, bookteases: #FORM.booktease_qty#, reduced_booktease: #FORM.booktease_reduced_qty#)">
			New books have been added!
			
			#insertedCatNums#
			<cfif FORM.booktease_qty GT 0>
				#FORM.booktease_qty# booktease(s) were also purchased.
			</cfif>
			<cfif FORM.booktease_reduced_qty GT 0>
				#FORM.booktease_qty# reduced booktease(s) were also purchased.
			</cfif>
	
			By #FORM.firstname# #FORM.lastname# (#request.qPD_user.id#)
		</cfmail>
		
		<!--- forward user to catalog index --->
		<cflocation url="/#application.root#/catalog" addToken="no" />
		
		<!---
			<style>
				pre { background: #444; color: #ffb266; padding: 50px;}
				pre a { color: #ffb266; }
			</style>
		
			<pre>
				<cfoutput>			
					GatewayID="#gatewayID#"
					Domain="visualserver.com"
					CardNumber="#form.CardNumber#"
					CardMonth="#form.CardMonth#"
					CardYear="#form.CardYear#"
					CardSecurityCode="#form.securitycode#"
					Phone="#form.Phone#"
					Email="#request.qPD_user.email#"
					Firstname="#form.firstname#"
					Lastname="#form.lastname#"
					Address="#form.address1#"
					Address2="#form.address2#"
					City="#form.city#"
					State="#form.state#"
					Zip="#form.zip#"
					Country="#form.Country#"
					ProductCodes="#ArraytoList(services.servicecode, "~")#"
					ProductNames="#ArraytoList(services.servicename, "~")#"
					ProductQty="#ArraytoList(services.qty, "~")#"
					ProductCosts="#ArraytoList(services.amount, "~")#"
					ReRecipe="#ReRecipe#"
					ReReps="#ReReps#"
					ReDescription="#ReDescription#"
					ReTotal="#ReTotal#"
				</cfoutput>
			</pre>
		--->
	
	</cfif>
<cfcatch>
	<cfmail from="publisherdirect@photoeye.com" to="rixon@photoeye.com" cc="daniel@danielespeset.com" subject="URGENT: Publisher Direct checkout failure." type="html">
		The publisher direct checkout page has failed:<br /><br />
		
		<h1>CFCATCH</h1>
		<cfdump var="#cfcatch#" />
		<h1>FORM</h1>
		<cfif IsDefined('FORM.CardNumber')>
			<cfset FORM.CardNumber = "************#Right(FORM.CardNumber,4)#" />
		</cfif>
		<cfdump var="#FORM#" />
		<h1>SESSION</h1>
		<cflock type="readOnly" scope="Session" timeout="5">
			<cfdump var="#SESSION#" />
		</cflock>
	</cfmail>
	<cflocation url="/#application.root#/purchase/uhoh.cfm" addToken="no" />
</cfcatch>
</cftry>