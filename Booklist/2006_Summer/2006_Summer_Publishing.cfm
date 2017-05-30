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
	
<cfset xmenupath="../">
 <cfinclude template="../include_menu.cfm">
 <br /><br />

<FONT FACE="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333">

<TABLE WIDTH="700"><TR>
<td colspan="3" align="center"> <font color="#333333" size="3" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong>PUBLISHING THE PHOTOGRAPHY BOOK<br>
        </strong></font><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"><strong>Extending 
        the Life of Your Project. Over the course of the next three installments 
        of their ongoing column, MARY VIRGINIA SWANSON and DARIUS HIMES explore 
        all avenues for extending the life of your book project beyond the initial 
        launch party.</strong></font></td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="200" valign="top" align="right">
	<cfoutput>

		
<cfset xImage = "maine-women-big-image.jpg">
	<cfset xPath = "../../booklist/2006_Summer">
	<CFSET xHEIGHT = "400">
	<CFSET xWidth = "400">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Lauren Shaw">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=ZC793"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
		
		<cfset xImage = "MAINE-WOMEN-authors.jpg">
	<cfset xPath = "../../booklist/2006_Summer">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Lauren Shaw">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=ZC793"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br>
          <font size="1" color="##333333" face="Arial, Helvetica, sans-serif">Lauren 
          Shaw </font><br>
          <br />
		
		</cfoutput>
		
		<cfoutput>
<cfset xImage = "BORDERLANDS-untitled(sweate.jpg">
	<cfset xPath = "../../booklist/2006_Summer">
	<CFSET xHEIGHT = "400">
	<CFSET xWidth = "400">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Eirik Johnson">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=TT140"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
		
		<cfset xImage = "Borderlands-Chicago-booksign.jpg">
	<cfset xPath = "../../booklist/2006_Summer">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Eirik Johnson">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=TT140"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br>
          <font size="1" color="##333333" face="Arial, Helvetica, sans-serif">Eirik 
          Johnson </font><br>
          <br />
		</cfoutput>
</TD>
   <td width="20">&nbsp;
  </td>
      <td width="480" valign="top"> <p><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"> 
          IN THE LAST INSTALLMENT OF THIS COLUMN we discussed with a number of 
          professionals the vital role that publicity plays in the launch and 
          life of a photography book. Topics like how to secure press attention, 
          realistic expectations on the part of the author/artist, as well as 
          the option of retaining an independent publicist to maximize the impact 
          of your book&#8217;s release were all discussed in detail. <br>
          <br>
          </font><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"> 
          Shannon Wilkinson, the founder and President of Cultural Communications, 
          an independent publicity agency in New York, addressed the role that 
          photographers must play in this effort: &#8220;A book is the best publicity 
          hook in the world, but if it isn&#8217;t marketed and promoted, it sits 
          in a warehouse for a long, long time. That is why photographers must 
          be proactive in all phases of their promotion. They must get the ball 
          rolling months before a book is published, because they have a short 
          window of time for promotion once it is out.&#8221; </font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif"> 
          Publishers launch many titles per year, primarily during the Spring 
          and Fall seasons, and when a book is considered a new title, it is at 
          the forefront of the minds of the marketing staff. But it&#8217;s important 
          to recognize that the slate of next season&#8217;s titles is not far 
          down their to-do lists. Consequently, your book&#8217;s release will 
          be newsworthy for a relatively short period of time. Once a release 
          date is set and a plan for publicity is in place, it is time to think 
          about how you, the author, can best extend the life of your book beyond 
          its first sales season. There are numerous avenues and approaches to 
          extending the life of your book, and we&#8217;ve divided this topic 
          into three installments, focusing this first study on exhibitions. Specific 
          efforts that utilize the Internet as a marketing tool for your book 
          will be discussed in the next installment, which will be followed by 
          an examination of serial rights, ancillary products and other ways to 
          keep your book and/or its images in the public eye.</font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS',  verdana, Arial, Helvetica, sans-serif">...<br>
          <br />
          Continue reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=pe027">ordering 
          the current issue</a> of photo-eye Booklist.<br />
          <br>
          <a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a> 
          to the photo-eye Booklist <br>
          </font></p>
        </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




