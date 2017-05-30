



<CFSET xShowMenu = 0>
<CFSET xShowDropDowns = 0>
<CFSET xShowHome = 1>

<cfif Isdefined("url.Gallery")>
	<cfif url.Gallery is 1>
		<CFSET xTitle = "Gallery - Santa Fe">
		<cfset xGallery=1>
		<cfset xGalleryName='REPRESENTEDARTISTS'>
		<CFSET xHomeLink = "#aGalleryDirectory#/RepresentedArtists/HomepagePE.cfm">
	<cfelseif url.Gallery is 2>
		<CFSET xTitle = "Photographer's Showcase">
		<cfset xGallery=2>
		<cfset xGalleryName='PHOTOSHOWCASE'>
		<CFSET xHomeLink = "#aGalleryDirectory#/Photoshowcase/HomepagePSnew.cfm">
	<cfelseif url.Gallery is 3>
		<CFSET xTitle = "Magnum Photos">
		<cfset xGallery=3>
		<cfset xGalleryName='MAGNUMARTISTS'>
		<CFSET xHomeLink = "#aGalleryDirectory#/MagnumArtists/HomepageMA.cfm">
	<CFELSE>
		<CFSET xTitle = "Galleries">
		<cfset xGallery=0>
		<cfset xGalleryName=''>
	</CFIF>
<cfelse>
	<CFSET xTitle = "Galleries">
	<cfset xGallery=0>
</cfif>

<CFSET xPathToRoot="../../">
<CFSET xShowBackButton = 1>
<CFSET xShowMenu = 1>
<cfinclude template="../../templates/Header.cfm">



<DIV ALIGN="CENTER">
<CFOUTPUT>



  <p align="center"><font face="verdana, arial, helvetica, sans-serif" size="2" color="black">
Please 
<a href="mailto:gallery@photoeye.com?subject=Laszlo Layton Inquiry">e-mail</a> our gallery for information on Laszlo Layton photographs. 
<br>
  <br>
  <img src="../sharedimages/Redlinetoc.gif" width="400" height="1" alt="" border="0"><br>
  <img src="SharedImages/dot_clear.gif" width="1" height="1">
 
</div>

<cfinclude template="../../templates/footer_site.cfm">
</cfoutput>




	

