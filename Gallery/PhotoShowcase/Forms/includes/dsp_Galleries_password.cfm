<CFSET xTitle="Galleries">
<CFSET xPathToRoot="../../../">
<CFSET xShowBackButton = 1>
<CFSET xShowMenu = 1>


	
<CFSET xSubtitle = "Artist Login">
<cfinclude template="/templates/title.cfm">
<DIV ALIGN="CENTER"><CFOUTPUT>#xHTMLTitle#</CFOUTPUT></DIV>

<!--- <CFSET xMenuToShow = "Main">
<CFSET xItemSelected = 6>
<CFINCLUDE TEMPLATE="../../Menu.cfm"> --->

<div align="center"><center>
	<form action="Step0VerifyPassword.cfm" method="post" target="_parent">

<TABLE ALIGN="CENTER">
			  
            <TR> 
                <TD COLSPAN="3" ALIGN="LEFT"><font face="Verdana,Arial,Helvetica,sans-serif" size="5">
                  <font size="2">Login to setup your Showcase<br>
                  <br>
                  <img src="Images/BlackRule.gif" width=250 height=1 alt="" border="0"></font></font></td>
              </tr>
              <tr> 
                <td  valign="top" height="154"> 
                  <p> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Your 
                    e-mail address:</b></font><br>
                    <font face="Verdana,Arial,Helvetica,sans-serif" size="5"><font size="2"> 
                    <input name="Email" type="text" class="input_text" size="30" maxlength="50">
                    </font></font><br>
                    <br>
                    <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Your 
                    Password:</b> (Case Sensitive)<br>
                    Use your Customer Number Initially<font color="red"></font> 
                    </font><br>
                    <input type="password" name="password" size="30" maxlength="50">
                    <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><br>
                    <br>
                    
                    <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b><a href="Passwordhint.cfm" target="_parent">Password Hint</a></b></font> </font> </p>
   <INPUT TYPE="SUBMIT" VALUE="Continue Login">               </td>
                
            </table> 


    
 </td></tr></table> 
</form>
</center>
</div>

