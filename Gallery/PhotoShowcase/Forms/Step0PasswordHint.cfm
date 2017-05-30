<cfset xtreepath = "../../">

<CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup
  WHERE Email = '#form.Email#'
</CFQUERY>

<cfif qGetShowcaseSetupInfo.recordcount is 0>
<CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
  SELECT *
  FROM UserInfoNew
  WHERE Email = '#form.Email#'
</CFQUERY>

</cfif>


<CFIF #qGetShowcaseSetupInfo.Email# is "">

<cfinclude template="../../includes/dsp_galleries_index_top.cfm">



<div align="center"><center>
	<form action="step0verifypassword.cfm" method="post">
<br>

   <table width="85%" bgcolor="#FFFFFF" align="center">
      <tr><td align="center"> 
  
	          
            <table width="95%" border="0" cellpadding="5" bgcolor="#FFFFFF" cellspacing="0" valign="top" align="center">

              <TR> 
                <TD COLSPAN="3" ALIGN="LEFT"><font face="Verdana,Arial,Helvetica,sans-serif" size="4">Email Address 
                  Not Found</font><font face="Verdana,Arial,Helvetica,sans-serif" size="5"><br>
                  <font size="2">Re-Enter Email Address to setup your Showcase<br>
                  <br>
                  <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"></font></font></td>
              </tr>
              <tr> 
                                <td width="49%" valign="top" height="154"> 
                  <p> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Your e-mail address:</b></font><br>
                    <font face="Verdana,Arial,Helvetica,sans-serif" size="5"><font size="2"> 
                    <input type="text" size="30" maxlength="50" name="Email">
                    </font></font><br>
                    <br>
                    <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Enter Your Password:</b> (Case Sensitive)<br>
                    Use your Customer Number Initially<font color="red"></font> 
                    </font><br>
                    <input type="password" name="password" size="30" maxlength="50">
                   <br><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b><a href="Passwordhint.cfm">Password Hint</a></b></font></font>
				  </p>
                  </td>
                <td width="2%" valign="top" align="left" height="124"> 
                </td>
                <td valign="top" width="49%" height="124"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><b> 
                  </b></font> </td>
              </tr>
              <tr> 
                <td align="center" colspan="3"> 
                  <p><img src="Images/BlackRule.gif" width=100% height=8 alt="" border="0"><br>
                    <br>
                    <INPUT TYPE="SUBMIT" VALUE="Continue Login">
                    <br>
                    <br>
                    <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"> 
                    </p>
                  </td>
              </tr>
            </table> 

    
 </td></tr></table> 

      <input type="HIDDEN" name="Email" <CFOUTPUT>value="#qGetShowcaseSetupInfo.Email#"</CFOUTPUT>>
</form>
</center>
</div>
<cfinclude template="../../includes/dsp_galleries_index_bottom.cfm">

<CFELSE>
<cfinclude template="../../includes/dsp_galleries_index_top.cfm">
<div align="center"><center>
	<form action="Step0VerifyPassword.cfm" method="post">
<br>

   <table width="85%" bgcolor="#FFFFFF" align="center">
      <tr><td align="center"> 
  
	          
            <table width="95%" border="0" cellpadding="5" bgcolor="#FFFFFF" cellspacing="0" valign="top" align="center">

              <TR> 
                <TD COLSPAN="3" ALIGN="LEFT"><font face="Verdana,Arial,Helvetica,sans-serif" size="4">Password 
                  Hint </font><font face="Verdana,Arial,Helvetica,sans-serif" size="5"><br>
                  <font size="2">Login to setup your Showcase<br>
                  <br>
                  <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"></font></font></td>
              </tr>
              <tr> 
                <td width="49%" valign="top" height="124"> 
                  <p> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Your Password Hint:</b></font><br>
                    <font face="Verdana,Arial,Helvetica,sans-serif" size="1" COLOR="RED">
                   <b><CFOUTPUT>#qGetShowcaseSetupInfo.Hint#</CFOUTPUT></b>
                    </font><br>
                    <br>
                    <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Enter Your Password:</b> (Case Sensitive)<br>
                    Use your Customer Number Initially</font><br>
                    <input type="password" name="password" size="30" maxlength="50">
                  </p>
                  </td>
                <td width="2%" valign="top" align="left" height="124"> 
                </td>
                <td valign="top" width="49%" height="124"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><b> 
                  </b></font> </td></tr>
                 <tr> 
                <td align="left" colspan="3"> 
                  <p><img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"><br>
                    <br>
                    <INPUT TYPE="SUBMIT" VALUE="Continue Login">
                  </td>
              </tr>           </tr>

            </table> 

    
 </td></tr></table> 

      <input type="HIDDEN" name="Email" <CFOUTPUT>value="#qGetShowcaseSetupInfo.Email#"</CFOUTPUT>>
</form>
</center></div>
<cfinclude template="../../includes/dsp_galleries_index_bottom.cfm">

</CFIf>

