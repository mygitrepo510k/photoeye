<!--- Set active token --->
<cflock type="readOnly" scope="Session" timeout="5">
	<cfif StructKeyExists(SESSION,'publisher_direct_redeeming_token')>
		<cfset activeToken = SESSION.publisher_direct_redeeming_token />
	<cfelse>
		<cfset activeToken = '' />	
	</cfif>
</cflock>

<cfif activeToken IS ''>
	<!--- try to get it from the DB --->
	<cfquery name="qOutstandingTokens" dataSource="#application.dsn#">
		SELECT * FROM publisher_direct_token
		WHERE publisher_direct_id = #request.qPD_user.id#
		AND redeemed = 0
	</cfquery>

	<cfif NOT qOutstandingTokens.recordcount>
		<h1>Unfortunately your token was not found.  Please call +1(505)988-5152 if you need assistance.</h1>
		<cfinclude template="../includes/dsp_footer.cfm" />
		<cfabort />	
	</cfif>

	<cfset activeToken = qOutstandingTokens.token />
	<cflock type="exclusive" scope="Session" timeout="30">
		<cfset SESSION.publisher_direct_redeeming_token = qOutstandingTokens.token />
	</cflock>

</cfif>

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

<cfoutput>
	<div class="standard_container">
		<h1>Purchase Options</h1>
		<form action="confirmation.cfm" method="POST">
			<div style="margin-top:10px;">
				<label>&nbsp;</label><span style="border-bottom:1px dashed ##03878E;">Book Fees&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
			</div>
			<div class="dented" style="margin-top:10px;font-size: 12px;">
				$#prices.setup# Book Marketing (one-time fee)<br />
				$#prices.initial_book# Listing fee (auto-renewal)<br />
			</div>
			<div>
				<label>
			 		<strong>#qToken.qty#</strong> Book<cfif qToken.qty GT 1>s</cfif>
				</label>
				<span id="book_total">$#totalSetupPrice+totalBookPrice# ($#totalBookPrice# annually)</span>			
			</div>
			<div style="margin-top:10px;">
				<label>&nbsp;</label><span style="border-bottom:1px dashed ##03878E;">Booktease Options&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
			</div>
			<div class="dented" style="margin-top:10px;font-size: 12px;">
				$#prices.booktease# Booktease Production (one-time fee)<br />
				$#prices.booktease_reduced# User-supplied Booktease (one-time fee)
			</div>
			<div style="margin-top:10px;">
				<label>
					Full-service
				</label>
				<select name="booktease_qty">
					<option value="0">0</option>
					<cfloop from="1" to="#qToken.qty#" index="i">
						<option value="#i#">#i#</option>
					</cfloop>
				</select>
				<span id="booktease_total">$0</span>
			</div>
			<div>
				<label>
					User-supplied
				</label>
				<select name="booktease_reduced_qty">
					<option value="0">0</option>
					<cfloop from="1" to="#qToken.qty#" index="i">
						<option value="#i#">#i#</option>
					</cfloop>
				</select>
				<span id="booktease_reduced_total">$0</span>
			</div>
			<div style="margin-top:50px;">
				<label>
					&nbsp;
				</label>
				<input type="submit" value="continue" />
			</div>
		</form>
	</div>
</cfoutput>
<script type="text/javascript">
	jQuery(document).ready(function(){
		var j$ = jQuery;
		<cfoutput>
			var total_books = #qToken.qty#;
			var btp = #prices.booktease#;
			var btrp = #prices.booktease_reduced#;
		</cfoutput>
		j$('select[name=booktease_qty]').change(function(){
			var booktease_total = (parseInt(j$(this).val()) >= 1) ? parseInt(j$(this).val())*btp : 0;
			j$('#booktease_total').html("$"+booktease_total);
		});
		j$('select[name=booktease_reduced_qty]').change(function(){
			var booktease_reduced_total = (parseInt(j$(this).val()) >= 1) ? parseInt(j$(this).val())*btrp : 0;
			j$('#booktease_reduced_total').html("$"+booktease_reduced_total);
		});		
	});
</script>