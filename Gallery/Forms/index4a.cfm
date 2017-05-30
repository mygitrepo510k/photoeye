<cfparam name="url.door" default="0">
<cfparam name="url.gallery" default="0">
<cfparam name="url.page" default="0">
<CFQUERY NAME="qShowcaseArtist"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup where custnumber=#url.id#
</CFQUERY>

<CFQUERY NAME="qShowcaseArtist2"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup2 where custnumber=#url.id#
</CFQUERY>

<CFQUERY NAME="qShowcaseArtistBooks"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryArtistsBooks where custnumber=#url.id#
</CFQUERY>

<CFQUERY NAME="qGetShowcaseDefaultInfo"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryDefaultPhotos where Custnumber=#url.id# and SUBDIRECTORY='#url.portfolio#'
</CFQUERY>

<CFQUERY NAME="qGetShowcaseMultiplePortfolios"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryDefaultPhotos where Custnumber=#url.id# 
</CFQUERY>

<CFQUERY NAME="qGallerySetup2"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup2 where Custnumber=#url.id#
</CFQUERY>

<CFQUERY NAME="qGalleryStatements"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryArtistStatements where Custnumber=#url.id#
</CFQUERY>

<CFQUERY NAME="qShowcasePortfolio"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryPortfolio where Custnumber=#url.id# AND SUBDIRECTORY='#url.portfolio#'
</CFQUERY>

<CFQUERY NAME="qShowcaseMultiplePortfolios"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryPortfolio where Custnumber=#url.id# 
</CFQUERY>

<CFQUERY NAME="qGalleryBibliography"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryBibliography where Custnumber=#url.id# and LEN(Catalog)>0 
  ORDER BY YEAR DESC
</CFQUERY>
<!--- If no background paramater Exists, Make Background Black --->
<cfif #len(qShowcasePortfolio.Backgroundcolor)# GT 0>
	<cfset Background = #trim(qShowcasePortfolio.Backgroundcolor)#>
	<cfset BackgroundHeader = #trim(qShowcasePortfolio.BgHeaderColor)#>
<cfelse>
	<cfset Background = "000000">
	<cfset BackgroundHeader = "333333">
</cfif>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#CCCCCC">

<table align="right" height="209">
<tr><td height="50"></td></tr>
  <tr><td height="28" align="right" valign="top">
<cfoutput>
<font size="4" face="Verdana, Arial, Helvetica, sans-serif">
#qShowcaseArtist.Firstname# #qShowcaseArtist.Lastname#</font></cfoutput>
</td></tr><tr><td align="right" valign="top">
<br>
<cfoutput query="qGetShowcaseMultiplePortfolios">
<font face="Verdana, Arial, Helvetica, sans-serif"size="2">

<cfif url.portfolio is not SUBDIRECTORY>
<a href="index3.cfm?id=#qShowcaseArtist.custnumber#&Portfolio=#subdirectory#" target="mainFrame""><font face="verdana, arial, helvetica, sans-serif" size="2"	color="##000000" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##000000';">#PortfolioName#</font></a>
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

</td></tr></table>

</cfoutput>


</body>
</html>
