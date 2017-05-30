<CFQUERY NAME="qGetKeywords"  DATASOURCE="PhotoEyeCom">
  SELECT KEYWORDS
  FROM GalleryKeywords 
  WHERE LEN(KEYWORDS)>0
  GROUP BY KEYWORDS
  ORDER BY KEYWORDS 
</CFQUERY>


  
<!---                 <!---Determine how many images there are---> 
			<cfset imagecount = 0>
			<cfloop index="fieldincrementer" from="1" to="40" step="1">
				<cfif fileexists(Expandpath("Images_Thumbs/image#fieldincrementer#.jpg")) or fileexists(Expandpath("../Artists/DariusHimes/Images_Thumbs/image#fieldincrementer#a.jpg"))>	
					<cfset imagecount = imagecount + 1>
				</cfif>
			</cfloop>
 --->
<cfset RecordCount = #qGetKeywords.RecordCount#>
<cfset ImageNumber = 1>
<cfset ImagePosition = 1>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase<SUP><FONT SIZE="-1">SM</FONT></SUP> | Photographer's Directory</title>
</head>

<body bgcolor="#333333" text="#FFFFFF" link="Silver" vlink="Gray" alink="Red">


<table width="95%" height="36" border="0" bgcolor="Black">
<tr>

    <td  width="95%" height="51" align="center"><img src="Photoshowcase/SharedImages/photoeyeexplorephotographersshowcase7.jpg" width="384" height="84" alt="" border="0"></td>

</tr>
</table>
  <p align="center"><font face="verdana, arial, helvetica, sans-serif" size="2" color="#CCCCCC"><b>E 
    X P L O R E&nbsp;&nbsp;&nbsp;P H O T O 
    G R A P H S&nbsp;&nbsp;&nbsp;by&nbsp;&nbsp;&nbsp;K E Y W O R D S</b><br>
    <br>
    </font> 
  <img src="../../img/Redlinetoc.gif" width="400" height="1" alt="" border="0"><br>
  <img src="SharedImages/dot_clear.gif" width="1" height="1">
  

<input type="hidden" name="filter" value="1">
<input type="hidden" name="indexfield" value="Title2x">
<input type="hidden" name="RecordCount" value="1">

<cfoutput>
	  
		  
<table border="0" cellspacing="6" cellpadding="5" align="center">
<cfset Column = 1>
<cfset TotalKeywords=#qGetKeywords.RecordCount#>
<cfset KeywordCount=0>
<cfset KeywordName="">
<tr>
<td width="200" colspan="2">	
<cfloop query="qGetKeywords" startrow="1" endrow="#qGetKeywords.RecordCount#">
 <cfif Column is 1>
 <!--- Do not show plural--->
	<cfif Find(KeywordName, #Keywords#) is not 1>
 

<a href="../../templates/SearchShowcaseKeywords.cfm?keyword=#keywords#*" target="Right"><FONT color="silver" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='silver';"  style="TEXT-DECORATION: none">
		<strong>#keywords#</strong></font></A><IMG height=12 src="../../dot_clear.gif" width=1> 
	<br>
		<cfset Keywordcount=Keywordcount+1>
		<cfif Keywordcount GT TOTALKEYWORDS/2>
			</td>
			<td width="200" colspan="2" valign="top">	
			<cfset Column = 2>
		</cfif> 
	</cfif>
  <cfelse>
		<!--- Do not show plural--->
		<cfif Find(KeywordName, #Keywords#) is not 1>
		<a href="../../templates/SearchShowcaseKeywords.cfm?keyword=#keywords#*" target="Right"><FONT color="silver" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseover="this.color='RED';" onMouseout="this.color='silver';"  style="TEXT-DECORATION: none">
		<strong>#keywords#</strong></font></A><IMG height=12 src="../../dot_clear.gif" width=1> 
		<br>
		</cfif>

	</cfif>
	<cfset KeywordName = #Keywords#>
</cfloop>
	</td></tr>
</table>  

</cfoutput>
</body>
</html>
