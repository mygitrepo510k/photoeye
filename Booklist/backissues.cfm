<CFPARAM NAME="Season" DEFAULT="Spring">
<CFPARAM NAME="Year" DEFAULT="2007">

<CFSET xTitle="Booklist">
<CFSET xSubPage="1">
<CFSET xPathToRoot="../">
<CFSET xShowBackButton = 1>
<CFPARAM NAME="Page" DEFAULT="Photo-Eye Booklist">

<cfinclude template="../templates/Header.cfm">
<DIV ALIGN="CENTER">
<CFSET xFontColor = "Black">
	
	<CFIF Page is "Reviews">
		<CFSET xSubTitle = "New Books Reviewed">
	<CFELSEIF Page is "Contact">
		<CFSET xSubtitle = "Contact Us">
	<CFELSE>
		<CFSET xSubTitle=Page>
	</CFIF>
	
		<cfset page="PHOTO-EYE BOOKLIST">	
	<CFINCLUDE TEMPLATE="../templates/Title.cfm">
	<CFOUTPUT>#xHTMLTitle#</CFOUTPUT>
	<br /><br />

	<cfset xmenupath="../booklist/">
 <cfinclude template="/booklist/include_menu.cfm">
 <br /><br />
 
	<TABLE WIDTH="700" align="center">
 
      <td height="136" align="right" valign="top"> 
        <div align="center">
          <p><strong><font size="3" face="Trebuchet MS">COLLECT YOUR SET OF PHOTO-EYE 
            BACK ISSUES</font></strong><br>
            <font face="Trebuchet MS"><br>
            <font size="2">A limited number of back issues are available for sale 
            - Prices subject to change<br>
            (Click on a cover to view availability and cost- Click &quot;Add to 
            Order&quot; to Purchase the Issue)</font></font><br>
          </p>
          </div></TD>
  </TR></TABLE>

</DIV>

<table width="700" align="center"><tr>
  <td><CFQUERY NAME="qReviews" DATASOURCE="photoeyecom">
	SELECT Distinct Catalog, Subject, Title2x
	FROM Inventory
	WHERE Catalog IN (
	
    'PE013',
	'PE014',
	'PE015',
	'PE016',
	'PE017',
	'PE018',
	'PE019',
	'PE020',
	'PE021',
	'PE022',
	'PE023',
	'PE024',
	'PE025',
	'PE026',
	'PE027',
	'PE028',
	'PE029',
	'PE030',
	'PE031',
	'PE032'	
		)
		ORDER BY Catalog
	</CFQUERY>
	
	<CFSET xCounter = 99>
	<div align="center">
	<TABLE ALIGN="CENTER"><TR>
	<CFSET xLastCatalog = "">
	<CFOUTPUT QUERY="qReviews">
	<CFSET xTestPath = expandpath('../img/Bigillus/#Catalog#b.jpg')>	
	<CFIF FileExists("#xTestPath#") and Catalog is not xLastCatalog>
	
		<CFIF xCounter Mod 4 is 0>
		</TR></TABLE><BR>
     	<TABLE>
        <TR>
		<cfelseif xCounter is 99>
		     	<TABLE>
        <TR>	
		<cfset xcounter = 0>
		
		</CFIF>

		<TD WIDTH="160" ALIGN="CENTER">
		<!--- Mixed Case Author --->
	<CFSET xAuthor = Subject>
	<CFINCLUDE TEMPLATE="../templates/Author_MixedCase.cfm">
	
	<!--- Image Sizer--->
	
		<cfset xImage = "#Catalog#b.jpg">
		<CFSET xPath = "..\img\Bigillus">
        <cfset xAlt = "#trim(xAuthor)#: #trim(Title2x)#">
		
		<cfinclude template="../templates/imagesizer.cfm">	
	
	<!--- Trim period off of the title, if it's there --->
	<CFSET xTitle2x = trim(Title2x)>
	<CFIF len(xTitle2x) gt 0>
		<CFIF find(".", xTitle2x, len(xTitle2x)) gt 0> 
	 		<CFSET xTitle2x = left(xTitle2x, len(xTitle2x)-1)>
		</CFIF>	
	</CFIF>

<TABLE><TR><TD ALIGN="CENTER"><A HREF="../templates/mShowDetailsbyCat.cfm?Catalog=#Catalog#"><img src="../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="1" ALT='#xAlt#' Align='center' style="border-color:Silver" vspace="5"></A></TD></TR>
<TR><TD ALIGN="CENTER"><FONT FACE="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif" class="text"><A HREF="../templates/mShowDetailsbyCat.cfm?Catalog=#Catalog#"><b>#xTitle2x#</b></A></FONT></TD></TR>
</TABLE></TD>
	
		<CFSET xCounter = xCounter +1>
		<CFSET xLastCatalog = Catalog>
	  </CFIF>
		
	</CFOUTPUT>
	</TR></TABLE>
	  <p><br><br>
        <br>
      </p>
      &nbsp;</p></td>
</tr></table>
<cfinclude template="../templates/footer_site.cfm">




