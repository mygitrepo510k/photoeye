<!---  <cfif isdefined("All") is false>
	<cfset All=0>
</cfif>  --->

<CFQUERY NAME="qShowcaseArtist"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup where custnumber=#url.id#
</CFQUERY>

<CFQUERY NAME="qShowcaseGalleryIndividualPhotos"  DATASOURCE="photoeyecom">
  	SELECT *
 	FROM GalleryIndividualPhotos where custnumber='#url.id#' and PortfolioName='#url.portfolio#'
	order by imageposition;
</CFQUERY>	


 <CFQUERY NAME="qShowcasePortfolio"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryPortfolio where Custnumber=#url.id# AND SUBDIRECTORY='#url.portfolio#'
</CFQUERY> 
<!--- If no background paramater Exists, Make Background Black --->
<cfif #len(qShowcasePortfolio.Backgroundcolor)# GT 0>
	<cfset Background = #trim(qShowcasePortfolio.Backgroundcolor)#>
<cfelse>
	<cfset Background = "000000">
</cfif>



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
			<cfset imagecount = 0>
			<cfloop index="fieldincrementer" from="1" to="40" step="1">
				<cfif fileexists(Expandpath("../#qShowcaseArtist.Gallery#/Artists/#qShowcaseArtist.Subdirectory#/#qShowcasePortfolio.Subdirectory#/Images_Thumbs/image#fieldincrementer#.jpg"))>	
					<cfset imagecount = imagecount + 1>
				</cfif>
			</cfloop>

  		<cfloop QUERY=qShowcaseGalleryIndividualPhotos startrow="1" endrow="#imagecount#">
				
			<table border="0" cellspacing="0" cellpadding="0" width="85" height="85" align="center">
 			 <tr align="center" valign="middle"> 
			 <td width="64" align="left" valign="middle">
<!--- 	<cfif counter is 1>	
				<font size=1 face="verdana, arial, helvetica, sans-serif" color="silver">
			<br>Jury's Selected Images</font><br><br>
		</cfif>  --->
		<a href="Image1.cfm?image=#qShowcaseGalleryIndividualPhotos.imagenumber#&id=#url.id#&Portfolio=#url.portfolio#" target="MiddleFrame"> <img src="../#qShowcaseArtist.Gallery#/Artists/#qShowcaseArtist.Subdirectory#/#Portfolio#/Images_Thumbs/image#qShowcaseGalleryIndividualPhotos.imagenumber#.jpg"  alt="" border="0" ></a>
</td></tr></table>

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
</cfif>  --->

	
	
			
		</cfloop>	



</cfoutput>


</body>
</html> 
