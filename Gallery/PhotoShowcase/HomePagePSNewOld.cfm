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
	<title>photo-eye Galleries | Photographer's Showcase</title>
	
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


<body bgcolor="#B3A48E" text="White" link="Navy" vlink="Navy" alink="Red">

<DIV ALIGN="CENTER">

<table width="80%" height="36" border="0" align="center" bgcolor="Black">
<tr>

    <td  width="95%" height="51" align="center"><a href="../homepage.cfm"><img src="SharedImages/photoeyeexplorephotographersshowcase7.jpg" width="384" height="84" alt="" border="0"></a></td>

</tr>
</table>
<table width="80%" border="0" align="center"">
	<tr>
    	<td  width="95%" align="center">
 
  <div align="center"><b>
 <img src="SharedImages/dot_clear.gif" width="1" height="1"><a href="../qcd2449x90s18bc.html"><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Maroon';"  style="TEXT-DECORATION: none">Galleries Home</font></a><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;| &nbsp;</font><a href="javascript:popUp('../photoshowcaseemailNoFrame.html','Popup','600','320','no');"><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Maroon';"  style="TEXT-DECORATION: none">Exhibit Your Work!</font></a><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;| &nbsp;</font><a href="javascript:popUp('../underconstruction.html','Popup','600','460','no');"><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Maroon';"  style="TEXT-DECORATION: none">Gallery Descriptions</font></a><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;| &nbsp;</font><a href="javascript:popUp('Documentation/index.cfm','Popup','600','320','no');"><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Maroon';"  style="TEXT-DECORATION: none">Showcase Information</font></a></b>
<br></div>
</td></tr></table>
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

 <CFQUERY NAME="qGetShowcase3"  DATASOURCE="photoeyecom">
SELECT DISTINCT TOP 1 G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
    P.Subdirectory as Portfolio, D.GeneralRandomNo
FROM GallerySetup AS G,  GalleryDefaultPhotos as D, GalleryPortfolio as P
WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 AND D.GeneralRandomNo>#imgbeginType3# AND G.Gallery='PhotoShowcase' and G.Tier=3
ORDER BY D.GeneralRandomNo
</cfquery>

<!--- Takes into account random number being too high--->
<cfif qGetShowcase3.recordcount is 0>
	<CFQUERY NAME="qGetShowcase3"  DATASOURCE="photoeyecom">
SELECT DISTINCT TOP 1 G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
    P.Subdirectory as Portfolio, D.GeneralRandomNo
FROM GallerySetup AS G,  GalleryDefaultPhotos as D, GalleryPortfolio as P
WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 AND D.GeneralRandomNo<#imgbeginType3# AND G.Gallery='PhotoShowcase' and G.Tier=3
ORDER BY D.GeneralRandomNo DESC
	</cfquery>
</cfif>
	
	
	    	 <!--- Outer Table --->
<!--- 	 <table border="0" align="center" width="100%">
	   	<tr align="center"><td align="center" valign="top"> --->
	
	<br><div align="center"><font face="verdana, arial, helvetica, sans-serif" size="2" color="Navy"><b>P 
    H O T O G R A P H E R ' S&nbsp;&nbsp;&nbsp;&nbsp;S H O W C A S E <SUP><FONT SIZE="-1">SM</FONT></SUP></font></b></font></div><hr width="400" size="1" noshade><font face="verdana, arial, helvetica, sans-serif" size="1" color="##666666"><b>
 Online Galleries Featuring the Best in Contemporary Fine-Art Photography with <a href="javascript:popUp('../underconstruction.HTML','Popup','620','460','no');">Juried Work</a> Offered for Sale</b></font></div>

<div align="center">
<FONT color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1"><b><br>
Click Image to Enter a Gallery</b></font><br></div>


 <table width="750" border="0" cellpadding="3" align="center">
		<tr align="center">
	<td align="center" width="250" valign="bottom" height="35">
	<br><a href="homepagePS1New2.cfm?lastbeginNo=imgbegintype1&Page=1" target="_parent"><font color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="2" onMouseOver="this.color='Red';" onMouseOut="this.color='Maroon';"  style="TEXT-DECORATION: none"><b>
Gallery One<br>Established Artists</b></font></a></td>

	<td align="center" width="250" valign="bottom" height="35">
		<br><a href="homepagePS2New2.cfm?lastbeginNo=imgbegintype2&Page=1" target="_parent"><font color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="2" onMouseOver="this.color='Red';" onMouseOut="this.color='Maroon';"  style="TEXT-DECORATION: none"><b>
        Gallery Two<br>Emerging Artists</b></font></a></td>
		
	<td align="center" width="250" valign="bottom" height="35">
		<br><a href="homepagePS3New3.cfm?lastbeginNo=imgbegintype3&Page=1" target="_parent"><font color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="2" onMouseOver="this.color='Red';" onMouseOut="this.color='Maroon';"  style="TEXT-DECORATION: none"><b>
        Gallery Three<br>Independent Photographers</b></font></a></td>		

			</tr></table>
			
			 <table width="750" border="0" cellpadding="3" align="center">
			<tr>
			<td align="center" width="250" valign="bottom" height="115">
	<a href="homepagePS1New2.cfm?lastbeginNo=imgbegintype1&Page=1" target="_parent"><img src="Artists/#qGetShowcase1.Subdirectory#/#qGetShowcase1.Portfolio#/Images_Search/Image1.jpg" name="img2"  border="0"></a><br>
 <img src="SharedImages/dot_clear.gif" width="1" height="20"><FONT color="##666666" face="verdana, arial, Helvetica, sans-serif" size="1">&copy; #qGetShowcase1.Firstname# #qGetShowcase1.Lastname#<!--- #Ucase(qGetShowcase1.Firstname)# #Ucase(qGetShowcase1.Lastname)# ---></font><p align="center"><font color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1">Artists with<br> <!---  <a href="javascript:popUp('AIPAD.HTML','Popup','620','460','no');"> ---> a Significant<br><!--- </a> --->Exhibition or<br>Publication History</font></p></td></td>

<td align="center" width="250" valign="bottom" height="115">

	 <a href="homepagePS2New2.cfm?lastbeginNo=imgbegintype2&Page=1" target="_parent"><img src="Artists/#qGetShowcase2.Subdirectory#/#qGetShowcase2.Portfolio#/Images_Search/Image1.jpg" name="img2"  border="0"></a><br>
 <img src="SharedImages/dot_clear.gif" width="1" height="20"><FONT color="##666666" face="verdana, arial, Helvetica, sans-serif" size="1"><!--- #Ucase(qGetShowcase2.Firstname)# #Ucase(qGetShowcase2.Lastname)# --->&copy; #qGetShowcase2.Firstname# #qGetShowcase2.Lastname#</font><p align="center"><font color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1">Discover Fresh<br>and Exciting<br>Portfolios by these<br>Emerging Artists</font></p></td>

<td align="center" width="250" valign="bottom" height="115">
<a href="homepagePS3New3.cfm?lastbeginNo=imgbegintype2&Page=1" target="_parent">
<!--- 	 <a href="homepagePS3New3.cfm?lastbeginNo=imgbegintype2&Page=1" target="_parent"> ---><img src="Artists/#qGetShowcase3.Subdirectory#/#qGetShowcase3.Portfolio#/Images_Search/Image1.jpg" name="img2"  border="0"></a><br>
 <img src="SharedImages/dot_clear.gif" width="1" height="20"><FONT color="##666666" face="verdana, arial, Helvetica, sans-serif" size="1"><!--- #Ucase(qGetShowcase3.Firstname)# #Ucase(qGetShowcase3.Lastname)# --->&copy; #qGetShowcase3.Firstname# #qGetShowcase3.Lastname#</font><p align="center"><font color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1">Photographers with<br>
Selected Images<br>
Chosen by the<br>
<!--- Photographer's  --->Showcase <!--- <a href="javascript:popUp('../underconstruction.HTML','Popup','620','460','no');"> --->jury<!--- </a> ---></font></p></td>
		</tr>
	</table>
			
			
<!--- 			</td></tr>
</table> --->
</div>
<cfinclude template="../footer.cfm">

</cfoutput>

</body>
</html>
