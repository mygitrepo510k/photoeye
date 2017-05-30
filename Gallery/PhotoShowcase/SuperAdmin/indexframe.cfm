<!--- <CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup
  WHERE Custnumber = '#Custnumber#' 
</CFQUERY>
 --->
 
<!---  <cfset custnumber='10045'> --->
<html>
<head>
<title>photo-eye Photographer's Showcase</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<base target="mainFrame"> 
<body bgcolor="#000000" text="#CCCCCC" leftmargin="5" topmargin="10" link="#FFFFCC" vlink="#99FF99" alink="#CC0000">
 <font face="Verdana,Arial,Helvetica,sans-serif" size="2">
  <img src="../SharedImages/photo-eye%20Explore%20NewLogo_photoShowcaseVersionReversed.jpg" width="151" height="94"></font>
<table width="100%" border="0">
  <tr>
   <td><font face="Arial,Helvetica,sans-serif" size="4"><b> 
   <font color="Yellow">Super Admin </font></b></font><br></td>
  </tr>
<!---   <tr> 
    <td><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
      <font color="#FFFFFF">Introduction</font></b></font></td>
  </tr> --->
<!---   <tr> 
    <td><font face="Verdana,Arial,Helvetica,sans-serif" size="2">
	<a href="intro.cfm?custnumber=<cfoutput>#Custnumber#</cfoutput>">Overview</a></font></td>
  </tr> --->
  <tr> 
    <td><font face="Verdana,Arial,Helvetica,sans-serif" size="2"></font></td>
  </tr>
  <tr> 
    <td><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b><font color="#FFFFFF">
      Table of Contents </font></b><br><br></font></td>
  </tr>
  <tr> 
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">
	<a href="createnewartistfiles.cfm">Create New Artist &amp; Portfolio 1</a><!--- ?custnumber=<cfoutput>#Custnumber# </cfoutput>"--->
	</font><br><br></td>
  </tr>
<!---     <tr> 
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">
	<a href="createnewindividualPhotosDatabaseEntries.cfm?custnumber=<cfoutput>#Custnumber#</cfoutput>">Create New Artist Individual Photos Database Entries</a>
	</font><br><br></td>
  </tr> --->
    <tr> 
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">
	<a href="createnewportfolio.cfm">Create Additional Portfolios</a>
	</font><br><br></td>
  </tr>

   <tr> 
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">
	<a href="ImagesOK.cfm">Allow Artist Access to Setup<br>(Images Uploaded)
	</a> 
      </font><br><br></td>
  </tr>
     <tr> 
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">
	<a href="ShowcaseOK.cfm">Turn Showcase Portfolio On<br>(Everything is Complete)
	</a> 
      </font><br><br></td>
  </tr>
  <tr> 
     <tr> 
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">
	<a href="RandomizeNumbers.cfm"> Randomize Numbers
	</a> 
      </font><br><br></td>
  </tr>
  <br>
        <tr> 
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">
	<a href="createAdditionalGalleryIndividualPhotosRows.cfm">Insert Additional GalleryIndividualPhotos Rows</a>
	</font><br><br></td>
  </tr>
<!---   <tr> 
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">
	<a href="step2ChronologyURLNew.cfm">Update/Reset Artist
	 Data</a> 
      </font><br><br></td>
  </tr> --->
  
    <tr> 
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">
	<a href="AllowSequencingAllImages.cfm">Allow Sequencing of All Images</a><br>
	Including Signature Image

      </font><br><br></td>
  </tr>
  
  
  <tr> 
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">
	<a href="GetPassword.cfm">Retrieve Artist
	 Password</a> 
      </font><br><br></td>
  </tr>
    <tr> 
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">
	<a href="GetApplicant.cfm">View Applicant Bio</a> 
      </font><br><br></td>
  </tr>
<!---   <tr> 
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">
	<a href="step4SoloShowsURLNew.cfm">Reset Artist Stats</a> 
      </font><br><br></td>
  </tr> --->
   <tr> 
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">
	<a href="CopyrightDate.cfm">Change Copyright Date</a>
      </font><br><br></td>
  </tr>
 
    <tr> 
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">
	<a href="RefreshTemplateFiles.cfm">Upload Template Files</a>
      </font><br><br></td>
  </tr>
    
      <tr> 
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">
	<a href="RefreshImage1TemplateFiles.cfm">Upload Image1.cfm Template Files</a>
      </font><br><br></td>
  </tr>
  
        <tr> 
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">
	<a href="../../../templates/veritybyshowcasekeyword.cfm">Reindex Search Engine</a>
      </font><br><br></td>
  </tr>

  <tr> 
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">
	<a href="CreateNewArtistDirectories.cfm">Create New Artist Directories</a>
      </font><br><br></td>
  </tr>
  
    
    <tr> 
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">
	<a href="../../Randomizekeywords.cfm?requesttimeout=10000">Refresh All Showcase Static Pages</a>
      </font><br><br></td>
  </tr> 

   <tr> 
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">
	<a href="ShowcaseNotOk.cfm">Remove Showcase Portfolio</a>
      </font><br><br></td>
  </tr> 
    
  <tr> 
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">
	<a href="StatsAdmin.cfm?RequestTimeout=500">Stats</a>
      </font><br><br></td>
  </tr>
  
  <tr> 
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">
	<a href="../../../emailnewsletter/sendEmailNewsletterAdmin.cfm">Send Email Newsletter</a>
      </font><br><br></td>
  </tr>
  
  <tr> 

    <td width="75%">&nbsp;</td>
  </tr>
  <tr> 

    <td width="75%">&nbsp;</td>
  </tr>
</table>

</body>
</html>
