<CFPARAM NAME="Season" DEFAULT="Fall">
<CFPARAM NAME="Year" DEFAULT="2007">

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

<tr><td colspan="3" ALIGN="CENTER"><p>&nbsp;</p>
        <p><font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>THE 
          OLD &amp; RARE SURVEY<br>
          <br>
          </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>Our 
          regular colums that surveys important books of the past.</strong></font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>BY 
          ERIC MILES<br>
          </strong></font></p>
        </td></tr>
<tr><td colspan="3" ALIGN="CENTER">&nbsp;</td></tr>
<TR>
 
 
    <td width="298" valign="top" align="right">
 <p>
	  <cfoutput>
	  <cfset xImage = "SUDEK.jpg">
	<cfset xPath = "../../booklist/2007_Fall">
	<CFSET xHEIGHT = "320">
	<CFSET xWidth = "320">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Sudek">
	<cfset xBorder="0">
            <a href="http://www.photoeye.com//auctions/Auction.cfm?id=3303"><img src="SUDEK.jpg"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="244" WIDTH="181"></a> 
            <br>
            <br>
</cfoutput>
		
      </p>
  </TD>
   <td width="20">&nbsp;
  </td>
      <td width="480" valign="top"> <p><em>EVERYTHING AROUND US, DEAD OR ALIVE, 
          in the eyes of a crazy photographer, mysteriously takes on many variations, 
          so that a seemingly dead object comes to life through light or by its 
          surroundings&#8230; To capture some of this &#8212;I suppose that&#8217;s 
          lyricism. &#8212;Josef Sudek</em>
        <p> A specter of Atget in the city of Kafka in a country successively 
          occupied by the Nazis and the Soviets, Josef Sudek embodied much of 
          the history of twentieth century Mitteleuropa modernism. His apotheosis 
          in the U.S., however, did not occur until he was already well into his 
          seventies. The two American solo exhibitions mounted in 1974&#8212;first 
          at the George Eastman House and then at the Light Gallery&#8212;came 
          at a time when photography was finding far greater institutional acceptance 
          (as well as a nascent market) than at any time in its history. To a 
          young, ambitious photographer in the mid-1970s Sudek would have seemed 
          the perfect archetype of the old-world romantic artist: a one-armed 
          Eastern European Bohemian, &#8220;reminiscent of one of the Baroque 
          figures on the Charles Bridge,&#8221; as Anna Farova once remarked, 
          schlepping his antique view camera around the streets of Prague. 
        <p> But Sudek was no solitary genius; he, like many of his contemporaries 
          rode the wave of photography&#8217;s popularity and a thriving illustrated-book 
          industry, publishing prolifically beginning in the late 20s and continuing 
          more or less to this day (though Sudek passed away in 1976). With over 
          50 publications to his credit, there is a trove of Sudek material that 
          can still be ferreted out by the ambitious collector. 
        <p>&#8230; 
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          Continue reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE032
		  "> ordering</a> the <br>
          current issue of <em>photo-eye Booklist</em>.</font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><a href="http://www.photoeye.com/booklist/subscribe.cfm" target="_blank">Subscribe</a> 
          to the <em>photo-eye Booklist.</em> </font></p>
        </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




