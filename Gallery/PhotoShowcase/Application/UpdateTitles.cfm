<CFQUERY NAME="qGetShowcaseApplicationInfo"  DATASOURCE="photoeyecom">
  Select * from GalleryApplication WHERE OrderId = #url.id#
</CFQUERY>

<CFQUERY NAME="qGetShowcaseApplicationSelect"  DATASOURCE="photoeyecom">
  Select * from GalleryApplicationPortfolios WHERE OrderId = #url.id# and PortfolioNo=#qGetShowcaseApplicationInfo.PortfolioCredits#
</CFQUERY>

<cfif qGetShowcaseApplicationSelect.recordcount is 0>
	<CFQUERY NAME="qGetShowcaseApplicationInsert"  DATASOURCE="photoeyecom">
		INSERT into GalleryApplicationPortfolios (ID, OrderId, TitleList, PortfolioNo) 
   		VALUES (#qGetShowcaseApplicationInfo.id#, #url.id#, '#form.TitleList#', #qGetShowcaseApplicationInfo.PortfolioCredits#)   
	</CFQUERY>
<cfelse>
	<CFQUERY NAME="qGetShowcaseApplication"  DATASOURCE="photoeyecom">
  		UPDATE GalleryApplicationPortfolios set TitleList='#form.TitleList#'
 		 WHERE OrderId = #url.id# and PortfolioNo=#qGetShowcaseApplicationInfo.PortfolioCredits#
	</CFQUERY>
</cfif>
	
<CFQUERY NAME="qGetShowcaseApplication1"  DATASOURCE="photoeyecom">
  		UPDATE GalleryApplication set Step5='1'
  		WHERE OrderId = #url.id#
</CFQUERY>
<!--- 



<CFQUERY NAME="qGetShowcaseApplicationSelect"  DATASOURCE="photoeyecom">
  Select Min(TitleListPortfolioNo) as MinTitleListPortfolioNo from GalleryApplication WHERE Custnumber = #url.id#
</CFQUERY>


<cfif qGetShowcaseApplicationSelect.recordcount is 0>
	<CFQUERY NAME="qGetShowcaseApplicationInsert"  DATASOURCE="photoeyecom">
		INSERT into GalleryApplication (Custnumber, TitleList, TitleListPortfolioNo) 
   		VALUES (#url.id#, '#form.TitleList#',  #qSetApplyPortfolioQtyBeforeFileisUploaded.ApplyPortfolioQty#)   
	</CFQUERY>
<cfelse>
	<cfif qGetShowcaseApplicationSelect.MinTitleListPortfolioNo is 0>
	<CFQUERY NAME="qGetShowcaseApplication"  DATASOURCE="photoeyecom">
  		UPDATE GalleryApplication set TitleListPortfolioNo=#qSetApplyPortfolioQtyBeforeFileisUploaded.ApplyPortfolioQty#
  		WHERE Custnumber = #url.id# 
	</CFQUERY>
	</cfif>
	
	<cfif qGetShowcaseApplicationSelect.MinTitleListPortfolioNo is not qSetApplyPortfolioQtyBeforeFileisUploaded.ApplyPortfolioQty>
	<CFQUERY NAME="qGetShowcaseApplicationInsert"  DATASOURCE="photoeyecom">
		INSERT into GalleryApplication (Custnumber, TitleList, TitleListPortfolioNo) 
   		VALUES (#url.id#, '#form.TitleList#',  #qSetApplyPortfolioQtyBeforeFileisUploaded.ApplyPortfolioQty#)   
	</CFQUERY>
	<cfelse>
	<CFQUERY NAME="qGetShowcaseApplication"  DATASOURCE="photoeyecom">
  		UPDATE GalleryApplication set TitleList='#form.titlelist#', TitleListPortfolioNo=#qSetApplyPortfolioQtyBeforeFileisUploaded.ApplyPortfolioQty#
  		WHERE Custnumber = #url.id# and TitleListPortfolioNo=#qSetApplyPortfolioQtyBeforeFileisUploaded.ApplyPortfolioQty#
	</CFQUERY>
	</cfif>
</cfif>
 --->


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase | Application</title>
</head>

<body>
<cfoutput>
<table align="center"><tr><td align="center">
<p align="center">
<form action="UploadImages.cfm?id=#url.id#" method="post">

You Title List has been submitted!<br><br>
<INPUT TYPE="SUBMIT" VALUE="Continue to Step 6">
</form>
</p>
</td></tr></table>
</cfoutput>

</body>
</html>