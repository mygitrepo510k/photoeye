<!--- CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
  SELECT GS.Gallery, GS.Portfolio, GS.Custnumber
  FROM GallerySetup as GS, GalleryPortfolio as GP
  ORDER BY GS.GALLERY, GP.LASTNAME;
</CFQUERY> --->

<cfset Page=#url.page#>

<CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
SELECT G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber, 
    P.Subdirectory as Portfolio
FROM GallerySetup AS G, GalleryPortfolio AS P
WHERE (UPPER(G.Gallery) = 'REPRESENTEDARTISTS' OR
    UPPER(G.Gallery) = 'PHOTOSHOWCASE' OR
    UPPER(G.Gallery) = 'MAGNUMARTISTS') AND 
    P.Custnumber = G.Custnumber AND SUBSTRING(g.LastName,1,1)='#chr(page)#' AND P.SubDirectory='Portfolio1'
ORDER BY G.Gallery, g.LastName, p.Subdirectory 

<!--- AND P.SubDirectory='Portfolio1' --->

</CFQUERY>

<CFQUERY NAME="qGetAlpha"  DATASOURCE="photoeyecom">
SELECT  G.Lastname as Lastname
FROM GallerySetup as G
WHERE (UPPER(G.Gallery) = 'REPRESENTEDARTISTS' OR
    UPPER(G.Gallery) = 'PHOTOSHOWCASE' OR
    UPPER(G.Gallery) = 'MAGNUMARTISTS') AND  UPPER(LASTNAME) <> 'NEWARTISTTEMPLATEFORUPLOAD'
ORDER BY LastName

</CFQUERY>

<!--- ORDER BY G.Gallery, g.LastName, p.Subdirectory --->

<!--- where imageqty>0 --->
  
<!---                 <!---Determine how many images there are---> 
			<cfset imagecount = 0>
			<cfloop index="fieldincrementer" from="1" to="40" step="1">
				<cfif fileexists(Expandpath("Images_Thumbs/image#fieldincrementer#.jpg")) or fileexists(Expandpath("../Artists/DariusHimes/Images_Thumbs/image#fieldincrementer#a.jpg"))>	
					<cfset imagecount = imagecount + 1>
				</cfif>
			</cfloop>
 --->
<cfset RecordCount = #qGetShowcaseSetupInfo.RecordCount#>
<cfset ImageNumber = 1>
<cfset ImagePosition = 1>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Galleries | Photographer's Directory</title>
</head>

<body bgcolor="#333333" text="#FFFFFF" link="Silver" vlink="Gray" alink="Red">


<table width="80%" height="36" border="0" align="center" bgcolor="Black">
<tr>

    <td  width="95%" height="51" align="center"><img src="Photoshowcase/SharedImages/photoeyeexplorephotographersshowcase7.jpg" width="384" height="84" alt="" border="0"></td>

</tr>
</table>
  <p align="center"><font face="verdana, arial, helvetica, sans-serif" size="2" color="#CCCCCC"><b>E 
    X P L O R E&nbsp;&nbsp;&nbsp;&nbsp;O U R&nbsp;&nbsp;&nbsp;&nbsp;P H O T O 
    G R A P H E R S</b><br>
    <br>
    </font> 
  <img src="../img/Redlinetoc.gif" width="400" height="1" alt="" border="0"><br>
  <img src="Photoshowcase/SharedImages/dot_clear.gif" width="1" height="1">
 <div align="center">
  <!--- Alphabet Header --->
  <cfset counter=65>
  <cfset lastcounter=65>
  <cfset first=1>
<cfoutput query="qGetAlpha">
	<cfset counter=#ASC(left(qGetAlpha.Lastname,1))#>
  <cfif counter is 65 and first is 1>	

   	<cfif #counter# is #page#>
	<FONT color="yellow" face="verdana, arial, Helvetica, sans-serif" size="2" onMouseover="this.color='RED';" onMouseout="this.color='Yellow';"  style="TEXT-DECORATION: none"><b>#chr(counter)#</b></font>
 <cfset first=0>
	<cfelse>
	 <a href="moredirectory.cfm?page=#counter#"><FONT color="silver" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='silver';"  style="TEXT-DECORATION: none">#chr(counter)#</font></a>
 <cfset first=0>
	</cfif>
  </cfif>
  
  <cfif counter gt 65 and counter lt 91 and #counter# is not #lastcounter#>
   	<cfif #counter# is #page#>
	- <a href="moredirectory.cfm?page=#counter#"><FONT color="Yellow" face="verdana, arial, Helvetica, sans-serif" size="2" onMouseover="this.color='RED';" onMouseout="this.color='yellow';"  style="TEXT-DECORATION: none"><b>#chr(counter)#</b></font></a>
	<cfelse>
	- <a href="moredirectory.cfm?page=#counter#"><FONT color="silver" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='silver';"  style="TEXT-DECORATION: none">#chr(counter)#</font></a>
	</cfif>
  </cfif>
  <cfset lastcounter=counter>
  </cfoutput>
  
</font></div>
	<br>
<cfoutput>

<table border="0" cellspacing="6" cellpadding="5" align="center">
<cfset Column = 1>
<cfloop query="qGetShowcaseSetupInfo">
  <cfif Column is 1>
  	<tr> 
   		<td colspan="5" height="2" bgcolor="Black"> </td>
 	</tr> 
	<tr>
    <td width="100" height="77"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>

<CFQUERY NAME="qGetImagePortfolioCount"  DATASOURCE="photoeyecom">
SELECT COUNT(*) AS PortfolioQty, SUM(ImgQty) AS ImgQty
FROM GalleryPortfolio
WHERE (Custnumber = #qGetShowcaseSetupInfo.Custnumber#)
</cfquery>
	
	<cfif #qGetImagePortfolioCount.PortfolioQty# is 1>
	<a href="#qGetShowcaseSetupInfo.Gallery#/Artists/#qGetShowcaseSetupInfo.Subdirectory#/#qGetShowcaseSetupInfo.Portfolio#/index.cfm?id=#qGetShowcaseSetupInfo.Custnumber#&image=#ImageNumber#&imagePosition=#ImagePosition#&Door=3&Portfolio=#qGetShowcaseSetupInfo.Portfolio#" target="_parent"><FONT color="Silver" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Silver';"  style="TEXT-DECORATION: none">
	#qGetShowcaseSetupInfo.FirstName# #qGetShowcaseSetupInfo.LastName#</font></a><font size="1"><br><br>
	  #qGetImagePortfolioCount.PortfolioQty# Portfolio<br>
      #qGetImagePortfolioCount.ImgQty# Images</font></b></font></td>
	  
	  <cfelse>
	<a href="#qGetShowcaseSetupInfo.Gallery#/Artists/#qGetShowcaseSetupInfo.Subdirectory#/homepage.cfm?id=#qGetShowcaseSetupInfo.Custnumber#&image=#ImageNumber#&imagePosition=#ImagePosition#&Door=3&Portfolio=#qGetShowcaseSetupInfo.Portfolio#" target="_parent"><FONT color="Silver" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Silver';"  style="TEXT-DECORATION: none">
	#qGetShowcaseSetupInfo.FirstName# #qGetShowcaseSetupInfo.LastName#</font></a><font size="1"><br><br>
	  #qGetImagePortfolioCount.PortfolioQty# Portfolios<br>
      #qGetImagePortfolioCount.ImgQty# Images</font></b></font></td>	  
	  </cfif>
	<td width="73">
		<cfif #qGetImagePortfolioCount.PortfolioQty# is 1>
		<a href="#qGetShowcaseSetupInfo.Gallery#/Artists/#qGetShowcaseSetupInfo.Subdirectory#/#qGetShowcaseSetupInfo.Portfolio#/index.cfm?id=#qGetShowcaseSetupInfo.Custnumber#&image=#ImageNumber#&imagePosition=#ImagePosition#&Door=3&Portfolio=#qGetShowcaseSetupInfo.Portfolio#" target="_parent"">
		<cfelse>
			<a href="#qGetShowcaseSetupInfo.Gallery#/Artists/#qGetShowcaseSetupInfo.Subdirectory#/Homepage.cfm?id=#qGetShowcaseSetupInfo.Custnumber#&image=#ImageNumber#&imagePosition=#ImagePosition#&Door=3&Portfolio=#qGetShowcaseSetupInfo.Portfolio#" target="_parent"">	
		</cfif>
		<img src="#qGetShowcaseSetupInfo.Gallery#/Artists/#qGetShowcaseSetupInfo.Subdirectory#/#qGetShowcaseSetupInfo.Portfolio#/Images_thumbs/Image1.jpg" border="0" alt=""></a>
	</td>
	<td width="20">
	</td>
	<cfset Column = 2>
	<cfelse>
	
	<CFQUERY NAME="qGetImagePortfolioCount"  DATASOURCE="photoeyecom">
SELECT COUNT(*) AS PortfolioQty, SUM(ImgQty) AS ImgQty
FROM GalleryPortfolio
WHERE (Custnumber = #qGetShowcaseSetupInfo.Custnumber#)
</cfquery>
    	<td width="100" height="77"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>
<cfif #qGetImagePortfolioCount.PortfolioQty# is 1>
	<a href="#qGetShowcaseSetupInfo.Gallery#/Artists/#qGetShowcaseSetupInfo.Subdirectory#/#qGetShowcaseSetupInfo.Portfolio#/index.cfm?id=#qGetShowcaseSetupInfo.Custnumber#&image=#ImageNumber#&imagePosition=#ImagePosition#&Door=3&Portfolio=#qGetShowcaseSetupInfo.Portfolio#" target="_parent"><FONT color="Silver" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Silver';"  style="TEXT-DECORATION: none">
	#qGetShowcaseSetupInfo.FirstName# #qGetShowcaseSetupInfo.LastName#</font></a><font size="1"><br><br>
	  #qGetImagePortfolioCount.PortfolioQty# Portfolio<br>
      #qGetImagePortfolioCount.ImgQty# Images</font></b></font></td>
	  
	  <cfelse>
	<a href="#qGetShowcaseSetupInfo.Gallery#/Artists/#qGetShowcaseSetupInfo.Subdirectory#/homepage.cfm?id=#qGetShowcaseSetupInfo.Custnumber#&image=#ImageNumber#&imagePosition=#ImagePosition#&Door=3&Portfolio=#qGetShowcaseSetupInfo.Portfolio#" target="_parent"><FONT color="Silver" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Silver';"  style="TEXT-DECORATION: none">
	#qGetShowcaseSetupInfo.FirstName# #qGetShowcaseSetupInfo.LastName#</font></a><font size="1"><br><br>
	  #qGetImagePortfolioCount.PortfolioQty# Portfolios<br>
      #qGetImagePortfolioCount.ImgQty# Images</font></b></font></td>	  
	  </cfif>
		<td width="73">
		<cfif #qGetImagePortfolioCount.PortfolioQty# is 1>
		<a href="#qGetShowcaseSetupInfo.Gallery#/Artists/#qGetShowcaseSetupInfo.Subdirectory#/#qGetShowcaseSetupInfo.Portfolio#/index.cfm?id=#qGetShowcaseSetupInfo.Custnumber#&image=#ImageNumber#&imagePosition=#ImagePosition#&Door=3&Portfolio=#qGetShowcaseSetupInfo.Portfolio#" target="_parent"">
		<cfelse>
			<a href="#qGetShowcaseSetupInfo.Gallery#/Artists/#qGetShowcaseSetupInfo.Subdirectory#/Homepage.cfm?id=#qGetShowcaseSetupInfo.Custnumber#&image=#ImageNumber#&imagePosition=#ImagePosition#&Door=3&Portfolio=#qGetShowcaseSetupInfo.Portfolio#" target="_parent"">	
		</cfif>
			<img src="#qGetShowcaseSetupInfo.Gallery#/Artists/#qGetShowcaseSetupInfo.Subdirectory#/#qGetShowcaseSetupInfo.Portfolio#/Images_thumbs/Image1.jpg" border="0" alt=""></a>
		</td>
		<cfset Column =1 >	
		</tr>
	</cfif>
	
 </cfloop>


</table>  

</cfoutput>
</body>
</html>
