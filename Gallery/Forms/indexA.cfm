<!--- Set "Continue Shopping" Session Var --->
<CFIF IsDefined("CGI.Query_String")>
	<CFSET Session.ContinueShopping = xURLHOME & '/Gallery/forms/index.cfm?' & CGI.Query_String>
</CFIF>

<CFPARAM NAME="url.Gallery" DEFAULT="0">
<CFPARAM NAME="url.Image" DEFAULT="1">
<CFPARAM NAME="url.ImagePosition" DEFAULT="1">
<CFPARAM NAME="url.Door" DEFAULT="1">

<!--- Send them back to the gallery home page if no clear URL.ID is specified --->
<!--- NOTE: From error messages, it seems that sometimes theis url var IS passed, but for some reason it isn't recognized--thus the quick fix. In the future, it could email the webmaster with details whenever this location occurs --->
<CFIF Not IsDefined("url.ID")>
	<CFLOCATION URL="../index.cfm">
<!--- 9/6/04 For Laszlo Layton: a photographer is no longer shown --->
<CFELSEIF url.id is "91305">
	<CFLOCATION URL="HomePageInformation.cfm">
</CFIF>

<!--- Sometimes there is garble after url.id (some kind of weird translation of "&image=1" into stuff like "%E2%84%91=1"), so take only the first batch of numbers from the ID string --->
<CFIF len(url.ID) gt 5>
	<CFSET xURLID = "">
	<CFSET xURLIDCounter = 1>
	<CFLOOP from="1" to="#len(url.ID)#" index="index">
		<CFIF asc(mid(url.ID, xURLIDCounter, 1)) lt 48 or asc(mid(url.ID, xURLIDCounter, 1)) gt 57>
			<CFBREAK>
		<CFELSE>
			<CFSET xURLID = xURLID & mid(url.ID, xURLIDCounter, 1)>
		</CFIF>
		<CFSET xURLIDCounter = xURLIDCounter + 1>
	</CFLOOP>
	<CFSET url.ID = xURLID>
</CFIF>


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


<title>photo-eye | #qShowcaseArtist.FirstName# #qShowcaseArtist.LastName#</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>


<frameset rows="95,*" frameborder="NO" border="0" framespacing="0" cols="*"> 
  <frame name="HeaderFrame" scrolling="NO" noresize src="Header1A.cfm?image=#url.image#&id=#url.id#&imagePosition=#url.imagePosition#&Door=#url.door#&Gallery=#url.gallery#&Portfolio=#url.portfolio#&Keyword=#Keyword#&Page=#Page#">
  <frameset rows="*, 54" frameborder="NO" border="0" framespacing="0" cols="*"> 
    <frameset cols="*,150" frameborder="NO" border="0" framespacing="0" rows="*"> 
      <frameset cols="150,*" frameborder="NO" border="0" framespacing="0"> 
        <frame name="LeftFrame" scrolling="NO" noresize src="Left.cfm?id=#url.id#&Portfolio=#url.portfolio#">
<!---   <frame name="MiddleFrame" src="Image1.cfm?id=#url.id#&image=#url.image#&imagePosition=#url.imagePosition#&Door=#url.door#&Portfolio=#url.portfolio#" noresize>
</frameset> --->

  <frame name="MiddleFrame" src="Image1.cfm?image=#url.imagePosition#&id=#url.id#&imagePosition=#url.imagePosition#&Door=#url.door#&Portfolio=#url.portfolio#" noresize>
</frameset>
      <frame name="RightFrame" scrolling="AUTO" noresize src="Scroll3.cfm?id=#qShowcaseArtist.custnumber#&Portfolio=#url.portfolio#">
    </frameset>
    <frame name="BottomFrame" scrolling="NO" noresize src="BottomA.cfm?id=#url.id#&Portfolio=#url.portfolio#&Door=#url.door#">
  </frameset>
</frameset>

<noframes>
<body bgcolor="##FFFFFF">
</body>
</noframes> 
</html>
</cfoutput>

