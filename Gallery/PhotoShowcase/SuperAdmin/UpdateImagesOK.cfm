
<CFQUERY NAME="qUpdateImagesOK" DATASOURCE="photoeyecom">
  UPDATE GALLERYSETUP SET IMAGESOK=1 WHERE CUSTNUMBER=#FORM.CUSTNUMBER#;
</CFQUERY>

<CFQUERY NAME="qGetArtist" DATASOURCE="photoeyecom">
  SELECT FIRSTNAME, LASTNAME, CUSTNUMBER FROM GALLERYSETUP WHERE CUSTNUMBER=#FORM.CUSTNUMBER#;
</CFQUERY>
	

	
	
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>

	<title>photo-eye Photographer's Showcase</title>
</head>


<body bgcolor="#cccc99" link="BLUE" vlink="#000080">
<cfoutput>
	<cfif qGetArtist.recordcount GT 0>
	Updated Images OK for #QGetArtist.FirstName# #qGetArtist.Lastname#! Now they will be able to Setup their showcase and an email has been sent with access information.

<br><br><br>
<!--- <a href="mailto:#Form.Email#?Subject=Access to setup your portfolio">Email Customer</a> --->

<cfinclude template="emailReadyforSetup.cfm"> 

	<cfelse>
		Sorry, customer number was not found!
	</cfif>
</cfoutput>

</body>
</html>