<!---  <cfif isdefined("All") is false>
	<cfset All=0>
</cfif>  --->

<cfparam name="qShowcaseMultiplePortfolios.recordcount" default="0">
<cfparam name="url.door" default="0">
<cfparam name="url.gallery" default="0">
<cfparam name="url.page" default="0">
<cfparam name="xpan" default="0">		
<cfparam name="url.door" default="1">			
<cfparam name="url.imageposition" default="#url.image#">				



<CFQUERY NAME="qShowcaseArtist"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM GallerySetup where custnumber=#url.id#
</CFQUERY>

<CFQUERY NAME="qGallerySetup2"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup2 where Custnumber=#url.id#
</CFQUERY>



<CFQUERY NAME="qGalleryStatements"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryArtistStatements where Custnumber=#url.id#
</CFQUERY>

<CFQUERY NAME="qGalleryBibliography"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryBibliography where Custnumber=#url.id# and LEN(Catalog)>0 
  ORDER BY YEAR DESC
</CFQUERY>

<CFQUERY NAME="qGetShowcaseMultiplePortfolios"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryDefaultPhotos where Custnumber=#url.id# 
</CFQUERY>


<CFQUERY NAME="qShowcaseGalleryDefaultPhotos"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryDefaultPhotos where custnumber=#url.id# AND SUBDIRECTORY='#url.portfolio#'
</CFQUERY>

<CFQUERY NAME="qShowcaseGalleryIndividualPhotos"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryIndividualPhotos where custnumber='#url.id#' AND IMAGEPOSITION='#url.image#' AND PORTFOLIONAME='#url.portfolio#'
</CFQUERY>

<CFQUERY NAME="qGetDetails"
         DATASOURCE="photoeyecom">
SELECT *
FROM Inventory
WHERE CATALOG = '#qShowcaseGalleryIndividualPhotos.catalog#'
</CFQUERY>


 <CFQUERY NAME="qShowcasePortfolio"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM GalleryPortfolio where Custnumber=#url.id# AND SUBDIRECTORY='#url.portfolio#'
</CFQUERY> 
<!--- If no background paramater Exists, Make Background Black --->
<cfif #len(qShowcasePortfolio.Backgroundcolor)# GT 0>
	<cfset Background = #trim(qShowcasePortfolio.Backgroundcolor)#>
<cfelse>
	<cfset Background = "000000">
</cfif>
<cfset Background = "CCCCCC">
<CFIF qShowcasePortfolio.Panorama is 1>
	<CFSET xPan = 1>
<CFELSE>
	<CFSET xPan = 0>
</CFIF>


<CFQUERY NAME="qShowcaseArtist"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup where Custnumber=#url.id# order by custnumber desc
</CFQUERY>

 <CFQUERY NAME="qShowcasePortfolio"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryPortfolio where Custnumber=#url.id# AND SUBDIRECTORY='#url.portfolio#'
</CFQUERY>


<CFIF qShowcasePortfolio.Panorama is 1>
	<CFSET xPan = 1>
</CFIF>

<CFQUERY NAME="qShowcaseGalleryIndividualPhotos"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryIndividualPhotos where custnumber='#url.id#' AND IMAGEPOSITION='#url.image#' AND PORTFOLIONAME='#url.portfolio#'
</CFQUERY>


<!--- Count the number of portfolios. If GT 1 and there is not portfolio title
Show default Portfolio 1, Portfolio 2, etc as the portfolio title--->
<CFQUERY NAME="qShowcasePortfolioQTY"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryPortfolio where Custnumber=#url.id#
</CFQUERY>

<!--- "#qShowcasePortfolio.Backgroundcolor#" --->
<!--- If no background paramater Exists, Make Background Black --->
<cfif #len(qShowcasePortfolio.Backgroundcolor)# GT 0>
	<cfset Background = #trim(qShowcasePortfolio.Backgroundcolor)#>
<cfelse>
	<cfset Background = "000000">
</cfif>
<cfset Background = "999999">

<!---Update Stats--->
<!---If Record doesn't Exist, Create it!--->
<CFQUERY NAME="qStats"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryStats where custnumber='#url.id#' AND ImageNumber='#url.image#' AND Portfolio='#url.portfolio#'
</CFQUERY>

<CFIF #qStats.recordcount# is 0>

<CFQUERY NAME="qStatsInsert"  DATASOURCE="photoeyecom">
  INSERT INTO GALLERYSTATS 
		(Custnumber, ImageNumber, Portfolio)
				VALUES (#url.id#, #url.image#, '#url.portfolio#') 
</CFQUERY>

</cfif>

<cfset month=MONTH(#Now()#)>


<CFQUERY NAME="UpdateStats" DATASOURCE="photoeyecom">
UPDATE GALLERYSTATS
SET Imagenumber=#url.image#,
Page=3,
PV_Total=PV_Total+1,
PV_YTD=PV_YTD+1,
Hits_Total=Hits_Total+2,
Hits_YTD=Hits_YTD+2
WHERE custnumber=#url.id# AND ImageNumber='#url.image#' AND Portfolio='#url.portfolio#'
</cfquery>


<!---  <cfset Backgroundcolor = "DarkGray">  --->
<!--- <cfparam Name="Backgroundcolor" default="Black"> --->

<CFQUERY NAME="qShowcaseGalleryIndividualPhotos"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryIndividualPhotos where custnumber=#url.id# AND IMAGEPOSITION='#url.image#' AND PORTFOLIONAME='#url.portfolio#' and NOT (notavailable=4 and imagenumber>1)
</CFQUERY>

<CFQUERY NAME="qShowcaseGalleryDefaultPhotos"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryDefaultPhotos where custnumber=#url.id# AND SUBDIRECTORY='#url.portfolio#'
</CFQUERY>

<CFQUERY NAME="qGetDetails"
         DATASOURCE="photoeyecom">
SELECT *
FROM Inventory
WHERE CATALOG = '#qShowcaseGalleryIndividualPhotos.catalog#'
</CFQUERY>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.style2 {font-family: Verdana, Arial, Helvetica, sans-serif}
.style3 {font-family: Verdana, Arial, Helvetica, sans-serif font-size: 10px}
.style4 {font-size: 10px; font-family: Verdana, Arial, Helvetica, sans-serif; }
.style5 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 20px}
-->
</style>
</head>

<body bgcolor="#FFFFFF">


<table width="84%" height="508" border="0" align="center" cellpadding="15" cellspacing="0">
  <tr>
    <td height="36" colspan="2" bgcolor="#CCCCCC"><span class="style5"><cfoutput>#qShowcaseArtist.Firstname#  #qShowcaseArtist.Lastname#</cfoutput></span></td>
    <td colspan="2" align="right" bgcolor="#CCCCCC"><span class="style4">Home | Portfolios | Bio | Publications | Contact </span></td>
  </tr>
  <tr bgcolor="#999999">
    <td width="30%" height="400" valign="middle"><div align="right">
     <cfoutput query="qGetShowcaseMultiplePortfolios">
<font face="Verdana, Arial, Helvetica, sans-serif"size="2">

<cfif url.portfolio is not SUBDIRECTORY>
<a href="index3a.cfm?id=#qShowcaseArtist.custnumber#&Portfolio=#subdirectory#" target="mainFrame""><font face="verdana, arial, helvetica, sans-serif" size="2"	color="##000000" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##000000';">#PortfolioName#</font></a>
<cfelse>
<a href="index3.cfm?id=#qShowcaseArtist.custnumber#&Portfolio=#subdirectory#" target="mainFrame""><font face="verdana, arial, helvetica, sans-serif" size="2"	color="##000000" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##000000';">#PortfolioName#</font></a>

</cfif></font><br><br>
</cfoutput>
<br><br>
<cfoutput>
<CFIF len(#qGalleryBibliography.Catalog#) is not 0>
		<A HREF="javascript:popUp('books.cfm?id=#url.id#','myWindowBooks',630,460);"><font face="verdana, arial, helvetica, sans-serif" size="1"	color="##000000" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##000000';"><b>Books 
          Available</b></font></a><br><br>
</cfif>
		  <!---
		  <cfif #qShowcaseArtist.multiartists# is 0>
		  <font color="##000000"><A HREF="javascript:popUp('Images1a.cfm?id=#url.id#','myWindowImages1a',630,460);"><font face="verdana, arial, helvetica, sans-serif" size="1"	color="##000000" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##000000';"><b>Images1a</b></font></a><br><br>
		  </cfif> --->

<!--- <CFIF len(#qGetShowcaseDefaultInfo.AddInfo1#) is not 0>	
<a href="printinfo.cfm?id=#url.id#" target=_parent><font face="verdana, arial, helvetica, sans-serif" size="1" color="##000000" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##000000';">Print Info</font></a>&nbsp;&nbsp;&nbsp;<font size="2">|</font>&nbsp;&nbsp;
</cfif> --->

<!--- Count the statements in order to define the wording statement(s)--->
<cfset statementqty=0>
<CFIF len(#qGalleryStatements.StatementA#) is not 0>
	<cfset statementqty=statementqty+1>
	<cfset statementword="Statement">
</cfif>

<CFIF len(#qGalleryStatements.StatementP#) is not 0>
	<cfset statementqty=statementqty+1>
	<cfif statementqty is 2>
		<cfset statementword="Statements">
	<cfelse>
		<cfset statementword="Statement">
	</cfif>
</cfif>

<CFIF len(#qGalleryStatements.StatementA#) is not 0 or len(#qGalleryStatements.StatementP#) is not 0 >	
<A HREF="statement.cfm?id=#url.id#" target="mainFrame"mainFrame"><font face="verdana, arial, helvetica, sans-serif" size="1"	color="##000000" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##000000';"><b>#statementword#</b></font></a><br><br>
</cfif>

<!--- <a href="index640.cfm?Portfolio=#url.portfolio#&id=#url.id#&image=#url.image#&imagePosition=#url.imagePosition#&Door=0" target=_parent><font face="verdana, arial, helvetica, sans-serif" size="1" color="##000000" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##000000';">Format for Small Screen</font></a></font></div> --->

<cfif qShowcaseMultiplePortfolios.recordcount GT 1 and left(url.door,1) is not 8 AND URL.DOOR IS NOT 4>	

	<cfif Isdefined("url.Gallery")>
			<cfset Gallery=#url.Gallery#>
		<cfelse>
			<cfset Gallery=0>
		</cfif>
<!--- <A href="../../../../index1.html" target="_parent"> --->
<CFIF qShowcaseArtist.FirstName eq "Twin">
	<A href="homepage_TwinTowers.cfm?id=#url.id#&door=#url.door#&Gallery=#url.gallery#&Page=#URL.Page#" target="_parent">
	 

<CFELSE>	
	<A href="homepage.cfm?id=#url.id#&door=#url.door#&Gallery=#url.gallery#&Page=#URL.Page#" target="_parent"> 
</CFIF>
<!---
<font face="verdana, arial, helvetica, sans-serif" size="1" color="##000000" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##000000';"><b>Close Portfolio</b></font></a> --->

<cfelse>


	<cfif url.door is 4>
		<CFPARAM NAME="url.ExPage" DEFAULT="1">
		<A href="http://www.photoeye.com/gallery/index.cfm?DailyExhibition=#url.ExPage#" target="_top">


	<cfelseif url.door is 'G'>
		<a href="javascript:parent.close();">


	<cfelseif url.door is 1>
	<A href="../representedArtists/homepagePE.cfm" target="_top"> 


	<cfelseif url.door is 2>
	<A href="../photoshowcase/homepagePSNew.cfm" target="_top"> 


	<cfelseif url.door is 3>
	<A href="../magnumartists/homepageMA.cfm" target="_top"> 


	<cfelseif url.door is 51>
	<A href="../ArtistsIndex.cfm?Include=1&Gallery=1&Page=#URL.Page#" target="_top"> 

	<cfelseif url.door is 52>
	<A href="../ArtistsIndex.cfm?Include=1&Gallery=2&Page=#URL.Page#" target="_top"> 
	
	<cfelseif url.door is 53>
	<A href="../ArtistsIndex.cfm?Include=1&Gallery=3&Page=#URL.Page#" target="_top"> 
		
	<cfelseif url.door is 6 and Gallery is 0>
	<A href="../indexgenres.cfm?Include=1&Gallery=0" target="_top"> 

	<cfelseif url.door is 6>
		<cfif Isdefined("url.Gallery")>
			<cfset Gallery=#url.Gallery#>
		<cfelse>
			<cfset Gallery=0>
		</cfif>
	<A href="../Genres.cfm?Include=1&Gallery=#url.Gallery#" target="_top"> 


	<cfelseif url.door is 7 and Gallery is 0>
	<A href="../indexProcesses.cfm?Include=1&Gallery=0" target="_top"> 


		<cfelseif url.door is 7>
			<cfif Isdefined("url.Gallery")>
			<cfset Gallery=#url.Gallery#>
			<cfelse>
			<cfset Gallery=0>
		</cfif>
	<A href="../Processes.cfm?Include=1&Gallery=#url.Gallery#" target="_top"> 


	<cfelseif url.door is 8 and Gallery is 0> <!--- DOOR 8 IS SUBJECT KEYWORDS --->

	<cfset keyword= REPLACE(#URL.KEYWORD#," ","%20","All")>  	
	<A href="../indexsearch.cfm?Gallery=0&keyword=#keyword#*" target="_top"> 
	
	<cfelseif url.door is 80>
		<cfset keyword= REPLACE(#URL.KEYWORD#," ","%20","All")>  
	<A href="../indexPowerSearch.cfm?Include=1&Gallery=0&Keyword=#Keyword#" target="_top"> 	
	
	<cfelseif url.door is 81>
		<cfset keyword= REPLACE(#URL.KEYWORD#," ","%20","All")>  
	<A href="../../templates/searchshowcasePowerSearch.cfm?Include=1&Gallery=1&Keyword=#Keyword#" target="_top"> 	
	<cfelseif url.door is 8>
		<cfset keyword= REPLACE(#URL.KEYWORD#," ","%20","All")>  	
	<A href="../../templates/searchshowcasekeywords.cfm?Gallery=#url.gallery#&keyword=#keyword#*" 		target="_top"> 

	
	
	<cfelseif url.door is 82>
		<cfset keyword= REPLACE(#URL.KEYWORD#," ","%20","All")>  
	<A href="../../templates/searchshowcasePowerSearch.cfm?Include=1&Gallery=2&Keyword=#Keyword#" target="_top"> 	
	
	<cfelseif url.door is 83>
		<cfset keyword= REPLACE(#URL.KEYWORD#," ","%20","All")>  
	<A href="../../templates/searchshowcasePowerSearch.cfm?Include=1&Gallery=3&Keyword=#Keyword#" target="_top"> 			

		<cfif Isdefined("url.Gallery")>
			<cfset Gallery=#url.Gallery#>
		<cfelse>
			<cfset Gallery=0>
		</cfif>
	<cfset keyword= REPLACE(#URL.KEYWORD#," ","%20","All")>  	
	<A href="../../templates/searchshowcasekeywords.cfm?Gallery=#url.gallery#&keyword=#keyword#*" 		target="_top"> 

	<cfelseif url.door is 9 and Gallery is 0>
	<A href="../indexFormats.cfm?Include=1&Gallery=0" target="_top"> 

	<cfelseif url.door is 9>
		<cfif Isdefined("url.Gallery")>
			<cfset Gallery=#url.Gallery#>
		<cfelse>
			<cfset Gallery=0>
		</cfif>

		<A href="../Formats.cfm?Include=1&Gallery=#url.Gallery#" target="_top"> 

	</cfif><font face="verdana, arial, helvetica, sans-serif" size="1" color="##000000" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##000000';"><b>Close Portfolio</b></font></a></font></div> 
</cfif>
<!--- <BR><BR>
<a href="index3.cfm?image=1&id=183070&imagePosition=1&Door=2&Portfolio=Portfolio1&Gallery=2" target="mainFrame">
<font face="verdana, arial, helvetica, sans-serif" size="4" color="##000000" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##000000';">::::</font></a> --->



</td>

    <td colspan="3" BGCOLOR="##999999" valign="top">

<CFINCLUDE TEMPLATE="../../templates/UserIdentification.cfm">
<div align="center">




<input type="hidden" name="UserID" value="#Cookie.UserIdNumber#">
<input type="hidden" name="NumCopies" value="1">
<input type="hidden" name="Binding" value="Photograph">
<input type="hidden" name="ListPrice" value="#qGetDetails.Soft_price#">
<input type="hidden" name="SalePrice" value="0">
<input type="hidden" name="RecordID" value="#qGetDetails.recordID#">
<input type="hidden" name="Catnum" value="#qGetDetails.Catalog#">
<cfset ArtistF =  #Replace(qShowcaseArtist.FirstName," ","","All")#>
<cfset ArtistL =  #Replace(qShowcaseArtist.LastName," ","","All")#>
<cfset ArtistF =  #Replace(qShowcaseArtist.FirstName,"'","","All")#>
<cfset ArtistL =  #Replace(qShowcaseArtist.LastName,"'","","All")#>

<input type="hidden" name="ArtistF" value="#ArtistF#">
<input type="hidden" name="ArtistL" value="#ArtistL#">



<FORM ACTION="../../templates/AddtoCartGalleriesNew.cfm?userid=#Cookie.UserIdNumber#&NumCopies=1&Binding=Photography&Listprice=#qGetDetails.Soft_price#&SalePrice=0&RecordID=#qGetDetails.recordID#&Catnum=#qGetDetails.Catalog#&ArtistF=#ArtistF#&ArtistL=#ArtistL#&Showcase=1" METHOD="POST" target="_top">

<!--- <FORM ACTION="../../templates/AddtoCartGallerySale.cfm" METHOD="POST" target="_top"> --->
<center>
          
			
			
				
			<CFIF xPan is 0>
			    <table height="80%" cellpadding="5" align="center" width="100%">
     			 <tr align="right"> 
        			<td height="80%"> 
         
		 	 <table height="100" cellpadding="5" align="center" width="100%" bgcolor="###Background#">
             <tr valign="bottom" height="165" align="left"> 
			  <td width="65%" height="*" rowspan="2" valign="top" align="right">
			    <div align="right"><a href="pages_enlarge/Image1b.cfm?image=#qShowcaseGalleryIndividualPhotos.imagenumber#&id=#url.id#&Portfolio=#url.portfolio#"><!--- #qShowcaseGalleryIndividualPhotos.imageposition# --->

<!--- ImageSizer --->					
<cfset xheight=240>
<cfset xwidth=500>
<cfset xImageAddress="#xRelativePath#\Artists\#qShowcaseArtist.Subdirectory#\#Portfolio#\Images_Large\">
<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image#qShowcaseGalleryIndividualPhotos.imageNUMBER#.jpg">


<cfinclude template="../../templates/imagesizer.cfm">

<img src="../../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a></div>
<!--- End ImageSizer --->

              </td>
			  
			  <td width="5" height="*" rowspan="2" valign="top">&nbsp; </td>
			  <td width="150" height="*" align="left" valign="bottom">	
			 <cfelse>
			 
			     <table height="80%" cellpadding="5" align="center" >
      			<tr align="center"> 
      			  <td height="80%"> 
         
		 	 <table height="100" cellpadding="5" align="center" bgcolor="###Background#">
			 	 <tr> 
			  <td width="100%" height="*" rowspan="2" valign="top" align="center">
			    <div align="center"><a href="pages_enlarge/Image1b.cfm?image=#qShowcaseGalleryIndividualPhotos.imagenumber#&id=#url.id#&Portfolio=#url.portfolio#"><!--- #qShowcaseGalleryIndividualPhotos.imageposition# --->

<!--- ImageSizer --->									
<cfset xheight=240>
<cfset xwidth=500>
<cfset xImageAddress="#xRelativePath#\Artists\#qShowcaseArtist.Subdirectory#\#Portfolio#\Images_Large\">
<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image#qShowcaseGalleryIndividualPhotos.imageNUMBER#.jpg">

<cfinclude template="../../templates/imagesizer.cfm">

<img src="../../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a></div>
<!--- End ImageSizer --->
				
				

              </td>		

			  </tr>
			</TABLE>
			<TABLE WIDTH="100%">
			   <tr> 
				 <td width="100%" align="right" valign="bottom">	
				 
				 <TABLE><TR><TD ALIGN="Left">
			 </cfif>
             
			  
              

			 		  <font face="verdana, arial, helvetica, sans-serif" size="1" color="SILVER" style="TEXT-DECORATION: none">
	          <b>
			<cfif #qShowcaseArtist.MultiArtists# is 1>

				  
				  <!--- Image Title --->
				  
				  <cfif len(#qShowcaseGalleryIndividualPhotos.title#) GT 0>
						 <cfif len(trim(#qShowcaseGalleryIndividualPhotos.yearprod#)) GT 0  and FIND(#qShowcaseGalleryIndividualPhotos.yearprod#,#qShowcaseGalleryIndividualPhotos.title#) is 0>
						   #qShowcaseGalleryIndividualPhotos.title#,
						 <cfelse>
						   #qShowcaseGalleryIndividualPhotos.title#
						 </cfif>
				 <cfelse>
						 <cfif len(trim(#qShowcaseGalleryIndividualPhotos.yearprod#)) GT 0  and FIND(#qShowcaseGalleryIndividualPhotos.yearprod#,#qShowcaseGalleryIndividualPhotos.title#) is 0>
						   #qShowcaseGalleryDefaultPhotos.title#,
						 <cfelse>
						   #qShowcaseGalleryDefaultPhotos.title#
						 </cfif>
				 </cfif>
				  <cfif len(trim(#qShowcaseGalleryIndividualPhotos.yearprod#)) GT 0 and FIND(#qShowcaseGalleryIndividualPhotos.yearprod#,#qShowcaseGalleryIndividualPhotos.title#) is 0>
						 #qShowcaseGalleryIndividualPhotos.yearprod#
				 <cfelseif len(trim(#qShowcaseGalleryDefaultPhotos.yearprod#)) GT 0 and #qShowcaseGalleryIndividualPhotos.default3# is 1 and FIND(#qShowcaseGalleryIndividualPhotos.yearprod#,#qShowcaseGalleryIndividualPhotos.title#) is 0>

						 #qShowcaseGalleryDefaultPhotos.yearprod#
				<cfelse>
				 </cfif>			 
				 <BR><BR>Photograph by <BR>#qShowcaseGalleryIndividualPhotos.firstname# #qShowcaseGalleryIndividualPhotos.lastname#<br><br>
				 
				 
				
				<cfelse>
				  <!--- Portfolio Title --->
				  <cfif len(#qShowcaseGalleryDefaultPhotos.portfolioName#) is 0 and #qShowcasePortfolioQTY.recordcount# GT 1>
						
     					<font color="##FFFF99"> #left(qShowcasePortfolio.Subdirectory,9)# #mid(qShowcasePortfolio.Subdirectory,10,2)#</font><br><br>
				 <cfelse>
<font color="##FFFF99">
				 #qShowcaseGalleryDefaultPhotos.portfolioName#</font><br><br>
				  </cfif>
				  			  
				  <!--- Portfolio Introduction --->
					  <cfif len(#qShowcasePortfolio.portfoliointro#) GT 0 and #qShowcaseGalleryIndividualPhotos.imagenumber# is 1 and #len(qShowcaseGalleryDefaultPhotos.portfolioName)# GT 0>
						 <A HREF="javascript:popUp('PortfolioIntro.cfm?id=#url.id#&IMAGENUMBER=#url.image#&PORTFOLIO=#url.portfolio#','myWindowEnlarge',630,460,'auto');">
      <font face="verdana, arial, helvetica, sans-serif" size="1" color="##999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##999999';">
      Introduction</font></a><br><br><br>
	  
	  					<cfelseif len(#qShowcasePortfolio.portfoliointro#) GT 0 and #qShowcaseGalleryIndividualPhotos.imagenumber# is 1>
						<A HREF="javascript:popUp('PortfolioIntro.cfm?id=#url.id#&IMAGENUMBER=#url.image#&PORTFOLIO=#url.portfolio#','myWindowEnlarge',630,460,'auto');">
      <font face="verdana, arial, helvetica, sans-serif" size="1" color="##999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##999999';">
      #qShowcasePortfolio.Title#<br>Introduction</font></a><br><br><br>
				  </cfif>			  
				  
				  <!--- Image Title --->
				  
				  <cfif len(#qShowcaseGalleryIndividualPhotos.title#) GT 0>
						 <cfif len(trim(#qShowcaseGalleryIndividualPhotos.yearprod#)) GT 0  and FIND(#qShowcaseGalleryIndividualPhotos.yearprod#,#qShowcaseGalleryIndividualPhotos.title#) is 0>
						   #qShowcaseGalleryIndividualPhotos.title#,
						 <cfelse>
						   #qShowcaseGalleryIndividualPhotos.title#
						 </cfif>
				 <cfelse>
						 <cfif len(trim(#qShowcaseGalleryIndividualPhotos.yearprod#)) GT 0  and FIND(#qShowcaseGalleryIndividualPhotos.yearprod#,#qShowcaseGalleryIndividualPhotos.title#) is 0>
						   #qShowcaseGalleryDefaultPhotos.title#,
						 <cfelse>
						   #qShowcaseGalleryDefaultPhotos.title#
						 </cfif>
				 </cfif>
				  <cfif len(trim(#qShowcaseGalleryIndividualPhotos.yearprod#)) GT 0 and FIND(#qShowcaseGalleryIndividualPhotos.yearprod#,#qShowcaseGalleryIndividualPhotos.title#) is 0>
						 #qShowcaseGalleryIndividualPhotos.yearprod#<br><br>
				 <cfelseif len(trim(#qShowcaseGalleryDefaultPhotos.yearprod#)) GT 0 and #qShowcaseGalleryIndividualPhotos.default3# is 1 and FIND(#qShowcaseGalleryIndividualPhotos.yearprod#,#qShowcaseGalleryIndividualPhotos.title#) is 0>

						 #qShowcaseGalleryDefaultPhotos.yearprod#<br><br>
				<cfelse>
				 <br>
				 </cfif>			 
				
			</cfif>
				  		  
<!--- 				  <cfif len(#qShowcaseGalleryDefaultPhotos.portfolioName#) GT 0 and #qShowcaseGalleryIndividualPhotos.imagenumber# is 1 and #left(qShowcasePortfolio.Subdirectory,9)# is not #left(qShowcaseGalleryDefaultPhotos.portfolioName,9)#>
						
     					<font color="##FFFF99"> #left(qShowcasePortfolio.Subdirectory,9)# #mid(qShowcasePortfolio.Subdirectory,10,2)#<br>  
#qShowcaseGalleryDefaultPhotos.portfolioName#</font><br><br>
				 <cfelseif len(#qShowcaseGalleryDefaultPhotos.portfolioName#) GT 0 and #qShowcaseGalleryIndividualPhotos.imagenumber# is 1>
<font color="##FFFF99">
				 #qShowcaseGalleryDefaultPhotos.portfolioName#</font><br><br>
				  </cfif> --->
				  
	
				 
<!--- 				 <cfif len(trim(#qShowcaseGalleryIndividualPhotos.yearprod#)) GT 0 and RIGHT(#qShowcaseGalleryIndividualPhotos.title#,4) is NOT #qShowcaseGalleryIndividualPhotos.yearprod#>
						 #qShowcaseGalleryIndividualPhotos.yearprod#<br>
				 <cfelseif len(trim(#qShowcaseGalleryDefaultPhotos.yearprod#)) GT 0 and #qGetShowcaseIndividualInfo.default3# is 1 and RIGHT(#qShowcaseGalleryDefaultPhotos.title#,4) is NOT #qShowcaseGalleryIndividualPhotos.yearprod#>
						 #qShowcaseGalleryDefaultPhotos.yearprod#<br>
				<cfelse> --->
				
				</b>
				</font>
				<font face="Verdana, Arial, Helvetica, sans-serif" color="##999999" size="1">
				<b> 
                  <cfif len(#qShowcaseGalleryIndividualPhotos.caption1#) GT 0>
						 <br><A HREF="javascript:popUp('caption.cfm?id=#url.id#&IMAGENUMBER=#url.image#&PORTFOLIO=#url.portfolio#','myWindowEnlarge',630,460);">
      <font face="verdana, arial, helvetica, sans-serif" size="1" color="##999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##999999';">
      Caption</font></a><br><br>
<!--- 				 <cfelseif len(#qShowcaseGalleryDefaultPhotos.caption1#) GT 0>
						 #qShowcaseGalleryDefaultPhotos.caption1# <br> --->
				 </cfif>                
				 
                 <cfif len(#qShowcaseGalleryIndividualPhotos.medium#) GT 0 and #qShowcaseGalleryIndividualPhotos.medium# is NOT 'Other Medium'>
						#qShowcaseGalleryIndividualPhotos.medium# <br> 
				 <cfelseif len(#qShowcaseGalleryIndividualPhotos.othermed#) GT 0> 					#qShowcaseGalleryIndividualPhotos.othermed# <br>
				 <cfelseif len(#qShowcaseGalleryDefaultPhotos.othermed#) GT 0> 					#qShowcaseGalleryDefaultPhotos.othermed# <br>
				 <cfelseif len(#qShowcaseGalleryDefaultPhotos.medium#) GT 0> 					#qShowcaseGalleryDefaultPhotos.medium# <br>
				 </cfif>
				 
                 <cfif val(#qShowcaseGalleryIndividualPhotos.width1#) GT 1>
				      #qShowcaseGalleryIndividualPhotos.height1#x#qShowcaseGalleryIndividualPhotos.width1#&quot; Image<br>
			 <!--- Make sure that there is a width size that exists --->
					<cfelseif val(#qShowcaseGalleryDefaultPhotos.width1#) is 1 and val(#qShowcaseGalleryDefaultPhotos.height1#) is 1>
				Image Size Varies<br>
					  <cfelseif val(#qShowcaseGalleryDefaultPhotos.width1#) GT 0>
 #qShowcaseGalleryDefaultPhotos.height1#x#qShowcaseGalleryDefaultPhotos.width1#&quot; Image<br>
				 </cfif>  
	
				  
				  <!--- Mat --->
				  <!--- Individual Photos --->
				  <cfif (val(#qShowcaseGalleryIndividualPhotos.Matwidth1#) GT 0) or (VAL(#qShowcaseGalleryIndividualPhotos.default4#) is 0)>
				 	<cfif #qShowcaseGalleryIndividualPhotos.unmatted# is 1>
					 	 Unmatted<br>
					 	<!--- Make sure that there is a mat size that exists --->
					  <cfelseif val(#qShowcaseGalleryIndividualPhotos.Matwidth1#) GT 1>
					 	<!--- if Default Mat is the same size as the print, assume that it is unmatted>--->
						<cfif #qShowcaseGalleryIndividualPhotos.matheight1# is #qShowcaseGalleryIndividualPhotos.height1# and 
#qShowcaseGalleryIndividualPhotos.matwidth1# is #qShowcaseGalleryIndividualPhotos.width1#>
						Mat size varies<br>
						<cfelse> #qShowcaseGalleryIndividualPhotos.matheight1#x#qShowcaseGalleryIndividualPhotos.matwidth1#&quot; Mat<br>
						</cfif>
					  </cfif>  		
				 <cfelse>
				 	<!--- Default Photos --->
					  <cfif #qShowcaseGalleryDefaultPhotos.unmatted# is 1 >
					 	Unmatted<br> 
					 <!--- Make sure that there is a mat size that exists --->
					  <cfelseif val(#qShowcaseGalleryDefaultPhotos.Matwidth1#) GT 0>
		  				<!--- if Mat is the same size as the print, assume that it is unmatted>--->
						<cfif #qShowcaseGalleryDefaultPhotos.matheight1# is #qShowcaseGalleryDefaultPhotos.height1# and 
#qShowcaseGalleryDefaultPhotos.matwidth1# is #qShowcaseGalleryDefaultPhotos.width1#>
						Mat size varies<br>
						<cfelse>
 #qShowcaseGalleryDefaultPhotos.matheight1#x#qShowcaseGalleryDefaultPhotos.matwidth1#&quot; Mat <br>			
						</cfif>
					  </cfif> 	 
				 </cfif>
				 
				 	<!--- If len(Edition No) is 0 --->
			<cfif #qShowcaseGalleryIndividualPhotos.Editioned1# is 1 and (#len(trim(qShowcaseGalleryIndividualPhotos.EditionNo1))# is 0 or #qShowcaseGalleryIndividualPhotos.EditionNo1# is 0) and #len(trim(qShowcaseGalleryIndividualPhotos.EditionSz1))# GT 0>
Edition of #qShowcaseGalleryIndividualPhotos.EditionSz1#<br> 

			 <cfelseif #qShowcaseGalleryIndividualPhotos.Default5# is 1 and  #qShowcaseGalleryDefaultPhotos.Editioned1# is 1 and (#len(trim(qShowcaseGalleryDefaultPhotos.EditionNo1))# is 0 or #qShowcaseGalleryIndividualPhotos.EditionNo1# is 0)>		
Edition of #qShowcaseGalleryDefaultPhotos.EditionSz1#<br>  
				 <cfelseif #qShowcaseGalleryIndividualPhotos.Editioned1# is 1 and #len(qShowcaseGalleryIndividualPhotos.EditionNo1)# GT 0 and #len(qShowcaseGalleryIndividualPhotos.EditionSz1)# GT 0>	#qShowcaseGalleryIndividualPhotos.EditionNo1#/#qShowcaseGalleryIndividualPhotos.EditionSz1#<br> 
				 <cfelseif #qShowcaseGalleryIndividualPhotos.Default5# is 1 and  #qShowcaseGalleryDefaultPhotos.Editioned1# is 1>		#qShowcaseGalleryDefaultPhotos.EditionNo1#/#qShowcaseGalleryDefaultPhotos.EditionSz1#<br>
				 </cfif>
				 
				 
<!--- 				 <cfif #qShowcaseGalleryIndividualPhotos.Editioned1# is 1 and #len(qShowcaseGalleryIndividualPhotos.EditionNo1)# GT 0 and #len(qShowcaseGalleryIndividualPhotos.EditionSz1)# GT 0>	#qShowcaseGalleryIndividualPhotos.EditionNo1#/#qShowcaseGalleryIndividualPhotos.EditionSz1#<br> 
				 <cfelseif #qShowcaseGalleryIndividualPhotos.Default5# is 1 and  #qShowcaseGalleryDefaultPhotos.Editioned1# is 1>		#qShowcaseGalleryDefaultPhotos.EditionNo1#/#qShowcaseGalleryDefaultPhotos.EditionSz1#<br>
				 </cfif> --->		 
				  <cfif (#qShowcaseGalleryIndividualPhotos.defaultnfs# is 1 and qShowcaseGalleryDefaultPhotos.notavailable is 5) or (#qShowcaseGalleryIndividualPhotos.defaultnfs# is 0 and qShowcaseGalleryIndividualPhotos.notavailable is 5)>				
                 <cfelseif #qShowcaseGalleryIndividualPhotos.price1# GT 0 and  qShowcaseGalleryIndividualPhotos.NotAvailable is 0 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1>
						$#qShowcaseGalleryIndividualPhotos.price1# <cfif #qShowcaseGalleryDefaultPhotos.PortfolioPrice# is 1>Portfolio Price</cfif><br> 
				 <cfelseif #qShowcaseGalleryDefaultPhotos.price1# GT 0 and #qShowcaseGalleryDefaultPhotos.NotAvailable# is 0 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is  1>
					$#qShowcaseGalleryDefaultPhotos.price1# <cfif #qShowcaseGalleryDefaultPhotos.PortfolioPrice# is 1>Portfolio Price</cfif><br>
				 </cfif>
				 
				<CFIF len(#qShowcaseGalleryIndividualPhotos.AddInfo1#) is not 0> 
    
    				<br><br><A HREF="javascript:popUp('printinfoMiddle.cfm?id=#url.id#&IMAGENUMBER=#url.image#&PORTFOLIO=#url.portfolio#','myWindowEnlarge',630,460);">
      <font face="verdana, arial, helvetica, sans-serif" size="1" color="##999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##999999';">
      Print Info</font></a></td>
   				<cfelseif len(#qShowcaseGalleryDefaultPhotos.AddInfo1#) is not 0>
         <br><br><A HREF="javascript:popUp('printinfoMiddle.cfm?id=#url.id#&IMAGENUMBER=#url.image#&PORTFOLIO=#url.portfolio#','myWindowEnlarge',630,460);">
      <font face="verdana, arial, helvetica, sans-serif" size="1" color="##999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##999999';">
      Print Info</font></a></td>
    			<cfelse>
      				</td>
   				 </cfif> 
				 
			</b>
			</font>
			

	<!--- 		 <td width="*" height="*" valign="top">
			</td> --->

			
            </tr>
            <tr valign="middle" height="165"> 
              <td width="*" height="50" valign="bottom"> 



			  
<input type="hidden" name="UserID" value="#Cookie.UserIdNumber#">
<input type="hidden" name="NumCopies" value="1">
<input type="hidden" name="Binding" value="Photograph">
<input type="hidden" name="ListPrice" value="#qGetDetails.Soft_price#">
<input type="hidden" name="SalePrice" value="0">
<input type="hidden" name="RecordID" value="#qGetDetails.recordID#">
<input type="hidden" name="Catnum" value="#qGetDetails.Catalog#">
<input type="hidden" name="Title" value="#qGetDetails.Title2x#">

	  
                <p>
				
				
				<cfif #qShowcasePortfolio.Backgroundcolor# is "333333">
					<cfif (qShowcaseGalleryIndividualPhotos.NotAvailable is 5 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 5 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1)>
					 <a href="mailto:gallery@photoeye.com?Subject=#qShowcaseArtist.FirstName# #qShowcaseArtist.LastName# Price Inquiry"><font face="verdana, arial, helvetica, sans-serif" size="1" color="##999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##999999';"><strong>Price Upon Request</strong></font></a><br>
					<cfelseif (qShowcaseGalleryIndividualPhotos.NotAvailable is 0 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 0 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1)>
					<input type="image" src="../sharedimages/purchaseprintGray.gif" align="absmiddle" width="90" height="15" border="0"><br>
					<cfelseif (qShowcaseGalleryIndividualPhotos.NotAvailable is 1 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 1 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1)>
					 <font face="verdana, arial, helvetica, sans-serif" size="1" color="YELLOW" style="TEXT-DECORATION: none">Sold Out</font><br>
					<cfelseif (qShowcaseGalleryIndividualPhotos.NotAvailable is 2 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 2 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1)>
					 <font face="verdana, arial, helvetica, sans-serif" size="1" color="YELLOW" style="TEXT-DECORATION: none">Reserved</font><br>
					<cfelseif (qShowcaseGalleryIndividualPhotos.NotAvailable is 3 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 3 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1)>
					 <font face="verdana, arial, helvetica, sans-serif" size="1" color="YELLOW" style="TEXT-DECORATION: none">Not for Sale</font><br>
					</cfif>
  				  <img src="../SharedImages/dot_clear.gif" width="1" height="20" alt="" border="0"><a href="pages_enlarge/Image1b.cfm?image=#qShowcaseGalleryIndividualPhotos.imagenumber#&id=#url.id#&Portfolio=#url.portfolio#"><img src="../sharedimages/enlargeGray.gif" width="90" height="15" alt="" border="0" name="img2"></a>  <!---#qShowcaseGalleryIndividualPhotos.imageposition# --->
                 <cfelse>
					<cfif (qShowcaseGalleryIndividualPhotos.NotAvailable is 5 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 5 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1)>
					 <a href="mailto:gallery@photoeye.com?Subject=#qShowcaseArtist.FirstName# #qShowcaseArtist.LastName# Price Inquiry"><font face="verdana, arial, helvetica, sans-serif" size="1" color="##999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##999999';"><strong>Price Upon Request</strong></font></a><br>
					<cfelseif (qShowcaseGalleryIndividualPhotos.NotAvailable is 0 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 0 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1)>
					<input type="image" src="../sharedimages/purchaseprint.gif" align="absmiddle" width="90" height="15" border="0"><br>
					<cfelseif (qShowcaseGalleryIndividualPhotos.NotAvailable is 1 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 1 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1)>
					 <font face="verdana, arial, helvetica, sans-serif" size="1" color="Yellow" style="TEXT-DECORATION: none">Sold Out</font><br>
					<cfelseif (qShowcaseGalleryIndividualPhotos.NotAvailable is 2 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 2 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1)>
					 <font face="verdana, arial, helvetica, sans-serif" size="1" color="Yellow" style="TEXT-DECORATION: none">Reserved</font><br>
					<cfelseif (qShowcaseGalleryIndividualPhotos.NotAvailable is 3 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 3 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1)>
					 <font face="verdana, arial, helvetica, sans-serif" size="1" color="Yellow" style="TEXT-DECORATION: none">Not for Sale</font><br>
					</cfif>
						   <img src="../SharedImages/dot_clear.gif" width="1" height="20" alt="" border="0"><a href="pages_enlarge/Image1b.cfm?image=#qShowcaseGalleryIndividualPhotos.imagenumber#&id=#url.id#&Portfolio=#url.portfolio#"><img src="../sharedimages/enlarge.gif" width="90" height="15" alt="" border="0" name="img2"></a><!---  image=#image#&id=#url.id# ---><!--- #qShowcaseGalleryIndividualPhotos.imageposition# --->
				 </cfif>
                </p>
              </td>
            </tr>
          </table>
		  
		  <cfif xPan is 1>
		  </td>
		  </tr>
          </table>
		  </cfif>
		  <cfset imagecount=#qShowcasePortfolio.imgqty#>
		
		  <cfset xNext=#url.imageposition#+1>
		  <cfif xNext GT #imagecount#>
		  	 <cfset xNext=1>
		 </cfif>
		  <cfset xPrevious=#url.imageposition#-1>
		  <cfif xPrevious LT 1>
		  	<cfset xPrevious=#imagecount#>
		  </cfif>
		  <table align="center"><tr><td height="50"></td></tr><tr><td><a href="image1b.cfm?image=#xPrevious#&id=183070&imagePosition=#xPrevious#&Door=2&Portfolio=#url.portfolio#&Gallery=2" target="mainFrame"><font face="verdana, arial, helvetica, sans-serif" size="4" color="##ffffff" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##ffffff';"><</font></a></td><td>&nbsp;&nbsp;&nbsp;
		  <a href="index3.cfm?image=#xPrevious#&id=183070&imagePosition=#xPrevious#&Door=2&Portfolio=Portfolio1&Gallery=2" target="mainFrame"><font face="verdana, arial, helvetica, sans-serif" size="4" color="##ffffff" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##ffffff';">::::</font></a>
		  
		  &nbsp;&nbsp;&nbsp;</td><td><a href="image1b.cfm?image=#xnext#&id=183070&imagePosition=#xnext#&Door=2&Portfolio=#url.portfolio#&Gallery=2" target="mainFrame"><font face="verdana, arial, helvetica, sans-serif" size="4" color="##ffffff" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##ffffff';">></font></a></td></tr></table>
        </td>
      </tr>
    </table>

  </center>

</form></td>


		

  </tr>

  <tr bgcolor="##CCCCCC">
    <td colspan="3">&nbsp;</td>
    <td width="22%" height="20"><span class="style4">Copyright 2004, #qShowcaseArtist.Firstname#  #qShowcaseArtist.Lastname#</span></td>
  </tr>
</table>
</cfoutput>
</body>
</html>
