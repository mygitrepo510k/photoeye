<CFPARAM NAME="Season" DEFAULT="Summer">
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
      <td colspan="3" align="center"> <p><font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>California 
          Visions <br>
          </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>The 
          freewheeling spirituality of The Golden State<br>
          </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>is 
          presented in brilliant words and images. <br>
          </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>By 
          DARIUS HIMES <br>
          </strong></font></p>
        </td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="297" valign="top" align="right">
      <p>
	  <cfoutput>
<cfset Catalog="CI177">
<cfset xImage = "Visionary_State_salvation_m.jpg">
	<cfset xPath = "../../booklist/2006_Summer">
	<CFSET xHEIGHT = "400">
	<CFSET xWidth = "400">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="William Christenberry">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=CI177"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
		
		<cfset Catalog="CI177">
<cfset xImage = "Visionary_State_cover.jpg">
	<cfset xPath = "../../booklist/2006_Summer">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="William Christenberry">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=CI177"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>	
		
		</cfoutput>
		
      </p>
      </TD>
   <td width="13">&nbsp;
  </td>
      <td width="374" valign="top"> <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          WE&#8217;VE ALWAYS KNOWN that Californians are different from the rest 
          of us (so are Texans, but that&#8217;s another story). The Golden State, 
          whose motto has remained &#8220;Eureka!&#8221; since the gold rush of 
          1849, has given birth to everything from mountain biking to Isadora 
          Duncan, Richard Nixon to Hollywood, the frisbee, Barbie dolls and John 
          Steinbeck. It is also the land of widely divergent spirituality, from 
          Neopaganism to televangelism, UFO cults, heretical Catholics and Zen 
          practitioners&#8212;all of whom stake claims in the rich soil of California.</font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">Erik 
          Davis, a writer and prominent culture critic based in San Francisco, 
          was at lunch one day three years ago with Alan Rapp, an editor at Chronicle 
          Books that has admired his work for years, when he mentioned his project 
          on California spirituality. Erik had researched this project in part 
          by hitting the road, visiting sacred structures and landscapes, and 
          he realized that the stories of these places could best be told in collaboration 
          with a photographer. Davis mentioned the photographic angle and Rapp&#8217;s 
          ears perked up. Rapp, who has known photographer Michael Rauner and 
          followed his career for over ten years, ran into him shortly thereafter 
          in Santa Fe, where they were both attending Review Santa Fe, an annual 
          three-day conference for photographers and industry professionals held 
          in New Mexico, and discussed the project with him. Back in San Francisco, 
          Rapp put Rauner in touch with Davis. They quickly connected and began 
          to move forward with the larger project. </font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">
		Over the course of the next two years, Davis worked on text and Rauner generated 
          images, traveling across the state, sometimes together but more often 
          in parallel trips where place, research, and each other&#8217;s work 
          inspired and shaped the overall project. The Visionary State releases 
          this summer to a full slate of book signings, exhibitions and events. 
          What follows are excerpts from the introduction by Erik Davis, for whom 
          this represents his third title. This is Rauner&#8217;s first book.</font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">
		<i>The Visionary State</i>. A Journey through California&#8217;s Spiritual 
          Landscape. Text by Erik Davis. Photographs by Michael Rauner. Edited 
          by Alan Rapp. Chronicle Books, San Francisco, 2006. Designed by Shawn 
          Hazen. Printed in China. Edition of 12,500. Paper over boards with a 
          photoillustrated dustjacket. 272 pp., 164 color illustrations, 10 x 
          10 $40.00</font><br>
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><br>
          </font> <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">Continue 
          reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=pe027">ordering 
          the current issue</a> of <i>photo-eye Booklist</i>. </font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=CI177"><strong>Order</strong></a> 
          <i>The Visionary State,</i> by Erik Davis. <br>
          Photography Michael Rauner.</font> </p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          To see more of the project, visit <a href="http://www.visionarystate.com" target="_blank">www.visionarystate.com</a><br>
          </font> <br />
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a> 
          to the photo-eye Booklist<br>
          </font>
        </p></TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




