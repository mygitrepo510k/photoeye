<CFQUERY NAME="qGallerySetup"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup where Custnumber=#url.id#
</CFQUERY>

<CFQUERY NAME="qGalleryBibliography"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryBibliography where Custnumber=#url.id# and LEN(Catalog)>0 
  ORDER BY YEAR DESC
</CFQUERY>

<CFQUERY NAME="qGalleryFavorite"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryFavoriteBooks where Custnumber=#url.id# and LEN(CatNum)>0 
  ORDER BY TYPE, FIELDID
</CFQUERY>


<cfoutput>

<div align="center"><center>
<table width="580" cellspacing="0" bgcolor="white" border="0">
    <TR> 
      <TD ALIGN="center">
                 <BR>
           &nbsp; 
        <div align="center">
<font color="black" face="Verdana, Arial, Helvetica, Sans-Serif" size="3"><b>#qGallerySetup.FirstName# #qGallerySetup.LastName# Books <br><font size="2">Available from photo-eye</font></b></font>
                </FONT></STRONG>
        <HR ALIGN="center" SIZE="1" WIDTH="200" COLOR="red"><BR>
						
					
	<br><br>


<CFIF len(#qGalleryBibliography.Title#) is not 0>



<!----------------Start Bibliography----------->

<A NAME="Top"> </A>

<table width="90%" cellpadding="0" cellspacing="0" align="center">
	

		<tr>
			<td>
				<CFIF len(#qGalleryBibliography.Title#) is not 0>
					<br>
				<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="darkblue"><b> 
Featured in: 
				 					</b></font><br><br>
				
				</cfif>
				
			</td> 
		</tr>
	
<!--- Bibliography Loop ---->	
	<cfloop query="qGalleryBibliography" startrow="1" endrow="#qGalleryBibliography.recordcount#">


	
	
	<CFIF len(#qGalleryBibliography.Title#) is not 0>

		<!--- If there is a period at the end of the title, strip it away--->
				<cfset cTitle=''>
				<cfif #Right(trim(qGalleryBibliography.Title),1)# is '.'>
					<cfset TitleLength =#len(trim(qGalleryBibliography.Title))#-1>
					<cfset cTitle = Left(trim(qGalleryBibliography.Title), TitleLength)>		
				<cfelse>
					<cfset cTitle = trim(#qGalleryBibliography.Title#)>
				</cfif>
				
	<tr>
		<td valign="top">
			<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
				
				<CFIF len(#qGalleryBibliography.Catalog#) is not 0>
					
					<cfif len(#qGalleryBibliography.Title#) GT 0>
					<a href="../../bookstore/citation.cfm?Catalog=#Left(qGalleryBibliography.Catalog,5)#">
					<font size="2">#cTitle#</font></a>. 
					</cfif>
				
				<cfelse>
				
					<cfif len(#qGalleryBibliography.Title#) GT 0>
					#cTitle#. 
					</cfif>
					
				</cfif>	
				
					<cfset BiblioText = ''>
					<cfif len(trim(#qGalleryBibliography.Author#)) GT 0>
						<cfset biblioText = '#biblioText##qGalleryBibliography.Author#.'>
					</cfif>
					
					<cfif len(trim(#qGalleryBibliography.Publisher#)) GT 0>
						<cfset biblioText = '#biblioText# <i>#qGalleryBibliography.Publisher#</i>,'>
					</cfif>
	
											
					<cfif len(trim(#qGalleryBibliography.City#)) GT 0>
						<cfset biblioText = '#biblioText#  <i>#qGalleryBibliography.City#</i>,'>
					</cfif>		

					
					<cfif len(trim(#qGalleryBibliography.Year#)) GT 0>
						<cfset biblioText = '#biblioText# <i>#qGalleryBibliography.Year#</i>'>
					</cfif>		

					<cfif Right(trim(biblioText),1) is ','>
						<cfset biblioText = Left(trim(biblioText),len(trim(biblioText))-1)>
					</cfif>	
					#biblioText#	
				
					<cfif len(#qGalleryBibliography.Catalog#) GT 0>
					<font size="1">(photo-eye Cat##&nbsp;#Left(qGalleryBibliography.Catalog,5)#)</font>
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





<!--- <cfloop query="qGalleryFavorite" startrow="1" endrow="#qGalleryFavorite.recordcount#">

		<tr>
			<td>
				<!--- Show Favorite Book Type Header --->
				<CFIF len(#qGalleryFavorite.Title#) is not 0 and #qGalleryFavorite.Type# is not #FavoriteBookType#>
					<br>
			
					<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="darkblue"><b> Favorite #qGalleryFavorite.Type# 
				 					</b></font><br><br>
				
				</cfif>
				<cfset FavoriteBookType=#qGalleryFavorite.Type#>
				
			</td> 
		</tr> --->


<!---------------Start top of Favorite Books Page code---------->


<CFIF len(#qGalleryFavorite.Title#) is not 0 and #qGalleryFavorite.RecordCount# GT 15>


		<tr>
			
			<td align="right"><a href="##TOP"><font style="text-decoration:none"><b>Top of Page</b></font></a></b></font></td>
		
		</tr>

</cfif> 
	
</table>

</cfif>


	
	

<CFIF len(#qGalleryFavorite.Title#) is not 0>



<!----------------Start Favorite Books----------->

<A NAME="Top"> </A>

<table width="90%" cellpadding="0" cellspacing="0" align="center">
	

<cfset FavoriteBookType="">
	
<!--- Favorite Books Loop ---->	
<cfloop query="qGalleryFavorite" startrow="1" endrow="#qGalleryFavorite.recordcount#">


<CFIF len(#qGalleryFavorite.Title#) is not 0>

		<tr>
			<td>
				<!--- Show Favorite Book Type Header --->
				<CFIF len(#qGalleryFavorite.Title#) is not 0 and #qGalleryFavorite.Type# is not #FavoriteBookType#>
					<br>
			
					<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="darkblue"><b> Favorite #qGalleryFavorite.Type#: 
				 					</b></font><br><br>
				
				</cfif>
				<cfset FavoriteBookType=#qGalleryFavorite.Type#>
				
			</td> 
		</tr>

	<tr>
		<td valign="top">
			<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="1" COLOR="black">
				
				<CFIF len(#qGalleryFavorite.CatNum#) is not 0>
					
					<cfif len(#qGalleryFavorite.Title#) GT 0>
					<a href="../../bookstore/citation.cfm?Catalog=#Left(qGalleryFavorite.CatNum,5)#" >
					<font size="2"><i>#qGalleryFavorite.Title#</i></font></a>, 
					</cfif>
				
				<cfelse>
				
					<cfif len(#qGalleryFavorite.Title#) GT 0>
					<i>#qGalleryFavorite.Title#</i>, 
					</cfif>
					
				</cfif>	
				
					<cfif len(#qGalleryFavorite.Authors#) GT 0>
					#qGalleryFavorite.Authors#,
					</cfif>
		
				
					<cfif len(#qGalleryFavorite.Catnum#) GT 0>
					<font size="1">(photo-eye Cat##&nbsp;#Left(qGalleryFavorite.Catnum,5)#)</font>
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


<CFIF len(#qGalleryFavorite.Title#) is not 0 and #qGalleryFavorite.RecordCount# GT 15>

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
</center></div>
	
<!---	</body>
</html>--->