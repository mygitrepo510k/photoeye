<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" size="1" color="#999999">Copyright © <cfoutput>#qShowcaseArtist.FirstName# #qShowcaseArtist.LastName#, 

<cfif len(trim(qShowcaseGalleryIndividualPhotos.Copyright)) GT 0>
	#qShowcaseGalleryIndividualPhotos.Copyright#,
<cfelseif qShowcaseGalleryIndividualPhotos.CopyrightDefault is 1 and len(trim(qShowcaseGalleryDefaultPhotos.Copyright)) GT 0> 
	#qShowcaseGalleryDefaultPhotos.Copyright#,
<cfelse>
	#YEAR(Now())#,
</cfif>
</cfoutput> All Rights Reserved</font>
