<cfinclude template="/gallery/forms2/includes/qry_Galleries.cfm">
<cfparam name="url.image" default="1">
<cfparam name="url.id" default="null">
<cfparam name="url.imagePosition" default="1">
<cfparam name="url.Door" default="1">
<cfparam name="url.Portfolio" default="null">
<cfparam name="url.Gallery" default="1">
<cfset xloading = 1>
<cfset xCapCount = 0>
	 
<!--- Space out the Portfolio and Portfolio Number if together --->
<!---<cfif left(qShowcasePortfolio.Title,9) is "Portfolio">
	<cfset xPortfolioTitle="#left(qShowcasePortfolio.Title,9)#">
	<cfset xPortfolioTitle="#xPortfolioTitle# #mid(qShowcasePortfolio.Title,10,10)#">
<cfelse>
	<cfset xPortfolioTitle="#qShowcasePortfolio.Title#">
</cfif>--->

<cfset xTreePath = "../">
<cfset xPageTitle = "#qShowcaseArtist.Firstname# #qShowcaseArtist.Lastname# at photo-eye Gallery">
<cfinclude template="../Includes/dsp_Galleries_index_top2.cfm">

<script type="text/javascript">
	//automatically fires lightbox on load if there's a #imageID in the URL
        function launchLightbox() {
            //Check if location.hash matches a lightbox-anchor. If so, trigger popup of image.
            setTimeout(function() {
                if(document.location.hash && $(document.location.hash.substr(1)).rel.indexOf('lightbox')!=-1) {
                    peLightbox.start($(document.location.hash.substr(1)));
                }},
                250
            );
        }
        Event.observe(window, 'load', launchLightbox, false);
</script>


<br /><br />
<!---<cfoutput> 
<div style="font-size:24px; color:##666666; margin-left:100px;" align="left">#qShowcaseArtist.Firstname# #qShowcaseArtist.Lastname# <span style="font-size:18px; letter-spacing:3px; margin-left:50px;">#xPortfolioTitle#</span>


<br /><span style="font-size:14px;" align="left"><cfif len(trim(qShowcaseArtist.birth)) gt 0> b. #qShowcaseArtist.birth#, </cfif>#qShowcaseArtist.nationality#</span>
</div></cfoutput>--->

<!--- I couldn't get the auto show / hide to work with the information bar because of how FF handles mouseover events.  However, I have coded an alternative that I think works much better anyway.  The bottom of the image has a clickable "display / hide info" button -- it even has a memory so if you open the info field and navigate, it stays open (later we could make this a saved preference via cookies).  The upper right closing .gif seems to work and I DID manage to write a decent image grid using CSS, best of all it's totally pain free to code, the work is all done by the CSS file.

I've already moved all the relevant CSS and <script> links to dsp_Gallery_Index_Top.cfm so the code that follows is all you need to work in to get these things humming along.


Here's the breakdown:  The <div id="Img_Container"> should contain all the images.  If you want a title with the photographers name / porfolio title, it should go above this div --->
<div id="Artist_Info">
	<cfoutput>
		#qShowcaseArtist.Firstname# #qShowcaseArtist.Lastname# <span style="margin-left:10px;"><cfif len(trim(qShowcaseArtist.birth)) gt 0> b. #qShowcaseArtist.birth#, </cfif>#qShowcaseArtist.nationality# </span><br /><cfinclude template="includes/dsp_Galleries_Menu.cfm">

	</cfoutput>
</div>
<div id="Portfolio_Info">
	<cfoutput>
		#xPortfolioTitle#
	</cfoutput>
	<cfif len(trim(qShowcasePortfolio.portfoliointro)) gt 0>
		<br /><span>
			<cfoutput><a href="/gallery/forms2/portfolioIntro.cfm?id=#url.id#&portfolio=#url.portfolio#">Portfolio Introduction</a></cfoutput>
		</span>
	</cfif>
</div>


<div style="text-align:center;">
<div id="Img_Container" <cfif xPan EQ 1>class="Pano"</cfif>>

<!--- Here's the formula for coding the lightbox integrated images:

			<a href="full-size image path" rel="lightbox[ lightbox group name ]" title=" content we want to appear in the info field, can be code as long as < becomes &lt; and > becomes &gt; " ><img src=" thumbnail path"></a>
			
			
Example template for the title attribute, the same as is used in the first Hiroshi example below (line breaks should be removed in final output) :

			  &lt;a href='
			  #link to photographer's main page#
			  ' class='info1'&gt;
			  #photographer's name#
			  &lt;/a&gt; : 
			  #porfolio title#
			  &lt;br /&gt;&lt;span class='info2'&gt;
			  #print title#
			  &lt;br /&gt;
			  #print medium#
			  &lt;br /&gt;
			  #print size#
			  &lt;br /&gt;
			  #edition size#
			  &lt;/span&gt;&lt;br /&gt;&lt;br /&gt;&lt;a href='
			  #purchase print link#
			  ' class='info3'&gt;$ purchase print&lt;/a&gt;

Here's that same information AFTER it's rendered by lightbox:

			<a href='/gallery/forms2/homepage.cfm?image=1&id=53264&imagePosition=1&Door=1&Portfolio=Portfolio8&Gallery=1' class='info1'> Hiroshi Watanabe </a> : Findings <br />
			<span class="info2">Beach House, Barcelona, Spain, 2005<br />
			Toned Gelatin-Silver Print<br />
			10x10" Image<br />
			Edition of 30<span><br /><br />
			
			<a href="/templates/addtocartboth.cfm?CFID=3711261&CFTOKEN=35107508" class="info3">$ purchase print</a>
			
			--->


  				  
				 <!--- <a href="javascript:popUp('Pages_MaxEnlarge/image1.cfm?imageposition=#image#&id=#url.id#&Portfolio=#url.portfolio#','myWindowEnlarge',1012,710,'yes','no');"><img src="../sharedimages/enlargeGray.gif" width="90" height="15" alt="" border="0" name="img2"></a>---> 
				  

				 
<cfset xCounter = qShowcaseGalleryIndividualPhotos.recordcount>				 			 
<cfoutput query="qShowcaseGalleryIndividualPhotos">
 
<CFQUERY NAME="qGetDetails"
         DATASOURCE="photoeyecom">
SELECT *
FROM Inventory
WHERE CATALOG = <cfqueryparam value="#qShowcaseGalleryIndividualPhotos.catalog#" cfsqltype="CF_SQL_CHAR">
</CFQUERY>

	<cfparam name="xPrice" default="Price upon request">
	<!--- Image Title --->
	<cfif len(#qShowcaseGalleryIndividualPhotos.title#) GT 0>
		 <cfif len(trim(#qShowcaseGalleryIndividualPhotos.yearprod#)) GT 0  and FIND(#qShowcaseGalleryIndividualPhotos.yearprod#,#qShowcaseGalleryIndividualPhotos.title#) is 0>
			<cfset xTitle ="#qShowcaseGalleryIndividualPhotos.title#,">
		 <cfelse>
			<cfset xTitle ="#qShowcaseGalleryIndividualPhotos.title#">
		 </cfif>
	<cfelse>
		 <cfif len(trim(#qShowcaseGalleryIndividualPhotos.yearprod#)) GT 0  and FIND(#qShowcaseGalleryIndividualPhotos.yearprod#,#qShowcaseGalleryIndividualPhotos.title#) is 0>
			<cfset xTitle ="#qShowcaseGalleryDefaultPhotos.title#,">
		 <cfelse>
			<cfset xTitle ="#qShowcaseGalleryDefaultPhotos.title#">
		 </cfif>
	</cfif>
	
	<cfif len(trim(#qShowcaseGalleryIndividualPhotos.yearprod#)) GT 0 and FIND(#qShowcaseGalleryIndividualPhotos.yearprod#,#qShowcaseGalleryIndividualPhotos.title#) is 0>
		 <cfset xTitle="#xTitle# #qShowcaseGalleryIndividualPhotos.yearprod#">
	<cfelseif len(trim(#qShowcaseGalleryDefaultPhotos.yearprod#)) GT 0 and #qShowcaseGalleryIndividualPhotos.default3# is 1 and FIND(#qShowcaseGalleryIndividualPhotos.yearprod#,#qShowcaseGalleryIndividualPhotos.title#) is 0>
		  <cfset xTitle="#xTitle# #qShowcaseGalleryDefaultPhotos.yearprod#">
	</cfif>	
   
	<!--- Medium --->
	<cfif len(#qShowcaseGalleryIndividualPhotos.medium#) GT 0 and #qShowcaseGalleryIndividualPhotos.medium# is NOT 'Other Medium'>
		<cfset xMedium="#qShowcaseGalleryIndividualPhotos.medium#"> 
	<cfelseif len(#qShowcaseGalleryIndividualPhotos.othermed#) GT 0> 			
		<cfset xMedium="#qShowcaseGalleryIndividualPhotos.othermed#">
	<cfelseif len(#qShowcaseGalleryDefaultPhotos.othermed#) GT 0> 				
		<cfset xMedium="#qShowcaseGalleryDefaultPhotos.othermed#">
	<cfelseif len(#qShowcaseGalleryDefaultPhotos.medium#) GT 0> 										 
		<cfset xMedium="#qShowcaseGalleryDefaultPhotos.medium#">
	</cfif>
	 
	<!--- Image Size --->
	<cfif val(#qShowcaseGalleryIndividualPhotos.width1#) GT 1>
		<cfset xSize="#qShowcaseGalleryIndividualPhotos.height1#x#qShowcaseGalleryIndividualPhotos.width1#&quot; Image">
		<!--- Make sure that there is a width size that exists --->
	<cfelseif val(#qShowcaseGalleryDefaultPhotos.width1#) is 1 and val(#qShowcaseGalleryDefaultPhotos.height1#) is 1>
		<cfset xSize="Image Size Varies">
	<cfelseif val(#qShowcaseGalleryDefaultPhotos.width1#) GT 0>
		<cfset xSize="#qShowcaseGalleryDefaultPhotos.height1#x#qShowcaseGalleryDefaultPhotos.width1#&quot; Image">
	<cfelse>
		<cfset xSize="">
	</cfif> 
	
	<!--- Mat Size --->
	<!--- Mat --->
	<!--- Individual Photos --->
	<cfif (val(#qShowcaseGalleryIndividualPhotos.Matwidth1#) GT 0) or (VAL(#qShowcaseGalleryIndividualPhotos.default4#) is 0)>
		<cfif #qShowcaseGalleryIndividualPhotos.unmatted# is 1>
			<cfset xMat="Unmatted">
		<!--- Make sure that there is a mat size that exists --->
		<cfelseif val(#qShowcaseGalleryIndividualPhotos.Matwidth1#) GT 1>
			<!--- if Default Mat is the same size as the print, assume that it is unmatted>--->
			<cfif #qShowcaseGalleryIndividualPhotos.matheight1# is #qShowcaseGalleryIndividualPhotos.height1# and #qShowcaseGalleryIndividualPhotos.matwidth1# is #qShowcaseGalleryIndividualPhotos.width1#>
				<cfset xMat="Mat size varies">
			<cfelse> 				
				<cfset xMat="#qShowcaseGalleryIndividualPhotos.matheight1#x#qShowcaseGalleryIndividualPhotos.matwidth1#&quot; Mat">
			</cfif>
		</cfif>  		
	<cfelse>
		<!--- Default Photos --->
		<cfif #qShowcaseGalleryDefaultPhotos.unmatted# is 1 >
			<cfset xMat="Unmatted">
		<!--- Make sure that there is a mat size that exists --->
		<cfelseif val(#qShowcaseGalleryDefaultPhotos.Matwidth1#) GT 0>
			<!--- if Mat is the same size as the print, assume that it is unmatted>--->
			<cfif #qShowcaseGalleryDefaultPhotos.matheight1# is #qShowcaseGalleryDefaultPhotos.height1# and 
			#qShowcaseGalleryDefaultPhotos.matwidth1# is #qShowcaseGalleryDefaultPhotos.width1#>
				<cfset xMat="Mat size varies">
			<cfelse>
				<cfset xMat="#qShowcaseGalleryDefaultPhotos.matheight1#x#qShowcaseGalleryDefaultPhotos.matwidth1#&quot; Mat">			
			</cfif>
		</cfif> 	 
	</cfif>	
	
	<!--- If len(Edition No) is 0 --->
	<cfif #qShowcaseGalleryIndividualPhotos.Editioned1# is 1 and (#len(trim(qShowcaseGalleryIndividualPhotos.EditionNo1))# is 0 or #qShowcaseGalleryIndividualPhotos.EditionNo1# is 0) and #len(trim(qShowcaseGalleryIndividualPhotos.EditionSz1))# GT 0>
		<cfset xEdition="Edition of #qShowcaseGalleryIndividualPhotos.EditionSz1#">
	
	 <cfelseif #qShowcaseGalleryIndividualPhotos.Default5# is 1 and  #qShowcaseGalleryDefaultPhotos.Editioned1# is 1 and (#len(trim(qShowcaseGalleryDefaultPhotos.EditionNo1))# is 0 or #qShowcaseGalleryIndividualPhotos.EditionNo1# is 0)>		
		<cfset xEdition="Edition of #qShowcaseGalleryDefaultPhotos.EditionSz1#">  
		 <cfelseif #qShowcaseGalleryIndividualPhotos.Editioned1# is 1 and #len(qShowcaseGalleryIndividualPhotos.EditionNo1)# GT 0 and #len(qShowcaseGalleryIndividualPhotos.EditionSz1)# GT 0>		
		 <cfset xEdition="#qShowcaseGalleryIndividualPhotos.EditionNo1#/#qShowcaseGalleryIndividualPhotos.EditionSz1#"> 
		 <cfelseif #qShowcaseGalleryIndividualPhotos.Default5# is 1 and  #qShowcaseGalleryDefaultPhotos.Editioned1# is 1>			
		 <cfset xEdition="#qShowcaseGalleryDefaultPhotos.EditionNo1#/#qShowcaseGalleryDefaultPhotos.EditionSz1#">
		<cfelse>
		 <cfset xEdition="Not Editioned">
		 </cfif>		 
		
	<!--- Price --->
	  <cfif (#qShowcaseGalleryIndividualPhotos.defaultnfs# is 1 and qShowcaseGalleryDefaultPhotos.notavailable is 5) or (#qShowcaseGalleryIndividualPhotos.defaultnfs# is 0 and qShowcaseGalleryIndividualPhotos.notavailable is 5)>				
		  <cfelseif #qShowcaseGalleryIndividualPhotos.price1# GT 0 and  qShowcaseGalleryIndividualPhotos.NotAvailable is 0 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1>
				<cfif #qShowcaseGalleryDefaultPhotos.PortfolioPrice# is 1>
					<cfset xPrice="$#qShowcaseGalleryIndividualPhotos.price1# Portfolio Price">
				<cfelse>
					<cfset xPrice="$#qShowcaseGalleryIndividualPhotos.price1#">
				</cfif>
	 <cfelseif #qShowcaseGalleryDefaultPhotos.price1# GT 0 and #qShowcaseGalleryDefaultPhotos.NotAvailable# is 0 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is  1>
			<cfif qShowcaseGalleryDefaultPhotos.PortfolioPrice is 1>
				<cfset xPrice="$#qShowcaseGalleryDefaultPhotos.price1# Portfolio Price">
			<cfelse>
				<cfset xPrice="$#qShowcaseGalleryDefaultPhotos.price1#">
			</cfif>
		<cfelse>
		<cfset xPrice="Price upon request">
	 </cfif> 
	 
	
		
	<!--- Purchase --->
		<cfif (qShowcaseGalleryIndividualPhotos.NotAvailable is 5 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 5 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1)>
		 <cfset xPrice="" />
		 <cfset xPurchase="<a href='mailto:gallery@photoeye.com?Subject=#qShowcaseArtist.FirstName# #qShowcaseArtist.LastName# Price Inquiry'>Price Upon Request</a>">
		<cfelseif (qShowcaseGalleryIndividualPhotos.NotAvailable is 0 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 0 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1)>
		<cfset xPurchase="<input type='image' src='../sharedimages/purchaseprintGray.gif' align='absmiddle' width='90' height='15' border='0'>">
		<cfelseif (qShowcaseGalleryIndividualPhotos.NotAvailable is 1 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 1 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1)>
		 <cfset xPurchase="Sold Out">
		<cfelseif (qShowcaseGalleryIndividualPhotos.NotAvailable is 2 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 2 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1)>
		  <cfset xPurchase="Reserved">
		<cfelseif (qShowcaseGalleryIndividualPhotos.NotAvailable is 3 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 3 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1)>
		  <cfset xPurchase="Not for Sale">
		</cfif>
		
	<cfif len(#qShowcaseGalleryIndividualPhotos.caption1#) is not 0>
		<cfset xCaption = qShowcaseGalleryIndividualPhotos.caption1>
		<cfset xCaption = replace(xCaption, chr(10), " ", "ALL")>
		<cfset xCaption = replace(xCaption, chr(13), " ", "ALL")>
		<cfset xCaption = replace(xCaption, "'", "&prime;", "ALL")>
		<cfset xCaption = trim(xCaption)>
	<cfelseif len(#qShowcaseGalleryDefaultPhotos.caption1#) is not 0>
		<cfset xCaption = qShowcaseGalleryDefaultPhotos.caption1>
		<cfset xCaption = replace(xCaption, chr(10), " ", "ALL")>
		<cfset xCaption = replace(xCaption, chr(13), " ", "ALL")>
		<cfset xCaption = replace(xCaption, "'", "&prime;", "ALL")>
		<cfset xCaption = trim(xCaption)>
	<cfelse>
		<cfset xCaption = "">
	</cfif>
	<cfif len(#qShowcaseGalleryIndividualPhotos.addinfo1#) is not 0>
		<cfset xInfo = qShowcaseGalleryIndividualPhotos.addinfo1>
		<cfset xInfo = replace(xInfo, chr(10), " ", "ALL")>
		<cfset xInfo = replace(xInfo, chr(13), " ", "ALL")>
		<cfset xInfo = replace(xInfo, "'", "&prime;", "ALL")>
		<cfset xInfo = trim(xInfo)>
	<cfelseif len(#qShowcaseGalleryDefaultPhotos.addinfo1#) is not 0>
		<cfset xInfo = qShowcaseGalleryDefaultPhotos.addinfo1>
		<cfset xInfo = replace(xInfo, chr(10), " ", "ALL")>
		<cfset xInfo = replace(xInfo, chr(13), " ", "ALL")>
		<cfset xInfo = replace(xInfo, "'", "&prime;", "ALL")>
		<cfset xInfo = trim(xInfo)>
	<cfelse>
		<cfset xInfo = "">
	</cfif>
		
		<script type="text/javascript">
			var capvar#xCapCount# = escape('#xCaption#');
			var infovar#xCapCount# = escape('#xInfo#');
		</script>
	
	 	
	<div><a href="/gallery/forms/indexA.cfm?image=#url.image#&id=#url.id#&imagePosition=#xCapCount+1#&Door=#url.Door#&Portfolio=#url.Portfolio#&Gallery=#url.Gallery#&Page=&&&<cfif xPan is 0>/artists/#URLEncodedFormat(qShowcaseArtist.Subdirectory)#/#qShowcasePortfolio.Subdirectory#/Images_Large/Image#ImageNumber#_H600xW900.jpg
	<cfelse>
/artists/#URLEncodedFormat(qShowcaseArtist.Subdirectory)#/#qShowcasePortfolio.Subdirectory#/Images_Large/Image#ImageNumber#_H500xW3000.jpg	
	</cfif>" rel="lightbox[#URLEncodedFormat(qShowcaseArtist.lastname)#]" target="_blank" alt="#xTitle#" title="<cfif len(trim(xInfo)) IS NOT 0>&lt;span id='infoToggle' onclick=&quot;peLightbox.GoCaption(0,infovar#xCapCount#)&quot; &gt;[&lt;span class='displayers'&gt;display&lt/span&gt; additional info]&lt;/span&gt;</cfif><cfif len(trim(xCaption)) IS NOT 0>&lt;span id='captionToggle' onclick=&quot;peLightbox.GoCaption(1,capvar#xCapCount#)&quot; &gt;[&lt;span class='displayers'&gt;display&lt/span&gt; caption]&lt;/span&gt;</cfif>&lt;a href='/gallery/forms2/homepage.cfm?image=Image#ImageNumber#&id=#url.id#&imagePosition=1&Door=1&Portfolio=#url.portfolio#&Gallery=1'<cfif xPan is 0> class='info1' <cfelse> class='info1' </cfif>&gt;#qShowcaseArtist.firstname# #qShowcaseArtist.lastname#
&lt;/a&gt;&lt;br /&gt;#xTitle#&lt;br /&gt;
&lt;span class='info2'&gt;
&lt;br /&gt;#xMedium#
&lt;br /&gt;#xSize#
&lt;br /&gt;#xMat#
&lt;br /&gt;#xEdition#
&lt;br /&gt;#xprice# 
&lt;/span&gt;&lt;br /&gt;&lt;br /&gt;
<cfif xPurchase NEQ 'Reserved' AND xPurchase NEQ 'Sold Out' AND xPurchase NEQ 'Not for Sale'>
&lt;a href='##' class='info3' onclick='window.location = &quot;../../templates/AddtoCartGalleriesNew.cfm?userid=#Cookie.UserIdNumber#&NumCopies=1&Binding=Photography&Listprice=#qGetDetails.Soft_price#&SalePrice=0&RecordID=#qGetDetails.recordID#&Catnum=#qGetDetails.Catalog#&ArtistF=#ArtistF#&ArtistL=#ArtistL#&Showcase=1&quot;' &gt;#xPurchase#&lt;/a&gt;
<cfelse>#xPurchase#</cfif>" id="LBimage#NumberFormat(ImageNumber, '00_')#"><img title="#qShowcaseArtist.firstname# #qShowcaseArtist.lastname#: #xTitle#" src=<cfif xPan is 0>"/artists/#qShowcaseArtist.Subdirectory#/#qShowcasePortfolio.Subdirectory#/Images_Large/Image#ImageNumber#_H240xW500.jpg" width="150"<cfelse>"/artists/#qShowcaseArtist.Subdirectory#/#qShowcasePortfolio.Subdirectory#/Images_Large/Image#ImageNumber#_H120xW500.jpg"</cfif> alt="#qShowcaseArtist.firstname# #qShowcaseArtist.lastname#: #xTitle#"/></a></div>


<!---

<a href="/artists/HiroshiWatanabe/Portfolio7/Images_Large/Image1_H600xW900.jpg" rel="lightbox[watanabe]" title="&lt;a href='/gallery/forms2/homepage.cfm?image=1&id=53264&imagePosition=1&Door=1&Portfolio=Portfolio8&Gallery=1' class='info1'&gt;Hiroshi Watanabe&lt;/a&gt; : Findings&lt;br /&gt;&lt;span class='info2'&gt;Beach House, Barcelona, Spain, 2005&lt;br /&gt;Toned Gelatin-Silver Print&lt;br /&gt;10x10'' Image&lt;br /&gt;Edition of 30&lt;/span&gt;&lt;br /&gt;&lt;br /&gt;&lt;a href='/templates/addtocartboth.cfm?CFID=3711261&CFTOKEN=35107508' class='info3'&gt;$ purchase print&lt;/a&gt;"><img src="/artists/HiroshiWatanabe/Portfolio7/Images_Large/Image1_H75xW75.jpg" /></a>

<!---  As for the grid, it's all hard coded in the CSS, as long as the images have a max width / height of 75px then this will display just fine, no tables necessary unless you run into some problem I'm not thinking of.  --->

<a href="/artists/HiroshiWatanabe/Portfolio7/Images_Large/Image2_H600xW900.jpg" rel="lightbox[watanabe]" title="Bakery Window, Lerma, Spain, 2005"><img src="/artists/HiroshiWatanabe/Portfolio7/Images_Large/Image2_H75xW75.jpg" /></a>

<a href="/artists/HiroshiWatanabe/Portfolio7/Images_Large/Image3_H600xW900.jpg" rel="lightbox[watanabe]" title="Cat, Lamu, Kenya, 1997"><img src="/artists/HiroshiWatanabe/Portfolio7/Images_Large/Image3_H75xW75.jpg" /></a>

<a href=""><img src="http://test.photoeye.com/artists/DougKeyes/Portfolio3/Images_Large/Image1_H75xW75.jpg" /></a>

<a href=""><img src="http://test.photoeye.com/artists/DougKeyes/Portfolio3/Images_Large/Image2_H75xW75.jpg" /></a>

<a href=""><img src="http://test.photoeye.com/artists/DougKeyes/Portfolio3/Images_Large/Image3_H75xW75.jpg" /></a>

<a href=""><img src="http://test.photoeye.com/artists/DougKeyes/Portfolio3/Images_Large/Image4_H75xW75.jpg" /></a>

<a href=""><img src="http://test.photoeye.com/artists/NickBrandt/Portfolio6/Images_Large/Image10_H75xW75.jpg" /></a>

<a href=""><img src="http://test.photoeye.com/artists/NickBrandt/Portfolio6/Images_Large/Image11_H75xW75.jpg" /></a>

<a href=""><img src="http://test.photoeye.com/artists/NickBrandt/Portfolio6/Images_Large/Image8_H75xW75.jpg" /></a>

<a href=""><img src="http://test.photoeye.com/artists/NickBrandt/Portfolio6/Images_Large/Image4_H75xW75.jpg" /></a>

<a href=""><img src="http://test.photoeye.com/artists/NickBrandt/Portfolio6/Images_Large/Image14_H75xW75.jpg" /></a> --->
<cfset xCapCount++>
</cfoutput>
</div>
</div>
<!--- Sets the Img_Container height to +90px for each row of images --->
<script type="text/javascript">


<!---	new Effect.Parallel(
				[ 
					new Effect.SlideUp('lightboxCaption', { sync: true, duration: 2.0, from: 0.0, to: 1}), 
					new Effect.Appear('lightboxCaption', { sync: true, duration: 2.0 })
				], 
				{ 
					duration: 2.0,
				}
		);--->
var arrMenu = $$('#Gallery_Menu a');
arrMenu[arrMenu.length-1].setStyle({background:'none'});
<cfif xPan IS 1>
	var ContainerHeight = (<cfoutput>#xCounter#</cfoutput>*1125)+'px';
<cfelse>
	var ContainerHeight = (Math.ceil(<cfoutput>#xCounter#</cfoutput>/7)*190)+'px';
</cfif>
$('Img_Container').setStyle({height:ContainerHeight});
window.name = 'PEMain';
</script>
<!---RR 8/21/2013 margin-top:50px --->
<div id="TogHowTo" onclick="$('HowTo').toggle()" style="text-align:center; display:inline-block;cursor:pointer;color:#A8905C;padding-top:265px;text-transform:uppercase;margin-bottom:5px;font-size:10px">How to use our image viewer</div>
<div id="HowTo" style="color:#666666; margin-left:150px; margin-right:150px; margin-bottom:35px; display:none;">Click on any of the thumbnail images to launch the viewer.  You can then navigate forward and backward within the portfolio by clicking the upper left or right side of the enlarged image.  The information panel below the image can also be hidden and revealed (though not in Internet Explorer), and includes links to any additional information as well as a way to purchase a print through our secure server.<br /><br />

Please note that if your browser does not support our image viewer you will be taken to our old gallery system. If so, you may want to consider upgrading your browser.</div>

<div id="TogHowTo2" onclick="$('HowTo2').toggle()" style="text-align:center; cursor:pointer; color:#A8905C; margin-top:0px; text-transform:uppercase; margin-bottom:25px; font-size:10px">How to purchase a print</div>
<div id="HowTo2" style="color:#666; margin-left:150px; margin-right:150px; margin-bottom:50px; display:none;">To purchase a print online, open the image you'd like to order and click the 'purchase print' button to add it to your photo-eye shopping cart. Then, checkout through our secure server by following the simple prompts.<br /><br />

To purchase a print over the phone, please call our Gallery at 800.227.6941 x202 or 505.988.5152 x202.</div> <br />
<!--- 

hope this all works / makes sense, this coding has fried my brain so I really can't tell anymore.  Best of luck and call me if you ahve any problems at all!  -Daniel 

--->

<cfinclude template="../Includes/dsp_Galleries_index_bottom.cfm">