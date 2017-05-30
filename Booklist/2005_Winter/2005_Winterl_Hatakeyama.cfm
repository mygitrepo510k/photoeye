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
<td colspan="3" align="center"> <font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>RAW MATERIALS TRANSFORMED<br>
</strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>The critically acclaimed Japanese photographer Naoya Hatakeyama enjoys his first one-man U.S. show in the light-filled galleries of the College of Santa Fe. By YASUFUMI NAKAMORI
</strong></font></td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="400" valign="top" align="right">
      <p>
	  <cfoutput>
<cfset Catalog="AP505">
<cfset xImage = "HOSOE1.jpg">
	<cfset xPath = "img">
	<CFSET xHEIGHT = "400">
	<CFSET xWidth = "400">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Eikoh Hosoe: Kamaitachi ">
	<cfset xBorder="1">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=AP505"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
		
		<cfset Catalog="AP505">
<cfset xImage = "HOSOE2.jpg">
	<cfset xPath = "img">
	<CFSET xHEIGHT = "400">
	<CFSET xWidth = "400">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Eikoh Hosoe: Kamaitachi">
	<cfset xBorder="1">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=AP505"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
		</cfoutput>
		
		<cfoutput>
<cfset Catalog="AP505">
<cfset xImage = "#Catalog#b.jpg">
	<cfset xPath = "..\..\img\Bigillus">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Eikoh Hosoe: Kamaitachi">
	<cfset xBorder="1">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=AP505"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a></cfoutput>
      </p>
      </TD>
   <td width="20">&nbsp;
  </td>
  <td width="480" valign="top">
    <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">  On September 30, 2005, an exhibition entitled Tokyo, A City of Light: Photographs by Naoya Hatakeyama opened in the Atrium Gallery of the Marion
Center for Photographic Arts on the campus of the College of
Santa Fe. Surprisingly, this is the first solo exhibition in the
United States for one of Japan’s leading art photographers. It
affords us the opportunity to both discuss his work and survey
the numerous books that he has produced over the course of
25 years of image-making.

<BR /><BR />
Hatakeyama (b. 1958, Iwate, Japan), a tall, slender man
with close-cropped black hair and fluid, elegant hands, has said
that his photographic practice has been “like kicking a stone
from place to place. The most exciting thing is to find the next
picture I want to take.”

<BR /><BR />
The stone that Hatakeyama has been kicking around has led
him from the limestone quarries of Okinawa and Hokkaido
and the cement factories that process the stone, to the tops of
Tokyo’s skyscrapers and the bowels of her buried river system.
Curated by Yasufumi Nakamori, the show takes for its theme
the vastness of Tokyo—a subject that is an ongoing source of
attraction and fascination for Hatakeyama. Nakamori’s accompanying
essay—which is excerpted here—insightfully discusses
the photographer’s approach to his art. At the end of this article
is select bibliography on the photographer.


Continue reading this interview by <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=pe025">ordering the current issue</a> of photo-eye Booklist. 

          </font></p>
 <!---   <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">--Karen Sinsheimer</font></p> --->
    <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><!---<i>Kamaitachi. </i> Photographs by Eikoh Hosoe, Dance by Tatsumi Hijikata,
Preface by Shuzo Takiguchi, Poem by Toyoichiro Miyoshi, Book design
by Ikko Tanaka. 37 x 30 cm, Tri-tone, 42 gatefold sheets, Silk-screen cloth
cover, with acetate jacket, with exterior case. All copies are signed and
numbered by the photographer. The reproduction edition is limited to
1000 copies (with 25 AP copies) co-published by the Aperture
Foundation, New York, and Seigensha Art Publishing, Kyoto. The principal
difference between the 500 copies of the Japanese edition and the
500 copies of the US edition is the exterior design. For the Aperture
edition,
the original slipcase designed by Ikko Tanaka was replaced with a
deluxe clamshell box newly designed by Tadanori Yokoo and printed in
five colors. $350.00</font><br><br>--->
	<a href="http://www.photoeye.com/templates/mSearchResults.cfm?Subject=Hatakeyama"><strong>Browse</strong></a> <i>Hatakeyama's Books</i><br></p>
    </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




