<!--- Check to see which type of custnumber variable there is--->
<cfif IsDefined("form.custnumber")>
	<cfset custnumber="#form.custnumber#">
<cfelse>
	<cfset custnumber=url.custnumber>
</cfif>

<!--- This module Checks to see if there are records already setup for this
	customer, if not, it inserts them --->
<cfquery name="qGetEducation" DATASOURCE="photoeyecom" >
SELECT *
FROM GalleryEducation WHERE Custnumber = #custnumber# 
</cfquery>

<cfoutput>
	<cfset RecordCount = #qGetEducation.RecordCount#>
	<cfset Count=RecordCount>
	<cfset FieldCounter=4>
	<cfloop index="Count" from="4" to="0" step="-1">
		<cfif #qGetEducation.RecordCount# LT #Count#>
			<cfquery name="qGalleryEducationInsert" DATASOURCE="photoeyecom" >
				INSERT INTO GalleryEducation (Custnumber, FieldID, School, YearBegin, YearEnd, Degree, Teacher1, Teacher2, Teacher3) VALUES ('#custnumber#',#fieldcounter#,'','','','','','','')
			</cfquery>
		</cfif>
		<cfset FieldCounter=FieldCounter-1>
	</cfloop>
</cfoutput>

<cfquery name="qGetShowcaseSetup" DATASOURCE="photoeyecom" >
SELECT *
FROM GallerySetup WHERE Custnumber = #custnumber#
</cfquery>


<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">


<html>

<head>
<title>photo-eye Photographer's Showcase | Education Setup</title>
</head>

<body bgcolor="gray" link="#000080" vlink="#000080">
<div align="center"><center>
	<form method="post" action="Step2UpdateEducation.cfm?Step=3&Custnumber=<cfoutput>#custnumber#</cfoutput>">
<br>


   <table width="85%" bgcolor="#FFFFFF" align="center">

   
	 
	  <tr><td align="center"> 
  
	          
            <table width="95%" border="0" cellpadding="5" bgcolor="#FFFFFF" cellspacing="0" valign="top" align="center">
              <tr valign="top"> 
                <td colspan="3" align="left"> <br>   
                  <img src="../SharedImages/photo-eye%20Explore%20NewLogo_photoShowcaseVersionWhiteBackground.jpg" width="151" height="94"></td>
              </tr>
              <TR> 
                <TD COLSPAN="3" ALIGN="LEFT"><font face="Verdana,Arial,Helvetica,sans-serif" size="4">Step 
                  2 - Education (optional)</font><font face="Verdana,Arial,Helvetica,sans-serif" size="2"> 
                  <br>
                  This information will appear on your Biography page<br><br>
                  <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"></font></td>
              </tr>
              <tr>
                <td colspan="3" valign="top"><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><b>Education:</b><br>
                  <font size="1">List any schools or workshops attended that have furthered your career as a photographer or artist. 
				  If necessary, add more schools by clicking the button at the bottom of the screen. When finished, don't forget to Save Changes before leaving this page.
				  <font color="Red">It is not necessary to keep the years attended in order. They will automatically appear in chronological order on your Showcase.</font>
                  <br><br></font></font></td>
              </tr>

	
	<!---Requery Chronology to reflect the new inserted data --->
	<cfquery name="qGetEducation" DATASOURCE="photoeyecom" >
SELECT *
FROM GalleryEducation WHERE Custnumber = #custnumber# ORDER BY FieldID
</cfquery>
	<cfset half=ceiling(qGetEducation.RecordCount/2)>
	<cfset number=1>
	<cfset ColOneSchoolName00="School00">
	<cfset SecColSchoolName00="School00">
	<cfset ColOneYearBeginName00="YearBegin00">
	<cfset SecColYearBeginName00="YearBegin00">
	<cfset ColOneYearEndName00="YearEnd00">
	<cfset SecColYearEndName00="YearEnd00">
	<cfset ColOneDegreeName00="Degree00">
	<cfset SecColDegreeName00="Degree00">
	<cfset ColOneTeacher1Name00="Teacher100">
	<cfset SecColTeacher1Name00="Teacher100">
	<cfset ColOneTeacher2Name00="Teacher200">
	<cfset SecColTeacher2Name00="Teacher200">
	<cfset ColOneTeacher3Name00="Teacher300">
	<cfset SecColTeacher3Name00="Teacher300">
	
	<cfset numbercol=qGetEducation.recordcount>
	   <cfloop index="this" from="1" to="#half#">
	   
		<cfset number1=number> 
		<cfset number2=number+1>  

	  	    <cfset ColOneSchool= qGetEducation.School[Number1]>
			<cfset ColOneSchoolNameNew = ColOneSchoolName00>
			<cfset ColOneSchoolName = #Replace(ColOneSchoolNameNew, "00", Number1)#>
	   		<cfset ColOneYearBegin= qGetEducation.YearBegin[Number1]>
			<cfset ColOneYearBeginNameNew = ColOneYearBeginName00>
			<cfset ColOneYearBeginName = #Replace(ColOneYearBeginNameNew, "00", Number1)#>
 	   		<cfset ColOneYearEnd= qGetEducation.YearEnd[Number1]>
			<cfset ColOneYearEndNameNew = ColOneYearEndName00>
			<cfset ColOneYearEndName = #Replace(ColOneYearEndNameNew, "00", Number1)#>
  	   		<cfset ColOneDegree= qGetEducation.Degree[Number1]>
			<cfset ColOneDegreeNameNew = ColOneDegreeName00>
			<cfset ColOneDegreeName = #Replace(ColOneDegreeNameNew, "00", Number1)#>
   	   		<cfset ColOneTeacher1= qGetEducation.Teacher1[Number1]>
			<cfset ColOneTeacher1NameNew = ColOneTeacher1Name00>
			<cfset ColOneTeacher1Name = #Replace(ColOneTeacher1NameNew, "00", Number1)#>
    	   	<cfset ColOneTeacher2= qGetEducation.Teacher2[Number1]>
			<cfset ColOneTeacher2NameNew = ColOneTeacher2Name00>
			<cfset ColOneTeacher2Name = #Replace(ColOneTeacher2NameNew, "00", Number1)#>
    	   	<cfset ColOneTeacher3= qGetEducation.Teacher3[Number1]>
			<cfset ColOneTeacher3NameNew = ColOneTeacher3Name00>
			<cfset ColOneTeacher3Name = #Replace(ColOneTeacher3NameNew, "00", Number1)#>
         
			 <cfif numbercol-1 gt 0>
		  	    <cfset SecColSchool= qGetEducation.School[Number2]>
				<cfset SecColSchoolNameNew = SecColSchoolName00>
				<cfset SecColSchoolName = #Replace(SecColSchoolNameNew, "00", Number2)#>
	   			<cfset SecColYearBegin= qGetEducation.YearBegin[Number2]>
				<cfset SecColYearBeginNameNew = SecColYearBeginName00>
				<cfset SecColYearBeginName = #Replace(SecColYearBeginNameNew, "00", Number2)#>
 	   			<cfset SecColYearEnd= qGetEducation.YearEnd[Number2]>
				<cfset SecColYearEndNameNew = SecColYearEndName00>
				<cfset SecColYearEndName = #Replace(SecColYearEndNameNew, "00", Number2)#>
  	   			<cfset SecColDegree= qGetEducation.Degree[Number2]>
				<cfset SecColDegreeNameNew = SecColDegreeName00>
				<cfset SecColDegreeName = #Replace(SecColDegreeNameNew, "00", Number2)#>
   	  	 		<cfset SecColTeacher1= qGetEducation.Teacher1[Number2]>
				<cfset SecColTeacher1NameNew = SecColTeacher1Name00>
				<cfset SecColTeacher1Name = #Replace(SecColTeacher1NameNew, "00", Number2)#>
    		   	<cfset SecColTeacher2= qGetEducation.Teacher2[Number2]>
				<cfset SecColTeacher2NameNew = SecColTeacher2Name00>
				<cfset SecColTeacher2Name = #Replace(SecColTeacher2NameNew, "00", Number2)#>
    		   	<cfset SecColTeacher3= qGetEducation.Teacher3[Number2]>
				<cfset SecColTeacher3NameNew = SecColTeacher3Name00>
				<cfset SecColTeacher3Name = #Replace(SecColTeacher3NameNew, "00", Number2)#>		
			</cfif>
			
			<tr>
				 <td width="49%" valign="top"> 
			       <table>
				   <tr>
				   <td>
				   <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><font size="1"><b>Name 
                    of School/Workshop <cfoutput>#number1#</cfoutput>:</b></font></font></td>
					</tr>
					<tr>
                    <td>
					<input type="text" size="35" maxlength="75" name="<CFOUTPUT>#ColOneSchoolName#</CFOUTPUT>" <CFOUTPUT>value="#TRIM(ColOneSchool)#"</CFOUTPUT>></td>
                  	</tr>
					</table>
                  <table width="100%">
                    <tr>
                      <td><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Years Attended:
					  </td>
					  </tr>
					  <tr><td width=70>
                       <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Beginning: </b></font></td>
                      <td width=*><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>
                        Ending: </b>(if different)</font></td>
                    </tr>
                    <tr> 
                      <td width="70"> 
                        <input type="text" size="5" maxlength="4" name="<CFOUTPUT>#ColOneYearBeginName#</CFOUTPUT>" <CFOUTPUT>value="#TRIM(ColOneYearBegin)#"</CFOUTPUT>>
                      <td width="*"> 
                        <input type="text" size="5" maxlength="4" name="<CFOUTPUT>#ColOneYearEndName#</CFOUTPUT>" <CFOUTPUT>value="#TRIM(ColOneYearEnd)#"</CFOUTPUT>>
                      </td>
                    </tr>
                  </table>
                  <table width="70%">
                    <tr> 
                      <td colspan="2"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Degree/Field of Interest:</b><font color="red"><br>Example 1: MFA in Photography<br>Example 2: Studied Art</font> 
                        </font></td>
                    </tr>
                    <tr> 
                      <td colspan="2"> 
					  <CFOUTPUT>
                        <input type="text" size="35" name="#ColOneDegreeName#"  maxlength="75" value="#TRIM(ColOneDegree)#">
                    	</cfoutput>
					</tr>
                  </table>
                  <table width="70%">
                    <tr> 
                      <td colspan="2"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Most 
                        Important Teacher(s):</b> (if applicable)</font></td>
                    </tr>
                    <tr> 
                      <td colspan="2" height="29"> 
                        <input type="text" size="35" name="<CFOUTPUT>#ColOneTeacher1Name#</CFOUTPUT>"  maxlength="75" <CFOUTPUT>value="#TRIM(ColOneTeacher1)#"</CFOUTPUT>>
                    </tr>
	                   <tr> 
                      <td colspan="2" height="29"> 
                        <input type="text" size="35" name="<CFOUTPUT>#ColOneTeacher2Name#</CFOUTPUT>"  maxlength="75" <CFOUTPUT>value="#TRIM(ColOneTeacher2)#"</CFOUTPUT>>
                    </tr>
		             <tr> 
                      <td colspan="2" height="29"> 
                        <input type="text" size="35" name="<CFOUTPUT>#ColOneTeacher3Name#</CFOUTPUT>"  maxlength="75" <CFOUTPUT>value="#TRIM(ColOneTeacher3)#"</CFOUTPUT>>
                    </tr>
                  </table>
				  <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"> 
				 <cfset numbercol=numbercol-1>
				 <cfset number=number+1>   
                </td>
				
				
				
				 
				
          <cfif numbercol gt 0>
			 <td width="49%" valign="top"> 
			       <table>
				   <tr>
				   <td>
				   <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><font size="1"><b>Name 
                    of School/Workshop <cfoutput>#number2#</cfoutput>:</b></font></font></td>
					</tr>
					<tr>
                    <td>
					<input type="text" size="35" maxlength="75" name="<CFOUTPUT>#SecColSchoolName#</CFOUTPUT>" <CFOUTPUT>value="#TRIM(SecColSchool)#"</CFOUTPUT>></td>
                  	</tr>
					</table>
				  <table width="100%">
                    <tr>
                      <td><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Years Attended:
					  </td>
					  </tr>
					  <tr><td width=70>
                       <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Beginning: </b></font></td>
                      <td width=*><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>
                        Ending: </b>(if different)</font></td>
                    </tr>
                    <tr> 
                      <td width="70"> 
                        <input type="text" size="5" maxlength="4" name="<CFOUTPUT>#SecColYearBeginName#</CFOUTPUT>" <CFOUTPUT>value="#TRIM(SecColYearBegin)#"</CFOUTPUT>>
                      <td width="*"> 
                        <input type="text" size="5" maxlength="4" name="<CFOUTPUT>#SecColYearEndName#</CFOUTPUT>" <CFOUTPUT>value="#TRIM(SecColYearEnd)#"</CFOUTPUT>>
                      </td>
                    </tr>
                  </table>
                  <table width="70%">
                    <tr> 
                      <td colspan="2"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Degree/Field of Interest:</b><font color="red"><br>Example 1: MFA in Photography<br>Example 2: Studied Art</font> 
                        </font></td>
                    </tr>
                    <tr> 
                      <td colspan="2"> 
                        <cfoutput>
						<input type="text" size="35" name="#SecColDegreeName#"  maxlength="75" value="#TRIM(SecColDegree)#">
                    	</cfoutput>
					</tr>
                  </table>
                  <table width="70%">
                    <tr> 
                      <td colspan="2"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Most 
                        Important Teacher(s):</b> (if applicable)</font></td>
                    </tr>
                    <tr> 
                      <td colspan="2" height="29"> 
                        <input type="text" size="35" name="<CFOUTPUT>#SecColTeacher1Name#</CFOUTPUT>"  maxlength="75" <CFOUTPUT>value="#TRIM(SecColTeacher1)#"</CFOUTPUT>>
                    </tr>
	                   <tr> 
                      <td colspan="2" height="29"> 
                        <input type="text" size="35" name="<CFOUTPUT>#SecColTeacher2Name#</CFOUTPUT>"  maxlength="75" <CFOUTPUT>value="#TRIM(SecColTeacher2)#"</CFOUTPUT>>
                    </tr>
		             <tr> 
                      <td colspan="2" height="29"> 
                        <input type="text" size="35" name="<CFOUTPUT>#SecColTeacher3Name#</CFOUTPUT>"  maxlength="75" <CFOUTPUT>value="#TRIM(SecColTeacher3)#"</CFOUTPUT>>
                    </tr>
                  </table>
                    <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"> 
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
				  <br>
                  <br>
   				  <input type="HIDDEN" name="Custnumber" <CFOUTPUT>value="#qGetEducation.Custnumber#"</CFOUTPUT>> 
				  <input type="submit" name="Save" value="Save Changes"><br><br>
				  <input type="submit" name="Add" value="Save Changes and Add More Events">
	  </form>     <br>
                  <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"> 
                  <BR>
                  <FONT FACE="Arial, Helvetica, Sans-Serif" size="2"><IMG SRC="images/photoeyebooks&prints.gif" WIDTH=308 HEIGHT=28 BORDER=0><br>
                  376 Garcia Street, Santa Fe, NM 87501<br>
                  Orders Only: 800-227-6941 Info: 505-988-5152 Fax: 505-988-4487<br>
                  E-Mail: <a href="mailto:webmaster@photoeye.com">webmaster@photoeye.com</a><br>
                  © photo-eye books &amp; prints, <cfoutput>YEAR(NOW())</cfoutput>. All Rights Reserved.</font> 
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

</center>
</div>
</body>
</html>

