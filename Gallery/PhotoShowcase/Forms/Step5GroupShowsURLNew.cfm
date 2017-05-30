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
FROM GalleryGroupShows WHERE Custnumber = #custnumber#
</cfquery>

<cfoutput>
	<cfset RecordCount = #qGetShowcaseSetupInfo.RecordCount#>
	<cfset Count=RecordCount>
	<cfset FieldCounter=6>
	<cfloop index="Count" from="6" to="0" step="-1">
		<cfif #qGetShowcaseSetupInfo.RecordCount# LT #Count#>
			<cfquery name="qGalleryGroupShowsInsert" DATASOURCE="photoeyecom" >
				INSERT INTO GalleryGroupShows (Custnumber, FieldID, Venue, Title, Location, Year) VALUES ('#custnumber#',#fieldcounter#,'','','','')
			</cfquery>
		</cfif>
		<cfset FieldCounter=FieldCounter-1>
	</cfloop>
</cfoutput>

<cfquery name="qGetShowcaseSetup" DATASOURCE="photoeyecom" >
SELECT *
FROM GalleryGroupShows WHERE Custnumber = #custnumber#
</cfquery>


<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">


<html>

<head>
<title>photo-eye Photographer's Showcase | Group Exhibitions Setup</title>
</head>

<body bgcolor="gray" link="#000080" vlink="#000080">
<div align="center"><center>
	<form method="post" action="Step5UpdateGroupShowsNew.cfm?Step=6&custnumber=<cfoutput>#custnumber#</cfoutput>">
<br>

   <table width="85%" bgcolor="#FFFFFF" align="center">
      <tr><td align="center"> 
  
	          
            <table width="95%" border="0" cellpadding="5" bgcolor="#FFFFFF" cellspacing="0" valign="top" align="center">
              <tr valign="top"> 
                <td colspan="3" align="left"><br>
                  <img src="../SharedImages/photo-eye%20Explore%20NewLogo_photoShowcaseVersionWhiteBackground.jpg" width="151" height="94"></td>
              </tr>
              <TR> 
                <TD COLSPAN="3" ALIGN="LEFT"> 
                  <p><font face="Verdana,Arial,Helvetica,sans-serif" size="4">Step 
                    5 - Group Exhibitions (optional)</font><font face="Verdana,Arial,Helvetica,sans-serif" size="5"> 
                    <br>
                    <font size="2">This information will appear 
					on your Biography page<br>
                    <br>
                    </font></font><font face="Verdana,Arial,Helvetica,sans-serif" size="5"><font size="2"> 
                    <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"></font></font></p>
				
                  <p> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><b>Group 
                    Exhibitions:</b><br>
                    <font size="1">List your most important Group exhibitions. <font color="Red">It is not necessary
					to list these exhibits in any particular order as they will automatically be
					displayed in reverse chronological order in your Showcase.</font> If you would like to add more exhibitions
					click the <i>Save Changes and Add More Exhibitions</i> button.</font></font></p>
                 
				    <p><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><font size="1" color="Red">Example:</font><font size="1"><br>
                    <b>Venue:</b> Fotograf Museum<br>
                    <b>Exhibit Title:</b> Far Outreaches: Four Scandinavian Landscape 
                    Artists</font></font></font><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><font size="1"><br>
                    <b>Location:</b> Essen, Germany<br>
                    <b>Year:</b> 1999</font></font><font size="1">
                    </font></font></p>
					<img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0">
                  </td>
              </tr>  

			  
	<!---Requery Chronology to reflect the new inserted data --->
	<cfquery name="qGetShowcaseSetupInfo" DATASOURCE="photoeyecom" >
		SELECT *
		FROM GalleryGroupShows WHERE Custnumber = #custnumber# ORDER BY FieldID
	</cfquery>

	<cfset half=ceiling(qGetShowcaseSetupInfo.RecordCount/2)>
	<cfset number=1>
	

	<!---First Column--->
	<cfset ColOneGroupShowsVenueName00="Venue00">
	<cfset ColOneGroupShowsTitleName00="Title00">
	<cfset ColOneGroupShowsLocationName00="Location00">
	<cfset ColOneGroupShowsYearName00="Year00">
	
	<!---Next Column--->
	<cfset ColTwoGroupShowsVenueName00="Venue00">
	<cfset ColTwoGroupShowsTitleName00="Title00">
	<cfset ColTwoGroupShowsLocationName00="Location00">
	<cfset ColTwoGroupShowsYearName00="Year00">
	
	<cfset numbercol=qGetShowcaseSetupInfo.recordcount>
   
   <cfloop index="this" from="1" to="#half#">
	   
		<cfset number1=number> 
		<cfset number2=number+1>  

     		<!---First Field--->
			<cfset ColOneGroupShowsVenue= qGetShowcaseSetupInfo.Venue[Number1]>
			<cfset ColOneGroupShowsVenueNameNew = ColOneGroupShowsVenueName00>
			<cfset ColOneGroupShowsVenueName = #Replace(ColOneGroupShowsVenueNameNew, "00", Number1)#>
			
			<!---Next Field--->
			<cfset ColOneGroupShowsTitle= qGetShowcaseSetupInfo.Title[Number1]>
			<cfset ColOneGroupShowsTitleNameNew = ColOneGroupShowsTitleName00>
			<cfset ColOneGroupShowsTitleName = #Replace(ColOneGroupShowsTitleNameNew, "00", Number1)#>
			
			<!---Next Field--->
			<cfset ColOneGroupShowsLocation= qGetShowcaseSetupInfo.Location[Number1]>
			<cfset ColOneGroupShowsLocationNameNew = ColOneGroupShowsLocationName00>
			<cfset ColOneGroupShowsLocationName = #Replace(ColOneGroupShowsLocationNameNew, "00", Number1)#>

			<!---Next Field--->
			<cfset ColOneGroupShowsYear= qGetShowcaseSetupInfo.Year[Number1]>
			<cfset ColOneGroupShowsYearNameNew = ColOneGroupShowsYearName00>
			<cfset ColOneGroupShowsYearName = #Replace(ColOneGroupShowsYearNameNew, "00", Number1)#>
		    
			 <!--- If there is a Second Column --->
		<cfif numbercol-1 gt 0>
			 
     		<!---First Field--->
			<cfset ColTwoGroupShowsVenue= qGetShowcaseSetupInfo.Venue[Number2]>
			<cfset ColTwoGroupShowsVenueNameNew = ColTwoGroupShowsVenueName00>
			<cfset ColTwoGroupShowsVenueName = #Replace(ColTwoGroupShowsVenueNameNew, "00", Number2)#>
			
			<!---Next Field--->
			<cfset ColTwoGroupShowsTitle= qGetShowcaseSetupInfo.Title[Number2]>
			<cfset ColTwoGroupShowsTitleNameNew = ColTwoGroupShowsTitleName00>
			<cfset ColTwoGroupShowsTitleName = #Replace(ColTwoGroupShowsTitleNameNew, "00", Number2)#>
			
			<!---Next Field--->
			<cfset ColTwoGroupShowsLocation= qGetShowcaseSetupInfo.Location[Number2]>
			<cfset ColTwoGroupShowsLocationNameNew = ColTwoGroupShowsLocationName00>
			<cfset ColTwoGroupShowsLocationName = #Replace(ColTwoGroupShowsLocationNameNew, "00", Number2)#>

			<!---Next Field--->
			<cfset ColTwoGroupShowsYear= qGetShowcaseSetupInfo.Year[Number2]>
			<cfset ColTwoGroupShowsYearNameNew = ColTwoGroupShowsYearName00>
			<cfset ColTwoGroupShowsYearName = #Replace(ColTwoGroupShowsYearNameNew, "00", Number2)#>
				
		</cfif>
		
		


              <tr valign="top"> 
           <td width="49%" valign="top"> 
		   
		   
		   			<cfif number1 GT 1>
					<img src="Images/BlackRule.gif" width=80% height=1 alt="" border="0"> 
					<br><br>
					</cfif>
		            <table width="168">
                    <tr> 

                      <td> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b> 
                        Venue <cfoutput>#number1#</cfoutput>: </b></font> </td>
                    </tr>
                    <tr> <CFOUTPUT>
                      <td> <input type="text" size="30" name="#ColOneGroupShowsVenueName#" maxlength="75" value="#trim(ColOneGroupShowsVenue)#"></CFOUTPUT>
                        
                      </td>
                    </TR>
                  </table>

                  <table>
                    <tr> 
                      <td height="20"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b> 
                        Exhibit Title: </b>(optional)</font></td>
                    </tr>
                    <tr> 
                      <td> 
                        <input type="text" size="30" name="<CFOUTPUT>#ColOneGroupShowsTitleName#</CFOUTPUT>" maxlength="125" value="<CFOUTPUT>#trim(ColOneGroupShowsTitle)#</CFOUTPUT>">
                      </td>
                    </tr>
                  </table>

                  <table>
                    <TR> 
                      <td> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Location:</b></font> 
                      </td>
                      <td> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Year:</b></font> 
                      </td>
                    </tr>
                    <tr> 
                      <td> <cfoutput>
                        <input type="text" size="23" name="#ColOneGroupShowsLocationName#" maxlength="75" value="#trim(ColOneGroupShowsLocation)#"></cfoutput>
                      </td>
                      <td> 
                        <input type="text" size="5" name="<CFOUTPUT>#ColOneGroupShowsYearName#</CFOUTPUT>" maxlength="4" <CFOUTPUT>value="#trim(ColOneGroupShowsYear)#"</CFOUTPUT>>
                      </td>
                    </tr>
                  </table>		  
					  
				<!--- <br> --->
                <!---     <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0">  --->
				 <cfset numbercol=numbercol-1>
				 <cfset number=number+1>    
				</td>  
				
          <cfif numbercol gt 0>
				<td width="2%" valign="top" align="left"> 

                  <div align="center"></div>
                </td>
           
		   
		    <td width="49%" valign="top"> 
		   			<cfif number1 GT 1>
					<img src="Images/BlackRule.gif" width=80% height=1 alt="" border="0"> 
					<br><br>
					</cfif>
		            <table width="168">
                    <tr> 
							    
                      <td> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b> 
                        Venue <cfoutput>#number2#</cfoutput>: </b></font> </td>
                    </tr>
                    <tr> 
                      <td> <input type="text" size="30" name="<CFOUTPUT>#ColTwoGroupShowsVenueName#</CFOUTPUT>" maxlength="75" <CFOUTPUT>value="#trim(ColTwoGroupShowsVenue)#"</CFOUTPUT>>
                        
                      </td>
                    </TR>
                  </table>
                  <table>
                    <tr> 
                      <td height="20"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b> 
                        Exhibit Title: </b>(optional)</font></td>
                    </tr>
                    <tr> 
                      <td> 
                        <input type="text" size="30" name="<CFOUTPUT>#ColTwoGroupShowsTitleName#</CFOUTPUT>" maxlength="125" value="<CFOUTPUT>#trim(ColTwoGroupShowsTitle)#</CFOUTPUT>">
                      </td>
                    </tr>
                  </table>
                  <table>
                    <TR> 
                      <td> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Location:</b></font> 
                      </td>
                      <td> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Year:</b></font> 
                      </td>
                    </tr>
                    <tr> 
                      <td> 
                        <input type="text" size="23" name="<CFOUTPUT>#ColTwoGroupShowsLocationName#</CFOUTPUT>" maxlength="75" <CFOUTPUT>value="#trim(ColTwoGroupShowsLocation)#"</CFOUTPUT>>
                      </td>
                      <td> 
                        <input type="text" size="5" name="<CFOUTPUT>#ColTwoGroupShowsYearName#</CFOUTPUT>" maxlength="4" <CFOUTPUT>value="#trim(ColTwoGroupShowsYear)#"</CFOUTPUT>>
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
				  <input type="submit" name="Add" value="Save Changes and Add More Exhibitions">
 				  <br><br>
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
