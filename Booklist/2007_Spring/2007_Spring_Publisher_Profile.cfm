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
	
	<cfset page="Article">
	<CFINCLUDE TEMPLATE="../../templates/Title.cfm">
	<CFOUTPUT>#xHTMLTitle#</CFOUTPUT>
	<BR><BR>


<FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333">

<cfset xmenupath="../">
 <cfinclude template="../include_menu.cfm">
<br><br> 
<TABLE WIDTH="700"><TR>
      <td colspan="3" align="center"> <p><font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>PUBLISHER 
          PROFILE: Journal<br>
          </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>A 
          new column surveys the field of publishers&#8212;one by one&#8212;that 
          create the books we love.</strong></font></p>
        </td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="400" valign="top" align="right">
 <p>
	  <cfoutput>

<cfset xImage = "JOURNAL.jpg">
	<cfset xPath = "../../booklist/2007_Spring">
	<CFSET xHEIGHT = "320">
	<CFSET xWidth = "320">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Journal">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
            <br>
            <br>
		</cfoutput>
		
      </p>
      </TD>
   <td width="20">&nbsp;
  </td>
      <td width="480" valign="top"> <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          photographers and publishers form the X and Y axes upon which great 
          photobooks are crafted. This column explores the vast continuum of publishers 
          that exist in the world today, from small art presses to mid-size publishers 
          to the large houses that have survived the decades. In this issue we 
          spoke with G&ouml;sta Fleming, the director of Journal, a publishing 
          house which he founded in 1991, and which is based in Stockholm, Sweden 
          </font></p>
        <p>What is your vision of photography and publishing?<br>
          Once hooked&#8230; </p>
        <p>Who do you see as your audience?<br>
          All interested. </p>
        <p>What quantity of books do you publish per year/season?<br>
          3-6/year. </p>
        <p>What was the first book you published? <br>
          The first book was a Swedish edition of Fred Ritchin&#8217;s <i>In Our 
          Own Image</i> (Swedish title: <i>Bildens f&ouml;r&auml;ndrade v&auml;rld</i>). 
        </p>
        <p>How many books have you published to date? <br>
          Approximately 50 books have been published. Most of them are bilingual 
          Swedish and English or published in separate Swedish and English editions. 
          Among the published photographers are Lars Tunbj&ouml;rk, Hans Strand, 
          Anders Petersen, Tina Enghoff, Kent Klich, Jens Olof Lasthein, Ewa Stackelberg, 
          Anders Kris&aacute;r, Joakim Eneroth, Nina Korhonen, JH Engstr&ouml;m, 
          Wendy Sue Lamm, Johan Lundberg, Bj&ouml;rn Larsson, Anna Clar&eacute;n, 
          Thomas W&aring;gstr&ouml;m, Bj&ouml;rn Abelin, Helena P&aring;ls.</p>
        <p>How do you acquire new titles? <br>
          By looking.</p>
        <p>What future projects really excite you right now?<br>
          Among others a history of the photo booth by Birna Marianne Kleivan 
          and a series of portraits by Anders Petersen.</p>
        <p>What other things are you involved with in the photography community?<br>
          Beside my role as publisher/editor I am editor-in-chief for <i>f/Fotografisk 
          tidskrift</i> (a magazine published by the association for professional 
          photographer&#8217;s in Sweden). Right now I am finishing a book project 
          that I have been working on for many years, entitled <i>Centennium, fotografi 
          Sverige, del 1: 1895&#8211;1974</i> (<i>Centennium, photography in Sweden, 
          part 1: 1895&#8211;1974</i>). Recently, I wrote the text for <i>In Memory of 
          Himself, Christer Str&ouml;mholm in the eyes of his beholders</i> (Steidl 
          2006).</p>
        <p>What are your submission guidelines?<br>
          Directly to my heart. <br>
          I&#8217;m fully booked for the next 2-3 years.</p>
        <p>Contact Information: <br>
          www.journal-photobooks.se (open soon&#8230;)</p>
                <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">To 
          see a list of the publishers to be featured in Publisher Profile <a href="http://www.photoeye.com/templates/PubShowCase_home.cfm">click 
          here.</a> </font><br>
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><br />
          <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=pe030">Order</a> 
          the current issue of <i>photo-eye Booklist</i>. </font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          <a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a> 
          to the <i>photo-eye Booklist</i></font>.<br>
        </p>
    </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




