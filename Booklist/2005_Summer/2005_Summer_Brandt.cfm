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


<FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333">

<!--- <cfinclude template="../include_menu.cfm">
<br><br> --->
<TABLE WIDTH="700"><TR>
<td colspan="3" align="center"> <font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>AFRICAN ELEGY<br>
</strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>Brandt&rsquo;s images of African animals defy easy classification.</strong></font></td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="400" valign="top" align="right">
      <p><img src="Brandt1.jpg" width="400" height="400">
	  <br><BR><img src="Brandt2.jpg" width="400" height="401"><br>
        <br>
		<cfoutput>
<cfset Catalog="CI165">
<cfset xImage = "#Catalog#b.jpg">
	<cfset xPath = "..\..\img\Bigillus">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Nick Brandt: On this Earth">
	<cfset xBorder="1">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=CI165"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a></cfoutput>
      </p>
      </TD>
   <td width="20">&nbsp;
  </td>
  <td width="480" valign="top">
    <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">  Fueled by a lifelong passion for animals, Nick Brandt abandoned his former career as soon as he took his first African safari. Four and one-half years, eight trips and thousands of miles later, Brandt offers his interpretations of the animal kingdom in an achingly poignant book entitled On This Earth. I suspect it will be the first of many. Former auction expert Julie Nelson-Gal has likened Brandt’s quest to that of Edward Curtis who sought to document the vanishing life of the North American Indians, though Brandt’s straightforward approach should not be equated with that of the romantic Curtis. <br>
          <br>
          These are neither documentary nor wildlife action photographs; nor are they anthropomorphized or Disney-ized views. Brandt believes that animals are sentient creatures and his approach is straightforward:  wait for the animals to present themselves on their own terms. He positions himself as close to the animals as is safe, assuming a low vantage point, because he believes the animals’ surroundings are an important element in many of his photographs. And just as one would not use a telephoto lens to make a great personal portrait, Brandt never uses such lenses to capture his wild subjects. This translates into hours spent scruffling in grasses or lying on the flat bed of a Land Rover, waiting for the animals to reveal themselves. Even though Brandt travels at all times with a knowledgeable guide, he has been treed by a hippo, kicked at by giraffes, and come within three feet of a dangerous lioness. <br>
          <br>
          Brandt understands the exhilaration of the chase, and the thrill of the moment when the perfect shot results in a great photograph. Once the animals are located, he knows which one or which group he wants to photograph. It is an intuitive rather than analytical choice, but for Brandt, the memorable photographs happen when a connection is established. It is very like a portrait photographer establishing a rapport with the sitter. Nick Brandt knows he cannot enter the sitter’s world, but he hopes that the chosen individual will reveal an aspect of his or her personality. The direct gaze of the lioness is but one proof of the success of his unique approach. <br>
          <br>
          Brandt translates this respect for these savannah dwellers into images that transcend easy classification. The male lion, seen in full profile, reminds one of a venerable grandfather, peering quietly into an unknowable future. The elegant cheetahs, poised as though in choreographed perfection, reveal both balletic grace and powerful strength. In a lavish and lush landscape, a large herd of hippos bathes in the bend of a sun-splashed river. It is perhaps as close a glimpse of a primeval landscape as one will ever see, when the earth was untouched and the animals held sway.
          <br>
          <br>
        This book is an elegy to a world of sentient beings who come from a distant past far beyond human history, but who are heading into a vanishing future.</font></p>
    <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">--Karen Sinsheimer</font></p>
    <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">On This Earth. Photographs from East Africa. Photographs by Nick Brandt. Foreword by Alice Sebold. Introduction by Jane Goodall. Chronicle Books, San Francisco, 2005. 132 pp., 67 duotones, 10 x 12. $40.00</font><br><br>
	<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=CI165"><strong>Order the Brandt Book</strong></a><br></p>
    <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">Exhibition at photo-eye Gallery July 8&ndash;September 10</font><br>
    </p>
    <p><a href="http://www.photoeye.com/nickbrandt" target="_blank"><u><strong>View</strong></u></a> Nick Brandt's Work in our online Gallery<br>
          <br>
          </p></TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




