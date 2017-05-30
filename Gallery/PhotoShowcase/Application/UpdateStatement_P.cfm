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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase | Application</title>
</head>

<body>
<cfoutput>
<table align="center"><tr><td align="center">
<p align="center">
<form action="TitleList.cfm?id=#url.id#" method="post">

You Process Statement has been submitted!<br><br>
<INPUT TYPE="SUBMIT" VALUE="Continue to Step 5">
</form>
</p>
</td></tr></table>
</cfoutput>

</body>
</html>