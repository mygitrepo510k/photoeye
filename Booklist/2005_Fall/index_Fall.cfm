<CFPARAM NAME="Season" DEFAULT="Fall">
<CFPARAM NAME="Year" DEFAULT="2005">

<CFSET xPage="photo-eye booklist">
<CFSET xTitle="Magazine">
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
	<CFELSEIF Page is "BackIssues">
		<CFSET xSubtitle = "Back Issues">
	<CFELSE>
		<CFSET xSubTitle=Page>
	</CFIF>
	
	 <CFINCLUDE TEMPLATE="../templates/Title.cfm">
	<CFOUTPUT>#xHTMLTitle#</CFOUTPUT> <br>
	<FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" style="font-size:14 px" COLOR="##333333">
	The International Publication for Fine-Art Photography Books</font><br><br>
<!--- 	<FONT FACE="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" style="font-size:30px" COLOR="##333333">
	 <strong>photo-eye Booklist</strong>
	</font> --->
	<cfinclude template="include_menu.cfm">
<br><br>
<TABLE WIDTH="700"><TR>
  <td width="250" valign="top"><img src="2005-Summer-Cover-3D.jpg" width="250" height="343">
  <BR>
 <p align="left"><font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong><font size="2">
 Your subscription will begin with our Winter/Holiday 2005 issue. If you
would like to order the current issue, available now, click Order Current
Issue. </font>
 </p> <p align="center">
 <form action="https://www.themagstore.com/?ProductCode=PHE" method="post" target="_blank"><input name="Subscribe" type="submit" value="Subscribe Now"></form>
  
   <form action="http://www.photoeye.com/templates/mShowDetailsbyCat.cfm?Catalog=PE023" method="post"><input name="Order Current Issue" type="submit" value="Order Current Issue"></form></p>
 </td>
  <td width="50">&nbsp;	</td>
  <TD ALIGN="LEFT">
  	<font color="#333333" size="2" face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif"><strong><font size="2"><FONT COLOR="NAVY">FALL 2005 &middot;  TABLE OF CONTENTS</FONT></font></strong><BR>
    <BR>
    <A HREF="2005_Fall/2005_Fall_About.cfm" style="color: Maroon"><strong>ABOUT OUR COVER</strong></A><BR>
	Lise Sarfati and adolescent ennui. By Avis Cardella.<BR>
	<br>
	<A HREF="2005_Fall/2005_Fall_Survey.cfm" style="color: Maroon"><strong>SURVEY OF NEW BOOKS</strong> </A><BR>
	The quarterly survey of the best new photography books. By Darius Himes,
Phil Harris, Larissa Leclair, and Denise Wolff.
	<BR>
	<br>
	<A HREF="2005_Fall/2005_Fall_Sara_Terry.cfm" style="color: Maroon"><strong>STORIES OF REBUILDING , STORIES OF SACRIFICE</strong></A><BR>
	One photographer's journey through a war-torn land. An interview with Sara
Terry.<BR>	
	<br>
	<A HREF="2005_Fall/2005_Fall_Trickster.cfm" style="color: Maroon"><strong>TRICKSTER'S PHOTOGRAPHY</strong></A><BR>
	Hosoe Eikoh's 1966 classic, Kamaitachi is sumptuously reprinted. By Ivan
Vartanian.
	<BR>	
	<br>
	<A HREF="2005_Fall/2005_Fall_Publishing.cfm" style="color: Maroon"><strong>PUBLISHING THE PHOTOGRAPHY BOOK</strong></A><BR>
	The acclaimed column on publishing photography books. By Mary Virginia
Swanson and Darius Himes.<br>
	<br>
	<A HREF="2005_Fall/2005_Fall_Friedlander.cfm" style="color: Maroon"><strong>FRIEDLANDER'S BOOKS</strong></A><BR>
	The massive MoMA exhibition confirms that Friedlander loves books. By Robert Stevens.<br>
	<br>
	<strong>CONTRIBUTORS</strong></A><BR>Darius Himes, Editor<BR>
Darius Himes, Editor<br />
Avis Cardella<br />
Phil Harris<br />
Larissa Leclair<br />
Robert Stevens<br />
Mary Virginia Swanson<br />
Ivan Vartanian<br />
Denise Wolff<br />

	<br>
	<BR>
	</FONT>
	
	</TD>
</TR></TABLE>



</DIV>

<BR>
<cfinclude template="../templates/footer_site.cfm">




