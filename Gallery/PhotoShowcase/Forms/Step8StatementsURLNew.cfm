<!--- Check to see which type of custnumber variable there is--->
<cfif IsDefined("form.custnumber")>
	<cfset custnumber="#form.custnumber#">
<cfelse>
	<cfset custnumber=url.custnumber>
</cfif>

<CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryArtistStatements
  WHERE Custnumber = #custnumber#
</CFQUERY>

<!--- Insert record if for this custnumber if it doesn't already exist--->
<cfoutput>
<cfif #qGetShowcaseSetupInfo.RecordCount# is 0>
	<cfquery name="qGalleryBibliographyInsert" DATASOURCE="photoeyecom" >
		INSERT INTO GalleryArtistStatements (Custnumber, StatementA, StatementP) VALUES ('#custnumber#','','')
	</cfquery>
</cfif>
</cfoutput>

<CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryArtistStatements
  WHERE Custnumber = #custnumber#
</CFQUERY>

<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">


<html>

<head>
<title>photo-eye Photographer's Showcase | Statements Setup</title>
</head>

<body bgcolor="gray" link="#000080" vlink="#000080">
<div align="center"><center>
	<form method="post" action="Step8UpdateStatementsNew.cfm?Step=9&Custnumber=<cfoutput>#custnumber#</cfoutput>">
<br>

   <table width="85%" bgcolor="#FFFFFF" align="center">
      <tr><td align="center"> 
  
	          
            <table width="95%" border="0" cellpadding="5" bgcolor="#FFFFFF" cellspacing="0" valign="top" align="center">
              <tr valign="top"> 
                <td colspan="3" align="left"><br>
                  <img src="../SharedImages/photo-eye%20Explore%20NewLogo_photoShowcaseVersionWhiteBackground.jpg" width="151" height="94"></td>
              </tr>
              <TR> 
                <TD COLSPAN="3" ALIGN="LEFT"> <font face="Verdana,Arial,Helvetica,sans-serif" size="4">Step 
                  8 - Statements </font><font face="Verdana,Arial,Helvetica,sans-serif" size="5"> 
                  <br>
                  <font size="2">This information will appear on your Statement(s) page<br>
                  <br>
                  <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"></font></font></td>
              </tr>
              <tr> 
                <td width="49%" valign="top"> 
                  <p><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><b>Artist
                    Statement:</b> </font><br>
					<font face="Verdana,Arial,Helvetica,sans-serif" size="1" color="red">
                    Highly Recommended</font><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><br>
                    <font size="1">Include a short statement (three paragraphs 
                    or less) about your work and what you are exploring as an artist. 
					In particular, if your Showcase work is part of a series, 
					then describe what that series is about.
                    <font color="red">Please be careful with spelling, punctuation, 
                    and grammar since this information will be part of your online 
                    portfolio. <br>
                    <br>
                    </font></font></font><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><font color="black">Note: 
                    Standard keyboard returns (Enter Key) are ignored on the web. 
                    In order to create blank lines between paragraphs you must 
                    type &lt;BR&gt;&lt;BR&gt; between the paragraphs. 
					<br><br>For example:<br>
                    This is the first paragraph.&lt;BR&gt;&lt;BR&gt;This is the 
                    second paragraph.<br>
                    <br>
                    The example above will appear on screen as:<br>
                    This is the first paragraph.<br>
                    <br>
                    This is the second paragraph.</font></font><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><font color="black"><br>
                    <br>
                    </font></font> 
                    <textarea name="StatementA" rows="15" cols="40"><CFOUTPUT>#trim(qGetShowcaseSetupInfo.StatementA)#</CFOUTPUT></textarea>
                    <br>
                  </p>
                  </td>
                <td width="2%" valign="top" align="left"> 
                  <div align="center"><img src="Images/BlackRule.gif" width=1 height=100% alt="" border="0"></div>
                </td>
                <td valign="top" width="49%"> 
                  <p><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><b>Process 
                    Statement:</b><br>
					<font face="Verdana,Arial,Helvetica,sans-serif" size="1"><font color="red"></font> 
                    Optional</font><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><br>
                    <font size="1">Describe the technical process(es) you use 
                    in your work. Make sure to include any camera or darkroom 
                    techniques that make your work distinctive.<br><br> <font color="red">Please 
                    be careful with spelling, punctuation, and grammar since this 
                    information will be part of your online portfolio.<br>
                    <br>
                    </font><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><font color="black">Note: 
                    </font><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><font size="1"><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><font color="black"> 
                    Standard keyboard returns (Enter Key) are ignored on the web.</font></font></font></font> 
                    <font color="black">In order to create blank lines between 
                    paragraphs you must type &lt;BR&gt;&lt;BR&gt; between the 
                    paragraphs.
					<br><br>For example:<br>
					This is the first paragraph.&lt;BR&gt;&lt;BR&gt;This 
                    is the second paragraph.<br>
                    <br>
                    The example above will appear on the screen as:<br>
                    This is the first paragraph.<br>
                    <br>
                    This is the second paragraph.</font></font><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><font color="black"></font></font><font color="red"> 
                    <br>
                    <br>
                    </font></font></font> 
                    <textarea name="StatementP" rows="15" cols="40"><CFOUTPUT>#trim(qGetShowcaseSetupInfo.StatementP)#</CFOUTPUT></textarea>
                  </p>
                  <p>&nbsp; </p>
                </td>
              </tr>
              <tr> 
                <td align="center" colspan="3"> <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"><br>
                  <br>
 				  <INPUT TYPE="SUBMIT" VALUE="Save Changes">
                  <br>
                  <br>
                  <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"> 
                  <BR>
                  <FONT FACE="Arial, Helvetica, Sans-Serif" size="2"><IMG SRC="images/photoeyebooks&prints.gif" WIDTH=308 HEIGHT=28 BORDER=0><br>
                  376 Garcia Street, Santa Fe, NM 87501<br>
                  Orders Only: 800-227-6941 Info: 505-988-5152 Fax: 505-988-4487<br>
                  E-Mail: <a href="mailto:webmaster@photoeye.com">webmaster@photoeye.com</a><br>
                  © photo-eye books &amp; prints, <cfoutput>#YEAR(Now())#</cfoutput>. All Rights Reserved.</font> 
                  <FONT FACE="Arial, Helvetica, Sans-Serif" size="1"><br>
                  This entire web site is the © copyrighted property of photo-eye 
                  books &amp; prints, except where artists' and publishers' copyrights 
                  on the materials described take precedence. No portion of the 
                  contents within may be reproduced in any form, for any non-private 
                  use, without the express written permission of photo-eye books 
                  &amp; prints.<br>
                  </font></td>
              </tr>
              <tr> 
                <td></td>
              </tr>
            </table> 

    
 </td></tr></table> 
    <input type="HIDDEN" name="Custnumber" <CFOUTPUT>value="#qGetShowcaseSetupInfo.Custnumber#"</CFOUTPUT>>
	</form>
</center>
</div>
</body>
</html>

