<div class="standard_container">

	<h1>Your Catalog</h1>
	<cfif StructKeyExists(URL,'saved')>
		<div class="dented" style="color:green;">Changes were saved successfully!</div>
	</cfif>
	<cfquery name="qOutstandingTokens" dataSource="#application.dsn#">
		SELECT * FROM publisher_direct_token
		WHERE publisher_direct_id = #request.qPD_user.id#
		AND redeemed = 0
	</cfquery>

	<!---
		<cfquery name="qFullCatalog" dataSource="#application.dsn#">
			SELECT DISTINCT a.*, a.catalog, a.publisher_direct_id, b.title2x, b.catalog FROM publisher_direct_catalog AS a
			INNER JOIN inventory AS b
			ON a.catalog = b.catalog 
			WHERE a.publisher_direct_id = #request.qPD_user.id#
		</cfquery>
	--->
	
	<!--- DE 02.14.12 FIX: catalog numbers can disappear from inventory, make sure we show them in the edit list anyway.  We repair the connection on the edit page. --->

	<cfquery name="qFullCatalog" dataSource="#application.dsn#">
		SELECT *, '' AS title2x FROM publisher_direct_catalog AS a INNER JOIN Inventory as i ON i.Catalog = a.Catalog
		WHERE a.publisher_direct_id = #request.qPD_user.id#
	</cfquery>
	<div class="dented">
		<cfoutput>
			<cfif qFullCatalog.recordCount GT 0>
				<ul>
					<cfloop query="qFullCatalog">
						<li><a href="edit.cfm?c=#qFullCatalog.catalog#">(#qFullCatalog.catalog#) <cfif Len(qFullCatalog.title2x)>#qFullCatalog.title2x#<cfelse>Uncataloged Book</cfif></a> <cfif Len(qFullCatalog.title2x)> &mdash; <a href="/bookstore/Citation.cfm?catalog=#qFullCatalog.catalog#" target="_blank">View live citation</a></cfif></li>	
					</cfloop>
				</ul>
<!---
				<div style="margin-top:24px;">
					<a href="/#application.root#/purchase/">Purchase more listings or bookteases</a>
				</div>
--->
				<cfif qOutstandingTokens.recordcount>
					<div>
						<a href="/#application.root#/purchase/">Click here to purchase listing</a>
					</div>
				</cfif>

			<cfelseif qOutstandingTokens.recordcount>
				<div>
					You do not have any listings yet, <a href="/#application.root#/purchase/">purchase one now</a>.
				</div>
			</cfif>
			
		</cfoutput>
	</div>
</div>
