<!--- Submits Transaction to Itransact for payment processing --->
<cfhttp url="https://secure.paymentclearing.com/cgi-bin/rc/ord.cgi" 
		method="post" 
		timeout="240">
	
	<!--- Standard Fields --->
	<cfhttpparam type="FORMFIELD" name="vendor_id" value="#attributes.gatewayID#">
	<cfhttpparam type="FORMFIELD" name="home_page" value="#attributes.domain#">
	<cfhttpparam type="FORMFIELD" name="ret_addr"  value="https://secure.itransact.com/cgi-bin/mas/nvpairs.cgi">
	<cfhttpparam type="FORMFIELD" name="ret_mode" value="post">
	<cfhttpparam type="FORMFIELD" name="lookup" value="xid">
	<cfhttpparam type="FORMFIELD" name="lookup" value="when">	
	
	<!--- Re-occurring Fields --->
	<cfif IsDefined("attributes.ReRecipe") AND attributes.ReRecipe NEQ "">
		<cfhttpparam type="FORMFIELD" name="recur_recipe" value="#attributes.ReRecipe#">	
		<cfhttpparam type="FORMFIELD" name="recur_reps" value="#attributes.ReReps#">	
		<cfhttpparam type="FORMFIELD" name="recur_total" value="#attributes.ReTotal#">	
		<cfhttpparam type="FORMFIELD" name="recur_desc" value="#attributes.ReDescription#">	
	</cfif>
	
	<!--- Credit Card Fields --->
	<cfhttpparam type="FORMFIELD" name="ccnum" value="#attributes.cardnumber#">
	<cfhttpparam type="FORMFIELD" name="ccmo" value="#monthasstring(attributes.cardmonth)#">
	<cfhttpparam type="FORMFIELD" name="ccyr" value="#attributes.cardyear#">	
	<cfif IsDefined("attributes.cardsecuritycode")>
		<cfhttpparam type="FORMFIELD" name="cvv2number" value="#attributes.cardsecuritycode#">	
	</cfif>

	<!--- BILLING ADDRESS --->
	<cfhttpparam type="FORMFIELD" name="first_name" value="#attributes.firstname#">
	<cfhttpparam type="FORMFIELD" name="last_name" value="#attributes.lastname#">
	<cfif attributes.address2 EQ "">
		<cfhttpparam type="FORMFIELD" name="address" value="#attributes.address#">
	<cfelse>
		<cfhttpparam type="FORMFIELD" name="address" value="#attributes.address# #attributes.address2#">
	</cfif>	
	<cfhttpparam type="FORMFIELD" name="city" value="#attributes.city#">
	<cfhttpparam type="FORMFIELD" name="state" value="#attributes.state#">
	<cfhttpparam type="FORMFIELD" name="zip" value="#attributes.zip#">
	<cfhttpparam type="FORMFIELD" name="country" value="#attributes.country#">
	<cfhttpparam type="FORMFIELD" name="email" value="#attributes.email#">
	<cfhttpparam type="FORMFIELD" name="phone" value="#attributes.phone#">
	
	<!--- SHIPPING ADDRESS --->
	<cfif IsDefined("attributes.ShipFirstName")>		
		<cfhttpparam type="FORMFIELD" name="sfname" value="#attributes.shipfirstname#">
		<cfhttpparam type="FORMFIELD" name="slname" value="#attributes.shiplastname#">		
		<cfif attributes.shipaddress2 EQ "">
			<cfhttpparam type="FORMFIELD" name="saddr" value="#attributes.shipaddress#">
		<cfelse>
			<cfhttpparam type="FORMFIELD" name="saddr" value="#attributes.shipaddress# #attributes.shipaddress2#">
		</cfif>	
		<cfhttpparam type="FORMFIELD" name="scity" value="#attributes.shipcity#">
		<cfhttpparam type="FORMFIELD" name="sstate" value="#attributes.shipstate#">
		<cfhttpparam type="FORMFIELD" name="szip" value="#attributes.shipzip#">
		<cfhttpparam type="FORMFIELD" name="sctry" value="#attributes.shipcountry#">
	</cfif>
	
	<!--- LOOP THROUGH Products --->
	<cfloop from="1" to="#ListLen(attributes.ProductCodes, "~")#" index="i">
		<cfhttpparam type="FORMFIELD" name="item_#i#_code" value="#ListGetAt(attributes.productcodes, i, "~")#">
		<cfhttpparam type="FORMFIELD" name="item_#i#_desc"  value="#ListGetAt(attributes.productnames, i, "~")#">
		<cfhttpparam type="FORMFIELD" name="item_#i#_qty" value="#ListGetAt(attributes.productqty, i, "~")#">		
		<cfhttpparam type="FORMFIELD" name="item_#i#_cost" value="#Replace(Replace(Dollarformat(ListGetAt(attributes.productcosts, i, "~")), "$", "", "ALL"), ",", "", "ALL")#">
	</cfloop>

</cfhttp>

<cfset application.last_transact_req = attributes />
<cfset application.last_transact_res = cfhttp />
	
<!--- CHECK TO SEE IF THERE IS A XID FOR A SUCCESSFUL ORDER--->
<cfif Left(cfhttp.filecontent, 3) IS "xid">

	<!--- Good Transaction --->
	<cfset EcommerceTransaction = structnew()>
	<cfset EcommerceTransaction.Status = 1>
	<cfset EcommerceTransaction.xid = Trim(ListLast(ListGetAt(cfhttp.filecontent, 1, "&"), "="))>
	<cfset EcommerceTransaction.when = Trim(ListLast(ListGetAt(cfhttp.filecontent, 2, "&"), "="))>
	
<cfelse>

	<!--- FAILED TRANSACTION --->
	<cfset EcommerceTransaction = structnew()>
	<cfset EcommerceTransaction.Status = 0>
	<cfset EcommerceTransaction.Message = "">
	<cfset EcommerceTransaction.RawData = Trim(cfhttp.filecontent)>

	<!--- Determine Error Message --->	
	
	<!--- Check for possible bad error --->
	<cfif NOT FindNoCase("<b>", cfhttp.filecontent) OR NOT FindNoCase("</B>", cfhttp.filecontent)>
		<cfset EcommerceTransaction.Message = Trim(cfhttp.filecontent)>	
	</cfif>	
	
	<!--- Standard Failure --->	
	<cfif EcommerceTransaction.Message EQ "">
		<cfset ErrorDescriptionStart = FindNoCase("BEGIN ERROR DESCRIPTION", cfhttp.filecontent)>
		<cfset ErrorStart = FindNoCase("<b>", cfhttp.filecontent, ErrorDescriptionStart) + 3>
		<cfif ErrorStart>					
			<cfset ErrorCount = (FindNoCase("</B>", cfhttp.filecontent, ErrorStart)) - ErrorStart>
			<cfset EcommerceTransaction.Message = Mid(cfhttp.filecontent, ErrorStart, ErrorCount)>
		<cfelse>
			<!--- FRONT END ITRANSACT ERROR --->
			<cfset EcommerceTransaction.Message = "There was an error processing your order.  Please try again later.">		
		</cfif>
	</cfif>
	
</cfif>

<!--- Return Ecommerce Information --->
<cfset caller.EcommerceTransaction = EcommerceTransaction>