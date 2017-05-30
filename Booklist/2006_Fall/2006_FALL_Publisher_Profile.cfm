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
          PROFILE: KesselsKramer<br>
          </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>A 
          new column surveys the field of publishers&#8212;one by one&#8212;that 
          create the books we love.</strong></font></p>
        </td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="400" valign="top" align="right">
      <p>
	  <cfoutput>
<cfset xPath = "http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=96">
<cfset xImage = "Bad_Food_Gone_Worse_BIG.jpg">
	<cfset xPath = "../../booklist/2006_Fall">
	<CFSET xHEIGHT = "400">
	<CFSET xWidth = "400">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Bad Food Gone Worse">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=96"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
		
		<cfset Catalog="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=96">
<cfset xImage = "Bad_Food_Gone_Worse_cover.jpg">
	<cfset xPath = "../../booklist/2006_Fall">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Bad Food Gone Worse">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/PubShowcase_Choice.cfm?ID=96"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
		</cfoutput>
		
      </p>
      </TD>
   <td width="20">&nbsp;
  </td>
      <td width="480" valign="top"> <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          PHOTOGRAPHERS AND PUBLISHERS form the X and Y axes upon which great 
          photobooks are crafted. This column explores the vast continuum of publishers, 
          from small art presses to mid-size publishers to the large houses that 
          have survived the decades. In this issue, we spoke with KesselsKramer, 
          a ten year old, independent and widely diverse communications company 
          that works in advertising, film, curation and publishing. Currently 
          37 people of nine different nationalities work at KesselsKramer in a 
          19th-century church in the center of Amsterdam. </font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><em> 
          Q: What is your vision of photography and publishing?</em><br>
          KesselsKramer&#8217;s vision of photography and publishing tends to 
          be quite open rather than nailed down to a particular rule. We are interested 
          in pushing the boundaries of both photography and publishing. In photography, 
          we are continually looking at its use, purpose and occurrence in many 
          different fields, levels and endeavors. This is demonstrated in book 
          topics ranging from food images that have lost their initial loveliness 
          (<em>Bad Food Gone Worse</em>), all the way through to the rescue of 
          rejected images from a photography lab (<em>Wonder</em>). But whatever 
          the theme, our vision is open for the endless incarnations of photography.<br>
          One of our current interests is the use of photography in the everyday. 
          Sometimes called &#8220;vernacular photography,&#8221; amateur photography and its thematic creations are published 
          in our series, <em>In Almost Every Picture</em>, and our magazine, <em>Useful 
          Photography</em>. <em>In Almost Every Picture</em> looks at the sometimes 
          unconscious, conceptual making of photographs over a period of time 
          by so-called &#8220;non professionals.&#8221; In the photographs a thread 
          begins to form both in the camera&#8217;s use for recording moments 
          and the photographer&#8217;s need to record and remember. We find the 
          purity of the photographers&#8217; purpose something that is fascinating, 
          emotional and lasting. In a way, these are stories that had one purpose 
          and meaning at the time of their making and now continue in a new form 
          for more people to see and experience. </font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          In <em>Useful Photography</em>, the use of photography is also the topic 
          but this time perhaps from a wider reference. Each issue examines interesting 
          ways photography is used professionally or commercially to provide information 
          for a variety of reasons. For example, <em>Useful Photography #2</em> 
          examines the style of photography adopted for displaying items for sale 
          on eBay and is a quiet celebration of this new art form. People all 
          over the world have now become experts in the still life by creating 
          their own home studios and shooting pictures with easily obtained and 
          operated digital cameras. <br>
          KesselsKramer has its publishing initiative in order to produce strong 
          ideas that may not have been published by traditional means. We seek 
          to offer singular ideas that test the limits of publishing from idea 
          outwards. While photography is the main concentration at the moment, 
          other mediums are always open for exploration. </font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><em> 
          Q: Who do you see as your audience?</em><br>
          We don&#8217;t necessarily have a particular audience in mind. It&#8217;s 
          probably clear that the books we publish ask a bit more from the reader 
          in terms of discovering the different meanings and impressions of the 
          stories or thematic elements. In that sense our audience is anyone who 
          is curious in what other people, people perhaps just like them, are 
          doing with the camera.<br>
          <br>
          </font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><em>Q: 
          What quantity of books do you publish per year/season?</em><br>
          We publish about five to seven books a year.<br>
          <br>
          <em> Q: How do you acquire new titles and do you have submission guidelines?<br>
          </em>Most all of our books are created conceptually within the company. 
          We often collaborate with other people for execution, design, photography 
          and other disciplines, but the core ideas usually originate within our 
          company. There are no strict criteria, only that it strikes a chord 
          at a new level. Our spirit of collaboration and our network of like-minded 
          creative people provide us with the confidence to experiment in publishing. 
          We are always interested in trying new things.<br>
          <br>
          <em> Q: What future projects really excite you right now?</em><br>
          The next edition of <em>In Almost Every Picture</em> is in the process 
          of being edited, designed and printed. The book features photographs 
          of a Dalmatian, a family pet, over the course of many years. In the 
          photographs, the love and fascination with this photogenic dog is documented. 
          The owners photographed their Dalmatian in a wide variety of poses, 
          locations and even experimented with film stock to try to achieve a 
          strong record for their memories.<br>
          </font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><br>
          We are also in production with a new issue of <em>Useful Photography</em>. 
          This issue will focus on the omnipresent practice of the &#8220;before 
          and after&#8221; technique in photography. Various examples are selected 
          from images that strongly demonstrate a sudden change whether for benefit, 
          improvement or simply a minor adjustment that makes all the difference.</font></p>
        <p>Contact Information: www.kesselskramerpublishing.com<br>
          KesselsKramer Publishing, Lauriergracht 39<br>
          1016 RG Amsterdam, The Netherlands<br>
          Publisher and press contact: <br>
          Kyra M&uuml;ller, kyra@kesselskramer.nl</p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">To 
          see a list of the publishers to be featured in Publisher Profile <a href="http://www.photoeye.com/templates/PubShowCase_home.cfm">click 
          here.</a> </font><br>
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><br />
          <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=pe028">Order</a> 
          the Fall issue of the <i>photo-eye Booklist</i>. </font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">  <a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a> 
          to the <i>photo-eye Booklist</i></font><br>
        </p>
    </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




