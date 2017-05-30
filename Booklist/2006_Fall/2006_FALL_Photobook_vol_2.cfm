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
 <br /><br />
 
<TABLE WIDTH="700"><TR>
      <td colspan="3" align="center"> <p><font color="#333333" size="3" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>HISTORY 
          OF THE PHOTOBOOK, VOL. 2<br>
          </strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong>For 
          two years, Martin Parr and Gerry Badger have been working<br>
          on the second volume of their monumental survey of the history of photobooks.</strong></font><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong><br>
          By ERIC MILES AND DARIUS 
          HIMES <br>
          </strong></font></p>
        </td>
</tr>
<tr> <td colspan="3">&nbsp; </td></tr>
 
    <td width="297" valign="top" align="right">
      <p>
	  <cfoutput>
<cfset Catalog="PI178">
<cfset xImage = "photobook_vol_2_BIG.jpg">
	<cfset xPath = "../../booklist/2006_Fall">
	<CFSET xHEIGHT = "400">
	<CFSET xWidth = "400">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Photobook, vol. 2">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PI178"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>
		
		<cfset Catalog="PI178">
<cfset xImage = "THE-PHOTOBOOK-Volume-Two-co.jpg">
	<cfset xPath = "../../booklist/2006_Fall">
	<CFSET xHEIGHT = "120">
	<CFSET xWidth = "120">
	<cfinclude template="../../templates/imagesizer.cfm">  
	
	<CFSET xCoverHeight = imagecr.height>
	<CFSET xCoverWidth = imagecr.width>
	<cfset xTitle2x="Photobook, vol. 2">
	<cfset xBorder="0">

	<!---<CFINCLUDE TEMPLATE="bookfinder_booktease.cfm">--->
		<a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PI178"><img src="../../_cache/#imagecr.filename#"  alt="'#xTITLE2X#'"  Border="#xBorder#" style="border-color: #aBorderColor#" HEIGHT="#xCoverHeight#" WIDTH="#xCoverWidth#"></a><br><br>	
		
		</cfoutput>
		
      </p>
      </TD>
   <td width="13">&nbsp;
  </td>
      <td width="374" valign="top"> <p>It is finally here. The second volume of 
          Martin Parr&#8217;s massive study of the history of photobooks, that 
          is. Parr, one of England&#8217;s best-known photographers and longtime 
          Magnum member, has nursed an obsession for photobook collecting from 
          very early on. Teaming up with historian Gerry Badger, Parr set out 
          to provide the foundation for an academic study of the history of the 
          medium as seen through the book. Our Editor, Darius Himes and writer 
          Eric Miles spoke with Parr on the phone about the overall project and 
          the contents of <em>vol. 2</em>.<br>
          <br>
          Darius Himes: Martin, thanks again for finding time in your schedule 
          . <br>
          Martin Parr: I&#8217;ll talk to anyone about books, any time of the 
          day. You could have called me in the middle of the night! <br>
          <br>
          DH: Volume I came out in November of 2004, so it&#8217;s been just shy 
          of two years, and we&#8217;ve been in anticipation of Volume 2 since 
          then. We&#8217;re curious as to how you and Gerry Badger worked together 
          on this massive project. Was the whole project mapped out from the start, 
          with the writing tasks divided up equally between the two of you? <br>
          MP: Well, I was the initiator of the project, and I knew that what I 
          needed was a writer since, as you know, I&#8217;m a photographer. Gerry 
          would come down and we would sketch out what we wanted to do. Initially 
          it was going to be one book, and then we started to make all the chapters 
          and we quickly realized that we had too much material for one book. 
          We went back to Phaidon and said, we think this needs to be two separate 
          volumes. He and I think rather alike, so it was a brilliant combination. 
          He would bring little notebooks and we would crash out what we thought 
          needed to be included. Of course, we took the people, we found out our 
          things and we fine-tuned it; we fine-tuned it right to the very last 
          minute. The final list was only finished about a month ago.</p>
        <p>....</p>
        <p><em>The Photobook: A History, Volume 2</em>. Curated by Martin Parr 
          and Gerry Badger. Phaidon, London, 2006. Designed by HDR Visual Communication. 
          Printed in Hong Kong. Paper-wrapped boards with photo-illustrated dustjacket. 
          320 pp., 750 four-color illustrations, 9&frac34; x 11&frac14; $75.00<br>
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><br>
          </font> <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif">Continue 
          reading this article by <a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=pe028">ordering 
          the current issue</a> of <i>photo-eye Booklist</i>. <br>
          </font><br>
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><a href="http://www.photoeye.com/templates/mShowDetailsbycat.cfm?Catalog=PI178"><strong>Order</strong></a> 
          <i>The Photobook: A History. </i></font> <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><br>
          </font> <br />
          <font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><a href="https://www.themagstore.com/?ProductCode=PHE&PageType=NEWFORM" target="_blank">Subscribe</a> 
          to the <em>photo-eye Booklist</em>.<br>
          </font> </p>
        </TD>


</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../../templates/footer_site.cfm">




