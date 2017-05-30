<cfoutput>

<CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
  		SELECT *
  		FROM GallerySetup
 		WHERE Custnumber = #url.id#
	</CFQUERY>
</cfoutput>


<html>
<head>
<title>photo-eye Photographer's Showcase | Application Form </title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<base target="mainFrame">
</head>
 
<body bgcolor="#000000" text="#CCCCCC" leftmargin="5" topmargin="10" link="#FFFFCC" vlink="#99FF99" alink="#CC0000">
 <font face="Verdana,Arial,Helvetica,sans-serif" size="2">
  <img src="../SharedImages/photo-eye%20Explore%20NewLogo_photoShowcaseVersionReversed.jpg" width="151" height="94"></font>
<table width="100%" border="0">
  <tr> 
    <td colspan="3"><font face="Arial,Helvetica,sans-serif" size="4"  color="yellow"><b> <font color="#CCCCCC">Online 
      Application</font></b></font><br>
    </td>
  </tr>
  <tr> 
    <td colspan="3"><font face="Verdana,Arial,Helvetica,sans-serif" size="2" color="#FFFFFF"><a href = "Overview2.cfm?id=<cfoutput>#url.id#</cfoutput>">Overview</a></font></td>
  </tr>
  <tr> 
    <td width="36">&nbsp;</td>
    <td width="12">&nbsp;</td>
    <td width="947">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="3"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b><font color="#FFFFFF">Application 
      </font></b></font></td>
  </tr>
<!---  <cfif #url.step# is 1>
  <tr> 
    <td width="36"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">Step</font></td>
    <td width="12"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">1</font></td>
    <td width="947"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">-&nbsp;<a href="../../../templates/ApplicationOptions.cfm?PSApply=1">Apply&nbsp;Online</a>
<!--- <a href="../../../templates/AddtoCartPSApply.cfm?PSApply=1">Apply&nbsp;Online</a> ---> <!--- ShowcaseDoor=1 --->
      </font></td>
  </tr>
  <tr> 
    <td width="36">&nbsp;</td>
    <td width="12">&nbsp;</td>
    <td width="947">&nbsp;</td>
  </tr>
    <tr> 
    <td colspan="3"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b><font color="#FFFFFF">Artist R&eacute;sum&eacute; 
      </font></b></font></td>
  </tr>
    <tr> 
    <td width="36"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">Step</font></td>
    <td width="12"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">2</font></td>
    <td width="947"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">-&nbsp;Optional&nbsp;Bio 
      </font></td>
  </tr>
   <tr> 
    <td width="36">&nbsp;</td>
    <td width="12">&nbsp;</td>
    <td width="947">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="3"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b><font color="#FFFFFF">Artist Statement 
      </font></b></font></td>
  </tr>
  <tr> 
    <td width="36"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">Step</font></td>
    <td width="12"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">3</font></td>
    <td width="947"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">-&nbsp;Optional&nbsp;Statement
      </font></td>
  </tr>
  <tr> 
    <td width="36">&nbsp;</td>
    <td width="12">&nbsp;</td>
    <td width="947">&nbsp;</td>
  </tr>
    <tr> 
    <td colspan="3"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b><font color="#FFFFFF">Process&nbsp;Statement
      </font></b></font></td>
  </tr>
  <tr> 
    <td width="36"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">Step</font></td>
    <td width="12"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">4</font></td>
    <td width="947"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">-&nbsp;Optional&nbsp;Statement
      </font></td>
  </tr>
  <tr> 
    <td width="36">&nbsp;</td>
    <td width="12">&nbsp;</td>
    <td width="947">&nbsp;</td>
  </tr>
      <tr> 
    <td colspan="3"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b><font color="#FFFFFF">Title&nbsp;List
      </font></b></font></td>
  </tr>
    <tr> 
    <td width="36"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">Step</font></td>
    <td width="12"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">5</font></td>
    <td width="947"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">-&nbsp;Optional&nbsp;Title  List
      </font></td>
  </tr>
  <tr> 
    <td width="36">&nbsp;</td>
    <td width="12">&nbsp;</td>
    <td width="947">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="3"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b><font color="#FFFFFF">Your 
      Images </font></b></font></td>
  </tr>
  <tr> 
    <td width="36"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">Step</font></td>
    <td width="12"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">6</font></td>
    <td width="947"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">-&nbsp;Upload&nbsp;Images 
      </font></td>
  </tr>
  <tr> 
    <td width="36">&nbsp;</td>
    <td width="12">&nbsp;</td>
    <td width="947">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="3"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b><font color="#FFFFFF">Completion</font></b></font></td>
  </tr>
  <tr> 
    <td width="36"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">Step</font></td>
    <td width="12"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">7</font></td>
    <td width="947"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">-&nbsp;Notify 
      photo-eye </font></td>
  </tr>
  <tr> 
    <td width="36">&nbsp;</td>
    <td width="12">&nbsp;</td>
    <td width="947">&nbsp;</td>
  </tr>

 <cfelse> --->
   <tr> 
    <td width="36"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">Step</font></td>
    <td width="12"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">1</font></td>
    <td width="947"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">-&nbsp;Application Fee is Paid
      </font></td>
  </tr>
  <tr> 
    <td width="36">&nbsp;</td>
    <td width="12">&nbsp;</td>
    <td width="947">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="3"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b><font color="#FFFFFF">Artist R&eacute;sum&eacute; 
      </font></b></font></td>
  </tr>
  <tr> 
    <td width="36"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">Step</font></td>
    <td width="12"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">2</font></td>
    <td width="947"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">-&nbsp;<a href="Bio.cfm?id=<cfoutput>#URL.ID#</cfoutput>">Bio</a> 
      </font></td>
  </tr>
   <tr> 
    <td width="36">&nbsp;</td>
    <td width="12">&nbsp;</td>
    <td width="947">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="3"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b><font color="#FFFFFF">Artist Statement 
      </font></b></font></td>
  </tr>
  <tr> 
    <td width="36"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">Step</font></td>
    <td width="12"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">3</font></td>
    <td width="947"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">-&nbsp;<a href="Statement.cfm?id=<cfoutput>#URL.ID#</cfoutput>">Statement</a> 
      </font></td>
  </tr>
  <tr> 
    <td width="36">&nbsp;</td>
    <td width="12">&nbsp;</td>
    <td width="947">&nbsp;</td>
  </tr>
    <tr> 
    <td colspan="3"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b><font color="#FFFFFF">Process&nbsp;Statement
      </font></b></font></td>
  </tr>
  <tr> 
    <td width="36"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">Step</font></td>
    <td width="12"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">4</font></td>
    <td width="947"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">-&nbsp;<a href="Statement_P.cfm?id=<cfoutput>#URL.ID#</cfoutput>">Statement</a> 
      </font></td>
  </tr>
  <tr> 
    <td width="36">&nbsp;</td>
    <td width="12">&nbsp;</td>
    <td width="947">&nbsp;</td>
  </tr>
      <tr> 
    <td colspan="3"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b><font color="#FFFFFF">Title&nbsp;List
      </font></b></font></td>
  </tr>
    <tr> 
    <td width="36"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">Step</font></td>
    <td width="12"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">5</font></td>
    <td width="947"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">-&nbsp;<a href="TitleList.cfm?id=<cfoutput>#URL.ID#</cfoutput>">Title  List</a> 
      </font></td>
  </tr>
  <tr> 
    <td width="36">&nbsp;</td>
    <td width="12">&nbsp;</td>
    <td width="947">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="3"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b><font color="#FFFFFF">Upload
      Images </font></b></font></td>
  </tr>
  <tr> 
    <td width="36"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">Step</font></td>
    <td width="12"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">6</font></td>
    <td width="947"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">-&nbsp;<a href="UploadImages.cfm?id=<cfoutput>#URL.ID#</cfoutput>">Upload&nbsp;JPEGs</a> 
      </font></td>
  </tr>
  <tr> 
    <td width="36">&nbsp;</td>
    <td width="12">&nbsp;</td>
    <td width="947">&nbsp;</td>
  </tr>
 <!---   <tr> 
    <td colspan="3"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b><font color="#FFFFFF">Completion</font></b></font></td>
  </tr>
 <tr> 
    <td width="36"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">Step</font></td>
    <td width="12"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">7</font></td>
    <td width="947"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">-&nbsp;<a href="mailto:photoshowcase@photoeye.com?<cfoutput>subject=#qGetShowcaseSetupInfo.Firstname# #qGetShowcaseSetupInfo.Lastname# Images are Uploaded</cfoutput>">Notify 
      photo-eye</a> </font></td>
  </tr>
  <tr> 
    <td width="36">&nbsp;</td>
    <td width="12">&nbsp;</td>
    <td width="947">&nbsp;</td>
  </tr> --->
 <!---  </cfif> --->
</table>

</body>
</html>
