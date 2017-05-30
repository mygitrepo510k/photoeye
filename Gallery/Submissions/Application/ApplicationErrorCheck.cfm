<!--- Make sure that all steps have been submitted --->
<CFQUERY NAME="qGetShowcaseApplication1"  DATASOURCE="photoeyecom">
  		select * FROM GalleryApplication 
  		WHERE OrderId = #url.id#
</CFQUERY>







<cfinclude template="header.cfm">

<body bgcolor="#CCCCCC" text="#000000" link="Navy" vlink="Red" alink="#000000">
<br>
<br>
<table width="80%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td> 
      <div align="Left"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">You 
        have not completed some of the steps necessary before uploading your images. <br>
<br><strong>photo-eye</strong> does not require information for each step. However you must click the &quot;Continue&quot; button at the bottom of each page to verify that 
       you have gone through each step. <br><br>
        </font></div>
    </td>
  </tr>
  <tr>
    <td><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Please complete the following steps: <br><font size="1">If you included information in some or all of these steps, then click your Browser Back button instead of the link below,  until you get to the problem page noted below. This way the information you entered will still be there. Then simply click the Continue button at the bottom of that page.</font><br>
<br>

<cfoutput>
<cfif qGetShowcaseApplication1.step2 is 0>
<a href="Bio.cfm?id=#url.id#">Step 2 - Artist R&eacute;sum&eacute;</a><br>
</cfif>
<br>
<cfif qGetShowcaseApplication1.step3 is 0>
<a href="Statement.cfm?id=#url.id#">Step 3 - Artist Statement</a><br>
</cfif>
<br>
<cfif qGetShowcaseApplication1.step4 is 0>
<a href="Statement_P.cfm?id=#url.id#">Step 4 - Process Statement</a><br>
</cfif>
<br>
<cfif qGetShowcaseApplication1.step5 is 0>
<a href="TitleList.cfm?id=#url.id#">Step 5 - Title List</a><br>
</cfif>
</cfoutput>

</font>
    </td>
  </tr>
 <cfinclude template="footer.cfm">
</table>
</body>
</html>
