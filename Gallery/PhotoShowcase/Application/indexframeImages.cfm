<CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup
  WHERE Custnumber = '#url.Custnumber#' 
</CFQUERY>

<html>
<head>
<title>photo-eye Photographer's Showcase | Administration Pages </title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<base target="mainFrame">
</head>
 
<body bgcolor="#000000" text="#CCCCCC" leftmargin="5" topmargin="10" link="#FFFFCC" vlink="#99FF99" alink="#CC0000">
 <font face="Verdana,Arial,Helvetica,sans-serif" size="2">
  <img src="../SharedImages/photo-eye%20Explore%20NewLogo_photoShowcaseVersionReversed.jpg" width="151" height="94"></font>
<table width="100%" border="0">
  <tr>
   <td colspan="3"><font face="Arial,Helvetica,sans-serif" size="4"><b> 
   <font color="Yellow">Upload Your Images</font></b></font><br><br></td>
  </tr>
  <tr> 
    <td colspan="3"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b><font color="#FFFFFF">Overview
       </font></b></font></td>
  </tr>
  <tr> 
    <td width="17%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">Step</font></td>
    <td width="8%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">1</font></td>
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">-&nbsp;<a href="../Application/Intro.cfm?custnumber=<cfoutput>#URL.Custnumber#</cfoutput>">Introduction</a> 
      </font></td>
  </tr>
  <tr> 
    <td width="17%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="75%">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="3"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b><font color="#FFFFFF">Your 
      Images </font></b></font></td>
  </tr>
  <tr> 
    <td width="17%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">Step</font></td>
    <td width="8%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">2</font></td>
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">-&nbsp;<a href="../Application/UploadImages.cfm?custnumber=<cfoutput>#URL.Custnumber#</cfoutput>">Upload&nbsp;Images</a> 
      </font></td>
  </tr>
  
    <tr> 
    <td width="17%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="75%">&nbsp;</td>
  </tr>

  <tr> 
    <td colspan="3"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b><font color="#FFFFFF">Completion</font></b></font></td>
  </tr>
 
  <tr> 
    <td width="17%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">Step</font></td>
    <td width="8%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">3</font></td>
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">-&nbsp;<a href="mailto:photoshowcase@photoeye.com?subject=Images Are Uploaded">Notify photo-eye</a>
	</font></td>
  </tr>
  <tr> 
    <td width="17%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="75%">&nbsp;</td>
  </tr>

</table>

</body>
</html>
