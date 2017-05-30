<cfquery name="qIncrementTest" dataSource="photoeyecom">
	UPDATE publisher_direct_catalog
	SET page_views = page_views+1
	WHERE catalog = 'I1000'
</cfquery>