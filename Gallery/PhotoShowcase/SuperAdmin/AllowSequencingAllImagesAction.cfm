<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye</title>
</head>

<body>

<!--- Get Custnumber first --->
<CFQUERY NAME="qGetCustnumber"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup where UPPER(GALLERYSETUP.Firstname)='#UCASE(form.Firstname)#' and
  UPPER(GALLERYSETUP.lastname)='#UCASE(form.Lastname)#';
</CFQUERY>

<cfif qGetCustnumber.recordcount GT 1>
	Get Rick! There are more than one records for this name.
	<cfabort>
<cfelseif qGetCustnumber.recordcount is 0>
	Get Rick! Artist Not Found! 
	<cfabort>
</cfif>

<!--- Retrieve Portfolio --->
<CFQUERY NAME="qGetPortfolio"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryPortfolio where CUSTNUMBER=#qGetCustnumber.custnumber# and SubDirectory = 'Portfolio#trim(form.portfoliono)#';
</CFQUERY>

<cfif qGetCustnumber.recordcount GT 1>
	Get Rick! There are more than one records for this name.
	<cfabort>
<cfelseif qGetCustnumber.recordcount is 0>
	Get Rick! Portfolio Not Found! 
	<cfabort>
</cfif>


<cfif #form.Change# is "Unrestricted Sequencing">
	<!--- Change SequenceAll  --->
	<CFQUERY NAME="qUpdatePortfolio"  DATASOURCE="photoeyecom">
  		Update GalleryPortfolio
  		SET SequenceAll = 1
		Where CUSTNUMBER=#qGetCustnumber.custnumber# and 		SubDirectory = 'Portfolio#trim(form.portfoliono)#';
	</CFQUERY>
	Update Sucessful! <br>
	<br>
	Now the entire portfolio, including the signature image, may now be sequenced.
   		
<cfelseif #form.Change# is "Restricted">
	<!--- Change SequenceAll  --->
	<CFQUERY NAME="qUpdatePortfolio"  DATASOURCE="photoeyecom">
  		Update GalleryPortfolio
  		SET SequenceAll = 0
		Where CUSTNUMBER=#qGetCustnumber.custnumber# and 		SubDirectory = 'Portfolio#trim(form.portfoliono)#';
	</CFQUERY>
	Update Sucessful! <br>
	<br>
	The signature image cannot be changed.
</cfif>

</body>
</html>
