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
FROM GalleryAwards WHERE Custnumber = #custnumber#
</cfquery>

<cfoutput>
	<cfset RecordCount = #qGetShowcaseSetupInfo.RecordCount#>
	<cfset Count=RecordCount>
	<cfset FieldCounter=6>
	<cfloop index="Count" from="6" to="0" step="-1">
		<cfif #qGetShowcaseSetupInfo.RecordCount# LT #Count#>
			<cfquery name="qGalleryAwardsInsert" DATASOURCE="photoeyecom" >
				INSERT INTO GalleryAwards (Custnumber, FieldID, Name, Location, Year) VALUES ('#custnumber#',#fieldcounter#,'','','')
			</cfquery>
		</cfif>
		<cfset FieldCounter=FieldCounter-1>
	</cfloop>
</cfoutput>

<cfquery name="qGetShowcaseSetup" DATASOURCE="photoeyecom" >
SELECT *
FROM GalleryAwards WHERE Custnumber = #custnumber#
</cfquery>


<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">


<html>

<head>
<title>photo-eye Photographer's Showcase | Group Exhibitions Setup</title>
</head>

<!--- <body bgcolor="gray" link="#000080" vlink="#000080">
<div align="center"><center>
	<form method="post" action="Step6UpdateAwardsNew.cfm?Step=6&Custnumber=<cfoutput>#url.custnumber#</cfoutput>">
<br> --->

<body bgcolor="gray" link="#000080" vlink="#000080">
<div align="center"><center>
	<form method="post" action="Step6UpdateAwardsNew.cfm?Step=7&<cfoutput>Custnumber=#custnumber#</cfoutput>">
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
                  6 - Grants and Awards (optional)</font><font face="Verdana,Arial,Helvetica,sans-serif" size="4"> 
                  <br>
                  <font size="2">This information will appear on your Biography 
                  page<br>
                  <br>
                  <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"></font></font></td>
              </tr>
              <tr> 
                <td colspan="3" valign="top"> 
                  <p><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><b>Grants 
                    and Awards:</b><br>
                    <font size="1">List the most important grants 
                    or awards that you have received. <font color="Red">They will automatically show in reverse chronological
					order on your Biography page.</font></font></font></p>
                  <p><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><font size="1" color="Red">Example:</font><font size="1"><br>
                    <b>Grant or Award:</b> NEA, Individual Fellowship in Photography<br>
                    <b>Location</b> (optional): Washington, DC </font></font><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><font size="1">
                    <br>
                    <b>Year:</b> 1989 </font><font face="Verdana,Arial,Helvetica,sans-serif" size="5"><font size="2"><br>
                    <br>
                    <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"></font></font></font></p>
                </td>
              </tr> 
			</table>
			
           <table width="95%" border="0" cellpadding="5" bgcolor="#FFFFFF" cellspacing="0" valign="top" align="center">
			  
	<!---Requery Chronology to reflect the new inserted data --->
	<cfquery name="qGetShowcaseSetupInfo" DATASOURCE="photoeyecom" >
		SELECT *
		FROM GalleryAwards WHERE Custnumber = #custnumber# ORDER BY FieldID
	</cfquery>

	<cfset half=ceiling(qGetShowcaseSetupInfo.RecordCount/2)>
	<cfset number=1>
	

	<!---First Column--->
	<cfset ColOneAwardsNameName00="Name00">
	<cfset ColOneAwardsLocationName00="Location00">
	<cfset ColOneAwardsYearName00="Year00">
	
	<!---Next Column--->
	<cfset ColTwoAwardsNameName00="Name00">
	<cfset ColTwoAwardsLocationName00="Location00">
	<cfset ColTwoAwardsYearName00="Year00">
	
	<cfset numbercol=qGetShowcaseSetupInfo.recordcount>
   
   <cfloop index="this" from="1" to="#half#">
	   
		<cfset number1=number> 
		<cfset number2=number+1>  

     		<!---First Field--->
			<cfset ColOneAwardsName= qGetShowcaseSetupInfo.Name[Number1]>
			<cfset ColOneAwardsNameNameNew = ColOneAwardsNameName00>
			<cfset ColOneAwardsNameName = #Replace(ColOneAwardsNameNameNew, "00", Number1)#>
			
		
			<!---Next Field--->
			<cfset ColOneAwardsLocation= qGetShowcaseSetupInfo.Location[Number1]>
			<cfset ColOneAwardsLocationNameNew = ColOneAwardsLocationName00>
			<cfset ColOneAwardsLocationName = #Replace(ColOneAwardsLocationNameNew, "00", Number1)#>

			<!---Next Field--->
			<cfset ColOneAwardsYear= qGetShowcaseSetupInfo.Year[Number1]>
			<cfset ColOneAwardsYearNameNew = ColOneAwardsYearName00>
			<cfset ColOneAwardsYearName = #Replace(ColOneAwardsYearNameNew, "00", Number1)#>
		    
			 <!--- If there is a Second Column --->
		<cfif numbercol-1 gt 0>
			 
     		<!---First Field--->
			<cfset ColTwoAwardsName= qGetShowcaseSetupInfo.Name[Number2]>
			<cfset ColTwoAwardsNameNameNew = ColTwoAwardsNameName00>
			<cfset ColTwoAwardsNameName = #Replace(ColTwoAwardsNameNameNew, "00", Number2)#>
			
		<!---Next Field--->
			<cfset ColTwoAwardsLocation= qGetShowcaseSetupInfo.Location[Number2]>
			<cfset ColTwoAwardsLocationNameNew = ColTwoAwardsLocationName00>
			<cfset ColTwoAwardsLocationName = #Replace(ColTwoAwardsLocationNameNew, "00", Number2)#>

			<!---Next Field--->
			<cfset ColTwoAwardsYear= qGetShowcaseSetupInfo.Year[Number2]>
			<cfset ColTwoAwardsYearNameNew = ColTwoAwardsYearName00>
			<cfset ColTwoAwardsYearName = #Replace(ColTwoAwardsYearNameNew, "00", Number2)#>
				
		</cfif>
		
		

              <tr valign="top"> 
                    <td width="49%" valign="top"> 
                 		   			<cfif number1 GT 1>
					<img src="Images/BlackRule.gif" width=80% height=1 alt="" border="0"> 
					<br><br>
					</cfif>
		            <table width="168">
                    <tr> 
							        
                      <td>
		
			          <tr> 
                
                      <td height="15"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b> 
                        Grant/Award <cfoutput>#number1#</cfoutput>:</b></font> </td>
                    </tr>
                    <tr> 
                      <td> 
                        <input type="text" size="30" name="<CFOUTPUT>#ColOneAwardsNameName#</CFOUTPUT>" maxlength="125" <CFOUTPUT>value="#trim(ColOneAwardsName)#"</CFOUTPUT>>
                      </td>
                    </tr>
                  </table>
                  <table>
                    <tr> 
                      <td> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Location:</b></font> 
                      </td>
                      <td> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Year:</b></font> 
                      </td>
                    </tr>
                    <tr> 
                      <td> 
                        <input type="text" size="23" name="<CFOUTPUT>#ColOneAwardsLocationName#</CFOUTPUT>" maxlength="75" <CFOUTPUT>value="#trim(ColOneAwardsLocation)#"</CFOUTPUT>>
                      </td>
                      <td> 
                        <input type="text" size="5" name="<CFOUTPUT>#ColOneAwardsYearName#</CFOUTPUT>" maxlength="4" <CFOUTPUT>value="#trim(ColOneAwardsYear)#"</CFOUTPUT>>
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

                  <div align="center"><div>
                </td>
           
		   
			 <td width="49%" valign="top"> 
		   			<cfif number1 GT 1>
					<img src="Images/BlackRule.gif" width=80% height=1 alt="" border="0"> 
					<br><br>
					</cfif>
		            <table width="168">
                    <tr> 
                      <td height="15"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b> 
                        Grant/Award <cfoutput>#number2#</cfoutput>:</b></font> </td>
                    </tr>
                    <tr> 
                      <td> 
                        <input type="text" size="30" name="<CFOUTPUT>#ColTwoAwardsNameName#</CFOUTPUT>" maxlength="125" <CFOUTPUT>value="#trim(ColTwoAwardsName)#"</CFOUTPUT>>
                      </td>
                    </tr>
                  </table>
				  
                  <table>
                    <tr> 
                      <td> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Location:</b></font> 
                      </td>
                      <td> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Year:</b></font> 
                      </td>
                    </tr>
                    <tr> 
                      <td> 
                        <input type="text" size="23" name="<CFOUTPUT>#ColTwoAwardsLocationName#</CFOUTPUT>" maxlength="75" <CFOUTPUT>value="#trim(ColTwoAwardsLocation)#"</CFOUTPUT>>
                      </td>
                      <td> 
                        <input type="text" size="5" name="<CFOUTPUT>#ColTwoAwardsYearName#</CFOUTPUT>" maxlength="4" <CFOUTPUT>value="#trim(ColTwoAwardsYear)#"</CFOUTPUT>>
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
				  <input type="submit" name="Add" value="Save Changes and Add More Awards"><br><br>  	 		 
  				
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
