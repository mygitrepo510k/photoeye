<CFQUERY NAME="qGetShowcaseApplicationSelect" DATASOURCE="photoeyecom">
	select PortfolioCredits from GalleryApplication where OrderID = #url.id#
</cfquery>	

<CFQUERY NAME="qGetApplication"  DATASOURCE="photoeyecom">
  SELECT statement
  FROM GalleryApplicationPortfolios
  WHERE OrderId = #url.id# and PortfolioNo=#qGetShowcaseApplicationSelect.PortfolioCredits#
</CFQUERY>

<cfinclude template="header.cfm">


<body bgcolor="gray" link="#000080" vlink="#000080">
<div align="center"><center>
	<form method="post" action="UpdateStatement.cfm?id=<cfoutput>#url.id#</cfoutput>">
<br>

   <table width="85%" bgcolor="#FFFFFF" bgcolor="white" align="center">
      <tr><td align="center"> 
 
            <table width="95%" border="0" cellpadding="5" bgcolor="#FFFFFF" background="Images/WhiteBackground.gif" cellspacing="0" valign="top" align="center">
              <tr valign="top"> 
                <td colspan="3" align="left"><br>
                 <img src="/images/photoeye_logo_magazine.png" width="196" height="100"></td>
              </tr>
              <TR> 
                <TD COLSPAN="3" ALIGN="LEFT" height="57"> <font face="Verdana,Arial,Helvetica,sans-serif" size="4">Step 
                  3 - Artist Statement</font><font face="Verdana,Arial,Helvetica,sans-serif" size="5"><font size="2"><br>
                 <hr size="1" noshade></font></font>
                  <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><b>Enter your Artist 
                    Statement. </b> </font> <font face="Verdana,Arial,Helvetica,sans-serif" color="red" size="1"> 
                    (Highly Recommended)</font> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><br>Include a short statement (three paragraphs 
                    or less) about this body of work<br>                   
                    and/or what you explore as an artist. If these images are a visual narrative, please give the staff some background information. If you already have a statement as a text document, simply copy and paste that text into the box below. Don't be concerned about any formatting changes. At this point, we are only interested in the information.<br><br><font color="red">NOTE:</font> If you are submitting multiple portfolios and have already submitted this, just write "Included with first portfolio." You <strong>MUST</strong> click the &quot;Continue&quot; button at the bottom of this page even if you decide to leave the text box blank.<br><br></font>
                    <textarea name="Statement" rows="15" cols="70"><cfoutput>#qGetApplication.statement#</cfoutput></textarea>
                  
                  </td>
              </tr>
                          <tr valign="top"> 
              <td align="center">
                <hr size="1" noshade color="black"><!--- <img src="../forms/images/BlackRule.gif" width=50% height=1 alt="" border="0"> ---><br>
				 
                <INPUT TYPE="SUBMIT" VALUE="Continue Online Application">
                <br><img src="../forms/images/BlackRule.gif" width=100% height=1 alt="" border="0">
              </td>
            </tr>
				<cfinclude template="footer.cfm">
              <tr> 
                <td></td>
              </tr>
            </table> 

    
 </td></tr></table> 
	</form>
</center>
</div>
</body>
</html>

