<CFQUERY NAME="qGallerySetup"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM GallerySetup where Custnumber=#url.id#
</CFQUERY>

<CFQUERY NAME="qGallerySetup2"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM GallerySetup2 where Custnumber=#url.id#
</CFQUERY>

<CFQUERY NAME="qGalleryStatements"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM GalleryArtistStatements where Custnumber=#url.id#
</CFQUERY>

<A NAME="Top"> </A>

<cfoutput>

<div align="center"><center>
<table width="580" cellspacing="0" bgcolor="white" border="0">
    <TR> 
      <td width="40" bgcolor="white">&nbsp;</td>
      <TD width="520">
                 <BR>
           &nbsp; 
        </center><div align="center">
<font color="black" face="Verdana, Arial, Helvetica, Sans-Serif" size="3"><b>#qGallerySetup.FirstName# #qGallerySetup.LastName# Statement</b></font>
                </FONT></STRONG>
        <HR ALIGN="center" SIZE="1" WIDTH="200" COLOR="red">
                  
<br>
						
</cfoutput>				

		
			
						



    </div>

<br>



<cfoutput>
	
		
<!-------------Start Artistic Statement------------->

<CFIF len(#qGalleryStatements.StatementA#) is not 0>

	<table width="100%" cellpadding="0" cellspacing="0">
	
		<tr>
			<td>
				<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="darkblue"><b>
						Artist Statement </b></font><br>
				<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
					<cfif len(#qGalleryStatements.StatementA#) GT 0>
					#qGalleryStatements.StatementA#
					</cfif>
				</font>
			</td> 
			
		</tr>
		
	</table>	

</cfif>

<!-------End Artistic Statement---------->



<!-------------Start Process Statement------------->

<CFIF len(#qGalleryStatements.StatementP#) is not 0>

<br>
<br>

	<table width="100%" cellpadding="0" cellspacing="0">
	
		<tr>
			<td>
				<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="darkblue"><b>
						Process Statement </b></font><BR>
				<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
					<cfif len(#qGalleryStatements.StatementP#) GT 0>
					#qGalleryStatements.StatementP#
					</cfif>
				</font>
			</td> 
			
		</tr>
		
	</table>	

</cfif>

<!-------End Process Statement---------->

<CFIF len(#qGallerySetup2.StatementP#) is not 0>
<br>
<br>
</cfif>		



	


<br>
<br>

</td>
<td width="40" bgcolor="white">&nbsp;</td>
</tr></table>
</cfoutput>

</center></div>