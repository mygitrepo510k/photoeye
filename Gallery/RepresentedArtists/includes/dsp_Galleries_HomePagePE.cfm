<cfset xTreePath="../">

<CFSET xTitle="p h o t o - e y e    s a n t a    f e">


	<CFSET xMenuToShow = "Santa Fe">

<cfset xwebsite="www.photoeye.com">

<img src="http://www.photoeye.com/images/photo-eye_Gallery.jpg" height="70" width="264" >
<p style="line-height:28px;"></p>
 
<!--- Menu bar --->
 <CFINCLUDE TEMPLATE="dsp_Galleries_Menu.cfm">  

<CFSET xSubtitle = "Gallery Artists">
<!--- RR New shows: Need to manually put this in --->
 <CFOUTPUT>

<!--- http://www.photoeye.com/solar --->

 

<!--- <FONT color="##666666" face="verdana, arial, Helvetica, sans-serif" size="4">Group Exhibition</font><br>--->
<FONT color="##999999" face="verdana, arial, Helvetica, sans-serif" size="2">
<strong>
<cfset xalt="FIRE and ICE"> 
<img src="http://www.photoeye.com/gallery/images/fireandice2.jpg" border="0" ALT="#xAlt#" width="400" height="710" style="padding-bottom:10px;"><br>
<div style="line-height:22px;font-size:18px;">Alan Friedman and Douglas Levere<br />FIRE and ICE<br />

<br>
<span style="line-height:28px; font-size:16px;">Opening and Artist Reception Friday, January 29th, 5&ndash;7pm<br></strong></span></div>
<br>
<a href="http://www.photoeye.com/gallery/forms2/index.cfm?image=1&id=206210&imagePosition=1&Door=1&Portfolio=Portfolio3&Gallery=1&Page=">View Alan Friedman's photographs</a> | 
<a href="http://www.photoeye.com/gallery/forms2/index.cfm?image=1&id=206211&imagePosition=1&Door=1&Portfolio=Portfolio1&Gallery=1">View Douglas Levere's photographs</a><br /><br />
<span style="line-height:20px; font-size:14px;">Exhibition continues through April 9th, 2016<br>
<!--- Next show: Carla van de Puttelaar - Cranach Series, opening October 22nd<br> --->

<a href="mailto:anne@photoeye.com?Subject=#xalt#">Contact Anne Kelly</a>  505.988.5152 x121 for details.<br /><br />


The gallery is open Tuesday-Saturday 10-5:30 pm or by appointment<br /> 
photo-eye Gallery, 541 S. Guadalupe St. (in the Railyard Arts District), Santa Fe, NM 87501<br><br>
</font></span>

 <!--- &mdash; &nbsp;  &mdash; &nbsp;  &mdash; &nbsp;  &mdash; &nbsp; &mdash; &nbsp;  &mdash; &nbsp;  &mdash; &nbsp;  &mdash; &nbsp;  &mdash; &nbsp;  &mdash; &nbsp;  &mdash; &nbsp;  &mdash; &nbsp; &mdash; &nbsp;  &mdash; &nbsp;  &mdash; &nbsp;  &mdash; &nbsp; --->
<div align="center"> <span style="color:maroon;">. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . </span><br> <br> G A L L E R Y &nbsp;&nbsp;A R T I S T S &nbsp;   </div>

</CFOUTPUT>



<CFSET xTableWidth="18">




<!--- 06/27/2003 RR --->
<!--- 1. A server cfCache is created that expires everyday at 12:12 pm MDT - the time this was first run. Any New Content will show at that time automatically--->
<!--- <cfcache action="Flush"> --->
<!--- <cfcache action="Cache" Timeout="#DateAdd('d',-1, Now())#"> --->

<!--- Decide where to start the random images based on page number> --->
<!--- <cfset imgbegin=((#url.page#/2)*20)> --->
<cfif Isdefined("url.page")>
	<cfif #url.page# gt 1>
		<cfset page=#url.page#>
	</cfif>
	<!--- <cfset additional=#url.additional#> --->
<cfelse>
	<cfset page=1>
	<cfset imgBegin=0> 
</cfif>

<!--- <cfset imgNextBeginNo = imgBegin>  --->
<cfset imgBegin=0> 
<cfset image=1>
<cfset imageposition=1>
<!--- <cfoutput>
   #imgnextBeginno#  --->
<!--- <cfif imgNextBeginNo is not 0>
	<cfset imgNextBeginNo =#DateFormat(imgNextBeginNo,"mm/dd/yyyy")#>
</cfif> --->
<!--- 	#imgnextBeginno#
</cfoutput> --->

	
<DIV ALIGN="CENTER">


 <!--- Get All records to display --->
 <!--- Date ExhibitionOpened must exit --->    
<!--- <cfif imgNextBeginNo is 0> --->

 <CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">	
SELECT DISTINCT G.SubDirectory as SubDirectory, G.Firstname as Firstname, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, I.RecordNo, I.ImageSizeList, I.ImageNumber as Imagenumber, I.ImagePosition as ImagePosition, I.GeneralRandomNo as GeneralRandomNo,  p.ImgQty as ImageQTy,  P.Subdirectory as Portfolio, P.ExhibitionOpened, P.OpeningSortOrder
FROM GallerySetup G INNER JOIN
     GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
     GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
WHERE  P.ImgQty>0  AND G.Gallery='RepresentedArtists' and I.ImagePosition=1 and G.Tier=1  and P.ShowcaseOK=1 
ORDER BY P.OpeningSortOrder DESC
</cfquery> 



<!--- <cfdump var="#qGetShowcaseSetupInfo#"><cfabort>


 <CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">	
SELECT DISTINCT G.SubDirectory as SubDirectory, G.Firstname as Firstname, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, I.ImageNumber as Imagenumber, I.ImagePosition as ImagePosition, I.GeneralRandomNo as GeneralRandomNo,  p.ImgQty as ImageQTy,  P.Subdirectory as Portfolio, P.ExhibitionOpened, P.OpeningSortOrder
FROM GallerySetup G INNER JOIN
     GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
     GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
WHERE  P.ImgQty>0  AND G.Gallery='RepresentedArtists' and I.ImagePosition=1 and G.Tier=1  and P.ShowcaseOK=1 
ORDER BY  P.OpeningSortOrder DESC
</cfquery>  --->



<!--- <cfelse>

 <CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">	
SELECT DISTINCT G.SubDirectory as SubDirectory, G.Firstname as Firstname, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, I.ImageNumber as Imagenumber, I.ImagePosition as ImagePosition, I.GeneralRandomNo as GeneralRandomNo,  p.ImgQty as ImageQTy,  P.Subdirectory as Portfolio, P.ExhibitionOpened, P.OpeningSortOrder
FROM GallerySetup G INNER JOIN
     GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
     GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
WHERE  P.ImgQty>0 AND P.OpeningSortOrder<=#imgNextBeginNo#  AND G.Gallery='RepresentedArtists' and I.ImagePosition=1 and G.Tier=1  and P.ShowcaseOK=1 
ORDER BY  P.OpeningSortOrder DESC
</cfquery> --->

<!---  <CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">	
SELECT DISTINCT G.SubDirectory as SubDirectory, G.Firstname as Firstname, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, I.ImageNumber as Imagenumber, I.ImagePosition as ImagePosition, I.GeneralRandomNo as GeneralRandomNo,  p.ImgQty as ImageQTy,  P.Subdirectory as Portfolio, P.ExhibitionOpened, P.OpeningSortOrder
FROM GallerySetup G INNER JOIN
     GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
     GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
WHERE  P.ImgQty>0  AND G.Gallery='RepresentedArtists' and I.ImagePosition=1 and G.Tier=1  and P.ShowcaseOK=1 
ORDER BY  P.OpeningSortOrder DESC
</cfquery>

</cfif> --->


<!--- <cfoutput>#imgNextBeginNo#</cfoutput> --->
<!--- Get total record count --->
<CFQUERY NAME="qGetShowcaseRecordCount"  DATASOURCE="photoeyecom">	
SELECT DISTINCT G.SubDirectory as SubDirectory, G.Firstname as Firstname, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, I.ImageNumber as Imagenumber, I.ImagePosition as ImagePosition, I.GeneralRandomNo as GeneralRandomNo,  p.ImgQty as ImageQTy,  P.Subdirectory as Portfolio, P.ExhibitionOpened, P.OpeningSortOrder
FROM GallerySetup G INNER JOIN
     GalleryPortfolio P ON G.Custnumber = P.Custnumber INNER JOIN
     GalleryIndividualPhotos I ON P.SubDirectory = I.PortfolioName AND I.Custnumber = G.Custnumber
WHERE  P.ImgQty>0 AND P.OpeningSortOrder>0  AND G.Gallery='RepresentedArtists' and I.ImagePosition=1 and G.Tier=1  and P.ShowcaseOK=1 
ORDER BY  P.OpeningSortOrder DESC	
</cfquery>  <!--- I.GeneralRandomNo>0  AND --->

<cfset recordcount=qGetShowcaseRecordCount.recordcount>

<!--- 
<table width="80%" border="0" align="center">
	<tr>
    	<td  width="95%" align="center">
     <div align="center"><b> 
<a href="javascript:popUp('ExhibitionSchedule.html','MyWindowSchedule',600,460);"><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Maroon';"  style="TEXT-DECORATION: none">Exhibition Schedule</font></a><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1">&nbsp; | &nbsp;</font><a href="javascript:popUp('map.html','Popup','600','620');"><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Maroon';"  style="TEXT-DECORATION: none">Locator Map</font></a><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;| &nbsp;</font><a href="javascript:popUp('../ShippingCosts.html','Popup','600','460');"><!--- <a href="http://www.magnumphotos.com/about.html" target="_top"> ---><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Maroon';"  style="TEXT-DECORATION: none">Shipping Costs</font></a></b><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1">
</td></tr></table> --->



    <!---   1 - 2 - 3 - 4 - 5 - 6 - 7 - 8 - 9 - 10 - 11+ --->  
<cfoutput>

<cfset Additional = #RecordCount#/16>
<cfset Additional = #ceiling(Additional)#> 
<!--- <cfset BeginLoop=1> --->
<cfset EndLoop=16*#Additional#>
<cfset counter = 1>
<cfset nBeginRow=1>
<cfset nEndRow=16>
<cfset imgbegin=recordcount>
<cfset lcurrentpage=0>
<cfset xnextpagebegin=0>


<DIV ALIGN="CENTER">
	
<TABLE><TR>
 <cfloop index="NumberHeader" from="1" to="#Additional#" step="1">

		<cfset imgNextBeginNo = #imgBegin#>
	<cfif lcurrentpage is 1>
		<cfset xnextpagebegin=imgNextBeginNo>
		<cfset lcurrentpage = 0>
	</cfif>

	<cfset nBeginRow=nBeginRow+16>
	<cfset nEndRow=nEndRow+16>
		
  <cfif counter is 1>

	<cfif #counter# is #page#>
	<cfset lcurrentpage=1>
	<!--- <TD HEIGHT="22" WIDTH="#xTableWidth#" ALIGN="CENTER"><b><FONT SIZE="4" style="font-size:20px" COLOR="MAROON">#Counter#</FONT></b></TD> --->
	
	<cfelse>
 
<!--- 		<cfif additional GT 1>
	<cfset PreviousPage=Page-1>
	<a href="homepagePE.cfm?Page=#PreviousPage#"><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Maroon';"  style="TEXT-DECORATION: none"><b><!--- <&nbsp; --->Back</b></font></a> -	
	</cfif> --->
			 <!--- Write Next Page Number --->
<!--- 		 <a href="homepagePE.cfm?Page=#counter#"><FONT color="Gray" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='Maroon';" onMouseout="this.color='Gray';"  style="TEXT-DECORATION: none"><b>#counter#</b></font></a> --->

 <!--- <TD WIDTH="#xTableWidth#" ALIGN="CENTER" onMouseOver="Number#Counter#.style.fontSize='20px'; this.style.cursor='hand'" onMouseOut="Number#Counter#.style.fontSize='15px'; this.style.cursor='pointer'" onClick="location.href='?Page=#Counter#'"><b><A HREF="?Page=#Counter#"><FONT SIZE="3" style="font-size:15px; text-decoration:none" ID="Number#Counter#" COLOR="GRAY">#Counter#</FONT></A></b></TD> --->
	
	</cfif> <!--- End if counter is 1 --->
  </cfif> <!--- End if page 1 --->
  
  
  
  <!--- If Counter is between 1 and 11 --->
  <cfif counter gt 1 and counter lt 11>
 	<cfif #counter# is #page#>
	<cfset lcurrentpage=1>
	<!--- <TD HEIGHT="22" WIDTH="#xTableWidth#" ALIGN="CENTER"><b><FONT SIZE="4" style="font-size:20px" COLOR="MAROON">#Counter#</FONT></b></TD> --->
	<cfelse>

			
			<!--- Write Next Page Number --->
			 <!--- <TD WIDTH="#xTableWidth#" ALIGN="CENTER" onMouseOver="Number#Counter#.style.fontSize='20px'; this.style.cursor='hand'" onMouseOut="Number#Counter#.style.fontSize='15px'; this.style.cursor='pointer'" onClick="location.href='?Page=#Counter#'"><b><A HREF="?Page=#Counter#"><FONT SIZE="3" style="font-size:15px; text-decoration:none" ID="Number#Counter#" COLOR="GRAY">#Counter#</FONT></A></b></TD> --->
<!--- 	-		 <a href="homepagePE.cfm?Page=#counter#"><FONT color="Gray" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='Maroon';" onMouseout="this.color='Gray';"  style="TEXT-DECORATION: none"><b>#counter#</b></font></a> --->
			
	</cfif> <!--- End if counter and page are the same --->
  </cfif> <!--- End if Counter is between 1 and 11 --->
  
  
  <cfif counter is 11>
 	<cfif #counter# is #page#>
		<cfset lcurrentpage=1>
	<!--- <TD HEIGHT="22" WIDTH="#xTableWidth#" ALIGN="CENTER"><b><FONT SIZE="4" style="font-size:20px" COLOR="MAROON">11+</FONT></b></TD> --->
	<cfelse>

			<!--- Write Next Page Number --->
			<!--- <TD WIDTH="#xTableWidth#" ALIGN="CENTER" onMouseOver="Number#Counter#.style.fontSize='20px'; this.style.cursor='hand'" onMouseOut="Number#Counter#.style.fontSize='15px'; this.style.cursor='pointer'" onClick="location.href='?Page=#Counter#'"><b><A HREF="?Page=#Counter#"><FONT SIZE="3" style="font-size:15px; text-decoration:none" ID="Number#Counter#" COLOR="GRAY">#Counter#</FONT></A></b></TD> --->
<!--- 	-		 <a href="homepagePE.cfm?Page=#counter#"><FONT color="Gray" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='Maroon';" onMouseout="this.color='Gray';"  style="TEXT-DECORATION: none"><b>#counter#</b></font></a>	 --->
	</cfif> <!--- End if counter and page are the same --->
  </cfif> <!--- End if Counter is between 1 and 11 --->
  <cfset counter = counter+1>
  <cfset imgbegin = imgbegin-16>

  <!--- <TD><FONT COLOR="Gray">&middot;</FONT></TD> --->

</cfloop> <!--- End outer loop --->

<td>
<!---Take counter back 1 to where it currently should be (Different from loop counter value above--->
<cfset counter = counter - 1>
<cfset nextpage=page+1>
<cfif counter GT 1 and counter is not page>
<!--- <TD WIDTH="70" ALIGN="CENTER"><A HREF="?Page=#nextpage#"><FONT SIZE="3" style="font-size:13px;" ID="NextPage" COLOR="GRAY" FACE="Verdana, Arial" onMouseOver="this.fontColor='Maroon'">Next&nbsp;Page</FONT></A></TD> --->

</cfif>

</TD></tr></table>
</DIV>
	</TD>
<!--- 	<TD ALIGN="CENTER" WIDTH="200" VALIGN="MIDDLE"><A HREF=""><FONT COLOR="##333333" onmouseover="this.color='Maroon'"; onmouseout="this.color='##333333'" FACE="Times New Roman,Times,serif"><font style="font-size:13px">M</FONT><font style="font-size:11px">AGNUM</FONT> <font style="font-size:13px">P</FONT><font style="font-size:11px">HOTOS</FONT><FONT COLOR=
"##333333"  style="text-decoration='none'" face="verdana, arial, Helvetica, sans-serif"	><SUP>&reg;</SUP></FONT> <BR><font style="font-size:13px">C</FONT><font style="font-size:11px">OLLECTOR'S <font style="font-size:13px">P</FONT><font style="font-size:11px">RINTS</FONT></FONT></A></TD> ---></TR></TABLE>
</DIV>

<TABLE><TR><TD HEIGHT="7"></TD></TR></tABLE>


 
  
<cfset ImageNumber = 1>
<cfset ImagePosition = 1>
		
<cfif page is 1>
	<cfset imgbeginType2=0>
<cfelse>
	<cfset imgbeginType2=imgNextBeginNo>
</cfif>


<!--- 
#imgbeginType2#

	<CFQUERY NAME="qGetShowcase"  DATASOURCE="photoeyecom">
SELECT G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
    P.Subdirectory as Portfolio, D.GeneralRandomNo, P.ExhibitionOpened, P.OpeningSortOrder
FROM GallerySetup AS G,  GalleryDefaultPhotos as D, GalleryPortfolio as P
WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 AND P.OpeningSortOrder<#imgbeginType2# AND G.Gallery='RepresentedArtists' and G.Tier=1 and P.Subdirectory='Portfolio1'  and P.ShowcaseOK=1
ORDER BY P.OpeningSortOrder DESC
	</cfquery>
	#qGetShowcase.recordcount# --->

</cfoutput>
 	   	 <!--- Outer Table --->
	<div id="HopePagePE_Container">
	 <table border="0" align="center" width="100%">
	   	<tr align="center"><td align="center" valign="top">
	<cfset firsttime=1>
	<cfset counter=1>

	<cfif page is 1>
	<cfset beginrow=1>
	
	<cfelse>
	
	<cfset beginrow=(#page#*16)+1-16>
	
	</cfif>
	<cfset customerlist = "">
	
<!---	<cfif CGI.X_FORWARDED_FOR is '70.56.219.119'>
	<cfdump var="#qGetShowcaseSetupInfo#">	
	</cfif>  --->
	<cfoutput query="qGetShowcaseSetupInfo">
	<cfif Not ListFindNoCase(variables.customerlist, qGetShowcaseSetupInfo.custnumber)>
	<cfset customerlist = ListAppend(variables.customerlist, qGetShowcaseSetupInfo.custnumber)>
	
	

	
	 <cfif counter is 1>
	 <div align="center">  <table width="600" border="0" cellpadding="10"><!--- <table width="80%" border="0" cellpadding="3" align="center"> --->
			<tr>
	 </cfif>

		 
		 
		 
		 <td height="125" align="center">
		 <CFQUERY NAME="qGetImagePortfolioCount"  DATASOURCE="photoeyecom">
SELECT COUNT(*) AS PortfolioQty, SUM(ImgQty) AS ImgQty
FROM GalleryPortfolio
WHERE (Custnumber = #qGetShowcaseSetupInfo.Custnumber#) and ShowcaseOK = 1
</cfquery>


		 <cfif #qGetImagePortfolioCount.PortfolioQty# is 1>
		 <a href="/gallery/forms2/index.cfm?image=#ImageNumber#&id=#qGetShowcaseSetupInfo.Custnumber#&imagePosition=#ImagePosition#&Door=1&Portfolio=#qGetShowcaseSetupInfo.Portfolio#&Gallery=1">
 		<cfelse>
		 <a href="/gallery/forms2/homepage.cfm?image=#ImageNumber#&id=#qGetShowcaseSetupInfo.Custnumber#&imagePosition=#ImagePosition#&Door=1&Portfolio=#qGetShowcaseSetupInfo.Portfolio#&Gallery=1">		
		</cfif>
		
<!--- ImageSizer --->									
<cfset xheight=200>
<cfset xwidth=200>
<cfset xImageAddress="#xRelativePath#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#qGetShowcaseSetupInfo.Portfolio#\Images_Large\">
<cfset xAlt = "Enter Gallery">
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

<img src="/artists/#qGetShowcaseSetupInfo.Subdirectory#/#qGetShowcaseSetupInfo.Portfolio#/Images_Large/#xImage#_H#xHeight#xW#xWidth#.#xImageFormat#" style="border: 1px solid ##DDDDDD;" title="#qGetShowcaseSetupInfo.firstname# #qGetShowcaseSetupInfo.lastname#" ALT="#qGetShowcaseSetupInfo.firstname# #qGetShowcaseSetupInfo.lastname#"></a>
<!--- End ImageSizer --->

<br>
<cfset xlengthcheck = '#qGetShowcaseSetupInfo.Firstname# #qGetShowcaseSetupInfo.Lastname#'>
 <img src="/SharedImages/dot_clear.gif" width="1" height="20"><br />#Ucase(qGetShowcaseSetupInfo.Firstname)# #Ucase(qGetShowcaseSetupInfo.Lastname)# <cfif len(trim(xlengthcheck)) LT 29><br/><span style="color:##fff;">.</span></cfif></td>
		<cfset imgbegin = qGetShowcaseSetupInfo.GeneralRandomNo> 
<!--- 		#qGetShowcaseSetupInfo.GeneralRandomNo# --->
		<cfset counter=counter+1>	
		<cfif counter is 5>
			 <cfif firsttime is 0>
			 
			</cfif>
			<cfset counter=1>
			<cfset firsttime=0>
			</tr>
			</table><div class="hr"></div></div>
		</cfif>
		
		<cfset xnextpagebegin=qGetShowcaseSetupInfo.OpeningSortOrder>
</cfif>		
	</cfoutput>		
	

	</tr>
</table>
	</td></tr>
</table>
</div>
</div>