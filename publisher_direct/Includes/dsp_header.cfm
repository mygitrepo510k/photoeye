<cfoutput>
	 
	<!--- Set SuperAdmin status based on login --->
	<cfset xSuperAdmin = 0>
	
	<cfinclude template="/global/includes/act_site_unsecure.cfm">
	
	<cfparam name="xPageTitle" default="#application.title#">
	
	<html xmlns="http://wwwxCitationLink.w3.org/1999/xhtml">
	
	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		
		<title>#xPageTitle#</title>
		<!--- <meta name="robots" content="noindex,nofollow"> --->
		
		<!--- Load the CSS first thing, to avoid any flicker of unstyled content --->
		<!--- <link rel="stylesheet" type="text/css" href="/#application.ipi_root#/css/global.css" /> --->
		<link rel="stylesheet" type="text/css" href="/#application.root#/css/ipi.css" />
		<link rel="stylesheet" type="text/css" href="/#application.root#/css/pd.css" />
		
		<!--- !todo: move jquery to a bookstore folder --->
		<script src="/#application.root#/js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript">
			jQuery.noConflict();
		</script>	
		
		<!--- for booktease popup --->
		<SCRIPT language="JavaScript">
<!-- hide from JavaScript-challenged browsers
var popupWin = null;
function popUp(myURL,myWindowName,w,h,scroll,menu){
var myLeft = ((screen.width-w)/2)-5; 
var myTop =  ((screen.height-h)/2)-40;
if ((screen.width)  < w){ var w = screen.width - 20; var scroll = 'yes';}
if ((screen.height)  < h){ var h = screen.height - 60; var scroll = 'yes';}
var settings='height='+h+',width='+w+',top='+myTop+',left='+myLeft+', resizable=no,menu='+menu + ', scrollbars='+scroll
popupWin=window.open(myURL,myWindowName,settings);   
if(parseInt(navigator.appVersion) >= 4){popupWin.focus();}
} 

//var myTop = ((screen.height-h)/2)-20;
// done hiding -->
</SCRIPT>
<!--- 		<script type="text/javascript" src="/#application.root#/js/revealer.js?2262010"></script>  --->
		
		
		<!--[if IE]>
		  <link href="/#application.root#/css/ipi_ie.css" media="screen, projection" rel="stylesheet" type="text/css" />
		<![endif]--> 
		
		<link rel="SHORTCUT ICON" href="#request.protocol#://www.photoeye.com/favicon.ico" type="image/x-icon">
		
	</head>
	
	<body bgcolor="##f7f8f9" marginheight="0" topmargin="0" vspace="0"
	marginwidth="0" leftmargin="0" hspace="0" style="margin:0; padding:0; background-image: url(/#application.root#/images/background_brown_gradient.png); background-repeat: repeat-x;" >
	
		<div id='ipi_page_container'>
			<cfinclude template="dsp_header_navigation.cfm">
			<div id='header_container' style="padding-bottom:0px;">
		      	<div id='header_left'> 
				    <a href="/#application.root#/">
			          <div id='header_logo'></div> 
			        </a>
			    </div>
			    <cfset xPresentstext = '/#application.root#/images/photoeye_pd_coral.png'>        
			 	<div id='header_right' class='Header_Links' style="background:url('#xPresentsText#') no-repeat scroll left top transparent; padding-right:10px;margin-top:9px; height:150px;">
			 	</div>     	
			</div>

</cfoutput>