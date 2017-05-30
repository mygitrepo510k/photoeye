<CFQUERY NAME="qGetVS_Setup"  DATASOURCE="photoeyecom">
  SELECT *
  FROM VS_Setup where Custnumber=#url.id#
</CFQUERY>
<CFSET xEmail = qGetVS_Setup.Email>
<CFSET xCity = qGetVS_Setup.City>
<CFSET xState = qGetVS_Setup.State>
<CFSET xCountry = qGetVS_Setup.Country>


<CFIF IsDefined("url.id2")>

<CFQUERY NAME="qGetVS_Galleries" DATASOURCE="photoeyecom">
SELECT g.*, c.country AS CountryName
FROM VS_Galleries g INNER JOIN Country C ON g.Country = c.CountryCode
WHERE AutoID = #URL.id2# and Custnumber=#URL.id#
</CFQUERY> 

<CFSET xEmail = qGetVS_Galleries.Email>
<CFSET xCity = qGetVS_Galleries.City>
<CFSET xState = qGetVS_Galleries.State>
<CFSET xCountry = qGetVS_Galleries.CountryName>

</CFIF>




<cfset background1="DDDDDD">

<cfoutput>


<div align="center"><center>
<table width="580" cellspacing="0" bgcolor="###background1#" border="0">
    <TR> 
      <td width="40" bgcolor="###background1#">&nbsp;</td>
      <TD width="520">
     
           &nbsp; 
        </center><div align="center">
<font color="black" face="Verdana, Arial, Helvetica, Sans-Serif" size="3"><b> 

<CFIF IsDefined("url.id2")>
	<FONT SIZE="2">Contact <CFIF (len(qGetVS_Galleries.FirstName) gt 0) and (len(qGetVS_Galleries.Company) gt 0)>
	#qGetVS_Galleries.FirstName# #qGetVS_Galleries.LastName# of #qGetVS_Galleries.Company#
	
	<CFELSEIF len(qGetVS_Galleries.Company) gt 0>
	#qGetVS_Galleries.Company#
	
	<CFELSEIF (len(qGetVS_Galleries.FirstName) gt 0)>
	#qGetVS_Galleries.FirstName# #qGetVS_Galleries.LastName#
	</CFIF>
	<BR>
	regarding the photographs of 
	<BR></FONT>
<CFELSE>
Contact
</CFIF>
#qGetVS_Setup.FirstName# #qGetVS_Setup.LastName#

<CFIF IsDefined("url.print")>
<BR><FONT SIZE="2">Regarding <i>#url.print#</i></FONT>
</CFIF>
</b></font>
                </FONT></STRONG>
        <HR ALIGN="center" SIZE="1" WIDTH="200" COLOR="red">
                        
                        <!--- <A href="javascript:closeWindow();"><font face="Verdana, Arial, Helvetica, Sans-Serif" size="1"><b>Close Window</b></FONT></A> --->
						<A href="javascript:history.back();"><font face="Verdana, Arial, Helvetica, Sans-Serif" size="1"><b>Back</b></FONT></A>
        <BR>
						
					
						
</cfoutput>				

		
			
						



    </div>

<cfoutput>
	

	<table width="100%" cellpadding="0" cellspacing="0">
	
		<tr>
			<td>				<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="darkblue"><b>
						<CFIF IsDefined("url.id2")>
						
					Located in:
						
						<CFELSE>
						Lives in: 
						</CFIF>
						</b></font><BR>
				<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
					<cfif len(#qGetVS_Setup.City#) GT 0>
					#xCity#,
					</cfif>
					
					<cfif len(#qGetVS_Setup.State#) GT 0>
					#xState# 
					</cfif>
					
					#xCountry# 
					
					<br>
					<br>
					<cfif len(#xEmail#) GT 0>
					<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="darkblue"><b>
						<cfform action="contact_action.cfm" method="post"> 
						Your E-mail Address: <cfinput type="Text" name="SenderEmail" message="Please enter a valid email address." required="Yes" SIZE="35"><BR><BR>
						Enter E-mail Message:<br>
						
						<textarea name="Message" rows="10" cols="65"></textarea><br>
                 		<INPUT TYPE="SUBMIT" VALUE="Send Email" STYLE="font-size:10px;">
						<INPUT TYPE="HIDDEN" NAME="ID" VALUE="#qGetVS_Setup.Custnumber#">
						<CFIF IsDefined("url.id2")>
							<INPUT TYPE="HIDDEN" NAME="ID2" VALUE="#url.id2#">
						</CFIF>
						<CFIF IsDefined("url.print")>
							<INPUT TYPE="HIDDEN" NAME="print" VALUE="#url.print#">
						</CFIF>
						</cfform>
						
					 
					</cfif>						
					
					<cfif len(#qGetVS_Setup.website#) GT 0>
					<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="darkblue"><b>
						Website Address</b></font><BR>
					 <a href="http://#qGetVS_Setup.Website#" target="_blank">#qGetVS_Setup.Website#</a>
					</cfif>
				</font>
			</td> 
			
		</tr>
		
	</table>	



</td>
<td width="40" bgcolor="###background1#">&nbsp;</td>
</tr></table>
</cfoutput>



