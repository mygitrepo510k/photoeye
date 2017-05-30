<CFPARAM NAME="Season" DEFAULT="Fall">
<CFPARAM NAME="Year" DEFAULT="2005">

<CFSET xTitle="Magazine">
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
	<BR><BR>


<FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333">

<!--- <cfinclude template="../include_menu.cfm">
<br><br> --->
<TABLE WIDTH="700"><TR>
<td colspan="3" align="center"> <font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>STORIES OF REBUILDING, STORIES OF SACRIFICE<br>
</strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>One photographer’s journey through a war-torn land. An interview with SARA TERRY.</strong></font></td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="400" valign="top" align="right">
      <p>
	  <cfoutput>
<cfset Catalog="CN018">
<cfset xImage = "aftermath1.jpg">
	<cfset xPath = "img">
	<CFSET xHEIGHT = "400">
	<CFSET xWidth = "400">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Lisa Sarfati: The New Life">
	<cfset xBorder="1">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=CN018"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
		
		<cfset Catalog="CN018">
<cfset xImage = "aftermath2.jpg">
	<cfset xPath = "img">
	<CFSET xHEIGHT = "400">
	<CFSET xWidth = "400">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Lisa Sarfati: The New Life">
	<cfset xBorder="1">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=CN018"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
		</cfoutput>
		
		<cfoutput>
<cfset Catalog="CN018">
<cfset xImage = "#Catalog#b.jpg">
	<cfset xPath = "..\..\img\Bigillus">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Aftermath. Bosnia's Long Road to Peace">
	<cfset xBorder="1">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=CN018"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a></cfoutput>
      </p>
      </TD>
   <td width="20">&nbsp;
  </td>
  <td width="480" valign="top">
    <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">  AS A FORMER STAFF WRITER for the Christian
Science Monitor, an internationally respected publication
providing objective news reporting, Sara Terry is well
acquainted with the contingencies, beauracracy, and highflying,
high-risk-taking of modern, global news reporting.
After a mid-career transition into documentary photography
in the late 1990s, it was her familiarity with the news
media, coupled with exasperation about what she saw as the
media’s short-term memory, that fed her desire to work on
an in-depth story, a long term project that was meaningful
and would require her concerted best.
<br><br />
Continue reading this interview by <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE024">ordering the current issue</a> of photo-eye Booklist. 

          </font></p>
 <!---   <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">--Karen Sinsheimer</font></p> --->
    <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><i>Aftermath. Bosnia's Long Road to Peace.</i> Photographs
by Sara Terry. Afterword by Lawrence Weschler. Channel
Photographics, New York, 2005. Designed by Linda
Johnson of Swell Design. Printed by Global PSD. Dutch
flexibound. 210 pp., 110 four-color illustrations, 8 x 10
$34.95
To learn more, visit <a href="http://www.bosniaaftermath.com" target="_blank">www.bosniaaftermath.com</a></font><br><br>
	<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=CN018"><strong>Order</strong></a> <i>Aftermath</i> by Sara Terry <br></p>
    </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




