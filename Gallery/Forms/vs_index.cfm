<!---  <cfif isdefined("All") is false>
	<cfset All=0>
</cfif>  --->

<cfparam name="qGetVS_MultiplePortfolios.recordcount" default="0">
<cfparam name="url.door" default="0">
<cfparam name="url.gallery" default="0">
<cfparam name="url.page" default="0">
<cfparam name="url.statement" default="0">
<cfparam name="url.contact" default="0">
<cfparam name="url.bio" default="0">
<cfparam name="url.books" default="0">
<cfparam name="url.galleries" default="0">
<cfparam name="url.gallerydetails" default="0">
<cfparam name="url.enlarge" default="0">
<cfparam name="url.enlarge2" default="0">
<cfparam name="url.image" default="0">
<cfparam name="url.portfolio" default="portfolio1">
<cfparam name="photoeye" default="1">

<cfparam name="rightbackgroundcolor" default="##FFFFFF">

<cfparam name="xpan" default="0">		
<cfparam name="url.imageposition" default="#url.image#">		

<cfset LeftFrameBackground = "BBBBBB">

<cfset font1="330099">
<!--- Portfolio Title --->
<cfset font2="FFFF66">
<!--- Title --->
<cfset font3="330099"> 
<!--- Introduction --->
<cfset font4="330099">
<!--- Introduction and Title ---->
<cfset font5="666666">
<cfset font6="666666">
<cfset font7="666666">
<!--- Print Info --->
<cfset font8="666666">

<cfset font10="666666">
<cfset font11="666666">
<cfset font12="666666">
<cfset font13="666666">

<CFQUERY NAME="qGetVS_Artist"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM VS_Setup where custnumber=#url.id#
</CFQUERY>

<cfset pagetitle = "#qGetVS_Artist.Firstname# #qGetVS_Artist.LastName#">

<!--- <CFQUERY NAME="qGetVS_Setup2"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup2 where Custnumber=#url.id#
</CFQUERY> --->

<CFQUERY NAME="qGetVS_Statements_A"  DATASOURCE="photoeyecom">
  SELECT *
  FROM VS_Statements_A where Custnumber=#url.id#
</CFQUERY>

<CFQUERY NAME="qGetVS_Statements_P"  DATASOURCE="photoeyecom">
  SELECT *
  FROM VS_Statements_P where Custnumber=#url.id#
</CFQUERY>



<CFQUERY NAME="qGetVS_Bibliography"  DATASOURCE="photoeyecom">
  SELECT *
  FROM VS_Bibliography where Custnumber=#url.id# and LEN(Catalog)>0 
  ORDER BY YEAR DESC
</CFQUERY>

<CFQUERY NAME="qGetVS_MultiplePortfolios"  DATASOURCE="photoeyecom">
  SELECT *
  FROM VS_Images_Default where Custnumber=#url.id# 
</CFQUERY>

<CFQUERY NAME="qGetVS_Galleries"  DATASOURCE="photoeyecom">
  SELECT *
  FROM VS_Galleries where Custnumber=52772
</CFQUERY>

 <CFQUERY NAME="qGetVS_Images"  DATASOURCE="photoeyecom">
  	SELECT Distinct *
 	FROM VS_Images I INNER JOIN VS_Images_Caption1 C on I.Catalog=C.Catalog  where I.custnumber='#url.id#' and I.PortfolioName='#url.portfolio#' and NOT (I.notavailable=4 and I.imagenumber>1)
	order by I.imageposition;
</CFQUERY>	

 <CFQUERY NAME="qGetVS_ImagesAddInfo1"  DATASOURCE="photoeyecom">
  	SELECT Distinct *
 	FROM VS_Images I INNER JOIN VS_Images_AddInfo1 A on I.Catalog=A.Catalog  where I.custnumber='#url.id#' and I.PortfolioName='#url.portfolio#' and NOT (I.notavailable=4 and I.imagenumber>1)
	order by I.imageposition;
</CFQUERY>	


 <CFQUERY NAME="qGetVS_Portfolio"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM VS_Portfolios P INNER JOIN VS_Portfolios_Intro I ON P.ID=I.ID and P.Portfolioid=I.PortfolioID where P.ID=#url.id# AND P.SUBDIRECTORY='#url.portfolio#'
</CFQUERY> 



<!--- If no background paramater Exists, Make Background Black --->
<cfif #len(qGetVS_Portfolio.Backgroundcolor)# GT 0>
	<cfset Background = #trim(qGetVS_Portfolio.Backgroundcolor)#>
<cfelse>
	<cfset Background = "000000">
</cfif>
<cfset Background = "CCCCCC">
<CFIF qGetVS_Portfolio.Panorama is 1>
	<CFSET xPan = 1>
<CFELSE>
	<CFSET xPan = 0>
</CFIF>


<CFQUERY NAME="qGetVS_Images_Default"  DATASOURCE="photoeyecom">
  SELECT *
  FROM VS_Images_Default I INNER JOIN VS_Images_Default_AddInfo1 A on I.Custnumber=A.Custnumber and I.PortfolioID=A.PortfolioID  where I.custnumber=#url.id# AND I.SUBDIRECTORY='#url.portfolio#'
</CFQUERY>

<CFQUERY NAME="qGetDetails"
         DATASOURCE="photoeyecom">
SELECT *
FROM Inventory
WHERE CATALOG = '#qGetVS_Images.catalog#'
</CFQUERY>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><CFOUTPUT>#PageTitle#</CFOUTPUT></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.style2 {font-family: Verdana, Arial, Helvetica, sans-serif}
.style3 {font-family: Verdana, Arial, Helvetica, sans-serif font-size: 10px}
.style4 {font-size: 10px; font-family: Verdana, Arial, Helvetica, sans-serif; }
.style5 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 20px}
-->
</style>
<script language="JavaScript">

<!-- hide from JavaScript-challenged browsers
var popupWin = null;
function popUp(myURL,myWindowName,w,h,scroll,menu){
var myLeft = ((screen.width-w)/2)-5; 
var myTop = ((screen.height-h)/2)-5;
var settings='height='+h+',width='+w+',top='+myTop+',left='+myLeft+',scrollbars=yes, resizable=no,menu='+menu 
popupWin=window.open(myURL,myWindowName,settings);
if(parseInt(navigator.appVersion) >= 4){popupWin.focus();}
}
 
// done hiding -->

</script>
</head>

<body bgcolor="#FFFFFF">

<cfif qGetVS_Galleries.recordcount gt 1>
<cfset GalleryWord = "Galleries">
<cfelseif qGetVS_Galleries.recordcount is 1>
<cfset GalleryWord = "Gallery">


</cfif>
<table width="84%" height="480" border="0" align="center" cellpadding="15" cellspacing="0">
  <tr>
    <td colspan="2" bgcolor="#FFCCCC"><span class="style5"><cfoutput>#qGetVS_Artist.Firstname#  #qGetVS_Artist.Lastname#</cfoutput></span></td>
    <td colspan="2" align="right" bgcolor="#FFCCCC"><span class="style4"><cfoutput><a href="index6.cfm?id=#url.id#"  target="_self"><font face="verdana, arial, helvetica, sans-serif" size="1"	color="##000000" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##000000';">Home</font></a> | <a href="index6.cfm?id=#url.id#"  target="_self"><font face="verdana, arial, helvetica, sans-serif" size="1"	color="##000000" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##000000';">Portfolios</font></a> | <a href="index6.cfm?id=#url.id#&bio=1"  target="_self"><font face="verdana, arial, helvetica, sans-serif" size="1"	color="##000000" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##000000';">Bio</font></a> <cfif qGetVS_Bibliography.recordcount gt 0>| <a href="index6.cfm?id=#url.id#&books=1"  target="_self"><font face="verdana, arial, helvetica, sans-serif" size="1"	color="##000000" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##000000';">Publications</font></a> </cfif>  <cfif qGetVS_Galleries.recordcount gt 0>| <a href="index6.cfm?id=#url.id#&galleries=1"  target="_self"><font face="verdana, arial, helvetica, sans-serif" size="1"	color="##000000" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##000000';">#GalleryWord#</font></a> </cfif>| <a href="index6.cfm?id=#url.id#&Contact=1"  target="_self"><font face="verdana, arial, helvetica, sans-serif" size="1"	color="##000000" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##000000';">Contact</font></a></cfoutput></span></td>
  </tr>
  <tr bgcolor="<cfoutput>###LeftFrameBackground#</cfoutput>">
    <td width="30%" height="430" valign="top"><div align="right">
	<table cellpadding="0" cellspacing="0"><tr><td height="50"></td></tr></table>
     <cfoutput query="qGetVS_MultiplePortfolios">
<font face="Verdana, Arial, Helvetica, sans-serif"size="2">

<cfif url.portfolio is not SUBDIRECTORY>
<a href="index6.cfm?id=#qGetVS_Artist.custnumber#&Portfolio=#subdirectory#" target="_self"><font face="verdana, arial, helvetica, sans-serif" size="2"	color="##000000" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##000000';">#PortfolioName#</font></a>
<cfelse>
<a href="index6.cfm?id=#qGetVS_Artist.custnumber#&Portfolio=#subdirectory#"  target="_self"><font face="verdana, arial, helvetica, sans-serif" size="2"	color="##000000" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##000000';">#PortfolioName#</font></a>

</cfif></font><br><br>
</cfoutput>
<br>
<cfoutput>
<CFIF len(#qGetVS_Bibliography.Catalog#) is not 0>
		<a href="index6.cfm?id=#url.id#&books=1"  target="_self"><font face="verdana, arial, helvetica, sans-serif" size="1"	color="##000000" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##000000';"><b>Books 
          Available</b></font></a><br><br>
</cfif>
		  <!---
		  <cfif #qGetVS_Artist.multiartists# is 0>
		  <font color="##000000"><A HREF="javascript:popUp('Images1a.cfm?id=#url.id#','myWindowImages1a',630,460);"><font face="verdana, arial, helvetica, sans-serif" size="1"	color="##000000" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##000000';"><b>Images1a</b></font></a><br><br>
		  </cfif> --->

<!--- <CFIF len(#qGetVS_DefaultInfo.AddInfo1#) is not 0>	
<a href="printinfo.cfm?id=#url.id#" target=_parent><font face="verdana, arial, helvetica, sans-serif" size="1" color="##000000" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##000000';">Print Info</font></a>&nbsp;&nbsp;&nbsp;<font size="2">|</font>&nbsp;&nbsp;
</cfif> --->

<!--- Count the statements in order to define the wording statement(s)--->
<cfset statementqty=0>
<CFIF len(#qGetVS_Statements_A.StatementA#) is not 0>
	<cfset statementqty=statementqty+1>
	<cfset statementword="Statement">
</cfif>

<CFIF len(#qGetVS_Statements_P.StatementP#) is not 0>
	<cfset statementqty=statementqty+1>
	<cfif statementqty is 2>
		<cfset statementword="Statements">
	<cfelse>
		<cfset statementword="Statement">
	</cfif>
</cfif>

<CFIF len(#qGetVS_Statements_A.StatementA#) is not 0 or len(#qGetVS_Statements_P.StatementP#) is not 0 >	
<A HREF="index6.cfm?id=#qGetVS_Artist.custnumber#&Portfolio=#url.Portfolio#&Statement=1" target="_self"><font face="verdana, arial, helvetica, sans-serif" size="1"	color="##000000" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##000000';"><b>#statementword#</b></font></a><br><br>
</cfif>

<!--- <CFIF len(#qGetVS_Statements.StatementA#) is not 0 or len(#qGetVS_Statements.StatementP#) is not 0 >	
<A HREF="statement.cfm?id=#url.id#" target="mainFrame"mainFrame"><font face="verdana, arial, helvetica, sans-serif" size="1"	color="##000000" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##000000';"><b>#statementword#</b></font></a><br><br>
</cfif> --->

<!--- <a href="index640.cfm?Portfolio=#url.portfolio#&id=#url.id#&image=#url.image#&imagePosition=#url.imagePosition#&Door=0" target=_parent><font face="verdana, arial, helvetica, sans-serif" size="1" color="##000000" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##000000';">Format for Small Screen</font></a></font></div> --->

<cfif qGetVS_MultiplePortfolios.recordcount GT 1 and left(url.door,1) is not 8 AND URL.DOOR IS NOT 4>	

	<cfif Isdefined("url.Gallery")>
			<cfset Gallery=#url.Gallery#>
		<cfelse>
			<cfset Gallery=0>
		</cfif>
<!--- <A href="../../../../index1.html" target="_parent"> --->
<CFIF qGetVS_Artist.FirstName eq "Twin">
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
	<A href="../photoVS_/homepagePSNew.cfm" target="_top"> 


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
	<A href="../../templates/searchVS_PowerSearch.cfm?Include=1&Gallery=1&Keyword=#Keyword#" target="_top"> 	
	<cfelseif url.door is 8>
		<cfset keyword= REPLACE(#URL.KEYWORD#," ","%20","All")>  	
	<A href="../../templates/searchVS_keywords.cfm?Gallery=#url.gallery#&keyword=#keyword#*" 		target="_top"> 

	
	
	<cfelseif url.door is 82>
		<cfset keyword= REPLACE(#URL.KEYWORD#," ","%20","All")>  
	<A href="../../templates/searchVS_PowerSearch.cfm?Include=1&Gallery=2&Keyword=#Keyword#" target="_top"> 	
	
	<cfelseif url.door is 83>
		<cfset keyword= REPLACE(#URL.KEYWORD#," ","%20","All")>  
	<A href="../../templates/searchVS_PowerSearch.cfm?Include=1&Gallery=3&Keyword=#Keyword#" target="_top"> 			

		<cfif Isdefined("url.Gallery")>
			<cfset Gallery=#url.Gallery#>
		<cfelse>
			<cfset Gallery=0>
		</cfif>
	<cfset keyword= REPLACE(#URL.KEYWORD#," ","%20","All")>  	
	<A href="../../templates/searchVS_keywords.cfm?Gallery=#url.gallery#&keyword=#keyword#*" 		target="_top"> 

	<cfelseif url.door is 9 and Gallery is 0>
	<A href="../indexFormats.cfm?Include=1&Gallery=0" target="_top"> 

	<cfelseif url.door is 9>
		<cfif Isdefined("url.Gallery")>
			<cfset Gallery=#url.Gallery#>
		<cfelse>
			<cfset Gallery=0>
		</cfif>

		<A href="../Formats.cfm?Include=1&Gallery=#url.Gallery#" target="_top"> 

	</cfif><!--- <font face="verdana, arial, helvetica, sans-serif" size="1" color="##000000" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##000000';"><b>Close Portfolio</b></font></a></font>< ---></div> 
</cfif>
<!--- <BR><BR>
<a href="index3.cfm?image=1&id=183070&imagePosition=1&Door=2&Portfolio=Portfolio1&Gallery=2" target="mainFrame">
<font face="verdana, arial, helvetica, sans-serif" size="4" color="##000000" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##000000';">::::</font></a> --->



</td>
<!--- The image area --->
<!--- First BGcolor --->
<CFSET Background1 = 'DDDDDD'>
<CFSET Background2 = 'DDDDDD'>
<CFSET Background3 = 'DDDDDD'>
    <td colspan="3" BGCOLOR="###Background1#" valign="top"><cfset counter=1>  
                <!---Determine how many images there are---> 
			<cfset imagecount = #qGetVS_Images.recordcount#>
<!--- 			<cfloop index="fieldincrementer" from="1" to="40" step="1">
			<cfset urladdress="http://www.visualserver.com/artists/#qGetVS_Artist.Subdirectory#/#Portfolio#/Images_Large/image#fieldincrementer#.jpg">
      
	  <CFHTTP URL = "#urladdress#"
         method = "GET"
         RESOLVEURL = YES>
      </CFHTTP>
	  
<cfif CFHTTP.FileContent is 'ÿØÿà'>
	<cfset imagecount = imagecount + 1>
</cfif>

<!--- 
<CFIF FileExists(urlencodedformat(#urladdress#))>
					<cfset imagecount = imagecount + 1>
				</cfif> --->
			</cfloop> --->

<!--- Inelegant, case specific code for Twin Towers (when image 8 is marked not to be shown, the index doesn't show it, but, in return, looks for one image too many at the end. --->
<CFIF (qGetVS_Portfolio.custnumber eq "81037") and (qGetVS_Portfolio.Subdirectory eq "Portfolio1")>
	<CFSET imagecount = imagecount -1>
</CFIF>
<!--- END: Inelegant, case specific code for Twin Towers --->
			<table><tr> <td height="1"><img src="../../img/spacer.gif" width="1" height="1"></td></tr></table>
			<table border="0" cellspacing="0" cellpadding="0" width="500" align="left">
 			 <tr align="center" valign="middle"> 
<cfif url.statement is 1>
<td>
	<cfinclude template="VS_statement.cfm"> 
<cfelseif url.BIO is 1>
<td>
	<cfinclude template="VS_bio.cfm"> 

<cfelseif url.books is 1>
<td>
	<cfinclude template="VS_books.cfm">
	
	<cfelseif url.galleries is 1>
<td>
	<cfinclude template="VS_galleries.cfm">
	
	<cfelseif url.gallerydetails is 1>
<td>
	<cfinclude template="VS_addressdetails.cfm">

	<cfelseif url.books is 1>
<td>
	<cfinclude template="VS_books.cfm">
	
<cfelseif url.contact is 1>
<td>
	<cfinclude template="VS_contact.cfm"> 
<cfelseif url.enlarge2 is 1>
<CFQUERY NAME="qGetVS_Images"  DATASOURCE="photoeyecom">
  	SELECT top 1 *
 	FROM vs_Images where custnumber='#url.id#' and PortfolioName='#url.portfolio#' and Imagenumber=#url.image#
	order by imageposition;
</CFQUERY>	


 <CFQUERY NAME="qGetVS_ImagesAddInfo1"  DATASOURCE="photoeyecom">
  	SELECT Distinct *
 	FROM VS_Images I INNER JOIN VS_Images_AddInfo1 A on I.Catalog=A.Catalog   
	order by I.imageposition;
</CFQUERY>	

<td>
	<cfinclude template="VS_enlarge.cfm"> 
	
<cfelseif url.enlarge is 1>
<CFQUERY NAME="qGetVS_Images"  DATASOURCE="photoeyecom">
  	SELECT top 1 *
 	FROM VS_Images I INNER JOIN VS_Images_Caption1 C on I.Catalog=C.Catalog  where I.custnumber='#url.id#' and I.PortfolioName='#url.portfolio#' and I.Imagenumber=#url.image#
	order by I.imageposition;
</CFQUERY>	

 <CFQUERY NAME="qGetVS_ImagesAddInfo1"  DATASOURCE="photoeyecom">
  	SELECT Distinct *
 	FROM VS_Images I INNER JOIN VS_Images_AddInfo1 A on I.Catalog=A.Catalog   where I.custnumber='#url.id#' and I.PortfolioName='#url.portfolio#' and I.Imagenumber=#url.image#
	order by I.imageposition;
</CFQUERY>	

 
<td>

<!--- Second Background Color --->
    <td colspan="3" BGCOLOR="###Background2#" valign="top">

<CFINCLUDE TEMPLATE="../../templates/UserIdentification.cfm">
<div align="center">




<input type="hidden" name="UserID" value="#Cookie.UserIdNumber#">
<input type="hidden" name="NumCopies" value="1">
<input type="hidden" name="Binding" value="Photograph">
<input type="hidden" name="ListPrice" value="#qGetDetails.Soft_price#">
<input type="hidden" name="SalePrice" value="0">
<input type="hidden" name="RecordID" value="#qGetDetails.recordID#">
<input type="hidden" name="Catnum" value="#qGetDetails.Catalog#">
<cfset ArtistF =  #Replace(qGetVS_Artist.FirstName," ","","All")#>
<cfset ArtistL =  #Replace(qGetVS_Artist.LastName," ","","All")#>
<cfset ArtistF =  #Replace(qGetVS_Artist.FirstName,"'","","All")#>
<cfset ArtistL =  #Replace(qGetVS_Artist.LastName,"'","","All")#>

<input type="hidden" name="ArtistF" value="#ArtistF#">
<input type="hidden" name="ArtistL" value="#ArtistL#">



<FORM ACTION="../../templates/AddtoCartGalleriesNew.cfm?userid=#Cookie.UserIdNumber#&NumCopies=1&Binding=Photography&Listprice=#qGetDetails.Soft_price#&SalePrice=0&RecordID=#qGetDetails.recordID#&Catnum=#qGetDetails.Catalog#&ArtistF=#ArtistF#&ArtistL=#ArtistL#&VS_=1" METHOD="POST" target="_top">

<!--- <FORM ACTION="../../templates/AddtoCartGallerySale.cfm" METHOD="POST" target="_top"> --->
<center>
          
			
			
						  <cfset imagecount=#qGetVS_Portfolio.imgqty#>
		
		  <cfset xNext=#url.imageposition#+1>
		  <cfif xNext GT #imagecount#>
		  	 <cfset xNext=1>
		 </cfif>
		  <cfset xPrevious=#url.imageposition#-1>
		  <cfif xPrevious LT 1>
		  	<cfset xPrevious=#imagecount#>
		  </cfif> 
			<CFIF xPan is 0>
			    <table height="80%" cellpadding="5" align="center" width="100%">
     			 <tr align="right"> 
        			<td height="80%"> 
         <!--- Third Background Color ###Background3#--->
		 	 <table height="100" cellpadding="5" align="center" width="100%" bgcolor="###Background3#">
             <tr valign="bottom" height="165" align="left"> 
			  <td width="65%" height="*" rowspan="2" valign="top" align="right">
			    <div align="right"><a href="index6.cfm?image=#qGetVS_Images.imagenumber#&id=#url.id#&Portfolio=#url.portfolio#&enlarge2=1"><!--- #qGetVS_Images.imageposition# --->

<!--- ImageSizer --->					
<cfset xheight=240>
<cfset xwidth=500>
<!--- <cfset xImageAddress="#xRelativePath#\Artists\#qGetVS_Artist.Subdirectory#\#Portfolio#\Images_Large\"> --->
<cfset xImageAddress="#xRelativePath#\Users\#qGetVS_Images.folderid#\">

<cfset xAlt = "Enter Gallery">
<!--- <cfset xImage = "Image#qGetVS_Images.imageNUMBER#.jpg"> --->
<!--- <cfset xImage = "Image#url.image#.jpg"> --->
<cfset xImage = "#qGetVS_Images.filename#">

<cfinclude template="../../templates/imagesizer.cfm">

<img src="../../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a></DIV>
<cfif #imagecr.width# GT 200>
<DIV ALIGN="center">
<cfelse>
<DIV ALIGN="right">
</cfif><br>
<!--- End ImageSizer --->
			  <a href="index6.cfm?image=#xPrevious#&id=#url.id#&imagePosition=#xPrevious#&Door=2&Portfolio=#url.portfolio#&Gallery=2&Enlarge=1" target="_self"><font face="verdana, arial, helvetica, sans-serif" size="1" color="###FONT1#" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='###FONT1#';"><</font></a>&nbsp;&nbsp;&nbsp;
		  <a href="index6.cfm?image=#xPrevious#&id=#url.id#&imagePosition=#xPrevious#&Door=2&Portfolio=#url.portfolio#&Gallery=2" target="_self"><font face="verdana, arial, helvetica, sans-serif" size="1" color="###FONT1#" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='###FONT1#';">::::</font></a> 
		  
		  &nbsp;&nbsp;&nbsp;<a href="index6.cfm?image=#xnext#&id=#url.id#&imagePosition=#xnext#&Door=2&Portfolio=#url.portfolio#&Gallery=2&Enlarge=1" target="_self"><font face="verdana, arial, helvetica, sans-serif" size="1" color="###FONT1#" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='###FONT1#';">></font></a><cfif #imagecr.width# lT 200>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</cfif></div>
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
			    <div align="center"><a href="pages_enlarge/Image1b.cfm?image=#qGetVS_Images.imagenumber#&id=#url.id#&Portfolio=#url.portfolio#"><!--- #qGetVS_Images.imageposition# --->

<!--- ImageSizer --->									
<cfset xheight=240>
<cfset xwidth=500>
<!--- <cfset xImageAddress="#xRelativePath#\Artists\#qGetVS_Artist.Subdirectory#\#Portfolio#\Images_Large\"> --->
<cfset xImageAddress="#xRelativePath#\Users\#qGetVS_Images.folderid#\">

<cfset xAlt = "Enter Gallery">
<!--- <cfset xImage = "Image#qGetVS_Images.imageNUMBER#.jpg"> --->
<cfset xImage = "#qGetVS_Images.filename#"> 

<cfinclude template="../../templates/imagesizer.cfm">

<img src="../../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a></DIV>
<!--- End ImageSizer --->
				<DIV ALIGN="CENTER"><br> <!--- Navigator --->
			  <a href="index6.cfm?image=#xPrevious#&id=#url.id#&imagePosition=#xPrevious#&Door=2&Portfolio=#url.portfolio#&Gallery=2&Enlarge=1" target="_self"><font face="verdana, arial, helvetica, sans-serif" size="2" color="###FONT1#" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='###FONT1#';"><</font></a>&nbsp;&nbsp;&nbsp;
		  <a href="index6.cfm?image=#xPrevious#&id=#url.id#&imagePosition=#xPrevious#&Door=2&Portfolio=#url.portfolio#&Gallery=2" target="_self"><font face="verdana, arial, helvetica, sans-serif" size="2" color="###FONT1#" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='###FONT1#';">::::</font></a> 
		  
		  &nbsp;&nbsp;&nbsp;<a href="index6.cfm?image=#xnext#&id=#url.id#&imagePosition=#xnext#&Door=2&Portfolio=#url.portfolio#&Gallery=2&Enlarge=1" target="_self"><font face="verdana, arial, helvetica, sans-serif" size="2" color="###FONT1#" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='###FONT1#';">></font></a></div>
				

              </td>
			 

			  </tr>
			</TABLE>
			<TABLE WIDTH="100%">
			   <tr> 
				 <td width="100%" align="right" valign="bottom">	
				 
				 <TABLE><TR><TD ALIGN="Left">
			 </cfif>
             
			  
              

			 		  <font face="verdana, arial, helvetica, sans-serif" size="1" color="###Font1#" style="TEXT-DECORATION: none">
	          <b>
			<cfif #qGetVS_Artist.MultiArtists# is 1>

				  
				  <!--- Image Title --->
				  
				  <cfif len(#qGetVS_Images.title#) GT 0>
						 <cfif len(trim(#qGetVS_Images.yearprod#)) GT 0  and FIND(#qGetVS_Images.yearprod#,#qGetVS_Images.title#) is 0>
						   #qGetVS_Images.title#,
						 <cfelse>
						   #qGetVS_Images.title#
						 </cfif>
				 <cfelse>
						 <cfif len(trim(#qGetVS_Images.yearprod#)) GT 0  and FIND(#qGetVS_Images.yearprod#,#qGetVS_Images.title#) is 0>
						   #qGetVS_Images_Default.title#,
						 <cfelse>
						   #qGetVS_Images_Default.title#
						 </cfif>
				 </cfif>
				  <cfif len(trim(#qGetVS_Images.yearprod#)) GT 0 and FIND(#qGetVS_Images.yearprod#,#qGetVS_Images.title#) is 0>
						 #qGetVS_Images.yearprod#
				 <cfelseif len(trim(#qGetVS_Images_Default.yearprod#)) GT 0 and #qGetVS_Images.default3# is 1 and FIND(#qGetVS_Images.yearprod#,#qGetVS_Images.title#) is 0>

						 #qGetVS_Images_Default.yearprod#
				<cfelse>
				 </cfif>			 
				 <BR><BR>Photograph by <BR>#qGetVS_Images.firstname# #qGetVS_Images.lastname#<br><br>
				 
				 
				
				<cfelse>
				  <!--- Portfolio Title --->
				  <cfif len(#qGetVS_Images_Default.portfolioName#) is 0 and #qGetVS_PortfolioQTY.recordcount# GT 1>
						
     					<font color="###Font2#"> #left(qGetVS_Portfolio.Subdirectory,9)# #mid(qGetVS_Portfolio.Subdirectory,10,2)#</font><br><br>
				 <cfelse>
<font color="###Font3#">
				 #qGetVS_Images_Default.portfolioName#</font><br><br>
				  </cfif>
				  			  
				  <!--- Portfolio Introduction --->
					  <cfif len(#qGetVS_Portfolio.portfoliointro#) GT 0 and #qGetVS_Images.imagenumber# is 1 and #len(qGetVS_Images_Default.portfolioName)# GT 0>
						 <A HREF="javascript:popUp('PortfolioIntro.cfm?id=#url.id#&IMAGENUMBER=#url.image#&PORTFOLIO=#url.portfolio#','myWindowEnlarge',630,460,'auto');">
      <font face="verdana, arial, helvetica, sans-serif" size="1" color="###Font4#" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='###Font4#';">
      Introduction</font></a><br><br><br>
	  
	  					<cfelseif len(#qGetVS_Portfolio.portfoliointro#) GT 0 and #qGetVS_Images.imagenumber# is 1>
						<A HREF="javascript:popUp('PortfolioIntro.cfm?id=#url.id#&IMAGENUMBER=#url.image#&PORTFOLIO=#url.portfolio#','myWindowEnlarge',630,460,'auto');">
      <font face="verdana, arial, helvetica, sans-serif" size="1" color="###Font5#" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='###Font5#';">
      #qGetVS_Portfolio.Title#<br>Introduction</font></a><br><br><br>
				  </cfif>			  
				  
				  <!--- Image Title --->
				  
				  <cfif len(#qGetVS_Images.title#) GT 0>
						 <cfif len(trim(#qGetVS_Images.yearprod#)) GT 0  and FIND(#qGetVS_Images.yearprod#,#qGetVS_Images.title#) is 0>
						   #qGetVS_Images.title#,
						 <cfelse>
						   #qGetVS_Images.title#
						 </cfif>
				 <cfelse>
						 <cfif len(trim(#qGetVS_Images.yearprod#)) GT 0  and FIND(#qGetVS_Images.yearprod#,#qGetVS_Images.title#) is 0>
						   #qGetVS_Images_Default.title#,
						 <cfelse>
						   #qGetVS_Images_Default.title#
						 </cfif>
				 </cfif>
				  <cfif len(trim(#qGetVS_Images.yearprod#)) GT 0 and FIND(#qGetVS_Images.yearprod#,#qGetVS_Images.title#) is 0>
						 #qGetVS_Images.yearprod#<br><br>
				 <cfelseif len(trim(#qGetVS_Images_Default.yearprod#)) GT 0 and #qGetVS_Images.default3# is 1 and FIND(#qGetVS_Images.yearprod#,#qGetVS_Images.title#) is 0>

						 #qGetVS_Images_Default.yearprod#<br><br>
				<cfelse>
				 <br>
				 </cfif>			 
				
			</cfif>
				  		  
<!--- 				  <cfif len(#qGetVS_Images_Default.portfolioName#) GT 0 and #qGetVS_Images.imagenumber# is 1 and #left(qGetVS_Portfolio.Subdirectory,9)# is not #left(qGetVS_Images_Default.portfolioName,9)#>
						
     					<font color="##FFFF99"> #left(qGetVS_Portfolio.Subdirectory,9)# #mid(qGetVS_Portfolio.Subdirectory,10,2)#<br>  
#qGetVS_Images_Default.portfolioName#</font><br><br>
				 <cfelseif len(#qGetVS_Images_Default.portfolioName#) GT 0 and #qGetVS_Images.imagenumber# is 1>
<font color="##FFFF99">
				 #qGetVS_Images_Default.portfolioName#</font><br><br>
				  </cfif> --->
				  
	
				 
<!--- 				 <cfif len(trim(#qGetVS_Images.yearprod#)) GT 0 and RIGHT(#qGetVS_Images.title#,4) is NOT #qGetVS_Images.yearprod#>
						 #qGetVS_Images.yearprod#<br>
				 <cfelseif len(trim(#qGetVS_Images_Default.yearprod#)) GT 0 and #qGetVS_IndividualInfo.default3# is 1 and RIGHT(#qGetVS_Images_Default.title#,4) is NOT #qGetVS_Images.yearprod#>
						 #qGetVS_Images_Default.yearprod#<br>
				<cfelse> --->
				
				</b>
				</font>
				<font face="Verdana, Arial, Helvetica, sans-serif" color="###Font6#" size="1">
				<b> 
                  <cfif len(#qGetVS_Images.caption1#) GT 0>
						 <br><A HREF="javascript:popUp('caption.cfm?id=#url.id#&IMAGENUMBER=#url.image#&PORTFOLIO=#url.portfolio#','myWindowEnlarge',630,460);">
      <font face="verdana, arial, helvetica, sans-serif" size="1" color="###Font7#" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='SILVER';">
      Caption</font></a><br><br>
<!--- 				 <cfelseif len(#qGetVS_Images_Default.caption1#) GT 0>
						 #qGetVS_Images_Default.caption1# <br> --->
				 </cfif>                
				 
                 <cfif len(#qGetVS_Images.medium#) GT 0 and #qGetVS_Images.medium# is NOT 'Other Medium'>
						#qGetVS_Images.medium# <br> 
				 <cfelseif len(#qGetVS_Images.othermed#) GT 0> 					#qGetVS_Images.othermed# <br>
				 <cfelseif len(#qGetVS_Images_Default.othermed#) GT 0> 					#qGetVS_Images_Default.othermed# <br>
				 <cfelseif len(#qGetVS_Images_Default.medium#) GT 0> 					#qGetVS_Images_Default.medium# <br>
				 </cfif>
				 
                 <cfif val(#qGetVS_Images.width1#) GT 1>
				      #qGetVS_Images.height1#x#qGetVS_Images.width1#&quot; Image<br>
			 <!--- Make sure that there is a width size that exists --->
					<cfelseif val(#qGetVS_Images_Default.width1#) is 1 and val(#qGetVS_Images_Default.height1#) is 1>
				Image Size Varies<br>
					  <cfelseif val(#qGetVS_Images_Default.width1#) GT 0>
 #qGetVS_Images_Default.height1#x#qGetVS_Images_Default.width1#&quot; Image<br>
				 </cfif>  
	
				  
				  <!--- Mat --->
				  <!--- Individual Photos --->
				  <cfif (val(#qGetVS_Images.Matwidth1#) GT 0) or (VAL(#qGetVS_Images.default4#) is 0)>
				 	<cfif #qGetVS_Images.unmatted# is 1>
					 	 Unmatted<br>
					 	<!--- Make sure that there is a mat size that exists --->
					  <cfelseif val(#qGetVS_Images.Matwidth1#) GT 1>
					 	<!--- if Default Mat is the same size as the print, assume that it is unmatted>--->
						<cfif #qGetVS_Images.matheight1# is #qGetVS_Images.height1# and 
#qGetVS_Images.matwidth1# is #qGetVS_Images.width1#>
						Mat size varies<br>
						<cfelse> #qGetVS_Images.matheight1#x#qGetVS_Images.matwidth1#&quot; Mat<br>
						</cfif>
					  </cfif>  		
				 <cfelse>
				 	<!--- Default Photos --->
					  <cfif #qGetVS_Images_Default.unmatted# is 1 >
					 	Unmatted<br> 
					 <!--- Make sure that there is a mat size that exists --->
					  <cfelseif val(#qGetVS_Images_Default.Matwidth1#) GT 0>
		  				<!--- if Mat is the same size as the print, assume that it is unmatted>--->
						<cfif #qGetVS_Images_Default.matheight1# is #qGetVS_Images_Default.height1# and 
#qGetVS_Images_Default.matwidth1# is #qGetVS_Images_Default.width1#>
						Mat size varies<br>
						<cfelse>
 #qGetVS_Images_Default.matheight1#x#qGetVS_Images_Default.matwidth1#&quot; Mat <br>			
						</cfif>
					  </cfif> 	 
				 </cfif>
				 
				 	<!--- If len(Edition No) is 0 --->
			<cfif #qGetVS_Images.Editioned1# is 1 and (#len(trim(qGetVS_Images.EditionNo1))# is 0 or #qGetVS_Images.EditionNo1# is 0) and #len(trim(qGetVS_Images.EditionSz1))# GT 0>
Edition of #qGetVS_Images.EditionSz1#<br> 

			 <cfelseif #qGetVS_Images.Default5# is 1 and  #qGetVS_Images_Default.Editioned1# is 1 and (#len(trim(qGetVS_Images_Default.EditionNo1))# is 0 or #qGetVS_Images.EditionNo1# is 0)>		
Edition of #qGetVS_Images_Default.EditionSz1#<br>  
				 <cfelseif #qGetVS_Images.Editioned1# is 1 and #len(qGetVS_Images.EditionNo1)# GT 0 and #len(qGetVS_Images.EditionSz1)# GT 0>	#qGetVS_Images.EditionNo1#/#qGetVS_Images.EditionSz1#<br> 
				 <cfelseif #qGetVS_Images.Default5# is 1 and  #qGetVS_Images_Default.Editioned1# is 1>		#qGetVS_Images_Default.EditionNo1#/#qGetVS_Images_Default.EditionSz1#<br>
				 </cfif>
				 
				 
<!--- 				 <cfif #qGetVS_Images.Editioned1# is 1 and #len(qGetVS_Images.EditionNo1)# GT 0 and #len(qGetVS_Images.EditionSz1)# GT 0>	#qGetVS_Images.EditionNo1#/#qGetVS_Images.EditionSz1#<br> 
				 <cfelseif #qGetVS_Images.Default5# is 1 and  #qGetVS_Images_Default.Editioned1# is 1>		#qGetVS_Images_Default.EditionNo1#/#qGetVS_Images_Default.EditionSz1#<br>
				 </cfif> --->		 
				  <cfif (#qGetVS_Images.defaultnfs# is 1 and qGetVS_Images_Default.notavailable is 5) or (#qGetVS_Images.defaultnfs# is 0 and qGetVS_Images.notavailable is 5)>				
                 <cfelseif #qGetVS_Images.price1# GT 0 and  qGetVS_Images.NotAvailable is 0 and #qGetVS_Images.defaultNFS# is 1>
						$#qGetVS_Images.price1# <cfif #qGetVS_Images_Default.PortfolioPrice# is 1>Portfolio Price</cfif><br> 
				 <cfelseif #qGetVS_Images_Default.price1# GT 0 and #qGetVS_Images_Default.NotAvailable# is 0 and #qGetVS_Images.defaultNFS# is  1>
					$#qGetVS_Images_Default.price1# <cfif #qGetVS_Images_Default.PortfolioPrice# is 1>Portfolio Price</cfif><br>
				 </cfif>
				 
				<CFIF len(#qGetVS_ImagesAddInfo1.AddInfo1#) is not 0> 
    
    				<br><br><A HREF="javascript:popUp('printinfoMiddle.cfm?id=#url.id#&IMAGENUMBER=#url.image#&PORTFOLIO=#url.portfolio#','myWindowEnlarge',630,460);">
      <font face="verdana, arial, helvetica, sans-serif" size="1" color="###Font8#" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='###Font8#';">
      Print Info</font></a></td>
   				<cfelseif len(#qGetVS_Images_Default.AddInfo1#) is not 0>
         <br><br><A HREF="javascript:popUp('printinfoMiddle.cfm?id=#url.id#&IMAGENUMBER=#url.image#&PORTFOLIO=#url.portfolio#','myWindowEnlarge',630,460);">
      <font face="verdana, arial, helvetica, sans-serif" size="1" color="###Font8#" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='###Font8#';">
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
				
				
				<cfif #qGetVS_Portfolio.Backgroundcolor# is "333333">
					<cfif (qGetVS_Images.NotAvailable is 5 and #qGetVS_Images.defaultNFS# is 0) or (qGetVS_Images_Default.NotAvailable is 5 and #qGetVS_Images.defaultNFS# is 1)>
					 <a href="mailto:gallery@photoeye.com?Subject=#qGetVS_Artist.FirstName# #qGetVS_Artist.LastName# Price Inquiry"><font face="verdana, arial, helvetica, sans-serif" size="1" color="###Font9#" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='Silver';"><strong>Price Upon Request</strong></font></a><br>
					<cfelseif (qGetVS_Images.NotAvailable is 0 and #qGetVS_Images.defaultNFS# is 0) or (qGetVS_Images_Default.NotAvailable is 0 and #qGetVS_Images.defaultNFS# is 1)>
					<cfif photoeye is 0>
						<!--- <a href="javascript:popUp('galleries.cfm?id=#url.id#','MyWindowVS_','600','490','no');"> ---><!--- <img src="../../img/purchaseprint.gif" width="90" height="15" alt="" border="0" name="img2"> ---><a href="index6.cfm?id=#url.id#&galleries=1"  target="_self"><font face="verdana, arial, helvetica, sans-serif" size="1" color="###Font12#" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='###Font12#';">$ Purchase Print</font></a>
					<cfelse>
						<input type="image" src="../sharedimages/purchaseprintGray_transpare.gif" align="absmiddle" width="90" height="15" border="0"><br>
					</cfif>
					<cfelseif (qGetVS_Images.NotAvailable is 1 and #qGetVS_Images.defaultNFS# is 0) or (qGetVS_Images_Default.NotAvailable is 1 and #qGetVS_Images.defaultNFS# is 1)>
					 <font face="verdana, arial, helvetica, sans-serif" size="1" color="###Font10#" style="TEXT-DECORATION: none">Sold Out</font><br>
					<cfelseif (qGetVS_Images.NotAvailable is 2 and #qGetVS_Images.defaultNFS# is 0) or (qGetVS_Images_Default.NotAvailable is 2 and #qGetVS_Images.defaultNFS# is 1)>
					 <font face="verdana, arial, helvetica, sans-serif" size="1" color="###Font11#" style="TEXT-DECORATION: none">Reserved</font><br>
					<cfelseif (qGetVS_Images.NotAvailable is 3 and #qGetVS_Images.defaultNFS# is 0) or (qGetVS_Images_Default.NotAvailable is 3 and #qGetVS_Images.defaultNFS# is 1)>
					 <font face="verdana, arial, helvetica, sans-serif" size="1" color="###Font11#" style="TEXT-DECORATION: none">Not for Sale</font><br>
					</cfif>
  				  <img src="../SharedImages/dot_clear.gif" width="1" height="20" alt="" border="0">  <a href="index6.cfm?image=#qGetVS_Images.imagenumber#&id=#url.id#&Portfolio=#url.portfolio#&enlarge2=1" target="_self"><font face="verdana, arial, helvetica, sans-serif" size="1" color="###Font5#" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='###Font5#';">+ Enlarge</font><!--- <a href="pages_enlarge/Image1b.cfm?image=#qGetVS_Images.imagenumber#&id=#url.id#&Portfolio=#url.portfolio#"><img src="../sharedimages/enlargeGray2.gif" width="90" height="15" alt="" border="0" name="img2"> ---></a>  <!---#qGetVS_Images.imageposition# --->
                 <cfelse>
					<cfif (qGetVS_Images.NotAvailable is 5 and #qGetVS_Images.defaultNFS# is 0) or (qGetVS_Images_Default.NotAvailable is 5 and #qGetVS_Images.defaultNFS# is 1)>
					 <a href="mailto:gallery@photoeye.com?Subject=#qGetVS_Artist.FirstName# #qGetVS_Artist.LastName# Price Inquiry"><font face="verdana, arial, helvetica, sans-serif" size="1" color="###Font12#" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='silver';"><strong>Price Upon Request</strong></font></a><br>
					<cfelseif (qGetVS_Images.NotAvailable is 0 and #qGetVS_Images.defaultNFS# is 0) or (qGetVS_Images_Default.NotAvailable is 0 and #qGetVS_Images.defaultNFS# is 1)>
					<input type="image" src="../sharedimages/purchaseprint.gif" align="absmiddle" width="90" height="15" border="0"><br>
					<cfelseif (qGetVS_Images.NotAvailable is 1 and #qGetVS_Images.defaultNFS# is 0) or (qGetVS_Images_Default.NotAvailable is 1 and #qGetVS_Images.defaultNFS# is 1)>
					 <font face="verdana, arial, helvetica, sans-serif" size="1" color="###Font12#" style="TEXT-DECORATION: none">Sold Out</font><br>
					<cfelseif (qGetVS_Images.NotAvailable is 2 and #qGetVS_Images.defaultNFS# is 0) or (qGetVS_Images_Default.NotAvailable is 2 and #qGetVS_Images.defaultNFS# is 1)>
					 <font face="verdana, arial, helvetica, sans-serif" size="1" color="###Font12#" style="TEXT-DECORATION: none">Reserved</font><br>
					<cfelseif (qGetVS_Images.NotAvailable is 3 and #qGetVS_Images.defaultNFS# is 0) or (qGetVS_Images_Default.NotAvailable is 3 and #qGetVS_Images.defaultNFS# is 1)>
					 <font face="verdana, arial, helvetica, sans-serif" size="1" color="###Font12#" style="TEXT-DECORATION: none">Not for Sale</font><br>
					</cfif>
						   <img src="../SharedImages/dot_clear.gif" width="1" height="20" alt="" border="0"><!--- <a href="pages_enlarge/Image1b.cfm?image=#qGetVS_Images.imagenumber#&id=#url.id#&Portfolio=#url.portfolio#"> ---><<a href="index6.cfm?image=#qGetVS_Images.imagenumber#&id=#url.id#&Portfolio=#url.portfolio#&enlarge2=1" target="_self"><font face="verdana, arial, helvetica, sans-serif" size="1" color="###Font5#" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='###Font5#';">+ Enlarge</font><!--- <img src="../sharedimages/enlarge.gif" width="90" height="15" alt="" border="0" name="img2"> ---></a><!---  image=#image#&id=#url.id# ---><!--- #qGetVS_Images.imageposition# --->
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
<!--- 		  <cfset imagecount=#qGetVS_Portfolio.imgqty#>
		
		  <cfset xNext=#url.imageposition#+1>
		  <cfif xNext GT #imagecount#>
		  	 <cfset xNext=1>
		 </cfif>
		  <cfset xPrevious=#url.imageposition#-1>
		  <cfif xPrevious LT 1>
		  	<cfset xPrevious=#imagecount#>
		  </cfif> --->
		  <table align="left"><tr><td height="10	"></td></tr><tr><td></td></tr></table>
        </td>
      </tr>
    </table>

  </center>

</form></td>
<cfelse>

  		<cfloop QUERY=qGetVS_Images startrow="1" endrow="#imagecount#">
			<cfif counter is 5>
				<cfset counter=1>
				</tr><tr><td height="20"></td></tr><tr>
			</cfif>
			 <td height="50"><img src="../../img/spacer.gif" width="30" height="1"></td><td width="70" align="left" valign="middle">
<!--- 	<cfif counter is 1>	
				<font size=1 face="verdana, arial, helvetica, sans-serif" color="silver">
			<br>Jury's Selected Images</font><br><br>
		</cfif>  --->
		<a href="Index6.cfm?image=#qGetVS_Images.imageposition#&id=#url.id#&Portfolio=#url.portfolio#&Enlarge=1"> 


<!--- ImageSizer --->									
<CFIF xPan is 1>
	<cfset xheight=120>
	<cfset xwidth=500>
<CFELSE>
	<cfset xheight=90>
	<cfset xwidth=90>
</CFIF>		

<!--- <cfset xImageAddress="#xRelativePath#\Artists\#qGetVS_Artist.Subdirectory#\#Portfolio#\Images_Large\"> --->
<cfset xImageAddress="#xRelativePath#\Users\#qGetVS_Images.folderid#\">

<cfset xAlt = "Enter Gallery">
<!--- <cfset xImage = "Image#qGetVS_Images.imagenumber#.jpg"> --->
<cfset xImage = "#qGetVS_Images.filename#"> 

<cfinclude template="../../templates/imagesizer.cfm">

<img src="../../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a></td>
<!--- End ImageSizer --->
				



<cfset counter=counter+1>
<!--- <cfif counter is 5 and All is 0>
	<table border="0" cellspacing="0" cellpadding="0" width="85" height="25" align="center"><tr><td width="64" align="left" valign="middle">
	<font size=1 face="verdana, arial, helvetica, sans-serif" color="silver">
	<a href="scroll3.cfm?All=1&id=#url.id#&Portfolio=#url.portfolio#"><font color="##FFFF99" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseOver="this.color='Red';" onMouseOut="this.color='##FFFF99';"  style="TEXT-DECORATION: none">Additional Unselected Images</font></a>
	</font>
	</td></tr></table>
	<cfbreak>
<cfelseif counter is 5 and All is 1>
	<table border="0" cellspacing="0" cellpadding="0" width="85" height="25" align="center"><tr><td width="64" align="left" valign="middle">
	<font size=1 face="verdana, arial, helvetica, sans-serif" color="silver">
	Additional Unselected Images
	</font>
	</td></tr></table> 
</cfif> --->

	
	
			
		</cfloop>	
		
		</cfif>
</tr></table></td>
  </tr>
  <tr bgcolor="##CCCCCC">
    <td colspan="4" width="22%" align="right"><table><tr><td><span class="style4">© 2004, #qGetVS_Artist.Firstname#  #qGetVS_Artist.Lastname#, All Rights Reserved</span></td></tr><tr><td align="right"><span class="style4">Powered by <a href="http://www.visualserver.com" target="_blank"><font face="verdana, arial, helvetica, sans-serif" size="1" color="Maroon" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='Maroon';">VisualServer</FONT></a><font face="verdana, arial, helvetica, sans-serif" size="1" color="Navy">™</font></span></td>
  </tr>
</table>
</cfoutput>
</body>
</html>
