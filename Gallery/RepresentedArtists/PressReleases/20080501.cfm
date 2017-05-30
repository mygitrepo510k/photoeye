<cfset xTreePath = "../../">
<cfinclude template="../../Includes/dsp_Galleries_index_top.cfm">
<br />
<div align="center">
<EMBED src="20080501.pdf" width="900" height="750" border="3"></EMBED>
</div>

<!---
XHTML compliant page:


<object data="20080501.pdf" type="application/pdf" width="900" height="750" ></object--->
<!---
<cfsetting enablecfoutputonly="yes" showdebugoutput="no">
<cfhttp GetAsBinary="yes" file="http://test.photoeye.com/gallery/representedartists/pressreleases/20080501.pdf"></cfhttp>

<cfcontent type="application/pdf"><cfoutput>#trim(toString(cfhttp.filecontent))#</cfoutput>--->

<cfinclude template="../../Includes/dsp_Galleries_index_bottom.cfm">

