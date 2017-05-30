<cfparam name="form.multiartists" default="0">

<cftransaction>


<!--- Added 03/10/2003 to update GuideIDNumber --->

<CFQUERY NAME="qGetGuideNextIDNumber" DATASOURCE="photoeyecom">
select * from GuideNextIDNumber
</cfquery>

<cfset xGuideID = qGetGuideNextIDNumber.NextID>
<cfset xNextGuideID = qGetGuideNextIDNumber.NextID+1>

<cfquery name="qupdateGuideNextIDNumber" datasource="photoeyecom">
	Update GuideNextIDNumber set NextID=#xNextGuideID#
</cfquery>


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
  INSERT INTO GallerySetup  (Recordno, GuideID, Custnumber, Email, Password, Hint, Subdirectory, Gallery, Firstname, Lastname, ImageQty, MultiArtists, ImagesOK)
           VALUES (#nextrecordno#, #xGuideID#, '#Form.Custnumber#', '#Form.Email#', '#Form.Password#', '#Form.Hint#', '#trim(Form.Firstname)##trim(Form.Lastname)#', '#Form.Gallery#', '#Form.Firstname#', '#Form.Lastname#', '#Form.ImageQty#', #Form.MultiArtists#, 1)
</CFQUERY>

<CFQUERY NAME="qInsertNewCustomer2" DATASOURCE="photoeyecom">
  INSERT INTO GALLERYPORTFOLIO  (Custnumber, ID,  Title, SubDirectory,  ImgQty, BackgroundColor, Step11, Step12, Step13, Step14, ImagesOK, ShowcaseOK, Weight, Datetime)
           VALUES ('#Form.Custnumber#', '#Form.Custnumber#', 'Portfolio 1', 'Portfolio1', '#Form.ImageQty#', '000000', 0, 0, 0, 0, 0, 0, 0, '#DateFormat(Now())#')
</CFQUERY>




<CFQUERY NAME="qInsertNewDefault" DATASOURCE="photoeyecom">
  INSERT INTO GALLERYDEFAULTPHOTOS  (Custnumber, SubDirectory, PortfolioName)
           VALUES (#Form.Custnumber#, 'Portfolio1', 'Portfolio 1')
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


<CFQUERY NAME="qGetGalleryIndividualPhotos" DATASOURCE="photoeyecom">
  INSERT INTO GALLERYINDIVIDUALPHOTOS  (RecordNo, Custnumber, PortfolioName, ImageNumber, ImagePosition, Selected)
           VALUES (#nextrecordno#, #Form.Custnumber#, 'Portfolio1', #ImageNumber#, #ImageNumber#, 1)
</CFQUERY>

<!--- <CFQUERY NAME="qInsertNewCustomer2" DATASOURCE="photoeyecom">
  INSERT INTO GALLERYDEFAULTPHOTOS  (Custnumber, SubDirectory)
           VALUES (#Form.Custnumber#, '#Form.PortfolioName#')
</CFQUERY> --->

<cfset Imagenumber=Imagenumber+1>

</cfloop>

 



<!--- Now Create the directories--->
<CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
  SELECT SubDirectory, Gallery
  FROM GallerySetup where Custnumber=#form.Custnumber#
</CFQUERY>

<CFSET SUBDIRECTORY1 = #qGetShowcaseSetupInfo.Subdirectory#>

<cfoutput query="qGetShowcaseSetupInfo">
<CFSET thisDirectory = "#xRelativePath#\Artists\#Subdirectory1#">
<cfif DirectoryExists(thisDirectory) is 'NO'>
	<cfdirectory action="CREATE" DIRECTORY="#xRelativePath#\Artists\#Subdirectory1#">
</cfif>

<!---Create the Artist Portfolio1 Subdirectory if it doesn't already exist--->
<CFSET thisDirectory = "#xRelativePath#\Artists\#Subdirectory1#\Portfolio1">
<cfif DirectoryExists(thisDirectory) is 'NO'>
	<cfdirectory action="CREATE" DIRECTORY="#xRelativePath#\Artists\#Subdirectory1#\Portfolio1">
</cfif>

</cfoutput>

</cftransaction>
<!--- 

<cfinclude template="CreateNewPhotographerDirectoriesandFiles.cfm"> --->

	
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>

	<title>photo-eye Photographer's Showcase</title>
</head>


<body bgcolor="#cccc99" link="BLUE" vlink="#000080">

	Inserted New Photographer and their Template Files!

</body>
</html>
