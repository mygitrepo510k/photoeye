<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<cfparam name="xUnsecure" default=1>
<cfinclude template="/global/includes/act_site_unsecure.cfm">
<cfset ypath="/templates">
<cfparam name="url.view" default="CurrentAuctions">
<cfparam name="XSTILLAVAILABLEHEADERSHOWN" default="0">
<title>photo-eye | Auctions</title>
<link href="images/favicon.ico" rel="shortcut icon"/>
<!---<script src="SpryAssets/SpryEffects.js" type="text/javascript"></script>
<script src="SpryAssets/SpryEffects.js" type="text/javascript"></script>--->
<script type="text/javascript" src="/global/includes/prototype.js"></script>
<script type="text/javascript">
<cfinclude template="../../global/includes/js_photoeye_logo_hover.cfm">
</script>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-15150870-4']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<link href="../global/css/global.css" rel="stylesheet" type="text/css" />
<link href="css/auctions.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/global/js/revealer.js?2262010"></script>
</head>

<body id="AuctionsBody">
<!--[if IE]>  
<div id="IEroot">
<![endif]-->
<div class="ContainAll">
<cfinclude template="../../global/includes/dsp_photoeye_nav.cfm">
<div class="DivisionMenu">
   	  <div class="DivisionMenuTop">
		<div class="DivisionMenuLeft"><div class="FL1"><a href="index.cfm"><img src="Images/logotransAUCTIONS.gif" /></a></div>
       	</div>
        	<div class="DivisionMenuRight"><div class="FL2" id="NoBorderLeft"><a href="index.cfm">LIVE AUCTIONS</a></div><div class="FL5"><img src="../global/images/menudot.gif" /></div><div class="FL2" id="NoBorderLeft"><a href="index.cfm?view=pastauctions">PAST AUCTIONS</a></div><div class="FL5"><img src="../global/images/menudot.gif" /></div><div class="FL2" id="NoBorderLeft"><a href="auctioninfo.cfm">CONSIGN</a></div><div class="FL5"><img src="../global/images/menudot.gif" /></div>
<div class="FL2"><a href="auctionFAQ.cfm">F.A.Q</a></div><!---<div class="FL2b" style="border-left:none;width:100px;position:relative;top:-5px;"><a href="">INQUIRIES</a> <a href="">COMMENTS</a></div>--->
<!---<cfoutput>		Q
<div class="FL5"><img src="../global/images/menudot.gif" /></div>		
<div class="FL2">			
<CFIF IsDefined("Session.AcctID")>
	<CFQUERY NAME="qEmail"  DATASOURCE="photoeyecom">
	  SELECT email, firstname, lastname
	  FROM MailingList_OM 
	  WHERE Custnumber = #Session.AcctID#
	</CFQUERY>
	<CFIF len(trim(qemail.firstname)) + len(trim(qemail.lastname)) gt 0>
	 #qEmail.FirstName# #qEmail.LastName# [<A HREF="#xURLHome#/Templates/Loggingout.cfm" TARGET="main" ID="Loginout">LOG OUT</A>]
	 </CFIF>
<CFELSE>
	<a href="login.cfm?auction=1&nobid=1">LOGIN</a> 	 
</CFIF>				
</div>	
</cfoutput>	--->	
			
			<!---<div class="FL2"><a href="login.cfm?auction=1&nobid=1">LOGIN</a></div>---><!---<div class="FL2b"><a href="">ADVERTISE</a></div><div class="FL2b" style="border-left:none;"><a href="">MASTHEAD</a></div>--->
       	</div>
    </div>
</div>

<cfinclude template="dsp_Auctions_search.cfm">

