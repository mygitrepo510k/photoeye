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

<tr><td colspan="3" ALIGN="CENTER"><p><font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>THE 
          OLD &amp; RARE SURVEY<br><br>
          </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>With 
          the publication of influential surveys of photobooks in recent years, 
          ERIC MILES pauses to reflect on the nature of collecting. This two-part 
          installment seeks to explore the methods <br>
          and ideas behind building a collection.<br>
           <br>
          </strong></font></p>
        </td></tr>
<tr><td colspan="3" ALIGN="CENTER">&nbsp;</td></tr>
<TR>
 
 
    <td width="298" valign="top" align="right">
 <p>
	  <cfoutput>

	
<cfset xImage = "OLD-AND-RARE-1.jpg">
	<cfset xPath = "../../booklist/2007_Spring">
	<CFSET xHEIGHT = "320">
	<CFSET xWidth = "320">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Methods & Ideas">
	<cfset xBorder="0">
	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
	<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=DP490"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
			
	
<cfset xImage = "OLD-AND-RARE-2.jpg">
	<cfset xPath = "../../booklist/2007_Spring">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Methods & Ideas">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=ZC553"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
	
	
<cfset xImage = "OLD-AND-RARE-3.jpg">
	<cfset xPath = "../../booklist/2007_Spring">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Methods & Ideas">
	<cfset xBorder="0">
	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
	<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PK708"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
	
	
<cfset xImage = "OLD-AND-RARE-4.jpg">
	<cfset xPath = "../../booklist/2007_Spring">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Methods & Ideas">
	<cfset xBorder="0">
	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
	<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PI146"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
							
		
<cfset xImage = "OLD-AND-RARE-5.jpg">
	<cfset xPath = "../../booklist/2007_Spring">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Methods & Ideas">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PI178"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>	
		
		</cfoutput>
		
      </p>
  </TD>
   <td width="20">&nbsp;
  </td>
      <td width="480" valign="top"> <p> AS WALTER BENJAMIN SAID IN HIS 1931 essay, 
          &#8220;Unpacking My Library,&#8221; a collection is &#8220;but a disorder 
          to which habit has accommodated itself to such an extent that it can 
          appear as order.&#8221; &#8220;If there is a counterpart to the confusion 
          of a library,&#8221; he went on to say, &#8220;it is the order of its 
          catalogue.&#8221; To an extent perhaps not anticipated by their authors, 
          the appearance of three now very well-known and poured over anthologies&#8212;first, 
          <i>The Book of 101 Books</i> (2001), conceived and edited by Andrew Roth, followed 
          by the volume I of Parr and Badger&#8217;s <i>The Photobook: A History</i> 
          (2004), the exhibition catalogue for <i>The Open Book</i> (2004, also edited 
          by Roth, but with fairly limited distribution), and finally volume II 
          of <i>The Photobook: A History</i> (2006)&#8212;has imposed just such an order 
          on the history and collecting of photography books, a &#8220;peculiar 
          category of completeness,&#8221; as Benjamin termed it elsewhere. <br>
          <br>
          Routinely cited by most dealers in the field (including this writer), 
          the result has been the creation of a sort of &#8220;master&#8221;collection 
          with a definite hierarchy that has had a dramatic effect on the market 
          for titles included in them. <br><br>
          But, in the end, a living collection is a reflection of an individual 
          owner projected onto objects, which, through his or her possession of 
          them are transformed. While the authors would surely admit that the 
          composition of these collections is necessarily somewhat subjective, 
          it is worth asking what their particular concerns can tell us about 
          the process of collecting. <br><br>
          With Benjamin as a guide, in this and the following column, I&#8217;m 
          going to essay four related ways of thinking about one&#8217;s style 
          of collecting. If, as he has stated, the collector is constantly pulled 
          between the &#8220;poles of order and disorder,&#8221; it is worth interrogating 
          one&#8217;s approach to collecting&#8212;not so much the particulars 
          of title and genre, but how we survey the field&#8212;with the result 
          being perhaps being to re-introduce a bit of disorder into the activity 
          of building a library of photobooks. 
        <p>&#8230;
        </p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          Continue reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE030
		  "> 
          ordering</a> the <br> current issue of <em>photo-eye Booklist</em>.</font></p>
        </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




