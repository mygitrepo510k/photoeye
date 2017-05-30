<CFSET xTitle="Gallery - Santa Fe">
<CFSET xPathToRoot="../../">
<CFSET xShowBackButton = 1>
<CFSET xShowMenu = 1>
<cfinclude template="../../templates/Header.cfm">
<CFSET xMenuToShow = "Santa Fe">
<CFINCLUDE TEMPLATE="../Menu.cfm">

<BR>
<br>
<CFSET xSubtitle = "Gallery Artists">
<cfinclude template="../../templates/title.cfm">
<DIV ALIGN="CENTER">
<CFOUTPUT>#xHTMLTitle#</CFOUTPUT>
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
</cfquery>
<!--- I.GeneralRandomNo>0  AND --->
<cfset recordcount=qGetShowcaseRecordCount.recordcount>
<!--- 
<table width="80%" border="0" align="center">
	<tr>
    	<td  width="95%" align="center">
     <div align="center"><b> 
<a href="javascript:popUp('ExhibitionSchedule.html','MyWindowSchedule',600,460);"><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Maroon';"  style="TEXT-DECORATION: none">Exhibition Schedule</font></a><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1">&nbsp; | &nbsp;</font><a href="javascript:popUp('map.html','Popup','600','620');"><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Maroon';"  style="TEXT-DECORATION: none">Locator Map</font></a><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;| &nbsp;</font><a href="javascript:popUp('../ShippingCosts.html','Popup','600','460');"><!--- <a href="http://www.magnumphotos.com/about.html" target="_top"> --->
<FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Maroon';"  style="TEXT-DECORATION: none">Shipping Costs</font></a></b><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1">
</td>
</tr>
</table>
--->
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
    <TABLE>
      <TR>
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
<a href="homepagePE.cfm?Page=#PreviousPage#"><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Maroon';"  style="TEXT-DECORATION: none"><b><!--- <&nbsp; --->
              Back
              </b>
              </font>
              </a>
-
            </cfif>
            --->
            <!--- Write Next Page Number --->
            <!--- 		 <a href="homepagePE.cfm?Page=#counter#"><FONT color="Gray" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='Maroon';" onMouseout="this.color='Gray';"  style="TEXT-DECORATION: none"><b>#counter#</b></font></a> --->
            <!--- <TD WIDTH="#xTableWidth#" ALIGN="CENTER" onMouseOver="Number#Counter#.style.fontSize='20px'; this.style.cursor='hand'" onMouseOut="Number#Counter#.style.fontSize='15px'; this.style.cursor='pointer'" onClick="location.href='?Page=#Counter#'"><b><A HREF="?Page=#Counter#"><FONT SIZE="3" style="font-size:15px; text-decoration:none" ID="Number#Counter#" COLOR="GRAY">#Counter#</FONT></A></b></TD> --->
          </cfif>
          <!--- End if counter is 1 --->
          </cfif>
          <!--- End if page 1 --->
          <!--- If Counter is between 1 and 11 --->
          <cfif counter gt 1 and counter lt 11>
            <cfif #counter# is #page#>
              <cfset lcurrentpage=1>
              <!--- <TD HEIGHT="22" WIDTH="#xTableWidth#" ALIGN="CENTER"><b><FONT SIZE="4" style="font-size:20px" COLOR="MAROON">#Counter#</FONT></b></TD> --->
              <cfelse>
              <!--- Write Next Page Number --->
              <!--- <TD WIDTH="#xTableWidth#" ALIGN="CENTER" onMouseOver="Number#Counter#.style.fontSize='20px'; this.style.cursor='hand'" onMouseOut="Number#Counter#.style.fontSize='15px'; this.style.cursor='pointer'" onClick="location.href='?Page=#Counter#'"><b><A HREF="?Page=#Counter#"><FONT SIZE="3" style="font-size:15px; text-decoration:none" ID="Number#Counter#" COLOR="GRAY">#Counter#</FONT></A></b></TD> --->
              <!--- 	-		 <a href="homepagePE.cfm?Page=#counter#"><FONT color="Gray" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='Maroon';" onMouseout="this.color='Gray';"  style="TEXT-DECORATION: none"><b>#counter#</b></font></a> --->
            </cfif>
            <!--- End if counter and page are the same --->
          </cfif>
          <!--- End if Counter is between 1 and 11 --->
          <cfif counter is 11>
            <cfif #counter# is #page#>
              <cfset lcurrentpage=1>
              <!--- <TD HEIGHT="22" WIDTH="#xTableWidth#" ALIGN="CENTER"><b><FONT SIZE="4" style="font-size:20px" COLOR="MAROON">11+</FONT></b></TD> --->
              <cfelse>
              <!--- Write Next Page Number --->
              <!--- <TD WIDTH="#xTableWidth#" ALIGN="CENTER" onMouseOver="Number#Counter#.style.fontSize='20px'; this.style.cursor='hand'" onMouseOut="Number#Counter#.style.fontSize='15px'; this.style.cursor='pointer'" onClick="location.href='?Page=#Counter#'"><b><A HREF="?Page=#Counter#"><FONT SIZE="3" style="font-size:15px; text-decoration:none" ID="Number#Counter#" COLOR="GRAY">#Counter#</FONT></A></b></TD> --->
              <!--- 	-		 <a href="homepagePE.cfm?Page=#counter#"><FONT color="Gray" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='Maroon';" onMouseout="this.color='Gray';"  style="TEXT-DECORATION: none"><b>#counter#</b></font></a>	 --->
            </cfif>
            <!--- End if counter and page are the same --->
          </cfif>
          <!--- End if Counter is between 1 and 11 --->
          <cfset counter = counter+1>
          <cfset imgbegin = imgbegin-16>
          <!--- <TD><FONT COLOR="Gray">&middot;</FONT></TD> --->
        </cfloop>
        <!--- End outer loop --->
        <td><!---Take counter back 1 to where it currently should be (Different from loop counter value above--->
          <cfset counter = counter - 1>
          <cfset nextpage=page+1>
          <cfif counter GT 1 and counter is not page>
            <!--- <TD WIDTH="70" ALIGN="CENTER"><A HREF="?Page=#nextpage#"><FONT SIZE="3" style="font-size:13px;" ID="NextPage" COLOR="GRAY" FACE="Verdana, Arial" onMouseOver="this.fontColor='Maroon'">Next&nbsp;Page</FONT></A></TD> --->
          </cfif>
        </TD>
      </tr>
    </table>
  </DIV>
  </TD>
  <!--- 	<TD ALIGN="CENTER" WIDTH="200" VALIGN="MIDDLE"><A HREF=""><FONT COLOR="##333333" onmouseover="this.color='Maroon'"; onmouseout="this.color='##333333'" FACE="Times New Roman,Times,serif"><font style="font-size:13px">M</FONT><font style="font-size:11px">AGNUM</FONT> <font style="font-size:13px">P</FONT><font style="font-size:11px">HOTOS</FONT><FONT COLOR=
"##333333"  style="text-decoration='none'" face="verdana, arial, Helvetica, sans-serif"	><SUP>&reg;</SUP></FONT> <BR><font style="font-size:13px">C</FONT><font style="font-size:11px">OLLECTOR'S <font style="font-size:13px">P</FONT><font style="font-size:11px">RINTS</FONT></FONT></A></TD> --->
  </TR>
  </TABLE>
  </DIV>
  <TABLE>
    <TR>
      <TD HEIGHT="7"></TD>
    </TR>
  </tABLE>
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
<table border="0" align="center" width="100%">
<tr align="center">
<td align="center" valign="top"><cfset firsttime=1>
  <cfset counter=1>
  <cfif page is 1>
    <cfset beginrow=1>
    <cfelse>
    <cfset beginrow=(#page#*16)+1-16>
  </cfif>
  <cfset customerlist = "">
<cfoutput query="qGetShowcaseSetupInfo">
  <cfif Not ListFindNoCase(variables.customerlist, qGetShowcaseSetupInfo.custnumber)>
    <cfset customerlist = ListAppend(variables.customerlist, qGetShowcaseSetupInfo.custnumber)>
    <cfif counter is 1>
      <div align="center">
      <table width="600" border="0" cellpadding="10">
      <!--- <table width="80%" border="0" cellpadding="3" align="center"> --->
      <tr>
    </cfif>
    <CFQUERY NAME="qGetImagePortfolioCount"  DATASOURCE="photoeyecom">
    SELECT COUNT(*) AS PortfolioQty, SUM(ImgQty) AS ImgQty
    FROM GalleryPortfolio
    WHERE (Custnumber = #qGetShowcaseSetupInfo.Custnumber#)
    </cfquery>
    <td height="125" align="center"><cfif #qGetImagePortfolioCount.PortfolioQty# is 1>
        <a href="../forms/index.cfm?image=#ImageNumber#&id=#qGetShowcaseSetupInfo.Custnumber#&imagePosition=#ImagePosition#&Door=1&Portfolio=#qGetShowcaseSetupInfo.Portfolio#&Gallery=1">
        <cfelse>
        <a href="../forms/homepage.cfm?image=#ImageNumber#&id=#qGetShowcaseSetupInfo.Custnumber#&imagePosition=#ImagePosition#&Door=1&Portfolio=#qGetShowcaseSetupInfo.Portfolio#&Gallery=1">
      </cfif>
      <!--- ImageSizer --->
      <cfset xheight=120>
      <cfset xwidth=120>
      <cfset xImageAddress="#xRelativePath#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#qGetShowcaseSetupInfo.Portfolio#\Images_Large\">
      <cfset xAlt = "Enter Gallery">
      <cfset xImage = "Image#qGetShowcaseSetupInfo.ImageNumber#">
      <cfset xImageFormat = "jpg">
      <cfif NOT ListFindNoCase(qGetShowcaseSetupInfo.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")>
        <cfinclude template="../../templates/imagesizercreate.cfm">
        <cfquery name="qUpdate"  datasource="photoeyecom">
        Update GalleryIndividualPhotos
        Set ImageSizeList = '#ListAppend(qGetShowcaseSetupInfo.ImageSizeList, "#variables.xheight#x#variables.xwidth#", "~")#'
        Where RecordNo = #qGetShowcaseSetupInfo.RecordNo#
        </cfquery>
      </cfif>
      <img src="../../artists/#qGetShowcaseSetupInfo.Subdirectory#/#qGetShowcaseSetupInfo.Portfolio#/Images_Large/#xImage#_H#xHeight#xW#xWidth#.#xImageFormat#" border="0" ALT="#xAlt#"></a>
      <!--- End ImageSizer --->
      <br>
      <img src="../SharedImages/dot_clear.gif" width="1" height="20"><FONT color="##666666" face="verdana, arial, Helvetica, sans-serif" size="1"><b>#Ucase(qGetShowcaseSetupInfo.Firstname)# #Ucase(qGetShowcaseSetupInfo.Lastname)#</b></font></td>
    <cfset imgbegin = qGetShowcaseSetupInfo.GeneralRandomNo>
    <!--- 		#qGetShowcaseSetupInfo.GeneralRandomNo# --->
    <cfset counter=counter+1>
    <cfif counter is 5>
      <cfif firsttime is 0>
      </cfif>
      <cfset counter=1>
      <cfset firsttime=0>
      </tr>
      </table>
      <hr width="400" size="1" noshade>
      </div>
    </cfif>
    <cfset xnextpagebegin=qGetShowcaseSetupInfo.OpeningSortOrder>
  </cfif>
</cfoutput>
</tr>
</table>
</td>
</tr>
</table>
<cfinclude template="../../templates/footer_site.cfm">
