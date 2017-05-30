<CFPARAM NAME="Season" DEFAULT="Spring">
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

<tr>
      <td height="125" colspan="3" ALIGN="CENTER"> 
        <p><font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>EDITOR'S 
          CHOICE <br>
          <br>
          </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>Each 
          season yields scores of books worthy of note. <br>
          Our editor, DARIUS HIMES, chooses one title from among the many<BR> that stands
          head-and-shoulders
          above others.<br>
          <br>
          <br>
          </strong></font></p>
        </td></tr>
<tr><td colspan="3" ALIGN="CENTER">&nbsp;</td></tr>
<TR>
 
 
    <td width="298" valign="top" align="right">
 <p>
	  <cfoutput>
	  <cfset xImage = "SHORE_big.jpg">
	<cfset xPath = "../../booklist/2007_Summer">
	<CFSET xHEIGHT = "320">
	<CFSET xWidth = "320">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Editor's Choice">
	<cfset xBorder="0">

	<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PI189"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a>
	<br><br>
</cfoutput>
		
      </p>
  </TD>
   <td width="20">&nbsp;
  </td>
      <td width="480" valign="top"> <p>I WANT TO THANK STEPHEN SHORE. <BR>
          And then, I want to thank Phaidon. The reason? For bringing back into 
          print the invaluable book, <em>The Nature of Photographs</em>. This 
          is far and away my favorite book of the season. I dare say I&#8217;d 
          like to make it required reading for all students and would-be serious 
          photographers. I don&#8217;t really make many requirements for the readers 
          of this magazine, but I might have to change that policy in this case. 
          <br>
          <br>
          <em>The Nature of Photographs</em> contains, essentially, Shore&#8217;s 
          lecture notes for a class that he teaches to incoming freshmen at Bard 
          College. The course? How to read photographs. It&#8217;s not the content 
          of photographs&#8212;what we generally call &#8220;subject matter&#8221;&#8212;so 
          much, that Shore is concerned with, but rather the underpinnings of 
          what he calls &#8220;photographic seeing.&#8221;
        <p>&#8230; 
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          Continue reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE031
		  "> ordering</a> the <br>
          current issue of <em>photo-eye Booklist</em>.</font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a> 
          to the <em>photo-eye Booklist.</em> </font></p>
        </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




