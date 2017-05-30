


<cfset request.templatelocal = "http://www.visualserver.com/vs/sites/">
<cfset qWebsiteStyles.imgCaptionFontColor = "##999">
<cfset qUser.FirstName = "Nick">
<cfset qUser.LastName = "Brandt">
<cfset qPortfolio.title = "Across the Ravaged Land">


<!--- Please note:  Counterintuitivly, this file is not actually used by Template 10 -- instead it is the "Deluxe Image Page" used by other templates.  It is kept in the 10 directory because it uses all the same resources as template 10 and is essentially the same viewer (without the thumbnail drawer) --->

<!--- Get the images --->


    



<!--- 
	
dsp_viewer_page.cfm
------------------
02.23.2011 -- DE

--->

<!---

1. Preprocess
=========== 

--->

<!--- <cfsilent>  --->
	
	<!--- initialize local variables, we add more to this later --->
	<cfset local = StructNew() />
	<cfset local.imageGeneratorReport = "" />
	
	<cffunction name="status">
		<cfargument name="message" required="true" />
		<cfargument name="lnbreak" required="false" default="false" />
		<cfif arguments.lnbreak>
			<cfset local.imageGeneratorReport &= "<br /><br />" />
		</cfif>
		<cfset local.imageGeneratorReport &= " #arguments.message#" />
		<cfreturn true />
	</cffunction>

	<cfif StructKeyExists(URL,'id') AND StructKeyExists(URL,'i') AND StructKeyExists(URL,'pid')>
		<cfset local.id = url.id />
		<cfset local.startingImageID = url.i />
		<cfset local.portfolioDirName = url.pid />
	<cfelse>
		<!--- TODO: error gracefully --->
		Not enough parameters
		<cfabort />
	</cfif>
	
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
	 		AND NOT (notavailable=4 AND imagenumber>1) 
	 	<!---	AND showcaseok=1 --->
		ORDER BY imageposition;
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
	</CFQUERY>
		
	<CFQUERY NAME="qShowcaseGalleryDefaultPhotos"  DATASOURCE="photoeyecom">
	  SELECT *
	  FROM GalleryDefaultPhotos
	  WHERE Custnumber = <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#local.id#" maxLength="6" /> 
			AND Subdirectory = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#local.portfolioDirName#" maxLength="11" /> 
	</CFQUERY>
	
	<!--- RR 8/20/2013 for caption --->
<!--- <CFQUERY NAME="qGetDetails"
         DATASOURCE="photoeyecom">
SELECT *
FROM Inventory
WHERE CATALOG = <cfqueryparam value="#qShowcaseGalleryIndividualPhotos.catalog#" cfsqltype="CF_SQL_CHAR">
</CFQUERY> --->

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
	<cfif len(#qShowcaseGalleryIndividualPhotos.addinfo1#) is not 0 and 1 eq 2>
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
	
	<!--- Default to portfolio number if name is blank --->
	<cfset local.portfolioTitle = trim(qGetPortfolioName.PortfolioName) />
	<cfif len(local.portfolioTitle) LTE 0>
		<cfset local.portfolioTitle = qGetShowcaseSetupInfo.PortfolioName />
	</cfif>

<cfset aVSPath = "c:\inetpub\wwwroot\clients\visualservercom\html\">

	<!--- Image settings --->
	<cfset xheight=600>
	<cfset xwidth=900>
	<cfset xImageAddress="#aVSPath#\Artists\#qShowcaseArtist.Subdirectory#\#qShowcasePortfolio.subdirectory#\Images_Large\">
	<cfset xAlt = "Enter Gallery">
	<cfset xImageFormat = "jpg">
	

	<!--- Ensure images --->
	 
	<cfloop query="qShowcaseGalleryIndividualPhotos">
		<cfset xImage = "Image#qShowcaseGalleryIndividualPhotos.imageNUMBER#">
		<cfset status('Checking image #qShowcaseGalleryIndividualPhotos.imageNUMBER#...', true) />
			
		<cfif NOT ListFindNoCase(qShowcaseGalleryIndividualPhotos.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")>
	
			<cfset status('not found, generating...') />
			<cfinclude template="/templates/imagesizercreate.cfm">
			<cfset status('updating db...') />
			<cfquery name="qUpdate"  datasource="photoeyecom">
				Update GalleryIndividualPhotos
				Set ImageSizeList = '#ListAppend(qShowcaseGalleryIndividualPhotos.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")#'
				Where RecordNo = #qShowcaseGalleryIndividualPhotos.RecordNo#
			</cfquery>	
			<cfset status('done.') />
		<cfelse>
		
			<cfset status('found, no action taken.') />
		</cfif>
	</cfloop>
	


	<cfimage action = "info"
	    source= "#aVSPath#\Artists\#qShowcaseArtist.Subdirectory#\#qShowcasePortfolio.subdirectory#\Images_Large\Image#qShowcaseGalleryIndividualPhotos.ImageNUMBER#_h600xw900.jpg" 
	    structname = "imageinfo" />
<!--- </cfsilent> --->


 <style type="text/css">

.menuName  {
font-size:24px;
color: Maroon;
padding-top:120px;
width:100%;

}
#artistName  {
font-size:14px;
color: #999;
padding-top:120px;
width:100%;
letter-spacing:1px;

}
a {
font-size:12px;
color: #66ccff;
}
</style>


<cfoutput>


<div id="menuContainerContainer" style="padding: 0 30px; float:center;">
<div id="menuContainer" style="height:50px; float:center;">
	<div id="menuName" style="float:center; width:100%; padding-bottom:10px;">
		<span style="display:block;">
			<a href="index.cfm" class="title">
				 <img src="/images/photoeye_logo.png" height="50" style="vertical-align:middle;"> <span style="vertical-align:middle; margin-top:120px;">GALLERY</a> <span style="font-size:12px;  color:##999; letter-spacing:1px; width:100px;"> &nbsp;  &nbsp; 505.988.5152 x202  &nbsp; &nbsp;  &nbsp;<a href="mailto:gallery@photoeye.com?Subject=Nick Brandt Release" style="color:##999">gallery@photoeye.com</a></span><span style="width:50px;">&nbsp;</span> &nbsp;  &nbsp; <a href="artist.cfm?id=#local.id#" class="artistName"><span id="artistName" style="font-size:12px;">#UCASE(qShowcaseArtist.firstname)# #UCASE(qShowcaseArtist.lastname)# </span></a>
					<!--- <img src="photo-eye-logo.png" height="50" style="vertical-align:middle;"> <span style="vertical-align:middle; margin-top:120px;">GALLERY</a> <span style="font-size:12px; width:50px; color:##999; letter-spacing:1px;">505.988.5152 x202 <a href="mailto:gallery@photoeye.com?Subject=Nick Brandt Release" style="color:blue">gallery@photoeye.com</a></span></span><a href="artist.cfm?id=#local.id#" class="artistName"><span id="artistName" style="font-size:12px;">#UCASE(qShowcaseArtist.firstname)# #UCASE(qShowcaseArtist.lastname)# --->
					
					<!--- #UCASE(qGetPortfolioName.PortfolioName)#--->   <!--- <img border="0" src="http://www.visualserver.com/vs/UserImages/7/10721/logo1D68.jpg" /> --->
				
		 
		
	</div>

 <!---   <div align="left">
    <div class="index_title"> 
	<h1><a href="artist.cfm?id=#local.id#">#qShowcaseArtist.firstname# #qShowcaseArtist.lastname#</a></h1>
	</div>
	</div> --->

</cfoutput>

	<span class="title" style="visibility:hidden;">&nbsp;</span>
	

</div>

</div>



<!---

<cfmodule template="../../Includes/qry_Images.cfm" portfolioID="#url.nk#">
<cfparam name="url.i" default="#qImages.imageID#" /> --->
 <cfif url.i EQ 0>  
	<cfset url.i = #qShowcaseIndividualPhotos.imageNumber# />
 </cfif>  
<!--- Try this, if it fails then we know the portfolio in question is empty. --->
<!--- <cfinclude template="includes/dsp_menu.cfm" /> --->

<!--- <cfsilent> --->

<!--- Detect the image capture program running on VS, if it's accessing the file then several display features need to be hacked to show up properly --->
<cfif StructKeyExists(URL, 'pagevisualize') OR StructKeyExists(URL, 'capture')>
	<cfset beingCaptured = true />
<cfelse>
	<cfset beingCaptured = false />
</cfif>

<!--- Loop through the images in this portfolio and fire the act_Image_Display for each, this ensures the proper sizes will be generated --->
	<!--- <cfloop query="qImages">
		<cfmodule template="../../Includes/act_Image_Display.cfm" 
								CustNumber="#qWebsite.CustNumber#" 
								ImageID="#qImages.imageID#" 
								SizeID="extralarge" 
								Title="#qImages.Title#"
								Bin="#qImages.Bin#"
								Container="#qImages.Container#"
								Border="1"
								BorderColor="000000"
								insertSize="false">
	</cfloop> --->
	
<!--- </cfsilent> --->

<cfif StructKeyExists(URL, 'purchase')>
<style>
	
	.center
	{ 
	text-align: center;
	}
	
	.center table
	{ 
	margin-left: auto;
	margin-right: auto;
	text-align: left;
	}

</style>
<!--- <div id="allContents" style="margin-top:75px;">
	<div class="center">
		<cfinclude template="../../includes/dsp_PurchaseOptions.cfm">
	</div>
</div> --->

<cfelse> 

<!--- display:none; --->
<div id="allContents" style="max-width:100%; margin-top:30px; margin-left:auto;
margin-right:auto; padding-left:10px; padding-right:10px;">	
<!--- Start main image display area --->

	<div id="contentContainer" style="text-align:center;clear:both;">
	
	<!--- display:none; --->
	<!--- 	<div id="sivDisplay" style="width:602px;margin-top:30px;">	 --->
		<div id="sivDisplay" style="max-width:100%; margin-top:30px; margin-left:auto;
margin-right:auto; padding-left:10px; padding-right:10px;">									
			<div id="sivImage" >
				<div style="line-height:0px; " >
<!--- 					<span style="display:none;"><cfoutput>#qImage.sequence-2#</cfoutput></span> --->
					
					<cfif beingCaptured>
						<cfset initialImageSizeID = 'large' />
					<cfelse>
						<cfset initialImageSizeID = 'extralarge' />
					</cfif>

			<!---		<cfmodule template="../../Includes/act_Image_Display.cfm" 
						CustNumber="#qWebsite.CustNumber#" 
						ImageID="#qImage.imageID#" 
						SizeID="#initialImageSizeID#" 
						Title="#qImage.Title#"
						Bin="#qImage.Bin#"
						Container="#qImage.Container#"
						Border="#qWebsite.imgBorder#"
						BorderColor="#qWebsite.imgBorderColor#"
						insertSize="false"> --->
					
				<cfoutput><img src="http://www.visualserver.com/artists/#qShowcaseArtist.subdirectory#/#qShowcasePortfolio.subdirectory#/Images_Large/Image2.jpg" /></cfoutput> <!--- height="#imageinfo.height#"--->
						
				<!--- <cfset initialImageWidth = returnedImgWidth /> --->
						
					<br />
					<div id="sivNavContainer">
						<a id="navLeft" style="display:none;"> </a>
						<a id="navRight" style="display:none;"> </a>
					</div>
				</div>
		
				<span id="captionToggle" class="imgCaption" style="float:right;font-size:.9em;text-transform:uppercase;cursor:pointer;">more info</span>
				<span id="captionUnderlay" class="imgCaption"></span>
				<!--- display:none; --->
				<span id="transitionToggle" class="imageMenu"  style="display:none;"></span>
			</div>
		</div>
		
		<!--- display:none; --->
		<div id="loading" style="display:none;">
	<!---		<cfif qWebsiteStyles.BackgroundColor IS '000000'>
				<cfset loaderPath = 'circleloadblack.gif' />
			<cfelseif qWebsiteStyles.BackgroundColor IS '666666'>
				<cfset loaderPath = 'circleloadgrey.gif' />
			<cfelse>
				<cfset loaderPath = 'circleloadwhite.gif' />
			</cfif> --->
			
			
			<div>
				<!--- <img class="rounded" style="<cfif loaderPath NEQ 'circleloadwhite.gif'>background:none;<cfelse>background:white;</cfif>padding:20px;opacity:0.5;" src="<cfoutput>#request.templatelocal#/images/#loaderPath#</cfoutput>" /> --->
			</div>
		</div> 
		<!--- display: none; --->
		<div id="captionOverlay" style="display: none;" class="imgCaption"> #title#xxxx</div> 
		<!---  <em>Image Title</em>, 2008. 30x30" C-Type Print, $500. Edition of 20. --->
		<div id="portfolio_introduction" style="display:none;">
				
		</div>
	</div>
	
	
<!--- End main image display area --->


<!--- Start image viewer styles ---> 


	<style>
	<!--- #<cfoutput>#strHEXb#</cfoutput> --->
		#trigger {background:white;}
		<!--- #<cfoutput>#strHEX#</cfoutput> --->
		 #pop {background:white;} 
		#navLeftA.off { background: url('<cfoutput>#request.templatelocal#</cfoutput>templates/10/images/leftarrow_off.gif?2') no-repeat left; }
		#navLeftA.on, #navLeftA:hover { background: url('<cfoutput>#request.templatelocal#</cfoutput>templates/10/includes/images/leftarrow_on.gif?2') no-repeat left; }
		#navRightA.off { background: url('<cfoutput>#request.templatelocal#</cfoutput>templates/10/images/rightarrow_off.gif?2') no-repeat right; }
		#navRightA.on, #navRightA:hover { background: url('<cfoutput>#request.templatelocal#</cfoutput>templates/10/images/rightarrow_on.gif?2') no-repeat right; }
	</style>
	
	
<!--- This makes the right border of the thumbnail drawer appear in IE 8 --->
	<!--[if IE8]>
	<style>
		#trigger, #pop { width: 99.8%; }
		#container {
			margin: 0;
		}
		#breatherContainer {
			width: 60%;
		}
	</style>
	<![endif]-->
	
	<!--[if IE7]>
	<style>
		#trigger, #pop { width: 99.8%; }
		#container {
			margin: 0;
		}
		#breatherContainer {
			width: 60%;
		}
	</style>
	<![endif]-->
	
<!--- End image viewer styles --->
<!--- Start thumbnail drawer --->

	<div id="container">
		<div id="controls" style="z-index:998;padding-top:10px;">
			<div class="section" style="text-align:right;width:33.3%;">
				
				<div style="float:left;width:30%">
				&nbsp;
				</div>
				
				<div style="float:left;width:30%">
					<span class="imgCaption">&nbsp;</span>
					<span id="slideshowToggle" class="imgCaption" style="font-size:.6em;text-transform:uppercase;cursor:pointer;">play</span> <!---  <input id="slideshowSpeedInput" type="text" value="00" style="width: 15px; border: 1px solid #999;"> --->
				
				</div>
				
				<div style="float:left;width:39%;text-align:left;">
					<span id="slideshowText">
						<span class="imgCaption">&nbsp;</span>
						<span class="imgCaption" style="font-size:.6em;text-transform:uppercase;cursor:pointer;">slideshow</span>
					</span>
					<div id="slideshowSpeed" style="display:none;text-align:left;">
						<div style="float:left;width:45%;text-align:right;">
							<div>&nbsp;<span class="imgCaption" style="font-size:.6em;">delay&nbsp;[&nbsp;<span id="slideshowNum">2</span>&nbsp;sec&nbsp;]</span></div>
						</div>
						
						<div style="float:left;width:50%;text-align:left;">
							<div style="margin:10px 0 4px 4px;width:100px;text-align:left;">
								<div id="delayTrack" style="width:50px;height:1px;background:#<cfoutput>#qWebsiteStyles.imgCaptionFontColor#</cfoutput>;">
								<div style="height:7px;width:2px;background:#333;cursor:col-resize;position:relative;bottom:3px;" id="delayHandle"></div>
								</div>
							</div>
							
						</div>
					</div>
				</div>

				
			</div>
			<div class="section" style="text-align:center;width:33.3%;">
				<span id="imageCounterContainer" class="imgCaption"><span id="navLeftA" class="off">&nbsp;</span><span id="imageCounter">1/23</span><span id="navRightA" class="off">&nbsp;</span></span>
			</div>
			
			<div style="float:right;width:33%; text-align:left;">
					<cfoutput><a href="portfolio.cfm?id=#qShowcasePortfolio.custnumber#&portfolio=#qShowcasePortfolio.subdirectory#"><span class="grid-icon" style="color:##333;">::::</span><span class="grid-text" style="color:##333;">ALL IMAGES</span></a></cfoutput>				
				</div>
				
				
			<div class="section" style="text-align:left;width:33.3%;">&nbsp;</div>
		</div>
		<div id="trigger" style="z-index:999;">
			<div class="copyright" style="float:left;width:19%;text-align:left;padding-left:1%;">
				<span class="copyright">
				<cfoutput>&copy; #dateFormat(now(),"yyyy")# 
				<!---- RR ?pM=#url.pM# --->
				<cfset url.pM = 1>
					<a href="index.cfm<cfif url.pM>?pM=#url.pM#</cfif>" class="copyright">
						#qUser.FirstName# #qUser.LastName#
					</a>
				</cfoutput>	
				</span>
			</div>
			<div style="float:left;width:60%;padding-top:5px; text-transform: uppercase;font-family:inherit;font-size:10px	;" class="imgCaption">
				<span style="font-weight:normal;"><cfoutput>#qPortfolio.title#</cfoutput></span>
			</div>
			<div class="copyright" style="float:left;width:18%;text-align:right;padding-right:1%;">
				photo-eye Gallery | <a href="http://www.visualserver.com" target="_blank" style="text-decoration:none" class="copyright">Nick Brandt &#8482;</a>
			</div>
		</div> <!--- onload="VStbdrawer.initialize()" --->
		<div id="pop"  style="z-index:999;">
			<div id="scroller" style="left: 0">
			<!--- RR --->
			<cfset qTextPage.recordCount= 0>
			<cfset qTextPage.publish = 0>
				<cfif qTextPage.recordCount AND qTextPage.publish >
					<span style="width: 75px;">
						<img src="templates/10/images/text_page.gif" width="60" height="75" border="1" borderColor="000000"/>
					</span>
				</cfif>
				<cfset qImages = qShowcaseGalleryIndividualPhotos>
		
				<cfloop query="qImages">
					<span style="width:75px">
						<cfset caller.returnedImgWidth = "75">
						<cfset caller.returnedImgHeight = "75">
						<cfset attributes.insertSize = 1>
						<!--- width="#caller.returnedImgWidth#"  --->
						<cfoutput><img <cfif attributes.insertSize>height="#caller.returnedImgHeight#"</cfif> src="http://www.visualserver.com/artists/#qShowcaseArtist.Subdirectory#/#qShowcasePortfolio.subdirectory#/images_large/image#Imagenumber#.jpg">
						
					<!---	#attributes.imagePath#/#attributes.Container#/#attributes.CustNumber#/#attributes.bin#/#attributes.ImageID#_#attributes.SizeID#.jpg" border="#attributes.border#" alt="#attributes.Title#" style="border-color:###attributes.borderColor#">---></cfoutput>
						
						<!--- <cfmodule template="../../Includes/act_Image_Display.cfm" 
								CustNumber="#qWebsite.CustNumber#" 
								ImageID="#qImages.imageID#" 
								SizeID="thumb" 
								Title="#qImages.Title#"
								Bin="#qImages.Bin#"
								Container="#qImages.Container#"
								Border="1"
								BorderColor="000000"
								insertSize="false"> --->
								
					</span>
				</cfloop>
				<!--- <cfloop query="qImages">
						<span style="width:75px">
							<cfmodule template="../../Includes/act_Image_Display.cfm" 
									CustNumber="#qWebsite.CustNumber#" 
									ImageID="#qImages.imageID#" 
									SizeID="extralarge" 
									Title="#qImages.Title#"
									Bin="#qImages.Bin#"
									Container="#qImages.Container#"
									Border="1"
									BorderColor="000000">
						</span>
					</cfloop> --->
			</div>
		</div>
	</div>
	


	
	<div id="breatherContainer" style="position:absolute;bottom:0;text-align:center;z-index:998;">
		<div id="leftSpace" style="width:43.2%;float:left;">&nbsp;</div>
		<div id="breather" style="width:13.2%;float:left;text-align:center;padding-bottom:22px;">
			<img src="<cfoutput>#request.templatelocal#</cfoutput>templates/10/images/breather.gif" />
		</div>
		<div id="copyright" style="width:43.2%;float:left;">&nbsp;</div>
		<!---
<div id="copyright" style="width:43.2%;float:left;text-align:right;padding-bottom:30px;" class="copyright"><cfoutput>&copy; #dateFormat(now(),"yyyy")# <a href="index.cfm<cfif url.pM>?pM=#url.pM#</cfif>" class="copyright">#qUser.FirstName# #qUser.LastName#</a>. All Rights Reserved. </cfoutput>Powered by <a href="http://www.visualserver.com" target="_blank" style="text-decoration:none" class="copyright">VisualServer&#8482;</a>
		</div>
--->

	</div>		

<!--- End thumbnail drawer --->

</div>
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
<!---  --->
<div id="detailBin" style="display:none;">
	<cfif qTextPage.recordCount AND qTextPage.publish >
		<span> %%%<br /><br />  </span>
	</cfif>	
	
	<!--- <cfdump var ="#qImages#"> <cfabort> --->
	<cfoutput>
	<cfloop query="qImages">
		<!--- Get image currently being displayed--->
		
		 <img <cfif attributes.insertSize>width="#caller.returnedImgWidth#" height="#caller.returnedImgHeight#"</cfif> src="http://www.visualserver.com/artists/#qShowcaseArtist.Subdirectory#/#qShowcasePortfolio.subdirectory#/images_large/image#url.i#.jpg"> 


		<!--- <cfmodule template="../../Includes/qry_PortfolioImage.cfm" imageID="#qImages.ImageID#" portfolioID="#url.nk#"> --->
		
		
		
		<!--- Get current portfolio defaults --->
		<!--- <cfmodule template="../../Includes/act_PortfolioDefaults.cfm" 
			portfolioID="#url.nk#" 
			imgQry="#qImage#" 
			websiteID="#qWebsite.websiteID#"
			dimensions="#qWebsite.dimensions#"
		> --->
		
		<!--- RR this is  the overlay info --->
				<!--- <cfsavecontent variable="detailtext"> --->
					<span><cfinclude template="act_image_details.cfm" /></span>
				<!--- </cfsavecontent> --->
			<!--- How does it only show the title portion beneath the image? --->		
			 
			
	</cfloop> 
	</cfoutput>
</div>

<div id="imageBin" style="display:none;">
	<cfif qTextPage.recordCount AND qTextPage.publish >
		<span>nill</span>
	</cfif>	
	<cfoutput query="qImages">
		<span>#qImages.ImageNumber#</span>
		<!--- <span>#qImages.ImageID#</span> --->
	</cfoutput> 	
</div>
<!--- End hidden detail bin --->

<div id="debug" style="display:none;position:fixed;top:10px;left:10px;background:white;padding:20px;border:1px solid #333; color: #333;"><div id="debugA"></div><div id="debugB"></div></div>

<!--- Start thumbnailDrawer launch code --->
<!--[if IE 8]>
<div id="IE8detected" style="display:none;"></div>
<![endif]-->
<cfif CGI.HTTP_USER_AGENT CONTAINS "safari">
	<div id="SafariDetected" style="display:none;"></div>
</cfif>
<cfif IsDefined('qWebsite.thumbnail_drawer_scroll_speed') AND qWebsite.thumbnail_drawer_scroll_speed GT 0 AND qWebsite.thumbnail_drawer_scroll_speed LTE 10>
	<cfset scroll_speed = qWebsite.thumbnail_drawer_scroll_speed />
<cfelse>
	<cfset scroll_speed = 10 />
</cfif>
<script type="text/javascript">
<cfif beingCaptured>

//	$('allContents').show();
//	$('sivDisplay').setStyle({ width:'<cfoutput>#initialImageWidth#</cfoutput>px' }).show();
//	$('scroller').setStyle({ textAlign: 'center' });

<cfelse>

	// launch the thumbnail drawer
	document.observe('dom:loaded', function () { if(!Prototype.Browser.IE) $('allContents').hide(); });
	window.onload = function(){
		 $('allContents').show();
		VStbdrawer = new thumbDrawer(<cfoutput>#scroll_speed#</cfoutput>);
	<cfif CGI.USER_AGENT CONTAINS 'mobile'>
		VStbdrawer.getCords = function(e){
	//		this.runDebugger();
			this.mouseX = Event.pointerX(e);
			this.mouseY = Event.pointerY(e);
	//		this.runDebugger(document.viewport.getHeight());
			if(this.mouseY > this.screenHeight-this.popZone){
				if(!this.drawerOpen && !this.moving){
					this.toggleDrawer();
				}
			}
			else{
				if(this.drawerOpen && !this.moving){
					this.toggleDrawer();
				}
			}
		};
		VStbdrawer.scrollThumbs = function(direction) {
			var moveto = (direction == 'left') ? (this.pop.getWidth()*0.8)-((this.pop.getWidth()*0.8)*2) : this.pop.getWidth()*0.8;
			if (direction == 'left' && parseInt(this.scroller.style.left) > (this.widthDifference-(this.widthDifference*2)) || direction == 'right' && parseInt(this.scroller.style.left) < 0){
				new Effect.Move(this.scroller, { 
					x: moveto,
					y: 0,
					mode: 'relative',
					duration: .5,
					fps: 20,
					delay: 0,
					transition: Effect.Transitions.sinoidal,
				});
			}
		}
		swipeTimer = null;
		j$('#contentContainer').swipe({
			swipeLeft: function() { clearTimeout(swipeTimer); swipeTimer = setTimeout(function(){ VStbdrawer.changeImage('prev')},2) },
			swipeRight: function() { clearTimeout(swipeTimer); swipeTimer = setTimeout(function(){ VStbdrawer.changeImage('next')},2) }
		});
		j$('#pop').swipe({
			swipeLeft: function() { 
				clearTimeout(swipeTimer); 
				swipeTimer = setTimeout(function(){
					VStbdrawer.scrollThumbs('left');
				},2); },
			swipeRight: function() { 
				clearTimeout(swipeTimer); 
				swipeTimer = setTimeout(function(){
					VStbdrawer.scrollThumbs('right');
				},2); }
		});
	</cfif>
	}

	<!--- <cfinclude template="js_menu_hacks.cfm" />	 ---->
	
</cfif>
</script>

<!--- End thumbnailDrawer launch code --->
</cfif> <cfabort>