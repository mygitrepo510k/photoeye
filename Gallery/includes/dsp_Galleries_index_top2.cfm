<cfparam name="xUnsecure" default=1>
<cfinclude template="/global/includes/act_site_unsecure.cfm">
<cfset rssfaq = 2>
<cfparam name = "xloading" default=0>
<cfparam name = "xportfolios" default=0>
<cfparam name = "xtreepath" default="">
<cfparam name = "xPageTitle" default="photo-eye | Gallery">
<cfparam name = "url.download376" default=false>

<cfoutput>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="apple-touch-icon" href="http://www.photoeye.com/apple-touch-icon.png" />


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>#xPageTitle#</title>

<!--- JavaScript Error Suppression --->
<CFINCLUDE TEMPLATE="/templates/JavaScriptShowNoErrors.cfm">
<CFINCLUDE TEMPLATE="/templates/JS_Popup.cfm">
<CFINCLUDE TEMPLATE="/templates/JS_jumpmenu.cfm">
	
	<script type="text/javascript" src="/global/includes/prototype.js"></script>
	<script type="text/javascript" src="/global/js/scriptaculous.js"></script>
	<script type="text/javascript" src="/global/js/builder.js"></script>
	<script type="text/javascript" src="/global/js/effects.js"></script>
	<cfparam name="xIncludeLightbox" default="yes">

<!---

	<cfif xIncludeLightbox IS "yes">
	
		<cfif StructKeyExists(URL,'detest')>
			<script type="text/javascript" src="/global/js/lightbox_pe02.js?v=0.1"></script>
		<cfelse>
		
			<cfif url.download376 IS true>
				<script type="text/javascript" src="/global/js/lightbox_pe01_img_getter.js"></script>
			<cfelse>	
				<cfif CGI.HTTP_USER_AGENT CONTAINS "IE">
					<script type="text/javascript" src="/global/js/lightboxIE.js?v=0.2"></script>
				<cfelse>
					<script type="text/javascript" src="/global/js/lightbox_pe02.js?v=0.1"></script>
				</cfif>
			</cfif>
		</cfif>
	</cfif>

--->

<!--- 

	**** DE: May 16th 2011 **** 
	Commented out code above, it has exceptions for IE which we don't want to use.  
	We updated our Lightbox to include better IE support, much simpler now (see below.)
	
	Updated ?v=0.1 to ?v=0.2 to trigger recaching.

--->


	<cfif xIncludeLightbox IS "yes">	
		<cfif url.download376 IS true>
			<script type="text/javascript" src="/global/js/lightbox_pe01_img_getter.js"></script>
		<cfelse>	
			<script type="text/javascript" src="/global/js/lightbox_pe02.js?v=0.2"></script>
		</cfif>
	</cfif>


<script type="text/javascript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
<cfinclude template="/global/includes/js_photoeye_logo_hover.cfm">
//-->
</script>
<link href="/gallery/images/favicon.ico" rel="shortcut icon"/>
<link href="/global/css/global.css?r=123" rel="stylesheet" type="text/css" />
<link href="/gallery/css/galleries_pe01_new.css?r=932013" rel="stylesheet" type="text/css" />
</head>
<!---

<body onload='<cfif xloading EQ 1>LoadingFunc();</cfif><cfif xportfolios EQ 1>sizeImgContainers();</cfif>initLightbox();' id='GalleryBody'>

--->

<body onload='<cfif xloading EQ 1>LoadingFunc();</cfif><cfif xportfolios EQ 1>sizeImgContainers();</cfif>' id='GalleryBody'>

<!--[if IE]>  
<div id="IEroot">  
<![endif]-->

<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-15150870-2']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>


<div class="ContainAll">

<cfinclude template="/global/includes/dsp_photoeye_nav.cfm">

<div class="DivisionMenu">
   	  <div class="DivisionMenuTop">
		<div class="DivisionMenuLeft"><div class="FL1"><a href="/gallery/index.cfm"><img src="/gallery/images/logotransGALLERY.gif" /></a></div>
       	</div>
        	<div class="DivisionMenuRight">
            
            <div class="FL2" id="NoBorderLeft"><a href="/gallery/representedartists/index.cfm">ARTISTS</a></div><div class="FL5"><img src="/global/images/menudot.gif" /></div><div class="FL2"><a href="/gallery/photoshowcase/index.cfm">PHOTOGRAPHER'S SHOWCASE<font style="position: relative; bottom: 5.3px; font-size: 0.8em; ">&reg;</font></a></div><div class="FL5"><img src="/global/images/menudot.gif" /></div><div class="FL2"><a href="/gallery/moregalleries.cfm">MORE GALLERIES</a></div>
            
       	</div>
   	  </div>
    </div>
 


<div class="MainArea">
<form action="#xtreepath#../templates/mSearchShowcasePowerSearch.cfm?Gallery=0" method="get">
<div class="MASearch">
			<div class="BScontain"><div class="BSsearch">
						  <div style="float: left; margin-left: 25px; margin-top: 3px; color: ##fafafa; text-transform: uppercase; font-size: 11px; letter-spacing: 1px;display:inline;"><a style="color:##fafafa;" href="/Gallery/Inquiries.cfm">inquiries</a><span style="margin-left:5px;margin-right:5px;"><img src="/global/images/rssdot.gif" width="11"/></span><a style="color:##fafafa;" href="/Gallery/Comments.cfm">comments</a><span style="margin-left:5px;margin-right:5px;"><img src="/global/images/rssdot.gif" width="11"/></span><a style="color:##fafafa;" href="/gallery/submissions.cfm">submissions</a><span style="margin-left:5px;margin-right:5px;"><img src="/global/images/rssdot.gif" width="11"/></span><a style="color:##fafafa;" href="/emailnewsletter/">newsletter</a></div>
        	  <div class="BSsearchTop" style="float:right;"><!---div class="BSsearchInput">--->
			  

			 
	  <input name="keyword" type="text" class="input_text" id="BSInput"  onFocus="if(this.value=='Search by Keyword(s)')this.value='';" value="Search by Keyword(s)" size="40" MAXLENGTH="150" style="<cfif CGI.HTTP_USER_AGENT CONTAINS "Safari"> margin-top:0px;</cfif>float:left;padding-left:5px;font-family:inherit;letter-spacing:.25px;">
	 <input type="image" style="border:none;font-family:'Trebuchet MS', Arial, Helvetica, sans-serif;font-size:10px;float:left;margin:0 10px 0 3px;" value="Search" src="/global/images/submit.gif"/>
	 </form>		  	  
			   </div>
			   <div style="float:right; margin-right:15px;position:relative;display:inline;">
	<form action="#xtreepath#../templates/mSearchShowcasePowerSearch.cfm?Gallery=0" method="post">
			  <cfset xShowDropdowns = 1><cfinclude template="dsp_Galleries_Menu_dropdownbox.cfm">  
			  <!---</div>--->
				<!---<div class="BSsearchSelect"><!--<select name="SearchField"  style="FONT-FAMILY: Arial, Helvetica, sans-serif;FONT-SIZE: 10px">
                <option value="Abstract">Keyword</option>

               <option value="Title">Title</option>
				  
                <option value="Authors">Author</option>
 
                <option value="Publisher">Publisher</option>
							
				<option value="Abstract">ISBN##</option>
				 

				</select>--></div>
                <div class="BSsearchSelect"><!--<select name="SearchField"  style="FONT-FAMILY: Arial, Helvetica, sans-serif;FONT-SIZE: 10px">
                <option value="PEdatabase">In photo-eye's database</option>
                
				<option value="AZdatabase">In Amazon's database</option>
				

				</select>--></div>--->
              <!---  <div class="BSsearchButton"><input name="btnSearch" type="image" style="font-family:'Trebuchet MS', Arial, Helvetica, sans-serif;font-size:10px" value="Search" src="#xtreepath#../global/images/Rarrow.gif" style="border:none;"/></div>---></div>
			</div></div></div>
	</form>
	<cfif xloading EQ 1>
		<cfinclude template="/gallery/includes/dsp_Galleries_Loading_Screen.cfm">
	</cfif>
  <cfif CGI.PATH_INFO DOES NOT CONTAIN "/index.cfm" or  CGI.PATH_INFO  CONTAINS "representedartists/index.cfm"  or  CGI.PATH_INFO  CONTAINS "photoshowcase/index.cfm">
  <div class="Bread_Crumb" id="BreadCrumb" <cfif xloading EQ 1>style="display:none;"</cfif>><a href="javascript: history.back()"><img src="/gallery/images/back.jpg" />back</a></div>
  </cfif>
  <!---<div class="MAleft">--->

<div class="MALeft" id="MainScreen" <cfif xloading EQ 1>style="display:none" <cfelse> style="text-align:center;"</cfif>>

</cfoutput>

