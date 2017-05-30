<!--- Query information by above subdirectory name --->
<!--- <CFQUERY NAME="qShowcaseGalleryIndividualPhotos"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryIndividualPhotos where custnumber='#url.id#' AND IMAGENUMBER='#url.image#' 
</CFQUERY> --->

<cfparam name="xpan" default="0">		
<cfparam name="url.door" default="1">						

<CFQUERY NAME="qShowcaseArtist"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup where Custnumber=#url.id# order by custnumber desc
</CFQUERY>

 <CFQUERY NAME="qShowcasePortfolio"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryPortfolio where Custnumber=#url.id# AND SUBDIRECTORY='#url.portfolio#'
</CFQUERY>


<CFIF qShowcasePortfolio.Panorama is 1>
	<CFSET xPan = 1>
</CFIF>

<CFQUERY NAME="qShowcaseGalleryIndividualPhotos"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryIndividualPhotos where custnumber='#url.id#' AND IMAGEPOSITION='#url.image#' AND PORTFOLIONAME='#url.portfolio#'
</CFQUERY>


<!--- Count the number of portfolios. If GT 1 and there is not portfolio title
Show default Portfolio 1, Portfolio 2, etc as the portfolio title--->
<CFQUERY NAME="qShowcasePortfolioQTY"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryPortfolio where Custnumber=#url.id#
</CFQUERY>

<!--- "#qShowcasePortfolio.Backgroundcolor#" --->
<!--- If no background paramater Exists, Make Background Black --->
<cfif #len(qShowcasePortfolio.Backgroundcolor)# GT 0>
	<cfset Background = #trim(qShowcasePortfolio.Backgroundcolor)#>
<cfelse>
	<cfset Background = "000000">
</cfif>

<!---Update Stats--->
<!---If Record doesn't Exist, Create it!--->
<CFQUERY NAME="qStats"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryStats where custnumber='#url.id#' AND ImageNumber='#url.image#' AND Portfolio='#url.portfolio#'
</CFQUERY>

<CFIF #qStats.recordcount# is 0>

<CFQUERY NAME="qStatsInsert"  DATASOURCE="photoeyecom">
  INSERT INTO GALLERYSTATS 
		(Custnumber, ImageNumber, Portfolio)
				VALUES (#url.id#, #url.image#, '#url.portfolio#') 
</CFQUERY>

</cfif>

<cfset month=MONTH(#Now()#)>


<CFQUERY NAME="UpdateStats" DATASOURCE="photoeyecom">
UPDATE GALLERYSTATS
SET Imagenumber=#url.image#,
Page=3,
PV_Total=PV_Total+1,
PV_YTD=PV_YTD+1,
Hits_Total=Hits_Total+2,
Hits_YTD=Hits_YTD+2
WHERE custnumber=#url.id# AND ImageNumber='#url.image#' AND Portfolio='#url.portfolio#'
</cfquery>


<!---  <cfset Backgroundcolor = "DarkGray">  --->
<!--- <cfparam Name="Backgroundcolor" default="Black"> --->

<CFQUERY NAME="qShowcaseGalleryIndividualPhotos"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryIndividualPhotos where custnumber=#url.id# AND IMAGEPOSITION='#url.image#' AND PORTFOLIONAME='#url.portfolio#' and NOT (notavailable=4 and imagenumber>1)
</CFQUERY>

<CFQUERY NAME="qShowcaseGalleryDefaultPhotos"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryDefaultPhotos where custnumber=#url.id# AND SUBDIRECTORY='#url.portfolio#'
</CFQUERY>

<CFQUERY NAME="qGetDetails"
         DATASOURCE="photoeyecom">
SELECT *
FROM Inventory
WHERE CATALOG = '#qShowcaseGalleryIndividualPhotos.catalog#'
</CFQUERY>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>photo-eye Photographer's Showcase | #qShowcaseArtist.FirstName# #qShowcaseArtist.LastName#</title>


<!--- <script language="JavaScript">


function newWindow(downscroll) {
   pressreleaseWindow = window.open('pressrelease.html', 'pressreleaseWin', 'width=420,height=450,scrollbars=yes')

pressreleaseWindow.focus()

setTimeout("pressreleaseWindow.scroll(0,"+downscroll+")",1000)
}




</script> --->

<!--- <script language="JavaScript">

<!-- hide from JavaScript-challenged browsers
var popupWin = null;
function popUp(myURL,myWindowName,w,h,scroll,menu){
var myLeft = ((screen.width-w)/2)-5; 
var myTop = ((screen.height-h)/2)-5;
var settings='height='+h+',width='+w+',top='+myTop+',left='+myLeft+',scrollbars=yes, resizable=no,menu='+menu 
popupWin=window.open(myURL,myWindowName,settings);
if(parseInt(navigator.appVersion) >= 4){popupWin.focus();}
}
 
// done hiding -->

</script> --->

<script language="JavaScript">
<!-- hide from JavaScript-challenged browsers
var popupWin = null;
function popUp(myURL,myWindowName,w,h,scroll,menu){
var myHeight = ((screen.availHeight))-50;
var myWidth = ((screen.availWidth))-10;
var myLeft = 0; 
var myTop = 0;
var settings='height='+myHeight+',width='+myWidth+',top='+myTop+',left='+myLeft+',scrollbars=yes,resizable=yes,menu='+menu 
popupWin=window.open(myURL,myWindowName,settings);   
if(parseInt(navigator.appVersion) >= 4){popupWin.focus();}
}
 
// done hiding -->
</script>

</HEAD>

<cfoutput>

<BODY text="##999999" vlink="##999999" link="##999999" alink="Red" bgcolor="###Background#" topmargin="1"> 


<CFINCLUDE TEMPLATE="../../templates/UserIdentification.cfm">
<div align="center">




<input type="hidden" name="UserID" value="#Cookie.UserIdNumber#">
<input type="hidden" name="NumCopies" value="1">
<input type="hidden" name="Binding" value="Photograph">
<input type="hidden" name="ListPrice" value="#qGetDetails.Soft_price#">
<input type="hidden" name="SalePrice" value="0">
<input type="hidden" name="RecordID" value="#qGetDetails.recordID#">
<input type="hidden" name="Catnum" value="#qGetDetails.Catalog#">
<cfset ArtistF =  #Replace(qShowcaseArtist.FirstName," ","","All")#>
<cfset ArtistL =  #Replace(qShowcaseArtist.LastName," ","","All")#>
<cfset ArtistF =  #Replace(qShowcaseArtist.FirstName,"'","","All")#>
<cfset ArtistL =  #Replace(qShowcaseArtist.LastName,"'","","All")#>

<input type="hidden" name="ArtistF" value="#ArtistF#">
<input type="hidden" name="ArtistL" value="#ArtistL#">


<FORM ACTION="../../templates/AddtoCartGalleriesNew.cfm?userid=#Cookie.UserIdNumber#&NumCopies=1&Binding=Photography&Listprice=#qGetDetails.Soft_price#&SalePrice=0&RecordID=#qGetDetails.recordID#&Catnum=#qGetDetails.Catalog#&ArtistF=#ArtistF#&ArtistL=#ArtistL#&Showcase=1" METHOD="POST" target="_top">


<!--- <FORM ACTION="../../templates/AddtoCartGallerySale.cfm" METHOD="POST" target="_top"> --->
<center>
          
			
			
				
			<CFIF xPan is 0>
			    <table height="80%" cellpadding="5" align="center" width="100%">
     			  <tr><!--- 08/10/04  align="right" --->
        			<td height="80%"  align="center">  <!---  08/10/04 Added center alignment, before it inherited the right alignment --->
         
		 	
	 <table cellpadding="5" align="center" width="100%" bgcolor="###Background#"> <!--- 08/10/04 height="100"  --->      
		<tr valign="bottom"> <!---  08/08/04 align="left" height="140" --->
			  <td width="65%"  rowspan="2" valign="top" align="right">
			    <div align="right"><a href="javascript:popUp('Pages_MaxEnlarge/image1.cfm?imageposition=#image#&id=#url.id#&Portfolio=#url.portfolio#','myWindowEnlarge',1012,710,'yes','no');"><!--- #qShowcaseGalleryIndividualPhotos.imageposition# --->

<!--- ImageSizer --->					
<cfset xheight=240>
<cfset xwidth=500>
<cfset xImageAddress="#xRelativePath#\Artists\#qShowcaseArtist.Subdirectory#\#Portfolio#\Images_Large\">
<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image#qShowcaseGalleryIndividualPhotos.imageNUMBER#.jpg">

<cfinclude template="../../templates/imagesizer.cfm">

<img src="../../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a></div>
<!--- End ImageSizer --->

              </td>
			  
			  <td width="5" height="*" rowspan="2" valign="top">&nbsp; </td>
			  <td width="*" height="*" align="left" valign="bottom">	
			 <cfelse>
			 
			     <table height="80%" cellpadding="5" align="center" >
      			<tr align="center"> 
      			  <td height="80%"> 
         
		 	      <a href="javascript:popUp('Pages_MaxEnlarge/image1.cfm?imageposition=#image#&id=#url.id#&Portfolio=#url.portfolio#','myWindowEnlarge',1012,710,'yes','no');"><img src="../../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" alt="#xAlt#"></a>
	 	      <table height="100" cellpadding="5" align="center" bgcolor="###Background#">
			 	 <tr> 
			  <td width="100%" rowspan="2" valign="top" align="center">
			    <div align="center"><a href="javascript:popUp('Pages_MaxEnlarge/image1.cfm?imageposition=#image#&id=#url.id#&Portfolio=#url.portfolio#','myWindowEnlarge',1012,710,'yes','no');"><!--- #qShowcaseGalleryIndividualPhotos.imageposition# --->

<!--- ImageSizer --->									
<cfset xheight=240>
<cfset xwidth=500>
<cfset xImageAddress="#xRelativePath#\Artists\#qShowcaseArtist.Subdirectory#\#Portfolio#\Images_MaxLarge\">
<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image#qShowcaseGalleryIndividualPhotos.imageNUMBER#.jpg">

<cfinclude template="../../templates/imagesizer.cfm">

</a></div>
<!--- End ImageSizer --->
				
				

              </td>		

			  </tr>
			</TABLE>
			<TABLE WIDTH="100%">
			   <tr> 
				 <td width="100%" align="right" valign="bottom">	
				 
				 <TABLE><TR><TD ALIGN="Left">
			 </cfif>
             
			  
              

			 		  <font face="verdana, arial, helvetica, sans-serif" size="1" color="SILVER" style="TEXT-DECORATION: none">
	          <b>
			<cfif #qShowcaseArtist.MultiArtists# is 1>

				  
				  <!--- Image Title --->
				  
				  <cfif len(#qShowcaseGalleryIndividualPhotos.title#) GT 0>
						 <cfif len(trim(#qShowcaseGalleryIndividualPhotos.yearprod#)) GT 0  and FIND(#qShowcaseGalleryIndividualPhotos.yearprod#,#qShowcaseGalleryIndividualPhotos.title#) is 0>
						   #qShowcaseGalleryIndividualPhotos.title#,
						 <cfelse>
						   #qShowcaseGalleryIndividualPhotos.title#
						 </cfif>
				 <cfelse>
						 <cfif len(trim(#qShowcaseGalleryIndividualPhotos.yearprod#)) GT 0  and FIND(#qShowcaseGalleryIndividualPhotos.yearprod#,#qShowcaseGalleryIndividualPhotos.title#) is 0>
						   #qShowcaseGalleryDefaultPhotos.title#,
						 <cfelse>
						   #qShowcaseGalleryDefaultPhotos.title#
						 </cfif>
				 </cfif>
				  <cfif len(trim(#qShowcaseGalleryIndividualPhotos.yearprod#)) GT 0 and FIND(#qShowcaseGalleryIndividualPhotos.yearprod#,#qShowcaseGalleryIndividualPhotos.title#) is 0>
						 #qShowcaseGalleryIndividualPhotos.yearprod#
				 <cfelseif len(trim(#qShowcaseGalleryDefaultPhotos.yearprod#)) GT 0 and #qShowcaseGalleryIndividualPhotos.default3# is 1 and FIND(#qShowcaseGalleryIndividualPhotos.yearprod#,#qShowcaseGalleryIndividualPhotos.title#) is 0>

						 #qShowcaseGalleryDefaultPhotos.yearprod#
				<cfelse>
				 </cfif>			 
				 <BR><BR>Photograph by <BR>#qShowcaseGalleryIndividualPhotos.firstname# #qShowcaseGalleryIndividualPhotos.lastname#<br><br>
				 
				 
				
				<cfelse>
				  <!--- Portfolio Title --->
				  <cfif len(#qShowcaseGalleryDefaultPhotos.portfolioName#) is 0 and #qShowcasePortfolioQTY.recordcount# GT 1>
						
     					<font color="##FFFF99"> #left(qShowcasePortfolio.Subdirectory,9)# #mid(qShowcasePortfolio.Subdirectory,10,2)#</font><br><br>
				 <cfelse>
<font color="##FFFF99">
				 #qShowcaseGalleryDefaultPhotos.portfolioName#</font><br><br>
				  </cfif>
				  			  
				  <!--- Portfolio Introduction --->
					  <cfif len(#qShowcasePortfolio.portfoliointro#) GT 0 and #qShowcaseGalleryIndividualPhotos.imagenumber# is 1 and #len(qShowcaseGalleryDefaultPhotos.portfolioName)# GT 0>
						 <A HREF="javascript:popUp('PortfolioIntro.cfm?id=#url.id#&IMAGENUMBER=#url.image#&PORTFOLIO=#url.portfolio#','myWindowEnlarge',630,460,'auto');">
      <font face="verdana, arial, helvetica, sans-serif" size="1" color="##999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##999999';">
      Introduction</font></a><br><br><br>
	  
	  					<cfelseif len(#qShowcasePortfolio.portfoliointro#) GT 0 and #qShowcaseGalleryIndividualPhotos.imagenumber# is 1>
						<A HREF="javascript:popUp('PortfolioIntro.cfm?id=#url.id#&IMAGENUMBER=#url.image#&PORTFOLIO=#url.portfolio#','myWindowEnlarge',630,460,'auto');">
      <font face="verdana, arial, helvetica, sans-serif" size="1" color="##999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##999999';">
      #qShowcasePortfolio.Title#<br>Introduction</font></a><br><br><br>
				  </cfif>			  
				  
				  <!--- Image Title --->
				  
				  <cfif len(#qShowcaseGalleryIndividualPhotos.title#) GT 0>
						 <cfif len(trim(#qShowcaseGalleryIndividualPhotos.yearprod#)) GT 0  and FIND(#qShowcaseGalleryIndividualPhotos.yearprod#,#qShowcaseGalleryIndividualPhotos.title#) is 0>
						   #qShowcaseGalleryIndividualPhotos.title#,
						 <cfelse>
						   #qShowcaseGalleryIndividualPhotos.title#
						 </cfif>
				 <cfelse>
						 <cfif len(trim(#qShowcaseGalleryIndividualPhotos.yearprod#)) GT 0  and FIND(#qShowcaseGalleryIndividualPhotos.yearprod#,#qShowcaseGalleryIndividualPhotos.title#) is 0>
						   #qShowcaseGalleryDefaultPhotos.title#,
						 <cfelse>
						   #qShowcaseGalleryDefaultPhotos.title#
						 </cfif>
				 </cfif>
				  <cfif len(trim(#qShowcaseGalleryIndividualPhotos.yearprod#)) GT 0 and FIND(#qShowcaseGalleryIndividualPhotos.yearprod#,#qShowcaseGalleryIndividualPhotos.title#) is 0>
						 #qShowcaseGalleryIndividualPhotos.yearprod#<br><br>
				 <cfelseif len(trim(#qShowcaseGalleryDefaultPhotos.yearprod#)) GT 0 and #qShowcaseGalleryIndividualPhotos.default3# is 1 and FIND(#qShowcaseGalleryIndividualPhotos.yearprod#,#qShowcaseGalleryIndividualPhotos.title#) is 0>

						 #qShowcaseGalleryDefaultPhotos.yearprod#<br><br>
				<cfelse>
				 <br>
				 </cfif>			 
				
			</cfif>
				  		  
<!--- 				  <cfif len(#qShowcaseGalleryDefaultPhotos.portfolioName#) GT 0 and #qShowcaseGalleryIndividualPhotos.imagenumber# is 1 and #left(qShowcasePortfolio.Subdirectory,9)# is not #left(qShowcaseGalleryDefaultPhotos.portfolioName,9)#>
						
     					<font color="##FFFF99"> #left(qShowcasePortfolio.Subdirectory,9)# #mid(qShowcasePortfolio.Subdirectory,10,2)#<br>  
#qShowcaseGalleryDefaultPhotos.portfolioName#</font><br><br>
				 <cfelseif len(#qShowcaseGalleryDefaultPhotos.portfolioName#) GT 0 and #qShowcaseGalleryIndividualPhotos.imagenumber# is 1>
<font color="##FFFF99">
				 #qShowcaseGalleryDefaultPhotos.portfolioName#</font><br><br>
				  </cfif> --->
				  
	
				 
<!--- 				 <cfif len(trim(#qShowcaseGalleryIndividualPhotos.yearprod#)) GT 0 and RIGHT(#qShowcaseGalleryIndividualPhotos.title#,4) is NOT #qShowcaseGalleryIndividualPhotos.yearprod#>
						 #qShowcaseGalleryIndividualPhotos.yearprod#<br>
				 <cfelseif len(trim(#qShowcaseGalleryDefaultPhotos.yearprod#)) GT 0 and #qGetShowcaseIndividualInfo.default3# is 1 and RIGHT(#qShowcaseGalleryDefaultPhotos.title#,4) is NOT #qShowcaseGalleryIndividualPhotos.yearprod#>
						 #qShowcaseGalleryDefaultPhotos.yearprod#<br>
				<cfelse> --->
				
				</b>
		</font>
				<font face="Verdana, Arial, Helvetica, sans-serif" color="##999999" size="1">
				<b> 
                  <cfif len(#qShowcaseGalleryIndividualPhotos.caption1#) GT 0>
						 <br><A HREF="javascript:popUp('caption.cfm?id=#url.id#&IMAGENUMBER=#url.image#&PORTFOLIO=#url.portfolio#','myWindowEnlarge',630,460);">
      <font face="verdana, arial, helvetica, sans-serif" size="1" color="##999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##999999';">
      Caption</font></a><br><br>
<!--- 				 <cfelseif len(#qShowcaseGalleryDefaultPhotos.caption1#) GT 0>
						 #qShowcaseGalleryDefaultPhotos.caption1# <br> --->
				 </cfif>                
				 
                 <cfif len(#qShowcaseGalleryIndividualPhotos.medium#) GT 0 and #qShowcaseGalleryIndividualPhotos.medium# is NOT 'Other Medium'>
						#qShowcaseGalleryIndividualPhotos.medium# <br> 
				 <cfelseif len(#qShowcaseGalleryIndividualPhotos.othermed#) GT 0> 					#qShowcaseGalleryIndividualPhotos.othermed# <br>
				 <cfelseif len(#qShowcaseGalleryDefaultPhotos.othermed#) GT 0> 					#qShowcaseGalleryDefaultPhotos.othermed# <br>
				 <cfelseif len(#qShowcaseGalleryDefaultPhotos.medium#) GT 0> 					#qShowcaseGalleryDefaultPhotos.medium# <br>
				 </cfif>
				 
                 <cfif val(#qShowcaseGalleryIndividualPhotos.width1#) GT 1>
				      #qShowcaseGalleryIndividualPhotos.height1#x#qShowcaseGalleryIndividualPhotos.width1#&quot; Image<br>
			 <!--- Make sure that there is a width size that exists --->
					<cfelseif val(#qShowcaseGalleryDefaultPhotos.width1#) is 1 and val(#qShowcaseGalleryDefaultPhotos.height1#) is 1>
				Image Size Varies<br>
					  <cfelseif val(#qShowcaseGalleryDefaultPhotos.width1#) GT 0>
 #qShowcaseGalleryDefaultPhotos.height1#x#qShowcaseGalleryDefaultPhotos.width1#&quot; Image<br>
				 </cfif>  
	
				  
				  <!--- Mat --->
				  <!--- Individual Photos --->
				  <cfif (val(#qShowcaseGalleryIndividualPhotos.Matwidth1#) GT 0) or (VAL(#qShowcaseGalleryIndividualPhotos.default4#) is 0)>
				 	<cfif #qShowcaseGalleryIndividualPhotos.unmatted# is 1>
					 	 Unmatted<br>
					 	<!--- Make sure that there is a mat size that exists --->
					  <cfelseif val(#qShowcaseGalleryIndividualPhotos.Matwidth1#) GT 1>
					 	<!--- if Default Mat is the same size as the print, assume that it is unmatted>--->
						<cfif #qShowcaseGalleryIndividualPhotos.matheight1# is #qShowcaseGalleryIndividualPhotos.height1# and 
#qShowcaseGalleryIndividualPhotos.matwidth1# is #qShowcaseGalleryIndividualPhotos.width1#>
						Mat size varies<br>
						<cfelse> #qShowcaseGalleryIndividualPhotos.matheight1#x#qShowcaseGalleryIndividualPhotos.matwidth1#&quot; Mat<br>
						</cfif>
				    </cfif>  		
				 <cfelse>
				 	<!--- Default Photos --->
					  <cfif #qShowcaseGalleryDefaultPhotos.unmatted# is 1 >
					 	Unmatted<br> 
					 <!--- Make sure that there is a mat size that exists --->
					  <cfelseif val(#qShowcaseGalleryDefaultPhotos.Matwidth1#) GT 0>
		  				<!--- if Mat is the same size as the print, assume that it is unmatted>--->
						<cfif #qShowcaseGalleryDefaultPhotos.matheight1# is #qShowcaseGalleryDefaultPhotos.height1# and 
#qShowcaseGalleryDefaultPhotos.matwidth1# is #qShowcaseGalleryDefaultPhotos.width1#>
						Mat size varies<br>
						<cfelse>
 #qShowcaseGalleryDefaultPhotos.matheight1#x#qShowcaseGalleryDefaultPhotos.matwidth1#&quot; Mat <br>			
						</cfif>
					  </cfif> 	 
				 </cfif>
				 
				 	<!--- If len(Edition No) is 0 --->
			<cfif #qShowcaseGalleryIndividualPhotos.Editioned1# is 1 and (#len(trim(qShowcaseGalleryIndividualPhotos.EditionNo1))# is 0 or #qShowcaseGalleryIndividualPhotos.EditionNo1# is 0) and #len(trim(qShowcaseGalleryIndividualPhotos.EditionSz1))# GT 0>
Edition of #qShowcaseGalleryIndividualPhotos.EditionSz1#<br> 

			 <cfelseif #qShowcaseGalleryIndividualPhotos.Default5# is 1 and  #qShowcaseGalleryDefaultPhotos.Editioned1# is 1 and (#len(trim(qShowcaseGalleryDefaultPhotos.EditionNo1))# is 0 or #qShowcaseGalleryIndividualPhotos.EditionNo1# is 0)>		
Edition of #qShowcaseGalleryDefaultPhotos.EditionSz1#<br>  
				 <cfelseif #qShowcaseGalleryIndividualPhotos.Editioned1# is 1 and #len(qShowcaseGalleryIndividualPhotos.EditionNo1)# GT 0 and #len(qShowcaseGalleryIndividualPhotos.EditionSz1)# GT 0>	#qShowcaseGalleryIndividualPhotos.EditionNo1#/#qShowcaseGalleryIndividualPhotos.EditionSz1#<br> 
				 <cfelseif #qShowcaseGalleryIndividualPhotos.Default5# is 1 and  #qShowcaseGalleryDefaultPhotos.Editioned1# is 1>		#qShowcaseGalleryDefaultPhotos.EditionNo1#/#qShowcaseGalleryDefaultPhotos.EditionSz1#<br>
			    </cfif>
				 
				 
<!--- 				 <cfif #qShowcaseGalleryIndividualPhotos.Editioned1# is 1 and #len(qShowcaseGalleryIndividualPhotos.EditionNo1)# GT 0 and #len(qShowcaseGalleryIndividualPhotos.EditionSz1)# GT 0>	#qShowcaseGalleryIndividualPhotos.EditionNo1#/#qShowcaseGalleryIndividualPhotos.EditionSz1#<br> 
				 <cfelseif #qShowcaseGalleryIndividualPhotos.Default5# is 1 and  #qShowcaseGalleryDefaultPhotos.Editioned1# is 1>		#qShowcaseGalleryDefaultPhotos.EditionNo1#/#qShowcaseGalleryDefaultPhotos.EditionSz1#<br>
				 </cfif> --->		 
				  <cfif (#qShowcaseGalleryIndividualPhotos.defaultnfs# is 1 and qShowcaseGalleryDefaultPhotos.notavailable is 5) or (#qShowcaseGalleryIndividualPhotos.defaultnfs# is 0 and qShowcaseGalleryIndividualPhotos.notavailable is 5)>				
                 <cfelseif #qShowcaseGalleryIndividualPhotos.price1# GT 0 and  qShowcaseGalleryIndividualPhotos.NotAvailable is 0 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1>
						$#qShowcaseGalleryIndividualPhotos.price1# <cfif #qShowcaseGalleryDefaultPhotos.PortfolioPrice# is 1>Portfolio Price</cfif><br> 
				 <cfelseif #qShowcaseGalleryDefaultPhotos.price1# GT 0 and #qShowcaseGalleryDefaultPhotos.NotAvailable# is 0 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is  1>
					$#qShowcaseGalleryDefaultPhotos.price1# <cfif #qShowcaseGalleryDefaultPhotos.PortfolioPrice# is 1>Portfolio Price</cfif><br>
				 </cfif>
				 
				<CFIF len(#qShowcaseGalleryIndividualPhotos.AddInfo1#) is not 0> 
    
    				<br><br><A HREF="javascript:popUp('printinfoMiddle.cfm?id=#url.id#&IMAGENUMBER=#url.image#&PORTFOLIO=#url.portfolio#','myWindowEnlarge',630,460);">
      <font face="verdana, arial, helvetica, sans-serif" size="1" color="##999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##999999';">
      Print Info</font></a></td>
   				<cfelseif len(#qShowcaseGalleryDefaultPhotos.AddInfo1#) is not 0>
         <br><br><A HREF="javascript:popUp('printinfoMiddle.cfm?id=#url.id#&IMAGENUMBER=#url.image#&PORTFOLIO=#url.portfolio#','myWindowEnlarge',630,460);">
      <font face="verdana, arial, helvetica, sans-serif" size="1" color="##999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##999999';">
      Print Info</font></a></td>
    			<cfelse>
      				</td>
			    </cfif> 
				 
			</b>
			</font>
			

	<!--- 		 <td width="*" height="*" valign="top">
			</td> --->

			
            </tr>
            <tr valign="middle" height="165"> 
              <td width="*" height="50" valign="bottom"> 



			  
<input type="hidden" name="UserID" value="#Cookie.UserIdNumber#">
<input type="hidden" name="NumCopies" value="1">
<input type="hidden" name="Binding" value="Photograph">
<input type="hidden" name="ListPrice" value="#qGetDetails.Soft_price#">
<input type="hidden" name="SalePrice" value="0">
<input type="hidden" name="RecordID" value="#qGetDetails.recordID#">
<input type="hidden" name="Catnum" value="#qGetDetails.Catalog#">
<input type="hidden" name="Title" value="#qGetDetails.Title2x#">

	  
                <p>
				
				
				<cfif #qShowcasePortfolio.Backgroundcolor# is "333333">
					<cfif (qShowcaseGalleryIndividualPhotos.NotAvailable is 5 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 5 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1)>
					 <a href="mailto:gallery@photoeye.com?Subject=#qShowcaseArtist.FirstName# #qShowcaseArtist.LastName# Price Inquiry"><font face="verdana, arial, helvetica, sans-serif" size="1" color="##999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##999999';"><strong>Price Upon Request</strong></font></a><br>
					<cfelseif (qShowcaseGalleryIndividualPhotos.NotAvailable is 0 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 0 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1)>
					<input type="image" src="../sharedimages/purchaseprintGray.gif" align="absmiddle" width="90" height="15" border="0"><br>
					<cfelseif (qShowcaseGalleryIndividualPhotos.NotAvailable is 1 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 1 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1)>
					 <font face="verdana, arial, helvetica, sans-serif" size="1" color="YELLOW" style="TEXT-DECORATION: none">Sold Out</font><br>
					<cfelseif (qShowcaseGalleryIndividualPhotos.NotAvailable is 2 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 2 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1)>
					 <font face="verdana, arial, helvetica, sans-serif" size="1" color="YELLOW" style="TEXT-DECORATION: none">Reserved</font><br>
					<cfelseif (qShowcaseGalleryIndividualPhotos.NotAvailable is 3 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 3 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1)>
					 <font face="verdana, arial, helvetica, sans-serif" size="1" color="YELLOW" style="TEXT-DECORATION: none">Not for Sale</font><br>
					</cfif>
  				  <img src="../SharedImages/dot_clear.gif" width="1" height="20" alt="" border="0"><a href="javascript:popUp('Pages_MaxEnlarge/image1.cfm?imageposition=#image#&id=#url.id#&Portfolio=#url.portfolio#','myWindowEnlarge',1012,710,'yes','no');"><img src="../sharedimages/enlargeGray.gif" width="90" height="15" alt="" border="0" name="img2"></a>  <!---#qShowcaseGalleryIndividualPhotos.imageposition# --->
                 <cfelse>
					<cfif (qShowcaseGalleryIndividualPhotos.NotAvailable is 5 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 5 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1)>
					 <a href="mailto:gallery@photoeye.com?Subject=#qShowcaseArtist.FirstName# #qShowcaseArtist.LastName# Price Inquiry"><font face="verdana, arial, helvetica, sans-serif" size="1" color="##999999" style="TEXT-DECORATION: none" onMouseOver="this.color='Red';" onMouseOut="this.color='##999999';"><strong>Price Upon Request</strong></font></a><br>
					<cfelseif (qShowcaseGalleryIndividualPhotos.NotAvailable is 0 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 0 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1)>
					<input type="image" src="../sharedimages/purchaseprint.gif" align="absmiddle" width="90" height="15" border="0"><br>
					<cfelseif (qShowcaseGalleryIndividualPhotos.NotAvailable is 1 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 1 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1)>
					 <font face="verdana, arial, helvetica, sans-serif" size="1" color="Yellow" style="TEXT-DECORATION: none">Sold Out</font><br>
					<cfelseif (qShowcaseGalleryIndividualPhotos.NotAvailable is 2 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 2 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1)>
					 <font face="verdana, arial, helvetica, sans-serif" size="1" color="Yellow" style="TEXT-DECORATION: none">Reserved</font><br>
					<cfelseif (qShowcaseGalleryIndividualPhotos.NotAvailable is 3 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 3 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1)>
					 <font face="verdana, arial, helvetica, sans-serif" size="1" color="Yellow" style="TEXT-DECORATION: none">Not for Sale</font><br>
					</cfif>
						   <img src="../SharedImages/dot_clear.gif" width="1" height="20" alt="" border="0"><a href="javascript:popUp('Pages_MaxEnlarge/image1.cfm?imageposition=#image#&id=#url.id#&Portfolio=#url.portfolio#','myWindowEnlarge',1012,710,'yes','no');"><img src="../sharedimages/enlarge.gif" width="90" height="15" alt="" border="0" name="img2"></a><!---  image=#image#&id=#url.id# ---><!--- #qShowcaseGalleryIndividualPhotos.imageposition# --->
				 </cfif>
                </p>
              </td>
            </tr>
          </table>
		  
		  <cfif xPan is 1>
		  </td>
		  </tr>
          </table>
		  </cfif>
		  
        </td>
      </tr>
    </table>

  </center>

</form>
</div>
</BODY>
</cfoutput>
</HTML>






	

