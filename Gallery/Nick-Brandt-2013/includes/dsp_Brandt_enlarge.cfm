<!--- Disable right click  --->
<script language="javascript">
document.onmousedown=disableclick;
status="&copy; Nick Brandt. All Rights Reserved.";
Function disableclick(event)
{
  if(event.button==2)
   {
     alert(status);
     return false;    
   }
}
</script>

	<cfset local.id = url.id>
	<cfset local.portfolioDirName=url.pid>
	<cfset local.ip = url.ip>
	
	
	
	<!--- Get artist --->
	<CFQUERY NAME="qShowcaseArtist"  DATASOURCE="photoeyecom">
		SELECT *
		FROM GallerySetup 
		WHERE custnumber = <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#local.id#" maxLength="6" />
	</CFQUERY>
	
	<!--- Get images --->
	<CFQUERY NAME="qShowcaseGalleryIndividualPhotos"  DATASOURCE="photoeyecom">
	  	SELECT *
	 	FROM GalleryIndividualPhotos
	 	WHERE custnumber = <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#local.id#" maxLength="6" /> 
	 		AND PortfolioName = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#local.portfolioDirName#" maxLength="11" /> 
	 		AND AlphaOrder=<cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#local.ip#" maxLength="6" /> 
	 		AND NOT (notavailable=4 AND imagenumber>1) 
	 		<!--- AND showcaseok=1 or (portfolioName='Portfolio4' and custnumber=197467) --->
	</CFQUERY>	



	<!--- Get portfolio info --->
	<CFQUERY NAME="qShowcasePortfolio"  DATASOURCE="photoeyecom">
		SELECT *
		FROM GalleryPortfolio 
		WHERE Custnumber = <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#local.id#" maxLength="6" /> 
			AND SUBDIRECTORY = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#local.portfolioDirName#" maxLength="11" />
	</CFQUERY> 

	
	<!--- Get the correct portfolio title --->
	<cfquery name="qGetPortfolioName" datasource="photoeyecom">
		SELECT PortfolioName
		FROM GalleryDefaultPhotos
		WHERE Custnumber = <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#local.id#" maxLength="6" /> 
			AND Subdirectory = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#local.portfolioDirName#" maxLength="11" /> 
	</cfquery>
	
	<CFQUERY NAME="qCountPortfolios"  DATASOURCE="photoeyecom">
		SELECT *
		FROM GalleryPortfolio 
		WHERE Custnumber = <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#local.id#" maxLength="6" /> 
			AND showcaseok = 1
	</CFQUERY> 
	
	<CFQUERY NAME="qShowcaseGalleryDefaultPhotos"  DATASOURCE="photoeyecom">
	  SELECT *
	  FROM GalleryDefaultPhotos
	  WHERE Custnumber = <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#local.id#" maxLength="6" /> 
			AND Subdirectory = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#local.portfolioDirName#" maxLength="11" /> 
	</CFQUERY>


<!--- IMage stuff --->
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
	<cfelseif len(#qShowcaseGalleryDefaultPhotos.addinfo1#) is not 0 and 1 eq 2>
		<cfset xInfo = qShowcaseGalleryDefaultPhotos.addinfo1>
		<cfset xInfo = replace(xInfo, chr(10), " ", "ALL")>
		<cfset xInfo = replace(xInfo, chr(13), " ", "ALL")>
		<cfset xInfo = replace(xInfo, "'", "&prime;", "ALL")>
		<!--- <cfset xInfo = replace(xInfo, "@", '@@', "ALL")>--->
		<cfset xInfo = trim(xInfo)>
	<cfelse>
		<cfset xInfo = "">
	</cfif>
	 
		<script type="text/javascript">
			var capvar#xCapCount# = escape('#xCaption#');
			var infovar#xCapCount# = escape('#xInfo#');
		</script>

<!--- End RR --->

<!--- <div align="center" style="padding-top:20px;"> --->
<cfparam name="beingCaptured" default="0">
<!--- display:none; --->
<div id="allContents" style="">

	<div id="contentContainer" style="text-align:center;clear:both;">
	
	<!--- display:none; --->
	<!--- 	<div id="sivDisplay" style="width:800px;margin-top:30px;">	 --->
		<div id="sivDisplay" style="max-width:100%;width:auto; height:auto; margin-top:10px; margin-left:auto;
margin-right:auto; padding-left:10px; padding-right:25px; padding-bottom:20px;">					
			<div id="sivImage" style="max-width:100%;width:auto; height:auto;">
				<div style="line-height:30px; color:#888; " >
<!--- 					<span style="display:none;"><cfoutput>#qImage.sequence-2#</cfoutput></span> --->
					
					<cfif beingCaptured>
						<cfset initialImageSizeID = 'large' />
					<cfelse>
						<cfset initialImageSizeID = 'extralarge' />
					</cfif>

 
					
			 	<cfoutput>
			 	
				<cfset xNextImagePosition= val(qShowcaseGalleryIndividualPhotos.AlphaOrder)+1>
				<!--- This is for the 24 images in the New Release --->
				<cfif xNextImagePosition gt 24>
					<cfset xNextImagePosition= 1>
				</cfif>
 <!--- _H600xW900.jpg --->


<script type="text/javascript">
<!--
    function toggle_visibility(id) {
       var e = document.getElementById(id);
       if(e.style.display == 'block')
          e.style.display = 'none';
       else
          e.style.display = 'block';
    }
//-->
</script>

<!--- <cfimage
    required
    action = "info"
    source = "http://www.visualserver.com/artists/#qShowcaseArtist.subdirectory#/#qShowcasePortfolio.subdirectory#/Images_Large/Image#qShowcaseGalleryIndividualPhotos.ImageNumber#.jpg"
    structname = "image"> --->
    <!--- _H600xW900 --->
				<a href="enlargement.cfm?ip=#xNextImagePosition#&id=#qShowcaseArtist.custnumber#&pid=#qShowcasePortfolio.subdirectory####xNextImagePosition#">
					<img src = "http://www.visualserver.com/artists/#qShowcaseArtist.subdirectory#/#qShowcasePortfolio.subdirectory#/Images_Large/Image#qShowcaseGalleryIndividualPhotos.ImageNumber#.jpg"  alt="#qShowcaseArtist.firstname# #qShowcaseArtist.lastname#: #qShowcaseGalleryIndividualPhotos.title#"  title="#qShowcaseArtist.firstname# #qShowcaseArtist.lastname#: #qShowcaseGalleryIndividualPhotos.title#"   style="max-width: 100%;"/></a>  				<br />
		<a href="enlargement.cfm?ip=#xNextImagePosition#&id=#qShowcaseArtist.custnumber#&pid=#qShowcasePortfolio.subdirectory####xNextImagePosition#"><span id="captionToggle" class="imgCaption" style="padding-right:50px; font-size:.9em;text-transform:uppercase;cursor:pointer;">click image to advance</span></a>		#qShowcaseGalleryIndividualPhotos.Title#  &copy;	Nick Brandt </cfoutput> <span style="margin-left:40px;font-size:.9em;"><a href="#Bot" onclick="toggle_visibility('foo');">PRINT&nbsp;INFO</a>
					<a href="portfolio.cfm?id=185363&portfolio=Portfolio14"><span id="captionToggle" class="imgCaption" style="padding-left:10px; font-size:1em;text-transform:uppercase;cursor:pointer;"> :::&nbsp;back&nbsp;to&nbsp;thumbs</span></a>
					
				<!--- <cfset initialImageWidth = returnedImgWidth /> --->
 <div id="foo" style="display:none; margin-top:10px;"><cfoutput>#xInfo#</cfoutput><a name="Bot"></div>

					<br />
					<div id="sivNavContainer">
						<a id="navLeft" style="display:none;"> </a>
						<a id="navRight" style="display:none;"> </a>
					</div>
			 
				
					<!--- Get images AND ImagePosition=maxLength="6" /> --->
					<!--- <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#xNextImagePosition#"  --->
					
					<!--- 	  	SELECT *
	 	FROM GalleryIndividualPhotos
	 	WHERE custnumber = <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#local.id#" maxLength="6" /> 
	 		AND PortfolioName = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#local.portfolioDirName#" maxLength="11" /> 
	 		AND ALPHAORDER = <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#xNextImagePosition#">
	 		AND NOT (notavailable=4 AND imagenumber>1) 
		ORDER BY alphaorder --->
		
		
	<CFQUERY NAME="qShowcaseGalleryIndividualPhotos"  DATASOURCE="photoeyecom">
	  	SELECT *
	 	FROM GalleryIndividualPhotos
	 	WHERE custnumber = <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#local.id#" maxLength="6" /> 
	 		AND PortfolioName = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#local.portfolioDirName#" maxLength="11" /> 
	 		AND ALPHAORDER = <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#xNextImagePosition#">
	 		AND NOT (notavailable=4 AND imagenumber>1) 
		ORDER BY alphaorder
	</CFQUERY>	
<!--- _H600xW900 --->
				<div id="hiddenImage" style="display:none;"><cfoutput><img src = "http://www.visualserver.com/artists/#qShowcaseArtist.subdirectory#/#qShowcasePortfolio.subdirectory#/Images_Large/Image#qShowcaseGalleryIndividualPhotos.imagenumber#.jpg"  alt="#qShowcaseArtist.firstname# #qShowcaseArtist.lastname#: #qShowcaseGalleryIndividualPhotos.title#"  title="#qShowcaseArtist.firstname# #qShowcaseArtist.lastname#: #qShowcaseGalleryIndividualPhotos.title#"/></cfoutput>
		</div>


				<span id="captionUnderlay" class="imgCaption"></span>
				<!--- display:none; --->
				<span id="transitionToggle" class="imageMenu"  style="display:none;"></span>
				</div>
			</div>
		</div>
		<!--- display:none; --->
		<div id="loading" style="display:none;">
 
			
			
			<div>
 
			</div>
		</div> 
		<!--- display: none; --->
		<div id="captionOverlay" style="display: none;" class="imgCaption"> #title#xxxx</div> 
		<!---  <em>Image Title</em>, 2008. 30x30" C-Type Print, $500. Edition of 20. --->
		<div id="portfolio_introduction" style="display:none;">
				
		</div>
	</div>






<!--- Start hidden detail bin, build all the captions for this portfolio and stash them in hidden tags, thumbnailDrawer pulls from these on display --->
<!--- 	<style>
	<!--- #<cfoutput>#strHEXb#</cfoutput> --->
		#trigger {background:white;}
		<!--- #<cfoutput>#strHEX#</cfoutput> --->
		 #pop {background:white;} 
		#navLeftA.off { background: url('<cfoutput>#request.templatelocal#</cfoutput>templates/10/images/leftarrow_off.gif?2') no-repeat left; }
		#navLeftA.on, #navLeftA:hover { background: url('<cfoutput>#request.templatelocal#</cfoutput>templates/10/includes/images/leftarrow_on.gif?2') no-repeat left; }
		#navRightA.off { background: url('<cfoutput>#request.templatelocal#</cfoutput>templates/10/images/rightarrow_off.gif?2') no-repeat right; }
		#navRightA.on, #navRightA:hover { background: url('<cfoutput>#request.templatelocal#</cfoutput>templates/10/images/rightarrow_on.gif?2') no-repeat right; }
	</style>
	--->
	


	</div>


<!--- Start hidden detail bin, build all the captions for this portfolio and stash them in hidden tags, thumbnailDrawer pulls from these on display --->

<cfset qTextPage.content = ''>
<cfset qTextPage.recordCount = 0>
<cfset qTextPage.publish = 0>

<cfif qTextPage.recordCount AND qTextPage.publish >
	<div id="textBin" style="display:none;">
		<cfoutput>#qTextPage.content#</cfoutput>
	</div>
</cfif>


