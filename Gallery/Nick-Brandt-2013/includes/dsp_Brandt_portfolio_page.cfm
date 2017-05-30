
<!--- 
	
dsp_portfolio_page.cfm
------------------
02.23.2011 -- DE

--->


<!---
1. Preprocess
=========== --->



 <cfsilent> 
		
	<!--- Development stubs --->	

	<!--- initialize local variables, we add more to this later --->
	<cfset local = StructNew() />
	<cfset local.thumbRowWidth = 940 />
	<cfset local.hasArtistStatement = false />	
	<cfset local.hasProcessStatement = false />
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
	
	<cfif StructKeyExists(URL,'id') AND StructKeyExists(URL,'portfolio')>
		<cfset local.id = url.id />
		<cfset local.portfolioDirName = url.portfolio />
	<cfelse>
		<!--- TODO: error gracefully --->
		Not enough parameters
		<cfabort />
	</cfif>
	
	<!--- From popup bridge from photo-eye --->
	<CFIF IsDefined("form.RecordNo")>
		<CFSET xFromPopup =1>
	<CFELSE>
		<CFSET xFromPopup =0>
	</CFIF>
	
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
	 		<!--- AND showcaseok=1 or (portfolioName='Portfolio4' and custnumber=197467) --->
		ORDER BY IMAGEPOSITION <!--- ALPHAORDER ASC; --->
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
	
	<!--- Default to portfolio number if name is blank --->
	<cfset local.firstPortfolioName = trim(qGetPortfolioName.PortfolioName) />
	<cfif len(local.firstPortfolioName) LTE 0>
		<cfset local.firstPortfolioName = qGetShowcaseSetupInfo.PortfolioName />
	</cfif>
	
	<CFQUERY NAME="qGalleryStatements"  DATASOURCE="photoeyecom">
		SELECT *
		FROM GalleryArtistStatements
		WHERE CUSTNUMBER = <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#local.id#" maxLength="6" /> 
	</CFQUERY>

	<cfset local.hasPortfolioIntroduction = (len(trim(qShowcasePortfolio.PortfolioIntro)) GT 0) />
	<cfset local.hasMorePortfolios = (qCountPortfolios.recordcount GT 1) />

	<cfif len(trim(qGalleryStatements.statementA)) GT 0>
		<cfset local.hasArsitStatement = true />	
	</cfif>
	<cfif len(trim(qGalleryStatements.statementP)) GT 0>
		<cfset local.hasProcessStatement = true />
	</cfif>	

</cfsilent> 

<!---

2. Output
=========


--->



<cfoutput>

	<div class='portfolio_container'>
		<div class="info">
			<h1>	#UCASE(qShowcaseArtist.firstname)# #UCASE(qShowcaseArtist.lastname)#</h1>	

			<div class='navigation' style="margin-left:50px; width: 650px;">
				<ul>
					<cfif local.hasMorePortfolios>
						<li><a href="http://www.photoeye.com/nickbrandt" target="_blank">Previous Years' Portfolios</a><h1>&nbsp</h1></li>
					</cfif>
<!---					<li>
						<a href="javascript:popUp('/gallery/forms/bio.cfm?id=#local.id#','myWindowStatement',630,460);">Bio</a>
						<h1>&nbsp</h1>
					</li>
					<cfif local.hasArtistStatement>
						<li>
							<a href="javascript:popUp('/gallery/forms/statement_A.cfm?id=#local.id#','myWindowStatement',630,460);">Artist Statement</a>
							<h1>&nbsp</h1>
						</li>
					</cfif>
					<cfif local.hasProcessStatement>
						<li>
							<a href="javascript:popUp('/gallery/forms/statement_P.cfm?id=#local.id#','myWindowStatement',630,460);">Process Statement</a>
							<h1>&nbsp</h1>
						</li>
					</cfif>--->
					<li> 
					<!--- <a href="javascript:popUp('/gallery/forms/contact.cfm?id=#local.id#','myWindowStatement',630,460);"> --->
						<a href="mailto:Gallery@photoeye.com?subject=#qShowcaseArtist.firstname# #qShowcaseArtist.lastname# Inquiry">Inquire/Purchase Print</a>
						<h1>&nbsp</h1>
					</li>
				</ul>
			</div>
			
	 	<h2 style="padding-top:5px;">
				<!--- #local.firstPortfolioName# --->
				ACROSS THE RAVAGED LAND &mdash; PART 2
				<cfif local.hasPortfolioIntroduction>
					<span class='revealer'>Read introduction</span>
					<div class='revealee'>
						#qShowcasePortfolio.PortfolioIntro#
					</div>
				</cfif>
			</h2>	 	
		</div>
		
		<div class="portfolio">
			<cfset local.rw = 0 />
			<cfset aVSPath = "c:\inetpub\wwwroot\clients\visualservercom\html\">
			<cfloop query="qShowcaseGalleryIndividualPhotos">

				<!--- Image settings --->
				<cfset xheight=240>
				<cfset xwidth=500>
				<cfset xImageAddress="#aVSPath#\Artists\#qShowcaseArtist.Subdirectory#\#qShowcasePortfolio.subdirectory#\Images_Large\">
				<cfset xAlt = "Enter Gallery">
				<cfset xImageFormat = "jpg">
			
				<!--- Ensure images --->
				<cfset xImage = "Image#qShowcaseGalleryIndividualPhotos.imageNUMBER#">
				<cfset status('Checking image #qShowcaseGalleryIndividualPhotos.imageNUMBER#...', true) /> 
				<cfif NOT ListFindNoCase(qShowcaseGalleryIndividualPhotos.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")>
					 <cfset status(' Not in list, checking for file... ') />
					<!--- <cfif fileExists('#aVSPath#\artists\#qShowcaseArtist.Subdirectory#\#qShowcasePortfolio.subdirectory#\Images_Large\Image#qShowcaseGalleryIndividualPhotos.ImageNUMBER#_h240xw240.jpg')>
						<cfset status(' File exists...') />
					<cfelse>
						<cfset status(' File not found, generating...') />
						<cfinclude template="/templates/imagesizercreate.cfm">
					</cfif> --->
					<cfset status('updating db...') />
					<cfquery name="qUpdate"  datasource="photoeyecom">
						Update ArtistIndividualWorks
						Set ImageSizeList = '#ListAppend(qShowcaseGalleryIndividualPhotos.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")#'
						Where RecordNo = #qShowcaseGalleryIndividualPhotos.RecordNo#
					</cfquery>
					<cfset status('done.') />
				<cfelse>
					<cfset status('found, no action taken.') />
				</cfif> 

				<cfimage
				    action = "info"
				    source= "#aVSPath#\artists\#qShowcaseArtist.Subdirectory#\#qShowcasePortfolio.subdirectory#\Images_Large\Image#qShowcaseGalleryIndividualPhotos.ImageNUMBER#_h240xw500.jpg" 
				    structname = "imageinfo" />
				
				<cfset local.rw += (imageinfo.width+22) />
				
				<cfif local.rw GT local.thumbRowWidth>
					<div style="height: 1px; clear:both;">&nbsp;</div>
					<cfset local.rw = (imageinfo.width+22) />
				</cfif> 
				<!---  --->
				<cfset urlPosition = qShowcaseGalleryIndividualPhotos.ImagePosition-1>
				<div>
				<a href="enlargement.cfm?ip=#qShowcaseGalleryIndividualPhotos.alphaorder#&i=#qShowcaseGalleryIndividualPhotos.ImageNUMBER#&id=#qShowcaseArtist.custnumber#&pid=#qShowcasePortfolio.subdirectory####urlposition#">
					<img src = "http://www.visualserver.com/artists/#qShowcaseArtist.subdirectory#/#qShowcasePortfolio.subdirectory#/Images_Large/Image#qShowcaseGalleryIndividualPhotos.ImageNUMBER#_h240xw500.jpg" alt="#qShowcaseArtist.firstname# #qShowcaseArtist.lastname#: #qShowcaseGalleryIndividualPhotos.title#" width='#imageinfo.width#' height='#imageinfo.height#' />
				<br />
				#qShowcaseGalleryIndividualPhotos.Title#</a>
				
				
				</div>
			
			</cfloop> 
		</div>
	</div>
<!--- 	#local.imageGeneratorReport# --->
</cfoutput>
