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


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye  | <cfoutput>#qGallerySetup.FirstName# #qGallerySetup.LastName#</cfoutput></title>





<!--- p {font-family:Verdana, Arial, Helvetica, Sans-Serif; font-size:10pt; color:black;}
    	A:link {font-family:Verdana, Arial, Helvetica, Sans-Serif; font-size:7pt; color:darkblue;}
    	A:visited {font-family:Verdana, Arial, Helvetica, Sans-Serif; font-size:7pt; color:darkblue;} --->


	<style type="text/css">   
		
    			A:hover {color:red;}
	</style>


<SCRIPT LANGUAGE="JavaScript">
<!--

function closeWindow() {
  bookWindow = window.close()
}


//-->
</script>
	
	
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
document.write('<body bgcolor="black" link="darkblue" vlink="darkblue" alink="red">');
}

//-->
</SCRIPT>

               


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
        <HR ALIGN="center" SIZE="1" WIDTH="200" COLOR="red">
                        <font color="silver" face="Verdana, Arial, Helvetica, Sans-Serif" size="1"><strong>
                       <A href="javascript:closeWindow();">Close Window</A>
					    <!--- <A href="index.cfm?id=#url.id#">Back to Images</A> --->
        </STRONG></FONT><BR>
						
					
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
					<a href="../../templates/mShowDetailsByCat.cfm?Catalog=#Left(qGalleryBibliography.Catalog,5)#" target="_blank">
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
					<a href="../../templates/ShowDetailsByCat.cfm?Catalog=#Left(qGalleryFavorite.CatNum,5)#"  target="_blank">
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
	
	</body>
</html>