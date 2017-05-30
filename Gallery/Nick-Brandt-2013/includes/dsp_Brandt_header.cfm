<cfoutput>



<cfparam name = "xPageTitle" default="photo-eye Gallery | Nick Brandt - 2013 Release">

<!--- Which are this necessary? --->
<cfparam name = "xloading" default=0>
<cfparam name = "xportfolios" default=0>
<cfparam name = "xtreepath" default="">
<cfparam name = "url.download376" default=false>
<cfparam name = "IncludesLightbox" default=false>


<CFIF IsDefined("Session.AcctID")> 
	<CFQUERY NAME="qSuperAdmin"  DATASOURCE="photoeyecom"> 
	  SELECT email, firstname, lastname,  indexsuperadmin
	  FROM MailingList_OM  
	  WHERE Custnumber = #Session.AcctID# 
	</CFQUERY> 
	<CFIF Len(trim(qSuperAdmin.indexsuperadmin)) gt 0> 
		<cfset xSuperAdmin = 1>
		<cfset xCitationLink = "dsp_admin_citation.cfm">
	</cfif>  
</CFIF>	

<html xmlns="http://wwwxCitationLink.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>#xPageTitle#</title>

<!--- Do not index this page --->
<meta name="robots" content="noindex,nofollow"> 

<!--- Load the CSS first thing, to avoid any flicker of unstyled content --->
<link rel="stylesheet" type="text/css" href="includes/bistro.css" />

<!--- Load jquery --->
<script type="text/javascript" src="includes/jquery.1.4.4.min.js"></script>

<!--- Load Javascript --->
<script type="text/javascript" src="includes/t9.min.js"></script> 


<!--- Not sure what this ---->
<script type="text/javascript">
	jQuery.noConflict();
	j$ = jQuery;
</script>


<!--- Disable right click  --->
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


<!--- for the jump tos on moregenres, moreprocesses, etc. --->
<script language="JavaScript">
	function jumpPage(newLoc) {
	newPage = newLoc.options[newLoc.selectedIndex].value

	if (newPage != "") {
		window.location.href = newPage
	}
}

<!--- Fade in, Fade out --->
$(document).ready(function() {
    $('##gallery li').hover(
        function(){$('span',this).fadeIn('slow');},
        function(){$('span',this).fadeOut('slow');
    });
});


</SCRIPT>
 
	
<!--- Load Mobile Swipe --->
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

    
<!--- Load IE hacks --->
<!--- RR this is a wrong path --->
<!--[if IE]>
  <link href="/#application.ipi_beta#/ipi_ie.css" media="screen, projection" rel="stylesheet" type="text/css" />
<![endif]--> 

<!--- Load favicon --->
<cfset fav_link = 'http://www.photoeye.com/favicon.ico' />
<link rel="SHORTCUT ICON" href="#fav_link#" type="image/x-icon">

 

</head>
 

</cfoutput>