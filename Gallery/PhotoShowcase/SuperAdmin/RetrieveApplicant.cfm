<!--- Make sure the old record (if re-applying doesn't appear --->

<CFQUERY NAME="qGetUserInfoNew"  DATASOURCE="photoeyecom">
  SELECT top 1 *
  FROM UserInfoNew where UPPER(Firstname)='#UCASE(form.Firstname)#' and
  UPPER(Lastname)='#UCASE(form.Lastname)#' order by orderid desc
</CFQUERY>

<!--- <cfdump var="#qGetUserInfonew#">
<cfabort> --->


<!--- <CFQUERY NAME="qGetApplicationBio"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryApplication, GalleryApplicationPortfolios where GalleryApplication.OrderID=#qGetUserInfoNew.OrderID# and GalleryApplication.OrderID=GalleryApplicationPortfolios.OrderID Order by PortfolioNo
</CFQUERY>  --->


<CFQUERY NAME="qGetApplicationBio"  DATASOURCE="photoeyecom">
  SELECT GalleryApplication.Bio as Bio, GalleryApplicationPortfolios.statement as statement, GalleryApplicationPortfolios.statement_p as statement_p, GalleryApplicationPortfolios.titlelist as titlelist, 
GalleryApplicationPortfolios.portfoliono as portfoliono
  FROM GalleryApplication, GalleryApplicationPortfolios where GalleryApplication.OrderID=#qGetUserInfoNew.OrderID# and GalleryApplication.OrderID=GalleryApplicationPortfolios.OrderID Order by PortfolioNo
</CFQUERY>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase | View Application</title>
</head>

<body>
<br><br><br>
<cfoutput>
<table width="400" align="center"><tr><td>
<font face="Verdana, Arial, Helvetica, Sans-Serif" size="2">
Photographer's Showcase Applicant<br>
<b>#qGetUserInfoNew.Firstname# #qGetUserInfoNew.Lastname#</b><br><br>
<cfif len(trim(qGetApplicationBio.Bio)) GT 0>
<b>Bio:</b><br>
#qGetApplicationBio.Bio#<br><br>
</cfif>
</cfoutput>

<cfset xMultipleStatements = 0>
<cfset xMultipleStatements_P = 0>

<cfoutput query="qGetApplicationBio">
	<cfif len(trim(qGetApplicationBio.Statement)) GT 0>
<b>Statement:</b><br>
<cfif xMultipleStatements is 1>
<b>Portfolio No. #qGetApplicationBio.PortfolioNo#</b><br></cfif>
#qGetApplicationBio.Statement#<br><br>
<cfset xMultipleStatments = 1>
</cfif>

<cfif len(trim(qGetApplicationBio.Statement_P)) GT 0>
<cfif xMultipleStatements_P is 1>
<b>Portfolio No. #qGetApplicationBio.PortfolioNo#</b><br></cfif>
<b>Process Statement:</b><br>
#qGetApplicationBio.Statement_P#<br><br>
<cfset xMultipleStatments_P = 1>
</cfif>

</cfoutput>

<cfoutput query="qGetApplicationBio">
<cfif len(trim(qGetApplicationBio.TitleList)) GT 0>
<b>Portfolio No. #qGetApplicationBio.PortfolioNo#</b><br>
<b>Title List:</b><br>
#qGetApplicationBio.TitleList#<br><br>
</cfif>
</cfoutput>

</font>
</td></tr></table>



</body>
</html>
