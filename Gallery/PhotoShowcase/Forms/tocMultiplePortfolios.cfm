<CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup
  WHERE Custnumber = #url.Custnumber#
</CFQUERY>

<!--- <CFQUERY NAME="qGetPortfolio"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryPortfolio where Custnumber=#url.Custnumber# and showcaseok=1
</CFQUERY> --->

<CFQUERY NAME="qGetPortfolio"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryPortfolio where Custnumber=#url.Custnumber# ;
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
    <td colspan="3"><font face="Arial,Helvetica,sans-serif" size="4"><b> <font color="Yellow">Setup</font></b></font><br>
    </td>
  </tr>
  <tr> 
    <td colspan="3"><font face="Arial,Helvetica,sans-serif" size="2"><b> <font color="#FFFFFF"><cfoutput>#qGetShowcaseSetupInfo.FirstName# #qGetShowcaseSetupInfo.LastName# Showcase</cfoutput></font></b></font><br>
      <br>
    </td>
  </tr>
  <tr> 
    <td colspan="3"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
      <font color="#FFFFFF">Introduction</font></b></font></td>
  </tr>
  <tr> 
    <td colspan="3"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><a href="intro.cfm?custnumber=<cfoutput>#Custnumber#</cfoutput>">Overview</a></font></td>
  </tr>
  <tr> 
    <td colspan="3"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">&nbsp;</font>&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="3"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b><font color="#FFFFFF">Biographical 
      Information </font></b></font></td>
  </tr>
  <tr> 
    <td width="17%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">Step</font></td>
    <td width="8%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">1</font></td>
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">-&nbsp;<a href="step1basicdata.cfm?custnumber=<cfoutput>#Custnumber#</cfoutput>">Basic 
      Data </a></font></td>
  </tr>
  
  <cfif qGetShowcaseSetupInfo.multiartists is 0>
  <tr> 
    <td width="17%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">Step</font></td>
    <td width="8%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">2</font></td>
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">-&nbsp;<a href="step2Education.cfm?custnumber=<cfoutput>#URL.Custnumber#</cfoutput>">Education</a> 
      </font></td>
  </tr>
  <tr> 
    <td width="17%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">Step</font></td>
    <td width="8%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">3</font></td>
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">-&nbsp;<a href="step3CollectionsURLNew.cfm?custnumber=<cfoutput>#URL.Custnumber#</cfoutput>">Collections</a> 
      </font></td>
  </tr>
  <tr> 
    <td width="17%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">Step</font></td>
    <td width="8%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">4</font></td>
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">-&nbsp;<a href="step4SoloShowsURLNew.cfm?custnumber=<cfoutput>#URL.Custnumber#</cfoutput>">Solo 
      Exhibitions</a> </font></td>
  </tr>
  <tr> 
    <td width="17%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">Step</font></td>
    <td width="8%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">5</font></td>
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">-&nbsp;<a href="step5GroupShowsURLNew.cfm?custnumber=<cfoutput>#URL.Custnumber#</cfoutput>">Group 
      Exhibitions</a> </font></td>
  </tr>
  <tr> 
    <td width="17%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">Step</font></td>
    <td width="8%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">6</font></td>
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">-&nbsp;<a href="step6AwardsURLNew.cfm?custnumber=<cfoutput>#URL.Custnumber#</cfoutput>">Awards</a> 
      </font></td>
  </tr>
  
  <cfelse>
  	<tr> 
    <td height="19" width="17%" colspan="3">
  <font face="Verdana,Arial,Helvetica,sans-serif" size="2" color="white">Steps 2-6 are disabled<br>for Multiple Artist Portfolios</font></td></tr>
  </cfif> 
  
  <tr> 
    <td width="17%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">Step</font></td>
    <td width="8%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">7</font></td>
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">-&nbsp;<a href="step7BibliographyURLNew.cfm?custnumber=<cfoutput>#URL.Custnumber#</cfoutput>">Bibliography</a> 
      </font></td>
  </tr>
  
  <cfif qGetShowcaseSetupInfo.multiartists is 0>
  <tr> 
    <td width="17%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">Step</font></td>
    <td width="8%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">8</font></td>
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">-&nbsp;<a href="step8StatementsURLNew.cfm?custnumber=<cfoutput>#URL.Custnumber#</cfoutput>">Statements</a></font></td>
  </tr>
   <tr> 
    <td width="17%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">Step</font></td>
    <td width="8%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">9</font></td>
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">-&nbsp;<a href="step2ChronologyURLNew.cfm?custnumber=<cfoutput>#URL.Custnumber#</cfoutput>">Chronology</a></font></td>
  </tr>
  <tr> 
    <td height="19" width="17%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">Step</font></td>
    <td height="19" width="8%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">10</font></td>
    <td height="19" width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">-&nbsp;<a href="step9RecommendedBooksURLNew.cfm?custnumber=<cfoutput>#URL.Custnumber#</cfoutput>">Recommended 
      Books</a> </font></td>
  </tr>
  <cfelse>
  	<tr> 
    <td height="19" width="17%" colspan="3">
  <font face="Verdana,Arial,Helvetica,sans-serif" size="2" color="white">Steps 8-10 are disabled<br>for Multiple Artist Portfolios</font></td></tr>
  </cfif> 
  
  <tr> 
    <td width="17%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="75%">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="3"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b><font color="#FFFFFF">Image 
      Descriptions</font></b></font></td>
  </tr>
  <tr> 
    <td width="17%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">Step</font></td>
    <td width="8%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">11</font></td>
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">-&nbsp;<a href="step11DefaultTemplateURL.cfm?custnumber=<cfoutput>#URL.Custnumber#&portfolio=#qGetPortfolio.Subdirectory#</cfoutput>">Artwork  
      Template </a> </font></td>
  </tr>
  <tr> 
    <td width="17%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">Step</font></td>
    <td width="8%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">12</font></td>
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">-&nbsp;<a href="Step10ChangeImageOrderURL.cfm?custnumber=<cfoutput>#URL.Custnumber#&portfolio=#qGetPortfolio.Subdirectory#</cfoutput>">Sequence/Edit 
      Text</a> </font></td>
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
    <td width="8%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">13</font></td>
    <!---    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">-&nbsp;<a href="../Artists/<cfoutput>#qGetShowcaseSetupInfo.Subdirectory#/index.cfm?id=#qGetShowcaseSetupInfo.Custnumber#</cfoutput>">View 
      Your Showcase</a></font></td> ---> 
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">-&nbsp;<a href="CompletionCheck.cfm?custnumber=<cfoutput>#qGetShowcaseSetupInfo.Custnumber#</cfoutput>">View 
      Your Showcase</a></font></td>
  </tr>
  <tr> 
    <td width="17%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">Step</font></td>
    <td width="8%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">14</font></td>
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">-&nbsp;<a href="mailto:photoshowcase@photoeye.com?subject=Request Approval">Request 
      Approval</a> </font></td>
  </tr>
  <tr>
    <td width="17%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">Step</font></td>
    <td width="8%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">15</font></td>
    <td width="75%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2">-&nbsp;<a href="http://www.photoeye.com" target="_parent">Exit 
      to photoeye</a> </font></td>
  </tr>
  <tr> 
    <td width="17%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="75%">&nbsp;</td>
  </tr>
<!---   <tr> 
    <td colspan="3"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b><font color="#FFFFFF">Statistics</font></b></font></td>
  </tr>
  <tr> 
    <td colspan="3" width="100%"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><a href="Stats.cfm?custnumber=<cfoutput>#qGetShowcaseSetupInfo.Custnumber#</cfoutput>">View 
      Your Stats</a></font></td>
  </tr>
  <tr> 
    <td width="17%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="75%">&nbsp;</td>
  </tr> --->
  <tr> 
    <td width="17%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="75%">&nbsp;</td>
  </tr>
</table>

</body>
</html>
