<cfparam name="backgroundcolor" default="##DDDDDD">
<cfparam name="closewindow" default="0">

<CFQUERY NAME="qGetVS_Setup"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM VS_Setup where Custnumber=#url.id# 
</CFQUERY>

<!--- <CFQUERY NAME="qGetVS_Setup2"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM GallerySetup2 where Custnumber=#url.id#
</CFQUERY> --->

<CFQUERY NAME="qGetVS_Chronology"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM VS_Chronology where Custnumber=#url.id# and LEN(description)>0 ORDER BY Year
</CFQUERY>

<CFQUERY NAME="qGetVS_Collections"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM VS_Collections where Custnumber=#url.id# and LEN(Name)>0
  ORDER BY FIELDID 
</CFQUERY>

<CFQUERY NAME="qGetVS_Education"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM VS_Education where Custnumber=#url.id# and LEN(School)>0  ORDER BY YEARBEGIN
</CFQUERY>

<CFQUERY NAME="qGetVS_SoloShows"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM VS_SoloShows where Custnumber=#url.id# and LEN(Venue)>0 ORDER BY Year DESC
</CFQUERY>

<CFQUERY NAME="qGetVS_GroupShows"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM VS_GroupShows where Custnumber=#url.id# and LEN(Venue)>0  ORDER BY Year DESC
</CFQUERY>

<CFQUERY NAME="qGetVS_Awards"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM VS_Awards where Custnumber=#url.id# and LEN(Name)>0 ORDER BY Year DESC
</CFQUERY>

<CFQUERY NAME="qGetVS_Bibliography"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM VS_Bibliography where Custnumber=#url.id# and LEN(Title)>0 ORDER BY YEAR DESC
</CFQUERY>


<CFQUERY NAME="qGetVS_Favorite"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM VS_FavoriteBooks where Custnumber=#url.id# AND LEN(TITLE)>0
  ORDER BY TYPE, FIELDID
</CFQUERY>

<!--- <CFQUERY NAME="qGetVS_FavoriteBooksM"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryFavoriteBooks where Custnumber=#url.id# and LEN(Title)>0 and Type='Monographs'
</CFQUERY>

<CFQUERY NAME="qGetVS_FavoriteBooksT"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryFavoriteBooks where Custnumber=#url.id# and LEN(Title)>0 and Type='Technical'
</CFQUERY> --->



<A NAME="Top"> </A>



<cfoutput>


<div align="center"><center>
<table width="580" cellspacing="0" bgcolor="#BACKGROUNDCOLOR#" border="0" align="center">
    <TR> 
      
      <TD align="center" VALIGN="TOP">
           &nbsp; 
        <div align="center">
<font color="black" face="Verdana, Arial, Helvetica, Sans-Serif" size="3"><b><!--- #qGetVS_Setup.FirstName# #qGetVS_Setup.LastName#  --->Bio</b></font>
                </FONT></STRONG>
        <HR ALIGN="center" SIZE="1" WIDTH="200" COLOR="red">
		<cfif closewindow is 1>
                        <font color="silver" face="Verdana, Arial, Helvetica, Sans-Serif" size="1"><strong>
                        <A href="javascript:window.close();">Close Window</A>
					  <!---   <A href="index.cfm?id=#url.id#">Back to Images</A> --->
        </STRONG></FONT><BR><br>
						
						
						</cfif><br>
						
	

		
<!---------Start Page Links to Different sections of Bio----------->						
				
<table width="90%" cellpadding="0" cellspacing="0" align="center"><tr><td><div align="center">
<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="1" COLOR="black">
<cfset headercount=0>
<CFIF #qGetVS_Chronology.recordcount# is not 0><a href="##Chronology"><font style="text-decoration:none">Chronology</font></a> 
<cfset headercount = headercount+1>
</cfif>

<CFIF #qGetVS_Awards.recordcount# is not 0 and #headercount# GT 0>
<a href="##Awards"><font style="text-decoration:none">|&nbsp;Awards</font></a> 
<cfset headercount = headercount+1>
<cfelse>
 <CFIF #qGetVS_Awards.recordcount# is not 0 and #headercount# is 0>
<a href="##Awards"><font style="text-decoration:none">Awards</font></a> 
	<cfset headercount = headercount+1>
</cfif>
</cfif>

 <CFIF #qGetVS_SoloShows.recordcount# is not 0 and #headercount# GT 0>
 <a href="##SoloExhibitions"><font style="text-decoration:none">|&nbsp;Solo&nbsp;Exhibitions</font></a>
<cfset headercount = headercount+1>
 <cfelse>
  <CFIF #qGetVS_SoloShows.recordcount# is not 0 and #headercount# is 0>
  <a href="##SoloExhibitions"><font style="text-decoration:none">Solo&nbsp;Exhibitions</font></a>
	<cfset headercount = headercount+1>
  </CFIF>
</cfif> 

 <CFIF #qGetVS_GroupShows.recordcount# is not 0><a href="##GroupExhibitions"><font style="text-decoration:none">|&nbsp;Group&nbsp;Exhibitions</font></a>
<cfset headercount = headercount+1>
</cfif>

<CFIF #qGetVS_Collections.recordcount# is not 0><a href="##Collections"><font style="text-decoration:none">|&nbsp;Collections</font></a> 
<cfset headercount = headercount+1>
</cfif>
<CFIF #qGetVS_Bibliography.recordcount# is not 0><a href="##Bibliography"><font style="text-decoration:none">|&nbsp;Bibliography</font></a>
<cfset headercount = headercount+1>
</cfif>
<br>
<CFIF #qGetVS_Favorite.recordcount# is not 0 and #trim(headercount)# GT 4>
<a href="##FavoritePhotographyBooks"><font style="text-decoration:none">Favorite&nbsp;Photography&nbsp;Books</font></a>
	<cfelse>
<CFIF #qGetVS_Favorite.recordcount# is not 0>
<a href="##FavoritePhotographyBooks"><font style="text-decoration:none">|&nbsp;Favorite&nbsp;Photography&nbsp;Books</font></a>
</CFIF>
</cfif>

</font></div></td></tr></table>
       </div>


<table width="90%" cellpadding="0" cellspacing="0" align="center">
<!-----End Page Links to Different sections of Bio------->

		
<!-------------Start Artistic Statement------------->

<!----------------Start Chronology----------->

<!--- <A NAME="Chronology"> </A>


	
	<CFIF len(#qGetVS_Setup.Birth#) is not 0>
		<tr>
			<td><br>
				<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="darkblue"><b> Chronlogy					</b></font><br><br>

			</td> 
			<td>&nbsp;</td>

		</tr>
	</cfif>	
	
	
	
	<!-----Birth Entry --------->	

<CFIF len(#qGetVS_Setup.Birth#) is not 0>

  <tr>
	<td width="25%" valign="top">
		<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="1" COLOR="black"><cfif len(#qGetVS_Setup.Birth#) GT 0>
				#qGetVS_Setup.Birth# 
				</cfif>
		</font> 
	</td>

	<td width="75%" valign="top">
		<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="1" COLOR="black">Born in 
		<cfif len(#qGetVS_Setup.BirthL#) GT 0>
				#qGetVS_Setup.BirthL# 
		</cfif>
		</font>
	</td>

	</tr>
	<tr>
		<td height="1">&nbsp;</td>
		<td height="1">&nbsp;</td>
	</tr>

</cfif>

<!-----End Birth--------->




	 --->

<!----- Education Loop --------->	
<CFIF #qGetVS_Education.recordcount# is not 0>

	<CFIF len(trim(#qGetVS_Education.School#)) is not 0>
		<tr>
			<td><br>
				<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="darkblue"><b> Education					</b></font><br><br>

			</td> 
			<td>&nbsp;</td>

		</tr>
	</cfif>	

<cfloop query="qGetVS_Education" startrow="1" endrow="#qGetVS_Education.recordcount#">
	
  <tr>
	<td width="25%" valign="top">
		<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
			<cfif len(trim(#qGetVS_Education.YearBegin#)) GT 0 and len(trim(#qGetVS_Education.YearEnd#)) GT 0 >
				#qGetVS_Education.YearBegin# - #qGetVS_Education.YearEnd#
			<cfelseif len(trim(#qGetVS_Education.YearBegin#)) GT 0 and len(trim(#qGetVS_Education.YearEnd#)) is 0>
				#qGetVS_Education.YearBegin#
			<cfelseif len(trim(#qGetVS_Education.YearBegin#)) is 0 and len(trim(#qGetVS_Education.YearEnd#)) GT 0>
				#trim(qGetVS_Education.YearEnd)#
			</cfif>
		</font>
	</td> 

	<td width="75%" valign="top">
		<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
		<cfif len(trim(#qGetVS_Education.School#)) GT 0 and len(trim(#qGetVS_Education.Degree#)) GT 0>
			#trim(qGetVS_Education.School)#, #trim(qGetVS_Education.Degree)#
		<cfelseif len(trim(#qGetVS_Education.School#)) GT 0>
			#trim(qGetVS_Education.School)#
		</cfif>
		</font>
	</td>

	</tr>
	<tr>
		<td height="1">&nbsp;</td>
		<td height="1"><FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
		<cfif len(trim(#qGetVS_Education.Teacher1#)) GT 0 and len(trim(#qGetVS_Education.Teacher2#)) GT 0 and len(trim(#qGetVS_Education.Teacher3#)) GT 0>
			Studied with #qGetVS_Education.Teacher1#, #qGetVS_Education.Teacher2#, and #qGetVS_Education.Teacher3#  
		<cfelseif len(trim(#qGetVS_Education.Teacher1#)) GT 0 and len(trim(#qGetVS_Education.Teacher2#)) GT 0>
			Studied with #qGetVS_Education.Teacher1# and #qGetVS_Education.Teacher2#
		<cfelseif len(trim(#qGetVS_Education.Teacher1#)) GT 0>
			Studied with #qGetVS_Education.Teacher1#	
		</cfif>
		</font></td>
	</tr>
</cfloop>
</cfif>
	
<!-------------End of Education Loop ---------->



<!----- Chronology Loop --------->	

	<CFIF len(trim(#qGetVS_Setup.Birth#)) is not 0 or (#qGetVS_Chronology.recordcount# is not 0 and len(trim(#qGetVS_Chronology.Description#)) is not 0)>
		<tr>
			<td><br>
			<A NAME="Chronology"> </A>
				<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="darkblue"><b> Chronology				</b></font><br><br>

			</td> 
			<td>&nbsp;</td>

		</tr>
	</cfif>	

	<!-----Birth Entry --------->	

<CFIF len(trim(#qGetVS_Setup.Birth#)) is not 0>

  <tr>
	<td width="25%" valign="top">
		<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black"><cfif len(trim(#qGetVS_Setup.Birth#)) GT 0>
				#trim(qGetVS_Setup.Birth)# 
				</cfif>
		</font> 
	</td>

	<td width="75%" valign="top">
		<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
		<cfif len(trim(#qGetVS_Setup.BirthL#)) GT 0>
			Born, #trim(qGetVS_Setup.BirthL)# 
		<cfelse>
			Born 
		</cfif>
		</font>
	</td>

	</tr>
	<tr>
		<td height="1">&nbsp;</td>
		<td height="1">&nbsp;</td>
	</tr>

</cfif>

<!-----End Birth--------->


	
<cfloop query="qGetVS_Chronology" startrow="1" endrow="#qGetVS_Chronology.recordcount#">
  <tr>
	<td width="25%" valign="top">
		<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black"><cfif len(trim(#qGetVS_Chronology.Year#)) GT 0>
				#trim(qGetVS_Chronology.Year)# 
			</cfif>
		</font> 
	</td>

	<td width="75%" valign="top">
		<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
		<cfif len(trim(#qGetVS_Chronology.Description#)) GT 0>
			#trim(qGetVS_Chronology.Description)# 
		</cfif>
		</font>
	</td>

	</tr>
	<tr>
		<td height="1">&nbsp;</td>
		<td height="1">&nbsp;</td>
	</tr>

</cfloop>


<!-------------End of Chronology Loop ---------->




 <!---------------Start top of Page code---------->


	<CFIF #qGetVS_Chronology.recordcount# is not 0>

		<tr>
			<td>&nbsp;</td>
			<td align="right"><a href="##top"><font size="1" FACE="Verdana, Arial, Helvetica, Sans-Serif" style="text-decoration:none"><b>Top of Page</b></font></a></td>
		
		</tr>

	</cfif>
	
</table>



<CFIF len(trim(#qGetVS_Awards.Name#)) is not 0>




<!----------------Start Awards----------->

<CFIF len(trim(#qGetVS_Awards.Name#)) is not 0>
<br>

</cfif>


<A NAME="Awards"> </A>

<table width="90%" cellpadding="0" cellspacing="0" align="center">

	
		<tr>
			<td>
				<CFIF len(trim(#qGetVS_Awards.Name#)) is not 0>
					<br>
				<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="darkblue"><b> Awards 					</b></font><br><br>
				
				</cfif>
				
			</td> 
			<td>&nbsp;</td>

		</tr>
		
		
<!----- Awards Loop --------->	

<cfloop query="qGetVS_Awards" startrow="1" endrow="#qGetVS_Awards.recordcount#">

<CFIF len(trim(#qGetVS_Awards.Name#)) is not 0>

	<tr>
		<td width="25%" valign="top">
			<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
				<cfif len(trim(#qGetVS_Awards.Year#)) GT 0>
				#trim(qGetVS_Awards.Year)# 
				</cfif>
			</font> 
		</td>

		<td width="75%" valign="top">
			<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
				<cfif len(trim(#qGetVS_Awards.Name#)) GT 0 and len(TRIM(#qGetVS_Awards.Location#)) GT 0>
				<i>#trim(qGetVS_Awards.Name)#</i>,
				<cfelse>
				<i>#trim(qGetVS_Awards.Name)#</i>
				</cfif>
								
				<cfif len(TRIM(#qGetVS_Awards.Location#)) GT 0>
				#trim(qGetVS_Awards.Location)# 
				</cfif>
				
			</font>
</td>

</tr>
<tr>
	<td height="1">&nbsp;</td>
	<td height="1">&nbsp;</td>
</tr>

</cfif>
</cfloop>

<!-----Finish Awards Entry--------->


<!----------------End Awards----------->


<!---------------Start top of Page code---------->


	<CFIF len(TRIM(#qGetVS_Awards.Name#)) is not 0>

		<tr>
			<td>&nbsp;</td>
			<td align="right"><a href="##top"><font size="1" FACE="Verdana, Arial, Helvetica, Sans-Serif" style="text-decoration:none"><b>Top of Page</b></font></a></td>
		
		</tr>

	</cfif>
	
</table>

</cfif>


<!---------------End top of Page code---------->



<CFIF len(TRIM(#qGetVS_SoloShows.Venue#)) is not 0>


<!---------------End top of Page code---------->


<!----------------Solo Exhibition Loop----------->

<A NAME="SoloExhibitions"> </A>
<table width="90%" cellpadding="0" cellspacing="0" align="center">
		<tr>
			<td>
				<CFIF len(TRIM(#qGetVS_SoloShows.Venue#)) is not 0>
					<br>
				<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="darkblue"><b> Solo Exhibitions 					</b></font><br><br>
				
				</cfif>
				
			</td> 
			<td>&nbsp;</td>

		</tr>
		
<cfloop query="qGetVS_SoloShows" startrow="1" endrow="#qGetVS_SoloShows.recordcount#">
	
	<tr>
		<td width="25%" valign="top">
			<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
				<cfif len(TRIM(#qGetVS_SoloShows.Year#)) GT 0>
				#TRIM(qGetVS_SoloShows.Year)# 
				</cfif>
			</font> 
		</td>


<CFIF len(TRIM(#qGetVS_SoloShows.Venue#)) is not 0>


		<td width="75%" valign="top">
			<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
				<cfif len(TRIM(#qGetVS_SoloShows.Title#)) GT 0>
				<i>#TRIM(qGetVS_SoloShows.Title)#</i>,
				</cfif>
				
				<cfif len(TRIM(#qGetVS_SoloShows.Venue#)) GT 0>
				#TRIM(qGetVS_SoloShows.Venue)#, 
				</cfif>
				
				<cfif len(TRIM(#qGetVS_SoloShows.Location#)) GT 0>
				#TRIM(qGetVS_SoloShows.Location)# 
				</cfif>
				
			</font>
</td>

</tr>
<tr>
	<td height="1">&nbsp;</td>
	<td height="1">&nbsp;</td>
</tr>

</cfif>

</cfloop>

<!-----Finish Solo Exhibitions Entry--------->



<!---------------Start top of Page code---------->


	<CFIF len(TRIM(#qGetVS_SoloShows.Venue#)) is not 0>

		<tr>
			<td>&nbsp;</td>
			<td align="right"><a href="##top"><font size="1" FACE="Verdana, Arial, Helvetica, Sans-Serif" style="text-decoration:none"><b>Top of Page</b></font></a></td>
		
		</tr>

	</cfif>
	
</table>

</cfif>
<!---------------End top of Page code---------->



<!----------------Group Exhibition Loop----------->

<CFIF len(TRIM(#qGetVS_GroupShows.Venue#)) is not 0>



<A NAME="GroupExhibitions"> </A>

<table width="90%" cellpadding="0" cellspacing="0" align="center">
		<tr>
			<td>
				<CFIF len(TRIM(#qGetVS_GroupShows.Venue#)) is not 0>
					<br>
				<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="darkblue"><b> Group Exhibitions 					</b></font><br><br>
				
				</cfif>
				
			</td> 
			<td>&nbsp;</td>

		</tr>
		
<cfloop query="qGetVS_GroupShows" startrow="1" endrow="#qGetVS_GroupShows.recordcount#">
	
	<tr>
		<td width="25%" valign="top">
			<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
				<cfif len(TRIM(#qGetVS_GroupShows.Year#)) GT 0>
				#TRIM(qGetVS_GroupShows.Year)# 
				</cfif>
			</font> 
		</td>


<CFIF len(#qGetVS_GroupShows.Venue#) is not 0>


		<td width="75%" valign="top">
			<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
				<cfif len(TRIM(#qGetVS_GroupShows.Title#)) GT 0>
				<i>#TRIM(qGetVS_GroupShows.Title)#</i>,
				</cfif>
				
				<cfif len(TRIM(#qGetVS_GroupShows.Venue#)) GT 0>
				#TRIM(qGetVS_GroupShows.Venue)#, 
				</cfif>
				
				<cfif len(TRIM(#qGetVS_GroupShows.Location#)) GT 0>
				#TRIM(qGetVS_GroupShows.Location)# 
				</cfif>
				
			</font>
</td>

</tr>
<tr>
	<td height="1">&nbsp;</td>
	<td height="1">&nbsp;</td>
</tr>

</cfif>

</cfloop>

<!-----Finish Group Exhibitions Loop--------->





<!---------------Start top of Page code---------->

	<CFIF len(#qGetVS_GroupShows.Venue#) is not 0>

		<tr>
			<td>&nbsp;</td>
	<td align="right"><a href="##top"><font size="1" FACE="Verdana, Arial, Helvetica, Sans-Serif" style="text-decoration:none"><b>Top of Page</b></font></a></td>
		
		</tr>

	</cfif>
	
</table>

</cfif>

<!---------------End top of Page code---------->




<CFIF len(#qGetVS_Collections.Name#) is not 0>



<CFIF len(#qGetVS_Collections.Name#) is not 0>
<br>
<br>
</cfif>


<!----------------Start Collections----------->

<A NAME="Collections"> </A>
<table width="90%" cellpadding="0" cellspacing="0" align="center">
	
	
		<tr>
			<td>
				<CFIF len(#qGetVS_Collections.Name#) is not 0>
					<br>
				<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="darkblue"><b> Collections 					</b></font><br><br>
				
				</cfif>
				
			</td> 
		</tr>
		
<!--- Collections Loop ---->	
<cfloop query="qGetVS_Collections" startrow="1" endrow="#qGetVS_Collections.recordcount#">

<CFIF len(#qGetVS_Collections.Name#) is not 0>

	<tr>
		<td valign="top">
			<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
				<cfif len(#qGetVS_Collections.Name#) GT 0 and len(#qGetVS_Collections.Location#) is 0>
				#qGetVS_Collections.Name# 
				<cfelse>
					#qGetVS_Collections.Name#, #qGetVS_Collections.Location#
				</cfif>
								
			</font>
		</td>

	</tr>
	
	

</cfif>

</cfloop>


<!----------------End Collections----------->


<!---------------Start top of Page code---------->


	<CFIF len(#qGetVS_Collections.Name#) is not 0>

		
			<td align="right"><a href="##top"><font size="1" FACE="Verdana, Arial, Helvetica, Sans-Serif" style="text-decoration:none"><b>Top of Page</b></font></a></td>
		
		</tr>

	</cfif>
	
</table>

</cfif>







<!---------------End top of Page code---------->



<CFIF len(#qGetVS_Bibliography.Title#) is not 0>



<!----------------Start Bibliography----------->

<A NAME="Bibliography"> </A>

<table width="90%" cellpadding="0" cellspacing="0" align="center">
	
	
		<tr>
			<td>
				<CFIF len(#qGetVS_Bibliography.Title#) is not 0>
					<br>
				<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="darkblue"><b> Bibliography 					</b></font><br><br>
				
				</cfif>
				
			</td> 
		</tr>
		
	
<!--- Bibliography Loop ---->	
<cfloop query="qGetVS_Bibliography" startrow="1" endrow="#qGetVS_Bibliography.recordcount#">


<CFIF len(#qGetVS_Bibliography.Title#) is not 0>

	<tr>
		<td valign="top">
			<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
				
	<!--- If there is a period at the end of the title, strip it away--->
				<cfset cTitle=''>
				<cfif #Right(trim(qGetVS_Bibliography.Title),1)# is '.'>
					<cfset TitleLength =#len(trim(qGetVS_Bibliography.Title))#-1>
					<cfset cTitle = Left(trim(qGetVS_Bibliography.Title), TitleLength)>		
				<cfelse>
					<cfset cTitle = trim(#qGetVS_Bibliography.Title#)>
				</cfif>
				<CFIF len(trim(#qGetVS_Bibliography.Catalog#)) is not 0>
					
					<cfif len(trim(#qGetVS_Bibliography.Title#)) GT 0>
					<a href="../../templates/ShowDetailsByCatGallery.cfm?Catalog=#Left(qGetVS_Bibliography.Catalog,5)#&Showcase=1&&ArtistF=#qGetVS_Setup.FirstName#&ArtistL=#qGetVS_Setup.LastName#">
					#cTitle#</a>. 
					</cfif>
				
				<cfelse>
				
					<cfif len(trim(#qGetVS_Bibliography.Title#)) GT 0>
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

					<cfif Right(trim(#biblioText#),1) is ','>
						<cfset biblioText = Left(trim(#biblioText#),len(trim(#biblioText#))-1)>
					</cfif>	
					#biblioText#
					
					<cfif len(#qGetVS_Bibliography.Catalog#) GT 0>
					<font size="1">(photo-eye Cat##&nbsp;#qGetVS_Bibliography.Catalog#)</font>
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



<!---------------Start top of Page code---------->


	<CFIF len(#qGetVS_Bibliography.Title#) is not 0>

		<tr>
			
			<td align="right"><a href="##top"><font size="1" FACE="Verdana, Arial, Helvetica, Sans-Serif" style="text-decoration:none"><b>Top of Page</b></font></a></td>
		
		</tr>

	</cfif>
	
</table>

</cfif>

<!--- <cfoutput> --->
<!---------------End top of Page code---------->


	

<CFIF len(#qGetVS_Favorite.Title#) is not 0>



<!----------------Start Favorite Books----------->

<A NAME="FavoritePhotographyBooks"> </A>

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
			
					<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="darkblue"><b> <cfif Ucase(qGetVS_Favorite.Type) is 'MONOGRAPHS'>
							 Favorite Photography Books
							  <cfelse>
							 	Favorite #qGetVS_Favorite.Type# Photography Books
							  </cfif>
				 					</b></font><br><br>
				
				</cfif>
				<cfset FavoriteBookType=#qGetVS_Favorite.Type#>
				
			</td> 
		</tr>

	<tr>
		<td valign="top">

			<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
				
				<CFIF len(#qGetVS_Favorite.CatNum#) is not 0>
					
					<cfif len(#qGetVS_Favorite.Title#) GT 0>
					<a href="../../templates/ShowDetailsByCatGallery.cfm?Catalog=#Left(qGetVS_Favorite.CatNum,5)#&Showcase=1&ArtistF=#qGetVS_Setup.FirstName#&ArtistL=#qGetVS_Setup.LastName#">
					<i>#qGetVS_Favorite.Title#</i></a>, 
					</cfif>
				
				<cfelse>
				
					<cfif len(#qGetVS_Favorite.Title#) GT 0>
					<i>#qGetVS_Favorite.Title#</i><cfif len(#qGetVS_Favorite.Authors#) GT 0 or len(#qGetVS_Favorite.Catnum#) GT 0>,</cfif> 
					</cfif>
					
				</cfif>	
				
					<cfif len(#qGetVS_Favorite.Authors#) GT 0>
					#qGetVS_Favorite.Authors#<cfif len(#qGetVS_Favorite.Catnum#) GT 0>,</cfif>
					</cfif>
		
				
					<cfif len(#qGetVS_Favorite.Catnum#) GT 0>
					<font size="1">(photo-eye Cat##&nbsp;#qGetVS_Favorite.Catnum#)</font>
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
			
			<td align="right"><a href="##top"><font size="1" FACE="Verdana, Arial, Helvetica, Sans-Serif" style="text-decoration:none"><b>Top of Page</b></font></a></td>
		
		</tr>

</cfif> 

</cfif>
	
	
	<br><br><br>
</table>


<!---------------End top of Page code---------->

<br><br><br>

</td>

			<td width="40">

			</td>

</tr></table>


</center></div>
</cfoutput>


