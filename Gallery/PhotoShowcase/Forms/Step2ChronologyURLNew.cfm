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
FROM GalleryChronology WHERE Custnumber = #custnumber# 
</cfquery>

<cfoutput>
	<cfset RecordCount = #qGetShowcaseSetupInfo.RecordCount#>
	<cfset Count=RecordCount>
	<cfset FieldCounter=6>
	<cfloop index="Count" from="6" to="0" step="-1">
		<cfif #qGetShowcaseSetupInfo.RecordCount# LT #Count#>
			<cfquery name="qGalleryChronologyInsert" DATASOURCE="photoeyecom" >
				INSERT INTO GalleryChronology (Custnumber, FieldID, Year, Description) VALUES ('#custnumber#',#fieldcounter#,'','')
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
<title>photo-eye Photographer's Showcase | Chronology Setup</title>
</head>

<body bgcolor="gray" link="#000080" vlink="#000080">
<div align="center"><center>
	<form method="post" action="Step2UpdateChronologyNew.cfm?Step=10&Custnumber=<cfoutput>#custnumber#</cfoutput>">
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
                  9 - Chronology</font><font face="Verdana,Arial,Helvetica,sans-serif" size="5"> 
                  <br>
                  <font size="2">This information will appear on your Biography 
                  page<br>
                  <br>
                  <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"></font></font></td>
              </tr>
              <tr>
                <td colspan="3" valign="top"><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><b>Chronology:</b><br>
                  <font size="1">List any significant events that helped further your career as an artist. 
				  Enter information that was important to your creative development,  
				  including major influences and important projects.<br><br> 
				  Using a brief, narrative writing style will provide a way for viewers to get to know you as an artist. 
				  <b>Please do not repeat the itemization of your Birth Date, Education, Exhibitions, Awards, Bibliography, etc. already entered.</b>

<br><br> If you need to add more events, click the Add More Events button at the bottom of the screen. When finished, don't forget to Save Changes before leaving this page.
				  <font color="Red">It is not necessary to keep these events in order. They will automatically appear in chronological order on your Showcase.</font>
                  <br><br>
                  </font><font face="Verdana,Arial,Helvetica,sans-serif" size="1"><font color="red">Example:<br></font> 
                 1984 - Met Eugene Smith who encouraged me to continue my street photography.<br><br> </font></font></td>
              </tr>
       <!---        <tr> 
                <td colspan="3" valign="top"><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Event 
                  1&nbsp;&nbsp;&nbsp;&nbsp;Year of Birth: 
                  <input type="text" size="5"  maxlength="4" name="Birth" <CFOUTPUT>value="#qGetShowcaseSetup.Birth#"</CFOUTPUT>>
                  <br>
                  </b></font><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Birthplace:</b></font> 
                  <input type="text" size="75" name="BirthL" maxlength="75" <CFOUTPUT>value="#qGetShowcaseSetup.BirthL#"</CFOUTPUT>>
                  <font face="Verdana,Arial,Helvetica,sans-serif" size="5"><font size="2"><br>
                  <br>
                  </font></font><font face="Verdana,Arial,Helvetica,sans-serif" size="5"><font size="2"><img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"></font></font><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"></font></td>
              </tr> --->
	
	<!---Requery Chronology to reflect the new inserted data --->
	<cfquery name="qGetShowcaseSetupInfo" DATASOURCE="photoeyecom" >
SELECT *
FROM GalleryChronology WHERE Custnumber = #custnumber# ORDER BY FieldID
</cfquery>
	<cfset half=ceiling(qGetShowcaseSetupInfo.RecordCount/2)>
	<cfset number=1>
	<cfset secColYearName00="Year00">
	<cfset ColOneYearName00="Year00">
	<cfset ColOneDescriptionName00="Description00">
	<cfset secColDescriptionName00="Description00">
	
	<cfset numbercol=qGetShowcaseSetupInfo.recordcount>
	   <cfloop index="this" from="1" to="#half#">
	   
		<cfset number1=number> 
		<cfset number2=number+1>  

     		<cfset ColOneDescription= qGetShowcaseSetupInfo.Description[Number1]>
		    <cfset ColOneYear= qGetShowcaseSetupInfo.Year[Number1]>
			<cfset ColOneYearNameNew = ColOneYearName00>
			<cfset ColOneYearName = #Replace(ColOneYearNameNew, "00", Number1)#>
			<cfset ColOneDescriptionNameNew = ColOneDescriptionName00>
			<cfset ColOneDescriptionName = #Replace(ColOneDescriptionNameNew, "00", Number1)#>
    
			 <cfif numbercol-1 gt 0>
				<cfset secColDescription= qGetShowcaseSetupInfo.Description[Number2]>
				<cfset secColDescriptionNameNew=secColDescriptionName00>
				<cfset SecColDescriptionName =#Replace(SecColDescriptionNameNew, "00", Number2)#>			
			 	<cfset secColYear= qGetShowcaseSetupInfo.Year[Number2]>
				<cfset SecColYearNameNew = SecColYearName00>
				<cfset SecColYearName =#Replace(SecColYearNameNew, "00", Number2)#>
				
			</cfif>
     <tr>
           <td width="49%" valign="top"> 
                  <font face="Verdana,Arial,Helvetica,sans-serif" color="Black" size="1"><b>Event 
                      <cfoutput>#number1#</cfoutput>&nbsp;&nbsp;&nbsp;&nbsp;Year: 
                    <input type="text" size="5"  maxlength="4" name="<CFOUTPUT>#ColOneYearName#</CFOUTPUT>" <CFOUTPUT>value=#trim(ColOneYear)#</CFOUTPUT>>
                    <br>
                    <br>
                    Description:</b><br>
                    <font color="red">Please be careful with spelling, punctuation, and grammar since this information will be part of your online                     portfolio. Please make it brief.</font></font><br>
					<textarea name="<CFOUTPUT>#ColOneDescriptionName#</CFOUTPUT>" rows="5" cols="25"><CFOUTPUT>#ColOneDescription#</CFOUTPUT></textarea>

                    <br><br>
                    <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"> 
				 <cfset numbercol=numbercol-1>
				 <cfset number=number+1>    
				</td>  
				
          <cfif numbercol gt 0>
		   <td width="49%" valign="top"> 
                  <font face="Verdana,Arial,Helvetica,sans-serif" color="Black" size="1"><b>Event 
                     <cfoutput>#number2#</cfoutput>&nbsp;&nbsp;&nbsp;&nbsp;Year: 
                    <input type="text" size="5"  maxlength="4" name="<CFOUTPUT>#secColYearName#</CFOUTPUT>" value=<cfoutput>#trim(secColYear)#</CFOUTPUT>>
                    <br>
                    <br>
                    Description:</b><br>
                    <font color="red">Please be careful with spelling, punctuation, 
                    and grammar since this information will be part of your online portfolio. Please make it brief.</font></font><br>
					<textarea name="<CFOUTPUT>#secColDescriptionName#</CFOUTPUT>" rows="5" cols="25"><CFOUTPUT>#secColDescription#</CFOUTPUT></textarea>

                    <br><br>
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
   				  <input type="HIDDEN" name="Custnumber" <CFOUTPUT>value="#qGetShowcaseSetupInfo.Custnumber#"</CFOUTPUT>> 
				  <input type="submit" name="Save" value="Save Changes"><br><br>
				  <input type="submit" name="Add" value="Save Changes and Add More Events">
	  </form>     <br>
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

</center>
</div>
</body>
</html>

