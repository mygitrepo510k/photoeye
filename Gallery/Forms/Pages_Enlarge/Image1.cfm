<cfparam name="url.door" default="1">	
<cfparam name="url.imageposition" default="1">					
<CFPARAM NAME="url.ExPage" DEFAULT="1">		
						

<CFQUERY NAME="qShowcaseArtist"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup where Custnumber=#url.id#
</CFQUERY>

<CFQUERY NAME="qShowcaseGalleryIndividualPhotos"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryIndividualPhotos where custnumber='#url.id#' AND IMAGENUMBER='#url.image#' 
</CFQUERY>

<CFQUERY NAME="qShowcaseGalleryDefaultPhotos"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryDefaultPhotos where custnumber='#url.id#' 
</CFQUERY>

<!---Update Stats--->
<!---If Record doesn't Exist, Create it!--->
<CFQUERY NAME="qStats"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryStats where custnumber='#url.id#' AND ImageNumber='#url.image#' 
</CFQUERY>



<cfparam name="xpan" default="0">							

 <CFQUERY NAME="qShowcasePortfolio"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryPortfolio where Custnumber=#url.id# AND SUBDIRECTORY='#url.portfolio#'
</CFQUERY>

<CFIF qShowcasePortfolio.Panorama is 1>
	<CFSET xPan = 1>
</CFIF>

<cfif #len(qShowcasePortfolio.Backgroundcolor)# GT 0>
	<cfset Background = #trim(qShowcasePortfolio.Backgroundcolor)#>
<cfelse>
	<cfset Background = "000000">
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
WHERE custnumber='#url.id#' AND ImageNumber=#url.image# AND Portfolio='#url.portfolio#'
</cfquery>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>photo-eye  | <cfoutput>#qShowcaseArtist.FirstName# #qShowcaseArtist.LastName#</cfoutput></title>


<script language="JavaScript">
<!-- hide from JavaScript-challenged browsers
var popupWin = null;
function popUp(myURL,myWindowName,w,h,scroll,menu){
var myHeight = ((screen.availHeight))-50;
var myWidth = ((screen.availWidth))-10;
var myLeft = 0; 
var myTop = 0;
var settings='height='+myHeight+',width='+myWidth+',top='+myTop+',left='+myLeft+',scrollbars=yes,resizable=yes,menu='+menu 
popupWin=window.open(myURL,myWindowName,settings);   
if(parseInt(navigator.appVersion) >= 4){popupWin.focus();}
}
 
// done hiding -->
</script>


</head>
<cfoutput>
<body bgcolor="###Background#" link="###Background#" vlink="###Background#" topmargin="0">

<table align="center" height="418">
  <tr> 
    <td height="10">&nbsp;</td>
  </tr>
  <tr> 
    <td><CFIF url.Door is 4> <a href="javascript:window.opener.top.location.href='../index.cfm?image=#image#&id=#url.id#&Portfolio=#url.portfolio#&Door=#url.Door#&imageposition=#url.imageposition#&ExPage=#url.ExPage#'; window.close()">
<cfelseif #qShowcasePortfolio.NoMaxEnlarge# is 0><a href="javascript:popUp('../Pages_MaxEnlarge/image1.cfm?image=#image#&id=#url.id#&Portfolio=#url.portfolio#','myWindowEnlarge',1012,710,'yes','no');">
<cfelse><a href="javascript:window.close();"></cfif>
	
<!--- ImageSizer --->	
<cfif xpan is 1>							
	<cfset xheight=450>
	<cfset xwidth=1800>
<cfelse>
	<cfset xheight=400>
	<cfset xwidth=550>
</cfif>	

<cfset xImageAddress="#xRelativePath#\Artists\#qShowcaseArtist.Subdirectory#\#Portfolio#\Images_Large\">
<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image#qShowcaseGalleryIndividualPhotos.imagenumber#.jpg">

<cfinclude template="../../../templates/imagesizer.cfm">

<img src="../../../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a></td>
<!--- End ImageSizer --->



</cfoutput>

  </tr>
  <TR><TD><cfinclude template="../Artistcopywrite.cfm"></TD></TR>
  <tr valign="middle"> 
    <td height="10" ALIGN="CENTER"> 

    <div align="left"><a href="javascript:window.close();"><font face="verdana, arial, helvetica, sans-serif" size="1" color="#999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='#999999';">< </font></a><a href="javascript:window.close();"><font face="verdana, arial, helvetica, sans-serif" size="1" color="#999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='#999999';">Close</font></a>&nbsp;&nbsp;&nbsp;&nbsp;
<cfif #qShowcasePortfolio.NoMaxEnlarge# is 0>
 <a href="javascript:popUp('../Pages_MaxEnlarge/image1.cfm?image=<cfoutput>#image#&id=#url.id#&Portfolio=#url.portfolio#</cfoutput>','myWindowEnlarge');"><font face="verdana, arial, helvetica, sans-serif" size="1" color="#999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='#999999';">+</font></a>
<a href="javascript:popUp('../Pages_MaxEnlarge/image1.cfm?image=<cfoutput>#image#&id=#url.id#&Portfolio=#url.portfolio#</cfoutput>','myWindowEnlarge');"><font face="verdana, arial, helvetica, sans-serif" size="1" color="#999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='#999999';"> 
              Enlarge</font></a>&nbsp;&nbsp;&nbsp;&nbsp;
</CFIF>
<CFIF url.Door is 4>
 <a href="javascript:window.opener.top.location.href='../index.cfm?image=<cfoutput>#image#&id=#url.id#&Portfolio=#url.portfolio#&Door=#url.Door#&imageposition=#url.imageposition#&ExPage=#url.ExPage#</cfoutput>'; window.close()"><font face="verdana, arial, helvetica, sans-serif" size="1" color="#999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='#999999';">></font></A> <a href="javascript:window.opener.top.location.href='../index.cfm?image=<cfoutput>#image#&id=#url.id#&Portfolio=#url.portfolio#&Door=#url.Door#&imageposition=#url.imageposition#&ExPage=#url.ExPage#</cfoutput>'; window.close()"><font face="verdana, arial, helvetica, sans-serif" size="1" color="#999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='#999999';"> 
              Portfolio</font></a>
</cfif>
			
    </td>
  </tr>
</table>

</body>
</html>
