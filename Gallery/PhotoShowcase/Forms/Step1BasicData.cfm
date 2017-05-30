<CFQUERY NAME="qGetShowcaseSetupInfo"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup
  WHERE Custnumber = #url.custnumber#
</CFQUERY>


<!--- Get Showcase Color--->

<CFQUERY NAME="qShowcasePortfolio"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryPortfolio where Custnumber=#url.custnumber#
</CFQUERY>
<!--- If no background paramater Exists, Make Background Black --->
<cfif #len(qShowcasePortfolio.Backgroundcolor)# GT 0>
	<cfset Background = #trim(qShowcasePortfolio.Backgroundcolor)#>
	<cfset BackgroundHeader = #trim(qShowcasePortfolio.BgHeaderColor)#>
<cfelse>
	<cfset Background = "000000">
	<cfset BackgroundHeader = "333333">
</cfif>


<CFIF #qGetShowcaseSetupInfo.Password# is "">
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">


<html>

<head>
<title>photo-eye Photographer's Showcase | Set Up Form </title>
</head>
<body bgcolor="gray" link="#000080" vlink="#000080">
<div align="center"><center>


<div align="center"><center>
	<form method="post" action="Step1BasicData2.cfm">
<br>

   <table width="85%" bgcolor="#FFFFFF" align="center">
      <tr><td align="center"> 
  
	          
            <table width="95%" border="0" cellpadding="5" bgcolor="#FFFFFF" cellspacing="0" valign="top" align="center">
              <tr valign="top"> 
                <td colspan="3" align="left"> <br>
                  <img src="../SharedImages/photo-eye%20Explore%20NewLogo_photoShowcaseVersionWhiteBackground.jpg" width="151" height="94"></td>
              </tr>
              <TR> 
                <TD COLSPAN="3" ALIGN="LEFT"><font face="Verdana,Arial,Helvetica,sans-serif" size="4">Password 
                  Not Found</font><font face="Verdana,Arial,Helvetica,sans-serif" size="5"><br>
                  <font size="2">Retry password to setup your Showcase<br>
                  <br>
                  <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"></font></font></td>
              </tr>
              <tr> 
                <td width="49%" valign="top" height="124"> 
                  <p> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Your 
                    Password Hint:</b></font><br>
                    <font face="Verdana,Arial,Helvetica,sans-serif" size="5"><font size="2"> 
                    <input type="text" size="30" maxlength="50" name="Hint" <CFOUTPUT>value="#trim(qGetShowcaseSetupInfo.Hint)#"</CFOUTPUT>>
                    </font></font><br>
                    <br>
                    <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Enter Your Password:</b> (Case Sensitive)<br>
                    Use your Customer Number Initially<font color="red"></font> 
                    </font><br>
                    <input type="text" size="30" maxlength="50" name="Password">
                  </p>
                  </td>
                <td width="2%" valign="top" align="left" height="124"> 
                  <div align="center"><img src="Images/BlackRule.gif" width=1 height=100% alt="" border="0"></div>
                </td>
                <td valign="top" width="49%" height="124"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><b> 
                  </b></font> </td>
              </tr>
              <tr> 
                <td align="center" colspan="3"> 
                  <p><img src="Images/BlackRule.gif" width=100% height=8 alt="" border="0"><br>
                    <br>
                    <INPUT TYPE="SUBMIT" VALUE="Continue Login">
                    <INPUT TYPE="SUBMIT" VALUE="Cancel">
                    <br>
                    <br>
                    <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"> 
                    <BR>
                    <FONT FACE="Arial, Helvetica, Sans-Serif" size="2"><IMG SRC="images/photoeyebooks&prints.gif" WIDTH=308 HEIGHT=28 BORDER=0><br>
                    376 Garcia Street, Santa Fe, NM 87501<br>
                    Orders Only: 800-227-6941 Info: 505-988-5152 Fax: 505-988-4487<br>
                    E-Mail: <a href="mailto:webmaster@photoeye.com">webmaster@photoeye.com</a><br>
                    © photo-eye books &amp; prints, 2001. All Rights Reserved.</font> 
                    <FONT FACE="Arial, Helvetica, Sans-Serif" size="1">This entire 
                    web site is the © copyrighted property of photo-eye books 
                    &amp; prints, except where artists' and publishers' copyrights 
                    on the materials described take precedence. No portion of 
                    the contents within may be reproduced in any form, for any 
                    non-private use, without the express written permission of 
                    photo-eye books &amp; prints.<br>
                    </font></p>
                  </td>
              </tr>
              <tr>
                <td></td>
              </tr>
            </table> 

    
 </td></tr></table> 
	<INPUT TYPE="HIDDEN" NAME="Custnumber"  		<CFOUTPUT>value="#qGetShowcaseSetupInfo.Custnumber#"</CFOUTPUT>>
      <input type="HIDDEN" name="Email" <CFOUTPUT>value="#qGetShowcaseSetupInfo.Email#"</CFOUTPUT>>
</form>
</center>
</div>
</body>
</html>

<CFELSE>

<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">

<html>

<head>
<title>photo-eye Photographer's Showcase | Set Up Form </title>
</head>

<body bgcolor="gray" link="#000080" vlink="#000080">
<div align="center"><center>
	<form method="post" action="Step1UpdateBasicData.cfm?step=2">

   <table width="85%" bgcolor="#FFFFFF" align="center">
      <tr><td align="center"> 
  
	          
            <table width="95%" border="0" cellpadding="5" bgcolor="#FFFFFF" cellspacing="0" valign="top" align="center">
              <tr valign="top"> 
                <td colspan="3" align="left">
                  <img src="../SharedImages/photo-eye%20Explore%20NewLogo_photoShowcaseVersionWhiteBackground.jpg" width="151" height="94">
              </td>
			  </tr>
              <TR> 
                <TD COLSPAN="3" ALIGN="LEFT"><font face="Verdana,Arial,Helvetica,sans-serif" size="4">Step 
                  1 - Basic Information</font><font face="Verdana,Arial,Helvetica,sans-serif" size="5"><br>
                  <font size="2">General Biographical Data
                  <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"></font></font>
              
              
                  <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><b>Biographical 
                    Information:</b><br>
                    <font size="1">Please complete the required fields, along with most others, in this section.</font></font><font face="Verdana,Arial,Helvetica,sans-serif" size="1"><font color="red"><br>
                    *</font> Signifies a required field</font><br></td>
                 </tr>
				 <tr> 
                <td width="49%" valign="top"> 
                    <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b> 
                    First | Last Name: <font color="red">*</font></b></font><br>
                    <input type="text" size="14" maxlength="50" name="FirstName" <CFOUTPUT>value="#trim(qGetShowcaseSetupInfo.FirstName)#"</CFOUTPUT>>
                    <input type="text" size="14" maxlength="50" name="LastName"  <CFOUTPUT>value="#trim(qGetShowcaseSetupInfo.LastName)#"</CFOUTPUT>>
                    <br><br>
                    <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Company 
                    or Secondary Address Line:</b></font><br>
                    <input type="text" size="30" maxlength="50" name="Address2" <CFOUTPUT>value="#trim(qGetShowcaseSetupInfo.Address2)#"</CFOUTPUT>>
                    <br><br>
                    <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Address: 
                    <font color="red">*</font> </b></font><br>
                    <input type="text" size="30" maxlength="50" name="Address1" <CFOUTPUT>value="#trim(qGetShowcaseSetupInfo.Address1)#"</CFOUTPUT>>
                    <br><br>
                    <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>City: 
                    <font color="red">*</font> </b></font><br>
                    <input type="text" size="27" maxlength="50" name="City" <CFOUTPUT>value="#trim(qGetShowcaseSetupInfo.City)#"</CFOUTPUT>>
                    <br><br>
                    <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>State: 
                    <font color="red">*</font> </b></font><br>
                    <select name="State">
                     <cfif #len(trim(qGetShowcaseSetupInfo.State))# is 0>
					  <option selected <CFOUTPUT>value=""</CFOUTPUT>>Select 
                      State</option>
					  </cfif>
					  <option value="FO"<CFIF #qGetShowcaseSetupInfo.State# is "FO">SELECTED</CFIF>>Foreign (No State) </option>
                      <option value="AL"<CFIF #qGetShowcaseSetupInfo.State# is "AL">SELECTED</CFIF>>Alabama (AL) </option>
                      <option value="AK"<CFIF #qGetShowcaseSetupInfo.State# is "AK">SELECTED</CFIF>>Alaska (AK) </option>
                      <option value="AZ"<CFIF #qGetShowcaseSetupInfo.State# is "AZ">SELECTED</CFIF>>Arizona (AZ) </option>
                      <option value="AR"<CFIF #qGetShowcaseSetupInfo.State# is "AR">SELECTED</CFIF>>Arkansas (AR) </option>
                      <option value="CA"<CFIF #qGetShowcaseSetupInfo.State# is "CA">SELECTED</CFIF>>California (CA) </option>
                      <option value="CO"<CFIF #qGetShowcaseSetupInfo.State# is "CO">SELECTED</CFIF>>Colorado (CO) </option>
                      <option value="CT"<CFIF #qGetShowcaseSetupInfo.State# is "CT">SELECTED</CFIF>>Connecticut (CT) </option>
                      <option value="DE"<CFIF #qGetShowcaseSetupInfo.State# is "DE">SELECTED</CFIF>>Delaware (DE) </option>
                      <option value="DC"<CFIF #qGetShowcaseSetupInfo.State# is "DC">SELECTED</CFIF>>District of Columbia (DC) </option>
                      <option value="FL"<CFIF #qGetShowcaseSetupInfo.State# is "FL">SELECTED</CFIF>>Florida (FL) </option>
                      <option value="GA"<CFIF #qGetShowcaseSetupInfo.State# is "GA">SELECTED</CFIF>>Georgia (GA) </option>
                      <option value="HI"<CFIF #qGetShowcaseSetupInfo.State# is "HI">SELECTED</CFIF>>Hawaii (HI) </option>
                      <option value="ID"<CFIF #qGetShowcaseSetupInfo.State# is "ID">SELECTED</CFIF>> Idaho (ID) </option>
                      <option value="IL"<CFIF #qGetShowcaseSetupInfo.State# is "IL">SELECTED</CFIF>>Illinois (IL) </option>
                      <option value="IN"<CFIF #qGetShowcaseSetupInfo.State# is "IN">SELECTED</CFIF>>Indiana (IN) </option>
                      <option value="IA"<CFIF #qGetShowcaseSetupInfo.State# is "IA">SELECTED</CFIF>>Iowa (IA) </option>
                      <option value="KS"<CFIF #qGetShowcaseSetupInfo.State# is "KS">SELECTED</CFIF>>Kansas (KS) </option>
                      <option value="KY"<CFIF #qGetShowcaseSetupInfo.State# is "KY">SELECTED</CFIF>>Kentucky (KY) </option>
                      <option value="LA"<CFIF #qGetShowcaseSetupInfo.State# is "LA">SELECTED</CFIF>>Louisiana (LA) </option>
                      <option value="ME"<CFIF #qGetShowcaseSetupInfo.State# is "ME">SELECTED</CFIF>>Maine (ME) </option>
                      <option value="MD"<CFIF #qGetShowcaseSetupInfo.State# is "MD">SELECTED</CFIF>>Maryland (MD) </option>
                      <option value="MA"<CFIF #qGetShowcaseSetupInfo.State# is "MA">SELECTED</CFIF>>Massachusetts (MA) </option>
                      <option value="MI"<CFIF #qGetShowcaseSetupInfo.State# is "MI">SELECTED</CFIF>>Michigan (MI) </option>
                      <option value="MN"<CFIF #qGetShowcaseSetupInfo.State# is "MN">SELECTED</CFIF>>Minnesota (MN) </option>
                      <option value="MS"<CFIF #qGetShowcaseSetupInfo.State# is "MS">SELECTED</CFIF>>Mississippi (MS) </option>
                      <option value="MO"<CFIF #qGetShowcaseSetupInfo.State# is "MO">SELECTED</CFIF>>Missouri (MO) </option>
                      <option value="MT"<CFIF #qGetShowcaseSetupInfo.State# is "MT">SELECTED</CFIF>>Montana (MT) </option>
                      <option value="NE"<CFIF #qGetShowcaseSetupInfo.State# is "NE">SELECTED</CFIF>>Nebraska (NE) </option>
                      <option value="NV"<CFIF #qGetShowcaseSetupInfo.State# is "NV">SELECTED</CFIF>>Nevada (NV) </option>
                      <option value="NH"<CFIF #qGetShowcaseSetupInfo.State# is "NH">SELECTED</CFIF>>New Hampshire (NH) </option>
                      <option value="NJ"<CFIF #qGetShowcaseSetupInfo.State# is "NJ">SELECTED</CFIF>>New Jersey (NJ) </option>
                      <option value="NM"<CFIF #qGetShowcaseSetupInfo.State# is "NM">SELECTED</CFIF>>New Mexico (NM) </option>
                      <option value="NY"<CFIF #qGetShowcaseSetupInfo.State# is "NY">SELECTED</CFIF>>New York (NY) </option>
                      <option value="NC"<CFIF #qGetShowcaseSetupInfo.State# is "NC">SELECTED</CFIF>>North Carolina (NC) </option>
                      <option value="ND"<CFIF #qGetShowcaseSetupInfo.State# is "ND">SELECTED</CFIF>>North Dakota (ND) </option>
                      <option value="OH"<CFIF #qGetShowcaseSetupInfo.State# is "OH">SELECTED</CFIF>>Ohio (OH) </option>
                      <option value="OK"<CFIF #qGetShowcaseSetupInfo.State# is "OK">SELECTED</CFIF>>Oklahoma (OK) </option>
                      <option value="OR"<CFIF #qGetShowcaseSetupInfo.State# is "OR">SELECTED</CFIF>>Oregon (OR) </option>
                      <option value="PA"<CFIF #qGetShowcaseSetupInfo.State# is "PA">SELECTED</CFIF>>Pennsylvania (PA) </option>
                      <option value="PR"<CFIF #qGetShowcaseSetupInfo.State# is "PR">SELECTED</CFIF>>Puerto Rico (PR) </option>
                      <option value="RI"<CFIF #qGetShowcaseSetupInfo.State# is "RI">SELECTED</CFIF>>Rhode Island (RI) </option>
                      <option value="SC"<CFIF #qGetShowcaseSetupInfo.State# is "SC">SELECTED</CFIF>>South Carolina (SC) </option>
                      <option value="SD"<CFIF #qGetShowcaseSetupInfo.State# is "SD">SELECTED</CFIF>>South Dakota (SD) </option>
                      <option value="TN"<CFIF #qGetShowcaseSetupInfo.State# is "TN">SELECTED</CFIF>>Tennessee (TN) </option>
                      <option value="TX"<CFIF #qGetShowcaseSetupInfo.State# is "TX">SELECTED</CFIF>>Texas (TX) </option>
                      <option value="UT"<CFIF #qGetShowcaseSetupInfo.State# is "UT">SELECTED</CFIF>>Utah (UT) </option>
                      <option value="VI"<CFIF #qGetShowcaseSetupInfo.State# is "VI">SELECTED</CFIF>>Virgin Islands (VI) </option>
                      <option value="VT"<CFIF #qGetShowcaseSetupInfo.State# is "VT">SELECTED</CFIF>>Vermont (VT) </option>
                      <option value="VA"<CFIF #qGetShowcaseSetupInfo.State# is "VA">SELECTED</CFIF>>Virginia (VA) </option>
                      <option value="WA"<CFIF #qGetShowcaseSetupInfo.State# is "WA">SELECTED</CFIF>>Washington (WA) </option>
                      <option value="WV"<CFIF #qGetShowcaseSetupInfo.State# is "WV">SELECTED</CFIF>>West Virginia (WV) </option>
                      <option value="WI"<CFIF #qGetShowcaseSetupInfo.State# is "WI">SELECTED</CFIF>>Wisconsin (WI) </option>
                      <option value="WY"<CFIF #qGetShowcaseSetupInfo.State# is "WY">SELECTED</CFIF>>Wyoming (WY) </option>
                    </select>
                    <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b><br><br>
                    Country: <font color="red">*</font></b></font><br>
                    <input type="text" size="30"
            maxlength="50" name="Country" <CFOUTPUT>value="#trim(qGetShowcaseSetupInfo.Country)#"</CFOUTPUT>>
                    <br><br>
                    <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Postal 
                    Code: <font color="red">*</font></b></font><br>
                    <input type="text" size="10"
            maxlength="10" name="Zip" <CFOUTPUT>value="#trim(qGetShowcaseSetupInfo.Zip)#"</CFOUTPUT>>
                    <BR><br>
                    <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Telephone: 
                    <font color="red">*</font></b></font><font face="Arial, Helvetica, sans-serif"
            color="#0000FF"><b><br>
                    </b></font> 
                    <input type="text" size="16"
            maxlength="12" name="Phone" <CFOUTPUT>value="#trim(qGetShowcaseSetupInfo.Phone)#"</CFOUTPUT>>

				
					
                  </td>
				  
				 <td width="49%" valign="top">  
				  <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"> 
                 <b>Year of Birth:<br> 
                  <input type="text" size="5"  maxlength="4" name="Birth" <CFOUTPUT>value="#trim(qGetShowcaseSetupinfo.Birth)#"</CFOUTPUT>>
                  <br><br>
                  Birthplace:<br></b> 
                  <input type="text" size="30" name="BirthL" maxlength="75" <CFOUTPUT>value="#trim(qGetShowcaseSetupinfo.BirthL)#"</CFOUTPUT>>
					</font>
					<br><br>
                    <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Nationality: 
                    <font color="red">*</font> </b><br>
                    <input type="text" size="30"  maxlength="75"
            name="Nationality" <CFOUTPUT>value="#trim(qGetShowcaseSetupInfo.Nationality)#"</CFOUTPUT>>
                    <br><br>
                    </font><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>E-Mail 
                    Address: <font color="red">*</font> </b><br>
                    <input type="text" size="30"  maxlength="75"
            name="Email" 
<CFOUTPUT>value="#qGetShowcaseSetupInfo.Email#"</CFOUTPUT>>
                    <br><br>
                    <b>Password:<font color="red">*</font> </b>(change it here 
                    if you wish)<br>
<cfif qGetShowcaseSetupInfo.step1 is 1>                   
				    <input type="text" size="30"  maxlength="75"
            name="Password" <CFOUTPUT>value="#trim(qGetShowcaseSetupInfo.Password)#"</CFOUTPUT>>
<cfelse>
				    <input type="text" name="Password" value=" " size="30" maxlength="75">
</cfif>
                    <br><br>
                    <b>Re-Enter Password: <font color="red">*</font> </b><br>
<cfif qGetShowcaseSetupInfo.step1 is 1>                      
				    <input type="text" size="30"  maxlength="75"
            name="Password2"<CFOUTPUT>value="#trim(qGetShowcaseSetupInfo.Password)#"</CFOUTPUT>>
<cfelse>
				    <input type="text" name="Password2" value=" " size="30" maxlength="75">
</cfif>
                    <br>
					<br>
                  	<b>Your Password Hint: <font color="red">*</font><br><br>
                    <font face="Verdana,Arial,Helvetica,sans-serif" size="1">
<cfif qGetShowcaseSetupInfo.step1 is 1>                    
				    <input type="text" size="30" maxlength="50" name="Hint" <CFOUTPUT>value="#trim(qGetShowcaseSetupInfo.Hint)#"</CFOUTPUT>>
<cfelse>
				    <input type="text" size="30" maxlength="50" name="Hint" value=" ">
</cfif></b>
<br><br>
					
					
					
	                <b>Choose your Showcase Color Combination: <br>
                    <CFIF #Background# is "000000">
						<input type="radio" name="ShowcaseColor" value="0" Checked>Black Background with Gray Header<br>
						<input type="radio" name="ShowcaseColor" value="1">Dark Gray Background with Black Header
					<CFELSE>
						<input type="radio" name="ShowcaseColor" value="0">Black Background with Gray Header<br>
						<input type="radio" name="ShowcaseColor" value="1" Checked>Dark Gray Background with Black Header
					</CFIF></b>				
                    <br>
                    </font> 
				
					
				 
				  </td>
              </tr>

              <tr> 
                <td align="center" colspan="3"> 
                  <p><img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"><br>
                    <br>
                    <INPUT TYPE="SUBMIT" VALUE="Save Changes">
                    <br>
                    <br>
                    <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"> 
                    <BR>
                    <FONT FACE="Arial, Helvetica, Sans-Serif" size="2"><IMG SRC="images/photoeyebooks&prints.gif" WIDTH=308 HEIGHT=28 BORDER=0><br>
                    376 Garcia Street, Santa Fe, NM 87501<br>
                    Orders Only: 800-227-6941 Info: 505-988-5152 Fax: 505-988-4487<br>
                    E-Mail: <a href="mailto:webmaster@photoeye.com">webmaster@photoeye.com</a><br>
                    © photo-eye books &amp; prints, <cfoutput>#YEAR(Now())#</cfoutput>. All Rights Reserved.</font> 
                    <FONT FACE="Arial, Helvetica, Sans-Serif" size="1">This entire 
                    web site is the © copyrighted property of photo-eye books 
                    &amp; prints, except where artists' and publishers' copyrights 
                    on the materials described take precedence. No portion of 
                    the contents within may be reproduced in any form, for any 
                    non-private use, without the express written permission of 
                    photo-eye books &amp; prints.<br>
                    </font></p>
                  </td>
              </tr>
              <tr>
                <td></td>
              </tr>
            </table> 

    
 </td></tr></table> 
    <INPUT TYPE="HIDDEN" NAME="Custnumber" <CFOUTPUT>value="#qGetShowcaseSetupInfo.Custnumber#"</CFOUTPUT>>
    
	<INPUT TYPE="HIDDEN" NAME="FirstName_required" VALUE="Youour first name is required.">
    <INPUT TYPE="HIDDEN" NAME="LastName_required" VALUE="Yourlast name is required.">
	<INPUT TYPE="HIDDEN" NAME="Address1_required" VALUE="Your street address is required.">
    <INPUT TYPE="HIDDEN" NAME="City_required" VALUE="Your city is required.">
    <INPUT TYPE="HIDDEN" NAME="State_required" VALUE="Your state is required. Choose FO if your live outside the U.S.">
    <INPUT TYPE="HIDDEN" NAME="Zip_required" VALUE="Your zip or postal code is required">
    <INPUT TYPE="HIDDEN" NAME="Email_required" VALUE="Your e-mail address is required.">
	<INPUT TYPE="HIDDEN" NAME="Phone_required" VALUE="Your telephone number is required.">
	<INPUT TYPE="HIDDEN" NAME="Password_required" VALUE="A password is required.">
	<INPUT TYPE="HIDDEN" NAME="Password2_required" VALUE="Please re-enter your password.">
	<INPUT TYPE="HIDDEN" NAME="Hint_required" VALUE="Please enter a password hint that  will help you remember your password. Make it a phrase or a word that is discrete, something that won't be obvious to others.">
	<INPUT TYPE="HIDDEN" NAME="Nationality_required" VALUE="Your nationality is required.">
	</form>
</center>
</div>
</body>
</html>

</CFIF>


