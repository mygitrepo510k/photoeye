<CFQUERY NAME="qGetShowcaseApplicationInfo"  DATASOURCE="photoeyecom">
  Select * from GalleryApplication WHERE OrderId = #url.id#
</CFQUERY>

<CFQUERY NAME="qGetShowcaseApplicationSelect"  DATASOURCE="photoeyecom">
  Select * from GalleryApplicationPortfolios WHERE OrderId = #url.id# and PortfolioNo=#qGetShowcaseApplicationInfo.PortfolioCredits#
</CFQUERY>

<cfif qGetShowcaseApplicationSelect.recordcount is 0>
	<CFQUERY NAME="qGetShowcaseApplicationInsert"  DATASOURCE="photoeyecom">
		INSERT into GalleryApplicationPortfolios (ID, OrderId, Statement_P, PortfolioNo) 
   		VALUES (#qGetShowcaseApplicationInfo.ID#, #url.id#, '#form.statement#', #qGetShowcaseApplicationInfo.PortfolioCredits#)   
	</CFQUERY>
<cfelse>
	<CFQUERY NAME="qGetShowcaseApplication"  DATASOURCE="photoeyecom">
  		UPDATE GalleryApplicationPortfolios set Statement_P='#form.statement#'
 		 WHERE OrderId = #url.id# and PortfolioNo=#qGetShowcaseApplicationInfo.PortfolioCredits#
	</CFQUERY>
</cfif>

<CFQUERY NAME="qGetShowcaseApplication1"  DATASOURCE="photoeyecom">
  		UPDATE GalleryApplication set Step4='1'
  		WHERE OrderId = #url.id#
</CFQUERY>

<cfinclude template="header.cfm">

<body>
<cfoutput>
<div style="padding-top:200px;">
<table align="center"><tr><td align="center">
<p align="center">
<form action="TitleList.cfm?id=#url.id#" method="post">

You Process Statement has been submitted!<br><br>
<INPUT TYPE="SUBMIT" VALUE="Continue to Step 5">
</form>
</p>
</td></tr>
<cfinclude template="footer.cfm">
</table>
</div>
</cfoutput>

</body>
</html>