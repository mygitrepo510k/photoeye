
<CFQUERY NAME="qGetPassword"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup where UPPER(GALLERYSETUP.Firstname)='#UCASE(form.Firstname)#' and
  UPPER(GALLERYSETUP.lastname)='#UCASE(form.Lastname)#';
</CFQUERY>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>

<cfoutput>
Here is the custnumber for #form.Firstname# #form.Lastname#:<br><br>
#qGetPassword.Password#<br>
<br>


</cfoutput>


</body>
</html>
