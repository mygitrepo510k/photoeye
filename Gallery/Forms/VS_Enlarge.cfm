<cfparam name="url.door" default="1">	
<cfparam name="url.imageposition" default="1">					
<CFPARAM NAME="url.ExPage" DEFAULT="1">		
						

<CFQUERY NAME="qGetVS_Artist"  DATASOURCE="photoeyecom">
  SELECT *
  FROM VS_Setup where Custnumber=#url.id#
</CFQUERY>

<!--- <CFQUERY NAME="qGetVS_Images"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryIndividualPhotos where custnumber='#url.id#' AND IMAGENUMBER='#url.image#' 
</CFQUERY> --->

<CFQUERY NAME="qGetVS_Images_Default"  DATASOURCE="photoeyecom">
  SELECT *
  FROM VS_Images_Default where custnumber='#url.id#' 
</CFQUERY>

<!---Update Stats--->
<!---If Record doesn't Exist, Create it!--->
<CFQUERY NAME="qGetVS_Stats"  DATASOURCE="photoeyecom">
  SELECT *
  FROM VS_Stats where custnumber='#url.id#' AND ImageNumber='#url.image#' 
</CFQUERY>



<cfparam name="xpan" default="0">							

 <CFQUERY NAME="qGetVS_Portfolios"  DATASOURCE="photoeyecom">
  SELECT *
  FROM VS_Portfolios where Custnumber=#url.id# AND SUBDIRECTORY='#url.portfolio#'
</CFQUERY>

<CFIF qGetVS_Portfolios.Panorama is 1>
	<CFSET xPan = 1>
</CFIF>

<cfif #len(qGetVS_Portfolios.Backgroundcolor)# GT 0>
	<cfset Background = #trim(qGetVS_Portfolios.Backgroundcolor)#>
<cfelse>
	<cfset Background = "000000">
</cfif>


<cfset month=MONTH(#Now()#)>


<CFQUERY NAME="UpdateVS_Stats" DATASOURCE="photoeyecom">
UPDATE VS_STATS
SET Imagenumber=#url.image#,
Page=3,
PV_Total=PV_Total+1,
PV_YTD=PV_YTD+1,
Hits_Total=Hits_Total+2,
Hits_YTD=Hits_YTD+2
WHERE custnumber='#url.id#' AND ImageNumber=#url.image# AND Portfolio='#url.portfolio#'
</cfquery>



<cfoutput>


<table align="center" VALIGN="TOP">

  <tr> 
    <td><cfif #qGetVS_Portfolios.NoMaxEnlarge# is 0><a href="javascript:popUp('Pages_MaxEnlarge/image1.cfm?image=#image#&id=#url.id#&Portfolio=#url.portfolio#','myWindowEnlarge',1012,710,'yes','no');">
<cfelse><!--- <a href="javascript:window.close();"> ---></cfif>
	
<!--- ImageSizer --->	
<cfif xpan is 1>							
	<cfset xheight=450>
	<cfset xwidth=1800>
<cfelse>
	<cfset xheight=400>
	<cfset xwidth=550>
</cfif>	

<!--- <cfset xImageAddress="#xRelativePath#\Artists\#qGetVS_Artist.Subdirectory#\#Portfolio#\Images_Large\"> --->
<cfset xImageAddress="#xRelativePath#\Users\#qGetVS_Images.folderid#\">
<cfset xAlt = "Enter Gallery">
<!--- <cfset xImage = "Image#qGetVS_Images.imagenumber#.jpg"> --->

<cfset xImage = "#qGetVS_Images.filename#"> 

<cfinclude template="../../templates/imagesizer.cfm">

<img src="../../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a></td>
<!--- End ImageSizer --->



</cfoutput>

  </tr>
  		  <cfset xNext=#url.imageposition#+1>
		  <cfif xNext GT #imagecount#>
		  	 <cfset xNext=1>
		 </cfif>
		  <cfset xPrevious=#url.imageposition#-1>
		  <cfif xPrevious LT 1>
		  	<cfset xPrevious=#imagecount#>
		  </cfif> 
  <tr valign="TOP"> 
    <td height="10"> 
      <div align="left"><a href="javascript: history.back()"><font face="verdana, arial, helvetica, sans-serif" size="1" color="#666666" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='#666666';">< Back</font></a>&nbsp;&nbsp;&nbsp;&nbsp;
<cfif #qGetVS_Portfolios.NoMaxEnlarge# is 0>
<cfoutput>
<a href="javascript:popUp('Pages_MaxEnlarge/image1.cfm?image=#image#&id=#url.id#&Portfolio=#url.portfolio#','myWindowEnlarge',1012,710,'yes','no');"></cfoutput><font face="verdana, arial, helvetica, sans-serif" size="1" color="#666666" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='#666666';"> +
             Enlarge More</font></a>&nbsp;&nbsp;&nbsp;&nbsp;


<!--- End ImageSizer --->
			<cfoutput> <a href="index6.cfm?image=#xprevious#&id=#url.id#&imagePosition=#xprevious#&Portfolio=#url.portfolio#&Enlarge2=1" target="_self"><font face="verdana, arial, helvetica, sans-serif" size="1" color="###FONT1#" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='###FONT1#';"><</font></a>&nbsp;&nbsp;&nbsp;
		  <a href="index6.cfm?image=#xPrevious#&id=#url.id#&imagePosition=#xPrevious#&Portfolio=#url.portfolio#&Gallery=2" target="_self"><font face="verdana, arial, helvetica, sans-serif" size="1" color="###FONT1#" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='###FONT1#';">::::</font></a> 
		  
		  &nbsp;&nbsp;&nbsp;
		  <a href="index6.cfm?image=#xnext#&id=#url.id#&imagePosition=#xnext#&Portfolio=#url.portfolio#&Enlarge2=1" target="_self"><font face="verdana, arial, helvetica, sans-serif" size="1" color="###FONT1#" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='###FONT1#';">></font></a></cfoutput>


</CFIF>

			 </div>
		
    </td>
  </tr>
</table>

