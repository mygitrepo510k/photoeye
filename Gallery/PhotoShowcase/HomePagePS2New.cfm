<!--- Decide where to start the random images based on page number> --->
<!--- <cfset imgbegin=((#url.page#/2)*20)> --->
<cfif Isdefined("url.lastbeginNo")>
	<cfif #url.page# gt 1>
	<cfset imgbegin=4>
	

	<cfelse>
	<cfset imgbegin=0>
	</cfif>
	<!--- <cfset additional=#url.additional#> --->
<cfelse>
<cfset lastbeginno=0>
	<cfset imgbegin=0>
	<cfset page=1>
</cfif>

<cfset image=1>
<cfset imagepostition=1>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Galleries |  Photographer's Showcase Galleries</title>
	
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



<BODY text="Silver" vlink="#777777" link="Silver" alink="Red" bgcolor="#333333" topmargin="15">
	
<DIV ALIGN="CENTER">

<table width="95%" height="36" border="0" bgcolor="Black">
<tr>

    <td  width="95%" height="51" align="center"><a href="../homepage.cfm"><img src="SharedImages/photoeyeexplorephotographersshowcase7.jpg" width="384" height="84" alt="" border="0"></a></td>

</tr>
</table>
  <p align="center"><b><font face="verdana, arial, helvetica, sans-serif" size="2" color="#FFFF99">P 
    H O T O G R A P H E R ' S&nbsp;&nbsp;&nbsp;&nbsp;S H O W C A S E <SUP><FONT SIZE="-1">SM</FONT></SUP></font>
	<br> <font face="verdana, arial, helvetica, sans-serif" size="2" color="#FFFF99">G A L L E R Y&nbsp;&nbsp;&nbsp;T W O &nbsp;-&nbsp; 
E M E R G I N G&nbsp;&nbsp;&nbsp;A R T I S T S</font> </b>

<div align="center"><br>
 <img src="SharedImages/dot_clear.gif" width="1" height="1"><a href="HomePagePS1New.cfm"><font face="verdana, arial, helvetica, sans-serif" size="1" color="silver" onMouseOver="this.color='Red';" onMouseOut="this.color='silver';"  style="TEXT-DECORATION: none"><b>Showcase Gallery One - Featured Artists </b></font></a> | <a href="../PhotoshowcaseEmail2.html"><FONT color="silver" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='silver';"  style="TEXT-DECORATION: none"><strong>Exhibit Your Work</strong></font></a> | <a href="../homepage.cfm"><FONT color="silver" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='silver';"  style="TEXT-DECORATION: none"><strong>All Galleries</strong></font></a>
<br></div>
<!--- <table width="90%" border="0" align="center">
<tr align="left"><td align="left" valign="top">	 <a href="javascript:popUp('photoshowcaseemail2.html','Popup','500','320','no');"><font face="verdana, arial, helvetica, sans-serif" size="1" color="silver" onMouseOver="this.color='Red';" onMouseOut="this.color='silver';"  style="TEXT-DECORATION: none"><b>Exhibit at photo-eye!</b></font></a>
</td></tr>
</table> 
<table width="90%" border="0" align="center">
<tr align="center"><td align="center" valign="top">
  <img src="SharedImages/Redlinetoc.gif" width="400" height="1" alt="" border="0">



</td></tr></table>--->

 <CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">	
SELECT DISTINCT G.SubDirectory as SubDirectory, G.Firstname as Firstname, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, I.ImageNumber as Imagenumber, I.ImagePosition as ImagePosition, I.GeneralRandomNo as GeneralRandomNo,  p.ImgQty as ImageQTy,  P.Subdirectory as Portfolio
FROM GallerySetup G INNER JOIN
     GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
     GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
WHERE  P.ImgQty>0 AND I.GeneralRandomNo>#imgBegin#  AND G.Gallery='PhotoShowcase' and I.ImageNumber=1 and G.Tier=2
ORDER BY I.GeneralRandomNo
</cfquery>


   <img src="SharedImages/Redlinetoc.gif" width="400" height="1" alt="" border="0"> <br>

   
    <!---   1 - 2 - 3 - 4 - 5 - 6 - 7 - 8 - 9 - 10 - 11+ --->  
<cfoutput>
  <cfset RecordCount = #qGetShowcaseSetupInfo.RecordCount#>
  <cfif isdefined("url.additional")>
  	<cfelse>
 	 	<cfset Additional = #qGetShowcaseSetupInfo.RecordCount#/30>
 		 <cfset Additional = #ceiling(Additional)#>
<!--- #qGetShowcaseSetupInfo.RecordCount# --->
  </cfif>
 
<!---   "#Additional# --->
  	<cfset BeginLoop=1>
	<cfset EndLoop=30*#Additional#>
	<!--- <cfset lastBeginNo = qGetShowcaseSetupInfo.GeneralRandomNo> --->
  <cfset counter = 1>
  <cfloop index="NumberHeader" from="1" to="#Additional#" step="1">

  <cfif counter is 1>
 	<cfif #counter# is #page#>
	<FONT color="Yellow" face="verdana, arial, Helvetica, sans-serif" size="2"> <b>#counter#</b></font>
	<cfelse>
<!--- 	<cfset lastBeginNo = qGetShowcaseSetupInfo.GeneralRandomNo> --->
	<cfloop index="GetNewBeginingRandomNumber" from="1" to="30" step="30"><!--- #Additional# --->
	<CFQUERY NAME="qGetNextBeginningRandomNumber"  DATASOURCE="photoeyecom">
SELECT DISTINCT G.SubDirectory as SubDirectory, G.Firstname as Firstname, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, I.ImageNumber as Imagenumber, I.ImagePosition as ImagePosition, I.GeneralRandomNo as GeneralRandomNo,  p.ImgQty as ImageQTy,  P.Subdirectory as Portfolio
FROM GallerySetup G INNER JOIN
     GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
     GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
WHERE  P.ImgQty>0 AND I.GeneralRandomNo>#lastBeginNo#  AND G.Gallery='PhotoShowcase' and G.Tier=2
ORDER BY I.GeneralRandomNo
</cfquery>
<cfset lastBeginNo = qGetNextBeginningRandomNumber.GeneralRandomNo> 
	<a href="homepagePS1New.cfm?imgbegin=#lastbeginNo#"><FONT color="silver" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='silver';"  style="TEXT-DECORATION: none"><b>#counter#</b></font></a>
	</cfloop>
	</cfif>
  </cfif>
  <cfif counter gt 1 and counter lt 11>
 	<cfif #counter# is #page#>
	- <FONT color="Yellow" face="verdana, arial, Helvetica, sans-serif" size="2"><b>#counter#</b></font>
	<cfelse>


	<cfloop index="GetNewBeginingRandomNumber" from="#BeginLoop#" to="#EndLoop#" step="30"><!--- #Additional# --->
		<CFQUERY NAME="qGetNextBeginningRandomNumber"  DATASOURCE="photoeyecom">
SELECT DISTINCT G.SubDirectory as SubDirectory, G.Firstname as Firstname, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, I.ImageNumber as Imagenumber, I.ImagePosition as ImagePosition, I.GeneralRandomNo as GeneralRandomNo,  p.ImgQty as ImageQTy,  P.Subdirectory as Portfolio
FROM GallerySetup G INNER JOIN
     GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
     GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
WHERE  P.ImgQty>0 AND I.GeneralRandomNo>#lastBeginNo#   AND G.Gallery='PhotoShowcase' and G.Tier=2
ORDER BY I.GeneralRandomNo
</cfquery>

<cfset lastBeginNo = qGetNextBeginningRandomNumber.GeneralRandomNo> 
<cfset BeginLoop = BeginLoop+1>
	- <a href="homepagePS1New.cfm?imgbegin=#lastbeginNo#"><FONT color="silver" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='silver';"  style="TEXT-DECORATION: none"><b>#counter#</b></font></a>
	<cfbreak>
	</cfloop>
	</cfif>
  </cfif>
  <cfif counter is 11>
 	<cfif #counter# is #page#>
	- <FONT color="Yellow" face="verdana, arial, Helvetica, sans-serif" size="2"><b>11+</b></font>
	<cfelse>
<!--- 	<cfset lastBeginNo = qGetShowcaseSetupInfo.GeneralRandomNo> --->
	<cfloop index="GetNewBeginingRandomNumber" from="#BeginLoop#" to="30" step="30"><!--- #Additional# --->
 		<CFQUERY NAME="qGetNextBeginningRandomNumber"  DATASOURCE="photoeyecom">
SELECT DISTINCT G.SubDirectory as SubDirectory, G.Firstname as Firstname, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, I.ImageNumber as Imagenumber, I.ImagePosition as ImagePosition, I.GeneralRandomNo as GeneralRandomNo,  p.ImgQty as ImageQTy,  P.Subdirectory as Portfolio
FROM GallerySetup G INNER JOIN
     GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
     GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
WHERE  P.ImgQty>0 AND I.GeneralRandomNo>#lastBeginNo# AND G.Gallery='PhotoShowcase' and G.Tier=2
ORDER BY I.GeneralRandomNo
</cfquery>
<cfset lastBeginNo = qGetNextBeginningRandomNumber.GeneralRandomNo> 
	- <a href="homepagePS1New.cfm?imgbegin=#lastbeginNo#"><FONT color="silver" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='silver';"  style="TEXT-DECORATION: none"><b>11+</b></font></a>
	</cfloop>
	</cfif>
 	<cfbreak>
  </cfif>
  <cfset counter = counter+1>
  </cfloop>
 <!---  </b></font> ---><!---<br>--->
  <img src="SharedImages/dot_clear.gif" width="1" height="1"> <br>    <FONT color="silver" face="verdana, arial, Helvetica, sans-serif" size="1"><b>Click Image to View Portfolio</b></font> <br><img src="SharedImages/dot_clear.gif" width="1" height="10">

<!---  <cfoutput> --->


  
<cfset ImageNumber = 1>
<cfset ImagePosition = 1>

<cfset imgbeginType2=RAND()>


<CFQUERY NAME="qGetShowcase"  DATASOURCE="photoeyecom">
SELECT DISTINCT TOP 1 G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
    P.Subdirectory as Portfolio, D.GeneralRandomNo
FROM GallerySetup AS G,  GalleryDefaultPhotos as D, GalleryPortfolio as P
WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 AND D.GeneralRandomNo>#imgbeginType2# AND G.Gallery='PhotoShowcase' and G.Tier=2
ORDER BY D.GeneralRandomNo
</cfquery>

<!--- Takes into account random number being too high--->
<cfif qGetShowcase.recordcount is 0>
	<CFQUERY NAME="qGetShowcase"  DATASOURCE="photoeyecom">
SELECT DISTINCT TOP 1 G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
    P.Subdirectory as Portfolio, D.GeneralRandomNo
FROM GallerySetup AS G,  GalleryDefaultPhotos as D, GalleryPortfolio as P
WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 AND D.GeneralRandomNo<#imgbeginType2# AND G.Gallery='PhotoShowcase' and G.Tier=2
ORDER BY D.GeneralRandomNo DESC
	</cfquery>
</cfif>
</cfoutput>
 	   	 <!--- Outer Table --->
	 <table border="0" align="center" width="100%">
	   	<tr align="center"><td align="center" valign="top">
	<cfset firsttime=1>
	<cfset counter=1>
	<cfoutput query="qGetShowcaseSetupInfo" startrow=1 maxrows=30>
	 <cfif counter is 1>
	 <div align="center">  <table width="600" border="0" cellpadding="10"><!--- <table width="80%" border="0" cellpadding="3" align="center"> --->
			<tr>
	 </cfif>
		 <td height="125" align="center"><a href="../forms/index.cfm?id=#qGetShowcaseSetupInfo.Custnumber#&image=#ImageNumber#&imagePosition=#ImagePosition#&Door=9&Portfolio=#qGetShowcaseSetupInfo.Portfolio#" target="_top"><img src="Artists/#qGetShowcaseSetupInfo.Subdirectory#/#qGetShowcaseSetupInfo.Portfolio#/Images_Search/Image1.jpg" name="img2"  border="0"></a><br>
 <img src="SharedImages/dot_clear.gif" width="1" height="20"><a href="../forms/index.cfm?id=#qGetShowcaseSetupInfo.Custnumber#&image=#ImageNumber#&imagePosition=#ImagePosition#&Door=9&Portfolio=#qGetShowcaseSetupInfo.Portfolio#" target="_top"><FONT color="silver" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='silver';"  style="TEXT-DECORATION: none"><b>#qGetShowcaseSetupInfo.Firstname# #qGetShowcaseSetupInfo.Lastname#</b></font></a></td>
		
		<cfset counter=counter+1>	
		<cfif counter is 5>
			 <cfif firsttime is 0>
			 <hr width="400" size="1" noshade>
			</cfif>
			<cfset counter=1>
			<cfset firsttime=0>
			</tr>
			</table></div>
		</cfif>
	</cfoutput>		
		
			</td></tr>
</table>
	




</body>
</html>
