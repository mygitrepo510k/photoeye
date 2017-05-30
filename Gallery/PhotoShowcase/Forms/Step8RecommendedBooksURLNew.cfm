<!--- Check to see which type of custnumber variable there is--->
<cfif IsDefined("form.custnumber")>
	<cfset custnumber="#form.custnumber#">
<cfelse>
	<cfset custnumber=url.custnumber>
</cfif>

<CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryFavoriteBooks
  WHERE Custnumber = #custnumber#
</CFQUERY>

<!--- Insert record if for this custnumber if it doesn't already exist--->
<cfoutput>
<cfif #qGetShowcaseSetupInfo.RecordCount# is 0>
	<cfquery name="qGalleryBibliographyInsert" DATASOURCE="photoeyecom" >
		INSERT INTO GalleryFavoriteBooks (Custnumber, FieldID, Type, Title, Authors, CatNum) VALUES ('#custnumber#','','','','','')
	</cfquery>
</cfif>
</cfoutput>

<cfoutput>
	<!--- Monographs --->
	<cfset RecordCount = #qGetShowcaseSetupInfo.RecordCount#>
	<cfset Count=RecordCount>
	<cfset FieldCounter=6>
	<cfset Type="Monographs">
	<cfloop index="Count" from="5" to="0" step="-1">
		<cfif #qGetShowcaseSetupInfo.RecordCount# LT #Count#>
			<cfquery name="qGalleryAwardsInsert" DATASOURCE="photoeyecom" >
				INSERT INTO GalleryFavoriteBooks (Custnumber, FieldID, Type, Title, Authors, CatNum) VALUES ('#custnumber#','#fieldcounter#','#type#','','','')
			</cfquery>
		</cfif>
		<cfset FieldCounter=FieldCounter-1>
	</cfloop>
	
	<!--- Technical --->
	<cfset RecordCount = #qGetShowcaseSetupInfo.RecordCount#>
	<cfset Count=RecordCount>
	<cfset FieldCounter=6>
	<cfset Type="Technical">
	<cfloop index="Count" from="10" to="5" step="-1">
		<cfif #qGetShowcaseSetupInfo.RecordCount# LT #Count#>
			<cfquery name="qGalleryAwardsInsert" DATASOURCE="photoeyecom" >
				INSERT INTO GalleryFavoriteBooks (Custnumber, FieldID, Type, Title, Authors, CatNum) VALUES ('#custnumber#','#fieldcounter#','#type#','','','')
			</cfquery>
		</cfif>
		<cfset FieldCounter=FieldCounter-1>
	</cfloop>
</cfoutput>

<CFQUERY NAME="qGetMonographs"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryFavoriteBooks
  WHERE Custnumber = #custnumber# and 
</CFQUERY>
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">


<html>

<head>
<title>photo-eye Photographer's Showcase | Recommended Books Setup</title>
</head>

<body bgcolor="gray" link="#000080" vlink="#000080">
<div align="center"><center>
	<form method="post" action="Step8UpdateRecommendedBooks.cfm?Step=9">
<br>

   <table width="85%" bgcolor="#FFFFFF" align="center">
      <tr><td align="center"> 
  
	          
            <table width="95%" border="0" cellpadding="5" bgcolor="#FFFFFF" cellspacing="0" valign="top" align="center">
              <tr valign="top"> 
                <td colspan="3" align="left"><br>
                  <img src="../SharedImages/photo-eye%20Explore%20NewLogo_photoShowcaseVersionWhiteBackground.jpg" width="151" height="94"></td>
              </tr>
              <TR> 
                <TD COLSPAN="3" ALIGN="LEFT"> <font face="Verdana,Arial,Helvetica,sans-serif" size="4">Step 
                  9 - Recommended Books</font><font face="Verdana,Arial,Helvetica,sans-serif" size="5"><br>
                  <font size="2">This information will appear on you books page<br>
                  <br>
                  <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"></font></font></td>
              </tr>
              <tr> 
                <td width="49%" valign="top" height="525"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><b>Influential 
                  Photography Monographs:</b><br>
                  <font size="1">List up to five photography books by individual 
                  photographers that have influenced your work. Please enter the 
                  photo-eye catalog number (e.g. AB003) for each title included 
                  in our database. If you don't know our catalogue number for 
                  these titles, <a href="http://www.photoeye.com/bookstore" target="_blank">search 
                  our database</a>.</font></font><br>
                  <br>
                  
	<!---Requery Chronology to reflect the new inserted data --->
	<cfquery name="qGetMonographs" DATASOURCE="photoeyecom" >
		SELECT *
		FROM GalleryFavoriteBooks WHERE Custnumber = #custnumber# and Type='Monographs' ORDER BY FieldID
	</cfquery>
	
	<cfquery name="qGetTechnical" DATASOURCE="photoeyecom" >
		SELECT *
		FROM GalleryFavoriteBooks WHERE Custnumber = #custnumber# and Type='Technical' ORDER BY FieldID
	</cfquery>

	<cfset number=1>
	

	<!---First Column--->
	<cfset ColOneFavoriteBooksAuthorName00="Author00">
	<cfset ColOneFavoriteBooksTitleName00="Title00">
	<cfset ColOneFavoriteBooksCatalogName00="Catalog00">
	
	<!---Next Column--->
	<cfset ColTwoFavoriteBooksAuthorName00="Author00">
	<cfset ColTwoFavoriteBooksTitleName00="Title00">
	<cfset ColTwoFavoriteBooksCatalogName00="Catalog00">
	
	<cfset numberMonographs=qGetMonographs.recordcount>
	<cfset numberTechnical=qGetTechnical.recordcount>
   
   <cfloop index="this" from="1" to="numberMonographs">
	   
		<cfset number1=number> 
		
		    <!---First Field--->
			<cfset ColOneFavoriteBooksAuthor= qGetShowcaseSetupInfo.Author[Number1]>
			<cfset ColOneFavoriteBooksAuthorNameNew = ColOneFavoriteBooksAuthorName00>
			<cfset ColOneFavoriteBooksAuthorName = #Replace(ColOneFavoriteBooksAuthorNameNew, "00", Number1)#>
			
			<!---Next Field--->
			<cfset ColOneFavoriteBooksTitle= qGetShowcaseSetupInfo.Title[Number1]>
			<cfset ColOneFavoriteBooksTitleNameNew = ColOneFavoriteBooksTitleName00>
			<cfset ColOneFavoriteBooksTitleName = #Replace(ColOneFavoriteBooksTitleNameNew, "00", Number1)#>
			
			<!---Next Field--->
			<cfset ColOneFavoriteBooksCatalog= qGetShowcaseSetupInfo.Catalog[Number1]>
			<cfset ColOneFavoriteBooksCatalogNameNew = ColOneFavoriteBooksCatalogName00>
			<cfset ColOneFavoriteBooksCatalogName = #Replace(ColOneFavoriteBooksCatalogNameNew, "00", Number1)#>  
				 

				  <table width="82%">
                    <tr> 
                      <td width="33%"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Title 
                        #<cfoutput>#number1#</cfoutput>:</b></font></td>
                      <td width="33%"><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Author:</b></font></td>
                      <td width="34%"><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Our 
                        Cat#</b></font></td>
                    </tr>
                    <tr> 
                      <td width="33%"> 
                        <input type="text" size="13" maxlength="75" name="<cfoutput>ColOneFavoriteBooksTitleName</cfoutput>" <CFOUTPUT>value="#trim(ColOneFavoriteBooksTitle)#"</CFOUTPUT>>
                      </td>
                      <td width="33%"> 
                        <input type="text" size="13" name="<cfoutput>ColOneFavoriteBooksAuthorName</cfoutput>" maxlength="75" <CFOUTPUT>value="#trim(ColOneFavoriteBooksAuthor)#"</CFOUTPUT>>
                      </td>
                      <td width="34%"> 
                        <input type="text" size="6" name="<cfoutput>ColOneFavoriteBooksCatalogName</cfoutput>" maxlength="6" <CFOUTPUT>value="#trim(ColOneFavoriteBooksCatalog)#"</CFOUTPUT>>
                      </td>
                    </tr>
                  </table>
                  <br>
                  <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"><br>
  			</cfloop>
  
  
  		
                  <br>
                </td>
                <td width="2%" valign="top" align="left" height="525"> 
                  <div align="center"><img src="Images/BlackRule.gif" width=1 height=100% alt="" border="0"></div>
                </td>
                <td valign="top" width="49%" height="525"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><b> 
                  </b></font> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><b>Recommended 
                  Technical Books:</b><br>
                  <font size="1">List up to five technical photography books that 
                  have been important in developing your craft. Please enter the 
                  photo-eye catalog number (e.g. AB003) for each title included 
                  in our database. If you don't know our catalogue number for 
                  these titles, <a href="http://www.photoeye.com/bookstore" target="_blank">search 
                  our database</a>.</font></font><br>
                  <br>
  	 <cfset number=1>
	 <cfloop index="this" from="1" to="numberTechnical">
  		<cfset number2=number> 

		    <!---First Field--->
			<cfset ColTwoFavoriteBooksAuthor= qGetShowcaseSetupInfo.Author[Number1]>
			<cfset ColTwoFavoriteBooksAuthorNameNew = ColTwoFavoriteBooksAuthorName00>
			<cfset ColTwoFavoriteBooksAuthorName = #Replace(ColTwoFavoriteBooksAuthorNameNew, "00", Number1)#>
			
			<!---Next Field--->
			<cfset ColTwoFavoriteBooksTitle= qGetShowcaseSetupInfo.Title[Number1]>
			<cfset ColTwoFavoriteBooksTitleNameNew = ColTwoFavoriteBooksTitleName00>
			<cfset ColTwoFavoriteBooksTitleName = #Replace(ColTwoFavoriteBooksTitleNameNew, "00", Number1)#>
			
			<!---Next Field--->
			<cfset ColTwoFavoriteBooksCatalog= qGetShowcaseSetupInfo.Catalog[Number1]>
			<cfset ColTwoFavoriteBooksCatalogNameNew = ColTwoFavoriteBooksCatalogName00>
			<cfset ColTwoFavoriteBooksCatalogName = #Replace(ColTwoFavoriteBooksCatalogNameNew, "00", Number1)#>  
				 

	
  
				  <table width="82%">
                    <tr> 
                      <td width="33%"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Title 
                        #<cfoutput>#number2#</cfoutput>:</b></font></td>
                      <td width="33%"><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Author:</b></font></td>
                      <td width="34%"><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Our 
                        Cat#</b></font></td>
                    </tr>
                    <tr> 
                      <td width="33%"> 
                        <input type="text" size="13" maxlength="75" name="<cfoutput>ColOneFavoriteBooksTitleName</cfoutput>" <CFOUTPUT>value="#trim(ColOneFavoriteBooksTitle)#"</CFOUTPUT>>
                      </td>
                      <td width="33%"> 
                        <input type="text" size="13" name="<cfoutput>ColOneFavoriteBooksAuthorName</cfoutput>" maxlength="75" <CFOUTPUT>value="#trim(ColOneFavoriteBooksAuthor)#"</CFOUTPUT>>
                      </td>
                      <td width="34%"> 
                        <input type="text" size="6" name="<cfoutput>ColOneFavoriteBooksCatalogName</cfoutput>" maxlength="6" <CFOUTPUT>value="#trim(ColOneFavoriteBooksCatalog)#"</CFOUTPUT>>
                      </td>
                    </tr>
                  </table>
                  <br>
                  <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"><br>
				 <cfset number=number+1>  
			</cfloop>
	

                  
                </td>
              </tr>
              <tr> 
                <td align="center" colspan="3"> <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"><br>
                  <br>
                  <INPUT TYPE="SUBMIT" VALUE="Save Changes">
                  <br>
                  <br>
                  <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"> 
                  <BR>
                  <FONT FACE="Arial, Helvetica, Sans-Serif" size="2"><IMG SRC="images/photoeyebooks&prints.gif" WIDTH=308 HEIGHT=28 BORDER=0><br>
                  376 Garcia Street, Santa Fe, NM 87501<br>
                  Orders Only: 800-227-6941 Info: 505-988-5152 Fax: 505-988-4487<br>
                  E-mail: <a href="mailto:webmaster@photoeye.com">webmaster@photoeye.com</a><br>
                  © photo-eye books &amp; prints, <cfoutput>#YEAR(Now())#</cfoutput>. All Rights Reserved.</font> 
                  <FONT FACE="Arial, Helvetica, Sans-Serif" size="1">This entire 
                  web site is the © copyrighted property of photo-eye books &amp; 
                  prints, except where artists' and publishers' copyrights on 
                  the materials described take precedence. No portion of the contents 
                  within may be reproduced in any form, for any non-private use, 
                  without the express written permission of photo-eye books &amp; 
                  prints.<br>
                  </font></td>
              </tr>
              <tr>
                <td></td>
              </tr>
            </table> 

    
 </td></tr></table> 
      <input type="HIDDEN" name="Custnumber" <CFOUTPUT>value="#qGetShowcaseSetupInfo.Custnumber#"</CFOUTPUT>>
	</form>
</center>
</div>
</body>
</html>

