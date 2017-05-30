<span id="Gallery_Menu">
<!---<img src="/gallery/sharedimages/Redlinetoc.gif" width="400" height="1" alt="" border="0"><br>
<img src="/gallery/SharedImages/dot_clear.gif" width="1" height="1">--->


<cfoutput>
<a href="/gallery/forms2/bio.cfm?id=#url.id#">Bio</a>

<cfset statementqty=0>
<CFIF len(#qGalleryStatements.StatementA#) is not 0>
	<cfset statementqty=statementqty+1>
	<cfset statementword="Statement">
</cfif>

<CFIF len(#qGalleryStatements.StatementP#) is not 0>
	<cfset statementqty=statementqty+1>
	<cfif statementqty is 2>
		<cfset statementword="Statements">
	<cfelse>
		<cfset statementword="Statement">
	</cfif>
</cfif>


<CFIF len(#qGalleryStatements.StatementA#) is not 0 or len(#qGalleryStatements.StatementP#) is not 0 >	
<a href="/gallery/forms2/statement.cfm?id=#url.id#">#statementword#</a>
</cfif>


<CFIF len(#qGalleryBibliography.Catalog#) is not 0>
<a href="/gallery/forms2/books.cfm?id=#url.id#">Books Available</a>
</CFIF>
<CFQUERY NAME="qShowcaseMultiplePortfolios"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryPortfolio   where Custnumber=<cfqueryparam value="#url.id#" cfsqltype="CF_SQL_INTEGER"> and ShowcaseOK=1</CFQUERY>      
<cfif qShowcaseMultiplePortfolios.recordcount GT  1>  
<a href="homepage.cfm?id=#url.id#&door=#url.door#&Gallery=#url.gallery#&Page=#URL.Page#">More Portfolios</a>
</cfif>

</cfoutput>
</span> 