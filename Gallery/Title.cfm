<!--- Creates Title/Subtitle HTML code --->

<!--- Note: the way this is written, once xSubTitle is defined on a page, all subsequent includes of Title.cfm will format all titles as subtitles and will look for xSubTitle as the title to format --->

<CFPARAM NAME="xFontColor" DEFAULT="Maroon">

<CFIF IsDefined("xSubTitle")>
	<CFSET xTitle = xSubTitle>
	<CFSET xCapSize = 5>
	<CFSET xCapSizePX = 24>
	<CFSET xCapSize2 = 4>
	<CFSET xCapSizePX2 = 18>
<CFELSE>
	<CFSET xCapSize = 6>
	<CFSET xCapSizePX = 18>
	<CFSET xCapSize2 = 4>
	<CFSET xCapSizePX2 = 18>
<!---	<CFSET xCapSize = 6>
	<CFSET xCapSizePX = 28>
	<CFSET xCapSize2 = 4>
	<CFSET xCapSizePX2 = 20>--->
</CFIF>

<CFSET xTitle = Trim(xTitle)>
<CFSET xTitleLength = Len(xTitle)>
<CFSET xCaps = 1>
<CFSET xFontTagOpen = 0>
<CFSET xHTMLTitle = "">
<CFLOOP from="1" to="#xTitleLength#" index="xLoopCount">
	
	<CFSET xTitleLetter = mid(xTitle, xLoopCount, 1)>
	<!--- Uppercase --->
	<CFIF (ASC(xTitleLetter) GT 64 AND Asc(xTitleLetter) LT 91) or xTitleLetter is '-'>
<!---		<CFSET xHTMLTitle = xHTMLTitle & '<b><FONT face="''Times New Roman'',Times,serif" size="#xCapSize#" color="#xFontColor#" style="font-size:#xCapSizePX#px">'>--->
				<CFSET xHTMLTitle = xHTMLTitle & '<FONT face="''Helvetica'',Arial,sans-serif" size="#xCapSize#" color="#xFontColor#" style="font-size:#xCapSizePX#px">'>
		<CFSET xHTMLTitle = xHTMLTitle & xTitleLetter>
		<CFSET xHTMLTitle = xHTMLTitle & '</FONT>'>
	<!--- Space --->
	<CFELSEIF xTitleLetter is ' '>
		<CFSET xHTMLTitle = xHTMLTitle & '&nbsp;'>
		
	<!--- Lowercase --->
	<CFELSE>

			<CFSET xHTMLTitle = xHTMLTitle & '<FONT face="''Helvetica'',Arial,sans-serif" size="#xCapSize2#" color="#xFontColor#" style="font-size:#xCapSizePX2#px">'>
<CFSET xHTMLTitle = xHTMLTitle & UCASE(xTitleLetter)>
	<CFSET xHTMLTitle = xHTMLTitle & '</FONT>'>
	
			
		
	</CFIF>
</CFLOOP>
