<!--- Check to see which type of custnumber variable there is--->
<cfif IsDefined("form.custnumber")>
	<cfset custnumber="#form.custnumber#">
<cfelse>
	<cfset custnumber=url.custnumber>
</cfif>

<!--- This module Checks to see if there are records already setup for this
	customer, if not, it inserts them --->
<cfquery name="qGetShowcaseSetupInfo" DATASOURCE="photoeyecom" >
SELECT *
FROM GalleryBibliography WHERE Custnumber = #custnumber#
</cfquery>

<cfoutput>
	<cfset RecordCount = #qGetShowcaseSetupInfo.RecordCount#>
	<cfset Count=RecordCount>
	<cfset FieldCounter=6>
	<cfloop index="Count" from="6" to="0" step="-1">
		<cfif #qGetShowcaseSetupInfo.RecordCount# LT #Count#>
			<cfquery name="qGalleryBibliographyInsert" DATASOURCE="photoeyecom" >
				INSERT INTO GalleryBibliography (Custnumber, FieldID, Title, Author, Publisher, City, Year, Catalog) VALUES ('#custnumber#',#fieldcounter#,'','','','','','')
			</cfquery>
		</cfif>
		<cfset FieldCounter=FieldCounter-1>
	</cfloop>
</cfoutput>

<cfquery name="qGetShowcaseSetup" DATASOURCE="photoeyecom" >
SELECT *
FROM GalleryBibliography WHERE Custnumber = #custnumber#
</cfquery>


<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">


<html>

<head>
<title>photo-eye Photographer's Showcase | Group Exhibitions Setup</title>
</head>

<body bgcolor="gray" link="#000080" vlink="#000080">
<div align="center"><center>
	<form method="post" action="Step7UpDateBibliographyNew.cfm?Step=8&Custnumber=<cfoutput>#url.custnumber#</cfoutput>">
<br>

<!--- <body bgcolor="gray" link="#000080" vlink="#000080">
<div align="center"><center>
	<form method="post" action="Step7BibliographyURLNew.cfm?Step=8&custnumber=<cfoutput>#custnumber#</cfoutput>">
<br>
 --->
   <table width="85%" bgcolor="#FFFFFF" align="center">
      <tr><td align="center"> 
  
	          
            <table width="95%" border="0" cellpadding="5" bgcolor="#FFFFFF" cellspacing="0" valign="top" align="center">
              <tr valign="top"> 
                <td colspan="3" align="left"><br>
                  <img src="../SharedImages/photo-eye%20Explore%20NewLogo_photoShowcaseVersionWhiteBackground.jpg" width="151" height="94"></td>
              </tr>
              <TR> 
                <TD COLSPAN="3" ALIGN="LEFT"> <font face="Verdana,Arial,Helvetica,sans-serif" size="4">Step 
                  7 - Bibliography (optional)</font><font face="Verdana,Arial,Helvetica,sans-serif" size="4"> 
                  <br>
                  <font size="2">This information will appear on your Biography 
                  page<br>
                  <br>
                  <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"></font></font></td>
              </tr>
			     <tr> 
                <td colspan="3" valign="top"><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><font size="1">
				List the most important books containing your work. 
				<Font Color="Red">These will appear on your <i>Bio</i> Showcase page, automatically sorted by year published.</font>
				If your books are in-print and available from <b>photo-eye </b>
				include our catalog number (eg. AB003), and the book titles with their respective 
				links will appear on your <i>Books Available</i> Showcase page. 
				</font></font><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"> If you don't know our catalogue number
				 <a href="http://www.photoeye.com/bookstore" target="_blank">search our database</a>
				 by entering your name in the keyword search box.</font></td></tr>
				 
				     <td colspan="3" valign="top"> <font face="Verdana,Arial,Helvetica,sans-serif" color="Red" size="1">
					  Example for entering Photographer/Author:<br>
					  <font color="Black"><b>Monograph (book is primarily your work):</b> 
					  <br>Photographs by YourFirstName YourLastName.  Text by Author FirstName LastName.<br><br>
					  <b>Anthology or Collection (book with multiple photographers):</b>
					  <br>Text by Author/Editor FirstName LastName.
					  </font></font></td>
					 </tr>
			</table>
			<table width="95%" border="0" cellpadding="5" bgcolor="#FFFFFF" cellspacing="0" valign="top" align="center">

	<!---Requery Chronology to reflect the new inserted data --->
	<cfquery name="qGetShowcaseSetupInfo" DATASOURCE="photoeyecom" >
		SELECT *
		FROM GalleryBibliography WHERE Custnumber = #custnumber# ORDER BY FieldID
	</cfquery>

	<cfset half=ceiling(qGetShowcaseSetupInfo.RecordCount/2)>
	<cfset number=1>
	

	<!---First Column--->
	<cfset ColOneBibliographyAuthorName00="Author00">
	<cfset ColOneBibliographyTitleName00="Title00">
	<cfset ColOneBibliographyCityName00="City00">
	<cfset ColOneBibliographyYearName00="Year00">
	<cfset ColOneBibliographyPublisherName00="Publisher00">
	<cfset ColOneBibliographyCatalogName00="Catalog00">
	
	<!---Next Column--->
	<cfset ColTwoBibliographyAuthorName00="Author00">
	<cfset ColTwoBibliographyTitleName00="Title00">
	<cfset ColTwoBibliographyCityName00="City00">
	<cfset ColTwoBibliographyYearName00="Year00">
	<cfset ColTwoBibliographyPublisherName00="Publisher00">
	<cfset ColTwoBibliographyCatalogName00="Catalog00">
	
	<cfset numbercol=qGetShowcaseSetupInfo.recordcount>
   
   <cfloop index="this" from="1" to="#half#">
	   
		<cfset number1=number> 
		<cfset number2=number+1>  

     		<!---First Field--->
			<cfset ColOneBibliographyAuthor= qGetShowcaseSetupInfo.Author[Number1]>
			<cfset ColOneBibliographyAuthorNameNew = ColOneBibliographyAuthorName00>
			<cfset ColOneBibliographyAuthorName = #Replace(ColOneBibliographyAuthorNameNew, "00", Number1)#>
			
			<!---Next Field--->
			<cfset ColOneBibliographyTitle= qGetShowcaseSetupInfo.Title[Number1]>
			<cfset ColOneBibliographyTitleNameNew = ColOneBibliographyTitleName00>
			<cfset ColOneBibliographyTitleName = #Replace(ColOneBibliographyTitleNameNew, "00", Number1)#>
			
			<!---Next Field--->
			<cfset ColOneBibliographyCity= qGetShowcaseSetupInfo.City[Number1]>
			<cfset ColOneBibliographyCityNameNew = ColOneBibliographyCityName00>
			<cfset ColOneBibliographyCityName = #Replace(ColOneBibliographyCityNameNew, "00", Number1)#>

			<!---Next Field--->
			<cfset ColOneBibliographyYear= qGetShowcaseSetupInfo.Year[Number1]>
			<cfset ColOneBibliographyYearNameNew = ColOneBibliographyYearName00>
			<cfset ColOneBibliographyYearName = #Replace(ColOneBibliographyYearNameNew, "00", Number1)#>
	
			<!---Next Field--->
			<cfset ColOneBibliographyPublisher= qGetShowcaseSetupInfo.Publisher[Number1]>
			<cfset ColOneBibliographyPublisherNameNew = ColOneBibliographyPublisherName00>
			<cfset ColOneBibliographyPublisherName = #Replace(ColOneBibliographyPublisherNameNew, "00", Number1)#>

			<!---Next Field--->
			<cfset ColOneBibliographyCatalog= qGetShowcaseSetupInfo.Catalog[Number1]>
			<cfset ColOneBibliographyCatalogNameNew = ColOneBibliographyCatalogName00>
			<cfset ColOneBibliographyCatalogName = #Replace(ColOneBibliographyCatalogNameNew, "00", Number1)#>
			    
			 <!--- If there is a Second Column --->
		<cfif numbercol-1 gt 0>
			 
     		<!---First Field--->
			<cfset ColTwoBibliographyAuthor= qGetShowcaseSetupInfo.Author[Number2]>
			<cfset ColTwoBibliographyAuthorNameNew = ColTwoBibliographyAuthorName00>
			<cfset ColTwoBibliographyAuthorName = #Replace(ColTwoBibliographyAuthorNameNew, "00", Number2)#>
			
			<!---Next Field--->
			<cfset ColTwoBibliographyTitle= qGetShowcaseSetupInfo.Title[Number2]>
			<cfset ColTwoBibliographyTitleNameNew = ColTwoBibliographyTitleName00>
			<cfset ColTwoBibliographyTitleName = #Replace(ColTwoBibliographyTitleNameNew, "00", Number2)#>
			
			<!---Next Field--->
			<cfset ColTwoBibliographyCity= qGetShowcaseSetupInfo.City[Number2]>
			<cfset ColTwoBibliographyCityNameNew = ColTwoBibliographyCityName00>
			<cfset ColTwoBibliographyCityName = #Replace(ColTwoBibliographyCityNameNew, "00", Number2)#>

			<!---Next Field--->
			<cfset ColTwoBibliographyYear= qGetShowcaseSetupInfo.Year[Number2]>
			<cfset ColTwoBibliographyYearNameNew = ColTwoBibliographyYearName00>
			<cfset ColTwoBibliographyYearName = #Replace(ColTwoBibliographyYearNameNew, "00", Number2)#>

			<!---Next Field--->
			<cfset ColTwoBibliographyPublisher= qGetShowcaseSetupInfo.Publisher[Number2]>
			<cfset ColTwoBibliographyPublisherNameNew = ColTwoBibliographyPublisherName00>
			<cfset ColTwoBibliographyPublisherName = #Replace(ColTwoBibliographyPublisherNameNew, "00", Number2)#>

			<!---Next Field--->
			<cfset ColTwoBibliographyCatalog= qGetShowcaseSetupInfo.Catalog[Number2]>
			<cfset ColTwoBibliographyCatalogNameNew = ColTwoBibliographyCatalogName00>
			<cfset ColTwoBibliographyCatalogName = #Replace(ColTwoBibliographyCatalogNameNew, "00", Number2)#>
					
		</cfif>
		
		


              <tr valign="top"> 
           <td width="49%" valign="top"> 
		   
		   
		   			<cfif number1 GT 1>
					<img src="Images/BlackRule.gif" width=80% height=1 alt="" border="0"> 
					<br><br>
					</cfif>
		            <table width="50%">
                    <tr> 
							        
                      <td>

			          <tr> 
                      <td width="50%"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Title 
                       <cfoutput>#number1#</cfoutput>:</b></font></td>
                    </tr>
					
                    <tr> 
                      <td height="31"> 
                        <input type="text" size="30" name="<CFOUTPUT>#ColOneBibliographyTitleName#</CFOUTPUT>" maxlength="125" <CFOUTPUT>value="#trim(ColOneBibliographyTitle)#"</CFOUTPUT>>
                      </td>
                    </tr>			
                  </table>

                  <table>
                    <tr> 
                      <td width="50%"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Photographer/Author:</b></font></td>
                    </tr>
	                 <tr> 
                    </tr>				
                    <tr> 
                      <td height="31"> 
                        <input type="text" size="30" name="<CFOUTPUT>#ColOneBibliographyAuthorName#</CFOUTPUT>" maxlength="75" <CFOUTPUT>value="#ltrim(ColOneBibliographyAuthor)#"</CFOUTPUT>>
                      </td>
                    </tr>
                  </table>
                  <table>
                    <tr> 
                      <td width="50%"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Publisher:</b></font></td>
                    </tr>
                    <tr> 
                      <td height="31"> 
                        <input type="text" size="30" name="<CFOUTPUT>#ColOneBibliographyPublisherName#</CFOUTPUT>" maxlength="75" <CFOUTPUT>value="#trim(ColOneBibliographyPublisher)#"</CFOUTPUT>>
                      </td>
                    </tr>
                  </table>

                  <table>
                    <tr> 
                      <td width="50%" height="16"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>City:</b></font></td>
                    </tr>
                    <tr> 
                      <td height="31"> 
                        <input type="text" size="30" name="<CFOUTPUT>#ColOneBibliographyCityName#</CFOUTPUT>" maxlength="75" <CFOUTPUT>value="#TRIM(ColOneBibliographyCity)#"</CFOUTPUT>>
                      </td>
                    </tr>
                  </table>
				  <table width="100%">
                    <tr> 
                      <td width="42%"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Year Published:</b></font></td>
                      <td width="58%"><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Our Cat#<br>
<a href="http://www.photoeye.com/bookstore" target="_blank">Search Database</a></b></font></td>
                    </tr>
                    <tr> 
                      <td height="31" width="42%"> 
                        <input type="text" size="5" name="<CFOUTPUT>#ColOneBibliographyYearName#</CFOUTPUT>" maxlength="4" <CFOUTPUT>value="#trim(ColOneBibliographyYear)#"</CFOUTPUT>>
                      </td>
                      <td height="31" width="58%"> 
                        <input type="text" size="6" name="<CFOUTPUT>#ColOneBibliographyCatalogName#</CFOUTPUT>" maxlength="6" <CFOUTPUT>value="#trim(ColOneBibliographyCatalog)#"</CFOUTPUT>>
                      </td>
                    </tr>
                  </table>  
					  
				<!--- <br> --->
                <!---     <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0">  --->
				 <cfset numbercol=numbercol-1>
				 <cfset number=number+1>    
				</td>  
				
         
		 
		 	  <cfif numbercol GT 0>
				<td width="2%" valign="top" align="left"> 

                  <div align="center"><div>
                </td>
           
		   
		    <td width="49%" valign="top"> 
		   			<cfif number1 GT 1>
					<img src="Images/BlackRule.gif" width=80% height=1 alt="" border="0"> 
					<br><br>
					</cfif>
				  <table>
                    <tr> 
   	            <table width="50%">
                    <tr> 
							        
                      <td>

			          <tr> 
                      <td width="50%"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Title 
                       <cfoutput>#number2#</cfoutput>:</b></font></td>
                    </tr>
					
                    <tr> 
                      <td height="31"> 
                        <input type="text" size="30" name="<CFOUTPUT>#ColTwoBibliographyTitleName#</CFOUTPUT>" maxlength="125" <CFOUTPUT>value="#trim(ColTwoBibliographyTitle)#"</CFOUTPUT>>
                      </td>
                    </tr>			
                  </table>

                  <table>
                    <tr> 
                      <td width="50%"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Author:</b></font></td>
                    </tr>
                    <tr> 
                      <td height="31"> 
                        <input type="text" size="30" name="<CFOUTPUT>#ColTwoBibliographyAuthorName#</CFOUTPUT>" maxlength="75" <CFOUTPUT>value="#trim(ColTwoBibliographyAuthor)#"</CFOUTPUT>>
                      </td>
                    </tr>
                  </table>
                  <table>
                    <tr> 
                      <td width="50%"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Publisher:</b></font></td>
                    </tr>
                    <tr> 
                      <td height="31"> 
                        <input type="text" size="30" name="<CFOUTPUT>#ColTwoBibliographyPublisherName#</CFOUTPUT>" maxlength="75" <CFOUTPUT>value="#trim(ColTwoBibliographyPublisher)#"</CFOUTPUT>>
                      </td>
                    </tr>
                  </table>

                  <table>
                    <tr> 
                      <td width="50%" height="16"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>City:</b></font></td>
                    </tr>
                    <tr> 
                      <td height="31"> 
                        <input type="text" size="30" name="<CFOUTPUT>#ColTwoBibliographyCityName#</CFOUTPUT>" maxlength="75" <CFOUTPUT>value="#trim(ColTwoBibliographyCity)#"</CFOUTPUT>>
                      </td>
                    </tr>
                  </table>
				  <table width="100%">
                    <tr> 
                      <td width="42%"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Year Published:</b></font></td>
                      <td width="58%"><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Our Cat# <br>
 <a href="http://www.photoeye.com/bookstore" target="_blank">Search Database</a></b></font></td>
                    </tr>
                    <tr> 
                      <td height="31" width="42%"> 
                        <input type="text" size="5" name="<CFOUTPUT>#ColTwoBibliographyYearName#</CFOUTPUT>" maxlength="4" <CFOUTPUT>value="#trim(ColTwoBibliographyYear)#"</CFOUTPUT>>
                      </td>
                      <td height="31" width="58%"> 
                        <input type="text" size="6" name="<CFOUTPUT>#ColTwoBibliographyCatalogName#</CFOUTPUT>" maxlength="6" <CFOUTPUT>value="#trim(ColTwoBibliographyCatalog)#"</CFOUTPUT>>
                      </td>
                    </tr>
                  </table>  
					  
	
                 <!---    <br> --->
                   <!---  <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0">  --->
				  <cfset numbercol=numbercol-1>  
				  <cfset number=number+1>      
				</td>  
			<cfelse>
			<td>
			</td>
			</cfif>
     </tr> 
	 
		   
	   </cfloop> 
			  
			 <tr> 
                <td align="center" colspan="3">
				<img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"> 
				<br>
				<br>
   				<input type="HIDDEN" name="Custnumber" <CFOUTPUT>value="#qGetShowcaseSetupInfo.Custnumber#"</CFOUTPUT>> 
				  <input type="submit" name="Save" value="Save Changes"><br><br>
				  <input type="submit" name="Add" value="Save Changes and Add More Publications"><br><br>
                  	 		 
  		
				  <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"> 
                  <BR>
                  <FONT FACE="Arial, Helvetica, Sans-Serif" size="2"><IMG SRC="images/photoeyebooks&prints.gif" WIDTH=308 HEIGHT=28 BORDER=0><br>
                  376 Garcia Street, Santa Fe, NM 87501<br>
                  Orders Only: 800-227-6941 Info: 505-988-5152 Fax: 505-988-4487<br>
                  E-Mail: <a href="mailto:webmaster@photoeye.com">webmaster@photoeye.com</a><br>
                  © photo-eye books &amp; prints, 2001. All Rights Reserved.</font> 
                  <FONT FACE="Arial, Helvetica, Sans-Serif" size="1"><br>
                  This entire web site is the © copyrighted property of photo-eye 
                  books &amp; prints, except where artists' and publishers' copyrights 
                  on the materials described take precedence. No portion of the 
                  contents within may be reproduced in any form, for any non-private 
                  use, without the express written permission of photo-eye books 
                  &amp; prints.<br>
                  </font></td>
              </tr>
              <tr> 
                <td></td>
              </tr>
            </table> 

    
 </td></tr></table> 
</form>
</center>
</div>
</body>
</html>
