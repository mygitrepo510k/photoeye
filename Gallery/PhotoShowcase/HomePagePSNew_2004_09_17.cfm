
<!--- <cfcache action="Cache" Timeout="#DateAdd('s',-30, Now())#">
 --->
<!--- 06/27/2003 RR --->
<!--- Speed Improvements Added --->
<!--- 1. The 2 Cfqueries contain CachedWithin="#CreateTimeSpan(0,0,15,0)#"> Expires in 15 minutes. This is not needed since there is a server cache implimented (item 3 below)--->
<!--- 2. The 2 CFqueries contain BlockFactor="8" or BlockFactor="60" --->
<!--- 3. Most importantly, a server cfCache is created that expires everyday at 7:09 am MDT - the time this was first run.Any New Content will show at that time automatically--->

<!--- Uncomment the following line to delete the Cache --->
<!--- This must be done whenever there is new content --->
<!--- <cfcache action="Flush"> --->
<!--- This page will take about 55 seconds to run fresh --->
<!--- <cfcache action="Flush"> --->

<!--- The following code caches the database requests --->
<!--- <CFIF xSwitch is 1>
<cfcache action="Cache" Timeout="#DateAdd('d',-1, Now())#"> 
</CFIF> --->


<!--- Decide where to start the random images based on page number --->
<cfparam name="url.imgbegin" default="0">
<cfparam name="url.page" default="1">

<!--- Set variables --->
<cfset imgNextBeginNo = url.imgbegin> 
<cfset url.imgbegin=0> 
<cfset image=1>
<cfset imageposition=1>
<cfset ImageNumber = 1>
<CFSET xTitle="Photographer's Showcase">
<CFSET xPathToRoot="../../">
<CFSET xShowBackButton = 1>
<CFSET xShowMenu = 1>
<cfinclude template="../../templates/Header.cfm">
	

<CFSET xTitle="Photographer's Showcase">
<CFSET xMenuToShow = "Showcase">
<CFINCLUDE TEMPLATE="../Menu.cfm">

<BR>
<CFSET xSubtitle = "Selected Artists">
<cfinclude template="../../templates/title.cfm">
<DIV ALIGN="CENTER">
<CFOUTPUT>#xHTMLTitle#</CFOUTPUT>

<!--- First Query that includes only 8 images --->
<!--- CACHEDWITHIN="#CreateTimeSpan(0,0,15,0)#"  --->
 <cfquery name="qGetShowcaseSetupInfo"  datasource="photoeyecom" BlockFactor="8">	
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



  
<!--- Url.ImgBegin is no longer defined by Url variable. Instead it is now defined as
url.imgbegin = qGetNextBeginningRandomNumber.GeneralRandomNo above--->
<cfparam name="imgbeginType2" default="0">
<cfif url.page GT 1>
	<cfset imgbeginType2=#url.imgBegin#>
</cfif>

<!--- Query based on the above imgbegintype2 CachedWithin="#CreateTimeSpan(0,0,15,0)#" --->
<cfquery name="qGetShowcaseRandom"  datasource="photoeyecom" BlockFactor="60">
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
		 <a href="../forms/index.cfm?image=#ImageNumber#&id=#qGetShowcaseSetupInfo.Custnumber#&imagePosition=#ImagePosition#&Door=2&Portfolio=#qGetShowcaseSetupInfo.Portfolio#&Gallery=2">
<!--- 		 <cfif #qGetImagePortfolioCount.PortfolioQty# is 1>
		 <a href="../forms/index.cfm?image=#ImageNumber#&id=#qGetShowcaseSetupInfo.Custnumber#&imagePosition=#ImagePosition#&Door=2&Portfolio=#qGetShowcaseSetupInfo.Portfolio#&Gallery=2" target="_top">
 		<cfelse>
		 <a href="../forms/homepage.cfm?image=#ImageNumber#&id=#qGetShowcaseSetupInfo.Custnumber#&imagePosition=#ImagePosition#&Door=2&Portfolio=#qGetShowcaseSetupInfo.Portfolio#&Gallery=2" target="_top">		
		</cfif> --->
		
<CFIF xPan is 1>									
	<img SRC="http://www.visualserver.com/artists/#qGetShowcaseSetupInfo.Subdirectory#/#qGetShowcaseSetupInfo.Portfolio#/search.gif" Border="0">
<CFELSE>
<!--- ImageSizer --->									
<cfset xheight=120>
<cfset xwidth=120>
<cfset xImageAddress="#xRelativePath#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#qGetShowcaseSetupInfo.Portfolio#\Images_Large\">	
<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image#qGetShowcaseSetupInfo.ImageNumber#.jpg">

<cfinclude template="../../templates/imagesizer.cfm">

<img src="../../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#">
<!--- End ImageSizer --->
</CFIF></a>
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
		 
		 <a href="../forms/index.cfm?image=#ImageNumber#&id=#qGetShowcaseRandom.Custnumber#&imagePosition=#ImagePosition#&Door=2&Portfolio=#qGetShowcaseRandom.Portfolio#&Gallery=2">


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
	<img SRC="http://www.visualserver.com/artists/#qGetShowcaseRandom.Subdirectory#/#qGetShowcaseRandom.Portfolio#/search.gif" border="0">
<CFELSE>
<!--- ImageSizer --->									
<cfset xheight=120>
<cfset xwidth=120>
<cfset xImageAddress="#xRelativePath#\Artists\#qGetShowcaseRandom.Subdirectory#\#qGetShowcaseRandom.Portfolio#\Images_Large\">	
<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image#qGetShowcaseRandom.ImageNumber#.jpg">

<cfinclude template="../../templates/imagesizer.cfm">

<img src="../../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#">
<!--- End ImageSizer --->
</CFIF></a>

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

<cfinclude template="../../templates/footer_site.cfm">



