

<!--- Stats --->
<CFINCLUDE TEMPLATE="../../stats_include.cfm">
<!--- END: Stats --->

<CFQUERY NAME="qShowcaseArtist"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup where Custnumber=#url.id# order by custnumber
</CFQUERY>

<cfoutput>
<html>
<head>
<SCRIPT LANGUAGE=JAVASCRIPT TYPE="TEXT/JAVASCRIPT">
	<!-- Hide script from old browsers

	function updateParent(newURL) {
		opener.document.location = newURL
	}

	// End hiding script from old browsers -->
	</SCRIPT>

<cfif isdefined("URL.Keyword")>
	<cfset Keyword = #URL.Keyword#>
<cfelse>
	<cfset Keyword = "">
</cfif>	
<cfset keyword= REPLACE(#KEYWORD#," ","%20","All")>  	

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<frameset cols="30%,*" frameborder="NO" border="0" framespacing="0">
  <frame src="index4a.cfm?id=#qShowcaseArtist.custnumber#&Portfolio=#url.portfolio#" name="leftFrame" scrolling="NO" noresize>
  <frame src="index3.cfm?id=#qShowcaseArtist.custnumber#&Portfolio=#url.portfolio#" name="mainFrame">
</frameset>
<noframes><body>
</body></noframes>
</html>

</cfoutput>
