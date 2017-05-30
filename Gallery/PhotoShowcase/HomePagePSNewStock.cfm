<!--- Decide where to start the random images based on page number> --->
<!--- <cfset imgbegin=((#url.page#/2)*20)> --->
<cfif Isdefined("url.page")>
	<cfif #url.page# gt 1>
	<cfset imgbegin=4>
	

	<cfelse>
	<cfset imgbegin=0>
	</cfif>
<!--- 	<cfset additional=#url.additional#> --->
<cfelse>
	<cfset imgbegin=0>
	<cfset page=1>
</cfif>
<!--- 
<CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
SELECT G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
    P.Subdirectory as Portfolio, D.GeneralRandomNo
FROM GallerySetup AS G,  GalleryDefaultPhotos as D, GalleryPortfolio as P
WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 AND D.GeneralRandomNo>#imgbegin# AND G.Gallery='RepresentedArtists'
ORDER BY D.GeneralRandomNo
</cfquery>
 --->


<!--- AND G.Portfolio="" --->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Galleries | Contact Sheets</title>
	
<script language="JavaScript">

<!-- hide from JavaScript-challenged browsers

var popupWin = null;
function popUp(myURL,myWindowName,w,h,scroll,menu){
var myLeft = ((screen.width-w)/2)-5; 
var myTop = ((screen.height-h)/2)-10;   
var settings='height='+h+',width='+w+',top='+myTop+',left='+myLeft+', scrollbars=yes,resizable=yes,menu='+menu
popupWin=window.open(myURL,myWindowName,settings);   
if(parseInt(navigator.appVersion) >= 4){popupWin.focus();}
}



 

// done hiding -->

</script>
</head>



<body bgcolor="#333333" text="#FFFFFF" link="Silver" vlink="Gray" alink="Red">
<table width="90%" height="36" border="0" align="center" bgcolor="Black">
<tr>
    <td  width="100%" height="51" align="center"><img src="../SharedImages/photoeyeexplorephotographersshowcase7.jpg" width="384" height="84" alt="" border="0"></td>

</tr>
</table>
<table width="90%" border="0" align="center">
<tr align="left"><td align="left" valign="top">	 <a href="javascript:popUp('photoshowcaseemail2.html','Popup','500','320','no');"><font face="verdana, arial, helvetica, sans-serif" size="1" color="silver" onMouseOver="this.color='Red';" onMouseOut="this.color='silver';"  style="TEXT-DECORATION: none"><b>Exhibit at photo-eye!</b></font></a>
</td></tr>
</table>


 <cfoutput>


  
<cfset ImageNumber = 1>
<cfset ImagePosition = 1>
<cfset FirstTime = 1>
<cfset rowcount =1 >
<cfset imgbeginType1=RAND()>
<cfset imgbeginType2=RAND()>
<cfset imgbeginType3=RAND()>




<CFQUERY NAME="qGetShowcase1"  DATASOURCE="photoeyecom">
SELECT DISTINCT TOP 1 G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
    P.Subdirectory as Portfolio, D.GeneralRandomNo
FROM GallerySetup AS G,  GalleryDefaultPhotos as D, GalleryPortfolio as P
WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 AND D.GeneralRandomNo>#imgbeginType2# AND G.Gallery='PhotoShowcase' and G.Tier=1
ORDER BY D.GeneralRandomNo
</cfquery>

<!--- Takes into account random number being too high--->
<cfif qGetShowcase1.recordcount is 0>
	<CFQUERY NAME="qGetShowcase1"  DATASOURCE="photoeyecom">
SELECT DISTINCT TOP 1 G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
    P.Subdirectory as Portfolio, D.GeneralRandomNo
FROM GallerySetup AS G,  GalleryDefaultPhotos as D, GalleryPortfolio as P
WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 AND D.GeneralRandomNo<#imgbeginType2# AND G.Gallery='PhotoShowcase' and G.Tier=1
ORDER BY D.GeneralRandomNo DESC
	</cfquery>
</cfif>

<CFQUERY NAME="qGetShowcase2"  DATASOURCE="photoeyecom">
SELECT DISTINCT TOP 1 G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
    P.Subdirectory as Portfolio, D.GeneralRandomNo
FROM GallerySetup AS G,  GalleryDefaultPhotos as D, GalleryPortfolio as P
WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 AND D.GeneralRandomNo>#imgbeginType2# AND G.Gallery='PhotoShowcase' and G.Tier=2
ORDER BY D.GeneralRandomNo
</cfquery>

<!--- Takes into account random number being too high--->
<cfif qGetShowcase2.recordcount is 0>
	<CFQUERY NAME="qGetShowcase2"  DATASOURCE="photoeyecom">
SELECT DISTINCT TOP 1 G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
    P.Subdirectory as Portfolio, D.GeneralRandomNo
FROM GallerySetup AS G,  GalleryDefaultPhotos as D, GalleryPortfolio as P
WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 AND D.GeneralRandomNo<#imgbeginType2# AND G.Gallery='PhotoShowcase' and G.Tier=2
ORDER BY D.GeneralRandomNo DESC
	</cfquery>
</cfif>

 	    	 <!--- Outer Table --->
	 <table border="0" align="center" width="100%">
	   	<tr align="center"><td align="center" valign="top">
	

	
	 <table width="80%" border="0" cellpadding="3" align="center">
		<tr align="center">
		  <td width="80%" colspan="2" align="center" valign="bottom">
		 <b><font face="verdana, arial, helvetica, sans-serif" size="2" color="##FFFF99">P 
    H O T O G R A P H E R ' S&nbsp;&nbsp;&nbsp;&nbsp;S H O W C A S E <SUP><FONT SIZE="-1">SM</FONT></SUP></font><br><br><img src="../SharedImages/Redlinetoc.gif" width="400" height="1" alt="" border="0"><br></td></tr></table>
 <table width="600" border="0" cellpadding="3" align="center">
		<tr align="center">
	<td align="center" width="200" valign="bottom" height="35">
	<a href="homepagePS1New2.cfm?lastbeginNo=imgbegintype1&Page=1"><font color="##FFFF99" face="verdana, arial, Helvetica, sans-serif" size="2" onMouseOver="this.color='Red';" onMouseOut="this.color='##FFFF99';"  style="TEXT-DECORATION: none"><b><br>
Gallery One<br>Artists' Gallery</b></font></a></td>

	<td align="center" width="200" valign="bottom" height="35">

	
	
		<a href="homepagePS2New2.cfm?lastbeginNo=imgbegintype2&Page=1"><font color="##FFFF99" face="verdana, arial, Helvetica, sans-serif" size="2" onMouseOver="this.color='Red';" onMouseOut="this.color='##FFFF99';"  style="TEXT-DECORATION: none"><b><br>
        Gallery Two<br>Photographers' Gallery</b></font></a></td>
		
			<td align="center" width="200" valign="bottom" height="35">

	
	
		<a href="homepagePS2New2.cfm?lastbeginNo=imgbegintype2&Page=1"><font color="##FFFF99" face="verdana, arial, Helvetica, sans-serif" size="2" onMouseOver="this.color='Red';" onMouseOut="this.color='##FFFF99';"  style="TEXT-DECORATION: none"><b><br>
        Gallery Three<br>Stock Photographers</b></font></a></td>
			</tr></table>
			
			 <table width="600" border="0" cellpadding="3" align="center">
			<tr>
			<td align="center" width="200" valign="bottom" height="115">
	<a href="homepagePS1New2.cfm?lastbeginNo=imgbegintype1&Page=1"><img src="Artists/#qGetShowcase1.Subdirectory#/#qGetShowcase1.Portfolio#/Images_Search/Image1.jpg" name="img2"  border="0"></a></td>

<td align="center" width="200" valign="bottom" height="115">

	 <a href="homepagePS2New2.cfm?lastbeginNo=imgbegintype2&Page=1"><img src="Artists/#qGetShowcase2.Subdirectory#/#qGetShowcase2.Portfolio#/Images_Search/Image1.jpg" name="img2"  border="0"></a></td>

<td align="center" width="200" valign="bottom" height="115">

	 <a href="homepagePS2New2.cfm?lastbeginNo=imgbegintype2&Page=1" target="_top"><img src="http://www.photoeye.com/gallery/PhotoShowcase/Artists/DavidGraham/Portfolio1/Images_Search/Image6.jpg" name="img2"  border="0"></a></td></tr>
			</table>
			</td></tr>
						<tr><td colspan="2" align="center"><br><br><FONT color="silver" face="verdana, arial, Helvetica, sans-serif" size="1"><b><div align="center">
Click Image to Enter Gallery or Explore our Directories on the Left</b><br></td></tr></table>
	


</cfoutput>

</body>
</html>
