<cflock scope="Session" type="exclusive" timeout="5">
	<cfif StructKeyExists(SESSION,'publisher_direct_id')>
		<cfset StructDelete(SESSION,'publisher_direct_id') />
	</cfif>
	<cfif StructKeyExists(SESSION,'publisher_direct_redeeming_token')>
		<cfset StructDelete(SESSION,'publisher_direct_redeeming_token') />
	</cfif>
</cflock>
<cflocation url="http://www.photoeye.com/bookstore" addToken="no" />