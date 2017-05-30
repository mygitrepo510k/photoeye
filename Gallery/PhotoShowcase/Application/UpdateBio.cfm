<!--- <CFQUERY NAME="qGetShowcaseApplicationSelect"  DATASOURCE="photoeyecom">
  Select * from GalleryApplication WHERE OrderId = #url.id#
</CFQUERY> --->

<CFQUERY NAME="qGetShowcaseApplication"  DATASOURCE="photoeyecom">
  		UPDATE GalleryApplication set Bio='#form.bio#', Step2='1'
  		WHERE OrderId = #url.id#
</CFQUERY>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase | Setup</title>
</head>

<body>
<cfoutput>
<table align="center"><tr><td align="center">
<p align="center">
<form action="Statement.cfm?id=#url.id#" method="post">
You bio has been submitted!<br><br>
<INPUT TYPE="SUBMIT" VALUE="Continue to Step 3">
</p>
</td></tr></table>
</cfoutput>
</form>

</body>
</html>
