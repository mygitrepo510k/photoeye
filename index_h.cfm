<cfset xBookaWeek="ZE266">

<!---
<cfif #HTTP_USER_AGENT# CONTAINS "MSIE">
	<cflocation url="index_ie.cfm">
</cfif>
--->


<!--- Set the holiday wreath on or off --->
<cfset xHoliday = 1>

<cfif xHoliday is 1>
	<cfset photoeye_logo = '/images/photoeye_logo_magazine_h.png'>
	<cfset bookstore_logo = '/images/photoeye_logo_bookstore_h.png'>
	<cfset editions_logo = '/images/photoeye_logo_magazine_h.png'>
	<cfset gallery_logo = '/images/photoeye_logo_gallery_h.png'>
	<cfset magazine_logo = '/images/photoeye_logo_magazine_h.png'>
	<cfset guide_logo = '/images/photoeye_logo_guide_h.png'>	
	<cfset visualserver_logo = '/images/photoeye_logo_visualserver_h.png'>	
	<cfset auctions_logo = '/images/photoeye_logo_auctions_h.png'>
<cfelse>
	<cfset photoeye_logo = '/images/photoeye_logo_magazine.png'>
	<cfset bookstore_logo = '/images/photoeye_logo_bookstore.png'>
	<cfset editions_logo = '/images/photoeye_logo_magazine.png'>
	<cfset gallery_logo = '/images/photoeye_logo_gallery.png'>
	<cfset magazine_logo = '/images/photoeye_logo_magazine.png'>
	<cfset guide_logo = '/images/photoeye_logo_guide.png'>	
	<cfset visualserver_logo = '/images/photoeye_logo_visualserver.png'>	
	<cfset auctions_logo = '/images/photoeye_logo_auctions.png'>
</cfif>

<!--- if coming from the InternationalPhotographerIndex.com --->

<cfswitch expression = "#HTTP_HOST#">
   <cfcase value = "www.internationalphotographerindex.com">
      <cflocation url="www.photoeye.com/ipi/index.cfm">
      <cfabort>
   </cfcase>  
   
   <cfcase value = "www.internationalphotoindex.com">
      <cflocation url="www.photoeye.com/ipi/index.cfm">
      <cfabort>
   </cfcase>  
   
   
    <cfcase value = "www.iphotographerindex.com">
      <cflocation url="www.photoeye.com/ipi/index.cfm">
      <cfabort>
   </cfcase> 
   
</cfswitch>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<META NAME="DESCRIPTION" CONTENT="The world's foremost online photography bookstore featuring over 35,000 fine-art photography books, secure ordering, a powerful keyword full-text search engine, new arrivals, bestsellers, out-of-print, title index, new arrivals, book auctions, and BookTeases (tm), and photo-eye magazine, which is devoted to the photography book arts. Our galleries include Photographer's Showcase, Magnum Photos Collectors' Prints, photo-eye Gallery of Represented Artists">
<META NAME="KEYWORDS" CONTENT="photography bookstore photo-eye photoeye photography photo book books bookstore book store gallery art nudes erotic out-of-print out of print op o.p. Julie Blackmon  Nick Brandt -jock sturges sally mann ted kuykendall  james ware pitts mark klett terri weifenbach david gibson edward ranney Photographer's Showcase, Magnum Photos Collectors' Prints, photo-eye Gallery of Represented Artists">
<meta name="google-site-verification" content="Wy9HPyNXwsYX2yt-8dSf1DXWrQfEd5onyL8OMP9xamo" />
    <TITLE>
        photo-eye | Photography Magazine, Photo Bookstore, Photography Gallery, Rare Photobook Auctions, USA Photo Guide, VisualServer Websites for Photographers
    </TITLE>
    
<!-- The following code and the entire photoeye.com website Copyright (c) Rixon G. Reed,  <CFOUTPUT>#year(Now())#</CFOUTPUT>, All Rights Reserved. -->

<!-- Images Copyright (c) Individual Photographer, <CFOUTPUT>#year(Now())#</cfoutput>, All Rights Reserved. -->


<script language="javascript" type="text/javascript">
<!---
function swapbglogo(towhat){
	bglogo = document.getElementById("BG");
	if (towhat == "bookstore"){
		bglogo.style.background = "url(#photoeye_logo#) no-repeat center" ;
	}
	else {
		if (towhat == "auctions"){
			bglogo.style.background = "url(#auctions_logo#) no-repeat center" ;	
		}
		else {
			if (towhat == "magazine"){
				bglogo.style.background = "url(#magazine_logo#) no-repeat center" ;				
			}
			bglogo.style.background = "url(#photoeye_logo#) no-repeat center" ;
		}	
	}	
}
--->
function swapbglogo(towhat){
	bglogo = document.getElementById("BG");
	if (towhat == "back"){
		<cfif xHoliday is 1>
			bglogo.style.background = "url(images/magazine_logo_h.png) no-repeat center" ;
		<cfelse>
			bglogo.style.background = "url(images/magazine_logo.png) no-repeat center" ;
		</cfif>
	}
	else {
	newbgpatha = "url(images/photoeye_logo_";
	<cfif xHoliday is 1>
		newbgpathb = "_h.png) no-repeat center";
	<cfelse>
		newbgpathb = ".png) no-repeat center";
	</cfif>
	newbgpath = (newbgpatha + towhat)+ newbgpathb;
	bglogo.style.background = newbgpath;
	}
}
</script>

<SCRIPT language="JavaScript">
<!--
if ((screen.width>=1024) && (screen.height>=768))
{ <cfset xTopMargin="34">
 ;
}

//-->
</SCRIPT>


<link rel="stylesheet" type="text/css" href="global/css/global.css" />
<link rel="stylesheet" type="text/css" href="css/homepagev3.css" />
<link rel="SHORTCUT ICON" href="http://www.photoeye.com/favicon.ico" type="image/x-icon">
<script type="text/javascript" src="global/spry/SpryTooltip.js"></script>
</head>

<cfparam name="session.bh_width" default="">
<CFSET xBGColor="000000">
<CFSET xPageTitle = "photo-eye">
<cfparam name="xTopMargin" default="10">


<!---Photo-Eye Dynamic Software--->
<!---Written by Rixon G. Reed--->

<!--- Load Balancer Work Around 1.21.09 --->
<cfset http_host="#CGI.X_FORWARDED_FOR#">
<!--- <cfoutput>#cgi.server_name# #cgi.path_info# #cgi.script_name#</cfoutput> --->

<CFIF IsDefined("HTTP_HOST")>
	<cfswitch expression = "#HTTP_HOST#">
	   <cfcase value = "www.photo-eye.com">
	      <cflocation url="http://www.photoeye.com">
	   </cfcase>
    <cfcase value = "www.penttisammallahti.com">
      <cflocation url="http://www.photoeye.com/gallery/forms2/homepage.cfm?id=68149&image=1&imagePosition=1&Door=2&Portfolio=Portfolio1&Gallery=2&CFID=11754189&CFTOKEN=99461420">
   </cfcase>
	</cfswitch>
</CFIF>
<!---
<cfparam name="url.debug376" default=0>
<cfif url.debug376 IS 0>
   <cflocation url="http://www.photoeye.com/bookstore">
</cfif>
--->

<!--- Stats --->
<CFINCLUDE TEMPLATE="/stats_include.cfm">
<!--- END: Stats --->

<!-----------------DO NOT ERASE THIS!!!!!!!!!!!!--------------->		
<CFIF ParameterExists(URL.PID)>
    <CFCOOKIE NAME="CJ_PID" VALUE="#URL.PID#">
    <CFCOOKIE NAME="CJ_AID" VALUE="#URL.AID#">
</CFIF>

<!-----------------DO NOT ERASE THIS!!!!!!!!!!!!--------------->    


<!--- get the custnumber of the most recent show--->
<CFQUERY NAME="qGetPortfolio" DATASOURCE="photoeyecom">
	SELECT DISTINCT 
	top 1 G.custnumber, P.ExhibitionOpened, I.PortfolioName 
	FROM GallerySetup G 
	INNER JOIN GalleryPortfolio P ON G.Custnumber = P.Custnumber 
	INNER JOIN GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
	WHERE (P.ImgQty > 0)and (I.ShowcaseOK = 1) and i.notavailable <> 4 AND (P.ShowcaseOK = 1) and I.ImagePosition > 0 and p.custnumber<>185363
	order by P.ExhibitionOpened desc
</CFQUERY> <!--- not nick brandt --->


<!--- count the number of images in the portfolio that are shown--->
<!--- <CFQUERY NAME="qGetPortfolioImageCount" DATASOURCE="photoeyecom">
	SELECT DISTINCT 
	count(i.imageposition) as xqty
	FROM GalleryIndividualPhotos I
	WHERE (I.ShowcaseOK = 1) and i.notavailable <> 4 and I.ImagePosition > 0 and i.custnumber=#qGetPortfolio.custnumber# and PortfolioName = '#qGetPortfolio.PortfolioName#'
</CFQUERY> --->


<!--- <CFSET ImageNumber = 1>    
<CFSET ImagePosition = 1>    
<CFSET FirstTime = 1>    
<CFSET rowcount =1 >    
<CFSET imgbeginType1=RAND()>
<cfset xImgPosition=RANDRANGE(1,#qGetPortfolioImageCount.xqty#)> --->

<!--- get a random photo from the show that opened most recently --->
<CFQUERY NAME="qGetPhoto" DATASOURCE="photoeyecom">
	SELECT DISTINCT 
	TOP 1 G.Subdirectory AS SubDirectory, G.FirstName AS Firstname, P.ImgQty AS ImageQTy, G.LastName AS Lastname, G.Gallery AS Gallery, G.Custnumber AS Custnumber, P.SubDirectory AS Portfolio, D.GeneralRandomNo, CONVERT(char(20), P.ExhibitionOpened, 102) AS Opened, I.ImageNumber AS Imagenumber, I.ShowcaseOK, I.ImagePosition AS IMAGEPOSITION, D.PortfolioName as xPortfolio, I.Title as Title, NewID() as RandomOrder
	FROM GallerySetup G 
	INNER JOIN GalleryPortfolio P ON G.Custnumber = P.Custnumber 
	INNER JOIN GalleryDefaultPhotos D ON P.Custnumber = D.Custnumber 
	INNER JOIN GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
	WHERE (P.ImgQty > 0) and (I.ShowcaseOK = 1) and i.notavailable <> 4 AND (P.ShowcaseOK = 1) and g.custnumber=#qGetPortfolio.Custnumber# 
	ORDER BY Opened desc, RandomOrder
</CFQUERY> <!--- and P.SubDirectory = 'Portfolio1' --->



<!--- 
<!--- if there are no shows that opened in the last week, pick the most recent show to show --->
<CFIF qGetPhoto.recordcount is 0> 
	<CFQUERY NAME="qGetPhoto" DATASOURCE="photoeyecom">
		SELECT DISTINCT 
		TOP 1 G.Subdirectory AS SubDirectory, G.FirstName AS Firstname, P.ImgQty AS ImageQTy, G.LastName AS Lastname, G.Gallery AS Gallery, G.Custnumber AS Custnumber, P.SubDirectory AS Portfolio, D.GeneralRandomNo, CONVERT(char(20), P.ExhibitionOpened, 102) AS Expr1, I.ImageNumber AS Imagenumber, I.ShowcaseOK, I.ImagePosition AS IMAGEPOSITION, D.PortfolioName as xPortfolio, I.Title as Title, NewID() as RandomOrder
		FROM GallerySetup G 
		INNER JOIN GalleryPortfolio P ON G.Custnumber = P.Custnumber 
		INNER JOIN GalleryDefaultPhotos D ON P.Custnumber = D.Custnumber 
		INNER JOIN GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
		WHERE (P.ImgQty > 0) AND (I.ImagePosition = #xImgPosition#) and (I.ShowcaseOK = 1) and i.notavailable <> 4  AND (P.ShowcaseOK = 1) 
		ORDER BY  Expr1 desc, RandomOrder
	</CFQUERY>
</CFIF>--->



	
	
<CFSET xGalleryIs = qGetPhoto.Gallery>
<CFSET xSubdirectory = qGetPhoto.Subdirectory>
<CFSET xPortfolio = '#qGetPhoto.portfolio#'> 
<!--- qGetPhoto.Portfolio --->
<CFSET xImageNumber = qGetPhoto.ImageNumber>
<CFSET xFirstName = qGetPhoto.Firstname>
<CFSET xLastName = qGetPhoto.Lastname>



<CFSET ArtistGallery =''>		
<CFIF UCASE(qGetPhoto.Gallery) is 'REPRESENTEDARTISTS'>	    
    <CFSET ArtistGallery = 'photo-eye Santa Fe - Represented Artist'>	    
    <CFSET xGallery=1>	
<CFELSEIF UCASE(qGetPhoto.Gallery) is 'PHOTOSHOWCASE'>	    
    <CFSET ArtistGallery = "Photographer's Showcase Artist">	    
    <CFSET xGallery=2>	
<CFELSEIF UCASE(qGetPhoto.Gallery) is 'MAGNUMARTISTS'>	    
    <CFSET ArtistGallery = 'Magnum Photos Artist'>	    
    <CFSET xGallery=3>
<CFELSE>
    <CFSET xGallery=0>
</CFIF>
		
<!--- Panorama? --->
<CFQUERY NAME="qGetPanorama"  DATASOURCE="photoeyecom">
 	SELECT Panorama
	FROM GalleryPortfolio 
	WHERE Custnumber = #qGetPhoto.Custnumber# 
	AND SubDirectory = '#xPortfolio#'
</CFQUERY> 

<CFIF qGetPanorama.Panorama is 1>
	<CFSET xPan = 1>
<CFELSE>	
	<CFSET xPan = 0>
</CFIF>
	
<!--- Randomly select a live Auction Item to Show --->
<!--- DE 01.28.09, added the loop to make sure the auction has an image to show, if not then select another one --->
<cfset auctionHasImage = 0>


<cfloop condition="auctionHasImage EQ 0">
	<CFQUERY NAME="qGetAuctionAdmin"  DATASOURCE="photoeyecom">
		SELECT *
		FROM AuctionAdmin
		<cfif application.xdev is 0>
			WHERE EndAnnounced = 0 AND Publish=1 and AuctionID <> 6
		<cfelse>
			WHERE AUCTIONID=4000
		</cfif>		
		
	</CFQUERY>
		
		
	<CFIF qGetAuctionAdmin.RecordCount is 0>
		<CFQUERY NAME="qGetAuctionAdmin"  DATASOURCE="photoeyecom">
			SELECT TOP 1 *
			FROM AuctionAdmin
			WHERE EndAnnounced = 1 AND Publish=1 AND AuctionID <> 6
			ORDER BY TimeEnd DESC
		</CFQUERY>
	</CFIF>
	<CFIF qGetAuctionAdmin.RecordCount gt 0>
		<CFSET xRandomItem =  DatePart("s", Now()) MOD qGetAuctionAdmin.RecordCount>
		<CFSET xCount = 0>
		<CFLOOP QUERY="qGetAuctionAdmin">
			<CFIF xCount is xRandomItem>
				<CFSET xAuctionID = qGetAuctionAdmin.AuctionID>
				<CFSET xAuctionTitle = qGetAuctionAdmin.Title>
				<CFSET xAuctionOpeningBid = qGetAuctionAdmin.OpeningBid>
				<!--- Auction Time Remaining --->
				<CFINCLUDE TEMPLATE="/auctions/AuctionTime.cfm">
				<CFBREAK>
			</CFIF>
			<CFSET xCount = xCount +1>
		</CFLOOP>
		
		<CFQUERY NAME="qGetAuctionBids"  DATASOURCE="photoeyecom">
		 	SELECT *
	  		FROM AuctionBids
			WHERE AuctionID = #xAuctionID#
			ORDER BY Bid DESC
		</CFQUERY>
	</CFIF>
	
	<cfif fileExists(expandPath("/auctions/img/#xAuctionID#/Large.jpg"))>
		<cfset auctionHasImage = 1>
	</cfif>
	
</cfloop>


<CFOUTPUT>
<body>

<!---<A HREF="javascript:alert('Your resolution is '+screen.width+'x'+screen.height);">
Click for your screen resolution</A>
#xTopMargin#--->
<CFQUERY NAME="qNumberToShow" DATASOURCE="photoeyecom">
			SELECT ShowOnFrontPage
			FROM Bookstore_Sections 
			WHERE SectionID = 1
		</CFQUERY>

		<!--- Make sure there is a record found below --->
		<!--- 6/24/04 We were getting an occasional error stating that qrandom.catalog was not defined --->
		<cfset xrecordfound = 0>

<!--- 03/02/2005 RR Took out requirement for book to be in stock --->
<!--- AND (s.Units - s.QtyReserved > 0) --->
<!--- RR 20080628 --->
<!--- Took out loop condition If there are no published NewArrivals, then it would crash as the loop condition would never change --->
<!---	<cfloop condition="xrecordfound is 0">
--->		
		<!--- Prevents site from crashing if 0 is accidently entered --->
		<cfif qNumberToShow.ShowOnFrontPage LTE 0>
				<cfset qNumberToShow.ShowOnFrontPage= 5>
		</cfif>
		
		<cfif application.xdev is 0>
		
		<!--- Randomized from New Arrivals --->	
			<CFQUERY NAME="qRandom" DATASOURCE="photoeyecom">
			SELECT Top 1 CatNumber as Catalog, SectionID, Publish
			FROM Bookstore_TopX x INNER JOIN Stock s ON x.CatNumber = substring(s.Number, 1, 5)
			WHERE  substring(catnumber,1,5) = 'ZE114'
			</CFQUERY> 
			
			<!--- Book of the Week --->
		<CFQUERY NAME="qRandom" DATASOURCE="photoeyecom">
			SELECT top 1 substring(number,1,5) as catalog
			from Stock
			WHERE  substring(number,1,5) = '#xBookaWeek#'
		</CFQUERY> 
		
		<!--- Regular Version --->
			
		<!--- <CFQUERY NAME="qRandom" DATASOURCE="photoeyecom">
			SELECT Top 1 CatNumber as Catalog, SectionID, Publish
			FROM Bookstore_TopX x INNER JOIN Stock s ON x.CatNumber = substring(s.Number, 1, 5)
			WHERE SectionID = 1  
			AND Publish = 1
			ORDER BY newid()
		</CFQUERY> --->
		
		

		
		<cfelse>
		
				<!--- For Auckland book --->	
	<!---		<CFQUERY NAME="qRandom" DATASOURCE="photoeyecom">
			SELECT Top 1 CatNumber as Catalog, SectionID, Publish
			FROM Bookstore_TopX x INNER JOIN Stock s ON x.CatNumber = substring(s.Number, 1, 5)
			WHERE  substring(catnumber,1,5) = 'ZE114'
			</CFQUERY> --->
			
						<!--- Book of the Week --->
		<CFQUERY NAME="qRandom" DATASOURCE="photoeyecom">
			SELECT top 1 substring(number,1,5) as catalog
			from Stock
			WHERE  substring(number,1,5) = '#xBookaWeek#'
		</CFQUERY>
		
			<!--- Regular Version --->
		
		<!---	<CFQUERY NAME="qRandom" DATASOURCE="photoeyecom">
			SELECT Top 1 CatNumber as Catalog, SectionID, Publish
			FROM Bookstore_TopX x INNER JOIN Stock s ON x.CatNumber = substring(s.Number, 1, 5)
			WHERE SectionID = 1  
			AND placement<=#qNumberToShow.ShowOnFrontPage#
			AND Publish = 1 and Substring(catnumber,1,5)='DQ390' 

		</CFQUERY>--->
		

			
		
		</cfif>
		
		<cfif qRandom.recordcount>
			<cfset xrecordfound = 1>
		</cfif>
<!---	</cfloop>
--->


	<!---<CFSET xRecordToPull = Int(Rand()*qRandom.RecordCount) + 1>--->
<!--- RR added 20080628 to prevent site from crashing --->
<cfif xrecordfound is 1>

	<CFQUERY NAME="qItem" DATASOURCE="photoeyecom">
		SELECT *
		FROM Inventory
		WHERE Catalog = '#qRandom.Catalog#'
	</CFQUERY>
	
	<CFSET xItemTitle = trim(qItem.Title2x)>
	<CFSET xItemAuthor = trim(qItem.Subject)>
		 
	<!--- ImageSizer --->
<!--- 	<cfset xheight=180>
	<cfset xwidth=180> --->
		<cfset xheight=150>
	<cfset xwidth=150>
	<CFSET xPath = "/img/bigillus">
	<cfset xImage = "#qRandom.Catalog#b.jpg">
	<cfset xAlt = "Enter Bookstore">
	
	<cfmodule template="#application.imageSizer#" xAddName = "frontpage">
</cfif>
<!--[if IE]>  
<div id="IEroot">  
<![endif]-->
<div class="Home_Contain_All" id="BG" style="background: url(#photoeye_logo#) no-repeat center;margin-top:<!--- this is the distance from the top of the bookstore item, to the bottom of the browser window --->#xTopMargin#px ;">


	<div class="Home_Container" id="HC1">
		<!--- Editions --->
		<div class="Home_Division" id="editions">
			<!---<!--- onmouseout="swapbglogo('back')" ---> --->>
				<a href="editions/" onmouseover="swapbglogo('magazine')"<!---<!--- onmouseout="swapbglogo('back')" ---> --->>
				<div class="Home_Name">Editions</div>
				<img src="images/home_editions.jpg" height="107" width="150"/>
			</a>
		</div>
		<!--- Bookstore --->
		<div class="Home_Division" id="bookstore">
			<!--- onmouseout="swapbglogo('back')" --->>
			<!--- For Auckland --->
			<a href="bookstore/index.cfm" onmouseover="swapbglogo('bookstore')"<!--- onmouseout="swapbglogo('back')" --->> 
			<!--- Regular Version --->
			<!--- <a href="bookstore/index.cfm?catalog=#qRandom.Catalog#" onmouseover="swapbglogo('bookstore')"<!--- onmouseout="swapbglogo('back')" --->> --->
			<div class="Home_Name">Bookstore</div>
<!--- RR added 20080628 to prevent site from crashing --->
<cfif xrecordfound is 1>
				#returnedImage#</a>
</cfif>
		</div>				


		<!--- Gallery --->
		<div class="Home_Division" id="gallery">
			<!--- onmouseout="swapbglogo('back')" --->>
				x<a href="gallery/" onmouseover="swapbglogo('gallery')"<!--- onmouseout="swapbglogo('back')" --->>
				<div class="Home_Name">Gallery</div>
				<cfset xheight=150>
				<cfset xwidth=150>
				<cfset xImageAddress="#application.xRelativePath#\Artists\#xSubdirectory#\#xPortfolio#\Images_Large\">
				<cfset xPath=''>
				<cfset xAlt = "Enter Gallery. Image &copy; #xFirstname# #xLastname#">
				<cfset xImage = "Image#qGetPhoto.ImageNumber#.jpg">
				<cfoutput> #application.imageSizer#</cfoutput>
		
				<cfmodule template="#application.imageSizer#" xAddName = "frontpage">
				#returnedImage#<!--- End Imagesizer --->
			</a>
		</div>
	</div>

	<div class="Home_Container" id="HC2">
	<!--- Auctions --->
			<!--- Image Sizer --->
		<cfif fileExists(expandPath("/auctions/img/#xAuctionID#/Large.jpg"))>  
			<cfset xwidth=150>
			<cfset xheight=150>
			<cfset xImage = "Large.jpg">
			<CFSET xPath = "/auctions/img/#xAuctionID#/">
			<cfset xAlt = "Enter Auctions">			
			<cfmodule template="#application.imageSizer#" xAddName = "frontpage">
			</cfif>
		<div class="Home_Division" id="auctions">
			<!--- onmouseout="swapbglogo('back')" --->>
				<a href="auctions/" onmouseover="swapbglogo('auctions')"<!--- onmouseout="swapbglogo('back')" --->>
				<div class="Home_Name">Auctions</div>
				#returnedImage#
			</a>
		</div>
		<input type="hidden" name="test" value="/auctions/img/#xAuctionID#/Large.jpg"></input>
			<!--- VisualServer --->
		<div class="Home_Division" id="visualserver">
			<!--- onmouseout="swapbglogo('back')" --->>
				<a href="visualserver/" onmouseover="swapbglogo('visualserver')"<!--- onmouseout="swapbglogo('back')" --->>
				<div class="Home_Name">Visualserver</div>
				<img src="images/home_visualserver.jpg" width="150" height="122"/>
			</a>
		</div>
			<!--- Guide --->
		<div class="Home_Division" id="guide">
			<!--- onmouseout="swapbglogo('back')" --->>
				<a href="http://www.photoeye.com/guide/" onmouseover="swapbglogo('guide')"<!--- onmouseout="swapbglogo('back')" --->>
				<div class="Home_Name">USA Photo Guide</div>
				<img src="images/home_guide.jpg" width="150" height="122" />
			</a>
		</div>
		<!--- Magazine --->
		<div class="Home_Division" id="magazine">
			<!---<!--- onmouseout="swapbglogo('back')" ---> --->>
				<a href="magazine/" onmouseover="swapbglogo('magazine')"<!---<!--- onmouseout="swapbglogo('back')" ---> --->>
				<div class="Home_Name">Magazine</div>
				<!--- mg_review.jpg is automatically recreated by the magazine_admin each time a review is published --->
				<cfimage action="info" source="#ExpandPath('images/mg_review.jpg')#" structname="mg_info" />
				<img src="images/mg_review.jpg" width="#mg_info.width#" height="#mg_info.height#"/> <!---  width="#mg_info.width#" height="#mg_info.height#" --->
			</a>
		</div>
			
	</div>
	
</div>
</cfoutput>
<div style="width: 900px; clear: both; margin: 25px auto;">
	<form name="ccoptin" action="http://visitor.constantcontact.com/d.jsp" target="_blank" method="post" style="margin-bottom:3;">
	<a href="/magazine" target="_blank"><font class="Home_Name" style="color:#cc3300;">READ OUR MAGAZINE</FONT></a> &nbsp;&nbsp; <font class="Home_Name" style="color:#333;">Sign up for our Email Newsletters: </font>
<input type="text" name="ea" size="30" value="" style="font-family:Verdana,Geneva,Arial,Helvetica,sans-serif; font-size:10px; border:1px solid #999999;">
<input type="submit" name="go" value="GO" class="submit"  style="font-family:Verdana,Arial,Helvetica,sans-serif; font-size:10px;">
<input type="hidden" name="m" value="1102398773183">
<input type="hidden" name="p" value="oi">

&nbsp; &nbsp; <a href="http://blog.photoeye.com" target="_blank"><font class="Home_Name" style="color:#cc3300;">READ OUR BLOG</FONT></a></form>
</div>
<cfoutput>
<div id="imagepreloader">
	<img src="#bookstore_logo#" />
	<img src="#gallery_logo#" />
	<img src="#magazine_logo#" />
	<img src="#guide_logo#" />
	<img src="#visualserver_logo#" />
	<img src="#auctions_logo#" />
	<img src="global/images/bgdropshadowlogo.jpg" />
</div>
<div class="TodaysBS_Tip" id="visualserver_TT"><a href="visualserver/" style="color:white;">
			A complete website solution for easy creation and management of online portfolios.
			</a>
</div>
<div class="TodaysBS_Tip" id="guide_TT"><a href="guide/" style="color:white;">
			A comprehensive guide to US Galleries, Museums, Grants, Photographers and more.
			</a>
</div>
<div class="TodaysBS_Tip" id="editions_TT"><a href="editions/" style="color:white;">
			exquisite limited edition books and portfolios of contemporary photography.
			</a>
</div>
<div class="TodaysBS_Tip" id="magazine_TT"><a href="magazine/" style="color:white;">
			a free online magazine dedicated to photography books with reviews, essays, features, blogs and more.
			</a>
</div>
<div class="TodaysBS_Tip" id="bookstore_TT"><a href="bookstore/" style="color:white;">
			our renown online bookstore with 30,000+ titles listed including esoteric publications, signed books, limited editions and more.
			</a>
</div>
<div class="TodaysBS_Tip" id="gallery_TT"><a href="gallery/" style="color:white;">
			online galleries include work from our Santa Fe location, the Photographer's Showcase, Magnum Photos Collectors' Prints and more.
			</a>
</div>
<div class="TodaysBS_Tip" id="auctions_TT"><a href="auctions/" style="color:white;">
	Buy, sell, browse and research rare and collectible photobooks. Search thousands of past auction results!
			</a>
</div>




</CFOUTPUT><script type="text/javascript">

var static_tooltip1 = new Spry.Widget.Tooltip('visualserver_TT', '#visualserver', {closeOnTooltipLeave: true, hideDelay: 200, showDelay:750 });

var static_tooltip2 = new Spry.Widget.Tooltip('guide_TT', '#guide', {closeOnTooltipLeave: true, hideDelay: 200, showDelay:750 });

var static_tooltip2 = new Spry.Widget.Tooltip('editions_TT', '#editions', {closeOnTooltipLeave: true, hideDelay: 200, showDelay:750 });

var static_tooltip2 = new Spry.Widget.Tooltip('magazine_TT', '#magazine', {closeOnTooltipLeave: true, hideDelay: 200, showDelay:750 });

var static_tooltip2 = new Spry.Widget.Tooltip('bookstore_TT', '#bookstore', {closeOnTooltipLeave: true, hideDelay: 200, showDelay:750 });

var static_tooltip2 = new Spry.Widget.Tooltip('gallery_TT', '#gallery', {closeOnTooltipLeave: true, hideDelay: 200, showDelay:750 });

var static_tooltip2 = new Spry.Widget.Tooltip('auctions_TT', '#auctions', {closeOnTooltipLeave: true, hideDelay: 200, showDelay:750 });

</script>
<!--[if IE]>
</div>  
<![endif]-->
</body>
</html>
