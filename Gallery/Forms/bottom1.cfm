<CFQUERY NAME="qArtist"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup where Custnumber=#url.id#
</CFQUERY>

<CFQUERY NAME="qSuperAdmin"  DATASOURCE="photoeyecom">
  SELECT CopyrightDate
  FROM SuperAdmin
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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>


<head>

<SCRIPT LANGUAGE=JAVASCRIPT TYPE="TEXT/JAVASCRIPT">
	<!-- Hide script from old browsers

	function updateParent(newURL) {
		opener.document.location = newURL
	}

	// End hiding script from old browsers -->
	</SCRIPT>
	
<style type="text/css">
	A   {
		Text-decoration: none;
	}
	A.link, A.visited, A.hover, A.active   {
		
		TEXT-DECORATION: none;
		}
</style>	
<cfif #qArtist.multiartists# is 1>
<title>photo-eye Photographer's Showcase | <cfoutput>#qShowcasePortfolio.Title#</cfoutput></title>
<cfelse>
<title>photo-eye Photographer's Showcase | <cfoutput>#qArtist.FirstName# #qArtist.LastName#</cfoutput></title>
</cfif>

</head>
<cfoutput>
<body bgcolor="###Background#" topmargin=0 text="Silver" link="Silver" vlink="Silver"></cfoutput>
<font size="1">
<div align="center"> <img src="../sharedimages/redlinetoc.gif" width="400" height="1"><FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" size="1" color="#999999"><!--- <a href="../../index.html" TARGET="_parent"> --->


<cfif url.door is 4>


	<cfset JLink =''>
	 	<cfif UCASE(qArtist.Gallery) is 'REPRESENTEDARTISTS'>
	 		<cfset JLink = '../representedArtists/homepagePE.cfm'>
	 
	 	<cfelseif UCASE(qArtist.Gallery) is 'PHOTOSHOWCASE'>
	 		<cfif qArtist.Tier is 1>
			
				<cfset JLink = '../photoshowcase/homepagePSNew.cfm'>
			<cfelseif qArtist.Tier is 2>
			
				<cfset JLink = '../photoshowcase/homepagePSNew.cfm'>
			<cfelseif qArtist.Tier is 3>
			
				<cfset JLink = '../photoshowcase/homepagePSNew.cfm'>
			</cfif>			
	 
	 <cfelseif UCASE(qArtist.Gallery) is 'MAGNUMARTISTS'>
	 	<cfset JLink = '../magnumArtists/homepageMA.cfm'>
</cfif> 


<cfset JArtistGallery =''>
	 <cfif UCASE(qArtist.Gallery) is 'REPRESENTEDARTISTS'>
	 	<cfset JArtistGallery = 'Santa Fe Gallery'>
	 
	 <cfelseif UCASE(qArtist.Gallery) is 'PHOTOSHOWCASE'>
	 	<cfif qArtist.Tier is 1>
			
			<cfset JArtistGallery =  "Photographer's Showcase<SUP><FONT SIZE=1>&reg;</FONT></SUP> Gallery">
		<cfelseif qArtist.Tier is 2>
			
			<cfset JArtistGallery =  "Photographer's Showcase<SUP><FONT SIZE=1>&reg;</FONT></SUP> Gallery">
		<cfelseif qArtist.Tier is 3>
			
			<cfset JArtistGallery =  "Photographer's Showcase<SUP><FONT SIZE=1>&reg;</FONT></SUP> Gallery">
		</cfif>			
	 
	 <cfelseif UCASE(qArtist.Gallery) is 'MAGNUMARTISTS'>
	 	<cfset JArtistGallery = 'Magnum Photos Gallery'>
     </cfif>
	 


<br><FONT color="SILVER" face="Verdana, Arial, Helvetica, Sans-Serif" size="1"><b><cfoutput>#qArtist.FirstName# #qArtist.LastName# is a #JArtistGallery#</cfoutput> Artist</b></font></a><img src="../SharedImages/dot_clear.gif" width="1" height="15">&nbsp;&nbsp;|&nbsp;&nbsp;
<!--- 02/17/05 jArtistGallery has the registered trademark if Showcase Gallery Artist. this symbol did not show properly on the Subject line. So we are redefining the variable here --->
<cfif UCASE(qArtist.Gallery) is 'PHOTOSHOWCASE'>
	<cfset JArtistGallery = "Photographer's Showcase">
	yes
<cfelse>
no
</cfif>
<a href="mailto:photoshowcase@photoeye.com?Subject=<cfoutput>#qArtist.FirstName# #qArtist.LastName# Inquiry - #JArtistGallery# Artist</cfoutput>"><FONT color="SILVER" face="Verdana, Arial, Helvetica, Sans-Serif" size="1" onMouseover="this.color='Red';" onMouseout="this.color='SILVER';"  style="TEXT-DECORATION: none"><b>E-mail for more information</b></font></a><br>
  </font>

<cfelse>
  
  <cfset Link =''>
	 <cfif UCASE(qArtist.Gallery) is 'REPRESENTEDARTISTS'>
	 	<cfset Link = '<a href="../representedArtists/homepagePE.cfm" target="_top">'>
	 
	 <cfelseif UCASE(qArtist.Gallery) is 'PHOTOSHOWCASE'>
	 	<cfif qArtist.Tier is 1>
			
			<cfset Link = '<a href="../photoshowcase/homepagePSNew.cfm" target="_top">'>
		<cfelseif qArtist.Tier is 2>
			
			<cfset Link = '<a href="../photoshowcase/homepagePSNew.cfm" target="_top">'>
		<cfelseif qArtist.Tier is 3>
			
			<cfset Link = '<a href="../photoshowcase/homepagePSNew.cfm" target="_top">'>
		</cfif>			
	 
	 <cfelseif UCASE(qArtist.Gallery) is 'MAGNUMARTISTS'>
	 	<cfset Link = '<a href="../magnumArtists/homepageMA.cfm" target="_top">'>
     </cfif>	 


<cfset ArtistGallery =''>
	 <cfif UCASE(qArtist.Gallery) is 'REPRESENTEDARTISTS'>
	 	<cfset ArtistGallery = 'Santa Fe Gallery'>
	 
	 <cfelseif UCASE(qArtist.Gallery) is 'PHOTOSHOWCASE'>
	 	<cfif qArtist.Tier is 1>
			
			<cfset ArtistGallery = "Photographer's Showcase<SUP><FONT SIZE=1>&reg;</FONT></SUP> Gallery">
		<cfelseif qArtist.Tier is 2>
			
			<cfset ArtistGallery = "Photographer's Showcase<SUP><FONT SIZE=1>&reg;</FONT></SUP> Gallery">
		<cfelseif qArtist.Tier is 3>
			
			<cfset ArtistGallery = "Photographer's Showcase<SUP><FONT SIZE=1>&reg;</FONT></SUP> Gallery">
		</cfif>			
	 
	 <cfelseif UCASE(qArtist.Gallery) is 'MAGNUMARTISTS'>
	 	<cfset ArtistGallery = 'Magnum Photos Gallery'>
     </cfif>
	 

	
<br>
<CFIF qArtist.FirstName eq "Twin">
	<CFSET Link = "<a href=http://www.photoeye.com/TwinTowers target=_parent>">
	<CFSET ArtistGallery = "Twin Towers">
</CFIF>


<cfoutput>#Link#</cfoutput><FONT color="SILVER" face="Verdana, Arial, Helvetica, Sans-Serif" size="1" onMouseover="this.color='Red';" onMouseout="this.color='SILVER';"  style="TEXT-DECORATION: none"><b><cfoutput>#ArtistGallery#</cfoutput> 
  Home</b></font></a><img src="../SharedImages/dot_clear.gif" width="1" height="15">&nbsp;&nbsp;|&nbsp;&nbsp; 
  <!--- <a href="../../../indexnew.html" Target=_top> --->
  <a href="http://www.photoeye.com/gallery/index.cfm" TARGET="_top"><FONT color="SILVER" face="Verdana, Arial, Helvetica, Sans-Serif" size="1" onMouseover="this.color='Red';" onMouseout="this.color='SILVER';"  style="TEXT-DECORATION: none"><b>All 
  Galleries Home </b></font></a>&nbsp;&nbsp;|&nbsp;&nbsp; <a href="mailto:photoshowcase@photoeye.com?Subject=<cfoutput>#qArtist.FirstName# #qArtist.LastName# Inquiry - #ArtistGallery#</cfoutput> Artist"><FONT color="SILVER" face="Verdana, Arial, Helvetica, Sans-Serif" size="1" onMouseover="this.color='Red';" onMouseout="this.color='SILVER';"  style="TEXT-DECORATION: none"><b>E-mail</b></font></a><br>
  </font>
  
  </cfif>
  

  

  <div align="center"><font face="Verdana, Arial, Helvetica, Sans-Serif" size="1" color="#999999">photoeye.com 
     &copy; photo-eye Books &amp; Prints, <cfoutput>#qSuperAdmin.CopyrightDate#;</cfoutput></font>&nbsp;&nbsp;&nbsp;<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" size="1" color="#999999"> 
    Photographs © <cfoutput>
	
	<cfif #qArtist.multiartists# is 1>
		by the Respective Artist,	
	<cfelse>
		#qArtist.FirstName# #qArtist.LastName#, 
	</cfif>
	
	#YEAR(Now())#,</cfoutput> All Rights Reserved</font></div> 
</div>
</font></body>
</html>