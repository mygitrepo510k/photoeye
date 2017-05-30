<CFPARAM NAME="Season" DEFAULT="Fall">
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
	
		<cfset page="Article">
	<CFINCLUDE TEMPLATE="../../templates/Title.cfm">
	<CFOUTPUT>#xHTMLTitle#</CFOUTPUT>
	<BR><BR>


<FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333">

<cfset xmenupath="../">
 <cfinclude template="../include_menu.cfm">
 <br /><br />
 
<TABLE WIDTH="700"><TR>
      <td height="115" colspan="3" align="center"> <font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>ROUGH 
        BEAUTY <br>
        </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>
		Photographer Dave Anderson dusts off an unexpected beauty in<br>
        the dirt-poor town of Vidor, Texas.<br>
        With excerpts from the introduction BY ANNE WILKES TUCKER</strong></font></td>
    </tr>
    <tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="400" valign="top" align="right">
      <p>
	  <cfoutput>
<cfset Catalog="ZC925">
<cfset xImage = "Call-Dot-for-Shrimp-med.jpg">
	<cfset xPath = "../../booklist/2006_Winter">
	<CFSET xHEIGHT = "320">
	<CFSET xWidth = "320">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Rough Beauty">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=ZC925&CFID=4014026&CFTOKEN=57906120"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
		
		<cfset Catalog="ZC925">
<cfset xImage = "ZC925b.jpg">
	<cfset xPath = "../../booklist/2006_Winter">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Instant Light">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=ZC925&CFID=4014026&CFTOKEN=57906120"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>	
		
		</cfoutput>
		
      </p>
      </TD>
   <td width="20">&nbsp;
  </td>
      <td width="480" valign="top"> <p>WORKING IN A CLASSIC B&amp;W DOCUMENTARY 
          STYLE that emphasizes the act of listening to one&#8217;s subjects, 
          Dave Anderson has produced a body of lasting imagery from the vast, 
          poor stretches of East Texas. Below are excerpts from the introduction 
          to Rough Beauty by Anne Wilkes Tucker, curator of photography at the 
          Museum of Fine Arts, Houston.</p>
        <p>&#8220;Small towns are typically closed communities, outwardly friendly, 
          but suspicious of anyone who is not a resident. Carrying a camera escalates 
          those suspicions. Paparazzi journalism and &#8216;candid camera&#8217; 
          TV have also sensitized people to how easily a photographer can denigrate 
          and caricature his subjects. People want to know what is being photographed 
          and why. Most people would not use the word stereotype, but they understand 
          how they can be typecast with little sympathy or awareness for their 
          particular humanity. Thus, what Dave Anderson has accomplished in his 
          portrayal of the residents of a small East Texas town is all the more 
          remarkable, and attributable to his ability to put people at ease. How 
          else can we explain a man with a poster in his home that says &#8216;Shut 
          the Fuck UP!&#8217; letting Anderson make that engaging portrait that 
          exposes the subject&#8217;s melancholy rather than his bravado.</p>       
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">...</font></p>
        <p><em>Rough Beauty</em>. Photographs by Dave Anderson. Introduction and interview by Anne Wilkes Tucker. Dewi Lewis Publishing, Stockport, 2006. Designed by Shelli Winter and Dewi Lewis. Printed by EBS, Verona. Edition of 4000, with a limited edition of 50 copies. Photo-illustrated, paper-wrapped boards with printed dustjacket. 120 pp., 76 duotone illustrations, 10 x 10 $40.00<br>
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><br>
          </font> <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">Continue 
          reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE029"> 
          ordering</a> the <br>current issue of <i>photo-eye Booklist</i>. </font></p>
        
        <a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=ZC925&CFID=4014026&CFTOKEN=57906120">Order</a> 
        <i>Rough Beauty.</i><br>
        <br />
        <a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a> 
        to the <em>photo-eye Booklist.</em><br>
        </p>
    </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




