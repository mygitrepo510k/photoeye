<cfset publications = event.getValue('publications') />
<cfif ArrayIsEmpty(publications)>
	<cfset arguments.event.setValue('error_message', 'No editions found') />
	<cfset arguments.event.addResult('errorsFound') />
<cfelse>
	<cfoutput>
			
		#helpers.gui.insertDivider('Recent Editions')#
		
		<div class="small_citation_row">
			<cfloop from="1" to="#ArrayLen(publications)#" index="i">
				<cfset publication = publications[i].getInstance() />
				#helpers.gui.insertSmallCitation(publication)#
			</cfloop>
		</div>
	
	</cfoutput>
</cfif>