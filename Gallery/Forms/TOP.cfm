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
	<cfset BackgroundHeader = "000000">
</cfif>


<cfoutput>



<html>
<head>
<style type="text/css">
	A   {
		Text-decoration: none;
	}
	A.link, A.visited, A.hover, A.active   {
		
		TEXT-DECORATION: none;
		}
</style>	
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
<table  border="0" cellspacing="0" align="center">
  <tr align="Center" valign="bottom" bgcolor="##000000" valign="bottom"> 
  <td width="100">&nbsp;</td>
    <td align="center"><font face="Verdana, Arial, Helvetica, sans-serif" color="##000000" size="2"><font color="##CCCCCC"><b>#qShowcaseArtist.FirstName# #qShowcaseArtist.LastName#</b><font size="1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#qShowcaseArtist.Nationality#<cfif #len(qShowcaseArtist.Birth)# GT 0>, b.#qShowcaseArtist.Birth#</cfif>
      </font></font></font> </td>
	   <td align="right"><font color="gray" size="1" face="Arial, Helvetica, sans-serif"><b>bio | exhibitions | grants | contact</b></td>
	    <td width="100">&nbsp;</td>

  </tr>
  <tr><td width="100">&nbsp;</td><td colspan="3" align="center"><img src="../sharedimages/redlinetoc.gif" width="750" height=1 alt="" border="0"></td></tr>
</table>



</center>

</body>
</html>
</cfoutput>
