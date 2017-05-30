<CFPARAM NAME="Season" DEFAULT="Winter">
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
<td colspan="3" align="center"> <font color="#333333" size="3" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong>PUBLISHING THE PHOTOGRAPHY BOOK<br>
</strong></font><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong>The acclaimed column on publishing photography books. BY MARY VIRGINIA SWANSON AND DARIUS HIMES
</strong></font></td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="200" valign="top" align="right">
	<cfoutput>
<cfset xImage = "steidl-1.jpg">
	<cfset xPath = "../../booklist/2005_Winter">
	<CFSET xHEIGHT = "400">
	<CFSET xWidth = "400">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Robert Frank on Press at Steidl Verlag">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=pk906"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><font size="1" color="##333333" face="Arial, Helvetica, sans-serif">Robert Frank on press at Steidl Verlag</font><br><br />
		
<cfset xImage = "steidl-2.jpg">
	<cfset xPath = "../../booklist/2005_Winter">
	<CFSET xHEIGHT = "400">
	<CFSET xWidth = "400">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Steidl Verlag">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP006"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br></cfoutput>
		
</TD>
   <td width="20">&nbsp;
  </td>
  <td width="480" valign="top">
    <p><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"> IN THIS CONTINUATION of the last installment (Fall 2005),
Mary Virginia Swanson and our editor Darius Himes continue to
explore the ins and outs of the pre-press and on-press stage of
publishing a photobook.
<br /><br />

In order to think through all of the pre-press and on-press issues,
we gathered together a constellation of notable figures in the field,
ranging from photographers and publishers to book designers and
printers, asking them to share with us their insights and experiences.
<br /><br />

The preceding article featured thoughts from the following people:
Donna Wingate, Director of Publications and Publisher Services
at D.A.P. / Distributed Art Publishers, an art-book distributor and
publisher, based in New York City; Frish Brandt, Co-director of
Fraenkel Gallery in San Francisco; Jack Woody, founder of
Twelvetrees Press and Twin Palms Publishers and Axel Ziegler,
Production Manager for Twin Palms; and Mark Klett, a photographer
and a faculty member of the Herberger School of Art at Arizona
State University, Tempe.
<br /><br />

We will hear from three distinct voices in this installment. David
Chickey is a designer and partner in Skolkin + Chickey design firm.
Warren Bingham is the CEO of the legendary Stinehour Press based
in Lunenberg, Vermont. Chuck Gershwin was the production manager
at Aperture for several years and has worked for some of
America's best printers. He currently works for Oddi Printing in
Iceland. And we will hear again from Mona Kuhn, a photographer
who presently teaches at Art Center in Pasadena and lives in the Los
Angeles area. Her first major monograph was published by Steidl
Verlag in 2004.
<br /><br />


 <br>
--Mary Virginia Swanson and Darius Himes<BR><BR>
<a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=pe025">Purchase Booklist to Read Entire Article</a><br>
<a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a> <br>

    </font></p>
    </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




