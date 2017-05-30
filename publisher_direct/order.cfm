<!--- for routing purchase links and stat tracking --->
<cfif NOT StructKeyExists(URL,'num')>
	No number passed<cfabort />
</cfif>
<!--- get link for binding --->
<cfquery name="qGetLink" dataSource="photoeyecom">
	SELECT link, number FROM publisher_direct_bindings
	WHERE number = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#url.num#" />
</cfquery>
<cfif qGetLink.recordcount>
	<cfquery name="qUpdateClicks" dataSource="photoeyecom">
		UPDATE publisher_direct_bindings
		SET click_stat = click_stat+1
		WHERE number = '#qGetLink.number#'
	</cfquery>
	<cflocation url="#qGetLink.link#" addToken="no" />
<cfelse>
	No link found
</cfif>