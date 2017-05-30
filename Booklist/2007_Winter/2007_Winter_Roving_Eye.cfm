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
	
		<cfset page="Article">
	<CFINCLUDE TEMPLATE="../../templates/Title.cfm">
	<CFOUTPUT>#xHTMLTitle#</CFOUTPUT>
	<BR><BR>
	
<cfset xmenupath="../">
 <cfinclude template="../include_menu.cfm">
 <br /><br />

<FONT FACE="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333">

<TABLE WIDTH="700">
    <TR> 
      <td colspan="3" align="center"><p><font color="#333333" size="3" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong>BOOK 
          ’EM</strong></font>         
        <p><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong> 
          At Arles, and other photo fairs across Europe, books are hot! </strong></font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong>BY 
          AVIS CARDELLA</strong></font></p>
        </td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="200" valign="top" align="right">
<cfoutput>

<cfset xImage = "Arles_1.jpg">
	<cfset xPath = "../../booklist/2007_Winter">
	<CFSET xHEIGHT = "320">
	<CFSET xWidth = "320">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Arles_1">
	<cfset xBorder="0">
          <img src="Arles_1.jpg"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="213" WIDTH="320"></a> 
          <br>
          <br>
          <br>
        </cfoutput> </p></TD>
    <td width="20">&nbsp; </td>
      <td width="480" valign="top"> <p>THE PHOTOBOOK AS AN ART FORM in its own 
          right&#8212; it&#8217;s a concept that&#8217;s been steadily gathering 
          force. Photography collectors are not only being seduced by large-scale 
          prints they can hang on their walls, they&#8217;re gobbling up tomes 
          to stack on their shelves. In response to the flurry of interest, publishers 
          are putting out more exquisitely rendered, beautifully printed monographs, 
          while vintage first editions are garnering top dollar at auction.</p>
        <p> But if evidence of the growing popularity of these bound and printed 
          gems is apparent anywhere, it has been at some of the photography fairs 
          taking place across Europe. Publishers are clamoring to exhibit and 
          book aisles are crammed with elbowpoking enthusiasts.</p>
        <p> In May of this year, photo-London (now in its fourth edition and recently 
          reconfigured to focus exclusively on photography from 1970 to the present) 
          featured numerous book signings along with a panel discussion on the 
          subject of photography books and the future of publishing. This month, 
          the 2007 edition of Paris Photo will feature 22 publishers on its roster, 
          including names from a wide spectrum of locals, such as Bologna, Italy&#8217;s 
          Damiani Editore, London-based Simon Finch Rare Books, East Hampton, 
          New York&#8211;based Harper&#8217;s Books.</p>
        <p> Earlier this year at the 38th edition of France&#8217;s long-standing 
          and internationally trafficked Rencontres d&#8217;Arles festival, photobooks 
          didn&#8217;t necessarily steal the show, but they sure made their presence 
          felt&#8212;a little like Cinderella at the ball, everyone was talking 
          about them.</p>
        <p>&#8230;</p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">Continue 
          reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE033
		 ">ordering</a> the<br>
          current issue of <i>photo-eye Booklist</i>. </font><br>
          <br>
        </p>
        </p>
      </TD>
    </TR>
    <tr>
      <td valign="top" align="right">&nbsp;</TD>
      <td>&nbsp;</td>
      <td valign="top">&nbsp;</TD>
    </TR>
  </TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




