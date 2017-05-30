<!---
https://www.photoeye.com/auctions/includes/dsp_auctionConfirmOrderInfo.cfm

7/6/2013	Created by RobG
 --->

<cftry>

	<cfparam name="xShowHeader" default="1">
	<cfparam name="xShowFooter" default="1">
	<cfparam name="url.auctionConfirm" default="1">

	<cfset xThisPageMenu = 1>
	<!--- Force Log In --->
	<cfinclude template="/templates/ForceLogIn.cfm">

	<cfparam name="url.Auction" DEFAULT="0">
	<cfparam name="url.StockChanged" DEFAULT="0">
	<cfparam name="xTotalBackordered" DEFAULT="0">
	<cfparam name="xTotalAvailable" DEFAULT="0">
	<cfparam name="form.shippingtotal" DEFAULT="">
	<cfparam name="url.rs" DEFAULT=0>
	<cfparam name="form.DefaultShippingMethod" DEFAULT=0>
	<cfparam name="xshippingrate" DEFAULT="0">
	<cfparam name="YINSURANCETOTAL" DEFAULT="0">
	<cfparam name="form.shippingchoice" DEFAULT="">
	<cfparam name="form.TPShipAcct" DEFAULT="">
	<cfparam name="xOnlineOrderNum" DEFAULT="0">
	<cfparam name="xErrorMessage" DEFAULT="">
	<cfparam name="xMomShipping" DEFAULT="">
	<cfparam name="xStringEnd" DEFAULT="1">
	<cfparam name="Session.SecurityCode" DEFAULT="">
	<cfparam name="form.xPrevDefault" default = 0>
	<cfparam name="qGetShipping.autoid" default = 0>

	<cfif xShowHeader is 1>
		<cfinclude template="/templates/includes/dsp_account_index_top.cfm">
	</cfif>

	<cfquery name="qGetCustomerAccount"  DATASOURCE="photoeyecom">
	SELECT *
	FROM MailingList_OM
	WHERE Custnumber = <cfqueryparam value="#Session.AcctID#" cfsqltype="cf_sql_integer">
	</cfquery>

	<cfquery name="qGetCreditCards" datasource="photoeyecom">
	SELECT AUTOID, TABLEID, CUSTNUMBER AS CUSTNUM, CARDDEFAULT, CARDNUM, EXP, CARDHOLDER, CC_CID
	FROM CreditCardsAdditional
	WHERE custnumber = <cfqueryparam value="#qGetCustomerAccount.Custnumber#" cfsqltype="cf_sql_integer">
	and exp <> ''
	and CardDefault = 1
	</cfquery>

	<!--- Next see if credit card date is expired; if payment method is 1 --->
	<cfset xYear = right(qGetCreditCards.exp, 2)>
	<cfset xMonth = left(qGetCreditCards.exp, 2)>
	<cfset currentyear = dateformat(Now(),"yy")>
	<cfset currentmonth = dateformat(Now(),"mm")>

	<cfif qGetCustomerAccount.PaymentMethod is 1 and ((xmonth LT currentmonth and currentyear EQ xyear) or (xyear LT currentyear))>
		<cfset xExpired = 1>
	<cfelse>
		<cfset xExpired = 0>
	</cfif>

	<cfif xExpired is 1>
		<CFLOCATION URL="OrderFormEditAccountStep4.cfm?OrderForm=1&Expired=1"  addToken="no">
	</cfif>

	<cfif len(trim(qGetCreditCards.cardnum)) GT 0>
		<cfset xcard = Decrypt(ToString(ToBinary(qGetCreditCards.cardnum)),"#xBird#")>
	</cfif>

	<!--- Get other Account Addresses --->
	<cfquery name="qGetAddressBook" datasource="photoeyecom">
	SELECT     *
	FROM    AddressBook
	WHERE   BelongsTo = <cfqueryparam value="#qGetCustomerAccount.Custnumber#" cfsqltype="cf_sql_integer">
	</cfquery>

	<!--- Check to see if there is a billing address different from the primary account address --->
	<cfquery name="qGetBilling" dbtype="query">
	SELECT *
	FROM  qGetAddressBook
	where DefaultAddress_B = 1
	</cfquery>

	<!--- If not, get the primary account address --->
	<cfif qGetBilling.recordcount is 0>
		<cfquery name="qGetBilling" datasource="photoeyecom">
		SELECT     autoid, '0' as DefaultAddress_B, '0' as DefaultAddress_S, '0' as DefaultAddress_M, '0'AS Rela_AutoID, '0' as custnum, '0' as belongnum, ' ' as desc_, ' ' as rela_type,  M.FirstName, M.LastName, M.Company,
	                      M.Address1, M.Address2, M.City, M.State, M.Zip, M.Country, M.Phone, M.Phone2, M.Email, M.Custnumber
		FROM MailingList_OM M
		where Custnumber = <cfqueryparam value="#qGetCustomerAccount.Custnumber#" cfsqltype="cf_sql_integer">
		</cfquery>

	</cfif>

	<!--- Get Shipping address --->
	<cfquery name="qGetShipping" dbtype="query">
	SELECT *
	FROM  qGetAddressBook
	where DefaultAddress_S = 1
	</cfquery>

	<cfif qGetShipping.recordcount is 0>
		<cfquery name="qGetShipping" datasource="photoeyecom">
		SELECT    autoid, '0' as DefaultAddress_B, '0' as DefaultAddress_S, '0' as DefaultAddress_M, '0'AS Rela_AutoID, '0' as custnum, '0' as belongnum, ' ' as desc_, ' ' as rela_type,  M.FirstName, M.LastName, M.Company,
		                      M.Address1, M.Address2, M.City, M.State, M.Zip, M.Country, M.Phone, M.Phone2, M.Email, M.Custnumber
		FROM MailingList_OM M
		where Custnumber = <cfqueryparam value="#qGetCustomerAccount.Custnumber#" cfsqltype="cf_sql_integer">
		</cfquery>
	</cfif>

	<cfif qGetShipping.CustNumber is qGetBilling.CustNumber>
		<cfset xShipIsBill = 1>
	<cfelse>
		<cfset xShipIsBill = 0>
	</cfif>

	<cfoutput>
		<form name="confirmorder" id="frmConfirm" method="post" action="/templates/OrderFormConfirmOrderNewActionSimple.cfm?#xApplyType#&OrderForm=1&auctionConfirm=1" target="_top">
		<center>
			<div align="center">
				<table align="center" border="0" cellspacing="0" cellpadding="0" width="740">
					<tr>
						<td colspan="6">
							<span style="font-size:13pt;font-family:Verdana, sans-serif">
							CONFIRM AUCTION ACCOUNT INFORMATION
							</span>

							<span style="font-size:9pt;font-family:Verdana, sans-serif">
							<p>The following information will be used if you are the winner of this auction.<br>Please make any changes before continuing.</p>
							</span>
							<br>
						</td>
					</tr>
					<tr>
						<td align="left" width="80" height="120" valign="top">
							<font face="Arial, Helvetica, Sans-Serif" COLOR="Black" size="2">
								<b>
									Bill To:
								</b>
								<br>
								(credit card address)
							</font>
							<br>
							<br>
								<input name="Change<cfif (xShipIsBill is 0)>Billing</cfif>Address" value="Change" type="SUBMIT" CLASS="input_submit">
								<input name="BillingAutoID" value="#qGetBilling.autoid#" type="Hidden">
						</td>
						<td>
							&nbsp;&nbsp;&nbsp;
						</td>
						<td valign="top" width="250">
							<font face="Arial, Helvetica, Sans-Serif" COLOR="Maroon" size="2">

								<cfquery name="qGetCountry"  DATASOURCE="photoeyecom">
								SELECT *
								FROM Country
								WHERE CountryCode = <cfqueryparam value="#qGetBilling.Country#" cfsqltype="cf_sql_varchar">
								</cfquery>

								<cfif len(trim(qGetBilling.FirstName))GT 0>
									<b>
										#qGetBilling.FirstName#
									</b>
								</cfif>

								<cfif len(trim(qGetBilling.LastName))GT 0>
									<b>
										#qGetBilling.Lastname#
									</b>
									<br>
								</cfif>

								<cfif len(trim(qGetBilling.Company))GT 0>
									#qGetBilling.Company#
									<br>
								</cfif>

								<cfif len(trim(qGetBilling.Address1))GT 0>
									#qGetBilling.Address1#
									<br>
								</cfif>

								<cfif len(trim(qGetBilling.Address2))GT 0>
									#qGetBilling.Address2#
									<br>
								</cfif>

								<cfif len(trim(qGetBilling.City))GT 0>
									#qGetBilling.City#
								</cfif>

								<cfif len(trim(qGetBilling.State))GT 0 and trim(qGetBilling.State) is not 'FO'>
									, #qGetBilling.State#
								</cfif>

								<cfif qGetBilling.Country is '001'>

									<cfif len(trim(qGetBilling.Zip))GT 0>
										#qGetBilling.Zip#
										<br>
									</cfif>

									<cfif len(trim(qGetCountry.Country))GT 0>
										#qGetCountry.Country#
									</cfif>

								<cfelse>
									<cfif len(trim(qGetCountry.Country))GT 0>
										<br>
										#qGetCountry.Country#
									</cfif>

									<cfif len(trim(qGetBilling.Zip))GT 0>
										#qGetBilling.Zip#
									</cfif>
								</cfif>

								<br>
								<br>

								<cfif len(trim(qGetBilling.Phone)) GT 0>
									Phone: #qGetBilling.Phone#
									<br>
								</cfif>

								<cfif len(trim(qGetBilling.Email)) GT 0>
									#qGetBilling.Email#
								<cfelse>
									#qGetCustomerAccount.Email#
								</cfif>
							</font>
						</td>
						<td valign="top">
							<font face="Arial, Helvetica, Sans-Serif" size="2" color="Black">
								<b>
									Ship-To:
								</b>
								<br>
								<br>
								<input name="Change<cfif (xShipIsBill is 0)>Billing</cfif>Address" value="Change" type="SUBMIT" CLASS="input_submit">

							</font>
						</td>
						<td width="15">
							&nbsp;
						</td>
						<td valign="top">
							<font face="Arial, Helvetica, Sans-Serif" COLOR="Maroon" size="2">

							<cfquery name="qGetCountry"  DATASOURCE="photoeyecom">
							SELECT *
							FROM Country
							WHERE CountryCode = <cfqueryparam value="#qGetShipping.Country#" cfsqltype="cf_sql_varchar">
							</cfquery>

							<cfif len(trim(qGetShipping.FirstName))GT 0>
								<b>
									#qGetShipping.FirstName#
								</b>
							</cfif>

							<cfif len(trim(qGetShipping.LastName))GT 0>
								<b>
									#qGetShipping.Lastname#
								</b>
								<br>
							</cfif>

							<cfif len(trim(qGetShipping.Company))GT 0>
								#qGetShipping.Company#
								<br>
							</cfif>

							<cfif len(trim(#qGetShipping.Address1#))GT 0>
								#qGetShipping.Address1#
								<br>
							</cfif>

							<cfif len(trim(qGetShipping.Address2))GT 0>
								#qGetShipping.Address2#
								<br>
							</cfif>

							<cfif len(trim(qGetShipping.City))GT 0>
								#qGetShipping.City#
							</cfif>

							<cfif len(trim(#qGetShipping.State#))GT 0 and #trim(qGetShipping.State)# is not 'FO'>
								, #qGetShipping.State#
							</cfif>

							<cfif qGetShipping.Country is '001'>
								<cfif len(trim(qGetShipping.Zip))GT 0>
									#qGetShipping.Zip#
									<br>
								</cfif>

								<cfif len(trim(qGetCountry.Country))GT 0>
									#qGetCountry.Country#
								</cfif>
							<cfelse>
								<cfif len(trim(qGetCountry.Country))GT 0>
									<br>
									#qGetCountry.Country#
								</cfif>

								<cfif len(trim(qGetShipping.Zip))GT 0>
									#qGetShipping.Zip#
								</cfif>
							</cfif>

							<br>
							<br>

							<cfif len(trim(qGetShipping.Phone)) GT 0>
								Phone: #qGetShipping.Phone#
								<br>
							</cfif>

							<cfif len(trim(qGetShipping.Email)) GT 0>
								#qGetShipping.Email#
							<cfelse>
								#qGetCustomerAccount.Email#
							</cfif>
						</td>
					</tr>
				</table>

				<table align="center" width="740">
					<tr>
						<td align="center">
							<hr size="1" noshade
							<cfif xShipIsBill is 0>
								color="red"
							</cfif>
							>
						</td>
					</tr>
				</table>

			</div>
		</center>

		<table border="0" width="600" align="center">
			<td align="center" valign="top">
				<font face="Arial, Helvetica, Sans-Serif" size="2" color="Black">
					<b>
						Payment
						<br>
						Method:
					</b>
				</font>
				<br>
				<br>
				<input name="ChangePaymentMethod" value="Change" type="SUBMIT" CLASS="input_submit">
			</td>
			<td valign="top" align="center">

				<!--- Pay by credit card --->
				<cfif qGetCustomerAccount.PaymentMethod is 1 and len(trim(qGetCreditCards.cardnum)) GT 0>
					<cfif left(xCard,1) is 3>
						<cfset xCreditCardType = 'Amex Card'>
					<cfelseif left(xCard,1) is 4>
						<cfset xCreditCardType = 'Visa Card'>
					<cfelseif left(xCard,1) is 5>
						<cfset xCreditCardType = 'Master Card'>
					<cfelseif left(xCard,1) is 6>
						<cfset xCreditCardType = 'Discover Card'>
					<cfelse>
						<cfset xCreditCardType = 'None'>
					</cfif>
					<font face="Arial, Helvetica, Sans-Serif" size="2" COLOR="Maroon">
					<b>
						#xCreditCardType#
					</B>
					ending with
					<b>
						#Right(xCard,4)#
					</b>
					<!--- Ask for card security code if first order, or international --->
					<cfquery name="qPreviousOrders"  DATASOURCE="photoeyecom">
					SELECT count(*) as total
					FROM FinalOrderInfoNewOrderForm
					WHERE CustNumber = <cfqueryparam value="#qGetCustomerAccount.CustNumber#" cfsqltype="cf_sql_integer">
					</cfquery>

					<cfif (qGetBilling.Country is not 001) or qPreviousOrders.total is 0>
						<cfif len(xErrorMessage) gt 0>

							<table width="202">
								<tr>
									<td>
										<font face="Arial, Helvetica, Sans-Serif" size="2" COLOR="RED">
										<b>
											OOPS! #xErrorMessage#
										</b>
										<font>
									</td>
								</tr>
							</table>

						<cfelse>
							<br>
							<br>
						</cfif>

						<table border="1" width="172" <cfif Session.SecurityCode is '' or xErrorMessage is not ''>bordercolor="red"<cfelse>bordercolor="maroon"</cfif>>
							<tr bordercolor="white">
								<td>
									<font face="Arial, Helvetica, Sans-Serif" size="2" COLOR="Maroon">
										<cfif xErrorMessage is ''>
											<font color="black">
												Card Security Code (CID):
											</font>
											<br>
										</cfif>
										<input name="SecurityCode" id="securityCode" type="text" class="input_text" style="font: 12px" VALUE="#Session.SecurityCode#"
										<cfif left(xCard,1) is 3>
											size="4" MAXLENGTH="4"
										<cfelse>
											size="3" MAXLENGTH="3"
										</cfif>
										>
										<input type="hidden" name="CheckForCID" VALUE="1">
										<input type="hidden" name="CardType" VALUE="#xCreditCardType#">
										<A HREF="/templates/cid.cfm">
											Where is this?
										</A>
									</font>
								</td>
							</tr>
						</table>

					<cfelse>
						<br>
					</cfif>

					</td>
					<td align="center">
					<font face="Arial, Helvetica, Sans-Serif" size="2" color="Black">
						<b>Exp Date:</b>
						<br>
						#qGetCreditCards.Exp#
					</font>
					<br>
					<br>
					<input name="EditCreditCard" value="Edit Date" type="SUBMIT" CLASS="input_submit">
				</td>
			</TR>

			<input name="CCAutoID" value="#qGetCreditCards.autoid#" type="Hidden">

			<cfelseif qGetCustomerAccount.PaymentMethod is 10>
				<cfinclude template="/templates/OrderFormConfirmOrderNew_AddCreditCard.cfm">
			<cfelse>

			<font face="Arial, Helvetica, Sans-Serif" COLOR="Black" size="2">
				Please choose
				<br>
				your payment method
				<br>
				by clicking the
				<br>
				"change" button.
			</font>
			</td>
		</tr>
		</cfif>
	</table>
	</cfoutput>

	<br>
	<br>
	<center>
		<input type="submit" value="Continue" name="continue" id="btnContinue" class="input_submit">
	</center>

	<cfif xShowFooter is 1>
		<CFINCLUDE TEMPLATE="/templates/includes/dsp_account_index_bottom.cfm">
	</cfif>

	<cfcatch type="any">
		<cfdump var="#cfcatch#">
		<cfabort>
	</cfcatch>

</cftry>
