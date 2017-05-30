<CFPARAM NAME="Season" DEFAULT="Winter">
<CFPARAM NAME="Year" DEFAULT="2005">
<cfset page="Survey of New Books">
<CFSET xTitle="Booklist">
<CFSET xSubPage="1">
<CFSET xPathToRoot="../../">
<CFSET xShowBackButton = 1>
<CFPARAM NAME="Page" DEFAULT="Photo-Eye Booklist">

<cfinclude template="../../templates/Header.cfm">
<DIV ALIGN="CENTER">

	<CFSET xFontColor = "Black">
	
	<CFIF Page is "Reviews">
		<CFSET xSubTitle = "New Books Reviewed">
	<CFELSEIF Page is "Contact">
		<CFSET xSubtitle = "Contact Us">
	<CFELSE>
		<CFSET xSubTitle=Page>
	</CFIF>
	
	<CFINCLUDE TEMPLATE="../../templates/Title.cfm">
	<CFOUTPUT>#xHTMLTitle#</CFOUTPUT>
	<TABLE WIDTH="700" align="center">
 
    <td height="50" align="right" valign="top">
      <div align="center"><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif">The quarterly survey of the best new photography books.<br />CONTRIBUTING WRITERS:
PHIL HARRIS, DARIUS HIMES, LARISSA LECLAIR, ALAN RAPP, GEORGE SLADE, DENISE WOLFF
  </font>
      </div></TD>
  </TR></TABLE>

</DIV>

<table width="700" align="center"><tr>
  <td><CFQUERY NAME="qReviews" DATASOURCE="photoeyecom">
	SELECT Distinct Catalog, Subject, Title2x
	FROM Inventory
	WHERE Catalog IN (
	
	'PI149',
	'DP260',
	'DU022',
	'PX060',
	'YU073',
	'AP509',
	'PI152',
	'TR186',
	'PX069',
	'DP256',
	'NT156',
	'AP501',
	'TR183',
	'DP273',
	'BF206',
	'CI168',
	'AP508',
	'TR191',
	'TR185',
	'ZC561',
	'ZC545',
	'ZC641',
	'PY155',
	'ZC542'
		)
		ORDER BY Title2x
	</CFQUERY>
	
	<CFSET xCounter = 0>
	<div align="center">
	<TABLE ALIGN="CENTER"><TR>
	<CFSET xLastCatalog = "">
	<CFOUTPUT QUERY="qReviews">
	<CFSET xTestPath = expandpath('../../img/Bigillus/#Catalog#b.jpg')>	
	<CFIF FileExists("#xTestPath#") and Catalog is not xLastCatalog>
	
		<CFIF xCounter Mod 4 is 0>
		</TR></TABLE><BR><TABLE><TR>
		</CFIF>
		
		<TD WIDTH="150" ALIGN="CENTER">
		<!--- Mixed Case Author --->
	<CFSET xAuthor = Subject>
	<CFINCLUDE TEMPLATE="../../templates/Author_MixedCase.cfm">
	
	<!--- Image Sizer--->
	
		<cfset xImage = "#Catalog#b.jpg">
		<CFSET xPath = "..\..\img\Bigillus">
        <cfset xAlt = "#trim(xAuthor)#: #trim(Title2x)#">
		
		<cfinclude template="../../templates/imagesizer.cfm">	
	
	<!--- Trim period off of the title, if it's there --->
	<CFSET xTitle2x = trim(Title2x)>
	<CFIF len(xTitle2x) gt 0>
		<CFIF find(".", xTitle2x, len(xTitle2x)) gt 0> 
	 		<CFSET xTitle2x = left(xTitle2x, len(xTitle2x)-1)>
		</CFIF>	
	</CFIF>

<TABLE><TR><TD ALIGN="CENTER"><A HREF="../../templates/mShowDetailsbyCat.cfm?Catalog=#Catalog#"><img src="../../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="1" ALT='#xAlt#' Align='center' style="border-color:Silver" vspace="5"></A></TD></TR>
<TR><TD ALIGN="CENTER"><FONT FACE="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif" class="text"><A HREF="../../templates/mShowDetailsbyCat.cfm?Catalog=#Catalog#"><b>#xTitle2x#</b></A></FONT></TD></TR>
<TR><TD ALIGN="CENTER"><FONT FACE="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif" class="text">#xAuthor#</FONT></TD></TR></TABLE></TD>
	
		<CFSET xCounter = xCounter +1>
		<CFSET xLastCatalog = Catalog>
	  </CFIF>
		
	</CFOUTPUT>
	</TR></TABLE>
	</td>
</tr></table>
<cfinclude template="../../templates/footer_site.cfm">




