



<CFPARAM NAME="url.Alpha" DEFAULT="">
<CFSET xAlpha = url.Alpha>
<CFPARAM NAME="url.Index" DEFAULT="0">
<CFIF url.Index is 1>
	<CFSET xIndex = " Index">
	<CFIF xAlpha is ''>
		<CFSET xAlpha = "A">
	</CFIF>
<CFELSE>
	<CFSET xIndex = "">
</CFIF>

<CFSET xTitle="Bookstore">
<CFSET xPathToRoot="../">
<CFSET xShowMenu = 1>

<CFPARAM NAME="url.MakeStatic" DEFAULT="0">
<CFIF url.MakeStatic is not 1>
	<cfinclude template="includes/dsp_bookstore_index_bottom.cfm">
	<CFIF xAlpha is not ''>
		<CFINCLUDE TEMPLATE="index/VisualAnthologies_#xAlpha#.html">
		<CFABORT>
	</CFIF>
</CFIF>
	
<CFSET xPage = "Visual Anthologies#xIndex#">
<CFINCLUDE TEMPLATE="Nav_Bookstore_Categories.cfm">

<CFSET xCategory = 2>

<CFIF url.Index is 1>
	<CFINCLUDE TEMPLATE="Index_Alphabet_include.cfm">
</CFIF>
<CFPARAM NAME="url.Preview" DEFAULT="0">
<CFSET xSectionID = "8">

<CFIF xAlpha is "">
	<CFINCLUDE TEMPLATE="Category_results_include.cfm">
</CFIF>

<cfinclude template="includes/dsp_bookstore_index_bottom.cfm">