<cfparam name="FORM.firstname" default="#request.qPD_user.firstname#" />
<cfparam name="FORM.lastname" default="#request.qPD_user.lastname#" />
<cfparam name="FORM.company" default="#request.qPD_user.company#" />
<cfparam name="FORM.address1" default="#request.qPD_user.address1#" />
<cfparam name="FORM.address2" default="#request.qPD_user.address2#" />
<cfparam name="FORM.city" default="#request.qPD_user.city#" />
<cfparam name="FORM.state" default="#request.qPD_user.state#" />
<cfparam name="FORM.zip" default="#request.qPD_user.zip#" />
<cfparam name="FORM.country" default="#request.qPD_user.country#" />
<cfparam name="FORM.phone" default="#request.qPD_user.phone#" />
<cfparam name="FORM.phone2" default="#request.qPD_user.phone2#" />

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

<cfset totalSetupPrice = qToken.qty*prices.setup />
<cfset totalBookPrice = qToken.qty*prices.initial_book />

<!--- set book qty, this now comes from the token DB --->
<cfset FORM.book_qty = qToken.qty />

<cfset setup_total = totalSetupPrice />
<cfset book_total = totalBookPrice />
<cfset booktease_total = FORM.booktease_qty*prices.booktease />
<cfset booktease_reduced_total = FORM.booktease_reduced_qty*prices.booktease_reduced />

<style>
	.standard_container h2 {
		margin-top: 20px;
	}
</style>
<cfoutput>
	<div class="standard_container">
		<form action="checkout.cfm" method="post">
			<input type="hidden" name="book_qty" value="#FORM.book_qty#" />
			<input type="hidden" name="booktease_qty" value="#FORM.booktease_qty#" />
			<input type="hidden" name="booktease_reduced_qty" value="#FORM.booktease_reduced_qty#" />
			<h2>Billing Info</h2>
			#validationErrors()#
			<div class="dented" style="margin-top:0px;margin-bottom:10px;">
				fields marked * required.
			</div>
			<cfinclude template="/#application.root#/account/includes/frm_billing_fields.cfm" />
			
			<cfif NOT Len(request.qPD_user.TOS_Agree) OR NOT Len(request.qPD_user.TOS_Initials)>
				<h2>Terms of Service</h2>
				<div class="dented" style="height: 500px; width: 500px; background: ##fff; padding: 20px; overflow: auto; color: ##000; border: 1px solid ##999;">
					<cfinclude template="terms_of_service.cfm" />
				</div>
				<label>I Agree</label>
				<input type="checkbox" name="TOS_agree" value="1" /><br />
				<label>My Initials</label>
				<input type="text" name="TOS_initials" value="" style="width:25px;margin-left:4px" maxlength="4" />
			<cfelse>
				<input type="hidden" name="TOS_done" value="1" />
			</cfif>

			<h2>Order Summary</h2>			
			<div>
				<label>#FORM.book_qty# marketing fee:</label> #DollarFormat(setup_total)# (one-time fee)<br />
				<label>#FORM.book_qty# book<cfif FORM.book_qty GT 1>s</cfif>:</label> #DollarFormat(book_total)# (annually)<br />
				<cfif FORM.booktease_qty GT 0 OR FORM.booktease_reduced_qty GT 0>
					<label>Booktease</label> --------------------------------------------------------<br />
				</cfif>
				<cfif FORM.booktease_qty GT 0>
					<label>#FORM.booktease_qty# full-service:</label> #DollarFormat(booktease_total)# (one-time fee)<br />
				</cfif>
				<cfif FORM.booktease_reduced_qty GT 0>
					<label>#FORM.booktease_reduced_qty# user-supplied:</label> #DollarFormat(booktease_reduced_total)# (one-time fee)<br />
				</cfif>
				<label>&nbsp;</label> --------------------------------------------------------<br />
				<label><strong>Today's Total:</strong></label><strong>#DollarFormat(setup_total+book_total+booktease_total+booktease_reduced_total)#</strong><br />
				<label>&nbsp;</label>Your Annual Billing for this order will be #DollarFormat(book_total)#, renewing automatically on #DateFormat(DateAdd('yyyy',1,Now()),'mm/dd/yyyy')#
			</div>
			<h2>Payment Information (Visa, MC, Amex, Discover)</h2>
			<div>
				<label>Credit Card Number</label>
				<input type="text" name="cardnumber" value="" />
			</div>
			<div>
				<label>Expr. Month | Year</label>
				<select name="cardmonth">
					<option value=""></option>
					<cfloop from="1" to="12" index="i">
						<option value="#i#">#i#</option>
					</cfloop>
				</select>
				<select name="cardyear">
					<option value=""></option>
					<cfloop from="0" to="10" index="i">
						<option value="#DatePart('yyyy',DateAdd('yyyy',i,Now()))#">#DatePart('yyyy',DateAdd('yyyy',i,Now()))#</option>
					</cfloop>
				</select>
			</div>
			<div style="clear:both;margin-top:5px;">
				<label>Security Code (CID)</label>
				<input type="text" name="securitycode" value="" maxlength="4" />
			</div>
			<div class="dented">
				<input type="submit" value="checkout" />
				<input type="submit" id="cancel_button" value="back" />
			</div>
		</form>
	</div>
</cfoutput>
<script type="text/javascript">
	jQuery(document).ready(function(){
		var j$ = jQuery;
		j$('#cancel_button').click(function(){
			window.location = "index.cfm";
			return false;
		});
		
		// . <!--- DE 02.14.12 FIX: prevent accidental duplicate purchases --->

		var alreadyPurchasing = false;
		j$('form').submit(function(event){
			if(alreadyPurchasing){
				event.preventDefault();
				event.stopImmediatePropagation();
				return false;
			}
			else {
				alreadyPurchasing = true;
			}
		});

	});
</script>