<!---  <cfif isdefined("All") is false>
	<cfset All=0>
</cfif>  --->

<CFQUERY NAME="qShowcaseArtist"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM GallerySetup where custnumber=#url.id#
</CFQUERY>

<CFQUERY NAME="qShowcaseGalleryIndividualPhotos"  DATASOURCE="photoeyecom">
  	SELECT Distinct *
 	FROM GalleryIndividualPhotos where custnumber='#url.id#' and PortfolioName='#url.portfolio#' and NOT (notavailable=4 and imagenumber>1)
	order by imageposition;
</CFQUERY>	


 <CFQUERY NAME="qShowcasePortfolio"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM GalleryPortfolio where Custnumber=#url.id# AND SUBDIRECTORY='#url.portfolio#'
</CFQUERY> 
<!--- If no background paramater Exists, Make Background Black --->
<cfif #len(qShowcasePortfolio.Backgroundcolor)# GT 0>
	<cfset Background = #trim(qShowcasePortfolio.Backgroundcolor)#>
<cfelse>
	<cfset Background = "000000">
</cfif>

<CFIF qShowcasePortfolio.Panorama is 1>
	<CFSET xPan = 1>
<CFELSE>
	<CFSET xPan = 0>
</CFIF>



<html>
<head>
<title>photo-eye Photographer's Showcase | <cfoutput>#qShowcaseArtist.FirstName# #qShowcaseArtist.LastName#</cfoutput></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

</head>
<cfoutput>
<body bgcolor="###Background#" link="Silver" topmargin=0 leftmargin=0 text="Silver" vlink="Silver" alink="Red"></cfoutput>
<cfoutput>

<cfset counter=1>  
                <!---Determine how many images there are---> 
			<cfset imagecount = #qShowcaseGalleryIndividualPhotos.recordcount#>
<!--- 			<cfloop index="fieldincrementer" from="1" to="40" step="1">
			<cfset urladdress="http://www.visualserver.com/artists/#qShowcaseArtist.Subdirectory#/#Portfolio#/Images_Large/image#fieldincrementer#.jpg">
      
	  <CFHTTP URL = "#urladdress#"
         method = "GET"
         RESOLVEURL = YES>
      </CFHTTP>
	  
<cfif CFHTTP.FileContent is 'ÿØÿà'>
	<cfset imagecount = imagecount + 1>
</cfif>

<!--- 
<CFIF FileExists(urlencodedformat(#urladdress#))>
					<cfset imagecount = imagecount + 1>
				</cfif> --->
			</cfloop> --->

<!--- Inelegant, case specific code for Twin Towers (when image 8 is marked not to be shown, the index doesn't show it, but, in return, looks for one image too many at the end. --->
<CFIF (qShowcasePortfolio.custnumber eq "81037") and (qShowcasePortfolio.Subdirectory eq "Portfolio1")>
	<CFSET imagecount = imagecount -1>
</CFIF>
<table border="0" cellspacing="0" cellpadding="0"  align="center">
 			 <tr align="center" valign="bottom"> 
			 <td>


&nbsp;&nbsp;</td>
<!--- END: Inelegant, case specific code for Twin Towers --->
  		<cfloop QUERY=qShowcaseGalleryIndividualPhotos startrow="1" endrow="#imagecount#">
				
			
			 <td width="300" align="left" valign="middle"><br>
<!--- 	<cfif counter is 1>	
				<font size=1 face="verdana, arial, helvetica, sans-serif" color="silver">
			<br>Jury's Selected Images</font><br><br>
		</cfif>  --->
		<a href="scroll5.cfm?id=190460&Portfolio=Portfolio1" target="mainFrame"> 


<!--- ImageSizer --->									
<CFIF xPan is 1>
	<cfset xheight=120>
	<cfset xwidth=500>
<CFELSE>
	<cfset xheight=100>
	<cfset xwidth=100>
</CFIF>		

<cfset xImageAddress="#xRelativePath#\Artists\#qShowcaseArtist.Subdirectory#\#Portfolio#\Images_Large\">

<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image#qShowcaseGalleryIndividualPhotos.imagenumber#.jpg">

<cfinclude template="../../templates/imagesizer.cfm">

<img src="../../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a></td><td>&nbsp;&nbsp;&nbsp;</td>
<td align="left"></td>
<!--- End ImageSizer --->
				



<cfset counter=counter+1>


	
	<cfif counter is 7>
	<cfset counter = 1>
	</tr><tr><td>


&nbsp;&nbsp;</td>
	</cfif>
			
		</cfloop>	

</tr></table>

</cfoutput>


</body>
</html> 
