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
<br><br> 
<TABLE WIDTH="700"><TR>
      <td colspan="3" align="center"> <p><font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>PUBLISHER 
          PROFILE: Hatje Cantz<br>
          </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>A 
          new column surveys the field of publishers&#8212;one by one&#8212;that 
          create the books we love.</strong></font></p>
        </td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="400" valign="top" align="right">
 <p>
	  <cfoutput>
<cfset xPath = "http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=66">
<cfset xImage = "Cantz-BIG.jpg">
	<cfset xPath = "../../booklist/2006_Winter">
	<CFSET xHEIGHT = "320">
	<CFSET xWidth = "320">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Hatje Cantz">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=66"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
		
		<cfset Catalog="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=66">
<cfset xImage = "hatje-cantz-logo.jpg">
	<cfset xPath = "../../booklist/2006_Winter">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Hatje Cantz">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=66"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
		</cfoutput>
		
      </p>
      </TD>
   <td width="20">&nbsp;
  </td>
      <td width="480" valign="top"> <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          PHOTOGRAPHERS AND PUBLISHERS form the X and Y axes upon which great 
          photobooks are crafted. This column explores the vast continuum of publishers, 
          from small art presses to mid-size publishers to the large houses that 
          have survived the decades. In this issue, we spoke with Markus Hartmann, 
          International Publishing Director at Hatje Cantz, in Germany.</font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><em> 
          Q: What is your vision of photography and publishing?</em></font><br>
          We want to publish books that are important for the artist and the viewer, 
          not just pretty &#8220;picture books.&#8221; In an ideal world, our 
          books would help the artist become better known and also make a contribution 
          to the visual understanding and fascination of our world. </p>
        <p>There are certain books that only sell a few hundred copies and I still 
          consider them being important. But we try to publish books that utilize 
          the distribution forces at Hatje Cantz to turn it into a success and 
          sell at least a few thousand copies. Personally, I very often like smaller, 
          shorter or less bulky books better than another &#8216;brickstone.&#8217; 
          Our books tend to be realized with mostly younger artists, and therefore 
          we do not have so many big retrospective books. If you can not tell 
          a story or show your work in 40-60 images then maybe it is not a good 
          story or subject (and exceptions confirm the rule).</p>
        <p>Photography is more accessible or direct in the impression it leaves 
          on your mind than other techniques used in contemporary art, especially 
          for the unexperienced viewer. If you see a photograph it is more likely 
          that you have a definite, immediate feeling about it compared to what 
          happens if you see an installation, painting, drawing etc. This is what 
          I personally like about photography, but it is also just another way 
          to express one&#8217;s artistic ideas. I am not fixed on photography 
          as such, but I like the way photographic images work on the mind, and 
          I think this is the reason for the succes of photography in the art 
          world during the past 10-15 years. What I like about publishing is that 
          it gives one the opportunity to learn and study while working. Every 
          book is a new adventure and all the people we meet and work together 
          with are part of that trip. The best book is one where the publisher 
          and the artist like each other at the beginning of the project and they 
          are still friends when it is released.</p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><em>
		Q: What quantity of books do you publish per year/season?</em></font><br>
          10-15 per season photography titles per season. Sometimes a bit more 
          in Spring, sometimes more in Fall, but in total about 20-25 photography 
          books a year. Overall, Hatje Cantz publishes around 150 books per year 
          ranging from old masters and modern art to<br>
          design, architecture and photography.</p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><em>
		Q: How do you acquire new titles?</em></font><br>
          We travel a lot, go to museum shows, openings, art and photography fairs, 
          meet curators, collectors, artists, dealers, directors, amateurs, professionals 
          in their field, read magazines and newspapers; all of that creates more 
          than enough ideas and opportunities for new books. As a publisher you 
          just have to be wide awake and follow what is going on around you and 
          make choices about what you like or not. If other people like your choices 
          you sell some books. And if you do that for awhile you suddenly have 
          a taste or style and become<br>
          better known for what you do. It sounds rather simple but is a slow 
          process of developing taste and becoming more experienced. In the end, 
          all this has to sell and make some money. So it is not all as easy as 
          it sounds! </p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><em>
		Q: What future projects really excite you right now?</em></font><br>
          Oh, usually the projects that have not yet left &#8216;project status&#8217; 
          are the most exciting. I have two projects that are very good and I 
          really want to turn them into books. But due to the nature of the projects&#8212;one 
          on AIDS, one on the homes of Romanian people&#8212;they are not really 
          easy to do because sales will be limited. For Spring 2007 we are working 
          now on a book with Walter Niedermayr and Sanaa (the Japanese Architects) 
          accompanying a show at<br>
          the DeSingel Kunstcentrum, Antwerp. A very interesting collaboration 
          of an artist and an architect inspiring each other. Then we do a book 
          with Ola Kolehmainen, one of the artists coming from the Helsinki School 
          that I think is exceptional. I am also waiting for the next book of 
          Peter Bialobrzeski (we did Neontigers and Heimat with him so far) but 
          this will not happen until 2008 I think. We are also expanding our Collector&#8217;s 
          Edition programme, which<br>
          range from the completely unknown to international art stars. These 
          limited editions are very important for us, as they allow us fund the 
          projects in part.</p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><em>
		Q: What are your submission guidelines?</em></font><br>
          We prefer PDFs or JPEGs by email to get a first idea. If the files are 
          bigger than a few Megabytes, then preferably on CD. Once we have expressed 
          interest, we will want to see the real photos; just the images is better 
          than an already designed book. For all projects it helps to know details 
          around the project such as potential exhibitions, dates, awards, participation 
          in group shows, etc. Exhibitions get more attention in our media driven<br>
          world than books, unless the artist is already very widely known for 
          his work. We are happy for submissions, but do not be afraid of a rejection. 
          Out of 100 unsolicited projects maybe 2,3, or 4 finally become books. 
          Many projects are simply not right for us...there are many reasons why 
          a book does not happen, and probably fewer reasons why it does!</p>
        <p>Contact Information:  <a href="https://www.hatjecantz.com" target="_blank">www.hatjecantz.com</a><br>
          Markus Hartmann: m.hartmann@hatjecantz.de</p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">To 
          see a list of the publishers to be featured in Publisher Profile <a href="http://www.photoeye.com/templates/PubShowCase_home.cfm">click 
          here.</a> </font><br>
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><br />
          <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=pe029">Order</a> 
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




