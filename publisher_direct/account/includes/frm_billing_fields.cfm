<cfquery name="qStates" datasource="#application.dsn#">
	Select *
	From States
	Where 0 = 0
	Order By State
</cfquery>
<cfquery name="qCountries" datasource="#application.dsn#">
	Select *
	From Country
	Order By Country
</cfquery>
<cfoutput>
	<div>
		<label>First* | Last Name*</label>
		<input type="text" name="firstname" value="#FORM.firstname#" />
		<input type="text" name="lastname" value="#FORM.lastname#" />
	</div>
	<div>
		<label>Company</label>
		<input type="text" name="company" value="#FORM.company#" />
	</div>
	<div>
		<label>Address*</label>
		<input type="text" name="address1" value="#FORM.address1#" />
	</div>
	<div>
		<label>&nbsp;</label>
		<input type="text" name="address2" value="#FORM.address2#" />
	</div>
	<div>
		<label>City* | State* | Zip*</label>
		<input type="text" name="city" value="#FORM.city#" />
		<select name="state">
			<option value=""></option>
			<cfloop query="qStates">
				<option value="#qStates.StateInitials#"<cfif qStates.StateInitials EQ FORM.State> selected</cfif>>#qStates.StateInitials#</option>
			</cfloop>
		</select>
		<input type="text" name="zip" value="#FORM.zip#" />
	</div>
	<div>
		<label>Country*</label>
		<select name="country">
			<option value=""></option>
			<option value="USA">United States</option>
			<cfloop query="qCountries">
				<cfif trim(qCountries.CountryCode) NEQ "001">
					<option value="#trim(qCountries.CountryCode)#"<cfif qCountries.CountryCode EQ FORM.Country> selected</cfif>>#qCountries.Country#</option>
				</cfif>
			</cfloop>
		</select>
	</div>
	<div style="clear:both;margin-top:5px;">
		<label>Primary Phone*</label>
		<input type="text" name="phone" value="#FORM.phone#" />
	</div>
	<div>
		<label>Secondary Phone</label>
		<input type="text" name="phone2" value="#FORM.phone2#" />
	</div>
</cfoutput>