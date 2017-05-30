<!--- Decide where to start the random images based on page number> --->
<!--- <cfset imgbegin=((#url.page#/2)*20)> --->
<cfif Isdefined("url.imgbegin")>
	<cfif #url.page# gt 1>
		<cfset page=#url.page#>
	</cfif>
	<!--- <cfset additional=#url.additional#> --->
<cfelse>
	<cfset page=1>
	<cfset imgBegin=0> 
</cfif>
<cfset imgNextBeginNo = imgBegin> 
<cfset imgBegin=0> 
<cfset image=1>
<cfset imageposition=1>
<cfparam name="gallery" default="2">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>

<cfif gallery is 1>
	<title>photo-eye Galleries |  Santa Fe Gallery Artist Directories</title>
<cfelseif gallery is 2>
	<title>photo-eye Galleries |  Photographer's Showcase Artist Directories</title>
<cfelseif gallery is 3>
	<title>photo-eye Galleries |  Magnum Photos Artist Directories</title>
</cfif>
	
<script language="JavaScript">

<!-- hide from JavaScript-challenged browsers

var popupWin = null;
function popUp(myURL,myWindowName,w,h,scroll,menu){
var myLeft = ((screen.width-w)/2)-5; 
var myTop = ((screen.height-h)/2)-10;   
var settings='height='+h+',width='+w+',top='+myTop+',left='+myLeft+', scrollbars=yes,resizable=yes,menu='+menu
popupWin=window.open(myURL,myWindowName,settings);   
if(parseInt(navigator.appVersion) >= 4){popupWin.focus();}
}



 

// done hiding -->

</script>
</head>



<body bgcolor="#B3A48E" text="#666666" link="Navy" vlink="Navy" alink="Red">

<DIV ALIGN="CENTER">

<table width="80%" height="36" border="0" bgcolor="Black">
<tr>

    <td  width="95%" height="51" align="center"><a href="../homepage.cfm"><img src="../SharedImages/photoeyeexplorephotographersshowcase7.jpg" width="384" height="84" alt="" border="0"></a></td>

</tr>
</table>

<!--- <table width="90%" border="0" align="center"">
	<tr>
    	<td  width="95%" align="center">
		
  <div align="center"><b>
 <img src="SharedImages/dot_clear.gif" width="1" height="1"><a href="HomepagePSnew.cfm"><font face="verdana, arial, helvetica, sans-serif" size="1" color="Maroon" onMouseOver="this.color='Red';" onMouseOut="this.color='Maroon';"  style="TEXT-DECORATION: none">Photographer's Showcase&nbsp;Gallery Home</font></a><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;| &nbsp;</font><a href="../index.cfm"><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Maroon';"  style="TEXT-DECORATION: none">All Galleries&nbsp;Home</font></a><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;| &nbsp;</font><a href="javascript:popUp('../photoshowcaseemailNoFrame.html','Popup','600','320','no');"><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Maroon';"  style="TEXT-DECORATION: none">Exhibit&nbsp;Your&nbsp;Work!</font></a><!---<FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;| &nbsp;</font> <a href="javascript:popUp('Documentation/index.cfm','Popup','600','460','no');"><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Maroon';"  style="TEXT-DECORATION: none">Showcase&nbsp;Information</font></a></b> --->
<br></div>
</td></tr></table>
 
  <br><DIV align="center"><b><font face="verdana, arial, helvetica, sans-serif" size="2" color="#000000">P 
    H O T O G R A P H E R ' S&nbsp;&nbsp;&nbsp;&nbsp;S H O W C A S E <SUP><FONT SIZE="-1">SM</FONT></SUP></font>
	<br> <font face="verdana, arial, helvetica, sans-serif" size="2" color="#000000">S E A R C H&nbsp;&nbsp; D&nbsp;I&nbsp;R&nbsp;E&nbsp;C&nbsp;T&nbsp;O&nbsp;R&nbsp;I&nbsp;E&nbsp;S</b></font> 
<br> --->


<div align="center"><font face="verdana, arial, helvetica, sans-serif" size="2" color="#000000"><b>
	 
	
	<cfif Gallery is 1>


<table width="90%" border="0" align="center"">
	<tr>
    	<td  width="95%" align="center"

<div align="center"><b>
<img src="photoshowcase/SharedImages/dot_clear.gif" width="1" height="1"><!--- <a href="photoshowcase/SearchShowcase.cfm"><font face="verdana, arial, helvetica, sans-serif" size="1" color="Maroon" onMouseOver="this.color='Red';" onMouseOut="this.color='Maroon';"  style="TEXT-DECORATION: none">Represented&nbsp;Artists&nbsp;Search&nbsp;Page</font></a><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;| &nbsp;</font> ---><a href="../RepresentedArtists/HomePagePE.cfm"><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Maroon';"  style="TEXT-DECORATION: none">Represented Artists Home</font></a><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;| &nbsp;</font><a href="../index.cfm"><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Maroon';"  style="TEXT-DECORATION: none">All Galleries Home</font></a></b>
<br></div>
</td></tr></table><br>
<font face="verdana, arial, helvetica, sans-serif" size="2" color="#000000"><b>R&nbsp;E&nbsp;P&nbsp;R&nbsp;E&nbsp;S&nbsp;E&nbsp;N&nbsp;T&nbsp;E&nbsp;D &nbsp;&nbsp; A&nbsp;R&nbsp;T&nbsp;I&nbsp;S&nbsp;T&nbsp;S &nbsp;&nbsp;



<cfelseif Gallery is 2>
<table width="90%" border="0" align="center"">
	<tr>
    	<td  width="95%" align="center">
		
  <div align="center"><b>
 <img src="photoshowcase/SharedImages/dot_clear.gif" width="1" height="1"><!--- <a href="photoshowcase/SearchShowcase.cfm"><font face="verdana, arial, helvetica, sans-serif" size="1" color="Maroon" onMouseOver="this.color='Red';" onMouseOut="this.color='Maroon';"  style="TEXT-DECORATION: none">Photographer's Showcase&nbsp;Search Page</font></a><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;| &nbsp;</font> ---><a href="HomePagePSnew.cfm"><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Maroon';"  style="TEXT-DECORATION: none">Photographer's Showcase<SUP><FONT SIZE=1>&reg;</FONT></SUP> Gallery Home</font></a><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;| &nbsp;</font><a href="../index.cfm"><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Maroon';"  style="TEXT-DECORATION: none">All Galleries Home</font></a><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;| &nbsp;</font><a href="javascript:popUp('newdocumentation/Artists/SubmissionProcess2.html','Popup','600','460');"><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Maroon';"  style="TEXT-DECORATION: none">Exhibit&nbsp;Your&nbsp;Work!</font></a></b>
<br></div>
</td></tr></table>
<font face="verdana, arial, helvetica, sans-serif" size="2" color="#000000"><b><br>
P&nbsp;H&nbsp;O&nbsp;T&nbsp;O&nbsp;G&nbsp;R&nbsp;A&nbsp;P&nbsp;H&nbsp;E&nbsp;R&nbsp;'&nbsp;S &nbsp;&nbsp; S&nbsp;H&nbsp;O&nbsp;W&nbsp;C&nbsp;A&nbsp;S&nbsp;E&nbsp;<SUP><FONT SIZE="-1">&reg;</FONT></SUP></font>


<cfelseif Gallery is 3>
<table width="90%" border="0" align="center"">
	<tr>
    	<td  width="95%" align="center">

<div align="center"><b>
<img src="photoshowcase/SharedImages/dot_clear.gif" width="1" height="1"><!--- <a href="photoshowcase/SearchShowcase.cfm"><font face="verdana, arial, helvetica, sans-serif" size="1" color="Maroon" onMouseOver="this.color='Red';" onMouseOut="this.color='Maroon';"  style="TEXT-DECORATION: none">Magnum&nbsp;Photos&nbsp;Search&nbsp;Page</font></a> <FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;| &nbsp;</font>---><a href="../MagnumArtists/HomePageMA.cfm"><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Maroon';"  style="TEXT-DECORATION: none">Magnum Photos Home</font></a><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;| &nbsp;</font><a href="../index.cfm"><FONT color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='Maroon';"  style="TEXT-DECORATION: none">All Galleries Home</font></a></b>
<br></div>
</td></tr></table>
<font face="verdana, arial, helvetica, sans-serif" size="2" color="#000000"><b><br>
M&nbsp;A&nbsp;G&nbsp;N&nbsp;U&nbsp;M &nbsp;&nbsp; P&nbsp;H&nbsp;O&nbsp;T&nbsp;O&nbsp;S &nbsp;&nbsp;


<cfelse>
<!--- D&nbsp;I&nbsp;R&nbsp;E&nbsp;C&nbsp;T&nbsp;O&nbsp;R&nbsp;Y ---><br><font face="verdana, arial, helvetica, sans-serif" size="2" color="#000000"><b>A&nbsp;L&nbsp;L &nbsp;&nbsp;&nbsp;&nbsp;G&nbsp;A&nbsp;L&nbsp;L&nbsp;E&nbsp;R&nbsp;I&nbsp;E&nbsp;S


</cfif><br>S E A R C H&nbsp;&nbsp; D&nbsp;I&nbsp;R&nbsp;E&nbsp;C&nbsp;T&nbsp;O&nbsp;R&nbsp;Y

</b></font>
<br>



  <img src="SharedImages/Redlinetoc.gif" width="400" height="1" alt="" border="0"> <br> 
  <img src="SharedImages/dot_clear.gif" width="1" height="17"><font face="verdana, arial, helvetica, sans-serif" size="1" color="#333333"><b>
Search  <cfif Gallery is 1>Represented
				 <cfelseif Gallery is 2>Showcase
				 <cfelseif Gallery is 3>Magnum
				 <cfelse>All
				 </cfif>
				 
				 Artists and Artwork in Many Ways</b></font></div><!--- <br><img src="SharedImages/dot_clear.gif" width="1" height="1"> --->

	<br><br>
<table width="350" border="1" align="center" bordercolor="#000000" bgcolor="#B3A48E">
	<tr>
		<td width="50%" bgcolor="#000000" bordercolor="#000000">
			<div align="center">
				 <font face="verdana, arial, helvetica" color="#FFFFcc" size="1"><b>Search 
				 <cfif Gallery is 1>Represented
				 <cfelseif Gallery is 2>Showcase
				 <cfelseif Gallery is 3>Magnum
				 <cfelse>All
				 </cfif>Artists by Directory</b></font></div>
				 </td>
			<td width="50%" bgcolor="black">
			
				<div align="center">
				 <font face="verdana, arial, helvetica" color="#FFFFcc" size="1"><b>Power Search</b></font></div>
		</td>
		</tr> 
		<tr>
		<cfoutput>
		<cfif Gallery is 1>
			<cfset #Gallery# = 1>
		<cfelseif Gallery is 2>
			<cfset #Gallery# = 2>
		<cfelseif Gallery is 3>
			<cfset #Gallery# = 3>
		<cfelse>
			<cfset #Gallery# = 0>
		</cfif>	
		<td width="50%">     		 
				 <div align="left">
<!--- 				 <font color="Maroon" face="verdana, arial, Helvetica, sans-serif" size="1"><strong>SEARCH DIRECTORIES&nbsp;&nbsp;</strong></font><BR>  --->
          &nbsp;&nbsp;<a href="../ArtistsIndex.cfm?Include=1&Gallery=#Gallery#&Door=8#Gallery#"><font color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseOver="this.color='RED';" onMouseOut="this.color='##333333';"  style="TEXT-DECORATION: none"><strong>Artist Index </strong></font><!---<IMG alt="" border=0 height=8 src="../../img/yellow(2)pointsleftred.gif" width=7>---></A><img height=15 src="../../dot_clear.gif" width=1> 
     <BR>
	  &nbsp;&nbsp;<A href="../Genres.cfm?Include=1&Gallery=#Gallery#&Door=8#Gallery#"><font color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseOver="this.color='RED';" onMouseOut="this.color='##333333';"  style="TEXT-DECORATION: none"><STRONG>Categories/Genres </STRONG></FONT><!---<IMG alt="" border=0 height=8 src="../../img/yellow(2)pointsleftred.gif" width=7>---></A><img height=15 src="../../dot_clear.gif" width=1> 
       <BR>   
          &nbsp;&nbsp;<A href="../Formats.cfm?Include=1&Gallery=#Gallery#&Door=8#Gallery#"><font color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseOver="this.color='RED';" onMouseOut="this.color='##333333';"  style="TEXT-DECORATION: none"><STRONG>Camera Formats </STRONG></FONT><!---<IMG alt="" border=0 height=8 src="../../img/yellow(2)pointsleftred.gif" width=7>---></A><img height=15 src="../../dot_clear.gif" width=1> 
          <BR>
          &nbsp;&nbsp;<a href="../Processes.cfm?Include=1&Gallery=#Gallery#&Door=8#Gallery#"><font color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseOver="this.color='RED';" onMouseOut="this.color='##333333';"  style="TEXT-DECORATION: none"><strong>Print Processes </strong></font><!---<IMG alt="" border=0 height=8 src="../../img/yellow(2)pointsleftred.gif" width=7>---></A><img height=15 src="../../dot_clear.gif" width=1>
			<br>

          &nbsp;&nbsp;<a href="../Keywords.cfm?Include=1&Gallery=#Gallery#&Door=8#Gallery#"><font color="##333333" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseOver="this.color='RED';" onMouseOut="this.color='##333333';"  style="TEXT-DECORATION: none"><strong>Subject Keywords </strong></font><!---<IMG alt="" border=0 height=8 src="../../img/yellow(2)pointsleftred.gif" width=7>---></A><img height=15 src="../../dot_clear.gif" width=1> 
</div><br>
</td>
<td width="50%>
<div align="center"><center>
         <FORM method="post" action="../../templates/SearchShowcasePowerSearch.cfm?Gallery=#Gallery#&Door=8#Gallery#">
          <font face="verdana, arial, Helvetica, sans-serif" size="1" color="##333333"><b><br>Enter 
         Artist/Keyword(s):</b></font><img height=15 src="../../dot_clear.gif" width=1><br>
          <!--- <img height=10 src="../dot_clear.gif" width=1>  ---><!---         <select name="SearchField">
            <OPTION SELECTED value="Abstract">Keywords
            <option value="Subject">Photographer
			<option value="Subject">Genre
          </select> ---> 
        <input type="text" name="SearchCriteria" size="15"> 
          <input type="image" name="Search" src="../../img/GIF/NewGoblue.jpg" align="absmiddle" width="21" height="21" border="0">
         <input type="hidden" name="filter" value="1">
          <input type="hidden" name="indexfield" value="Title2x">
          <input type="hidden" name="RecordCount" value="1">


 </form><br></cfoutput>
</center> </div>
</td></tr></table>
	

<cfinclude template="../footer.cfm">


</body>
</html>


