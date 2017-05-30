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
<td colspan="3" align="center"> <font color="#333333" size="3" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong>THE SIMPLE PLEASURE OF SEEING<br>
</strong></font><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong>Visual perception in the work of Uta Barth and Jim Campbell. </strong></font></td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
      <td width="400" valign="top" align="right">
        <p><img src="Site.jpg" width="400" height="320"><br>
            <font color="#333333" size="1" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif">Church on Fifth Avenue, 2001<br>
  Custom electronics, 768 LEDs, treated plexiglass, 29 x 22x 6.5 inches.<br>
  Courtesy of the Jim Campbell and Hosfelt Gallery, San Francisco,<br>
  California and Made with the financial assistance of The Daniel<br>
  Langlois Foundation for Art, Science and Technology<br>
          </font><br><br>
		<cfoutput>
<cfset Catalog="PI143">
<cfset xImage = "#Catalog#b.jpg">
	<cfset xPath = "..\..\img\Bigillus">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Uta Barth">
	<cfset xBorder="1">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PI143"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a></cfoutput></p>
        </TD>
   <td width="20">&nbsp;
  </td>
  <td width="480" valign="top">
    <p><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif">  Jim Campbell and Uta Barth&mdash; who shared adjacent galleries in SITE Santa Fe&rsquo;s Spring exhibit&mdash;come from different backgrounds and use different approaches, but their shared concern for the subtleties of visual perception makes it fitting that they be seen together. Uta Barth uses the camera to explore the complexities of perception&mdash;what we see, how we interpret what we see, and why the mind chooses to remember certain images. Jim Campbell&rsquo;s work displays technological savvy in its seamless incorporation of custom electronics, but technology is merely a tool to express his uniquely artistic concerns about the limits of vision, time, and memory. ... <br>
<BR>
--Christine Chin 
<br><br><a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=PE023">Purchase Booklist to Read Entire Article</a><br>
<a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a><br>
<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PI143">Order the Barth Book</a><br>
<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=zc521">Order the Campbell Book</a></font></p>
    </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




