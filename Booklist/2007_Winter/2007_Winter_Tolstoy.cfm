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


<FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333">

<cfset xmenupath="../">
 <cfinclude template="../include_menu.cfm">
 <br /><br />
 
  <TABLE WIDTH="700">
    <TR> 
      <td colspan="3" align="center"> <p><font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>A 
          BRIEF CONVERSATION WITH LEAH BENDAVID-VAL<br>
          <br>
          </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>Countess 
          Sophia Tolstoy was a diligent editor of her husband’s most famous works. 
          She was also an attentive photographic documentarian of their life at 
          Vasnaya Polyana, the fabled Tolstoy estate outside Moscow. </strong></font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>Interview 
          with editor and author LEAH BENDAVID-VAL by DARIUS HIMES</strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong><br />
          </strong></font></p>
        </td>
    </tr>
    <tr> 
      <td colspan="3">&nbsp; </td>
    </tr>
      <td width="400" valign="top" align="right"> <p> <cfoutput> 
    
            <br>
            <cfset xImage = "Sophia_Portrait.jpg">
            <cfset xPath = "../../booklist/2007_Winter">
            <CFSET xHEIGHT = "320">
            <CFSET xWidth = "320">
            <cfinclude template="../../templates/imagesizer.cfm">
            <CFSET xCoverHeight = imagecr.height>
            <CFSET xCoverWidth = imagecr.width>
            <cfset xTitle2x="Sophia_Portrait">
            <cfset xBorder="0">
            <!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
            <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP748"> <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=NA020"> 
            <img src="Sophia_portrait.jpg"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="456" WIDTH="320"></a> 
            <br>
                </cfoutput> </p></TD>
    <td width="20">&nbsp; </td>
      <td width="480" valign="top"> <p>A BRIEF CONVERSATION WITH LEAH BENDAVID-VAL</p>
        <p><br>
          <strong>Darius Himes:</strong> How did the project begin, Leah? What 
          was the state of Countess Sophia&#8217;s photographs and diaries when 
          you began looking at them?<br>
          <strong><font color="#660033">Leah Bendavid-Val:</font></strong> Most 
          of Sophia&#8217;s photographs are kept in candy boxes and envelopes 
          in no particular order in the archive of the State Museum of Leo Tolstoy 
          in Moscow. They&#8217;re stacked on shelves, and even on window sills, 
          in a room that isn&#8217;t climate controlled. This sad state of affairs 
          is due in part to lack of funds, a plight common to most historical 
          photo archives throughout Russia. But Sophia&#8217;s photographs are 
          further diminished because Tolstoy scholars consider them minor documents 
          among the huge quantity of material accumulated for the purpose of studying 
          the work of Tolstoy, Russia&#8217;s most revered genius. I first heard 
          about Sophia&#8217;s photographs from Sam Abell, who had seen some of 
          them while working on a <em>National Geographic</em> magazine story 
          about Leo Tolstoy published in 1983, but I wasn&#8217;t interested at 
          the time. Several years later I read a 1981 biography of Sophia by Anne 
          Edwards, which had the effect of making her seem worthy of attention. 
          Edwards mentioned the photographs and I remembered Sam remarking on 
          them. I stumbled on an English translation of Sophia&#8217;s voluminous 
          diaries done by Cathy Porter in 1985. This finally hooked me. After 
          months of negotiation with the director of the Tolstoy Museum, I traveled 
          to Russia to visit the Tolstoy archive, in Summer 2003, but when I arrived 
          I was only permitted to see as handful of pictures. This costly and 
          painful experience, I realized later, was due in part because the Russians 
          were uncomfortable with the state of their archive. No foreigners were 
          ever allowed in. After my failed trip in 2003 it took an entire year, 
          with extremely generous help from Russian friends I&#8217;ve worked 
          with since 1987 (along with a hefty research fee paid by me) to finally 
          get access.</p>
        <p>&#8230; 
        <p><em>Song Without Words: The Photographs &amp; Diaries of Countess Sophia 
          Tolstoy</em>. Photographs by Sophia Tolstoy. Text by Leah Bendavid-Val. 
          Foreword by Vladimir Tolstoy. National Geographic, Washington, D.C., 
          2007. Hardbound with printed dustjacket. 240 pp., 180 color illustrations, 
          9 &times; 10 $35.00</p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">Continue 
          reading this interview by <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE033
		 ">ordering</a> the current issue of <i>photo-eye Booklist</i>. </font><br>
          <br>
          <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=NA020">Order</a> 
          <em>Song Without Words</em> </TD>
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




