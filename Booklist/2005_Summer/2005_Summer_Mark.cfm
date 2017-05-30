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
	


<FONT FACE="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333">


<TABLE WIDTH="700"><TR>
<td colspan="3" align="center"> <font color="#333333" size="3" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong>THE HUMANIST TRADITION<br>
</strong></font><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong>Mary Ellen Mark discusses a life of documentary work.</strong></font></td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="357" valign="top" align="right">

<img src="Mark.jpg" width="357" height="354"><br><br>
<cfoutput>
<cfset Catalog="PI150">
<cfset xImage = "#Catalog#b.jpg">
	<cfset xPath = "..\..\img\Bigillus">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Mary Ellen Mark">
	<cfset xBorder="1">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PI150"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a></cfoutput></TD>
   
   <td width="20">&nbsp;
  </td>
  <td width="480" valign="top">
    <p><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif">  Mary Ellen Mark (American, b. 1942) has been one of documentary photography's staunchest proponents for close to three decades. Her work is informed and characterized by the great humanist tradition that traces its roots back through W. Eugene Smith and Cartier-Bresson to Dorothea Lange and Walker Evans, among others. <br>
        <br>
        I first met Mary Ellen Mark through her photographs. In particular, her in-depth story about the Damm family. The photographs are haunting and real. She brought the family and their world to life. The photographs speak without words.<br>
        <br>
        Phaidon has just published a massive retrospective on Mark&rsquo;s work, featuring 134 photographs and extensive notes on the images. It is a fitting tribute.<br>
        <br>
        Documentary photography has changed over the years. Its one constant, however, is that it still has the ability to give people a voice. With her work, Mary Ellen Mark has accomplished that time and again. <br>
        <br>
        What follows is an interview conducted in April, 2005 by photographer and professor Tony O&rsquo;Brien with Mary Ellen Mark about her new book...<br>--Tony O&rsquo;Brien<br><br>
<a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=PE023">Purchase Booklist to Read Entire Article</a><br>
<a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a>
<br>
<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PI150">Order the Book</a></font></p>
    </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




