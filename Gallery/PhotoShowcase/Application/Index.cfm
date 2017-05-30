<cfoutput>
<CFIF ISDEFINED("url.step") is false>
	<CFSET STEP=1>
	<CFSET id=0>
	<CFSET custnumber=0>
<CFELSE>
	<CFSET STEP=#url.step#>
	<CFSET custnumber=#url.id#>
</CFIF>

<html>
<head>
<title>photo-eye Photographer's Showcase | Online Application</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<frameset cols="230,*" frameborder="0" border="0" framespacing="0" rows="*"> 
  <frame src="toc.cfm?Step=#Step#&id=#Custnumber#" name="leftFrame" scrolling="auto" noresize>
  <frame src="../../../Templates/ApplicationOptions.cfm" name="mainFrame" id="mainFrame" scrolling="Auto">
</frameset>
<noframes><body bgcolor="##FFFFFF" onLoad="opener.close()">

</body></noframes>
</cfoutput>
</html>
