<!--- Decide where to start the random images based on page number> --->
<!--- <cfset imgbegin=((#url.page#/2)*20)> --->
<cfif Isdefined("url.page")>
	<cfif #url.page# gt 1>
	<cfset imgbegin=4>
	

	<cfelse>
	<cfset imgbegin=0>
	</cfif>
	<cfset additional=#url.additional#>
<cfelse>
	<cfset imgbegin=0>
	<cfset page=1>
</cfif>



<CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
SELECT G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, I.ImageNumber as Imagenumber, I.ImagePosition as ImagePosition,
    P.Subdirectory as Portfolio
FROM GallerySetup AS G INNER JOIN GalleryDefaultPhotos as D ON G.Custnumber=D.Custnumber
INNER JOIN  GalleryPortfolio as P ON G.Custnumber=P.Custnumber
INNER JOIN  GalleryIndividualPhotos as I ON G.Custnumber=I.Custnumber
WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 AND GenreRandomNo>#url.Begin# AND I.Selected=1 
ORDER BY GenreRandomNo
</cfquery>
<!--- AND G.Portfolio="" --->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Galleries | Contact Sheet</title>
	
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
img1on.src = "../rolloverimages/purchaseprint_over.gif";   // Active Images 
img1off = new Image();
img1off.src = "../rolloverimages/purchaseprint.gif";   // InActive Images

img2on = new Image();
img2on.src = "../rolloverimages/enlarge_over.gif";   // Active Images 
img2off = new Image();
img2off.src = "../rolloverimages/enlarge.gif";   // InActive Images

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
</head>



<body bgcolor="#333333" text="#FFFFFF" link="Silver" vlink="Gray" alink="Red">
<table width="80%" height="36" border="0" align="center" bgcolor="Black">
<tr>
    <td  width="100%" height="51" align="center"><img src="SharedImages/photoeyeexplorephotographersshowcase7.jpg" width="384" height="84" alt="" border="0"></td>

</tr>
</table>

<br>
  
<div align="center"><font face="verdana, arial, helvetica, sans-serif" size="2" color="#CCCCCC"><b>S E L E C T E D  &nbsp;&nbsp;&nbsp;I M A G E S</b><br>
  </font> <img src="SharedImages/Redlinetoc.gif" width="400" height="1" alt="" border="0"> 
<br>
  </font>
  <font face="verdana, arial, helvetica, sans-serif" size="1" color="#CCCCCC"><b> 
<cfoutput>
  <cfset RecordCount = #qGetShowcaseSetupInfo.RecordCount#>
  <cfif isdefined("url.additional")>
  <cfelse>
  <cfset Additional = #qGetShowcaseSetupInfo.RecordCount#/20>
  <cfset Additional = #ceiling(Additional)#>

  </cfif>
 
    <!---   1 - 2 - 3 - 4 - 5 - 6 - 7 - 8 - 9 - 10 - 11+ --->  
  <cfset counter = 1>
  <cfloop index="NumberHeader" from="1" to="#Additional#" step="1">

  <cfif counter is 1>
 	<cfif #counter# is #page#>
	<FONT color="Yellow" face="verdana, arial, Helvetica, sans-serif" size="2"> <b>#counter#</b></font>
	<cfelse>
	<a href="morecontactsheets.cfm?page=#counter#&additional=#additional#&Begin=#qGetShowcaseSetupInfo.GeneralRandomNo#"><FONT color="silver" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='silver';"  style="TEXT-DECORATION: none"><b>#counter#</b></font></a>
	</cfif>
  </cfif>
  <cfif counter gt 1 and counter lt 11>
 	<cfif #counter# is #page#>
	- <FONT color="Yellow" face="verdana, arial, Helvetica, sans-serif" size="2"><b>#counter#</b></font>
	<cfelse>
	- <a href="morecontactsheets.cfm?page=#counter#&additional=#additional#&Begin=#qGetShowcaseSetupInfo.GeneralRandomNo#"><FONT color="silver" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='silver';"  style="TEXT-DECORATION: none"><b>#counter#</b></font></a>
	</cfif>
  </cfif>
  <cfif counter is 11>
 	<cfif #counter# is #page#>
	- <FONT color="Yellow" face="verdana, arial, Helvetica, sans-serif" size="2"><b>11+</b></font>
	<cfelse>
	- <a href="morecontactsheets.cfm?page=#counter#&additional=#additional#&Begin=#qGetShowcaseSetupInfo.GeneralRandomNo#"><FONT color="silver" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='silver';"  style="TEXT-DECORATION: none"><b>11+</b></font></a>
	</cfif>
 	<cfbreak>
  </cfif>
  <cfset counter = counter+1>
  </cfloop>
  </b></font><br>
  <img src="Photoshowcase/SharedImages/dot_clear.gif" width="1" height="1"> <br>
  
 <!---  <table border="0" cellspacing="6" cellpadding="5" align="center"> --->



<cfset ImageNumber = 1>
<cfset ImagePosition = 1>
 

<cfset Column = 1>
<cfloop query="qGetShowcaseSetupInfo" startrow="1" endrow="20">
  <cfif Column is 1>
  	 <table width="600" border="0" cellpadding="10">
	<tr>
    <td height="103" align="center">
	 <a href="javascript:popUp('forms/index.cfm?id=#qGetShowcaseSetupInfo.Custnumber#&image=#ImageNumber#&imagePosition=#ImagePosition#&Door=3&Portfolio=#qGetShowcaseSetupInfo.Portfolio#','Showcase','700','480','no');"><img src="#qGetShowcaseSetupInfo.Gallery#/Artists/#qGetShowcaseSetupInfo.Subdirectory#/#qGetShowcaseSetupInfo.Portfolio#/Images_Search/Image1.jpg" name="img2"></a></td>

	<cfset Column = 2>
	<cfelse>
     <td height="103" align="center">
	 <a href="javascript:popUp('forms/index.cfm?id=#qGetShowcaseSetupInfo.Custnumber#&image=#ImageNumber#&imagePosition=#ImagePosition#&Door=3&Portfolio=#qGetShowcaseSetupInfo.Portfolio#','Showcase','700','480','no');"><img src="#qGetShowcaseSetupInfo.Gallery#/Artists/#qGetShowcaseSetupInfo.Subdirectory#/#qGetShowcaseSetupInfo.Portfolio#/Images_Search/Image1.jpg" name="img2" border="1" alt=""></a></td>
		<cfif column is 5>	
			<cfset Column = 1>	
			</tr>
			</table>
			 <hr width="400" size="1" noshade>
		<cfelse>
			<cfset Column = Column + 1>	
		</cfif>
	</cfif>
	
</cfloop>

</table>  		
</cfoutput>


</div>

</body>
</html>
