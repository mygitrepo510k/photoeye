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


<FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333">

<!--- <cfinclude template="../include_menu.cfm">
<br><br> --->
<TABLE WIDTH="700"><TR>
<td colspan="3" align="center"> <font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>FRIED WATERS<br>
</strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>A photographic study of an ancient Yucatecan salt harvesting technique is the vehicle for a discussion of fluctuation and change. AN INTERVIEW WITH EDUARDO DEL VALLE AND MIRTA GOMEZ BY MARK HAWORTH-BOOTH.</strong></font></td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="400" valign="top" align="right">
      <p>
	  <cfoutput>
<cfset Catalog="TR179">
<cfset xImage = "FriedWaters2.jpg">
	<cfset xPath = "../../booklist/2005_Winter">
	<CFSET xHEIGHT = "400">
	<CFSET xWidth = "400">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Fried Waters">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=TR179"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
		
		<cfset Catalog="TR179">
<cfset xImage = "FriedWaters3.jpg">
	<cfset xPath = "../../booklist/2005_Winter">
	<CFSET xHEIGHT = "400">
	<CFSET xWidth = "400">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Fried Waters">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=TR179"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
		</cfoutput>
		
		<cfoutput>
<cfset Catalog="TR179">
<cfset xImage = "FriedWatersCover.jpg">
	<cfset xPath = "../../booklist/2005_Winter">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Fried Waters">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=TR179"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a></cfoutput>
      </p>
      </TD>
   <td width="20">&nbsp;
  </td>
  <td width="480" valign="top">
    <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">  The Cuban-born husband-and-wife team of Eduardo del Valle and Mirta Gómez has worked collaboratively for 30
years, receiving international acclaim for their color photographs of
subjects that are generally in a state of flux. Their first book featured
photographs of vernacular architecture in the Yucatán, a place they
have been regularly visiting and photographing for many years.
In their second monograph, Fried Waters, also published by Nazraeli
Press, they present images of two separate salt-harvesting lagoons on
the Yucatán Peninsula, in southern Mexico. Salt harvesting in this area
has been engaged in since prior to the Spanish Conquest. The practice
is marked by patience in a process by which mineral-rich water slowly
evaporates, leaving behind quantities of salt.
<br />In November of 2004, as this body of work was being prepared for
publication, Mark Haworth-Booth, who had been charged with writing
an introduction to the work, exchanged a series of emails with the
artists, asking them about their working methods and this project. The
transcription of that exchange is reproduced here.

<br><br />
Continue reading this interview by <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=pe025">ordering the current issue</a> of photo-eye Booklist. 

          </font></p>
 <!---   <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">--Karen Sinsheimer</font></p> --->
    <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><i>Fried Waters. Photographs by Eduardo del Valle and Mirta Gómez.</i>
Introduction by Mark Haworth-Booth. Nazraeli Press, Tucson, 2005. Printed in
China. Edition of 1,000 casebound copies, each with an original photograph,
printed by the artists, on the front cover. 96 pp., 42 color illustrations, 15 x 13
$75.00<br />
<br />

	<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=TR179"><strong>Order</strong></a> <i>Fried Waters</i> by Eduardo del Valle and Mirta Gómez. <br>
	<br />A limited edition of 25 copies with an additional 11 x 14-inch photograph,
printed, numbered and signed by the artists and presented in a clamshell box,
is also available. $750.00
</p>
    </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




