<CFPARAM NAME="Season" DEFAULT="Summer">
<CFPARAM NAME="Year" DEFAULT="2005">

<cfset page="Booklist Contacts">
<CFSET xTitle="Magazine">
<CFSET xSubPage="1">
<CFSET xPathToRoot="../">
<CFSET xShowBackButton = 1>
<CFPARAM NAME="Page" DEFAULT="Photo-Eye Booklist">

<cfinclude template="../templates/Header.cfm">
<DIV ALIGN="CENTER">

	<CFSET xFontColor = "Black">
	
	<CFIF Page is "Reviews">
		<CFSET xSubTitle = "New Books Reviewed">
	<CFELSEIF Page is "Contact">
		<CFSET xSubtitle = "Contact Us">
	<CFELSE>
		<CFSET xSubTitle=Page>
	</CFIF>
<!--- 	<img src="2005_Summer/PHOTO-EYE-BOOKLIST-LOGO.gif" width="257" height="54"><br> --->
	<CFINCLUDE TEMPLATE="../templates/Title.cfm">
  <CFOUTPUT>#xHTMLTitle#</CFOUTPUT>
 <br><br />
 <cfinclude template="include_menu.cfm">


<FONT FACE="verdana Arial, Helvetica, sans-serif" size="1" style="font-size:10px" COLOR="##333333">


<TAble ALIGN="CENTER"><tr>
    <TD width="405"  VALIGN="TOP"> 
      <p>&nbsp;</p>
      <p>TO CONTACT THE MAGAZINE STAFF:</p>
      <p>Rixon Reed<br>
        Executive Editor<br>
        <A HREF="mailto:rixon@photoeye.com">Email</A><br>
        505.988.5152 ext. 111<br>
        <br>
        Daniel Espeset<br>
        Managing Editor<br><A HREF="mailto:daniel.e@photoeye.com">Email<br>
        </a> 505.988.5152 ext. 113 <br>
        <br>
        ADDRESS:<br><BR>
        photo-eye Magazine <br>
        370 Garcia Street <BR>
        Santa Fe, NM 87501<br>
        fax 505.988.4487<p>
     
        TO SUBMIT A BOOK:</p>
      <p><em>photo-eye Magazine </em>considers unsolicited photobooks from publishers, 
        artists, galleries, museums, or distributors for inclusion in the magazine. 
        If you would like to submit a title for consideration, please send a finished 
        copy of the book to our address above. </p>
      <p>The magazine is specifically about <em>books </em>and therefore does 
        not accept submissions of prints, portfolios, manuscripts, or pdfs. We 
        encourage you to familiarize yourself with previous issues before submitting.</p>
      <p>The Bookstore division of photo-eye is separate from the editorial offices 
        of <em>photo-eye Magazine</em>. To contact them about carrying a title, please 
        contact <A HREF="mailto:melanie@photoeye.com">Melanie McWhorter, Bookstore Manager</A>.</p>
      <p><BR>
        <BR>
      </p>
</td>
</tr></table>

<BR>
<cfinclude template="../templates/footer_site.cfm">




