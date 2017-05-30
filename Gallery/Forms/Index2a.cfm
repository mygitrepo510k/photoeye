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

<!--- Inktomi problem with interpreting &image as --->
<cfset url.id= REPLACE(#url.id#,"%E2%84%91","&Image")>  	

<cfif Isdefined("URL.Gallery")>
	<cfset Gallery=#url.Gallery#>
<cfelse>
	<cfset Gallery=0>
</cfif>
	
<cfif Isdefined("URL.Page")>
	<cfset Page=#url.Page#>
<cfelse>
	<cfset Page=0>
</cfif>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<frameset cols="150,*,150" frameborder="NO" border="0" framespacing="0">
  <frame src="Left.cfm?id=#url.id#&Portfolio=#url.portfolio#" name="LEFTFrame" scrolling="NO" noresize>
  <frame src="template_d.cfm?id=#qShowcaseArtist.custnumber#&Portfolio=#url.portfolio#" name="mainFrame">
   <frame src="Left.cfm?id=#url.id#&Portfolio=#url.portfolio#" name="LEFTFrame" scrolling="NO" noresize>
</frameset>
<noframes><body>
</body></noframes>
</html>

</cfoutput>
