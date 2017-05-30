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
FROM GalleryCollections WHERE Custnumber = #custnumber#
</cfquery>

<cfoutput>
	<cfset RecordCount = #qGetShowcaseSetupInfo.RecordCount#>
	<cfset Count=RecordCount>
	<cfset FieldCounter=6>
	<cfloop index="Count" from="6" to="0" step="-1">
		<cfif #qGetShowcaseSetupInfo.RecordCount# LT #Count#>
			<cfquery name="qGalleryCollectionsInsert" DATASOURCE="photoeyecom" >
				INSERT INTO GalleryCollections (Custnumber, FieldID, Name, Location) VALUES ('#custnumber#',#fieldcounter#,'','')
			</cfquery>
		</cfif>
		<cfset FieldCounter=FieldCounter-1>
	</cfloop>
</cfoutput>

<cfquery name="qGetShowcaseSetup" DATASOURCE="photoeyecom" >
SELECT *
FROM GalleryCollections WHERE Custnumber = #custnumber#
</cfquery>


<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">


<html>

<head>
<title>photo-eye Photographer's Showcase | Collections Setup</title>
</head>

<body bgcolor="gray" link="#000080" vlink="#000080">
<div align="center"><center>
	<form method="post" action="Step3UpdateCollectionsNew.cfm?Step=4&Custnumber=<cfoutput>#custnumber#</cfoutput>">
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
                  3 - Collections (optional)</font><font face="Verdana,Arial,Helvetica,sans-serif" size="5"> 
                  <br>
                  <font size="2">This information will appear on your Biography 
                  page<br>
                  <br>
                  <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"></font></font></td>
              </tr>
              <tr> 
                <td colspan="3" valign="top"> 
                  <p><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><b>Art 
                    Collections:</b><br>
                    <font size="1">List the most important museum collections 
                    that include your work. If you need to add more Collections, click <i>Save Changes</i> first to save any changes you have made, then click the <i>Add More Collections</i> button at the bottom of
				  the screen. When finished, don't forget to click <i>Save Changes</i> before leaving this page.
				  <font color="Red">Please include the most important collections first.</font></font></font></p>
                  <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><font size="1" color="Red">Example:</font><font size="1"><br>
                    <b>Institution:</b> Museum of Modern Art<br>
                    <b>Location:</b> New York, NY </font></font><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><font size="1"><br>
                    <br>
                    <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"></font></font>
                  </td>
              </tr>
	
	<!---Requery Chronology to reflect the new inserted data --->
	<cfquery name="qGetShowcaseSetupInfo" DATASOURCE="photoeyecom" >
SELECT *
FROM GalleryCollections WHERE Custnumber = #custnumber# ORDER BY FieldID
</cfquery>
	<cfset half=ceiling(qGetShowcaseSetupInfo.RecordCount/2)>
	<cfset number=1>
	

	<!---First Field--->
	<cfset ColOneCollectionNameName00="Name00">
	<cfset ColTwoCollectionLocationName00="Location00">
	
	<!---Next Field--->
	<cfset ColOneCollectionLocationName00="Location00">
	<cfset ColTwoCollectionNameName00="Name00">
	
	<cfset numbercol=qGetShowcaseSetupInfo.recordcount>
	  
	   <cfloop index="this" from="1" to="#half#">
	   
		<cfset number1=number> 
		<cfset number2=number+1>  

     		<!---First Field--->
			<cfset ColOneCollectionName= qGetShowcaseSetupInfo.Name[Number1]>
			<cfset ColOneCollectionNameNameNew = ColOneCollectionNameName00>
			<cfset ColOneCollectionNameName = #Replace(ColOneCollectionNameNameNew, "00", Number1)#>
			
			<!---Next Field--->
			<cfset ColOneCollectionLocation= qGetShowcaseSetupInfo.Location[Number1]>
			<cfset ColOneCollectionLocationNameNew = ColOneCollectionLocationName00>
			<cfset ColOneCollectionLocationName = #Replace(ColOneCollectionLocationNameNew, "00", Number1)#>
			
    
			 <!--- If there is a Second Column --->
			 <cfif numbercol-1 gt 0>
			 
			 	<!---First Field--->
				<cfset ColTwoCollectionName= qGetShowcaseSetupInfo.Name[Number2]>
				<cfset ColTwoCollectionNameNameNew = ColTwoCollectionNameName00>
				<cfset ColTwoCollectionNameName = #Replace(ColTwoCollectionNameNameNew, "00", Number2)#>			
				
				<cfset ColTwoCollectionLocation= qGetShowcaseSetupInfo.Location[Number2]>
				<cfset ColTwoCollectionLocationNameNew = ColTwoCollectionLocationName00>
				<cfset ColTwoCollectionLocationName = #Replace(ColTwoCollectionLocationNameNew, "00", Number2)#>		
				
			</cfif>
			
			
     		<tr>
           <td width="49%" valign="top"> 
		   			<cfif number1 GT 1>
					<img src="Images/BlackRule.gif" width=80% height=1 alt="" border="0"> 
					<br><br>
					</cfif>
		            <table width="168">
                    <tr> 
							        
                      <td>

					   <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b> 
                        Institution <cfoutput>#number1#</cfoutput>:</b></font></td>
                    </tr>
                    <tr> 
                      <td> 
                        <input type="text" size="30" name="<CFOUTPUT>#ColOneCollectionNameName#</CFOUTPUT>" maxlength="75" <CFOUTPUT>value="#trim(ColOneCollectionName)#"</CFOUTPUT>>
                      </td>
                    </TR>
                  </table>	
                  <table width="168">
                    <TR> 
                      <td colspan="2"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Location:</b></font> 
                      </td>
                    </tr>
                    <tr> 
                      <td colspan="2"> 
                        <input type="text" size="30" name="<CFOUTPUT>#ColOneCollectionLocationName#</CFOUTPUT>" maxlength="75" <CFOUTPUT>value="#trim(ColOneCollectionLocation)#"</CFOUTPUT>>
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

                  <div align="center"><!--- <img src="Images/BlackRule.gif" width=1 height=100% alt="" border="0"> ---></div>
                </td>
                <td valign="top" width="49%"> 
					<cfif number2 GT 2>
					<img src="Images/BlackRule.gif" width=80% height=1 alt="" border="0"> 
					<br><br>
					</cfif>
			        <table width="168">
                    <tr> 
                      <td> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b> 
                        Institution <cfoutput>#number2#</cfoutput>:</b></font></td>
                    </tr>
                    <tr> 
                      <td> 
                        <input type="text" size="30" name="<CFOUTPUT>#ColTwoCollectionNameName#</CFOUTPUT>" maxlength="75" <CFOUTPUT>value="#trim(ColTwoCollectionName)#"</CFOUTPUT>>
                      </td>
                    </TR>
                  </table>	
                  <table width="168">
                    <TR> 
                      <td colspan="2"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Location:</b></font> 
                      </td>
                    </tr>
                    <tr> 
                      <td colspan="2">
                        <input type="text" size="30" name="<CFOUTPUT>#ColTwoCollectionLocationName#</CFOUTPUT>" maxlength="75" <CFOUTPUT>value="#trim(ColTwoCollectionLocation)#"</CFOUTPUT>>
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
				  <input type="submit" name="Add" value="Save Changes and Add More Collections">
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

