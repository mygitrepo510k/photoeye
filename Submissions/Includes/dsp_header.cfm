<cfoutput>

 
<!--- Set SuperAdmin status based on login --->
<cfset xSuperAdmin = 0>

<cfinclude template="/global/includes/act_site_unsecure.cfm">

 

<cfparam name = "xPageTitle" default="#application.title#">
 

<html xmlns="http://wwwxCitationLink.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>#xPageTitle#</title>
<!--- <meta name="robots" content="noindex,nofollow"> --->

<!--- Load the CSS first thing, to avoid any flicker of unstyled content --->
<!--- <link rel="stylesheet" type="text/css" href="/#application.ipi_root#/css/global.css" /> --->
<link rel="stylesheet" type="text/css" href="/#application.root#/css/ipi.css" />


<script type="text/javascript" src="/#application.root#/js/revealer.js?2262010"></script> 


<!--[if IE]>
  <link href="/#application.root#/ipi_ie.css" media="screen, projection" rel="stylesheet" type="text/css" />
<![endif]--> 

<link rel="SHORTCUT ICON" href="#request.protocol#://www.photoeye.com/favicon.ico" type="image/x-icon">

<!--- <script type="text/javascript">

var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-15150870-1");
pageTracker._setDomainName("none");
pageTracker._setAllowLinker(true);
pageTracker._trackPageview();
} catch(err) {}

</script> --->

 

</head>


<!--- background_blue_gradient.gif --->
<body bgcolor="##f7f8f9" marginheight="0" topmargin="0" vspace="0"
marginwidth="0" leftmargin="0" hspace="0" style="margin:0; padding:0; background-image: url(/#application.root#/images/background_gray_gradient.png);
	background-repeat: repeat-x;" > <!--- onload='<cfif xloading EQ 1>LoadingFunc();</cfif><cfif xportfolios EQ 1>sizeImgContainers();</cfif>' --->
	</cfoutput>
<!---	<script type="text/javascript">	
		if(jQuery('head').length > 0 && !jQuery.cookie('ipiSplash')){
			jQuery('head').append('<style>#ipi_page_container, #footer_container { display: none; }</style>');
			jQuery('body').data('bg',jQuery('body').css('background-image')).css('background-image','none');
		}
	</script> --->

	<cfoutput> 
	<div id='ipi_page_container'>
		<cfinclude template="dsp_header_navigation.cfm">
				  
		  <div id='header_container' style="padding-bottom:0px;">
	  	 

	      	<div id='header_left'> 
			    <a href="/#application.root#/">
		          <div id='header_logo'></div> 
		        </a>
		    </div> <!--- header_left --->
		        <div id='header_right' class='Header_Links' style="padding-right:10px; padding-bottom:30px; margin-top:10px;"> 
		         <cfset xPresentstext = '/#application.root#/images/submissions.png'>
				<div id='ipi_header_presents' style="background:url('#xPresentsText#') no-repeat scroll left top transparent; padding-right:10px;margin-top:0px; height:12x`0px;"></div>
	</cfoutput>