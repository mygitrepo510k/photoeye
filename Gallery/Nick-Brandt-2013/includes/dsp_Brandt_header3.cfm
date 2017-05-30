<cfsilent>

<!--- Not sure what this does --->
<cfif StructKeyExists(URL,'AJAXreq')>
	<cfset headerContent = " " />
<cfelse>
	
<!--- Not sure why this is here --->
<cfsavecontent variable="headerContent">


<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	
<head>
	
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--- Make this dynamic --->
<META name="Description" content="photo-eye Gallery | Nick Brandt">
<META name="Keywords" content="photo-eye Gallery, Nick Brandt, tusks">

<!--- RR added August 25, 2013 --->
<!-- Mobile viewport optimized: h5bp.com/viewport -->
<meta name="viewport" content="width=device-width">


<!--- RR added --->
<script type="text/javascript" src="enlarge.js?v=1.9"></script>	
	
	

<script language="javascript">
document.onmousedown=disableclick;
status="&copy; Nick Brandt. All Rights Reserved.";
Function disableclick(event)
{
  if(event.button==2)
   {
     alert(status);
     return false;    
   }
}
</script>

	<script type="text/javascript">
	
	var message="Copyright Nick Brandt. All Rights Reserved.";
	
	function clickIE(){
		if (event.button==2){
			alert(message);
			return false;
		}
	}
	function clickNS(e){
		if (document.layers||document.getElementById&&!document.all){
			if (e.which==2||e.which==3){
				alert(message);
				return false;
			}
		}
	}
	if (document.layers){
		document.captureEvents(Event.MOUSEDOWN);
		document.onmousedown=clickNS;
	}
	else if (document.all&&!document.getElementById){
		document.onmousedown=clickIE;
	}
	document.oncontextmenu=new Function("alert(message);return false")
	</script> 

<!--- <!-- Google Analytics -->

<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
var pageTracker = _gat._getTracker("UA-41899300-1");
pageTracker._initData();
pageTracker._trackPageview();
</script> --->


<!--- Start data controllers / global includes / development tools --->	

	
<!--- pathing variables --->
	<!--- <cfset request.templatelocal = "templates/10"> --->
	
	<!--- template specific --->
	<!--- <cfinclude template="includes/act_define_functions.cfm"> --->

	<!--- global --->
	<!--- <cfinclude template="../../Includes/act_GetDefaultWebsiteTitle.cfm"> --->
	
	<!--- <cfinclude template="../../Includes/dsp_MetaTags.cfm"> --->

	<!--- <cfif qWebsite.DisableRightClick> --->
		<!--- <cfinclude template="../../Includes/js_DisableRightClick.cfm"> --->
	<!--- </cfif> --->

	<!--- <cfif len(trim(qWebsite.GoogleAnalytics))>			 --->
		<!--- <cfinclude template="../../Includes/dsp_GoogleAnalytics.cfm"> --->
	<!--- </cfif> --->

<!--- End controllers / global includes / dev tools --->

		<cfoutput>
			<cfset variables.webSiteTitle = 'photo-eye Gallery | Nick Brandt - 2013 Release'>
			<title>#variables.webSiteTitle#</title> 
		</cfoutput>	
					<!---	<cfif qWebsite.FavIcon>
			<cfoutput><link rel="shortcut icon" type="image/ico" href="/UserImages/#qUser.Container#/#qWebsite.CustNumber#/favicon.ico" /></cfoutput>
			</cfif> --->
<!---
			<cfif StructKeyExists(URL,'testMin')>
--->

				<!--- New minified javascript file which combines all below files DE 2011-09-16 --->
				<script type="text/javascript" src="includes/t9.min.js"></script> 

<!---
			<cfelse>
				<script type="text/javascript" 
					src="#request.templatelocal#/includes/prototype_edge.js?200902052">
				</script>			
				<script type="text/javascript" 
				   src="#request.templatelocal#/includes/scriptaculous.js?load=effects,slider&200902051">
				</script>
				<script type="text/javascript" 
					src="#request.templatelocal#/includes/functions.js?200902051">
				</script>
				<script type="text/javascript" 
					src="#request.templatelocal#/includes/thumbDrawer_05.js?2011032401">
				</script>			
			</cfif>
--->

			<cfif CGI.USER_AGENT CONTAINS "mobile">
				<script type="text/javascript"
					src="includes/jquery.1.4.4.min.js">
				</script>
				<script type="text/javascript"
					src="includes/jquery.jswipe-0.1.2.js?v=0.1">
				</script>
				<script type="text/javascript">
					jQuery.noConflict();
					j$ = jQuery;
				</script>
			</cfif> 
			
			<link href="includes/vst8.css?v=1.1" type="text/css" rel="stylesheet" />
	<style>	


	body { font-size: 10pt; font-family: Arial, Helvetica, sans-serif }
	table { font-size: 10pt; font-family: Arial, Helvetica, sans-serif }
	a:link { text-decoration: none }
	a:visited { text-decoration: none }
	a:hover { text-decoration: underline }
	.title { 
		font-family: Arial; 
		color: #999; 
		font-size: 14pt; 
		
		font-weight:normal;
		
		letter-spacing: 1px; 
				
	}

	.title_small { 
		font-family: Arial; 
		color: #FFFFFF; 
		font-size: 16px; 
		
		font-weight:bold;
		
		letter-spacing: 2px; 
					
	}	
	.subtitle { 
		font-family: Arial; 
		color: #FFFFFF; 
		font-size: 10pt; 
						
	}
	.subtitle_small { 
		font-family: Arial; 
		color: #FFFFFF; 
		font-size: 10px; 
						
	}	
	.categoryLink { 
		font-family: Lucida Grande; 
		color: #FFFFFF; 
		font-size: 8pt; 
						
	}
	
	.grid-text {
		font-family:Arial;
		color:#bbb;
		font-size:8pt;
		font-weight:normal;	
	}
	
	.grid-icon {
		font-family:Arial;
		color:#ccc;
		font-size:12pt;
		font-weight:normal;	
		padding-right: 10px;
	}
	
	.grid-icon a:hover {
		color:#000;
	}

	.grid-icon-spacer {
		padding-right:100px;
	}
	
	
	.categoryLink_small { 
		font-family: Lucida Grande; 
		color: #FFFFFF; 
		font-size: 10px; 
						
	}	
	.portfolioLink { 
		font-family: Lucida Grande; 
		color: #FFFFFF; 
		font-size: 8pt; 
						
	}
	.portfolioLink_small { 
		font-family: Lucida Grande; 
		color: #FFFFFF; 
		font-size: 10px; 
						
	}		
	.textPageLink { 
		font-family: Lucida Grande; 
		color: #FFFFFF; 
		font-size: 8pt; 
						
	}
	.textPageLink_small { 
		font-family: Lucida Grande; 
		color: #FFFFFF; 
		font-size: 10px; 
						
	}		
	.imgCaption { 
		font-family: Lucida Grande; 
		color: #999; 
		font-size: 10pt; 
		margin-top: 0px;
	 <!-- float:left; -->
		
		
	}	
	.imgCaption_small { 
		font-family: Lucida Grande; 
		color: #FFFFFF; 
		font-size: 12px; 
		
	}	
	.contactPage { 
		font-family: Lucida Grande; 
		color: #FFFFFF; 
		font-size: 10pt; 
	}	
	.linkDivider { 
		font-family: Arial; 
		color: #FFFFFF; 
		font-size: 10pt; 
		
	}		
	.navLink { 
		font-family: Arial; 
		color: #FFFFFF; 
		font-size: 9pt; 
		
	}			
	.horizDivider { color: #FFFFFF; 
	}			
	.copyright { 
		font-family: Arial; 
		color: #FFFFFF; 
		font-size: 10px; 
						
	}	
	.previewMode {
		font-family:Arial;
		color:red;
		font-size:12pt;
		font-weight:bold	
	}
	

			
	a:hover {text-decoration: none;}
	.mainPage #menu a:hover {text-decoration: none;}
	.mainPage #menu a:hover span {text-decoration: underline;}
	#menu ul {background: white;}
	#menu ul ul a:hover {
		font-weight: bold;
	}
	#menu ul ul li {border-top: 1px solid #FFFFFF;
		padding: 5px 0; 
	}
	#menu ul ul ul li {
		border-top: none;
		border-bottom: 1px solid #FFFFFF;
		padding: 5px 0;
	}
	
	#controls {
		background: white;
	}
	
</style>
		
		

		
		

		<!--[if IE 7]>
		<style type="text/css" media="screen">
			#extraMenuContainer {
				display: table;
				float: right;
				text-align: right;
			}
			#menu ul {	
				float: left;
			}
			#menu ul li {float: left; width: 100%; overflow:visible;}
			
			#menu ul ul {
				margin-left: -100%;
				margin-top: 25px;
				overflow: visible;
				width: 100%;
			}
			#menu ul ul ul {
				position: relative;
				width: 100%;
				left: 50px;
			}
			#menu ul ul li {
				width: 100%:
				overflow: visible;
			}
			#menu, #menu ul, #menu li {
			 	zoom: 1;
			 	display: inline;
			 }
			div#menu ul ul,
			div#menu ul li:hover ul ul,
			div#menu ul ul li:hover ul ul
			{display: block;}
			
			div#menu ul li:hover ul,
			div#menu ul ul li:hover ul,
			div#menu ul ul ul li:hover ul
			{display: block;}

		</style>
		<![endif]-->
		
		<!--[if IE 8]>
		<style type="text/css" media="screen">
				#menuContainerContainer, #menuContainer, #extraMenuContainer, #menu {
					overflow: visible;
					zoom: 1;
				}
				#menu {
				 	zoom: 1;
				 	display: inline;
				 }
				#menu ul ul, #menu ul li {
					overflow: visible;
				}
				div#menu ul ul,
				div#menu ul li:hover ul ul,
				div#menu ul ul li:hover ul ul { 
					display: block; 
				}
		</style>
		<![endif]-->
		
		<!--[if lt IE 7]>
		<style type="text/css" media="screen">
			body {
			behavior: url(ie_menus.htc);
			font-size: 100%;
			}
			
			#menu ul li a {height: 1%;} 
			
			#menu a, #menu h2 {
			font: bold 0.7em/1.4em arial, helvetica, sans-serif;
			}
		</style>
		<![endif]-->



	</head>
	<body>
		<div id="containAll">




<script language="JavaScript">
var popupWin = null;
function popUp(myURL,myWindowName,w,h,scroll,menu){
	var myHeight = ((screen.availHeight))-50;
	var myWidth = ((screen.availWidth))-10;
	var myLeft = 0; 
	var myTop = 0;
	var settings='height='+myHeight+',width='+myWidth+',top='+myTop+',left='+myLeft+',scrollbars=yes,resizable=yes,menu='+menu 
	popupWin=window.open(myURL,myWindowName,settings);   
	if(parseInt(navigator.appVersion) >= 4)
		popupWin.focus();
}
</script>


</cfsavecontent>
</cfif>
</cfsilent><cfoutput>#headerContent# </cfoutput>
