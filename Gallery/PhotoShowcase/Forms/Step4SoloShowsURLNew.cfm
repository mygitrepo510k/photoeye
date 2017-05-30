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
FROM GallerySoloShows WHERE Custnumber = #custnumber#
</cfquery>

<cfoutput>
	<cfset RecordCount = #qGetShowcaseSetupInfo.RecordCount#>
	<cfset Count=RecordCount>
	<cfset FieldCounter=6>
	<cfloop index="Count" from="6" to="0" step="-1">
		<cfif #qGetShowcaseSetupInfo.RecordCount# LT #Count#>
			<cfquery name="qGallerySoloShowsInsert" DATASOURCE="photoeyecom" >
				INSERT INTO GallerySoloShows (Custnumber, FieldID, Venue, Title, Location, Year) VALUES ('#custnumber#',#fieldcounter#,'','','','')
			</cfquery>
		</cfif>
		<cfset FieldCounter=FieldCounter-1>
	</cfloop>
</cfoutput>

<cfquery name="qGetShowcaseSetup" DATASOURCE="photoeyecom" >
SELECT *
FROM GallerySoloShows WHERE Custnumber = #custnumber#
</cfquery>


<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">


<html>

<head>
<title>photo-eye Photographer's Showcase | Solo Exhibitions Setup</title>
</head>

<body bgcolor="gray" link="#000080" vlink="#000080">
<div align="center"><center>
	<form method="post" action="Step4UpdateSoloShowsNew.cfm?Step=5&Custnumber=<cfoutput>#url.custnumber#</cfoutput>">
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
                    4 - Solo Exhibitions (optional)</font><font face="Verdana,Arial,Helvetica,sans-serif" size="5"> 
                    <br>
                    <font size="2">This information will appear 
					on your Biography page<br>
                    <br>
                    </font></font><font face="Verdana,Arial,Helvetica,sans-serif" size="5"><font size="2"> 
                    <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"></font></font></p>
                  </td>
              </tr>
              <tr> 
                <td width="49%" valign="top"> 
                  <p> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><b>Solo 
                    Exhibitions:</b><br>
                    <font size="1">List your most important solo exhibitions. <font color="Red">It is not necessary
					to list these exhibits in any particular order as they will automatically be
					displayed in reverse chronological order in your Showcase.</font> If you would like to add more exhibitions
					click the <i>Save Changes and Add More Exhibitions</i> button.</font></font></p>
                  <p><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><font size="1" color="Red">Example:</font><font size="1"><br>
                    <b>Venue:</b> Museum of Modern Art<br>
                    <b>Exhibit Title:</b> Frigid Views</font></font><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><font size="1"><br>
                    <b>Location:</b> New York, NY <br>
                    <b>Year:</b> 1999
                    </font></font></p>
					<img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0">
                  </td>
              </tr>  
			</table>  
			  <table width="95%" border="0" cellpadding="5" bgcolor="#FFFFFF" cellspacing="0" valign="top" align="center">  <!---This was bad boy 2--->

	<!---Requery SoloShows to reflect the new inserted data --->
	<cfquery name="qGetShowcaseSetupInfo" DATASOURCE="photoeyecom" >
		SELECT *
		FROM GallerySoloShows WHERE Custnumber = #custnumber# ORDER BY FieldID
	</cfquery>

	<cfset half=ceiling(qGetShowcaseSetupInfo.RecordCount/2)>
	<cfset number=1>
	

	<!---First Column--->
	<cfset ColOneSoloShowsVenueName00="Venue00">
	<cfset ColOneSoloShowsTitleName00="Title00">
	<cfset ColOneSoloShowsLocationName00="Location00">
	<cfset ColOneSoloShowsYearName00="Year00">
	
	<!---Next Column--->
	<cfset ColTwoSoloShowsVenueName00="Venue00">
	<cfset ColTwoSoloShowsTitleName00="Title00">
	<cfset ColTwoSoloShowsLocationName00="Location00">
	<cfset ColTwoSoloShowsYearName00="Year00">
	
	<cfset numbercol=qGetShowcaseSetupInfo.recordcount>
   
   <cfloop index="this" from="1" to="#half#">
	   
		<cfset number1=number> 
		<cfset number2=number+1>  

     		<!---First Field--->
			<cfset ColOneSoloShowsVenue= qGetShowcaseSetupInfo.Venue[Number1]>
			<cfset ColOneSoloShowsVenueNameNew = ColOneSoloShowsVenueName00>
			<cfset ColOneSoloShowsVenueName = #Replace(ColOneSoloShowsVenueNameNew, "00", Number1)#>
			
			<!---Next Field--->
			<cfset ColOneSoloShowsTitle= qGetShowcaseSetupInfo.Title[Number1]>
			<cfset ColOneSoloShowsTitleNameNew = ColOneSoloShowsTitleName00>
			<cfset ColOneSoloShowsTitleName = #Replace(ColOneSoloShowsTitleNameNew, "00", Number1)#>
			
			<!---Next Field--->
			<cfset ColOneSoloShowsLocation= qGetShowcaseSetupInfo.Location[Number1]>
			<cfset ColOneSoloShowsLocationNameNew = ColOneSoloShowsLocationName00>
			<cfset ColOneSoloShowsLocationName = #Replace(ColOneSoloShowsLocationNameNew, "00", Number1)#>

			<!---Next Field--->
			<cfset ColOneSoloShowsYear= qGetShowcaseSetupInfo.Year[Number1]>
			<cfset ColOneSoloShowsYearNameNew = ColOneSoloShowsYearName00>
			<cfset ColOneSoloShowsYearName = #Replace(ColOneSoloShowsYearNameNew, "00", Number1)#>
		    
			 <!--- If there is a Second Column --->
		<cfif numbercol-1 gt 0>
			 
     		<!---First Field--->
			<cfset ColTwoSoloShowsVenue= qGetShowcaseSetupInfo.Venue[Number2]>
			<cfset ColTwoSoloShowsVenueNameNew = ColTwoSoloShowsVenueName00>
			<cfset ColTwoSoloShowsVenueName = #Replace(ColTwoSoloShowsVenueNameNew, "00", Number2)#>
			
			<!---Next Field--->
			<cfset ColTwoSoloShowsTitle= qGetShowcaseSetupInfo.Title[Number2]>
			<cfset ColTwoSoloShowsTitleNameNew = ColTwoSoloShowsTitleName00>
			<cfset ColTwoSoloShowsTitleName = #Replace(ColTwoSoloShowsTitleNameNew, "00", Number2)#>
			
			<!---Next Field--->
			<cfset ColTwoSoloShowsLocation= qGetShowcaseSetupInfo.Location[Number2]>
			<cfset ColTwoSoloShowsLocationNameNew = ColTwoSoloShowsLocationName00>
			<cfset ColTwoSoloShowsLocationName = #Replace(ColTwoSoloShowsLocationNameNew, "00", Number2)#>

			<!---Next Field--->
			<cfset ColTwoSoloShowsYear= qGetShowcaseSetupInfo.Year[Number2]>
			<cfset ColTwoSoloShowsYearNameNew = ColTwoSoloShowsYearName00>
			<cfset ColTwoSoloShowsYearName = #Replace(ColTwoSoloShowsYearNameNew, "00", Number2)#>
				
		</cfif>
		
		



              <tr valign="top"> 
           <td width="49%" valign="top"> 
		   
		   
		   			<cfif number1 GT 1>
					<img src="Images/BlackRule.gif" width=80% height=1 alt="" border="0"> 
					<br><br>
					</cfif>
		            <table width="168">
                    <tr> 
							        
<!---                       <td>

			          <tr>  --->
                      <td> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b> 
                        Venue <cfoutput>#number1#</cfoutput>: </b></font> </td>
                    </tr>
                    <tr> 
                      <td> <cfoutput><input type="text" size="30" name="#ColOneSoloShowsVenueName#" maxlength="75" value="#trim(ColOneSoloShowsVenue)#"></cfoutput>
                        
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
                        <input type="text" size="30" name="<CFOUTPUT>#ColOneSoloShowsTitleName#</CFOUTPUT>" maxlength="125" value="<CFOUTPUT>#trim(ColOneSoloShowsTitle)#</CFOUTPUT>">
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
                      <td><cfoutput>
                        <input type="text" size="23" name="#ColOneSoloShowsLocationName#" maxlength="75" value="#trim(ColOneSoloShowsLocation)#"></cfoutput> 
                      </td>
                      <td> <cfoutput>
                        <input type="text" size="4" name="#ColOneSoloShowsYearName#" maxlength="4" value="#trim(ColOneSoloShowsYear)#"></cfoutput>
                      </td>
                    </tr>
                  </table>		  
					  
				<!--- <br> --->
                <!---     <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0">  --->
				 <cfset numbercol=numbercol-1>
				 <cfset number=number+1>    
				
				</td>  
				
         <!--- Ok to here --->
		 
		  <cfif numbercol gt 0>
				<td width="2%" valign="top" align="left"> 

                 <!---  <div align="center"><div> --->
                </td>
           
		   
		  		  <td width="49%" valign="top"> 

		   			<cfif number1 GT 1>
					<img src="Images/BlackRule.gif" width=80% height=1 alt="" border="0"> 
					<br><br>
					</cfif>
		            <table width="168">
<!---                     <tr> 
							        
                      <td> --->

			              <tr> 
                    		 <td> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b> 
                        Venue <cfoutput>#number2#</cfoutput>: </b></font> </td>
                    		</tr>
                    <tr> 
                      <td><cfoutput> <input type="text" size="30" name="#ColTwoSoloShowsVenueName#" maxlength="75" value="#trim(ColTwoSoloShowsVenue)#">
</cfoutput>
                        
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
                        <input type="text" size="30" name="<CFOUTPUT>#ColTwoSoloShowsTitleName#</CFOUTPUT>" maxlength="125" value="<CFOUTPUT>#trim(ColTwoSoloShowsTitle)#</CFOUTPUT>">
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
                        <input type="text" size="23" name="#ColTwoSoloShowsLocationName#" maxlength="75" value="#trim(ColTwoSoloShowsLocation)#"></cfoutput>
                      </td>
                      <td> <cfoutput>
                        <input type="text" size="4" name="#ColTwoSoloShowsYearName#" maxlength="4" value="#trim(ColTwoSoloShowsYear)#"></cfoutput>
                      </td>
                    </tr>
                  </table>		  
					  
	
                 <!---    <br> --->
                   <!---  <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0">  --->
				  <cfset numbercol=numbercol-1>  
				  <cfset number=number+1>      
			 <!---  	</td> Moved to below </cfif>--->
			<cfelse>
			<td>
			</td>
			</cfif>
			</td>
     </tr> 
		   
	   </cfloop> 
	   		 </table>
			 <table>
			 <tr> 
                <td align="center" colspan="3">
				<img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"> 
				<br>
				<br><CFOUTPUT>
   				<input type="HIDDEN" name="Custnumber" value="#qGetShowcaseSetupInfo.Custnumber#"> </CFOUTPUT>
				  <input type="submit" name="Save" value="Save Changes"><br><br>
				  <input type="submit" name="Add" value="Save Changes and Add More Exhibitions"><br><br>
                  	 		 

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
 </td></tr>
 </table> 
 </form>

</center>
</div>
</body>
</html>
