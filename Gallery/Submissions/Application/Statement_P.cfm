<CFQUERY NAME="qGetShowcaseApplicationSelect" DATASOURCE="photoeyecom">
	select PortfolioCredits from GalleryApplication where OrderID = #url.id#
</cfquery>	
	

<CFQUERY NAME="qGetApplication"  DATASOURCE="photoeyecom">
  SELECT Statement_P
  FROM GalleryApplicationPortfolios
  WHERE OrderId = #url.id# and (Portfoliono=#qGetShowcaseApplicationSelect.PortfolioCredits# or #qGetShowcaseApplicationSelect.PortfolioCredits#=0)
</CFQUERY>


<cfinclude template="header.cfm">

<body bgcolor="gray" link="#000080" vlink="#000080">
<div align="center"><center>
	<form method="post" action="UpdateStatement_P.cfm?id=<cfoutput>#url.id#</cfoutput>">
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
                 4 - Process Statement</font><font face="Verdana,Arial,Helvetica,sans-serif" size="5"><font size="2"><br>
                 <hr size="1" noshade></font></font>
                  <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><b>Enter your Process 
                    Statement. </b> </font> <font face="Verdana,Arial,Helvetica,sans-serif" color="red" size="1"> 
                    (Highly Recommended)</font> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><br>Describe the technical process(es) you use 
                    in your work. Include any camera or darkroom 
                    techniques that make your work distinctive.<br><br><font color="red">NOTE:</font> If you are submitting multiple portfolios and have already submitted this, just write "Included with first portfolio." You <strong>MUST</strong> click the &quot;Continue&quot; button at the bottom of this page even if you decide to leave the text box blank<br><br></font>
                    <textarea name="Statement" rows="15" cols="70"><cfoutput>#qGetApplication.statement_P#</cfoutput></textarea>
                  
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

