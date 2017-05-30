<cfparam name="xUnsecure" default=1>
<cfinclude template="/global/includes/act_site_unsecure.cfm">
<!---<cfparam name="xLatitude" default="0">
<cfparam name="xLongitude" default="0">
<cfparam name="zpage" default="0">
<cfparam name="xYaw" default="0">
<cfparam name="xPitch" default="0">
<cfparam name="xZoom" default="0">

<cfset xdebug=0>
<cfif xdebug is 1>
<cfoutput>#qgetInfo.recordcount# #xPageHeight# #url.sort# </cfoutput>
<cfoutput>r(new GLatLng(#xLatitude#, #xLongitude#), #xAccuracy#) yaw=#xYaw# pitch=#xPitch# zoom=#xZoom#</cfoutput>
</cfif>

<!--- since the db structure for these columns is null, convert them to the default 0--->
<cfif len(trim(xyaw)) is 0>
	<cfset xyaw="0">
</cfif>
<cfif len(trim(xpitch)) is 0>
	<cfset xpitch="0">
</cfif>
<cfif len(trim(xzoom)) is 0>
	<cfset xzoom="0">
</cfif>

<!--- Tweak of Gargosian settings so we show the actual gallery  --->
<!---<cfset xyaw="235">
<cfset xzoom="2">--->

<cfparam name="xPageHeight" default="900">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>photo-eye | Nazraeli Guide</title>
<link href="images/favicon.ico" rel="shortcut icon"/>
<script src="SpryAssets/SpryEffects.js" type="text/javascript"></script>
<script type="text/javascript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
<cfinclude template="../../global/includes/js_photoeye_logo_hover.cfm">
//-->
</script>


<!--- If this is not a photographer --->
<!---<cfif len(trim(zpage)) is 0>
	<cfset xLatitude = 35.680404>
	<cfset xLongitude = -105.933246>
</cfif>--->
	<!--- ABQIAAAAGLygu72xTxPUIqNs3HgaixS7X2rHyalUndAmabl_0qy2SPNhAxREO6plcb6yKIK9Osn0fSZUhmnf5g --->
	<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=<cfoutput>#application.googlekey#</cfoutput>"
	  type="text/javascript"></script>
	<cfoutput>
	<script type="text/javascript">
	//<![CDATA[
	function load() {
	  if (GBrowserIsCompatible()) {
		 var map = new GMap2(document.getElementById("map"));
		 map.setCenter(new GLatLng(#xLatitude#, #xLongitude#), 13);
		map.addControl(new GLargeMapControl());
		map.addControl(new GMapTypeControl());
	//	map.addControl(new GOverviewMapControl());
		var marker = new GMarker(new GLatLng(#xLatitude#,#xLongitude#)); 
		map.addOverlay(marker);
	  }
	}
	//]]>
	</script>
	
    <script type="text/javascript">
    
    var myPano;
    
    function initialize() {
      var xpano = new GLatLng(#xLatitude#, #xLongitude#);
		myPOV = {yaw:#xYaw#,pitch:#xPitch#,zoom:#xZoom#};
      panoramaOptions = { latlng:xpano, pov:myPOV };
      var myPano = new GStreetviewPanorama(document.getElementById("pano"), panoramaOptions);
      GEvent.addListener(myPano, "error", handleNoFlash);
    }
     
    function handleNoFlash(errorCode) {
      if (errorCode == FLASH_UNAVAILABLE) {
        alert("Error: Flash doesn't appear to be supported by your browser");
        return;
      }
    }  
    </script>
  </cfoutput>
  
<!--- Popup Window for citation showcase portfolio --->
<SCRIPT language="JavaScript">
<!-- hide from JavaScript-challenged browsers
var popupWin = null;
function popUp(myURL,myWindowName,w,h,scroll,menu){
var myLeft = ((screen.width-w)/2)-5; 
var myTop =  ((screen.height-h)/2)-40;
if ((screen.width)  < w){ var w = screen.width - 20; var scroll = 'yes';}
if ((screen.height)  < h){ var h = screen.height - 60; var scroll = 'yes';}
var settings='height='+h+',width='+w+',top='+myTop+',left='+myLeft+', resizable=yes,menu='+menu + ', scrollbars='+scroll
popupWin=window.open(myURL,myWindowName,settings);   
if(parseInt(navigator.appVersion) >= 4){popupWin.focus();}
} 

//var myTop = ((screen.height-h)/2)-20;
// done hiding -->
</SCRIPT>

<link href="../global/css/global.css" rel="stylesheet" type="text/css" />
<link href="css/guide.css" rel="stylesheet" type="text/css" />
</head>
  <body id="GuideBody" onload="load();initialize()" onunload="GUnload()">

  <!---
<body onload="initialize()" onunload="GUnload()"> --->
<!---<body id="GuideBody" onLoad="load()" onUnload="GUnload()">--->
<!--[if IE]>  
<div id="IEroot">  
<![endif]-->
<div class="ContainAll">
        	<cfinclude template="../../global/includes/dsp_photoeye_nav.cfm">
    <div class="DivisionMenu">
   	  <div class="DivisionMenuTop">
		<div class="DivisionMenuLeft" style="width:200px"><div class="FL1" style="width:200px"><a href="/guide/"><img src="/guide/images/logotransGUIDE.gif" style="cursor:pointer;"/></a></div>
       	</div>
        	<div class="DivisionMenuRight">
			<div class="FL2" id="NoBorderLeft"><a href="guide_add_listing.cfm">GET LISTED!</a></div><!---<div class="FL5"><img src="/global/images/menudot.gif" /></div><div class="FL2"><a href="/gallery/photoshowcase/index2.cfm">PHOTOGRAPHER'S SHOWCASE<font style="position: relative; bottom: 5.3px; font-size: 0.8em; ">&reg;</font></a></div><div class="FL5"><img src="/global/images/menudot.gif" /></div><div class="FL2"><a href="/gallery/moregalleries.cfm">MORE GALLERIES</a></div>--->
			
			<div class="FL2c"><div class="FL2cText"><!---<a href="comments.cfm">Comments</a>---> &nbsp;&nbsp;&nbsp; <!---Login---></div><cfinclude template="act_Search.cfm"></div>
       	</div>
   	  </div>
    </div>
	
    <div class="MainArea" id="MainAreaGUIDE">
   	    <div class="MASearch">
   			<div class="BScontain">
				<div class="BSsearch">  
                	<div style="float: left; margin-left: 25px; margin-top: 4px; color:#fafafa; text-transform: uppercase; font-size: 11px; letter-spacing: 1px; display:inline;"><a style="color:#fafafa;" href="/Guide/comments.cfm">comments</a></div>
        	  		<div class="BSsearchTop"><cfinclude template="../Guide_top_code.cfm"><cfinclude template = "../Guide_Chooser_New.cfm"></div><div style="float:right; margin-right:33px; position:relative; top:-15px; display:inline;  color:#fafafa; text-transform: uppercase;  font-size: 11px; letter-spacing: 1px;"><a style="color:#fafafa;" href="/Guide/corrections.cfm">CORRECTIONS</a></div></div></div></div>
<!---  <div style="float:right; margin-right:33px; position:relative; top:-15px; display:inline;  color:#fafafa; text-transform: uppercase;  font-size: 11px; letter-spacing: 1px; display:inline;"> --->

  <div class="Bread_Crumb"><a href="javascript: history.back()"><img src="images/back.jpg" />back</a></div>

      <div class="MALeft" id="MainAreaSEARCH">
      	    <!---<div class="Title"><center><img src="images/logotransGUIDEb.gif" /><br />
USA PHOTOGRAPHY GUIDE<br /></center></div>--->
      
      
       <div class="ArticleObject">--->
		 
		 
<cfinclude template="dsp_Visualserver_head_top.cfm">
<script type="text/javascript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

<cfinclude template="../../global/includes/js_photoeye_logo_hover.cfm">
//-->
</script>
<cfinclude template="dsp_Visualserver_head_bottom.cfm">
<cfinclude template="../../global/includes/dsp_photoeye_nav.cfm">
<cfinclude template="dsp_Visualserver_top.cfm">
  <cfif CGI.PATH_INFO DOES NOT CONTAIN "/index.cfm">
<div class="Bread_Crumb"><a href="javascript: history.back()"><img src="images/back.jpg" />back</a></div>
</cfif>
      <div class="MALeft" id="MainAreaSEARCH">
      	    <!---<div class="Title"><center><img src="images/logotransGUIDEb.gif" /><br />
USA PHOTOGRAPHY GUIDE<br /></center></div>--->
      
      
