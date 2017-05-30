<CFQUERY NAME="qGetVS_Setup"  DATASOURCE="photoeyecom">
  SELECT *
  FROM VS_Setup where Custnumber=#url.id#
</CFQUERY>

<CFQUERY NAME="qGetVS_Bibliography"  DATASOURCE="photoeyecom">
  SELECT *
  FROM VS_Bibliography where Custnumber=#url.id# and LEN(Catalog)>0 
  ORDER BY YEAR DESC
</CFQUERY>

<CFQUERY NAME="qGetVS_Favorite"  DATASOURCE="photoeyecom">
  SELECT *
  FROM VS_FavoriteBooks where Custnumber=#url.id# and LEN(CatNum)>0 
  ORDER BY TYPE, FIELDID
</CFQUERY>

<cfset Background="DDDDDD">
<cfoutput>


<div align="center"><center>
<table width="580" cellspacing="0" bgcolor="###Background#" border="0">
    <TR> 
      <TD ALIGN="center">
                 <BR>
           &nbsp; 
        <div align="center">
<font color="black" face="Verdana, Arial, Helvetica, Sans-Serif" size="3"><b>#qGetVS_Setup.FirstName# #qGetVS_Setup.LastName# Books <br><font size="2">Available from photo-eye</font></b></font>
                </FONT></STRONG>
        <HR ALIGN="center" SIZE="1" WIDTH="200" COLOR="red">
                        <font color="silver" face="Verdana, Arial, Helvetica, Sans-Serif" size="1"><strong>
                       <A href="javascript:history.back();">Back</A>
					    <!--- <A href="index.cfm?id=#url.id#">Back to Images</A> --->
        </STRONG></FONT><BR>
						
					
	<br>
	



	



<CFIF len(#qGetVS_Bibliography.Title#) is not 0>



<!----------------Start Bibliography----------->

<A NAME="Top"> </A>

<table width="90%" cellpadding="0" cellspacing="0" align="center">
	

		<tr>
			<td>
				<CFIF len(#qGetVS_Bibliography.Title#) is not 0>
					
				<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="darkblue"><b> 
Featured in: 
				 					</b></font><br><br>
				
				</cfif>
				
			</td> 
		</tr>
	
<!--- Bibliography Loop ---->	
	<cfloop query="qGetVS_Bibliography" startrow="1" endrow="#qGetVS_Bibliography.recordcount#">


	
	
	<CFIF len(#qGetVS_Bibliography.Title#) is not 0>

		<!--- If there is a period at the end of the title, strip it away--->
				<cfset cTitle=''>
				<cfif #Right(trim(qGetVS_Bibliography.Title),1)# is '.'>
					<cfset TitleLength =#len(trim(qGetVS_Bibliography.Title))#-1>
					<cfset cTitle = Left(trim(qGetVS_Bibliography.Title), TitleLength)>		
				<cfelse>
					<cfset cTitle = trim(#qGetVS_Bibliography.Title#)>
				</cfif>
				
	<tr>
		<td valign="top">
			<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
				
				<CFIF len(#qGetVS_Bibliography.Catalog#) is not 0>
					
					<cfif len(#qGetVS_Bibliography.Title#) GT 0>
					<a href="../../templates/ShowDetailsByCat.cfm?Catalog=#Left(qGetVS_Bibliography.Catalog,5)#<!--- &Showcase=1&ArtistF=#qGetVS_Setup.FirstName#&ArtistL=#qGetVS_Setup.LastName#&CustNumber=#url.id# --->">
					<font size="2">#cTitle#</font></a>. 
					</cfif>
				
				<cfelse>
				
					<cfif len(#qGetVS_Bibliography.Title#) GT 0>
					#cTitle#. 
					</cfif>
					
				</cfif>	
				
					<cfset BiblioText = ''>
					<cfif len(trim(#qGetVS_Bibliography.Author#)) GT 0>
						<cfset biblioText = '#biblioText##qGetVS_Bibliography.Author#.'>
					</cfif>
					
					<cfif len(trim(#qGetVS_Bibliography.Publisher#)) GT 0>
						<cfset biblioText = '#biblioText# <i>#qGetVS_Bibliography.Publisher#</i>,'>
					</cfif>
	
											
					<cfif len(trim(#qGetVS_Bibliography.City#)) GT 0>
						<cfset biblioText = '#biblioText#  <i>#qGetVS_Bibliography.City#</i>,'>
					</cfif>		

					
					<cfif len(trim(#qGetVS_Bibliography.Year#)) GT 0>
						<cfset biblioText = '#biblioText# <i>#qGetVS_Bibliography.Year#</i>'>
					</cfif>		

					<cfif Right(trim(biblioText),1) is ','>
						<cfset biblioText = Left(trim(biblioText),len(trim(biblioText))-1)>
					</cfif>	
					#biblioText#	
				
					<cfif len(#qGetVS_Bibliography.Catalog#) GT 0>
					<font size="1">(photo-eye Cat##&nbsp;#Left(qGetVS_Bibliography.Catalog,5)#)</font>
					</cfif>
					
				
			</font>
		</td>

	</tr>
	
	<tr>
		<td height="1">&nbsp;</td>
	</tr>
	

	</cfif>

	</cfloop>



<!-----Finish 1 Entry--------->


<!----------------End Bibliography----------->





<!--- <cfloop query="qGetVS_Favorite" startrow="1" endrow="#qGetVS_Favorite.recordcount#">

		<tr>
			<td>
				<!--- Show Favorite Book Type Header --->
				<CFIF len(#qGetVS_Favorite.Title#) is not 0 and #qGetVS_Favorite.Type# is not #FavoriteBookType#>
					<br>
			
					<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="darkblue"><b> Favorite #qGetVS_Favorite.Type# 
				 					</b></font><br><br>
				
				</cfif>
				<cfset FavoriteBookType=#qGetVS_Favorite.Type#>
				
			</td> 
		</tr> --->


<!---------------Start top of Favorite Books Page code---------->


<CFIF len(#qGetVS_Favorite.Title#) is not 0 and #qGetVS_Favorite.RecordCount# GT 15>


		<tr>
			
			<td align="right"><a href="##TOP"><font style="text-decoration:none"><b>Top of Page</b></font></a></b></font></td>
		
		</tr>

</cfif> 
	
</table>

</cfif>


	
	

<CFIF len(#qGetVS_Favorite.Title#) is not 0>



<!----------------Start Favorite Books----------->

<A NAME="Top"> </A>

<table width="90%" cellpadding="0" cellspacing="0" align="center">
	

<cfset FavoriteBookType="">
	
<!--- Favorite Books Loop ---->	
<cfloop query="qGetVS_Favorite" startrow="1" endrow="#qGetVS_Favorite.recordcount#">


<CFIF len(#qGetVS_Favorite.Title#) is not 0>

		<tr>
			<td>
				<!--- Show Favorite Book Type Header --->
				<CFIF len(#qGetVS_Favorite.Title#) is not 0 and #qGetVS_Favorite.Type# is not #FavoriteBookType#>
					<br>
			
					<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="darkblue"><b> Favorite #qGetVS_Favorite.Type#: 
				 					</b></font><br><br>
				
				</cfif>
				<cfset FavoriteBookType=#qGetVS_Favorite.Type#>
				
			</td> 
		</tr>

	<tr>
		<td valign="top">
			<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="1" COLOR="black">
				
				<CFIF len(#qGetVS_Favorite.CatNum#) is not 0>
					
					<cfif len(#qGetVS_Favorite.Title#) GT 0>
					<a href="../../templates/ShowDetailsByCatGallery.cfm?Catalog=#Left(qGetVS_Favorite.CatNum,5)#&Showcase=1&ArtistF=#qGetVS_Setup.FirstName#&ArtistL=#qGetVS_Setup.LastName#&CustNumber=#url.id#">
					<font size="2"><i>#qGetVS_Favorite.Title#</i></font></a>, 
					</cfif>
				
				<cfelse>
				
					<cfif len(#qGetVS_Favorite.Title#) GT 0>
					<i>#qGetVS_Favorite.Title#</i>, 
					</cfif>
					
				</cfif>	
				
					<cfif len(#qGetVS_Favorite.Authors#) GT 0>
					#qGetVS_Favorite.Authors#,
					</cfif>
		
				
					<cfif len(#qGetVS_Favorite.Catnum#) GT 0>
					<font size="1">(photo-eye Cat##&nbsp;#Left(qGetVS_Favorite.Catnum,5)#)</font>
					</cfif>
					
				
			</font>
		</td>

	</tr>
	
	<tr>
		<td height="1">&nbsp;</td>
	</tr>
	

</cfif>

</cfloop>

<!-----Finish 1 Entry--------->


<!----------------End Favorite----------->




<!---------------Start top of Page code---------->


<CFIF len(#qGetVS_Favorite.Title#) is not 0 and #qGetVS_Favorite.RecordCount# GT 15>

		<tr>
			
			<td align="right"><a href="##TOP"><font style="text-decoration:none"><b>Top of Page</b></font></a></b></font></td>
		
		</tr>

</cfif> 
	
</table>

</cfif>

</cfoutput>
	
	
</td>

	</tr>
	</table>
