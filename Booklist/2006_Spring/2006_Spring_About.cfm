<CFPARAM NAME="Season" DEFAULT="Spring">
<CFPARAM NAME="Year" DEFAULT="2006">

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
	
	<CFOUTPUT>#xHTMLTitle#</CFOUTPUT> <!--- <FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" style="font-size:30px" COLOR="##333333">
	 <strong>photo-eye Booklist</strong>
	</font> --->
	<BR><BR>
<FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333">

<cfset page="About">
<cfset xmenupath="../">
 <cfinclude template="../include_menu.cfm">
 <br /><br />


<TABLE WIDTH="700">

<tr><td colspan="3" ALIGN="CENTER"><font color="#333333" size="3" face="'Trebuchet MS', 'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>ABOUT OUR COVER</strong></FONT></td></tr>
<tr><td colspan="3" ALIGN="CENTER">&nbsp;</td></tr>
<TR>
 
 
    <td width="298" valign="top" align="right">
<cfoutput>
<cfset Catalog="AP503">
<cfset xImage = "Letinsky-COVER-IMAGE.jpg">
	<cfset xPath = "../../booklist/2006_Spring">
	<CFSET xHEIGHT = "300">
	<CFSET xWidth = "300">
	<cfinclude template="../../templates/imagesizer.cfm">  
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Art Photography Now">
	<cfset xBorder="1">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=AP503"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>

<cfset Catalog="AP503">
<cfset xImage = "artphotonowcover.jpg">
	<cfset xPath = "../../booklist/2006_Spring">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">	
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Art Photography Now">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=AP503"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a></cfoutput>
      </p>
  </TD>
   <td width="20">&nbsp;
  </td>
  <td width="480" valign="top">
    <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">
  <strong>Photography Fights Back. </strong> <br>
<I>Art Photography Now</I> surveys the situation. BY AVIS CARDELLA<br>
  <br>ART AND PHOTOGRAPHY HAVE BEEN
slugging it out now for almost as long as photography's
existence: Is photography art? Or is art just becoming
more photographic? Can photography be recognized as
an artistic medium on its own? Or is it still art's "humble
servant"? Remember what Marcel Duchamp wrote
in a letter to the photographer Alfred Stieglitz back in
1922: "You know exactly how I feel about photography.
I would like to see it make people despise painting until
something else will make photography unbearable."
It's difficult to say how many people in the latter part
of the twentieth century despised painting due to the
advent of photography, but it's easy to see just how many
artists took to incorporating photography into their
work. Today, in the early twenty-first century, writer and
curator Susan Bright contends that ". . . photography is
no longer a 'mortal enemy' or a 'humble servant' to art.
It is currently enjoying significant re-evaluation in terms
of its profile, acceptance and status."<br />
<br />
That in mind, the recently published Art Photography
Now (Aperture) affords Bright the chance to show off
some of photography’s burgeoning muscle. And that she
does brilliantly, selecting eighty of the top names in the
art photography world today including Tina Barney,
Cindy Sherman, Richard Misrach, Craig McDean,
Andreas Gursky, Nan Goldin, Gregory Crewdson, Joel
Sternfeld, Mario Testino, Laura Letinsky, Martin Parr
and Philip-Lorca diCorcia.<br />
<br />
Lest you feel this is too much of a "usual suspects"
line-up, Bright does manage to pepper this mix with less
"media darling" names such as the Russian collective
known as AES&F (Tatiana Arzamasova, Lev Evzovich,
Evgeny Svyatsky, and Vladimir Fridkes), Mexican artist
Gabriel Orozco and the young Latin American artist
Alexander Apostol.<br />
<br />
With an introduction that sets out the historical relationship
between art and photography since the early
nineteenth century and discusses the art world's embrace
of the medium in recent decades, Bright puts the work
of these contemporary artists in context. By dividing the
book into seven sections—City, Portrait, Document,
Object, Landscape, Fashion and Narrative—she successfully
delineates each artist’s forte.<br />
<br />
But the thing that prevents this survey from becoming
just another analysis of who’s doing what, is Bright's
use of the photographers' own words. More than half of
the text consists of quotations from the photographers
explaining either a particular body of work or the overall
approach to their photographic practice. To
encounter Luc Delahaye stating in his inviting opening
sentence "What you want is to be a poet," or Wolfgang
Tillmans provocatively expressing how he wants pictures
"to look the way I see things, which is not to be confused
with authenticity," or Larry Sultan, responding to the
nuances of the porn movie sets he has photographed,
saying, "I feel like a forensic photographer searching out
evidence in a crime scene. But what is the crime?" beats
the pants off any humdrum academic study.<br />
<br />
A single tome probably won't manage to end any
art/photography debates, but as a resource and up-todate
exposure to the state of photography today, Art
Photography Now hits the mark. At the very least, you,
like Mr. Duchamp, may come away knowing exactly
how you feel about photography.



<br />
<br>
      Art Photography Now. Edited with text by Susan
Bright. Aperture, New York, in association with Thames
& Hudson, London, 2005. Designed by Anna Perotti.
Printed by C&C Offset Printing Co, China. Clothbound
with photo-illustrated dustjacket. 224 pp., 250 color
illustrations, 9 x 11 $50.00
Image courtesy of Edwynn Houk Gallery, New York,
and Monique Meloche Gallery, Chicago.

</p>
	<BR />
	 <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=AP503"><strong>Order</strong></a> Art Photography Now.</TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




