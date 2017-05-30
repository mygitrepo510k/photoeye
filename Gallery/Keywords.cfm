<!--- 06/29/2003 RR --->
<!--- 1. A server cfCache is created that expires everyday at 12:25 pm MDT - the time this was first run. Any New Content will show at that time automatically--->
<!--- --->
<!--- <cfcache action="Flush">  --->
<!--- <cfcache action="Cache" Timeout="#DateAdd('d',-1, Now())#">  --->

<CFIF xSwitch is 1>
<!--- <cfcache action="Cache" Timeout="#DateAdd('d',-1, Now())#"> --->
</CFIF>

<CFPARAM NAME="url.Include" DEFAULT="1">

<cfif Isdefined("url.page")>
	<cfset Page=#url.page#>
<cfelse>
	<cfset Page=65>
</cfif>

<CFPARAM NAME="url.Gallery" DEFAULT="0">
<CFSET xGallery = url.Gallery>

<CFSET xShowHome = 1>
<cfif Isdefined("url.Gallery")>
	<cfif url.Gallery is 1>
		<cfset xGallery=0>
		<cfset xGalleryName='REPRESENTEDARTISTS'>
		<CFSET xHomeLink = "#aGalleryDirectory#/RepresentedArtists/HomepagePE.cfm">
	<cfelseif url.Gallery is 2>
		<cfset xGallery=0>
		<cfset xGalleryName='PHOTOSHOWCASE'>
		<CFSET xHomeLink = "#aGalleryDirectory#/Photoshowcase/HomepagePSnew.cfm">
	<cfelseif url.Gallery is 3>
		<cfset xGallery=0>
		<cfset xGalleryName='MAGNUMARTISTS'>
		<CFSET xHomeLink = "#aGalleryDirectory#/MagnumArtists/HomepageMA.cfm">
	<CFELSE>
		<cfset xGallery=0>
		<cfset xGalleryName=''>
		<CFSET xHomeLink = "#aGalleryDirectory#/index.cfm">
	</CFIF>
<cfelse>
	<cfset xGallery=0>
	<cfset xGalleryName=''>
	<CFSET xHomeLink = "#aGalleryDirectory#/index.cfm">
</cfif>

<cfif xGallery is 1>
	<CFSET xTitle="Gallery - Santa Fe">
	<CFSET xThisSubtitle = "Keywords">
	<CFSET xMenuToShow = "Santa Fe">
	
<cfelseif xGallery is 2>
	<CFSET xTitle="Photographer's Showcase">
	<CFSET xThisSubtitle = "Keywords">
	<CFSET xMenuToShow = "Showcase">

<cfelseif xGallery is 3>
	<CFSET xTitle="Magnum Photos">
	<CFSET xThisSubtitle = "Keywords">
	<CFSET xMenuToShow = "Magnum">
	
<cfelse>
	<CFSET xTitle="Galleries">
	<CFSET xThisSubtitle = "Keywords - All Galleries">
	<CFSET xMenuToShow = "Main">
	
</cfif>
<!---
<CFSET xPathToRoot="../">
<CFSET xShowBackButton = 1>
<CFSET xShowMenu = 1>
<cfinclude template="../templates/Header.cfm">--->
<cfinclude template="includes/dsp_galleries_index_top.cfm">
	
<CFSET xExploreBy = 6>
<CFINCLUDE TEMPLATE="Menu.cfm">
<BR>
<CFSET xSubtitle = xThisSubtitle>
<cfinclude template="../templates/title.cfm">
<DIV ALIGN="CENTER"><CFOUTPUT>#xHTMLTitle#</CFOUTPUT></DIV>



<!--- 9/3/02 Added [or (LEN(K.KEYWORDS)>0  AND SUBSTRING(K.Keywords,1,1)='#chr(page)#' AND K.SHOWCASEOK=0 and K.Custnumber=81037)
for Twin Towers Exception]--->
<!--- <CFQUERY NAME="qGetKeywords"  DATASOURCE="PhotoEyeCOM">
  SELECT K.KEYWORDS
  FROM GalleryKeywords as K, GallerySetup as S
  WHERE ((LEN(K.KEYWORDS)>0  AND SUBSTRING(K.Keywords,1,1)='#chr(page)#' AND K.SHOWCASEOK=1 
  AND K.Custnumber=S.Custnumber) <!--- or (LEN(K.KEYWORDS)>0  AND SUBSTRING(K.Keywords,1,1)='#chr(page)#' AND K.SHOWCASEOK=0 and K.Custnumber=81037) --->)
 <!---  AND K.Custnumber=S.Custnumber ---> <cfif xGallery GT 0> and UPPER(S.Gallery)='#xGalleryName#'</cfif>
  GROUP BY K.KEYWORDS
  ORDER BY K.KEYWORDS 
</CFQUERY> --->

<CFQUERY NAME="qGetKeywords"  DATASOURCE="PhotoEyeCOM">
SELECT     K.Keywords
FROM         GalleryIndividualPhotos AS I INNER JOIN
                      GallerySetup AS S ON I.Custnumber = S.Custnumber INNER JOIN
                      GalleryKeywords AS K ON S.Custnumber = K.Custnumber
WHERE     (LEN(K.Keywords) > 0) AND (SUBSTRING(K.Keywords, 1, 1) = '#chr(page)#') AND (K.ShowcaseOK = 1)
GROUP BY K.Keywords
ORDER BY K.Keywords
</CFQUERY>  

<!---, GALLERY and  Gallery='#xGallery#' --->

<!--- 9/3/02 Added  [or  (LEN(K.KEYWORDS)>0 AND K.SHOWCASEOK=0 and K.Custnumber=81037
  AND K.Custnumber=S.Custnumber)]--->
<!--- <CFQUERY NAME="qGetAlpha"  DATASOURCE="photoeyecom">
  SELECT Upper(K.KEYWORDS) as KEYWORDS
  FROM GalleryKeywords as K, GallerySetup as S
  WHERE ((LEN(K.KEYWORDS)>0 AND K.SHOWCASEOK=1
  AND K.Custnumber=S.Custnumber) or  (LEN(K.KEYWORDS)>0 AND K.SHOWCASEOK=0 and K.Custnumber=81037
  AND K.Custnumber=S.Custnumber))<cfif xGallery GT 0> and UPPER(S.Gallery)='#xGalleryName#'</cfif>
  GROUP BY K.KEYWORDS
  ORDER BY K.KEYWORDS
</CFQUERY> --->

<!--- 2.26.10 New Solution --->
<CFQUERY NAME="qGetAlpha"  DATASOURCE="photoeyecom">
 SELECT Upper(K.KEYWORDS) as KEYWORDS	FROM         GalleryIndividualPhotos AS I INNER JOIN
                      GallerySetup AS S ON I.Custnumber = S.Custnumber INNER JOIN
                      GalleryKeywords AS K ON S.Custnumber = K.Custnumber
WHERE     (LEN(K.Keywords) > 0)  AND (K.ShowcaseOK = 1)
GROUP BY K.Keywords
ORDER BY K.Keywords
</cfquery>

 <!--- 
AND K.Custnumber=S.Custnumber) or  (LEN(K.KEYWORDS)>0 AND K.SHOWCASEOK=0 and K.Custnumber=81037
  AND K.Custnumber=S.Custnumber))<cfif xGallery GT 0> and UPPER(S.Gallery)='#xGalleryName#'</cfif> ---> 

<cfset RecordCount = #qGetKeywords.RecordCount#>
<cfset ImageNumber = 1>
<cfset ImagePosition = 1>
<div align="center">
  <!--- Alphabet Header --->

  <cfset counter=65>
  <cfset lastcounter=65>
  <cfset first=1>
  
<cfoutput query="qGetAlpha">
  
  <cfset counter=#ASC(left(qGetAlpha.Keywords,1))#>
  <cfif counter is 65 and first is 1>	

   <!--- Highlight A Letter --->
   	<cfif #counter# is #page#>
	<FONT color="Red" face="verdana, arial, Helvetica, sans-serif" size="2"><b>#chr(counter)#</b></font>
 <cfset first=0>
	<cfelse>
	 <a href="Keywords.cfm?Gallery=#xGallery#&page=#counter#"><FONT color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='##333333';"  style="TEXT-DECORATION: none">#chr(counter)#</font></a>
 <cfset first=0>
	</cfif>
  </cfif> 
  <cfif counter gt 65 and counter lt 91 and #counter# is not #lastcounter#>
   	   <!--- Highlight Other Letters --->
	<cfif #counter# is #page#>
	- <FONT color="Red" face="verdana, arial, Helvetica, sans-serif" size="2"><b>#chr(counter)#</b></font>
	<cfelse>
	- <a href="Keywords.cfm?Gallery=#xGallery#&page=#counter#"><FONT color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='##333333';"  style="TEXT-DECORATION: none">#chr(counter)#</font></a>
	</cfif>
  </cfif>

  <cfset lastcounter=counter>

 </cfoutput>
</font></div>
	<table width="600" align="center"><tr><td align="center">
	<font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#333333"><b>Each photograph is described using up to ten subject keywords.  Click any word to retrieve images.</b></font></td></tr></table>
	<cfoutput>  
<table border="0" cellspacing="6" cellpadding="5" align="center">
<cfset Column = 1>
<cfset TotalKeywords=#qGetKeywords.RecordCount#>
<cfset KeywordCount=0>
<cfset KeywordName="">
<tr>
<td width="200" colspan="2" valign="top">
<cfloop query="qGetKeywords" startrow="1" endrow="#qGetKeywords.RecordCount#">
 <cfif Column is 1>
 <!--- Do not show plural--->
<!--- 	<cfif Find(KeywordName, #Keywords#) is not 1> --->

		<cfset keywords2= REPLACE(#KEYWORDS#," ","%20","All")> 
<a href="../templates/mSearchShowcasePowerSearch.cfm?Gallery=#xGallery#&keyword=#keywords2#"><FONT color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='##333333';"  style="TEXT-DECORATION: none">
		<strong>#keywords#</strong></font></A><IMG height=12 src="../dot_clear.gif" width=1> 
	<br>
		<cfif Keywordcount is (round(TOTALKEYWORDS/2-1))>
			</td>
			<td width="200" colspan="2" valign="top">	
			<cfset Column = 2>
		</cfif> 
<!--- 	</cfif> --->
  <cfelse>
		<!--- Do not show plural--->
		<!--- <cfif Find(KeywordName, #Keywords#) is not 1> --->
		<cfset keywords2= REPLACE(#KEYWORDS#," ","%20","All")> 
		<a href="../templates/mSearchShowcasePowerSearch.cfm?Gallery=#xGallery#&keyword=#keywords2#"><FONT color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='##333333';"  style="TEXT-DECORATION: none">
		<strong>#keywords#</strong></font></A><IMG height=12 src="../dot_clear.gif" width=1> 
		<br>
		<!--- </cfif> --->

</cfif>
	<cfset KeywordName = #Keywords#>
	<cfset Keywordcount=Keywordcount+1>
	
	
</cfloop>
	</td></tr>
</table>  

</cfoutput>
<br />
<cfinclude template="includes/dsp_galleries_index_bottom.cfm">

