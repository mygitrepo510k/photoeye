<cfset publications = event.getValue('publications') />
<cfset createObject("java", "java.util.Collections").reverse(publications) />
<h1 style="padding:0 50px">Publications</h1>

<cfoutput>
<div style="height:25px"></div>
<cfloop from="1" to="#ArrayLen(publications)#" index="i">
	#helpers.gui.insertBigCitation(publications[i].getInstance(), event)#
</cfloop>

<!--- 

#helpers.gui.insertDivider('Recent Editions')#

<div class="small_citation_row">

	#helpers.gui.insertSmallCitation(publication)#
	
	#helpers.gui.insertSmallCitation(publication)#
	
	#helpers.gui.insertSmallCitation(publication)#
	
	#helpers.gui.insertSmallCitation(publication)#
	
	#helpers.gui.insertSmallCitation(publication)#
	
	#helpers.gui.insertSmallCitation(publication)#
	
	#helpers.gui.insertSmallCitation(publication)#
	
	#helpers.gui.insertSmallCitation(publication)#

</div>

#helpers.gui.insertDivider('Forthcoming Editions')#

<div class="small_citation_row">

	#helpers.gui.insertSmallCitation(publication)#
	
	#helpers.gui.insertSmallCitation(publication)#
	
	#helpers.gui.insertSmallCitation(publication)#
	
	#helpers.gui.insertSmallCitation(publication)#

</div>

#helpers.gui.insertDivider('Backlist')#

<div class="small_citation_row">

	#helpers.gui.insertSmallCitation(publication)#
	
	#helpers.gui.insertSmallCitation(publication)#
	
	#helpers.gui.insertSmallCitation(publication)#
	
	#helpers.gui.insertSmallCitation(publication)#

</div>
 --->
</cfoutput>