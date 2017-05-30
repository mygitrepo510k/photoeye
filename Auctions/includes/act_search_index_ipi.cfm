	<!--- Search Live Auctions --->
	<cfsearch name="ipi" 
		collection="ipi" 
		criteria="#form.searchInput#"
	>	 
					<!--- Display Live auctions  --->
		<cfif ipi.recordCount>
		
			<!--- Get live auction detail from database --->
			<cfquery name="qGetipi" datasource="photoeyecom">
				SELECT *
				FROM ipi_photographers
				WHERE id IN (#valueList(ipi.key)#)
			</cfquery>				</cfif>		<cfdump var="#qGetipi#">		