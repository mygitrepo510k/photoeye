<CFPARAM NAME="xExploreBy" DEFAULT="1">


<cfparam name="url.Include" default="">

<cfif IsDefined("RadioInclude")>
	<cfset include=#form.RadioInclude#>
<cfelse>
	<cfset include=#url.Include#>
</cfif>

<CFSET xShowHome = 1>
<cfif Isdefined("url.Gallery")>
	<cfif url.Gallery is 1>
		<cfset xGallery=1>
		<cfset xGalleryName='REPRESENTEDARTISTS'>
		<CFSET xHomeLink = "#aGalleryDirectory#/RepresentedArtists/HomepagePE.cfm">
	<cfelseif url.Gallery is 2>
		<cfset xGallery=2>
		<cfset xGalleryName='PHOTOSHOWCASE'>
		<CFSET xHomeLink = "#aGalleryDirectory#/Photoshowcase/HomepagePSnew.cfm">
	<cfelseif url.Gallery is 3>
		<cfset xGallery=3>
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



<cfif Isdefined("url.page")>
	<cfset xPage=#url.page#>

<cfelseif IsDefined("page") and Include is not 2>
	<cfset xPage="#page#">
<!--- If there is no url.page, Get the first Photographer so that we know where to start the alpha list--->
<cfset xgallery = 0>
<CFQUERY NAME="qGetFirstPhotographer"  DATASOURCE="photoeyecom">
SELECT Distinct G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber, 
    P.Subdirectory as Portfolio, G.Tier as Tier, P.DateTime
FROM GallerySetup AS G, GalleryPortfolio AS P
WHERE <cfif xGallery is 1>UPPER(G.Gallery) = 'REPRESENTEDARTISTS'
	  <cfelseif xGallery is 2>UPPER(G.Gallery) = 'PHOTOSHOWCASE' 
	  <cfelseif xGallery is 3>UPPER(G.Gallery) = 'MAGNUMARTISTS'
	  <cfelse> <!--- All galleries --->
	  (UPPER(G.Gallery) = 'REPRESENTEDARTISTS' OR
   	   UPPER(G.Gallery) = 'PHOTOSHOWCASE' OR
       UPPER(G.Gallery) = 'MAGNUMARTISTS') 
	  </cfif>
	  AND 
    P.Custnumber = G.Custnumber  AND (P.PrimaryPortfolio=1 and P.ShowcaseOK=1)<!--- <cfif include is 2>AND G.Tier=3<cfelseif include is 1>AND (G.Tier=1 OR G.Tier=2)<cfelseif include is 3>AND G.Tier>0</cfif> --->
ORDER BY G.Gallery, g.LastName, p.Subdirectory  

</cfquery>
<cfelse>
	<cfset xgallery = 0>
<!--- If there is no url.page, Get the first Photographer so that we know where to start the alpha list--->
<CFQUERY NAME="qGetFirstPhotographer"  DATASOURCE="photoeyecom">
SELECT Distinct G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber, 
    P.Subdirectory as Portfolio, G.Tier as Tier, P.DateTime
FROM GallerySetup AS G, GalleryPortfolio AS P
WHERE <cfif xGallery is 1>UPPER(G.Gallery) = 'REPRESENTEDARTISTS'
	  <cfelseif xGallery is 2>UPPER(G.Gallery) = 'PHOTOSHOWCASE' 
	  <cfelseif xGallery is 3>UPPER(G.Gallery) = 'MAGNUMARTISTS'
	  <cfelse> <!--- All galleries --->
	  (UPPER(G.Gallery) = 'REPRESENTEDARTISTS' OR
   	   UPPER(G.Gallery) = 'PHOTOSHOWCASE' OR
       UPPER(G.Gallery) = 'MAGNUMARTISTS') 
	  </cfif>
	  AND 
    P.Custnumber = G.Custnumber  AND (P.PrimaryPortfolio=1 and P.ShowcaseOK=1) <!--- <cfif include is 2>AND G.Tier=3<cfelseif include is 1>AND (G.Tier=1 OR G.Tier=2)<cfelseif include is 3>AND G.Tier>0</cfif> --->
ORDER BY G.Gallery, g.LastName, p.Subdirectory  

</cfquery>
<cfset xPage=#ASC(Left(qGetFirstPhotographer.Lastname,1))#>

</cfif>




<!--- <CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
SELECT Distinct G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber, 
    P.Subdirectory as Portfolio, G.Tier as Tier, P.DateTime
FROM GallerySetup AS G, GalleryPortfolio AS P
WHERE <cfif xGallery is 1>UPPER(G.Gallery) = 'REPRESENTEDARTISTS'
	  <cfelseif xGallery is 2>UPPER(G.Gallery) = 'PHOTOSHOWCASE' 
	  <cfelseif xGallery is 3>UPPER(G.Gallery) = 'MAGNUMARTISTS'
	  <cfelse> <!--- All galleries --->
	  (UPPER(G.Gallery) = 'REPRESENTEDARTISTS' OR
   	   UPPER(G.Gallery) = 'PHOTOSHOWCASE' OR
       UPPER(G.Gallery) = 'MAGNUMARTISTS') 
	  </cfif>
	AND 
    P.Custnumber = G.Custnumber 
 AND (P.PrimaryPortfolio=1 and P.ShowcaseOK=1) <!--- <cfif include is 2>AND G.Tier=3<cfelseif include is 1>AND (G.Tier=1 OR G.Tier=2)<cfelseif include is 3>AND G.Tier>0</cfif> ---> AND SUBSTRING(g.LastName,1,1)='#chr(xpage)#'
ORDER BY G.Gallery, g.LastName, p.Subdirectory 
<!--- <cfif include is 1>AND G.Tier=1<cfelseif include is 2>AND G.Tier=2<cfelseif include is 3>AND G.Tier>0</cfif> --->
<!--- AND P.SubDirectory='Portfolio1' --->

</CFQUERY> --->

<CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
SELECT Distinct G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber, P.Title,
    P.Subdirectory as Portfolio, G.Tier as Tier, P.DateTime
FROM GallerySetup AS G, GalleryPortfolio AS P
WHERE <cfif xGallery is 1>UPPER(G.Gallery) = 'REPRESENTEDARTISTS'
	  <cfelseif xGallery is 2>UPPER(G.Gallery) = 'PHOTOSHOWCASE' 
	  <cfelseif xGallery is 3>UPPER(G.Gallery) = 'MAGNUMARTISTS'
	  <cfelse> <!--- All galleries --->
	  (UPPER(G.Gallery) = 'REPRESENTEDARTISTS' OR
   	   UPPER(G.Gallery) = 'PHOTOSHOWCASE' OR
       UPPER(G.Gallery) = 'MAGNUMARTISTS') 
	  </cfif>
	AND 
    P.Custnumber = G.Custnumber 
 AND (P.PrimaryPortfolio=1 and P.ShowcaseOK=1) <!--- <cfif include is 2>AND G.Tier=3<cfelseif include is 1>AND (G.Tier=1 OR G.Tier=2)<cfelseif include is 3>AND G.Tier>0</cfif> ---> AND SUBSTRING(g.LastName,1,1)='#chr(xpage)#'
ORDER BY G.Gallery, g.LastName, p.Subdirectory 
<!--- <cfif include is 1>AND G.Tier=1<cfelseif include is 2>AND G.Tier=2<cfelseif include is 3>AND G.Tier>0</cfif> --->
<!--- AND P.SubDirectory='Portfolio1' --->

</CFQUERY>



<CFQUERY NAME="qGetAlpha"  DATASOURCE="photoeyecom">
SELECT Distinct G.Lastname as Lastname, P.DateTime
FROM GallerySetup as G, GalleryPortfolio AS P
WHERE <cfif xGallery is 1>UPPER(G.Gallery) = 'REPRESENTEDARTISTS'
	  <cfelseif xGallery is 2>UPPER(G.Gallery) = 'PHOTOSHOWCASE' 
	  <cfelseif xGallery is 3>UPPER(G.Gallery) = 'MAGNUMARTISTS'
	  <cfelse> <!--- All galleries --->
	  (UPPER(G.Gallery) = 'REPRESENTEDARTISTS' OR
   	   UPPER(G.Gallery) = 'PHOTOSHOWCASE' OR
       UPPER(G.Gallery) = 'MAGNUMARTISTS') 
	  </cfif> AND 
    P.Custnumber = G.Custnumber 
 AND (P.PrimaryPortfolio=1 and P.ShowcaseOK=1) <!--- AND IMAGESOK>0  ---> AND  UPPER(LASTNAME) <> 'NEWARTISTTEMPLATEFORUPLOAD'   <!--- <cfif include is 2>AND G.Tier=3<cfelse>AND G.Tier>0</cfif> --->
ORDER BY LastName

</CFQUERY>


<cfset RecordCount = #qGetShowcaseSetupInfo.RecordCount#>
<cfset ImageNumber = 1>
<cfset ImagePosition = 1>


<cfif xGallery is 1>
	<CFSET xTitle="Gallery - Santa Fe">
	<CFSET xThisSubtitle = "Artist Index">
	<CFSET xMenuToShow = "Santa Fe">
	<CFSET xItemSelected = "">
	
<cfelseif xGallery is 2>
	<CFSET xTitle="Photographer's Showcase">
	<CFSET xThisSubtitle = "Artist Index">
	<CFSET xMenuToShow = "Showcase">
	<CFSET xItemSelected = "">

<cfelseif xGallery is 3>
	<CFSET xTitle="Magnum Photos">
	<CFSET xThisSubtitle = "Artist Index">
	<CFSET xMenuToShow = "Magnum">
	<CFSET xItemSelected = "">
	
<cfelse>
	<CFSET xTitle="Galleries">
	<CFSET xThisSubtitle = "Artist Index - All Galleries">
	<CFSET xMenuToShow = "Main">
	<CFSET xItemSelected = "">
	
</cfif>

<!---
<CFSET xPathToRoot="../">
<CFSET xShowBackButton = 1>
<CFSET xShowMenu = 1>
<cfinclude template="../templates/Header.cfm">--->

<cfinclude template="includes/dsp_galleries_index_top.cfm">

<CFSET xBGCOLOR="##EEEEEE">
<CFSET xRollover_off="">
<CFSET xRollover_on="##EEEEEE">

<CFSET xColorA = "Silver">
<CFSET xTableWidth="18">

<CFSET xExploreBy = 1>
<CFINCLUDE TEMPLATE="Menu.cfm">

<form Method="post" action="ArtistsIndexAction.cfm" name="MyForm" id="MyForm">

<CFSET xSubtitle = xThisSubtitle>
<cfinclude template="../templates/title.cfm">
<DIV ALIGN="CENTER">
<CFOUTPUT>#xHTMLTitle#</CFOUTPUT>

<BR>


<!---   <img src="SharedImages/dot_clear.gif" width="1" height="5"> --->


  <!--- Alphabet Header --->
  
  <!--- set page based on the first Letter of the first name in the alpha list if it is less than the first letter, in other words that name beginning with the passed page letter doesn't exist --->
  <cfif xpage LT #ASC(left(qGetAlpha.Lastname,1))#>
 	 <cfset xpage=#ASC(left(qGetAlpha.Lastname,1))#>
  </cfif>
  <cfset counter=65>
  <cfset lastcounter=65>
  <cfset first=1>
<cfoutput query="qGetAlpha">
	<cfset counter=#ASC(Ucase(left(qGetAlpha.Lastname,1)))#>
 
  <cfif first is 1>	<!--- counter is 65 and  --->

   	<cfif #counter# is #xpage#>
	<FONT color="Red" face="verdana, arial, Helvetica, sans-serif" size="2"><b>#chr(counter)#</b></font><INPUT TYPE="HIDDEN" NAME="Counter" VALUE="#Counter#"><cfset first=0>
	<cfelse>
	 <a href="ArtistsIndex.cfm?page=#counter#&Include=#Include#&Gallery=#xGallery#"><FONT color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='##333333';"  style="TEXT-DECORATION: none">#chr(counter)#</font></a>
 <cfset first=0>
	</cfif>
<!---   </cfif> --->
  
  <cfelseif counter gt 65 and counter lt 91 and #counter# is not #lastcounter#>
   	<cfif #counter# is #xpage#>
	<FONT color="##666666" face="verdana, arial, Helvetica, sans-serif" size="2"> - </font><FONT color="Red" face="verdana, arial, Helvetica, sans-serif" size="2"><b>#chr(counter)#</b><INPUT TYPE="HIDDEN" NAME="Counter" VALUE="#Counter#"><cfelse>
<FONT color="##666666" face="verdana, arial, Helvetica, sans-serif" size="2"> - </font><a href="ArtistsIndex.cfm?page=#counter#&Include=#Include#&Gallery=#xGallery#"><FONT color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='##333333';"  style="TEXT-DECORATION: none">#chr(counter)#</font></a>
	</cfif>
  </cfif>
  <cfset lastcounter=counter>
  </cfoutput>
 <cfoutput> <!--- <br> <img src="SharedImages/dot_clear.gif" width="1" height="25"
<FONT color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1"> --->
<br><img src="SharedImages/dot_clear.gif" width="1" height="15">

<FONT color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1"><b>Click Image to View Portfolios or Choose a Different Letter</b></font> 

 	<br>	<img src="SharedImages/dot_clear.gif" width="1" height="20">

<!---	Include 
<input type="radio" name="RadioInclude" value="1" <cfif Include is 1>checked</cfif> onClick="document.MyForm.submit();">
<A HREF="javascript:popUp('photoshowcase/RepresentedArtists.html','myWindowEnlarge',375,300);">Represented</a> Artists 

<input type="radio" name="RadioInclude" value="2" <cfif Include is 2>checked</cfif> onClick="document.MyForm.submit();">
<A HREF="javascript:popUp('photoshowcase/IndependentPhotographers.html','myWindowEnlarge',375,300);">Independent</a> Photographers

<input type="radio" name="RadioInclude" value="3" <cfif Include is 3>checked</cfif> onClick="document.MyForm.submit();">
All</font> ---> 
<!--- <br><img src="SharedImages/dot_clear.gif" width="1" height="1"> --->


<table border="0" cellspacing="6" cellpadding="5" align="center">
<cfset Column = 1>
<cfloop query="qGetShowcaseSetupInfo">
  <cfif Column is 1>
<!---   	<tr> 
   		<td></td>
		<td colspan="5" height="1" bgcolor="Red"></td> 
 	</tr>  --->
	<tr>
    <td width="100" height="77"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>

<CFQUERY NAME="qGetImagePosition"  DATASOURCE="photoeyecom">
SELECT Distinct *
FROM galleryindividualphotos
WHERE (Custnumber = #qGetShowcaseSetupInfo.Custnumber#) and (PortfolioName='Portfolio1') and Imageposition=1
</cfquery>

 <CFQUERY NAME="qGetImagePortfolioCount"  DATASOURCE="photoeyecom">
SELECT Distinct COUNT(*) AS PortfolioQty
FROM GalleryPortfolio
WHERE (Custnumber = #qGetShowcaseSetupInfo.Custnumber#) and Showcaseok=1
</cfquery> 

<CFQUERY NAME="qGetImageCount"  DATASOURCE="photoeyecom">
SELECT Distinct COUNT(*) AS ImgQty
FROM galleryindividualphotos
WHERE (Custnumber = #qGetShowcaseSetupInfo.Custnumber#) and Showcaseok=1 and notavailable<>4
</cfquery>
	
	<cfif #qGetImagePortfolioCount.PortfolioQty# is 1><!--- homepage.cfm --->
		
		
	 <cfif UCASE(qGetShowcaseSetupInfo.Gallery) is 'REPRESENTEDARTISTS'>
	 	<cfset xDoor=51>	
	 <cfelseif UCASE(qGetShowcaseSetupInfo.Gallery) is 'PHOTOSHOWCASE'>
		<cfset xDoor=52>			
	 <cfelseif UCASE(qGetShowcaseSetupInfo.Gallery) is 'MAGNUMARTISTS'>
		<cfset xDoor=53>
     </cfif>
	<a href="forms2/index.cfm?image=#ImageNumber#&id=#qGetShowcaseSetupInfo.Custnumber#&imagePosition=#ImagePosition#&Door=#xDoor#&Portfolio=#qGetShowcaseSetupInfo.Portfolio#&Gallery=#xGallery#&Page=#xPage#" ><FONT color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='##333333';"  style="TEXT-DECORATION: none">
	#qGetShowcaseSetupInfo.FirstName# #qGetShowcaseSetupInfo.LastName#</font></a><font size="1" color="##666666"><br><br>
	 <!---  #qGetImagePortfolioCount.PortfolioQty# Portfolio ---> 	 <!---  #qGetImagePortfolioCount.PortfolioQty# Portfolios --->
	 <cfset ArtistGallery =''>
	 <cfif UCASE(qGetShowcaseSetupInfo.Gallery) is 'REPRESENTEDARTISTS'>
	 	<cfset ArtistGallery = 'Santa Fe<br>Gallery Artist'>
	 <cfelseif UCASE(qGetShowcaseSetupInfo.Gallery) is 'PHOTOSHOWCASE'>
	 	<cfif qGetShowcaseSetupInfo.Tier is 1>
			<cfset ArtistGallery = "Photographer's<br>Showcase Artist">
		<cfelseif qGetShowcaseSetupInfo.Tier is 2>
			<cfset ArtistGallery = "Photographer's<br>Showcase Artist">
		<cfelseif qGetShowcaseSetupInfo.Tier is 3>
			<cfset ArtistGallery = "Photographer's<br>Showcase Artist">
		</cfif>		
	 <cfelseif UCASE(qGetShowcaseSetupInfo.Gallery) is 'MAGNUMARTISTS'>
	 	<cfset ArtistGallery = 'Magnum<br>Photos Artist'>
     </cfif>
	  #ArtistGallery#<br>
      #qGetImageCount.ImgQty# Images</font></b></font></td>
	  
	  <cfelse>
		 <cfif UCASE(qGetShowcaseSetupInfo.Gallery) is 'REPRESENTEDARTISTS'>
	 	<cfset xDoor=51>	
	 <cfelseif UCASE(qGetShowcaseSetupInfo.Gallery) is 'PHOTOSHOWCASE'>
		<cfset xDoor=52>			
	 <cfelseif UCASE(qGetShowcaseSetupInfo.Gallery) is 'MAGNUMARTISTS'>
		<cfset xDoor=53>
     </cfif>
	<a href="forms2/homepage.cfm?image=#ImageNumber#&id=#qGetShowcaseSetupInfo.Custnumber#&imagePosition=#ImagePosition#&Door=#xDoor#&Portfolio=#qGetShowcaseSetupInfo.Portfolio#&Gallery=#xGallery#&Page=#xPage#"><FONT color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='##333333';"  style="TEXT-DECORATION: none">
	#qGetShowcaseSetupInfo.FirstName# #qGetShowcaseSetupInfo.LastName#</font></a><font size="1" color="##666666"><br><br>
	 <!---  #qGetImagePortfolioCount.PortfolioQty# Portfolios --->
	 <cfset ArtistGallery =''>
	 <cfif UCASE(qGetShowcaseSetupInfo.Gallery) is 'REPRESENTEDARTISTS'>
	 	<cfset ArtistGallery = 'Santa Fe<br>Gallery Artist'>
	 <cfelseif UCASE(qGetShowcaseSetupInfo.Gallery) is 'PHOTOSHOWCASE'>
	 	<cfif qGetShowcaseSetupInfo.Tier is 1>
			<cfset ArtistGallery = "Photographer's<br>Showcase Artist">
		<cfelseif qGetShowcaseSetupInfo.Tier is 2>
			<cfset ArtistGallery = "Photographer's<br>Showcase Artist">
		<cfelseif qGetShowcaseSetupInfo.Tier is 3>
			<cfset ArtistGallery = "Photographer's<br>Showcase Artist">
		</cfif>			
	 <cfelseif UCASE(qGetShowcaseSetupInfo.Gallery) is 'MAGNUMARTISTS'>
	 	<cfset ArtistGallery = 'Magnum<br>Photos Artist'>
     </cfif>
	 #ArtistGallery#<br>
      #qGetImageCount.ImgQty# Images</font></b></font></td>	  
	  </cfif>
	<td width="73">
		<a href="forms2/index.cfm?image=#ImageNumber#&id=#qGetShowcaseSetupInfo.Custnumber#&imagePosition=#ImagePosition#&Door=#xDoor#&Portfolio=#qGetShowcaseSetupInfo.Portfolio#&Gallery=#xGallery#&Page=#xPage#" >	

			
			
<!--- ImageSizer --->									
<cfset xheight=64>
<cfset xwidth=75>
<cfset xImageAddress="#xRelativePath#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#qGetShowcaseSetupInfo.Portfolio#\Images_Large\">

<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image#qGetImagePosition.imageNumber#.jpg">

<cfinclude template="/templates/imagesizer.cfm">

<img src="/_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a>
<!--- End ImageSizer --->



	</td>
	<td width="20">
	</td>
	<cfset Column = 2>
	<cfelse>
	
	<!--- Get Image Position --->
	<CFQUERY NAME="qGetImagePosition"  DATASOURCE="photoeyecom">
SELECT Distinct *
FROM galleryindividualphotos
WHERE (Custnumber = #qGetShowcaseSetupInfo.Custnumber#) and (PortfolioName='Portfolio1') and Imageposition=1
</cfquery>
	
	
 <CFQUERY NAME="qGetImagePortfolioCount"  DATASOURCE="photoeyecom">
SELECT Distinct COUNT(*) AS PortfolioQty
FROM GalleryPortfolio
WHERE (Custnumber = #qGetShowcaseSetupInfo.Custnumber#) and ShowcaseOK=1
</cfquery>

	<CFQUERY NAME="qGetImageCount"  DATASOURCE="photoeyecom">
SELECT Distinct COUNT(*) AS ImgQty
FROM galleryindividualphotos
WHERE (Custnumber = #qGetShowcaseSetupInfo.Custnumber#) and ShowcaseOK=1 and notavailable<>4
</cfquery>

	<CFQUERY NAME="qGetPortfolioTitle"  DATASOURCE="photoeyecom">
SELECT Distinct PortfolioName
FROM gallerydefaultphotos
WHERE (Custnumber = #qGetShowcaseSetupInfo.Custnumber#) and Subdirectory='#qGetShowcaseSetupInfo.Portfolio#'
</cfquery>

    	<td width="100" height="77"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>
<cfif #qGetImagePortfolioCount.PortfolioQty# is 1>
		 <cfif UCASE(qGetShowcaseSetupInfo.Gallery) is 'REPRESENTEDARTISTS'>
	 	<cfset xDoor=51>	
	 <cfelseif UCASE(qGetShowcaseSetupInfo.Gallery) is 'PHOTOSHOWCASE'>
		<cfset xDoor=52>			
	 <cfelseif UCASE(qGetShowcaseSetupInfo.Gallery) is 'MAGNUMARTISTS'>
		<cfset xDoor=53>
     </cfif>
	<a href="forms2/index.cfm?image=#ImageNumber#&id=#qGetShowcaseSetupInfo.Custnumber#&imagePosition=#ImagePosition#&Door=#xDoor#&Portfolio=#qGetShowcaseSetupInfo.Portfolio#&Gallery=#xGallery#&Page=#xPage#"><FONT color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='##333333';"  style="TEXT-DECORATION: none">
	#qGetShowcaseSetupInfo.FirstName# #qGetShowcaseSetupInfo.LastName#</font></a><font size="1"  color="##666666"><br>
	 <!---  #qGetImagePortfolioCount.PortfolioQty# Portfolio ---> 	 <!---  #qGetImagePortfolioCount.PortfolioQty# Portfolios --->
	 <cfset ArtistGallery =''>
	 <cfif UCASE(qGetShowcaseSetupInfo.Gallery) is 'REPRESENTEDARTISTS'>
	 	<cfset ArtistGallery = 'Santa Fe<br>Gallery Artist'>
	 <cfelseif UCASE(qGetShowcaseSetupInfo.Gallery) is 'PHOTOSHOWCASE'>
	 	<cfif qGetShowcaseSetupInfo.Tier is 1>
			<cfset ArtistGallery = "Photographer's<br>Showcase Artist">
		<cfelseif qGetShowcaseSetupInfo.Tier is 2>
			<cfset ArtistGallery = "Photographer's<br>Showcase Artist">
		<cfelseif qGetShowcaseSetupInfo.Tier is 3>
			<cfset ArtistGallery = "Photographer's<br>Showcase Artist">
		</cfif>		
	 <cfelseif UCASE(qGetShowcaseSetupInfo.Gallery) is 'MAGNUMARTISTS'>
	 	<cfset ArtistGallery = 'Magnum<br>Photos Artist'>
     </cfif>
    <!--- #left(qGetPortfolioTitle.PortfolioName,50)#<br> --->
	 #ArtistGallery#<br>
      #qGetImageCount.ImgQty# Images</font></b></font></td>
	  
	  <cfelse>
		 <cfif UCASE(qGetShowcaseSetupInfo.Gallery) is 'REPRESENTEDARTISTS'>
	 	<cfset xDoor=51>	
	 <cfelseif UCASE(qGetShowcaseSetupInfo.Gallery) is 'PHOTOSHOWCASE'>
		<cfset xDoor=52>			
	 <cfelseif UCASE(qGetShowcaseSetupInfo.Gallery) is 'MAGNUMARTISTS'>
		<cfset xDoor=53>
     </cfif>
	<a href="forms2/homepage.cfm?image=#ImageNumber#&id=#qGetShowcaseSetupInfo.Custnumber#&imagePosition=#ImagePosition#&Door=#xDoor#&Portfolio=#qGetShowcaseSetupInfo.Portfolio#&Gallery=#xGallery#&Page=#xPage#"><FONT color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='##333333';"  style="TEXT-DECORATION: none">
	#qGetShowcaseSetupInfo.FirstName# #qGetShowcaseSetupInfo.LastName#</font></a><font size="1"  color="##666666"><br>
	 <!---  #qGetImagePortfolioCount.PortfolioQty# Portfolios --->
	 <cfset ArtistGallery =''>
	 <cfif UCASE(qGetShowcaseSetupInfo.Gallery) is 'REPRESENTEDARTISTS'>
	 	 	<cfset ArtistGallery = 'Santa Fe<br>Gallery Artist'>
	 <cfelseif UCASE(qGetShowcaseSetupInfo.Gallery) is 'PHOTOSHOWCASE'>
	 	<cfif qGetShowcaseSetupInfo.Tier is 1>
			<cfset ArtistGallery = "Photographer's<br>Showcase Artist">
		<cfelseif qGetShowcaseSetupInfo.Tier is 2>
			<cfset ArtistGallery = "Photographer's<br>Showcase Artist">
		<cfelseif qGetShowcaseSetupInfo.Tier is 3>
			<cfset ArtistGallery = "Photographer's<br>Showcase Artist">
		</cfif>		
	 <cfelseif UCASE(qGetShowcaseSetupInfo.Gallery) is 'MAGNUMARTISTS'>
	 	<cfset ArtistGallery = 'Magnum<br>Photos Artist'>
     </cfif>
	<!--- #left(qGetPortfolioTitle.PortfolioName,50)#<br> --->
	<br> #ArtistGallery#<br>
      #qGetImageCount.ImgQty# Images</font></b></font></td>	  
	  </cfif>
		<td width="73">
		<a href="forms2/index.cfm?image=#ImageNumber#&id=#qGetShowcaseSetupInfo.Custnumber#&imagePosition=#ImagePosition#&Door=#xDoor#&Portfolio=#qGetShowcaseSetupInfo.Portfolio#&Gallery=#xGallery#&Page=#xPage#" >

<!--- ImageSizer --->									
<cfset xheight=64>
<cfset xwidth=75>
<cfset xImageAddress="#xRelativePath#\Artists\#qGetShowcaseSetupInfo.Subdirectory#\#qGetShowcaseSetupInfo.Portfolio#\Images_Large\">

<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image#qGetImagePosition.imageNumber#.jpg">

<cfinclude template="/templates/imagesizer.cfm">

<img src="/_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a>
<!--- End ImageSizer --->


		</td>
		<cfset Column =1 >	
		</tr>
	</cfif>
	
 </cfloop>


</table>
</div>
</form>
<br>

</cfoutput>

<cfinclude template="includes/dsp_galleries_index_bottom.cfm">
