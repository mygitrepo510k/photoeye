<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
	
	<script language="JavaScript">
<!-- hide from JavaScript-challenged browsers



function platformbrowserSniffer() {

    var BrowName = navigator.appName;
    var BrowVer = parseInt(navigator.appVersion);
	var browLoc = ""
	var DestAddr = "detect_browser_status_direct.htm"
   	var agt=navigator.userAgent.toLowerCase();
  	var is_major = parseInt(navigator.appVersion);
    var is_minor = parseFloat(navigator.appVersion);
    var is_nav  = ((agt.indexOf('mozilla')!=-1) && (agt.indexOf('spoofer')==-1)
                && (agt.indexOf('compatible') == -1) && (agt.indexOf('opera')==-1)
                && (agt.indexOf('webtv')==-1));
				
	var is_mac    = (agt.indexOf("mac")!=-1); 
	var is_os2   = ((agt.indexOf("os/2")!=-1) || 
                    (navigator.appVersion.indexOf("OS/2")!=-1) ||   
                    (agt.indexOf("ibm-webexplorer")!=-1));
	var is_linux = (agt.indexOf("inux")!=-1);
	var is_win   = ( (agt.indexOf("win")!=-1) || (agt.indexOf("16bit")!=-1) );
    var is_win95 = ((agt.indexOf("win95")!=-1) || (agt.indexOf("windows 95")!=-1));
    var is_win16 = ((agt.indexOf("win16")!=-1) || 
                   (agt.indexOf("16bit")!=-1) || (agt.indexOf("windows 3.1")!=-1) || 
               (agt.indexOf("windows 16-bit")!=-1) );  
    var is_win31 = ((agt.indexOf("windows 3.1")!=-1) || (agt.indexOf("win16")!=-1) ||
                    (agt.indexOf("windows 16-bit")!=-1));
    var is_win98 = ((agt.indexOf("win98")!=-1) || (agt.indexOf("windows 98")!=-1));
    var is_winnt = ((agt.indexOf("winnt")!=-1) || (agt.indexOf("windows nt")!=-1));
    var is_win32 = (is_win95 || is_winnt || is_win98 || 
                    ((is_major >= 4) && (navigator.platform == "Win32")) ||
                    (agt.indexOf("win32")!=-1) || (agt.indexOf("32bit")!=-1));
					
					
					
	if (BrowName == "Microsoft Internet Explorer" && BrowVer == 5 && is_mac) { // Macintosh
	location.href = uploadimagesie.cfm?id=<cfoutput>url.id</cfoutput>;	}			
	else location.href	= uploadimages.cfm?id=<cfoutput>url.id</cfoutput>;	 }
   }
    // End hiding script from old browsers -->
</script>
	
	
</head>

<body <BODY onLoad="platformbrowserSniffer();">



</body>
</html>
