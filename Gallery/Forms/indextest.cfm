<CFQUERY NAME="qShowcaseArtist"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup where Custnumber=#url.id#
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


<title>photo-eye Photographer's Showcase | #qShowcaseArtist.FirstName# #qShowcaseArtist.LastName#</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>


<frameset rows="95,*" frameborder="NO" border="0" framespacing="0" cols="*"> 
  <frame name="HeaderFrame" scrolling="NO" noresize src="Header1.cfm?id=#url.id#&image=#url.image#&imagePosition=#url.imagePosition#&Door=#url.door#&Gallery=#url.gallery#&Portfolio=#url.portfolio#&Keyword=#Keyword#&Page=#Page#">
  <frameset rows="*, 54" frameborder="NO" border="0" framespacing="0" cols="*"> 
    <frameset cols="*,150" frameborder="NO" border="0" framespacing="0" rows="*"> 
      <frameset cols="150,*" frameborder="NO" border="0" framespacing="0"> 
        <frame name="LeftFrame" scrolling="NO" noresize src="Left.cfm?id=#url.id#&Portfolio=#url.portfolio#">
	
  <frame name="MiddleFrame" src="Image1test.cfm?id=#url.id#&image=#url.image#&imagePosition=#url.imagePosition#&Door=#url.door#&Portfolio=#url.portfolio#" noresize>
</frameset>
      <frame name="RightFrame" scrolling="AUTO" noresize src="Scroll3.cfm?id=#qShowcaseArtist.custnumber#&Portfolio=#url.portfolio#">
    </frameset>
    <frame name="BottomFrame" scrolling="NO" noresize src="Bottom.cfm?id=#url.id#&Portfolio=#url.portfolio#&Door=#url.door#">
  </frameset>
</frameset>

<noframes>
<body bgcolor="##FFFFFF">

</body>
</noframes> 
</html>
</cfoutput>

