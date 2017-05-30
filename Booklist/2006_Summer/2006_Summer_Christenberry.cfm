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
	
		<cfset page="Article">
	<CFINCLUDE TEMPLATE="../../templates/Title.cfm">
	<CFOUTPUT>#xHTMLTitle#</CFOUTPUT>
	<BR><BR>


<FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333">

<cfset xmenupath="../">
 <cfinclude template="../include_menu.cfm">
 <br /><br />
 
<TABLE WIDTH="700"><TR>
      <td colspan="3" align="center"> <font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>LOOKING 
        SOUTH <br>
        </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>William 
        Christenberry has spent the better part of his life looking at, <br>
        thinking about and creating artworks that reflect his roots in the American 
        South.<br />
        BY DENISE WOLFF</strong></font></td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="400" valign="top" align="right">
      <p>
	  <cfoutput>
<cfset Catalog="DP356">
<cfset xImage = "CHRISTENBERRY-grid.jpg">
	<cfset xPath = "../../booklist/2006_Summer">
	<CFSET xHEIGHT = "400">
	<CFSET xWidth = "400">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="William Christenberry">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP356"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
		
		<cfset Catalog="DP356">
<cfset xImage = "Cover-Christenberry.jpg">
	<cfset xPath = "../../booklist/2006_Summer">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="William Christenberry">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP356"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>	
		
		</cfoutput>
		
      </p>
      </TD>
   <td width="20">&nbsp;
  </td>
      <td width="480" valign="top"> <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          WALKER EVANS REMARKED that his friend and prot&eacute;g&eacute; William 
          Christenberry &#8220;knew where to stand&#8221; with the camera. Perhaps 
          more akin to the perspective of writer James Agee than to that of Evans, 
          Christenberry&#8217;s stance is highly subjective and firmly planted 
          in the red soil of the South. His art chronicles a lifelong engagement 
          with his native Alabama and recounts a story that&#8217;s still unfolding&#8212;of 
          aged buildings, weathered signs and the changing face of the landscape. 
          Photography is not only a &#8220;perfect extension of his eye&#8221; 
          (as Evans has also said), but also an extension of his memory. </font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          In a seemingly simple poem about eating a peach, Li-Young Lee writes: 
          </font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
		  <i>From blossoms comes<br>
          this brown paper bag of peaches<br>
          we bought from the boy<br>
          at the bend in the road where we turned toward<br>
          signs painted</i> Peaches.<br>
          ...<br>
          <i>O, to take what we love inside,<br>
          to carry within us an orchard, to eat<br>
          not only the skin, but the shade,<br>
          not only the sugar, but the days...</i></font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          Just as Lee insists that he takes in the memory of the land, as well 
          as the seasons with the peach, so too do Christenberry&#8217;s images 
          insistently contain not only what&#8217;s depicted&#8212;be it a sign 
          or a his boyhood home&#8212;but the days and journeys in the South that 
          have sowed his paintings, drawings and sculptures and continually feed 
          his memory and art. Emily Dickinson wrote in a letter poem, &#8220;Show 
          me / Eternity and, / I will show / you Memory.&#8221; With a kind of 
          visual poetry, Christenberry shows us that through time&#8217;s passage 
          both the landscape and the human imagination endure, that memory, like 
          the peach, paradoxically contains something larger than itself.</font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          Christenberry&#8217;s is not a sentimental story, but one of violent 
          transformation, open endings and an almost relentless beauty. Surrounded 
          by his art and many of the road signs found in his photographs, we met 
          recently in his Washington, D.C., studio to discuss these ideas as he 
          prepared for the upcoming Smithsonian American Art Museum and Aperture 
          exhibitions, which his new monograph accompanies.</font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">
		  <i>William Christenberry</i>. Foreword by Elizabeth Broun. Essays by Walter Hopps, 
          Andy Grundberg and Howard N. Fox. Edited by Michael Famighetti. Aperture, 
          New York, 2006. Designed by Francesca Richer. Printed in Italy. Paperwrapped 
          boards with photo-illustrated dustjacket. 204 pp., 160 color illustrations, 
          12 x 10 $50.00</font><br>
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><br>
          Continue reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=pe027">ordering 
          the current issue</a> of <i>photo-eye Booklist</i>. </font></p>
        <!---   <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">--Karen Sinsheimer</font></p> --->
        <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP356"><strong>Order</strong></a> 
        <i>William Christenberry.</i><br>
        <br />
	<a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a> to the photo-eye Booklist<br></p>
    </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




