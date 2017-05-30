<CFQUERY NAME="qUpdateSuperAdmin" DATASOURCE="photoeyecom" dbtype="ODBC">
   UPDATE SuperAdmin Set CopyrightDate='#form.CopyrightDate#'
</CFQUERY>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase</title>
</head>

<body bgcolor="gray" link="#000080" vlink="#000080">
<font face="Verdana,Geneva,Arial,Helvetica,sans-serif" color="White" size="2">
<cfoutput>
<br><br><br><br>
<p align="center">
Copyright Date has been updated to #form.CopyrightDate#!
</p>
</cfoutput>
</font>

</body>
</html>
