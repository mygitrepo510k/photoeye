<!--- <CFSET xTitle="Photographer's Showcase">
<CFSET xPathToRoot="../../../../">
<CFSET xShowBackButton = 1>
<CFSET xShowMenu = 1>
<cfinclude template="../../../../templates/Header.cfm">
	
<CFSET xSubtitle = "Exhibit Your Work">
<cfinclude template="../../../../templates/title.cfm">
<DIV ALIGN="CENTER"><CFOUTPUT>#xHTMLTitle#</CFOUTPUT></DIV>

 <CFSET xMenuToShow = "Showcase">
<CFSET xItemSelected = 2>
<CFINCLUDE TEMPLATE="../../../Menu.cfm"> --->


<CFSET xSubtitle = "Submit Your Work">
<CFOUTPUT>
<HTML>
<HEAD><TITLE>#xSubTitle#</TITLE></HEAD>
<BODY BGCOLOR="##D4C9AE" onload="window.focus()">
<cfinclude template="../../../../templates/title.cfm">
<DIV ALIGN="CENTER">#xHTMLTitle#</DIV>
</CFOUTPUT>


  <table border="0" align="center" width="450">
    <tr align="left" valign="top"> 
	<HR>
      
      <!--- <td width="100%"> 
           
			<font color="Black" face="Verdana, Arial, Helvetica, Sans-Serif" size="2"><b>photo-eye</b> has received an enthusiastic response to the <b>Photographer’s Showcase</b>, and we want to thank all of the photographers who replied to our initial announcement. Presently, we have begun processing all requests for information that were made during the past year. We will begin accepting additional applications in the very near future. If you haven't already requested <b>Photographer's Showcase</b> information, please <a href="mailto:photoshowcase@photoeye.com">email</a> us to be notified for the next round of submissions.<br> 
<br> At this time, we are accepting applications and submissions solely via the online submission process. We may accept portfolios in the form of slides or original prints at a later date. We thank you for your response and patience as we expand the world's greatest fine-art photography resource. ---> 

<td width="100%"> 
             <p><FONT FACE="Verdana, Arial, sans-serif" size="2">
We are now accepting applications and submissions for <b>Photographer's Showcase</b>. Please click to <a href="javascript: opener.document.location='../../../../templates/applicationoptions.cfm'; window.close();">Apply Now</a>. If you are new to the site and would like to find out more about the Showcase, please read our <a href="javascript: opener.document.location='../artists/index.html'; window.close();">Info for Artists</a>.<br>
<br>

All of us working on the Showcase look forward to seeing your work in the near future. <br> </font>
	  

<HR>
	<br>
<table align="center" width="100%"><tr><td align="center">
	<font size="2" color="Red" face="Verdana, Arial, Helvetica, Sans-Serif">
	<FORM><INPUT TYPE="BUTTON"  VALUE="Close Window" style="font-size: 10px" onClick="javascript:window.close();">
</td></tr></table>
             

</td></tr></table>
</td></tr></table><!--- 

<CFINCLUDE TEMPLATE="../../../../templates/footer_site.cfm"> --->