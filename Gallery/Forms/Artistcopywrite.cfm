<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" size="1" color="#999999">

<cfoutput>
<cfif #qShowcaseArtist.multiartists# is 1>
Copyright ©  #qShowcaseGalleryIndividualPhotos.FirstName# #qShowcaseGalleryIndividualPhotos.LastName#, 
<cfelse>
Copyright © #qShowcaseArtist.FirstName# #qShowcaseArtist.LastName#, 
</cfif>


<cfif len(trim(qShowcaseGalleryIndividualPhotos.Copyright)) GT 0>
	#qShowcaseGalleryIndividualPhotos.Copyright#,
<cfelseif qShowcaseGalleryIndividualPhotos.CopyrightDefault is 1 and len(trim(qShowcaseGalleryDefaultPhotos.Copyright)) GT 0> 
	#qShowcaseGalleryDefaultPhotos.Copyright#,
<cfelse>
	#YEAR(Now())#,
</cfif>
</cfoutput> All Rights Reserved</font>
