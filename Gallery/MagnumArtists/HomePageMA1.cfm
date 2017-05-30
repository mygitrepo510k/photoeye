<!--- Decide where to start the random images based on page number> --->
<!--- <cfset imgbegin=((#url.page#/2)*20)> --->
<cfif Isdefined("url.imgbegin")>
	<cfif #url.page# gt 1>
		<cfset page=#url.page#>
	</cfif>
	<!--- <cfset additional=#url.additional#> --->
<cfelse>
	<cfset page=1>
	<cfset imgBegin=0> 
</cfif>
<cfset imgNextBeginNo = imgBegin> 
<cfset imgBegin=0> 
<cfset image=1>
<cfset imageposition=1>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>photo-eye Galleries | Magnum Photos Collectors' Prints</title>


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



<body bgcolor="#B3A48E" text="White" link="#B3A48E" vlink="#B3A48E" alink="Red">
	
<DIV ALIGN="CENTER">

<table width="80%" height="36" border="0" bgcolor="Black">
<tr>

    <td  width="95%" height="51" align="center"><a href="../homepage.cfm"><img src="../SharedImages/photoeyeexplorephotographersshowcase7.jpg" width="384" height="84" alt="" border="0"></a></td>

</tr>
</table>
<table width="80%" border="0" align="center">
	<tr>
    	<td  width="95%" align="center">
  <div align="center"><b>
 <img src="../SharedImages/dot_clear.gif" width="1" height="1"><a href="../index.cfm"><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Maroon';"  style="TEXT-DECORATION: none">All Galleries Home</font></a><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;| &nbsp;</font><a href="javascript:popUp('AboutPrints.html','Popup','600','460');"><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Maroon';"  style="TEXT-DECORATION: none">About Collectors' Prints</font></a><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;| &nbsp;</font><a href="javascript:popUp('AboutMagnum.html','Popup','600','460','no');"><!--- <a href="http://www.magnumphotos.com/about.html" target="_top"> ---><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Maroon';"  style="TEXT-DECORATION: none">About Magnum Photos</font></a><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;| &nbsp;</font><a href="javascript:popUp('../ShippingCosts.html','Popup','600','460');"><!--- <a href="http://www.magnumphotos.com/about.html" target="_top"> ---><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Maroon';"  style="TEXT-DECORATION: none">Shipping Costs</font></a></b><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;| &nbsp;</font><a href="../../templates/viewshoppingcartcontents.cfm?Showcase=2" target="_top"><font face="verdana, arial, helvetica, sans-serif" size="1" color="Maroon" onMouseOver="this.color='Red';" onMouseOut="this.color='Maroon';"  style="TEXT-DECORATION: none"><b>View Your Order</b></font></a>
<br></div>
</td></tr></table>
  <br><DIV align="center"><b><font face="verdana, arial, helvetica, sans-serif" size="2" color="Black">M
    A G N U M&nbsp;&nbsp;&nbsp;&nbsp;P H O T O S</font>
	<br> <font face="verdana, arial, helvetica, sans-serif" size="2" color="Black">C O L L E C T O R S '&nbsp;&nbsp;&nbsp;&nbsp;P R I N T S</font> </b></div><hr width="400" size="1" noshade><!--- <img src="../SharedImages/Redlinetoc.gif" width="400" height="1" alt="" border="0"> <br><img src="SharedImages/dot_clear.gif" width="1" height="15"> ---><font face="verdana, arial, helvetica, sans-serif" size="1" color="#666666"><b>
Magnum Photos is the World's Premier Picture Agency<br><img src="../SharedImages/dot_clear.gif" width="1" height="12">photo-eye is proud to offer Collectors' Prints by these great Magnum Photographers
</b></font>

<br><font face="verdana, arial, helvetica, sans-serif" size="1" color="#333333"><b><br><a href="../photoshowcase/SearchShowcase.cfm?Gallery=3"><font color="navy">Search</font></a> the Magnum Photos Artists Directories</b></font><br>


<img src="../SharedImages/dot_clear.gif" width="1" height="15"><font color="#333333" face="verdana, arial, Helvetica, sans-serif" size="1"><b>Click Image to View <a href="javascript:popUp('AboutPrints.html','Popup','600','460','no');"><font color="#333333">Collectors' Prints</font></a> by a Magnum Photographer</b></font><br><img src="../SharedImages/dot_clear.gif" width="1" height="1">

 <CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">	
SELECT DISTINCT G.SubDirectory as SubDirectory, G.Firstname as Firstname, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, I.ImageNumber as Imagenumber, I.ImagePosition as ImagePosition, I.GeneralRandomNo as GeneralRandomNo,  p.ImgQty as ImageQTy,  P.Subdirectory as Portfolio
FROM GallerySetup G INNER JOIN
     GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
     GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
WHERE  P.ImgQty>0 AND I.GeneralRandomNo>#imgNextBeginNo#  AND G.Gallery='MagnumArtists' and I.ImagePosition=1 and G.Tier=1  and P.ShowcaseOK=1
ORDER BY I.GeneralRandomNo
</cfquery>


<!--- Get total record count --->
 <CFQUERY NAME="qGetShowcaseRecordCount"  DATASOURCE="photoeyecom">	
SELECT DISTINCT G.SubDirectory as SubDirectory, G.Firstname as Firstname, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, I.ImageNumber as Imagenumber, I.ImagePosition as ImagePosition, I.GeneralRandomNo as GeneralRandomNo,  p.ImgQty as ImageQTy,  P.Subdirectory as Portfolio
FROM GallerySetup G INNER JOIN
     GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
     GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
WHERE  P.ImgQty>0 AND I.GeneralRandomNo>0  AND G.Gallery='MagnumArtists' and I.ImagePosition=1 and G.Tier=1  and P.ShowcaseOK=1
ORDER BY I.GeneralRandomNo
</cfquery>
<cfset recordcount=qGetShowcaseRecordCount.recordcount>

   <hr width="400" size="1" noshade> <br>

 
    <!---   1 - 2 - 3 - 4 - 5 - 6 - 7 - 8 - 9 - 10 - 11+ --->  
<cfoutput>

<!--- if there are enough records to have more than one page --->
<cfif recordcount gt 12>


<cfset Additional = #RecordCount#/12>
<cfset Additional = #ceiling(Additional)#> 	
<!--- <cfset BeginLoop=1> --->
<cfset EndLoop=12*#Additional#>
<cfset counter = 1>
  
 <!--- Outer Loop 1 - Writes all Page Numbers and Increments Counter--->
 <cfloop index="NumberHeader" from="1" to="#Additional#" step="1">
	<cfset imgNextBeginNo = #imgBegin#>
   				<CFQUERY NAME="qGetNextBeginningRandomNumber"  DATASOURCE="photoeyecom">
SELECT TOP 12 G.SubDirectory as SubDirectory, G.Firstname as Firstname, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, I.ImageNumber as Imagenumber, I.ImagePosition as ImagePosition, I.GeneralRandomNo as GeneralRandomNo,  p.ImgQty as ImageQTy,  P.Subdirectory as Portfolio
FROM GallerySetup G INNER JOIN
     GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
     GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
WHERE  P.ImgQty>0 AND I.GeneralRandomNo>#imgBegin#   AND G.Gallery='MagnumArtists' and G.Tier=1 AND I.ImagePosition=1  and P.ShowcaseOK=1
ORDER BY I.GeneralRandomNo 
			</cfquery>
			<cfloop query="qGetNextBeginningRandomNumber" startrow="1" endrow="12">			
				<cfset imgBegin = qGetNextBeginningRandomNumber.GeneralRandomNo>
			</cfloop>
		
  <cfif counter is 1>
	<cfif #counter# is #page#>
	<FONT color="Yellow" face="verdana, arial, Helvetica, sans-serif" size="2"><b>#counter#</b></font>
	<cfelse>

			 <!--- Write Next Page Number --->
		 <a href="homepagePS1New2.cfm?imgbegin=0&Page=#counter#"><FONT color="silver" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='silver';"  style="TEXT-DECORATION: none"><b>#counter#</b></font></a>
	
	</cfif> <!--- End if counter is 1 --->
  </cfif> <!--- End if page 1 --->
  
  
  
  <!--- If Counter is between 1 and 11 --->
  <cfif counter gt 1 and counter lt 11>
 	<cfif #counter# is #page#>
	- <FONT color="Yellow" face="verdana, arial, Helvetica, sans-serif" size="2"><b>#counter#</b></font>
	<cfelse>

			
			<!--- Write Next Page Number --->
	-		 <a href="homepagePS1New2.cfm?imgbegin=#imgNextBeginNo#&Page=#counter#"><FONT color="silver" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='silver';"  style="TEXT-DECORATION: none"><b>#counter#</b></font></a>
			
	</cfif> <!--- End if counter and page are the same --->
  </cfif> <!--- End if Counter is between 1 and 11 --->
  
  
  <cfif counter is 11>
 	<cfif #counter# is #page#>
	- <FONT color="Yellow" face="verdana, arial, Helvetica, sans-serif" size="2"><b>11+</b></font>
	<cfelse>

			<!--- Write Next Page Number --->
	-		 <a href="homepagePS1New2.cfm?imgbegin=#imgNextBeginNo#&Page=#counter#"><FONT color="silver" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='silver';"  style="TEXT-DECORATION: none"><b>#counter#</b></font></a>	
	</cfif> <!--- End if counter and page are the same --->
  </cfif> <!--- End if Counter is between 1 and 11 --->
  <cfset counter = counter+1>
</cfloop> <!--- End outer loop --->

</cfif>  <!--- End if recordcount GT 12 --->
 
<!---   <img src="SharedImages/dot_clear.gif" width="1" height="1"> <br>    <FONT color="silver" face="verdana, arial, Helvetica, sans-serif" size="1"><b>Click Image to View Portfolio</b></font> <br><img src="SharedImages/dot_clear.gif" width="1" height="10"> --->
<!---  <cfoutput> --->


  
<cfset ImageNumber = 1>
<cfset ImagePosition = 1>

<cfif page is 1>
	<cfset imgbeginType2=0>
<cfelse>
	<cfset imgbeginType2=#imgBegin#>
</cfif>


<CFQUERY NAME="qGetShowcase"  DATASOURCE="photoeyecom">
SELECT DISTINCT TOP 1 G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
    P.Subdirectory as Portfolio, D.GeneralRandomNo
FROM GallerySetup AS G,  GalleryDefaultPhotos as D, GalleryPortfolio as P
WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 AND D.GeneralRandomNo>#imgbeginType2# AND G.Gallery='MagnumArtists' and G.Tier=1  and P.ShowcaseOK=1
ORDER BY D.GeneralRandomNo
</cfquery>

<!--- Takes into account random number being too high--->
<cfif qGetShowcase.recordcount is 0>
	<CFQUERY NAME="qGetShowcase"  DATASOURCE="photoeyecom">
SELECT DISTINCT TOP 1 G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
    P.Subdirectory as Portfolio, D.GeneralRandomNo
FROM GallerySetup AS G,  GalleryDefaultPhotos as D, GalleryPortfolio as P
WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 AND D.GeneralRandomNo<#imgbeginType2# AND G.Gallery='MagnumArtists' and G.Tier=1  and P.ShowcaseOK=1
ORDER BY D.GeneralRandomNo DESC
	</cfquery>
</cfif>
</cfoutput>
 	   	 <!--- Outer Table --->
	 <table border="0" align="center" width="100%">
	   	<tr align="center"><td align="center" valign="top">
	<cfset firsttime=1>
	<cfset counter=1>
	<cfoutput query="qGetShowcaseSetupInfo" startrow=1 maxrows=12>
	 <cfif counter is 1>
	 <div align="center">  <table width="600" border="0" cellpadding="10"><!--- <table width="80%" border="0" cellpadding="3" align="center"> --->
			<tr>
	 </cfif>
		 		 	<CFQUERY NAME="qGetImagePortfolioCount"  DATASOURCE="photoeyecom">
SELECT COUNT(*) AS PortfolioQty, SUM(ImgQty) AS ImgQty
FROM GalleryPortfolio
WHERE (Custnumber = #qGetShowcaseSetupInfo.Custnumber#)
</cfquery>
		 
		 <td height="125" align="center">
		 		 
		<cfif #qGetImagePortfolioCount.PortfolioQty# is 1>
		 <a href="../forms2/index.cfm?id=#qGetShowcaseSetupInfo.Custnumber#&image=#ImageNumber#&imagePosition=#ImagePosition#&Door=3&Portfolio=#qGetShowcaseSetupInfo.Portfolio#&Gallery=3" target="_top">
 		<cfelse>
		 <a href="../forms2/homepage.cfm?id=#qGetShowcaseSetupInfo.Custnumber#&image=#ImageNumber#&imagePosition=#ImagePosition#&Door=3&Portfolio=#qGetShowcaseSetupInfo.Portfolio#&Gallery=3" target="_top">		
		</cfif>
		 
<!--- 		 <a href="../forms2/index.cfm?id=#qGetShowcaseSetupInfo.Custnumber#&image=#ImageNumber#&imagePosition=#ImagePosition#&Door=3&Portfolio=#qGetShowcaseSetupInfo.Portfolio#" target="_top"> --->


<img src="Artists/#qGetShowcaseSetupInfo.Subdirectory#/#qGetShowcaseSetupInfo.Portfolio#/Images_Search/Image#qGetShowcaseSetupInfo.ImageNumber#.jpg" name="img2"  border="0"></a><br>
 <img src="../SharedImages/dot_clear.gif" width="1" height="20"><FONT color="##666666" face="verdana, arial, Helvetica, sans-serif" size="1"><b>#Ucase(qGetShowcaseSetupInfo.Firstname)# #Ucase(qGetShowcaseSetupInfo.Lastname)#</b></font></td>
		<cfset imgbegin = qGetShowcaseSetupInfo.GeneralRandomNo> 
<!--- 		#qGetShowcaseSetupInfo.GeneralRandomNo# --->
		<cfset counter=counter+1>	
		<cfif counter is 5>
			<!---  <cfif firsttime is 0>
			 <hr width="400" size="1" noshade>
			</cfif> --->
			<cfset counter=1>
			<cfset firsttime=0>
			</tr>
			</table> <cfif firsttime is 0>
			 <hr width="400" size="1" noshade>
			</cfif></div>
		</cfif>
	</cfoutput>		
		
			</tr>
</table>
	</td>
	</tr>
</table>
	

<cfinclude template="../footer.cfm">


</body>
</html>


