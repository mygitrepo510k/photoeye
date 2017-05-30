<!---  <cfif isdefined("All") is false>
	<cfset All=0>
</cfif>  --->

<CFQUERY NAME="qShowcaseArtist"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM GallerySetup where custnumber=#url.id#
</CFQUERY>

<CFQUERY NAME="qShowcaseGalleryIndividualPhotos"  DATASOURCE="photoeyecom">
  	SELECT Distinct *
 	FROM GalleryIndividualPhotos where custnumber='#url.id#' and PortfolioName='#url.portfolio#' and NOT (notavailable=4 and imagenumber>0)
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
	  
<cfif CFHTTP.FileContent is '����'>
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
<!--- END: Inelegant, case specific code for Twin Towers --->
  		<cfloop QUERY=qShowcaseGalleryIndividualPhotos startrow="1" endrow="#imagecount#">
				
			<table border="0" cellspacing="0" cellpadding="0" width="85" height="85" align="center">
 			 <tr align="center" valign="middle"> 
			 <td width="64" align="left" valign="middle">
<!--- 	<cfif counter is 1>	
				<font size=1 face="verdana, arial, helvetica, sans-serif" color="silver">
			<br>Jury's Selected Images</font><br><br>
		</cfif>  --->
		<a href="Image1.cfm?image=#qShowcaseGalleryIndividualPhotos.imageposition#&id=#url.id#&Portfolio=#url.portfolio#" target="MiddleFrame"> 


<!--- ImageSizer --->					
<CFIF xPan is 1>
	<cfset xheight=120>
	<cfset xwidth=500>
<CFELSE>
	<cfset xheight=75>
	<cfset xwidth=75>
</CFIF>		
<cfset xImageAddress="#xRelativePath#\Artists\#qShowcaseArtist.Subdirectory#\#Portfolio#\Images_Large\">
<cfset xAlt = "Enter Gallery">
<cfset xImageFormat = "jpg">
<cfset xImage = "Image#qShowcaseGalleryIndividualPhotos.imageNUMBER#">
<cfif NOT ListFindNoCase(qShowcaseGalleryIndividualPhotos.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")>
	<cfinclude template="../../templates/imagesizercreate.cfm">
	<cfquery name="qUpdate"  datasource="photoeyecom">
		Update GalleryIndividualPhotos
		Set ImageSizeList = '#ListAppend(qShowcaseGalleryIndividualPhotos.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")#'
		Where RecordNo = #qShowcaseGalleryIndividualPhotos.RecordNo#
	</cfquery>
</cfif>
<img src="../../artists/#qShowcaseArtist.Subdirectory#/#qShowcaseGalleryIndividualPhotos.PortfolioName#/Images_Large/#xImage#_H#xHeight#xW#xWidth#.#xImageFormat#" border="0" ALT="#xAlt#"></a></td>
<!--- End ImageSizer --->
				

</tr></table>

<cfset counter=counter+1>
<!--- <cfif counter is 5 and All is 0>
	<table border="0" cellspacing="0" cellpadding="0" width="85" height="25" align="center"><tr><td width="64" align="left" valign="middle">
	<font size=1 face="verdana, arial, helvetica, sans-serif" color="silver">
	<a href="scroll3.cfm?All=1&id=#url.id#&Portfolio=#url.portfolio#"><font color="##FFFF99" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseOver="this.color='Red';" onMouseOut="this.color='##FFFF99';"  style="TEXT-DECORATION: none">Additional Unselected Images</font></a>
	</font>
	</td></tr></table>
	<cfbreak>
<cfelseif counter is 5 and All is 1>
	<table border="0" cellspacing="0" cellpadding="0" width="85" height="25" align="center"><tr><td width="64" align="left" valign="middle">
	<font size=1 face="verdana, arial, helvetica, sans-serif" color="silver">
	Additional Unselected Images
	</font>
	</td></tr></table> 
</cfif> --->

	
	
			
		</cfloop>	



</cfoutput>


</body>
</html> 
