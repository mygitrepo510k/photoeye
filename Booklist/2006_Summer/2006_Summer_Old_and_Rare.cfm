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

<tr><td colspan="3" ALIGN="CENTER"><p><font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>The 
          Old &amp; Rare Survey<br>
          </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>In 
          this first installment of a new column, rare-book specialist ERIC MILES<br>
          cracks the covers on three titles by Kishin Shinoyama.<br>
          BY ERIC MILES</strong></font></p>
        </td></tr>
<tr><td colspan="3" ALIGN="CENTER">&nbsp;</td></tr>
<TR>
 
 
    <td width="298" valign="top" align="right">
<cfoutput>
<cfset Catalog="http://www.photoeye.com/auctions/auctionfrontpage.cfm">
<cfset xImage = "SHINOYAMA-Paris-interior.jpg">
	<cfset xPath = "../../booklist/2006_Summer">
	<CFSET xHEIGHT = "300">
	<CFSET xWidth = "300">
	<cfinclude template="../../templates/imagesizer.cfm">  
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Kishin Shinoyama, Paris">
	<cfset xBorder="1">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE027"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>

<cfset Catalog="http://www.photoeye.com/auctions/auctionfrontpage.cfm">
<cfset xImage = "SHINOYAMA-Paris-cover.jpg">
	<cfset xPath = "../../booklist/2006_Summer">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">	
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Kishin Shinoyama, Paris">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE027"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a></cfoutput>
      </p>
  </TD>
   <td width="20">&nbsp;
  </td>
      <td width="480" valign="top"> <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">SINCE 
        ITS INCEPTION <em>the core of the photo-eye Booklist has always been our 
        survey of new books. While at times these include monographs and anthologies 
        of older work, in this issue we are inaugurating a new column that will 
        add a wide-ranging historical dimension to our pages. To this end, we&#8217;ve 
        recruited Eric Miles, photo-eye&#8217;s Auction Coordinator, who will 
        contribute his own idiosyncratic survey of old books. For this issue, 
        he explores three early books by Kishin Shinoyama.<br>
        </em>&#8212;Darius Himes, Editor.</font>
<p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          For John Szarkowski, writing in 1974, it was a &#8220;surprising but 
          undeniable fact that there has arisen in recent years a distinctively 
          Japanese photography.&#8221; The seminal Museum of Modern Art exhibition 
          that he organized that year with Shoji Yamagishi introduced a number 
          of important figures to Americans for the first time, including Moriyama, 
          Araki, Hosoe and Tomatsu&#8212;now quite familiar to Western audiences. 
          The following year, Kishin Shinoyama, who was not included in the show, 
          released two books, both in color and which transcend most anything 
          done previously in the medium.</font></p>
        <p><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"> 
          Continue reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PE027"><strong>ordering</strong></a> 
          the Summer issue of the <em>photo-eye Booklist</em>.</font></p>
        </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




