<CFIF ISDEFINED("url.id") is false>
	<CFSET CurrentOrderId=0>
<CFELSE>
	<CFSET CurrentOrderId=#url.id#>
</CFIF>

<!--- <CFQUERY NAME="qGetShowcaseApplicationSelect" DATASOURCE="photoeyecom">
	select * from UserInfoNew where OrderID = #CurrentOrderId#
</cfquery>	
	
<CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="PhotoEyecom">
  SELECT *
  FROM UserInfoNew
  WHERE Custnumber = #url.id# and (titlelistportfoliono=#qGetShowcaseApplicationSelect.PortfolioCredits# or titlelistportfoliono=0)
</CFQUERY>  --->

<CFQUERY NAME="qGetShowcaseApplicationSelect" DATASOURCE="photoeyecom">
	select PortfolioCredits from GalleryApplication where OrderID = #url.id#
</cfquery>	

<CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="PhotoEyecom">
  SELECT *
  FROM UserInfoNew
  WHERE OrderId = #url.id# 
</CFQUERY>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Upload Photos Template</title>
	
	
</head>

<SCRIPT LANGUAGE=JAVASCRIPT TYPE="TEXT/JAVASCRIPT">
	<!-- Hide script from old browsers

	function openWindow() {
		newWindow = window.open('', 'popupWin', 'toolbar=yes,location=yes,scrollbars=yes,width=300,height=200')
	}

	function closeWindow() {
		if (newWindow && !newWindow.closed) {
			newWindow.close()
		}
	}

	// End hiding script from old browsers -->
	</SCRIPT>	
	

	

<body bgcolor="#999999" text="BLACK" link="navy" vlink="navy" alink="navy" onLoad="javascript:openWindow(); javascript:closeWindow();"> 

<cfoutput>




<!---Check to see if directory already exists, if not, create it--->
<CFIF DirectoryExists("#xserverpath#\gallery\PhotoShowcase\Application\Submissions\#qGetShowcaseSetupInfo.FirstName##qGetShowcaseSetupInfo.LastName#\") is "No"> 

<CFDIRECTORY ACTION="Create"
    DIRECTORY="#xserverpath#\gallery\PhotoShowcase\Application\Submissions\#qGetShowcaseSetupInfo.FirstName##qGetShowcaseSetupInfo.LastName#\">

</cfif>

<!---Check to see if directory already exists, if not, create it--->
<CFIF DirectoryExists("#xserverpath#\gallery\PhotoShowcase\Application\Submissions\#qGetShowcaseSetupInfo.FirstName##qGetShowcaseSetupInfo.LastName#\Portfolio#qGetShowcaseApplicationSelect.PortfolioCredits#\") is "No"> 

<CFDIRECTORY ACTION="Create"
    DIRECTORY="#xserverpath#\gallery\PhotoShowcase\Application\Submissions\#qGetShowcaseSetupInfo.FirstName##qGetShowcaseSetupInfo.LastName#\Portfolio#qGetShowcaseApplicationSelect.PortfolioCredits#\">


</cfif>

<!--- 
<cfif qGetShowcaseApplicationSelect.PortfolioCredits is 1>

<CFDIRECTORY ACTION="Create"
    DIRECTORY="#xserverpath#\gallery\PhotoShowcase\Artists\#qGetShowcaseSetupInfo.FirstName##qGetShowcaseSetupInfo.LastName#\RawImages1\">

<cfelseif qGetShowcaseApplicationSelect.PortfolioCredits is 2>

<CFDIRECTORY ACTION="Create"
DIRECTORY="#xserverpath#\gallery\PhotoShowcase\Artists\#qGetShowcaseSetupInfo.FirstName##qGetShowcaseSetupInfo.LastName#\RawImages2\">

<cfelseif qGetShowcaseApplicationSelect.PortfolioCredits is 3>

<CFDIRECTORY ACTION="Create"
DIRECTORY="#xserverpath#\gallery\PhotoShowcase\Artists\#qGetShowcaseSetupInfo.FirstName##qGetShowcaseSetupInfo.LastName#\RawImages3\">

<cfelseif qGetShowcaseApplicationSelect.PortfolioCredits is 4>

<CFDIRECTORY ACTION="Create"
DIRECTORY="#xserverpath#\gallery\PhotoShowcase\Artists\#qGetShowcaseSetupInfo.FirstName##qGetShowcaseSetupInfo.LastName#\RawImages4\">

<cfelseif qGetShowcaseApplicationSelect.PortfolioCredits is 5>

<CFDIRECTORY ACTION="Create"
DIRECTORY="#xserverpath#\gallery\PhotoShowcase\Artists\#qGetShowcaseSetupInfo.FirstName##qGetShowcaseSetupInfo.LastName#\RawImages5\">

</cfif> --->

<cfloop index="i" from="1" to="20">

	<cfif Len(Evaluate('form.FileName#i#'))>
		<cfset request.uploadtemp = "C:\inetpub\wwwroot\Clients\file_sandbox" />
	<!--- 	<cfset request.mainuploadpath = "C:\inetpub\wwwroot\Clients\photoeyecom\html\test1\uploaded" /> --->
		<cfset request.badext ="cfml,cfm,asp,shtml,php,cgi" />
		<cfset request.accept ="image/gif,image/jpeg,image/pjpeg,image/jpg,image/png" />
		<cffile action="UPLOAD" 
			filefield="form.FileName#i#" 
			destination="#request.uploadtemp#\"
			nameConflict="MakeUnique" />
		<cfset request.tmpfilename = CFFile.ServerFile />
	
	<!--- 	<cfdump var="#CFFile#" /><cfabort /> --->
	
		<cfset request.filetype = CFFile.ContentType & "/" & CFFile.ContentSubType />
		<cfif ListFindNoCase(request.accept, request.filetype) AND NOT
			ListFindNoCase(request.badext, CFFile.ClientFileExt)>
			<cftry>
				<cfimage action="info" 
					source="#request.uploadtemp#\#request.tmpfilename#"
					structname="uploadedImageTest" />
				<cfset errorFound = false />
				<cfcatch>
					<cfset errorFound = true />
					<cfset sanitize_flash = "Not a valid image." />
				</cfcatch>
			</cftry>
			<cfif NOT errorFound>			
					<cfset request.clientfile = CFFile.ClientFile />
					<cfset sanitize_flash = "File passed inspection." />
			</cfif>
		<cfelse>
			<cfset sanitize_flash = "The file format provided (#CFFile.ContentType#/#CFFile.ContentSubType#) is not allowed." />
			<cfset errorFound = true />
		</cfif>
		
		<cfif NOT errorFound>
		    <!--- Perform final file activity --->
		    <cfif Len(request.clientfile)>
		      <cfset request.filename="#request.clientfile#">
		      <cffile action="MOVE" 
		        source="#request.uploadtemp#\#request.tmpfilename#" 
		        destination="#xserverpath#\gallery\PhotoShowcase\Application\Submissions\#qGetShowcaseSetupInfo.FirstName##qGetShowcaseSetupInfo.LastName#\Portfolio#qGetShowcaseApplicationSelect.PortfolioCredits#\#request.tmpfilename#" 
		        nameConflict="OVERWRITE">
		    </cfif>
		<cfelse>
			<cftry>
				<cffile action="DELETE"
					file="#request.uploadtemp#\#CFFile.ServerFile#">
				<cfcatch>
					Could not delete invalid file.
				</cfcatch>
			</cftry>
		</cfif>
	</cfif>	
	
</cfloop>

	<cfif errorFound>
		<div style="color:white;text-align:center;"></div><cfoutput> One or more images failed to upload: #sanitize_flash#</cfoutput><cfabort />
	</cfif>
	
<!---

	<cfif #Trim(form.FileName1)# is not "">
	
	<cffile destination="#xserverpath#\gallery\PhotoShowcase\Application\Submissions\#qGetShowcaseSetupInfo.FirstName##qGetShowcaseSetupInfo.LastName#\Portfolio#qGetShowcaseApplicationSelect.PortfolioCredits#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName1">
	</cfif>
	
	<cfif #Trim(form.FileName2)# is not "">
	<cffile destination="#xserverpath#\gallery\PhotoShowcase\Application\Submissions\#qGetShowcaseSetupInfo.FirstName##qGetShowcaseSetupInfo.LastName#\Portfolio#qGetShowcaseApplicationSelect.PortfolioCredits#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName2">
	</cfif> 
	
	<cfif #Trim(form.FileName3)# is not "">
	<cffile destination="#xserverpath#\gallery\PhotoShowcase\Application\Submissions\#qGetShowcaseSetupInfo.FirstName##qGetShowcaseSetupInfo.LastName#\Portfolio#qGetShowcaseApplicationSelect.PortfolioCredits#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName3">
	</cfif>
	
	<cfif #Trim(form.FileName4)# is not "">
	<cffile destination="#xserverpath#\gallery\PhotoShowcase\Application\Submissions\#qGetShowcaseSetupInfo.FirstName##qGetShowcaseSetupInfo.LastName#\Portfolio#qGetShowcaseApplicationSelect.PortfolioCredits#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName4">
	</cfif>
	
	<cfif #Trim(form.FileName5)# is not "">
	<cffile destination="#xserverpath#\gallery\PhotoShowcase\Application\Submissions\#qGetShowcaseSetupInfo.FirstName##qGetShowcaseSetupInfo.LastName#\Portfolio#qGetShowcaseApplicationSelect.PortfolioCredits#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName5">
	</cfif>
	
	<cfif #Trim(form.FileName6)# is not "">
	<cffile destination="#xserverpath#\gallery\PhotoShowcase\Application\Submissions\#qGetShowcaseSetupInfo.FirstName##qGetShowcaseSetupInfo.LastName#\Portfolio#qGetShowcaseApplicationSelect.PortfolioCredits#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName6">
	</cfif>
	
	<cfif #Trim(form.FileName7)# is not "">
	<cffile destination="#xserverpath#\gallery\PhotoShowcase\Application\Submissions\#qGetShowcaseSetupInfo.FirstName##qGetShowcaseSetupInfo.LastName#\Portfolio#qGetShowcaseApplicationSelect.PortfolioCredits#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName7">
	</cfif>
	
	<cfif #Trim(form.FileName8)# is not "">
	<cffile destination="#xserverpath#\gallery\PhotoShowcase\Application\Submissions\#qGetShowcaseSetupInfo.FirstName##qGetShowcaseSetupInfo.LastName#\Portfolio#qGetShowcaseApplicationSelect.PortfolioCredits#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName8">
	</cfif>
	
	<cfif #Trim(form.FileName9)# is not "">
	<cffile destination="#xserverpath#\gallery\PhotoShowcase\Application\Submissions\#qGetShowcaseSetupInfo.FirstName##qGetShowcaseSetupInfo.LastName#\Portfolio#qGetShowcaseApplicationSelect.PortfolioCredits#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName9">
	</cfif>
	
	<cfif #Trim(form.FileName10)# is not "">
	<cffile destination="#xserverpath#\gallery\PhotoShowcase\Application\Submissions\#qGetShowcaseSetupInfo.FirstName##qGetShowcaseSetupInfo.LastName#\Portfolio#qGetShowcaseApplicationSelect.PortfolioCredits#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName10">
	</cfif>
	
	<cfif #Trim(form.FileName11)# is not "">
	<cffile destination="#xserverpath#\gallery\PhotoShowcase\Application\Submissions\#qGetShowcaseSetupInfo.FirstName##qGetShowcaseSetupInfo.LastName#\Portfolio#qGetShowcaseApplicationSelect.PortfolioCredits#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName11">
	</cfif>
	
	<cfif #Trim(form.FileName12)# is not "">
	<cffile destination="#xserverpath#\gallery\PhotoShowcase\Application\Submissions\#qGetShowcaseSetupInfo.FirstName##qGetShowcaseSetupInfo.LastName#\Portfolio#qGetShowcaseApplicationSelect.PortfolioCredits#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName12">
	</cfif>
	
	<cfif #Trim(form.FileName13)# is not "">
	<cffile destination="#xserverpath#\gallery\PhotoShowcase\Application\Submissions\#qGetShowcaseSetupInfo.FirstName##qGetShowcaseSetupInfo.LastName#\Portfolio#qGetShowcaseApplicationSelect.PortfolioCredits#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName13">
	</cfif>
	
	<cfif #Trim(form.FileName14)# is not "">
	<cffile destination="#xserverpath#\gallery\PhotoShowcase\Application\Submissions\#qGetShowcaseSetupInfo.FirstName##qGetShowcaseSetupInfo.LastName#\Portfolio#qGetShowcaseApplicationSelect.PortfolioCredits#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName14">
	</cfif>
	
	<cfif #Trim(form.FileName15)# is not "">
	<cffile destination="#xserverpath#\gallery\PhotoShowcase\Application\Submissions\#qGetShowcaseSetupInfo.FirstName##qGetShowcaseSetupInfo.LastName#\Portfolio#qGetShowcaseApplicationSelect.PortfolioCredits#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName15">
	</cfif>
	
	<cfif #Trim(form.FileName16)# is not "">
	<cffile destination="#xserverpath#\gallery\PhotoShowcase\Application\Submissions\#qGetShowcaseSetupInfo.FirstName##qGetShowcaseSetupInfo.LastName#\Portfolio#qGetShowcaseApplicationSelect.PortfolioCredits#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName16">
	</cfif>
	
	<cfif #Trim(form.FileName17)# is not "">
	<cffile destination="#xserverpath#\gallery\PhotoShowcase\Application\Submissions\#qGetShowcaseSetupInfo.FirstName##qGetShowcaseSetupInfo.LastName#\Portfolio#qGetShowcaseApplicationSelect.PortfolioCredits#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName17">
	</cfif>
	
	<cfif #Trim(form.FileName18)# is not "">
	<cffile destination="#xserverpath#\gallery\PhotoShowcase\Application\Submissions\#qGetShowcaseSetupInfo.FirstName##qGetShowcaseSetupInfo.LastName#\Portfolio#qGetShowcaseApplicationSelect.PortfolioCredits#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName18">
	</cfif>
	
	<cfif #Trim(form.FileName19)# is not "">
	<cffile destination="#xserverpath#\gallery\PhotoShowcase\Application\Submissions\#qGetShowcaseSetupInfo.FirstName##qGetShowcaseSetupInfo.LastName#\Portfolio#qGetShowcaseApplicationSelect.PortfolioCredits#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName19">
	</cfif>
	
	<cfif #Trim(form.FileName20)# is not "">
	<cffile destination="#xserverpath#\gallery\PhotoShowcase\Application\Submissions\#qGetShowcaseSetupInfo.FirstName##qGetShowcaseSetupInfo.LastName#\Portfolio#qGetShowcaseApplicationSelect.PortfolioCredits#\" ACTION="UPLOAD" NAMECONFLICT="OVERWRITE" FILEFIELD="FileName20">
	</cfif>

--->


<!--- Update the portfolio credit --->
<CFQUERY NAME="qSetPortfolioCredits" DATASOURCE="photoeyecom">
   		UPDATE GalleryApplication
   		SET PortfolioCredits = #qGetShowcaseApplicationSelect.PortfolioCredits#-1
		WHERE OrderID = #CurrentOrderId#
</CFQUERY>	

<!--- Make sure a negative portfolio quantity is not entered --->
<CFQUERY NAME="qSetPortfolioCredits" DATASOURCE="photoeyecom">
	select PortfolioCredits from GalleryApplication where OrderID = #CurrentOrderId#
</cfquery>

<cfif qSetPortfolioCredits.PortfolioCredits LT 0>
<!--- Update the portfolio credit --->
<CFQUERY NAME="qSetPortfolioCredits" DATASOURCE="photoeyecom">
   		UPDATE GalleryApplication
   		SET PortfolioCredits = 0
		WHERE OrderID = #CurrentOrderId#
</CFQUERY>	

</cfif>

<!--- Move quantity back to the previous number so that the references are proper --->
<cfset xPortfolioNumber=qSetPortfolioCredits.PortfolioCredits+1>

<cfif qSetPortfolioCredits.PortfolioCredits GT 0>


	 <table width="85%" bgcolor="##FFFFFF" ALIGN="CENTER">
      <tr><td align="center">
  
	          
          <table width="95%" border="0" cellpadding="5" bgcolor="##FFFFFF" cellspacing="0" valign="top" align="center">
            <tr valign="top"> 
              <td colspan="3" align="left">
	<hr>
	<br>
	<center>
  	<font face="Verdana, Arial, Helvetica, sans-serif" size="3"><strong>Congratulations!</font><br><br>
  	<font face="Verdana, Arial, Helvetica, sans-serif" size="2">Your images for this Portfolio were uploaded successfully!<br><a href="indexapplicationpayment.cfm?id=#URL.ID#" target="_top">Click here</A> to upload more Portfolios, or return at a later date by simply clicking on the e-mail link sent to you when your payment was received. Thanks very much for your submissions!</strong> <br>
  <br>

  <br>
  Return to:<br><a href="http://www.photoeye.com/gallery/index.cfm" target="_top">photo-eye Gallery</a> or <a href="http://www.photoeye.com/indexbookstore.html" target="_top">photo-eye Bookstore</a>
  </font> <!--- <a href="javascript:closeWindow()">Close</a> ---> 
</center>
<hr>
</td></tr></table>
</td></tr></table>
<cfelse>




<!--- <cfinclude template="closewindow.cfm"> --->
	 <table width="85%" bgcolor="##FFFFFF" ALIGN="CENTER">
      <tr><td align="center">
  
	          
          <table width="95%" border="0" cellpadding="5" bgcolor="##FFFFFF" cellspacing="0" valign="top" align="center">
            <tr valign="top"> 
              <td colspan="3" align="left">
<hr>
<br>
<center>
  <font face="Verdana, Arial, Helvetica, sans-serif" size="3"><strong>Congratulations! </font><br><br>
<font face="Verdana, Arial, Helvetica, sans-serif" size="2">  Your images were uploaded successfully! The application and submission process is now complete. Our jury will contact you within two weeks with their decision. Thank you very much for your submissions.</strong> <br>
  <br>

  <br>
  Return to:<br><a href="http://www.photoeye.com/gallery/index.cfm" target="_top">photo-eye Gallery</a> or <a href="http://www.photoeye.com/indexbookstore.html" target="_top">photo-eye Bookstore</a>
  </font> <!--- <a href="javascript:closeWindow()">Close</a> ---> 
</center>
<hr>
</td></tr></table>
</td></tr></table>

</CFIF>


<!--- Reset Check Steps in Gallery Application --->
<CFQUERY NAME="qGetShowcaseApplication1"  DATASOURCE="photoeyecom">
  		UPDATE GalleryApplication set Step3='0', Step4='0', Step5='0'
  		WHERE OrderId = #url.id#
</CFQUERY>

</cfoutput>

<cfinclude template="EmailPortfolioUploaded.cfm">


</body>
</html>
