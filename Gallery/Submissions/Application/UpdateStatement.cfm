<CFQUERY NAME="qGetShowcaseApplicationInfo"  DATASOURCE="photoeyecom">
  Select * from GalleryApplication WHERE OrderId = #url.id#
</CFQUERY>

<CFQUERY NAME="qGetShowcaseApplicationSelect"  DATASOURCE="photoeyecom">
  Select * from GalleryApplicationPortfolios WHERE OrderId = #url.id# and PortfolioNo=#qGetShowcaseApplicationInfo.PortfolioCredits#
</CFQUERY>

<cfif qGetShowcaseApplicationSelect.recordcount is 0>
	<CFQUERY NAME="qGetShowcaseApplicationInsert"  DATASOURCE="photoeyecom">
		INSERT into GalleryApplicationPortfolios (ID, OrderId, Statement, PortfolioNo) 
   		VALUES (#qGetShowcaseApplicationInfo.ID#, #url.id#, '#form.statement#', #qGetShowcaseApplicationInfo.PortfolioCredits#)   
	</CFQUERY>
<cfelse>
	<CFQUERY NAME="qGetShowcaseApplication"  DATASOURCE="photoeyecom">
  		UPDATE GalleryApplicationPortfolios set statement='#form.statement#'
 		 WHERE OrderId = #url.id# and PortfolioNo=#qGetShowcaseApplicationInfo.PortfolioCredits#
	</CFQUERY>
</cfif>

<CFQUERY NAME="qGetShowcaseApplication1"  DATASOURCE="photoeyecom">
  		UPDATE GalleryApplication set Step3='1'
  		WHERE OrderId = #url.id#
</CFQUERY>

<cfinclude template="header.cfm">

<body>
<cfoutput>
<div style="padding-top:200px;">
<table align="center"><tr><td align="center">
<p align="center">
<form action="Statement_P.cfm?id=#url.id#" method="post">

Your statement has been submitted!<br><br>
<INPUT TYPE="SUBMIT" VALUE="Continue to Step 4">
</form>
</p>
</td></tr><cfinclude template="footer.cfm"></table>
</div>
</cfoutput>

</body>
</html>