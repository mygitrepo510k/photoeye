<!--- Query information by above subdirectory name --->
<!--- <CFQUERY NAME="qShowcaseGalleryIndividualPhotos"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryIndividualPhotos where custnumber='#url.id#' AND IMAGENUMBER='#url.image#' 
</CFQUERY> --->

<CFQUERY NAME="qShowcaseArtist"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup where Custnumber=#url.id#
</CFQUERY>

<CFQUERY NAME="qShowcasePortfolio"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryPortfolio where Custnumber=#url.id# AND SUBDIRECTORY='#url.portfolio#'
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
  FROM GalleryIndividualPhotos where custnumber=#url.id# AND IMAGENUMBER='#url.image#' AND PORTFOLIONAME='#url.portfolio#'
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

<script language="JavaScript">

<!-- hide from JavaScript-challenged browsers

var popupWin = null;
function popUp(myURL,myWindowName,w,h,scroll,menu){
var myLeft = ((screen.width-w)/2)-5; 
var myTop = ((screen.height-h)/2)-10;   
var settings='height='+h+',width='+w+',top='+myTop+',left='+myLeft+', scrollbars=yes,resizable=yes,menu='+menu
popupWin=window.open(myURL,myWindowName,settings);   
if(parseInt(navigator.appVersion) >= 4){popupWin.focus();}
}



 if (document.images) {

img1on = new Image();
img1on.src = "../sharedimages/purchaseprint_over.gif";   // Active Images 
img1off = new Image();
img1off.src = "../sharedimages/purchaseprint.gif";   // InActive Images

img2on = new Image();
img2on.src = "../sharedimages/enlarge_over.gif";   // Active Images 
img2off = new Image();
img2off.src = "../sharedimages/enlarge.gif";   // InActive Images

        }

function imgon(imgName) {
        if (document.images) {
                document[imgName].src = eval(imgName + "on.src");

                }
}

        // Function to 'deactivate' images
        function imgoff(imgName) {
                if (document.images) {
                        document[imgName].src = eval(imgName + "off.src");
                        }
}



// done hiding -->

</script>

</HEAD>

<cfoutput>

<BODY text="##999999" vlink="##999999" link="##999999" alink="Red" bgcolor="###Background#" topmargin="1"> 


<CFINCLUDE TEMPLATE="../../templates/UserIdentification.cfm">
<div align="center">
<FORM ACTION="../../templates/AddtoCartGallerySale.cfm" METHOD="POST" target="_top">
<center>
    <table height="80%" cellpadding="5" align="center" width="100%">
      <tr align="right"> 
        <td height="80%"> 
          
		 	 <table height="100" cellpadding="5" align="right" width="100%" bgcolor="###Background#">           

			
			<tr valign="bottom" height="165" align="left"> 
             
			  <td width="65%" height="*" rowspan="2" valign="top" align="right">
			    <div align="right"><a href="javascript:popUp('pages_enlarge/Image1.cfm?image=#url.image#&id=#url.id#&Portfolio=#url.portfolio#','Showcase','600','480','no');"><!--- #qShowcaseGalleryIndividualPhotos.imageposition# --->
				<img src="../#qShowcaseArtist.Gallery#/Artists/#qShowcaseArtist.Subdirectory#/#Portfolio#/Images_Medium/Image#URL.image#.jpg" alt="" border="0"></a></div>
              </td>
             
			  <td width="5" height="*" rowspan="2" valign="top">&nbsp; </td>
              

			  <td width="150" height="*" align="left" valign="bottom">			  <font face="verdana, arial, helvetica, sans-serif" size="1" color="SILVER" style="TEXT-DECORATION: none">
	          <b>
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
				 
				 
<!--- 				 <cfif len(trim(#qShowcaseGalleryIndividualPhotos.yearprod#)) GT 0 and RIGHT(#qShowcaseGalleryIndividualPhotos.title#,4) is NOT #qShowcaseGalleryIndividualPhotos.yearprod#>
						 #qShowcaseGalleryIndividualPhotos.yearprod#<br>
				 <cfelseif len(trim(#qShowcaseGalleryDefaultPhotos.yearprod#)) GT 0 and #qGetShowcaseIndividualInfo.default3# is 1 and RIGHT(#qShowcaseGalleryDefaultPhotos.title#,4) is NOT #qShowcaseGalleryIndividualPhotos.yearprod#>
						 #qShowcaseGalleryDefaultPhotos.yearprod#<br>
				<cfelse> --->
				 <cfif len(trim(#qShowcaseGalleryIndividualPhotos.yearprod#)) GT 0 and FIND(#qShowcaseGalleryIndividualPhotos.yearprod#,#qShowcaseGalleryIndividualPhotos.title#) is 0>
						 #qShowcaseGalleryIndividualPhotos.yearprod#<br>
				 <cfelseif len(trim(#qShowcaseGalleryDefaultPhotos.yearprod#)) GT 0 and #qShowcaseGalleryIndividualPhotos.default3# is 1 and FIND(#qShowcaseGalleryIndividualPhotos.yearprod#,#qShowcaseGalleryIndividualPhotos.title#) is 0>

						 #qShowcaseGalleryDefaultPhotos.yearprod#<br>
				<cfelse>
				 <br>
				 </cfif>			 
				</b>
				</font>
				<br>
				<font face="Verdana, Arial, Helvetica, sans-serif" color="##999999" size="1">
				<b> 
                  <cfif len(#qShowcaseGalleryIndividualPhotos.caption1#) GT 0>
						 #qShowcaseGalleryIndividualPhotos.caption1# <br> 
				 <cfelseif len(#qShowcaseGalleryDefaultPhotos.caption1#) GT 0>
						 #qShowcaseGalleryDefaultPhotos.caption1# <br>
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
	
				  <cfif (val(#qShowcaseGalleryIndividualPhotos.Matwidth1#) GT 0) or (VAL(#qShowcaseGalleryIndividualPhotos.default4#) is 0)>
				 	<cfif #qShowcaseGalleryIndividualPhotos.unmatted# is 1>
					 	 Ready to Display<br>
					 	<!--- Make sure that there is a mat size that exists --->
					  <cfelseif val(#qShowcaseGalleryIndividualPhotos.Matwidth1#) GT 0>
					  #qShowcaseGalleryIndividualPhotos.matheight1#x#qShowcaseGalleryIndividualPhotos.matwidth1#&quot; Mat<br>
					  </cfif>  		
				 <cfelse>
				 
					  <cfif #qShowcaseGalleryDefaultPhotos.unmatted# is 1 >
					 	 Ready to Display<br> 
					 <!--- Make sure that there is a mat size that exists --->
					  <cfelseif val(#qShowcaseGalleryDefaultPhotos.Matwidth1#) GT 0>
		   #qShowcaseGalleryDefaultPhotos.matheight1#x#qShowcaseGalleryDefaultPhotos.matwidth1#&quot; Mat <br>
					  </cfif> 	 
				 </cfif>
				 
				 	<!--- If len(Edition No) is 0 --->
			<cfif #qShowcaseGalleryIndividualPhotos.Editioned1# is 1 and (#len(trim(qShowcaseGalleryIndividualPhotos.EditionNo1))# is 0 or #qShowcaseGalleryIndividualPhotos.EditionNo1# is 0) and #len(trim(qShowcaseGalleryIndividualPhotos.EditionSz1))# GT 0>
Edition of #qShowcaseGalleryIndividualPhotos.EditionSz1#<br> 

<!--- 				 <cfelseif #qShowcaseGalleryIndividualPhotos.Default5# is 1 and  #qShowcaseGalleryDefaultPhotos.Editioned1# is 1 and (#len(trim(qShowcaseGalleryDefaultPhotos.EditionNo1))# is 0 or #qShowcaseGalleryIndividualPhotos.EditionNo1# is 0)>		
Edition of #qShowcaseGalleryDefaultPhotos.EditionSz1#<br>  --->
				 <cfelseif #qShowcaseGalleryIndividualPhotos.Editioned1# is 1 and #len(qShowcaseGalleryIndividualPhotos.EditionNo1)# GT 0 and #len(qShowcaseGalleryIndividualPhotos.EditionSz1)# GT 0>	#qShowcaseGalleryIndividualPhotos.EditionNo1#/#qShowcaseGalleryIndividualPhotos.EditionSz1#<br> 
				 <cfelseif #qShowcaseGalleryIndividualPhotos.Default5# is 1 and  #qShowcaseGalleryDefaultPhotos.Editioned1# is 1>		#qShowcaseGalleryDefaultPhotos.EditionNo1#/#qShowcaseGalleryDefaultPhotos.EditionSz1#<br>
				 </cfif>
				 
				 
<!--- 				 <cfif #qShowcaseGalleryIndividualPhotos.Editioned1# is 1 and #len(qShowcaseGalleryIndividualPhotos.EditionNo1)# GT 0 and #len(qShowcaseGalleryIndividualPhotos.EditionSz1)# GT 0>	#qShowcaseGalleryIndividualPhotos.EditionNo1#/#qShowcaseGalleryIndividualPhotos.EditionSz1#<br> 
				 <cfelseif #qShowcaseGalleryIndividualPhotos.Default5# is 1 and  #qShowcaseGalleryDefaultPhotos.Editioned1# is 1>		#qShowcaseGalleryDefaultPhotos.EditionNo1#/#qShowcaseGalleryDefaultPhotos.EditionSz1#<br>
				 </cfif> --->		 
				 				
                 <cfif #qShowcaseGalleryIndividualPhotos.price1# GT 0 and  qShowcaseGalleryIndividualPhotos.NotAvailable is 0 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0>
						$#qShowcaseGalleryIndividualPhotos.price1# <br> 
				 <cfelseif #qShowcaseGalleryDefaultPhotos.price1# GT 0 and #qShowcaseGalleryDefaultPhotos.NotAvailable# is 0 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1>
					$#qShowcaseGalleryDefaultPhotos.price1# <br>
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
			
				 
			 <td width="*" height="*" valign="top">
			</td>
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
					
					<cfif (qShowcaseGalleryIndividualPhotos.NotAvailable is 0 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 0 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1)>
					<input type="image" src="../sharedimages/purchaseprintGray.gif" align="absmiddle" width="90" height="15" border="0"><br>
					<cfelseif (qShowcaseGalleryIndividualPhotos.NotAvailable is 1 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 1 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1)>
					 <font face="verdana, arial, helvetica, sans-serif" size="1" color="YELLOW" style="TEXT-DECORATION: none">Sold Out</font><br>
					<cfelseif (qShowcaseGalleryIndividualPhotos.NotAvailable is 2 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 2 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1)>
					 <font face="verdana, arial, helvetica, sans-serif" size="1" color="YELLOW" style="TEXT-DECORATION: none">Reserved</font><br>
					<cfelseif (qShowcaseGalleryIndividualPhotos.NotAvailable is 3 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 3 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1)>
					 <font face="verdana, arial, helvetica, sans-serif" size="1" color="YELLOW" style="TEXT-DECORATION: none">Not for Sale</font><br>
					</cfif>
  				   <a href="javascript:popUp('pages_enlarge/Image1.cfm?image=#url.image#&id=#url.id#&Portfolio=#url.portfolio#','Showcase','600','480','no');"><img src="../sharedimages/enlargeGray.gif" width="90" height="15" alt="" border="0" name="img2"></a><!--- #qShowcaseGalleryIndividualPhotos.imageposition# --->
                 <cfelse>
					<cfif (qShowcaseGalleryIndividualPhotos.NotAvailable is 0 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 0 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1)>
					<input type="image" src="../sharedimages/purchaseprint.gif" align="absmiddle" width="90" height="15" border="0"><br>
					<cfelseif (qShowcaseGalleryIndividualPhotos.NotAvailable is 1 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 1 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1)>
					 <font face="verdana, arial, helvetica, sans-serif" size="1" color="Yellow" style="TEXT-DECORATION: none">Sold Out</font><br>
					<cfelseif (qShowcaseGalleryIndividualPhotos.NotAvailable is 2 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 2 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1)>
					 <font face="verdana, arial, helvetica, sans-serif" size="1" color="Yellow" style="TEXT-DECORATION: none">Reserved</font><br>
					<cfelseif (qShowcaseGalleryIndividualPhotos.NotAvailable is 3 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 0) or (qShowcaseGalleryDefaultPhotos.NotAvailable is 3 and #qShowcaseGalleryIndividualPhotos.defaultNFS# is 1)>
					 <font face="verdana, arial, helvetica, sans-serif" size="1" color="Yellow" style="TEXT-DECORATION: none">Not for Sale</font><br>
					</cfif>
					<a href="javascript:popUp('pages_enlarge/Image1.cfm?image=#url.image#&id=#url.id#&Portfolio=#url.portfolio#','Showcase','600','480','no');"><img src="../sharedimages/enlarge.gif" width="90" height="15" alt="" border="0" name="img2"></a><!---  image=#image#&id=#url.id# ---><!--- #qShowcaseGalleryIndividualPhotos.imageposition# --->
				 </cfif>
                </p>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>

  </center>

</form>
</div>
</BODY>
</cfoutput>
</HTML>






	

