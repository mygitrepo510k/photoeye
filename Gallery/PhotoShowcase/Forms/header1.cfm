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


<cfoutput>



<html>
<head>
<title>photo-eye | #qShowcaseArtist.FirstName# #qShowcaseArtist.LastName#</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">


<script language="JavaScript">
<!-- hide from JavaScript-challenged browsers
var popupWin = null;
function popUp(myURL,myWindowName,w,h,scroll,menu){
var myLeft = ((screen.width-w)/2)-5; 
var myTop = ((screen.height-h)/2)-5;
var settings='height='+h+',width='+w+',top='+myTop+',left='+myLeft+',scrollbars=yes,resizable=no,menu='+menu 
popupWin=window.open(myURL,myWindowName,settings);
if(parseInt(navigator.appVersion) >= 4){popupWin.focus();}
}
 
// done hiding -->
</script>








</head>

<BODY bgcolor="###Background#" text="##CCCCCC" vlink="##CCCCCC" link="##CCCCCC" alink="Red">

<center>
<table width="470" border="0" cellspacing="0" align="center">
  <tr align="center" valign="middle" bgcolor="###BackgroundHeader#"> 
    <td  width="470" height="45"><font face="Verdana, Arial, Helvetica, sans-serif" color="##CCCCCC" size="2"><font color="##CCCCCC"><b>#qShowcaseArtist.FirstName# #qShowcaseArtist.LastName#</b><font size="1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#qShowcaseArtist.Nationality#<cfif #len(qShowcaseArtist.Birth)# GT 0>, b.#qShowcaseArtist.Birth#</cfif> <img height=1 src="../../dot_clear.gif" width=1><br><img src="../../../sharedimages/redlinetoc.gif" width="300" height=1 alt="" border="0">
      </font></font></font></td>

  </tr>
</table>

  <table width="470" border="0" cellspacing="0" align="center" height="29" cellpadding="0">
    <tr align="right" valign="top" bgcolor="###Background#"> 
      <td colspan="4" align="right" height="31"> 
        <div align="center">
		
<CFIF len(#qGalleryBibliography.Catalog#) is not 0>
		<A HREF="javascript:popUp('books.cfm?id=#url.id#','myWindowBooks',630,460);"><font face="verdana, arial, helvetica, sans-serif" size="1"	color="##CCCCCC" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##CCCCCC';"><b>Books 
          Available</b></font></a>&nbsp;&nbsp;&nbsp;<font size="2">|</font>&nbsp;&nbsp;
</cfif>
		  
		  

		  <font color="##CCCCCC"><A HREF="javascript:popUp('bio.cfm?id=#url.id#','myWindowBio',630,460);"><font face="verdana, arial, helvetica, sans-serif" size="1"	color="##CCCCCC" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##CCCCCC';"><b>Bio</b></font></a>&nbsp;&nbsp;&nbsp;<font size="2">|</font>&nbsp;&nbsp;

<!--- <CFIF len(#qGetShowcaseDefaultInfo.AddInfo1#) is not 0>	
<a href="printinfo.cfm?id=#url.id#" target=_parent><font face="verdana, arial, helvetica, sans-serif" size="1" color="##CCCCCC" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##CCCCCC';">Print Info</font></a>&nbsp;&nbsp;&nbsp;<font size="2">|</font>&nbsp;&nbsp;
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
<A HREF="javascript:popUp('statement.cfm?id=#url.id#','myWindowStatement',630,460);"><font face="verdana, arial, helvetica, sans-serif" size="1"	color="##CCCCCC" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##CCCCCC';"><b>#statementword#</b></font></a>&nbsp;&nbsp;&nbsp;<font size="2">|</font>&nbsp;&nbsp;
</cfif>

<!--- <a href="index640.cfm?Portfolio=#url.portfolio#&id=#url.id#&image=#url.image#&imagePosition=#url.imagePosition#&Door=0" target=_parent><font face="verdana, arial, helvetica, sans-serif" size="1" color="##CCCCCC" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##CCCCCC';">Format for Small Screen</font></a></font></div> --->

<cfif qShowcaseMultiplePortfolios.recordcount GT 1 and left(url.door,1) is not 8 AND URL.DOOR IS NOT 4>	

	<cfif Isdefined("url.Gallery")>
			<cfset Gallery=#url.Gallery#>
		<cfelse>
			<cfset Gallery=0>
		</cfif>
<!--- <A href="../../../../index1.html" target="_parent"> --->
<A href="homepage.cfm?id=#url.id#&door=#url.door#&Gallery=#url.gallery#&Page=#URL.Page#" target="_parent"> 
<font face="verdana, arial, helvetica, sans-serif" size="1" color="##CCCCCC" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##CCCCCC';"><b>Close Portfolio</b></font></a>

<cfelse>



	<cfif url.door is 4>
	<A href="javascript:parent.close();"> 


	<cfelseif url.door is 1>
	<A href="../../representedArtists/homepagePE.cfm" target="_top"> 


	<cfelseif url.door is 2>
	<A href="../../photoshowcase/homepagePSNew.cfm" target="_top"> 


	<cfelseif url.door is 3>
	<A href="../../magnumartists/homepageMA.cfm" target="_top"> 


	<cfelseif url.door is 51>
	<A href="../../ArtistsIndex.cfm?Include=1&Gallery=1&Page=#URL.Page#" target="_top"> 

	<cfelseif url.door is 52>
	<A href="../../ArtistsIndex.cfm?Include=1&Gallery=2&Page=#URL.Page#" target="_top"> 
	
	<cfelseif url.door is 53>
	<A href="../../ArtistsIndex.cfm?Include=1&Gallery=3&Page=#URL.Page#" target="_top"> 
		
	<cfelseif url.door is 6 and Gallery is 0>
	<A href="../../indexgenres.cfm?Include=1&Gallery=0" target="_top"> 

	<cfelseif url.door is 6>
		<cfif Isdefined("url.Gallery")>
			<cfset Gallery=#url.Gallery#>
		<cfelse>
			<cfset Gallery=0>
		</cfif>
	<A href="../../Genres.cfm?Include=1&Gallery=#url.Gallery#" target="_top"> 


	<cfelseif url.door is 7 and Gallery is 0>
	<A href="../../indexProcesses.cfm?Include=1&Gallery=0" target="_top"> 


		<cfelseif url.door is 7>
			<cfif Isdefined("url.Gallery")>
			<cfset Gallery=#url.Gallery#>
			<cfelse>
			<cfset Gallery=0>
		</cfif>
	<A href="../../Processes.cfm?Include=1&Gallery=#url.Gallery#" target="_top"> 


	<cfelseif url.door is 8 and Gallery is 0> <!--- DOOR 8 IS SUBJECT KEYWORDS --->

	<cfset keyword= REPLACE(#URL.KEYWORD#," ","%20","All")>  	
	<A href="../../indexsearch.cfm?Gallery=0&keyword=#keyword#*" target="_top"> 
	
	<cfelseif url.door is 80>
		<cfset keyword= REPLACE(#URL.KEYWORD#," ","%20","All")>  
	<A href="../../indexPowerSearch.cfm?Include=1&Gallery=0&Keyword=#Keyword#" target="_top"> 	
	
	<cfelseif url.door is 81>
		<cfset keyword= REPLACE(#URL.KEYWORD#," ","%20","All")>  
	<A href="../../../templates/searchshowcasePowerSearch.cfm?Include=1&Gallery=1&Keyword=#Keyword#" target="_top"> 	
	<cfelseif url.door is 8>
		<cfset keyword= REPLACE(#URL.KEYWORD#," ","%20","All")>  	
	<A href="../../../templates/searchshowcasekeywords.cfm?Gallery=#url.gallery#&keyword=#keyword#*" 		target="_top"> 

	
	
	<cfelseif url.door is 82>
		<cfset keyword= REPLACE(#URL.KEYWORD#," ","%20","All")>  
	<A href="../../../templates/searchshowcasePowerSearch.cfm?Include=1&Gallery=2&Keyword=#Keyword#" target="_top"> 	
	
	<cfelseif url.door is 83>
		<cfset keyword= REPLACE(#URL.KEYWORD#," ","%20","All")>  
	<A href="../../../templates/searchshowcasePowerSearch.cfm?Include=1&Gallery=3&Keyword=#Keyword#" target="_top"> 			

		<cfif Isdefined("url.Gallery")>
			<cfset Gallery=#url.Gallery#>
		<cfelse>
			<cfset Gallery=0>
		</cfif>
	<cfset keyword= REPLACE(#URL.KEYWORD#," ","%20","All")>  	
	<A href="../../../templates/searchshowcasekeywords.cfm?Gallery=#url.gallery#&keyword=#keyword#*" 		target="_top"> 

	<cfelseif url.door is 9 and Gallery is 0>
	<A href="../../indexFormats.cfm?Include=1&Gallery=0" target="_top"> 

	<cfelseif url.door is 9>
	<cfif Isdefined("url.Gallery")>
		<cfset Gallery=#url.Gallery#>
	<cfelse>
		<cfset Gallery=0>
	</cfif>
	<A href="../../Formats.cfm?Include=1&Gallery=#url.Gallery#" target="_top"> 

	</cfif><font face="verdana, arial, helvetica, sans-serif" size="1" color="##CCCCCC" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##CCCCCC';"><b>Close Portfolio</b></font></a></font></div> 
</cfif>

    </td>
  </tr>
</table>
</center>

</body>
</html>
</cfoutput>
