<!--- <CFQUERY NAME="qGetShowcaseApplicationSelect"  DATASOURCE="photoeyecom">
  Select * from GalleryApplication WHERE OrderId = #url.id#
</CFQUERY> --->

<CFQUERY NAME="qGetShowcaseApplication"  DATASOURCE="photoeyecom">
  		UPDATE GalleryApplication set Bio='#form.bio#', Step2='1'
  		WHERE OrderId = #url.id#
</CFQUERY>


<cfinclude template="header.cfm">

<body>
<cfoutput>
<div style="padding-top:200px;">
<table align="center"><tr><td align="center">
<p align="center">
<form action="Statement.cfm?id=#url.id#" method="post">
You bio has been submitted!<br><br>
<INPUT TYPE="SUBMIT" VALUE="Continue to Step 3">
</p>
</td></tr>
<cfinclude template="footer.cfm">
</table>
</div>
</cfoutput>
</form>

</body>
</html>
