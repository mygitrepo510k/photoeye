<!--- <cfquery name="qGetArtist" DATASOURCE="photoeyecom">
	SELECT * FROM GALLERYSETUP WHERE CUSTNUMBER=#Form.Custnumber#
</cfquery> --->
<cftransaction>

<CFQUERY NAME="qInsertNewPortfolio" DATASOURCE="photoeyecom">
  INSERT INTO GALLERYPORTFOLIO  (Custnumber, ID, Title, Subdirectory, ImgQty, BackgroundColor, Step11, Step12, Step13, Step14, ImagesOK, ShowcaseOK, Weight, BgHeaderColor, DateTime)
           VALUES (#Form.Custnumber#, #Form.Custnumber#,  'Portfolio#LEFT(Form.Title,2)#', 'Portfolio#Form.Title#',  #Form.Imageqty#, '000000', 0, 0, 0, 0, 0, 0, 0, '333333','#DateFormat(Now())#')
</CFQUERY>

<CFQUERY NAME="qInsertNewDefault" DATASOURCE="photoeyecom">
  INSERT INTO GALLERYDEFAULTPHOTOS  (Custnumber, SubDirectory, PortfolioName)
           VALUES (#Form.Custnumber#, 'Portfolio#Form.Title#', 'Portfolio# Form.Title#')
</CFQUERY>

<!--- Get Max recordno from Gallery Individual Photos --->
<CFQUERY NAME="qGetGalleryIndividualPhotos" DATASOURCE="photoeyecom">
  SELECT * FROM GALLERYINDIVIDUALPHOTOS ORDER BY RECORDNO
</CFQUERY>

<cfset maxrecordno=0>
<cfloop query="qGetGalleryIndividualPhotos">
	<cfif #recordno# GT maxrecordno>
		<cfset maxrecordno=#recordno#>
	</cfif>
</cfloop>
<cfset nextrecordno=#maxrecordno#>

<cfset Imagenumber=1>

<cfloop index="ImageQtyx" from="1" to="#form.imageqty#">
	<cfset nextrecordno=nextrecordno+1>
	
	
	<CFQUERY NAME="qInsertNewCustomer2" DATASOURCE="photoeyecom">
	  INSERT INTO GALLERYINDIVIDUALPHOTOS  (RecordNo, Custnumber, PortfolioName, ImageNumber, ImagePosition, Selected)
	           VALUES (#nextrecordno#, #Form.Custnumber#, 'Portfolio#Form.Title#', #ImageNumber#, #ImageNumber#, 1)
	</CFQUERY>
	
	<!--- <CFQUERY NAME="qInsertNewCustomer2" DATASOURCE="photoeyecom">
	  INSERT INTO GALLERYDEFAULTPHOTOS  (Custnumber, SubDirectory)
	           VALUES (#Form.Custnumber#, '#Form.PortfolioName#')
	</CFQUERY> --->
	
	<cfset Imagenumber=Imagenumber+1>

</cfloop>








<cfoutput>


<CFSET SUBDIRECTORY1 = '#trim(form.firstname)##trim(form.lastname)#'>
<CFSET NEWPORTFOLIO = 'Portfolio#Form.Title#'>


<!--- <cfoutput query="qGetShowcaseSetupInfo"> --->

<!--- Now Create the template files and directories--->
<!---Create the Artist Subdirectory if it doesn't already exist--->

<CFSET thisDirectory = "#xRelativePath#\Artists\#Subdirectory1#">

<cfif DirectoryExists(thisDirectory) is 'NO'>
	<cfdirectory action="CREATE" DIRECTORY="#xRelativePath#\Artists\#Subdirectory1#">
</cfif>


<!---Create the Artist Portfolio1 Subdirectory if it doesn't already exist--->
<CFSET thisDirectory = "#xRelativePath#\Artists\#Subdirectory1#\#NEWPORTFOLIO#">
<cfif DirectoryExists(thisDirectory) is 'NO'>
	<cfdirectory action="CREATE" DIRECTORY="#xRelativePath#\Artists\#Subdirectory1#\#NewPortfolio#">
</cfif>

<!--- Create the next directory if it doesn't already exist--->

<!--- <CFSET thisDirectory = "d:\html\users\cfxa905\photoeyecom\html\gallery\#form.GALLERY#\Artists\#Subdirectory1#\Portfolio1\Images_From_Photographer">
<cfif DirectoryExists(thisDirectory) is 'NO'>
	<cfdirectory action="CREATE" DIRECTORY="d:\html\users\cfxa905\photoeyecom\html\gallery\#form.GALLERY#\Artists\#Subdirectory1#\Portfolio1\Images_From_Photographer">
</cfif> --->
<br>
</cfoutput>

</cftransaction>

	
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>

	<title>photo-eye Photographer's Showcase</title>
</head>


<body bgcolor="#cccc99" link="BLUE" vlink="#000080">

	Inserted New Portfolio!

</body>
</html>
