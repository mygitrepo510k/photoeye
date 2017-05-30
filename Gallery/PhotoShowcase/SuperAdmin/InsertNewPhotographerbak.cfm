<CFQUERY NAME="qInsertSetupRecordNo" DATASOURCE="photoeyecom">
select * from gallerysetup
</cfquery>

<cfset maxrecordno=0>
<cfloop query="qInsertSetupRecordNo">
	<cfif #recordno# GT maxrecordno>
		<cfset maxrecordno=#recordno#>
	</cfif>
</cfloop>
<cfset nextrecordno=#maxrecordno#+1>

<CFQUERY NAME="qInsertNewCustomer" DATASOURCE="photoeyecom">
  INSERT INTO GallerySetup  (RecordNo, Custnumber, Email, Password, Hint, Subdirectory, Gallery, Firstname, Lastname)
           VALUES (#nextrecordno#, '#Form.Custnumber#', '#Form.Email#', '#Form.Password#', '#Form.Hint#', '#Form.Subdirectory#', '#Form.Gallery#', '#Form.Firstname#', '#Form.Lastname#')
</CFQUERY>

<CFQUERY NAME="qInsertNewCustomer2" DATASOURCE="photoeyecom">
  INSERT INTO GALLERYPORTFOLIO  (Custnumber, ID, Title, ImgQty, BackgroundColor, Step11, Step12, Step13, Step14, ImagesOK, ShowcaseOK, Weight)
           VALUES ('#Form.Custnumber#', '#Form.Custnumber#', '', '#Form.BackgroundColor#', 0, 0, 0, 0, 0, 0, 0, 0)
</CFQUERY>
	
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>

	<title>photo-eye Photographer's Showcase</title>
</head>


<body bgcolor="#cccc99" link="BLUE" vlink="#000080">

	Inserted New Photographer!

</body>
</html>
