<!--- Decide where to start the random images based on page number --->
<cfparam name="url.imgbegin" default="0">
<cfparam name="url.page" default="1">

<!--- Set variables --->
<cfset imgNextBeginNo = url.imgbegin> 
<cfset url.imgbegin=0> 
<cfset image=1>
<cfset imageposition=1>
<cfset ImageNumber = 1>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase</title>

<!--- Popup Window for top of screen Menu items --->	
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

<!--- Begin overall div --->
	
<div align="CENTER">

<table width="80%" height="36" border="0" align="center" bgcolor="Black">
<tr>

    <td  width="95%" height="51" align="center"><a href="../homepage.cfm"><img src="SharedImages/photoeyeexplorephotographersshowcase7.jpg" width="384" height="84" alt="" border="0"></a></td>

</tr>
</table>
<!--- Top of screen Menu System --->


<table width="80%" border="0" align="center">
	<tr>
    	<td  width="95%" align="center">
  <div align="center"><b>
 <img src="../SharedImages/dot_clear.gif" width="1" height="1"><a href="../index.cfm"><font color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onmouseover="this.color='RED';" onmouseout="this.color='Maroon';"  style="TEXT-DECORATION: none">All Galleries Home</font></a><font color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;| &nbsp;</font><a href="javascript:popUp('newdocumentation/Artists/SubmissionProcess2.html','Popup','600','460');" target="_top"><font color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onmouseover="this.color='RED';" onmouseout="this.color='Maroon';"  style="TEXT-DECORATION: none">Exhibit Your Work!</font></a><font color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;| &nbsp;</font><a href="javascript:popUp('newdocumentation/artists/overviewphotographers3.html','Popup','600','460');" target="_top"><font color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onmouseover="this.color='RED';" onmouseout="this.color='Maroon';"  style="TEXT-DECORATION: none">Showcase Information</font></a><font color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;| &nbsp;</font><a href="javascript:popUp('../ShippingCosts.html','Popup','600','460');"><font color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onmouseover="this.color='RED';" onmouseout="this.color='Maroon';"  style="TEXT-DECORATION: none">Shipping Costs</font></a><font color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;| &nbsp;</font><a href="javascript:popUp('../../templates/viewshoppingcartcontentsphotoshowcase.cfm?Showcase=2','MyWindowOrder','600','500');"><font color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onmouseover="this.color='RED';" onmouseout="this.color='Maroon';"  style="TEXT-DECORATION: none">View Your Order</font></a></b>
<br></div>
</td></tr></table>
<!--- End top of screen menu system --->

<!--- Top of Page Title --->
<img src="../SharedImages/dot_clear.gif" width="1" height="10"><div align="center"><b><font face="verdana, arial, helvetica, sans-serif" size="2" color="black">P 
    H O T O G R A P H E R ' S&nbsp;&nbsp;&nbsp;&nbsp;S H O W C A S E <sup><font size="1">&reg;</font></sup></font></b></div><hr width="400" size="1" noshade><font face="verdana, arial, helvetica, sans-serif" size="1" color="#666666"><b>
A Juried Sales and Exhibition Gallery Devoted to Serious Artists Worldwide</b></font><br><img src="../SharedImages/dot_clear.gif" width="1" height="5"><font face="verdana, arial, helvetica, sans-serif" size="1" color="#333333"><b><br><a href="SearchShowcase.cfm?Gallery=2"><font color="navy">Search</font></a> our Photographer's Showcase Directories</b></font>
<!--- End Top of Page Title --->

<!--- First Query that includes only 8 images --->
 <cfquery name="qGetShowcaseSetupInfo"  datasource="photoeyecom">	
SELECT DISTINCT TOP 8 P.AutoID as AutoID, G.SubDirectory as SubDirectory, G.Firstname as Firstname, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, I.ImageNumber as Imagenumber, I.ImagePosition as ImagePosition, I.GeneralRandomNo as GeneralRandomNo,  p.ImgQty as ImageQTy,  P.Subdirectory as Portfolio, P.DateTime as DateTime,  p.ExhibitionOpened
FROM GallerySetup G INNER JOIN
     GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
     GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
WHERE  P.ImgQty>0 <!--- AND I.GeneralRandomNo>#imgNextBeginNo#  ---> AND G.Gallery='PhotoShowcase' and I.ImagePosition=1 and G.Tier=1 and P.ShowcaseOK=1 ORDER BY P.EXHIBITIONOPENED DESC 
<!--- ORDER BY I.GeneralRandomNo --->
</cfquery>

<!--- Set List variable based on autoids retrieved from above query.
These will be excluded from a future query --->
<cfset xAutoIDList=#ValueList(qGetShowcaseSetupInfo.AutoID)#>


<!--- Not used as all images are currently on one page 
<!--- Get total record count --->
<!--- Different from above Query: Where Clause, 
I.GeneralRAndomNo>0 instead of I.GeneralRAndomNo>#imgNextBeginNo# --->
 <cfquery name="qGetShowcaseRecordCount"  datasource="photoeyecom">	
SELECT DISTINCT G.SubDirectory as SubDirectory, G.Firstname as Firstname, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, I.ImageNumber as Imagenumber, I.ImagePosition as ImagePosition, I.GeneralRandomNo as GeneralRandomNo,  p.ImgQty as ImageQTy,  P.Subdirectory as Portfolio, P.DateTime as DateTime,  p.ExhibitionOpened
FROM GallerySetup G INNER JOIN
     GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
     GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
WHERE  P.ImgQty>0 AND I.GeneralRandomNo>0  AND G.Gallery='PhotoShowcase' and I.ImagePosition=1 and G.Tier=1 and P.ShowcaseOK=1 ORDER BY P.EXHIBITIONOPENED DESC 
<!--- ORDER BY I.GeneralRandomNo --->
</cfquery>
<cfset recordcount=qGetShowcaseRecordCount.recordcount> 
<!--- End Get total record count ---> 
--->
 
<cfoutput>
<!--- The following is not currently Used  
<!---  Page Links:  1 - 2 - 3 - 4 - 5 - 6 - 7 - 8 - 9 - 10 - 11+ --->  


<!--- if there are enough records to have more than one page --->
<cfif recordcount gt 12>

<cfset Additional = #RecordCount#/12>
<cfset Additional = #ceiling(Additional)#> 	
<cfset EndLoop=12*#Additional#>
<cfset counter = 1>
  
 <!--- Outer Loop 1 - Writes all Page Numbers and Increments Counter--->
 <cfloop index="NumberHeader" from="1" to="#Additional#" step="1">
	<cfset imgNextBeginNo = #imgBegin#>
   				<cfquery name="qGetNextBeginningRandomNumber"  datasource="photoeyecom">
SELECT TOP 36 G.SubDirectory as SubDirectory, G.Firstname as Firstname, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, I.ImageNumber as Imagenumber, I.ImagePosition as ImagePosition, I.GeneralRandomNo as GeneralRandomNo,  p.ImgQty as ImageQTy,  P.Subdirectory as Portfolio, P.DateTime as DateTime, p.ExhibitionOpened
FROM GallerySetup G INNER JOIN
     GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
     GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
WHERE  P.ImgQty>0 AND I.GeneralRandomNo>#imgBegin#   AND G.Gallery='PhotoShowcase' and G.Tier=1 AND I.ImagePosition=1 and P.ShowcaseOK=1 ORDER BY P.EXHIBITIONOPENED DESC 
<!--- ORDER BY I.GeneralRandomNo  --->
			</cfquery>
			<cfloop query="qGetNextBeginningRandomNumber" startrow="1" endrow="12">			
				<cfset url.imgbegin = qGetNextBeginningRandomNumber.GeneralRandomNo>
			</cfloop>

  <cfif counter is 11>
 	<cfif #counter# is #url.page#>
	- <font color="Yellow" face="verdana, arial, Helvetica, sans-serif" size="2"><b>11+</b></font>
	<cfelse>

			<!--- Write Next Page Number --->
	-		 <a href="homepagePS1New2.cfm?imgbegin=#imgNextBeginNo#&Page=#counter#"><font color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onmouseover="this.color='RED';" onmouseout="this.color='Maroon';"  style="TEXT-DECORATION: none"><b>#counter#</b></font></a>	
	</cfif> <!--- End if counter and page are the same --->
  </cfif> <!--- End if Counter is between 1 and 11 --->
  <cfset counter = counter+1>
</cfloop> 

<!--- End outer loop --->
</cfif> 
<!--- End if there are enough records to have more than one page --->
--->


<!--- Images --->
<!--- Title for Images --->
<br> 
<font color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1"><b>Click Images to View Artists' Portfolios</b></font><img src="../SharedImages/dot_clear.gif" width="1" height="20">
<!--- End Title for Images --->


  
<!--- Url.ImgBegin is no longer defined by Url variable. Instead it is now defined as
url.imgbegin = qGetNextBeginningRandomNumber.GeneralRandomNo above--->
<cfparam name="imgbeginType2" default="0">
<cfif url.page GT 1>
	<cfset imgbeginType2=#url.imgBegin#>
</cfif>

<!--- Query based on the above imgbegintype2 --->
<cfquery name="qGetShowcaseRandom"  datasource="photoeyecom">
SELECT DISTINCT P.AutoID as AutoID, G.SubDirectory as SubDirectory, G.Firstname as Firstname, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, I.ImageNumber as Imagenumber, I.ImagePosition as ImagePosition, I.GeneralRandomNo as GeneralRandomNo,  p.ImgQty as ImageQTy,  P.Subdirectory as Portfolio, P.DateTime as DateTime,  p.ExhibitionOpened
FROM GallerySetup G INNER JOIN
     GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
     GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
WHERE  P.ImgQty>0 AND G.Gallery='PhotoShowcase' and I.ImagePosition=1 and G.Tier=1 and P.ShowcaseOK=1   and
P.AutoID<>#ListGetAt(xAutoIDList, 1)# and 
P.AutoID<>#ListGetAt(xAutoIDList, 2)# and 
P.AutoID<>#ListGetAt(xAutoIDList, 3)# and
P.AutoID<>#ListGetAt(xAutoIDList, 4)# and
P.AutoID<>#ListGetAt(xAutoIDList, 5)# and
P.AutoID<>#ListGetAt(xAutoIDList, 6)# and
P.AutoID<>#ListGetAt(xAutoIDList, 7)# and
P.AutoID<>#ListGetAt(xAutoIDList, 8)# 
ORDER BY D.GeneralRandomNo  

<!--- ORDER BY P.DATETIME DESC  --->
<!--- ORDER BY D.GeneralRandomNo --->
</cfquery>


<!--- Not used as random number is not part of where clause above 
<!--- Takes into account random number being too high--->
<cfif qGetShowcaseRandom.recordcount is 0>
	<cfquery name="qGetShowcaseRandom"  datasource="photoeyecom">
SELECT DISTINCT TOP 1 G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
    P.Subdirectory as Portfolio, D.GeneralRandomNo, P.DateTime as DateTime
FROM GallerySetup AS G,  GalleryDefaultPhotos as D, GalleryPortfolio as P
WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 AND D.GeneralRandomNo<#imgbeginType2# AND G.Gallery='PhotoShowcase' and G.Tier=1  and P.ShowcaseOK=1 ORDER BY P.DATETIME DESC 
<!--- ORDER BY D.GeneralRandomNo DESC --->
	</cfquery>
</cfif> --->
</cfoutput>
<br><br>


<!--- Show the Images for the first two rows, 8 images total--->
		
	<cfset firsttime=1>
	<cfset counter=1>
	<cfoutput query="qGetShowcaseSetupInfo" startrow=1 maxrows=8>
	 <cfif counter is 1>
	 <div align="center">  
	
	
	 <table width="600" border="0" cellpadding="10">
			<tr>
	 </cfif>
		 		<cfquery name="qGetImagePortfolioCount"  datasource="photoeyecom">
SELECT COUNT(*) AS PortfolioQty, SUM(ImgQty) AS ImgQty
FROM GalleryPortfolio
WHERE (Custnumber = #qGetShowcaseSetupInfo.Custnumber#)
</cfquery>

<!--- Panorama? --->
	<CFQUERY NAME="qGetPanorama"  DATASOURCE="photoeyecom">
	 	SELECT Panorama
  		FROM GalleryPortfolio where Custnumber=#qGetShowcaseSetupInfo.Custnumber# and SubDirectory = '#qGetShowcaseSetupInfo.Portfolio#'
	</CFQUERY>
	
	<CFIF qGetPanorama.Panorama is 1>
		<CFSET xPan = 1>
	<CFELSE>	
		<CFSET xPan = 0>
	</CFIF>
		 
		 <td height="125" align="center">
		 
		 <cfif #qGetImagePortfolioCount.PortfolioQty# is 1>
		 <a href="../forms/index.cfm?id=#qGetShowcaseSetupInfo.Custnumber#&image=#ImageNumber#&imagePosition=#ImagePosition#&Door=2&Portfolio=#qGetShowcaseSetupInfo.Portfolio#&Gallery=2" target="_top">
 		<cfelse>
		 <a href="../forms/homepage.cfm?id=#qGetShowcaseSetupInfo.Custnumber#&image=#ImageNumber#&imagePosition=#ImagePosition#&Door=2&Portfolio=#qGetShowcaseSetupInfo.Portfolio#&Gallery=2" target="_top">		
		</cfif>
		
<CFIF xPan is 1>									
	<img SRC="http://www.visualserver.com/artists/#qGetShowcaseSetupInfo.Subdirectory#/#qGetShowcaseSetupInfo.Portfolio#/search.gif">
<CFELSE>
<!--- ImageSizer --->									
<cfset xheight=120>
<cfset xwidth=120>
<cfset xPath= "http://www.visualserver.com/artists/#qGetShowcaseSetupInfo.Subdirectory#/#qGetShowcaseSetupInfo.Portfolio#/Images_Large/">
<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image#qGetShowcaseSetupInfo.ImageNumber#.jpg">

<cfinclude template="../../templates/imagesizer.cfm">

<img src="../../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a>
<!--- End ImageSizer --->
</CFIF>
<br>
 <img src="../SharedImages/dot_clear.gif" width="1" height="20"><font color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1"><b>#Ucase(qGetShowcaseSetupInfo.Firstname)# #UCase(qGetShowcaseSetupInfo.Lastname)#</b></font></td>
		<cfset url.imgbegin = qGetShowcaseSetupInfo.GeneralRandomNo> 
<!--- 		#qGetShowcaseSetupInfo.GeneralRandomNo# --->
		<cfset counter=counter+1>	
		<!--- <cfif counter is 5> --->
		<cfif counter is 5 or qGetShowcaseSetupInfo.recordcount+1 is Counter>
			<cfset counter=1>
			<cfset firsttime=0>
			</tr>
			</table> <cfif firsttime is 0>
			 <hr width="400" size="1" noshade>
			</cfif></div>
		</cfif>
	</cfoutput>		
		<!--- If above table is not complete --->
		</tr>
	</table>
	<!--- End Show the Images for thefirst two rows, 8 images total --->
	
	
	
	
<!--- Show the Images for all additional Randomized rows for a total of 100 possible images --->
		
	<cfset firsttime=1>
	<cfset counter=1>
	<cfoutput query="qGetShowcaseRandom" startrow=1 maxrows=92>
	 <cfif counter is 1>
	 <div align="center">  
	
	
	 <table width="600" border="0" cellpadding="10">
			<tr>
	 </cfif>
		 		 	<cfquery name="qGetImagePortfolioCount"  datasource="photoeyecom">
SELECT COUNT(*) AS PortfolioQty, SUM(ImgQty) AS ImgQty
FROM GalleryPortfolio
WHERE (Custnumber = #qGetShowcaseRandom.Custnumber#)
</cfquery>
		 
		 <td height="125" align="center">
		 
		 <cfif #qGetImagePortfolioCount.PortfolioQty# is 1>
		 <a href="../forms/index.cfm?id=#qGetShowcaseRandom.Custnumber#&image=#ImageNumber#&imagePosition=#ImagePosition#&Door=2&Portfolio=#qGetShowcaseRandom.Portfolio#&Gallery=2" target="_top">
 		<cfelse>
		 <a href="../forms/homepage.cfm?id=#qGetShowcaseRandom.Custnumber#&image=#ImageNumber#&imagePosition=#ImagePosition#&Door=2&Portfolio=#qGetShowcaseRandom.Portfolio#&Gallery=2" target="_top">		
		</cfif>

		<!--- Panorama? --->
	<CFQUERY NAME="qGetPanorama"  DATASOURCE="photoeyecom">
	 	SELECT Panorama
  		FROM GalleryPortfolio where Custnumber=#qGetShowcaseRandom.Custnumber# and SubDirectory = '#qGetShowcaseRandom.Portfolio#'
	</CFQUERY>
	
	<CFIF qGetPanorama.Panorama is 1>
		<CFSET xPan = 1>
	<CFELSE>	
		<CFSET xPan = 0>
	</CFIF>
		
<CFIF xPan is 1>									
	<img SRC="http://www.visualserver.com/artists/#qGetShowcaseRandom.Subdirectory#/#qGetShowcaseRandom.Portfolio#/search.gif">
<CFELSE>
<!--- ImageSizer --->									
<cfset xheight=120>
<cfset xwidth=120>
<cfset xPath= "http://www.visualserver.com/artists/#qGetShowcaseRandom.Subdirectory#/#qGetShowcaseRandom.Portfolio#/Images_Large/">
<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image#qGetShowcaseRandom.ImageNumber#.jpg">

<cfinclude template="../../templates/imagesizer.cfm">

<img src="../../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a>
<!--- End ImageSizer --->
</CFIF>

<br>
 <img src="../SharedImages/dot_clear.gif" width="1" height="20"><font color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1"><b>#Ucase(qGetShowcaseRandom.Firstname)# #UCase(qGetShowcaseRandom.Lastname)#</b></font></td>
		<cfset url.imgbegin = qGetShowcaseRandom.GeneralRandomNo> 
<!--- 		#qGetShowcaseRandom.GeneralRandomNo# --->
		<cfset counter=counter+1>	
		<!--- <cfif counter is 5> --->
		<cfif counter is 5 or qGetShowcaseRandom.recordcount+1 is Counter>
			<cfset counter=1>
			<cfset firsttime=0>
			</tr>
			</table> <cfif firsttime is 0>
			 <hr width="400" size="1" noshade>
			</cfif></div>
		</cfif>
	</cfoutput>		
		<!--- If above table is not complete --->
		</tr>
	</table>
	<!--- End Show the Images for the all other rows --->
	
	
	
	
	
	<!--- End Images --->

</div>
<!--- End overall div --->

<cfinclude template="../footer.cfm">


</body>
</html>


