<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<cfinclude template="../includes/dsp_header.cfm">
<cflock scope="Session" type="readOnly" timeout="10">
	<cfif StructKeyExists(SESSION,'publisher_direct_redeeming_token')>
		<cfinclude template="includes/dsp_signup.cfm">
	<cfelse>
		<h1>Unfortunately your token was not found.  Please call +1(505)988-5152 if you need assistance.</h1>
	</cfif>
</cflock>
<cfinclude template="../includes/dsp_footer.cfm">