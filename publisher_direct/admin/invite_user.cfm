<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<cfinclude template="../includes/dsp_header.cfm">
<div class="standard_container" style="width:400px">
<cfif StructKeyExists(FORM,'email') AND Len(FORM.email)>	
	<cfset newToken = '' />
	<!--- Prevent collisions --->
	<cfloop from="1" to="10" index="i">
		<cfset newToken = generateToken(30) />
		<cfquery name="qTokenCollision" datasource="#application.dsn#">
			SELECT * FROM publisher_direct_token
			WHERE token = '#newToken#'
		</cfquery>
		<cfif qTokenCollision.recordcount LT 1>
			<cfbreak />
		</cfif>
	</cfloop>
	<cfquery name="qInsertToken" dataSource="#application.dsn#">
		INSERT into publisher_direct_token (token,email,created_at,service_level,qty) 
		VALUES ('#newToken#',<cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#FORM.email#" />,#CreateODBCDateTime(Now())#,<cfqueryparam CFSQLType="CF_SQL_VARCHAR" maxLength="3" value="#FORM.service_level#" />,<cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#FORM.qty#" />)
	</cfquery>
	<cfmail from="#application.admin_email#" to="#FORM.email#" subject="Welcome to photo-eye Publisher Direct!" type="html">
		Dear #FORM.firstname# #FORM.lastname#,<br>	
		We're excited to include you in our Publisher Direct program!<br> 
		Please use the link below to purchase #qty# #application.PD_service_levels[FORM.service_level]# listing<cfif qty GT 1>s</cfif>.
		<br><br>		
		https://www.photoeye.com/publisher_direct/login/?t=#URLEncodedFormat(newToken)#<br><br>
		Please call #application.admin_phone# or email if you have any questions.<br>
		Thanks!<br> 
		#application.admin#
	</cfmail>
	<cfoutput>
		<h2>
			Token #URLEncodedFormat(newToken)# email sent to #FORM.email#.
		</h2>
		<div class="dented" style="clear:both;">&nbsp;</div>
	</cfoutput>
</cfif>
<cfinclude template="includes/frm_invite.cfm">
</div>
<cfinclude template="../includes/dsp_footer.cfm">