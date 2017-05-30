<!--- this goes at the top of the search page, before the loop --->

<!--- <cfset xCapCount = 0> --->


<!---

Okay, so the code below should be used to create the opening anchor tag for the image, the script above that generates the caption and additional info variables.  Because we can't have multiple lightbox links for the same image on one page without creating multiple instances in the box itself, I vote we make the image clickable and the title dead.  The code below is set up to do everything we talked about and only requires that the queries end with the following variables filled (listed in order of appearance, notations on all new variables):

#qShowcaseGalleryIndividualPhotos.caption1#
#qShowcaseGalleryIndividualPhotos.addinfo1#

#xPan#
#qShowcaseArtist.Subdirectory#
#qShowcasePortfolio.Subdirectory#
#qGetResults.ImageNumber# (loop in mSearchShowcasePowerSearch.cfm)
#xTitle# (set in mSearchShowcasePowerSearch.cfm)
#url.id#
#url.portfolio#
#qShowcaseArtist.firstname#
#qShowcaseArtist.lastname#

#xGalleryCat# - should output "Santa Fe Gallery" or "Photographers Showcase" etc.
#xPortfolioTitle# - title of the portfolio the image is part of (in qyr_Galleries_Lightbox.cfm)
#xPortfolioLink# - link to the portfolio the image is part of

#xMedium#
#xSize#
#xMat#
#xEdition#
#xprice#
#Cookie.UserIdNumber#
#qGetDetails.Soft_price#
#qGetDetails.recordID#
#qGetDetails.Catalog#
#ArtistF# (in qyr_Galleries_Lightbox.cfm)
#ArtistL# (in qyr_Galleries_Lightbox.cfm)
#xPurchase#

You may have some suggestions about how to arrange the links to the portfolio and the identification of which gallery the image comes from -- I've layed them out in a basic way here.  However, once the information is flowing properly, where/how it's displayed is easy to change.

--->


<!---<!--- ArtistGallery variable is set in the mSearchShowcasePowerSearch.cfm results loop --->


<cfset xPortfolioLink="">
<cfset xMedium ="">
<cfset xSize="">
<cfset xMat="">
<cfset xEdition="">
<cfset xprice="">
<!---<cfset Cookie.UserIdNumber = "#cookie.">--->
<cfset xPurchase="">--->


<cfinclude template="/gallery/forms2/includes/qry_Galleries_Lightbox.cfm">
		<cfset xGalleryCat="#qShowcaseArtist.Gallery#"> 
		<cfset xPortfolioLink = "/gallery/forms2/index.cfm?image=1&id=#url.id#&imagePosition=1&Door=1&Portfolio=#url.portfolio#&Gallery=1">
		<cfset xPortfolioLinkOLD = "/gallery/forms/indexA.cfm?image=1&id=#url.id#&imagePosition=#qGetResults.imagePosition#&Door=1&Portfolio=#url.portfolio#&Gallery=1">

		<cfset xCaption = qGetResults.caption1>
		<cfset xCaption = replace(xCaption, chr(10), " ", "ALL")>
		<cfset xCaption = replace(xCaption, chr(13), " ", "ALL")>
		<cfset xCaption = replace(xCaption, "'", "&prime;", "ALL")>
		<cfset xCaption = trim(xCaption)>

		<cfset xInfo = qGetResults.addinfo1>
		<cfset xInfo = replace(xInfo, chr(10), " ", "ALL")>
		<cfset xInfo = replace(xInfo, chr(13), " ", "ALL")>
		<cfset xInfo = replace(xInfo, "'", "&prime;", "ALL")>
		<cfset xInfo = trim(xInfo)>
		
				<cfif CGI.X_FORWARDED_FOR is '70.56.210.146x'>
			<cfoutput>#xinfo#<br>
			&quot;peLightbox.GoCaption(0,infovar#xCapCount#)&quot; &gt;</cfoutput> <cfabort>
		</cfif>
		
		<cfif xGalleryCat EQ "PhotoShowcase">
			<cfset xGalleryCat = "Photographer's Showcase">
		<cfelseif xGalleryCat EQ "RepresentedArtists">
			<cfset xGalleryCat = "Santa Fe Gallery">
		<cfelse>
			<cfset xGalleryCat = "Magnum Photographer">
		</cfif>

<cfoutput>
		
		<script type="text/javascript">
			var capvar#xCapCount# = escape('#xCaption#'); 
			var infovar#xCapCount# = escape('#xInfo#');
		</script>

<a href="#xPortfolioLinkOLD#&&&<cfif xPan is 0>/artists/#qShowcaseArtist.Subdirectory#/#qShowcasePortfolio.Subdirectory#/Images_Large/Image#qGetResults.ImageNumber#_H600xW900.jpg
	<cfelse>/artists/#qShowcaseArtist.Subdirectory#/#qShowcasePortfolio.Subdirectory#/Images_Large/Image#qGetResults.ImageNumber#_H500xW3000.jpg	
	</cfif>" rel="lightbox[SearchResults]" alt="#xTitle#" title="<cfif len(trim(xInfo)) IS NOT 0>&lt;span id='infoToggle' onclick=&quot;peLightbox.GoCaption(0,infovar#xCapCount#)&quot; &gt;[&lt;span class='displayers'&gt;display&lt/span&gt;  additional info]&lt;/span&gt;</cfif><cfif len(trim(xCaption)) IS NOT 0>&lt;span id='captionToggle' onclick=&quot;peLightbox.GoCaption(1,capvar#xCapCount#)&quot; &gt;[&lt;span class='displayers'&gt;display&lt/span&gt; caption]&lt;/span&gt;</cfif>&lt;a href='/gallery/forms2/homepage.cfm?image=Image#qGetResults.ImageNumber#&id=#url.id#&imagePosition=1&Door=1&Portfolio=#url.portfolio#&Gallery=1'<cfif xPan is 0> class='info1' <cfelse> class='info1' </cfif>
&gt;#qShowcaseArtist.firstname# #qShowcaseArtist.lastname#
&lt;/a&gt;(#xGalleryCat#)
&lt;br /&gt;#xTitle#, from #xPortfolioTitle# [&lt;a href='#xPortfolioLink#'&gt;view portfolio&lt;/a&gt;]&lt;br /&gt;
&lt;span class='info2'&gt;
&lt;br /&gt;#xMedium#
&lt;br /&gt;#xSize#
&lt;br /&gt;#xMat#
&lt;br /&gt;#xEdition#
&lt;br /&gt;#xprice# 
&lt;/span&gt;&lt;br /&gt;&lt;br /&gt;
	<cfif xPurchase NEQ 'Reserved' AND xPurchase NEQ 'Sold Out' AND xPurchase NEQ 'Not for Sale'>
&lt;a href='##' class='info3' onclick='window.location = &quot;../../templates/AddtoCartGalleriesNew.cfm?userid=#Cookie.UserIdNumber#&NumCopies=1&Binding=Photography&Listprice=#qGetDetails.Soft_price#&SalePrice=0&RecordID=#qGetDetails.recordID#&Catnum=#qGetDetails.Catalog#&ArtistF=#ArtistF#&ArtistL=#ArtistL#&Showcase=1&quot;' &gt;#xPurchase#&lt;/a&gt;
<cfelse>#xPurchase#</cfif>"></cfoutput>

<!--- the img tag can stay the same as it is, but should have a title attribute added to keep the anchor from showing code on mouseover --->

<!--- this goes inside the loop at the bottom --->

<cfset xCapCount++>