<!--- update billing information in database --->

<!--- 	, company = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#FORM.company#" />
		, address1 = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#FORM.address1#" />
		, address2 = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#FORM.address2#" />
		, city = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#FORM.city#" />
		, state = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#FORM.state#" />
		, zip = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#FORM.zip#" />
		, country = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#FORM.country#" />
		, phone = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#FORM.phone#" />
		, phone2 = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#FORM.phone2#" /> 
--->
<cfif StructKeyExists(FORM,'token') AND StructKeyExists(FORM,'user_id')>
	<cfset activeToken = FORM.token />
	
	<cfquery name="qCurrentToken" dataSource="#application.dsn#">
		SELECT * FROM publisher_direct_token
		WHERE token = '#activeToken#'
	</cfquery>
	
	<cfset FORM.book_qty = qCurrentToken.qty />
	
	<cfif qCurrentToken.redeemed>
		Token marked as redeemed, canceling.<cfabort />
	</cfif>
			
	<cfquery name="qUpdateAccountInfo" datasource="#application.dsn#">
		UPDATE publisher_direct_accounts
		SET firstname = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#FORM.firstname#" />
			, lastname = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#FORM.lastname#" />
			, TOS_Agree = 1
			, TOS_Initials = 'XX'
		WHERE id = <cfqueryparam CFSQLType="CF_SQL_NUMERIC" value="#FORM.user_id#" />
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
				VALUES (<cfqueryparam CFSQLType="CF_SQL_NUMERIC" value="#FORM.user_id#" />,'#newCatNum#',#CreateODBCDateTime(Now())#,'#activeToken#',0)
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
				AND publisher_direct_id = <cfqueryparam CFSQLType="CF_SQL_NUMERIC" value="#FORM.user_id#" />
		</cfquery>
	
<!---
		<cflock scope="Session" type="exclusive" timeout="5">
			<cfset StructDelete(SESSION,'publisher_direct_redeeming_token') />
		</cflock>
--->
	
	</cftransaction>
	SUCCESS!
<cfelse>
	<style>
		label { display: block; }
	</style>
	<form method="post" action="#CGI.script_name#">
		<label>firstname</label>
		<input type="text" name="firstname" value="" />
		<label>lastname</label>
		<input type="text" name="lastname" value="" />
		<label>PD User ID</label>
		<input type="text" name="user_id" value="" />
		<label>Token</label>
		<input type="text" name="token" value="" />
		<label>Card Exp. Month</label>
		<input type="text" name="cardMonth" value="" />
		<label>Card Exp. Year</label>
		<input type="text" name="cardYear" value="" />
		<label>Card Number (5 digits, first+last4)</label>
		<input type="text" name="cardNumber" value="" />
		<label>&nbsp;</label>
		<input type="submit" value="Save & Create Books" />
	</form>
</cfif>


<!--- email admin --->
<!---
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
--->
