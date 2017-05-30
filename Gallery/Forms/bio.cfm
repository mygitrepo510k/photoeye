<CFQUERY NAME="qGallerySetup"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM GallerySetup where Custnumber=#url.id# 
</CFQUERY>

<CFQUERY NAME="qGallerySetup2"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM GallerySetup2 where Custnumber=#url.id#
</CFQUERY>

<CFQUERY NAME="qGalleryChronology"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM GalleryChronology where Custnumber=#url.id# and LEN(description)>0 ORDER BY Year
</CFQUERY>

<CFQUERY NAME="qGalleryCollections"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM GalleryCollections where Custnumber=#url.id# and LEN(Name)>0
  ORDER BY FIELDID 
</CFQUERY>

<CFQUERY NAME="qGalleryEducation"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM GalleryEducation where Custnumber=#url.id# and LEN(School)>0  ORDER BY YEARBEGIN
</CFQUERY>

<CFQUERY NAME="qGallerySoloShows"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM GallerySoloShows where Custnumber=#url.id# and LEN(Venue)>0 ORDER BY Year DESC
</CFQUERY>

<CFQUERY NAME="qGalleryGroupShows"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM GalleryGroupShows where Custnumber=#url.id# and LEN(Venue)>0  ORDER BY Year DESC
</CFQUERY>

<CFQUERY NAME="qGalleryAwards"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM GalleryAwards where Custnumber=#url.id# and LEN(Name)>0 ORDER BY Year DESC
</CFQUERY>

<CFQUERY NAME="qGalleryBibliography"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM GalleryBibliography where Custnumber=#url.id# and LEN(Title)>0 ORDER BY YEAR DESC
</CFQUERY>


<CFQUERY NAME="qGalleryFavorite"  DATASOURCE="photoeyecom">
  SELECT Distinct *
  FROM GalleryFavoriteBooks where Custnumber=#url.id# AND LEN(TITLE)>0
  ORDER BY TYPE, FIELDID
</CFQUERY>

<!--- <CFQUERY NAME="qGalleryFavoriteBooksM"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryFavoriteBooks where Custnumber=#url.id# and LEN(Title)>0 and Type='Monographs'
</CFQUERY>

<CFQUERY NAME="qGalleryFavoriteBooksT"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryFavoriteBooks where Custnumber=#url.id# and LEN(Title)>0 and Type='Technical'
</CFQUERY> --->


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<A NAME="Top"> </A>
<head>
	<title>photo-eye | <cfoutput>#qGallerySetup.FirstName# #qGallerySetup.LastName#</cfoutput></title>



<!--- 		p {font-family:Verdana, Arial, Helvetica, Sans-Serif; font-size:10pt; color:black;}
    	A:link {font-family:Verdana, Arial, Helvetica, Sans-Serif; font-size:10pt; color:darkblue;}
    	A:visited {font-family:Verdana, Arial, Helvetica, Sans-Serif; font-size:10pt; color:darkblue;} --->
	<style type="text/css">   
				A:hover {color:red;}
				
	</style>


</head>



<SCRIPT LANGUAGE="JavaScript">

<!--





function _get_version()
{
return Math.round(parseFloat(navigator.appVersion)*1000);
}
function _get_os()
{
if (navigator.appVersion.indexOf("Win95") > 0) return "WIN95";
else if (navigator.appVersion.indexOf("Win16") > 0) return "WIN31";
else if (navigator.appVersion.indexOf("Mac") > 0) return "MAC";
else if (navigator.appVersion.indexOf("X11") > 0) return "UNIX";
else return "UNKNOWN";
}
var browser = new Object();

if (navigator.appName.substring(0,8) == "Netscape") {

        browser.name ="NN";
        browser.version=_get_version();
        browser.os=_get_os();
}

else if (navigator.appName.substring(0,9) == "Microsoft")
{
        browser.name="MSIE";
        browser.version=3000;
        browser.os="WIN95";

        }
else {
        browser.name=navigator.appName;
        browser.version=_get_version();
        browser.os=_get_os();
}

browser.langlevel = 1000;

if (browser.version == 2000){
document.write('<body bgcolor="White" link="darkblue" vlink="darkblue" alink="red">');
}
else {
document.write('<body bgcolor="#000000" link="darkblue" vlink="darkblue" alink="red">');
}

//-->
</SCRIPT>

               



<cfoutput>


<div align="center"><center>
<table width="580" cellspacing="0" bgcolor="white" border="0" align="center">
    <TR> 
      
      <TD align="center">
                 <BR>
           &nbsp; 
        <div align="center">
<font color="black" face="Verdana, Arial, Helvetica, Sans-Serif" size="3"><b>#qGallerySetup.FirstName# #qGallerySetup.LastName# Bio</b></font>
                </FONT></STRONG>
        <HR ALIGN="center" SIZE="1" WIDTH="200" COLOR="red">
                        <font color="silver" face="Verdana, Arial, Helvetica, Sans-Serif" size="1"><strong>
                        <A href="javascript:window.close();">Close Window</A>
					  <!---   <A href="index.cfm?id=#url.id#">Back to Images</A> --->
        </STRONG></FONT><BR>
						
						<br><br>
						
	

		
<!---------Start Page Links to Different sections of Bio----------->						
				
<table width="90%" cellpadding="0" cellspacing="0" align="center"><tr><td><div align="center">
<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="1" COLOR="black">
<cfset headercount=0>
<CFIF #qGalleryChronology.recordcount# is not 0><a href="##Chronology"><font style="text-decoration:none">Chronology</font></a> 
<cfset headercount = headercount+1>
</cfif>

<CFIF #qGalleryAwards.recordcount# is not 0 and #headercount# GT 0>
<a href="##Awards"><font style="text-decoration:none">|&nbsp;Awards</font></a> 
<cfset headercount = headercount+1>
<cfelse>
 <CFIF #qGalleryAwards.recordcount# is not 0 and #headercount# is 0>
<a href="##Awards"><font style="text-decoration:none">Awards</font></a> 
	<cfset headercount = headercount+1>
</cfif>
</cfif>

 <CFIF #qGallerySoloShows.recordcount# is not 0 and #headercount# GT 0>
 <a href="##SoloExhibitions"><font style="text-decoration:none">|&nbsp;Solo&nbsp;Exhibitions</font></a>
<cfset headercount = headercount+1>
 <cfelse>
  <CFIF #qGallerySoloShows.recordcount# is not 0 and #headercount# is 0>
  <a href="##SoloExhibitions"><font style="text-decoration:none">Solo&nbsp;Exhibitions</font></a>
	<cfset headercount = headercount+1>
  </CFIF>
</cfif> 

 <CFIF #qGalleryGroupShows.recordcount# is not 0><a href="##GroupExhibitions"><font style="text-decoration:none">|&nbsp;Group&nbsp;Exhibitions</font></a>
<cfset headercount = headercount+1>
</cfif>

<CFIF #qGalleryCollections.recordcount# is not 0><a href="##Collections"><font style="text-decoration:none">|&nbsp;Collections</font></a> 
<cfset headercount = headercount+1>
</cfif>
<CFIF #qGalleryBibliography.recordcount# is not 0><a href="##Bibliography"><font style="text-decoration:none">|&nbsp;Bibliography</font></a>
<cfset headercount = headercount+1>
</cfif>
<br>
<CFIF #qGalleryFavorite.recordcount# is not 0 and #trim(headercount)# GT 4>
<a href="##FavoritePhotographyBooks"><font style="text-decoration:none">Favorite&nbsp;Photography&nbsp;Books</font></a>
	<cfelse>
<CFIF #qGalleryFavorite.recordcount# is not 0>
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


	
	<CFIF len(#qGallerySetup.Birth#) is not 0>
		<tr>
			<td><br>
				<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="darkblue"><b> Chronlogy					</b></font><br><br>

			</td> 
			<td>&nbsp;</td>

		</tr>
	</cfif>	
	
	
	
	<!-----Birth Entry --------->	

<CFIF len(#qGallerySetup.Birth#) is not 0>

  <tr>
	<td width="25%" valign="top">
		<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="1" COLOR="black"><cfif len(#qGallerySetup.Birth#) GT 0>
				#qGallerySetup.Birth# 
				</cfif>
		</font> 
	</td>

	<td width="75%" valign="top">
		<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="1" COLOR="black">Born in 
		<cfif len(#qGallerySetup.BirthL#) GT 0>
				#qGallerySetup.BirthL# 
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
<CFIF #qGalleryEducation.recordcount# is not 0>

	<CFIF len(trim(#qGalleryEducation.School#)) is not 0>
		<tr>
			<td><br>
				<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="darkblue"><b> Education					</b></font><br><br>

			</td> 
			<td>&nbsp;</td>

		</tr>
	</cfif>	

<cfloop query="qGalleryEducation" startrow="1" endrow="#qGalleryEducation.recordcount#">
	
  <tr>
	<td width="25%" valign="top">
		<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
			<cfif len(trim(#qGalleryEducation.YearBegin#)) GT 0 and len(trim(#qGalleryEducation.YearEnd#)) GT 0 >
				#qGalleryEducation.YearBegin# - #qGalleryEducation.YearEnd#
			<cfelseif len(trim(#qGalleryEducation.YearBegin#)) GT 0 and len(trim(#qGalleryEducation.YearEnd#)) is 0>
				#qGalleryEducation.YearBegin#
			<cfelseif len(trim(#qGalleryEducation.YearBegin#)) is 0 and len(trim(#qGalleryEducation.YearEnd#)) GT 0>
				#trim(qGalleryEducation.YearEnd)#
			</cfif>
		</font>
	</td> 

	<td width="75%" valign="top">
		<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
		<cfif len(trim(#qGalleryEducation.School#)) GT 0 and len(trim(#qGalleryEducation.Degree#)) GT 0>
			#trim(qGalleryEducation.School)#, #trim(qGalleryEducation.Degree)#
		<cfelseif len(trim(#qGalleryEducation.School#)) GT 0>
			#trim(qGalleryEducation.School)#
		</cfif>
		</font>
	</td>

	</tr>
	<tr>
		<td height="1">&nbsp;</td>
		<td height="1"><FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
		<cfif len(trim(#qGalleryEducation.Teacher1#)) GT 0 and len(trim(#qGalleryEducation.Teacher2#)) GT 0 and len(trim(#qGalleryEducation.Teacher3#)) GT 0>
			Studied with #qGalleryEducation.Teacher1#, #qGalleryEducation.Teacher2#, and #qGalleryEducation.Teacher3#  
		<cfelseif len(trim(#qGalleryEducation.Teacher1#)) GT 0 and len(trim(#qGalleryEducation.Teacher2#)) GT 0>
			Studied with #qGalleryEducation.Teacher1# and #qGalleryEducation.Teacher2#
		<cfelseif len(trim(#qGalleryEducation.Teacher1#)) GT 0>
			Studied with #qGalleryEducation.Teacher1#	
		</cfif>
		</font></td>
	</tr>
</cfloop>
</cfif>
	
<!-------------End of Education Loop ---------->



<!----- Chronology Loop --------->	

	<CFIF len(trim(#qGallerySetup.Birth#)) is not 0 or (#qGalleryChronology.recordcount# is not 0 and len(trim(#qGalleryChronology.Description#)) is not 0)>
		<tr>
			<td><br>
			<A NAME="Chronology"> </A>
				<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="darkblue"><b> Chronology				</b></font><br><br>

			</td> 
			<td>&nbsp;</td>

		</tr>
	</cfif>	

	<!-----Birth Entry --------->	

<CFIF len(trim(#qGallerySetup.Birth#)) is not 0>

  <tr>
	<td width="25%" valign="top">
		<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black"><cfif len(trim(#qGallerySetup.Birth#)) GT 0>
				#trim(qGallerySetup.Birth)# 
				</cfif>
		</font> 
	</td>

	<td width="75%" valign="top">
		<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
		<cfif len(trim(#qGallerySetup.BirthL#)) GT 0>
			Born, #trim(qGallerySetup.BirthL)# 
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


	
<cfloop query="qGalleryChronology" startrow="1" endrow="#qGalleryChronology.recordcount#">
  <tr>
	<td width="25%" valign="top">
		<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black"><cfif len(trim(#qGalleryChronology.Year#)) GT 0>
				#trim(qGalleryChronology.Year)# 
			</cfif>
		</font> 
	</td>

	<td width="75%" valign="top">
		<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
		<cfif len(trim(#qGalleryChronology.Description#)) GT 0>
			#trim(qGalleryChronology.Description)# 
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


	<CFIF #qGalleryChronology.recordcount# is not 0>

		<tr>
			<td>&nbsp;</td>
			<td align="right"><a href="##top"><font size="1" FACE="Verdana, Arial, Helvetica, Sans-Serif" style="text-decoration:none"><b>Top of Page</b></font></a></td>
		
		</tr>

	</cfif>
	
</table>



<CFIF len(trim(#qGalleryAwards.Name#)) is not 0>




<!----------------Start Awards----------->

<CFIF len(trim(#qGalleryAwards.Name#)) is not 0>
<br>

</cfif>


<A NAME="Awards"> </A>

<table width="90%" cellpadding="0" cellspacing="0" align="center">

	
		<tr>
			<td>
				<CFIF len(trim(#qGalleryAwards.Name#)) is not 0>
					<br>
				<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="darkblue"><b> Awards 					</b></font><br><br>
				
				</cfif>
				
			</td> 
			<td>&nbsp;</td>

		</tr>
		
		
<!----- Awards Loop --------->	

<cfloop query="qGalleryAwards" startrow="1" endrow="#qGalleryAwards.recordcount#">

<CFIF len(trim(#qGalleryAwards.Name#)) is not 0>

	<tr>
		<td width="25%" valign="top">
			<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
				<cfif len(trim(#qGalleryAwards.Year#)) GT 0>
				#trim(qGalleryAwards.Year)# 
				</cfif>
			</font> 
		</td>

		<td width="75%" valign="top">
			<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
				<cfif len(trim(#qGalleryAwards.Name#)) GT 0 and len(TRIM(#qGalleryAwards.Location#)) GT 0>
				<i>#trim(qGalleryAwards.Name)#</i>,
				<cfelse>
				<i>#trim(qGalleryAwards.Name)#</i>
				</cfif>
								
				<cfif len(TRIM(#qGalleryAwards.Location#)) GT 0>
				#trim(qGalleryAwards.Location)# 
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


	<CFIF len(TRIM(#qGalleryAwards.Name#)) is not 0>

		<tr>
			<td>&nbsp;</td>
			<td align="right"><a href="##top"><font size="1" FACE="Verdana, Arial, Helvetica, Sans-Serif" style="text-decoration:none"><b>Top of Page</b></font></a></td>
		
		</tr>

	</cfif>
	
</table>

</cfif>


<!---------------End top of Page code---------->



<CFIF len(TRIM(#qGallerySoloShows.Venue#)) is not 0>


<!---------------End top of Page code---------->


<!----------------Solo Exhibition Loop----------->

<A NAME="SoloExhibitions"> </A>
<table width="90%" cellpadding="0" cellspacing="0" align="center">
		<tr>
			<td>
				<CFIF len(TRIM(#qGallerySoloShows.Venue#)) is not 0>
					<br>
				<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="darkblue"><b> Solo Exhibitions 					</b></font><br><br>
				
				</cfif>
				
			</td> 
			<td>&nbsp;</td>

		</tr>
		
<cfloop query="qGallerySoloShows" startrow="1" endrow="#qGallerySoloShows.recordcount#">
	
	<tr>
		<td width="25%" valign="top">
			<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
				<cfif len(TRIM(#qGallerySoloShows.Year#)) GT 0>
				#TRIM(qGallerySoloShows.Year)# 
				</cfif>
			</font> 
		</td>


<CFIF len(TRIM(#qGallerySoloShows.Venue#)) is not 0>


		<td width="75%" valign="top">
			<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
				<cfif len(TRIM(#qGallerySoloShows.Title#)) GT 0>
				<i>#TRIM(qGallerySoloShows.Title)#</i>,
				</cfif>
				
				<cfif len(TRIM(#qGallerySoloShows.Venue#)) GT 0>
				#TRIM(qGallerySoloShows.Venue)#, 
				</cfif>
				
				<cfif len(TRIM(#qGallerySoloShows.Location#)) GT 0>
				#TRIM(qGallerySoloShows.Location)# 
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


	<CFIF len(TRIM(#qGallerySoloShows.Venue#)) is not 0>

		<tr>
			<td>&nbsp;</td>
			<td align="right"><a href="##top"><font size="1" FACE="Verdana, Arial, Helvetica, Sans-Serif" style="text-decoration:none"><b>Top of Page</b></font></a></td>
		
		</tr>

	</cfif>
	
</table>

</cfif>
<!---------------End top of Page code---------->



<!----------------Group Exhibition Loop----------->

<CFIF len(TRIM(#qGalleryGroupShows.Venue#)) is not 0>



<A NAME="GroupExhibitions"> </A>

<table width="90%" cellpadding="0" cellspacing="0" align="center">
		<tr>
			<td>
				<CFIF len(TRIM(#qGalleryGroupShows.Venue#)) is not 0>
					<br>
				<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="darkblue"><b> Group Exhibitions 					</b></font><br><br>
				
				</cfif>
				
			</td> 
			<td>&nbsp;</td>

		</tr>
		
<cfloop query="qGalleryGroupShows" startrow="1" endrow="#qGalleryGroupShows.recordcount#">
	
	<tr>
		<td width="25%" valign="top">
			<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
				<cfif len(TRIM(#qGalleryGroupShows.Year#)) GT 0>
				#TRIM(qGalleryGroupShows.Year)# 
				</cfif>
			</font> 
		</td>


<CFIF len(#qGalleryGroupShows.Venue#) is not 0>


		<td width="75%" valign="top">
			<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
				<cfif len(TRIM(#qGalleryGroupShows.Title#)) GT 0>
				<i>#TRIM(qGalleryGroupShows.Title)#</i>,
				</cfif>
				
				<cfif len(TRIM(#qGalleryGroupShows.Venue#)) GT 0>
				#TRIM(qGalleryGroupShows.Venue)#, 
				</cfif>
				
				<cfif len(TRIM(#qGalleryGroupShows.Location#)) GT 0>
				#TRIM(qGalleryGroupShows.Location)# 
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

	<CFIF len(#qGalleryGroupShows.Venue#) is not 0>

		<tr>
			<td>&nbsp;</td>
	<td align="right"><a href="##top"><font size="1" FACE="Verdana, Arial, Helvetica, Sans-Serif" style="text-decoration:none"><b>Top of Page</b></font></a></td>
		
		</tr>

	</cfif>
	
</table>

</cfif>

<!---------------End top of Page code---------->




<CFIF len(#qGalleryCollections.Name#) is not 0>



<CFIF len(#qGalleryCollections.Name#) is not 0>
<br>
<br>
</cfif>


<!----------------Start Collections----------->

<A NAME="Collections"> </A>
<table width="90%" cellpadding="0" cellspacing="0" align="center">
	
	
		<tr>
			<td>
				<CFIF len(#qGalleryCollections.Name#) is not 0>
					<br>
				<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="darkblue"><b> Collections 					</b></font><br><br>
				
				</cfif>
				
			</td> 
		</tr>
		
<!--- Collections Loop ---->	
<cfloop query="qGalleryCollections" startrow="1" endrow="#qGalleryCollections.recordcount#">

<CFIF len(#qGalleryCollections.Name#) is not 0>

	<tr>
		<td valign="top">
			<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
				<cfif len(#qGalleryCollections.Name#) GT 0 and len(#qGalleryCollections.Location#) is 0>
				#qGalleryCollections.Name# 
				<cfelse>
					#qGalleryCollections.Name#, #qGalleryCollections.Location#
				</cfif>
								
			</font>
		</td>

	</tr>
	
	

</cfif>

</cfloop>


<!----------------End Collections----------->


<!---------------Start top of Page code---------->


	<CFIF len(#qGalleryCollections.Name#) is not 0>

		
			<td align="right"><a href="##top"><font size="1" FACE="Verdana, Arial, Helvetica, Sans-Serif" style="text-decoration:none"><b>Top of Page</b></font></a></td>
		
		</tr>

	</cfif>
	
</table>

</cfif>







<!---------------End top of Page code---------->



<CFIF len(#qGalleryBibliography.Title#) is not 0>



<!----------------Start Bibliography----------->

<A NAME="Bibliography"> </A>

<table width="90%" cellpadding="0" cellspacing="0" align="center">
	
	
		<tr>
			<td>
				<CFIF len(#qGalleryBibliography.Title#) is not 0>
					<br>
				<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="darkblue"><b> Bibliography 					</b></font><br><br>
				
				</cfif>
				
			</td> 
		</tr>
		
	
<!--- Bibliography Loop ---->	
<cfloop query="qGalleryBibliography" startrow="1" endrow="#qGalleryBibliography.recordcount#">


<CFIF len(#qGalleryBibliography.Title#) is not 0>

	<tr>
		<td valign="top">
			<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
				
	<!--- If there is a period at the end of the title, strip it away--->
				<cfset cTitle=''>
				<cfif #Right(trim(qGalleryBibliography.Title),1)# is '.'>
					<cfset TitleLength =#len(trim(qGalleryBibliography.Title))#-1>
					<cfset cTitle = Left(trim(qGalleryBibliography.Title), TitleLength)>		
				<cfelse>
					<cfset cTitle = trim(#qGalleryBibliography.Title#)>
				</cfif>
				<CFIF len(trim(#qGalleryBibliography.Catalog#)) is not 0>
					
					<cfif len(trim(#qGalleryBibliography.Title#)) GT 0>
					<a href="../../templates/ShowDetailsByCatGallery.cfm?Catalog=#Left(qGalleryBibliography.Catalog,5)#&Showcase=1&&ArtistF=#qGallerySetup.FirstName#&ArtistL=#qGallerySetup.LastName#">
					#cTitle#</a>. 
					</cfif>
				
				<cfelse>
				
					<cfif len(trim(#qGalleryBibliography.Title#)) GT 0>
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

					<cfif Right(trim(#biblioText#),1) is ','>
						<cfset biblioText = Left(trim(#biblioText#),len(trim(#biblioText#))-1)>
					</cfif>	
					#biblioText#
					
					<cfif len(#qGalleryBibliography.Catalog#) GT 0>
					<font size="1">(photo-eye Cat##&nbsp;#qGalleryBibliography.Catalog#)</font>
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


	<CFIF len(#qGalleryBibliography.Title#) is not 0>

		<tr>
			
			<td align="right"><a href="##top"><font size="1" FACE="Verdana, Arial, Helvetica, Sans-Serif" style="text-decoration:none"><b>Top of Page</b></font></a></td>
		
		</tr>

	</cfif>
	
</table>

</cfif>

<!--- <cfoutput> --->
<!---------------End top of Page code---------->


	

<CFIF len(#qGalleryFavorite.Title#) is not 0>



<!----------------Start Favorite Books----------->

<A NAME="FavoritePhotographyBooks"> </A>

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
			
					<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="darkblue"><b> <cfif Ucase(qGalleryFavorite.Type) is 'MONOGRAPHS'>
							 Favorite Photography Books
							  <cfelse>
							 	Favorite #qGalleryFavorite.Type# Photography Books
							  </cfif>
				 					</b></font><br><br>
				
				</cfif>
				<cfset FavoriteBookType=#qGalleryFavorite.Type#>
				
			</td> 
		</tr>

	<tr>
		<td valign="top">

			<FONT FACE="Verdana, Arial, Helvetica, Sans-Serif" SIZE="2" COLOR="black">
				
				<CFIF len(#qGalleryFavorite.CatNum#) is not 0>
					
					<cfif len(#qGalleryFavorite.Title#) GT 0>
					<a href="../../templates/ShowDetailsByCatGallery.cfm?Catalog=#Left(qGalleryFavorite.CatNum,5)#&Showcase=1&ArtistF=#qGallerySetup.FirstName#&ArtistL=#qGallerySetup.LastName#">
					<i>#qGalleryFavorite.Title#</i></a>, 
					</cfif>
				
				<cfelse>
				
					<cfif len(#qGalleryFavorite.Title#) GT 0>
					<i>#qGalleryFavorite.Title#</i><cfif len(#qGalleryFavorite.Authors#) GT 0 or len(#qGalleryFavorite.Catnum#) GT 0>,</cfif> 
					</cfif>
					
				</cfif>	
				
					<cfif len(#qGalleryFavorite.Authors#) GT 0>
					#qGalleryFavorite.Authors#<cfif len(#qGalleryFavorite.Catnum#) GT 0>,</cfif>
					</cfif>
		
				
					<cfif len(#qGalleryFavorite.Catnum#) GT 0>
					<font size="1">(photo-eye Cat##&nbsp;#qGalleryFavorite.Catnum#)</font>
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




</body>
</html>	