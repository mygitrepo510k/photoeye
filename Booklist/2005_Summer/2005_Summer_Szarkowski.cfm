<CFPARAM NAME="Season" DEFAULT="Spring">
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


<FONT FACE="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333">

<TABLE WIDTH="700"><TR>
<td colspan="3" align="center"> <font color="#333333" size="3" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong>A CONVERSATION WITH JOHN SZARKOWSKI<br>
</strong></font><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong> An interrupted career is put back on track. </strong></font></td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="400" valign="top" align="right">
<img src="Szarkowski.jpg" width="400" height="501"><br><br>
<cfoutput>
<cfset Catalog="BF200">
<cfset xImage = "#Catalog#b.jpg">
	<cfset xPath = "..\..\img\Bigillus">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="John Szarkowski">
	<cfset xBorder="1">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=BF200"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a></cfoutput> </TD>
   <td width="20">&nbsp;
  </td>
  <td width="480" valign="top">
    <p><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif">  John Szarkowski is fond of saying lately that in his career as a photographer he has enjoyed an early and a late period but no middle. Before the age of thirty-five he had distinguished himself with the publication of two well-reviewed books: The Idea of Louis Sullivan (1956; reissued 2000) and The Face of Minnesota, a New York Times bestseller for several weeks after it appeared in 1958. 
	... <br>--Richard Woodward<br><br>
   <font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif">
<a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=PE023">Purchase Booklist to Read Entire Article</a><br>
<a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a>
		 
<br>
<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=BF200">Order the Szarkowski Book</a><br>

	  </font>
        </p></TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




