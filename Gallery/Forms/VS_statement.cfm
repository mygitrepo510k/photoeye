<cfparam name="nNoPopup" default="1">
<CFQUERY NAME="qGetVS_Setup"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM VS_Setup where Custnumber=#url.id#
</CFQUERY>

<!--- <CFQUERY NAME="qGetVS_Setup2"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM GallerySetup2 where Custnumber=#url.id#
</CFQUERY> --->

<CFQUERY NAME="qGetStatements_A"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM VS_Statements_A where Custnumber=#url.id#
</CFQUERY>

<CFQUERY NAME="qGetStatements_P"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM VS_Statements_P where Custnumber=#url.id#
</CFQUERY>



<!--- <cfoutput>


<div align="center"><center>
<!--- <table width="580" cellspacing="0" bgcolor="white" border="0">
    <TR>  --->
<!--- #      <td width="40" bgcolor="white">&nbsp;</td># --->
<!---       <TD width="520"> --->
                 <BR>
           &nbsp; 
        </center><div align="center">
<font color="black" face="Verdana, Arial, Helvetica, Sans-Serif" size="3"><b>#qGetVS_Setup.FirstName# #qGetVS_Setup.LastName# Statement</b></font>
                </FONT></STRONG>
        <HR ALIGN="center" SIZE="1" WIDTH="200" COLOR="red">
                        <cfif nNoPopup is 0>
                        <A href="javascript:closeWindow();"><font face="Verdana, Arial, Helvetica, Sans-Serif" size="1"><b>Close Window</b></FONT></A>        <BR>
						
						<br><br></cfif>

						
</cfoutput>			
		
			
						



    </div>

<br>
 --->	



<cfoutput>
	
		
<!-------------Start Artistic Statement------------->

<CFIF len(#qGetStatements_A.StatementA#) is not 0>

	<table width="100%" cellpadding="0" cellspacing="0">
	
		<tr>
			<td>
				<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="darkblue"><b>
						Artist Statement </b></font><br>
				<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
					<cfif len(#qGetStatements_A.StatementA#) GT 0>
					#qGetStatements_A.StatementA#
					</cfif>
				</font>
			</td> 
			
		</tr>
		
	</table>	

</cfif>

<!-------End Artistic Statement---------->



<!-------------Start Process Statement------------->

<CFIF len(#qGetStatements_P.StatementP#) is not 0>

<br>
<br>

	<table width="100%" cellpadding="0" cellspacing="0">
	
		<tr>
			<td>
				<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="darkblue"><b>
						Process Statement </b></font><BR>
				<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
					<cfif len(#qGetStatements_P.StatementP#) GT 0>
					#qGetStatements_P.StatementP#
					</cfif>
				</font>
			</td> 
			
		</tr>
		
	</table>	

</cfif>

<!-------End Process Statement---------->

<CFIF len(#qGetStatements_P.StatementP#) is not 0>
<br>
<br>
</cfif>		



	


<br>
<br>

<!--- </td>
<td width="40" bgcolor="white">&nbsp;</td>
</tr></table> --->
</cfoutput>




