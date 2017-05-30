<!--- 06/29/2003 RR --->
<!--- 1. A server cfCache is created that expires everyday at 12:35 pm MDT - the time this was first run. Any New Content will show at that time automatically--->
<!--- <cfcache action="Flush"> --->
<!--- <CFIF xSwitch is 1>
<cfcache action="Cache" Timeout="#DateAdd('d',-1, Now())#"> 
</CFIF> --->

<!--- Decide where to start the random images based on page number> --->
<cfparam name="url.imgbegin" default="0">
<cfparam name="url.page" default="1">

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
<!--- Set variables --->
<cfset imgNextBeginNo = url.imgbegin> 
<cfset url.imgbegin=0> 
<cfset image=1>
<cfset imageposition=1>
<cfset ImageNumber = 1>
<CFSET xTitle="M a g n u m    P h o t o s">
<CFSET xPathToRoot="../../">
<CFSET xShowBackButton = 1>
<CFSET xShowMenu = 1>
<!---<cfinclude template="../../templates/Header.cfm">
--->	

<br />
<CFSET xMenuToShow = "Magnum">

<cfinclude template="/templates/title.cfm">

<table align="center" width="200"><tr><td><CFOUTPUT>#xHTMLTitle#</CFOUTPUT></td></tr></table>
<br />
<CFINCLUDE TEMPLATE="../../Menu.cfm">

 <CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">	
SELECT DISTINCT G.SubDirectory as SubDirectory, G.Firstname as Firstname, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, I.RecordNo, I.ImageSizeList, I.ImageNumber as Imagenumber, I.ImagePosition as ImagePosition, I.GeneralRandomNo as GeneralRandomNo,  p.ImgQty as ImageQTy,  P.Subdirectory as Portfolio
FROM GallerySetup G INNER JOIN
     GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
     GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
WHERE  P.ImgQty>0 <!---AND I.GeneralRandomNo>#imgNextBeginNo# ---> AND G.Gallery='MagnumArtists' and I.ImagePosition=1 and G.Tier=1  and P.ShowcaseOK=1
ORDER BY I.GeneralRandomNo
</cfquery>


<!--- Get total record count --->
 <CFQUERY NAME="qGetShowcaseRecordCount"  DATASOURCE="photoeyecom">	
SELECT DISTINCT G.SubDirectory as SubDirectory, G.Firstname as Firstname, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, I.ImageNumber as Imagenumber, I.ImagePosition as ImagePosition, I.GeneralRandomNo as GeneralRandomNo,  p.ImgQty as ImageQTy,  P.Subdirectory as Portfolio
FROM GallerySetup G INNER JOIN
     GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
     GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
WHERE  P.ImgQty>0 <!---AND I.GeneralRandomNo>0 ---> AND G.Gallery='MagnumArtists' and I.ImagePosition=1 and G.Tier=1  and P.ShowcaseOK=1
ORDER BY I.GeneralRandomNo
</cfquery>
<cfset recordcount=qGetShowcaseRecordCount.recordcount>


 
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
SELECT TOP 12 G.SubDirectory as SubDirectory, G.Firstname as Firstname, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, I.RecordNo, I.ImageSizeList, I.ImageNumber as Imagenumber, I.ImagePosition as ImagePosition, I.GeneralRandomNo as GeneralRandomNo,  p.ImgQty as ImageQTy,  P.Subdirectory as Portfolio
FROM GallerySetup G INNER JOIN
     GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
     GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
WHERE  P.ImgQty>0 <!---AND I.GeneralRandomNo>#imgBegin#  ---> AND G.Gallery='MagnumArtists' and G.Tier=1 AND I.ImagePosition=1  and P.ShowcaseOK=1
ORDER BY I.GeneralRandomNo 
			</cfquery>
			<cfloop query="qGetNextBeginningRandomNumber" startrow="1" endrow="12">			
				<cfset imgBegin = qGetNextBeginningRandomNumber.GeneralRandomNo>
			</cfloop>
		
  <cfif counter is 1>
	<cfif #counter# is #page#>
	<FONT color="Yellow" face="verdana, arial, Helvetica, sans-serif" size="2"><b>#counter#</b></font>
	<cfelse>

<!--- this page cannot be found in the prior design --->
			 <!--- Write Next Page Number --->
		 <a href="homepagePS1New2.cfm?imgbegin=0&Page=#counter#"><FONT color="silver" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='silver';"  style="TEXT-DECORATION: none"><b>#counter#</b></font></a>
	
	</cfif> <!--- End if counter is 1 --->
  </cfif> <!--- End if page 1 --->
  
  
  
  <!--- If Counter is between 1 and 11 --->
  <cfif counter gt 1 and counter lt 11>
 	<cfif #counter# is #page#>
	- <FONT color="Yellow" face="verdana, arial, Helvetica, sans-serif" size="2"><b>#counter#</b></font>
	<cfelse>

			<!--- this page cannot be found in the prior design --->
			<!--- Write Next Page Number --->
	-		 <a href="homepagePS1New2.cfm?imgbegin=#imgNextBeginNo#&Page=#counter#"><FONT color="silver" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='silver';"  style="TEXT-DECORATION: none"><b>#counter#</b></font></a>
			
	</cfif> <!--- End if counter and page are the same --->
  </cfif> <!--- End if Counter is between 1 and 11 --->
  
  
  <cfif counter is 11>
 	<cfif #counter# is #page#>
	- <FONT color="Yellow" face="verdana, arial, Helvetica, sans-serif" size="2"><b>11+</b></font>
	<cfelse>
			<!--- this page cannot be found in the prior design --->
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
WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 <!---AND D.GeneralRandomNo>#imgbeginType2#---> AND G.Gallery='MagnumArtists' and G.Tier=1  and P.ShowcaseOK=1
ORDER BY D.GeneralRandomNo
</cfquery>

<!--- Takes into account random number being too high--->
<cfif qGetShowcase.recordcount is 0>
	<CFQUERY NAME="qGetShowcase"  DATASOURCE="photoeyecom">
SELECT DISTINCT TOP 1 G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
    P.Subdirectory as Portfolio, D.GeneralRandomNo
FROM GallerySetup AS G,  GalleryDefaultPhotos as D, GalleryPortfolio as P
WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 <!---AND D.GeneralRandomNo<#imgbeginType2# --->AND G.Gallery='MagnumArtists' and G.Tier=1  and P.ShowcaseOK=1
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
	
		<cfif firsttime is 0 and counter is 4>
			 <hr width="400" size="1" noshade>
			</cfif>
			
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
		 		 
		 <a href="/gallery/forms2/index.cfm?image=#ImageNumber#&id=#qGetShowcaseSetupInfo.Custnumber#&imagePosition=#ImagePosition#&Door=3&Portfolio=#qGetShowcaseSetupInfo.Portfolio#&Gallery=3">

		 
<!--- 		 <a href="../forms2/index.cfm?id=#qGetShowcaseSetupInfo.Custnumber#&image=#ImageNumber#&imagePosition=#ImagePosition#&Door=3&Portfolio=#qGetShowcaseSetupInfo.Portfolio#" target="_top"> --->

<!--- ImageSizer --->									
<cfset xheight=200>
<cfset xwidth=200>
<cfset xImageAddress="#xRelativePath#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#qGetShowcaseSetupInfo.Portfolio#\Images_Large\">
<cfset xAlt = "Enter Gallery">
<!---<cfset xImageNumber=RANDRANGE(1,5)>
<cfset xImage = "Image#xImageNumber#">--->
<cfset xImage = "Image#qGetShowcaseSetupInfo.ImageNumber#">
<cfset xImageFormat = "jpg">
<cfif NOT ListFindNoCase(qGetShowcaseSetupInfo.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")>
	<cfinclude template="/templates/imagesizercreate.cfm">
	<cfquery name="qUpdate"  datasource="photoeyecom">
		Update GalleryIndividualPhotos
		Set ImageSizeList = '#ListAppend(qGetShowcaseSetupInfo.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")#'
		Where RecordNo = #qGetShowcaseSetupInfo.RecordNo#
	</cfquery>
</cfif>
<img src="/artists/#qGetShowcaseSetupInfo.Subdirectory#/#qGetShowcaseSetupInfo.Portfolio#/Images_Large/#xImage#_H#xHeight#xW#xWidth#.#xImageFormat#" border="0" ALT="#xAlt#"></a>
<!--- End ImageSizer --->



<br>
 <img src="../../SharedImages/dot_clear.gif" width="1" height="20"><FONT color="##666666" face="verdana, arial, Helvetica, sans-serif" size="1"><b>#Ucase(qGetShowcaseSetupInfo.Firstname)# #Ucase(qGetShowcaseSetupInfo.Lastname)#</b></font></td>
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
			</table> </div>
		</cfif>
	</cfoutput>		
		
			</tr>
</table>
	</td>
	</tr>
</table>


