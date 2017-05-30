<cfif IsDefined("URL.id")>
	<cfset id=#url.id#>

<cfelse>
	<cfset id = #qGetShowcaseSetupInfo.Custnumber#>
	
</cfif>

<html>
<head>
<title>photo-eye Photographer's Showcase </title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

 <frameset cols="242,*" frameborder="NO" border="0" framespacing="0" rows="*"> 
  <frame name="leftFrame" scrolling="Auto" noresize src="tocMultiplePortfolios.cfm?Custnumber=<CFOUTPUT>#id#</CFOUTPUT>">
  <frame name="mainFrame" src="introMultiplePortfolios.cfm?Custnumber=<CFOUTPUT>#id#</CFOUTPUT>">
</frameset>
<noframes> <body bgcolor="#FFFFFF">

</body></noframes> 

</html>
