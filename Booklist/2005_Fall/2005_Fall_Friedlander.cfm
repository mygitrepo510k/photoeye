<CFPARAM NAME="Season" DEFAULT="Fall">
<CFPARAM NAME="Year" DEFAULT="2005">
<CFPARAM NAME="Catnum" DEFAULT="DP140">
<CFPARAM NAME="xBookTitle" DEFAULT="Friedlander">
<CFPARAM NAME="xBookListCatnum" DEFAULT="PE024">

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


<FONT FACE="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333">

<TABLE WIDTH="700"><TR>
<td colspan="3" align="center"> <font color="#333333" size="3" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong>
FRIEDLANDER'S BOOKS<br>
</strong></font><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong> The retrospective exhibition at MoMA only confirms what we already knew. Lee
Friedlander loves books.<br /> By ROBERT STEVENS </strong></font></td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="400" valign="top" align="right">
		<cfoutput>
<cfset Catalog="#catnum#">
<cfset xImage = "Las_Vegas_Friedlander.jpg">
	<cfset xPath = "img">
	<CFSET xHEIGHT = "400">
	<CFSET xWidth = "400">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="#xBookTitle#">
	<cfset xBorder="1">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=#catnum#"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
		
<cfset Catalog="#catnum#">
<cfset xImage = "#Catalog#b.jpg">
	<cfset xPath = "..\..\img\Bigillus">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="#xBookTitle#">
	<cfset xBorder="1">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=#catnum#"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a></cfoutput> </TD>
   <td width="20">&nbsp;
  </td>
  <td width="480" valign="top">
   <p><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif">Having long been a fan of Lee Friedlander's
wry observations of people and places, I eagerly looked forward to the
retrospective exhibition of his work that opened this June at The
Museum of Modern Art and which was organized by head photography
curator Peter Galassi. What struck me upon entering the massive exhibition,
which numbers around 500 prints, was an oddly curious wall label.
It announced: “Self Portrait, Published 1970.” What was the word
“Published” doing here so prominently in an exhibition of photographs?
The answer lay in front of me. There, in one of many display cases scattered
throughout the show, was a copy of Friedlander’s book Self Portrait
(along with the limited edition version of the same). The discovery that
books were a large part in this exhibition was truly exciting.
	... <br>--Robert Stevens<br><br>
	<em>Friedlander.</em> Photographs by Lee Friedlander. Essay by Peter
Galassi. Foreword by Glenn D. Lowry. Afterword by Richard Benson.
Edited by David Frankel. Published by The Museum of Modern Art,
New York, 2005. Designed by Katy Homans. Printed by Oceanic
Graphic Printing. Clothbound with photo-illustrated dustjacket. 480
pp., 48 color illustrations and 812 duotones, 11 x 12 $75.00<br /><br />
   <font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><cfoutput>
<a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=#xBookListCatnum#">Purchase Booklist to Read Entire Article</a><br>
<a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a>
		 
<br>
<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=#catnum#">Order Friedlander</a><br>
</cfoutput>
	  </font>
        </p></TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




