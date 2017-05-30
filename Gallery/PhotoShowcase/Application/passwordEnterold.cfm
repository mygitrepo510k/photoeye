<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Password</title>
</head>


<body bgcolor="#cccc99" link="BLUE" vlink="#000080">

<div align="center"><center>

<!--- Header --->
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td width="50%"><b><font face="Arial, Helvetica, Sans-Serif"  size="3" color="#000080">O</font><font face="Arial, Helvetica, Sans-Serif" 
        size="3" color="#000080">rder </font><font face="Arial, Helvetica, Sans-Serif" 
        size="3" color="#000080">F</font><font face="Arial, Helvetica, Sans-Serif" 
        size="3" color="#000080">orm</font><br>
        <font face="Arial, Helvetica, Sans-Serif" size="2" color="Maroon"><b>Enter Password</b></font></b></td>
         <td align="right" width="45%"><b><font face="Arial, Helvetica, Sans-Serif"         size="2" color="#000080"><CFOUTPUT>#Dateformat(Now(),"dddd, mmmm dd, yyyy")#</CFOUTPUT><br>
        <CFOUTPUT>#TimeFormat(Now(),'hh:mm')#</CFOUTPUT></font></b><font face="Arial, Helvetica, Sans-Serif"  size="1" color="#000080"><b> EST</b></font>
</td>
    </tr>
</table>
</center></div>

<hr size="1" noshade color="#000080">

<!--- Cookie Tracking--->

<!--- <CFIF ParameterExists(URL.Id)> 

<CFCOOKIE NAME="URLUserIdNumber" 
           VALUE=#URL.id#>
<CFELSE> No Real Cookie Exisits
</CFIF> 

<cfif isdefined("cookie.URLUserIdNumber") is false>
<cfoutput> No cookie!</cfoutput>
<cfelse> <cfoutput>#Cookie.URLUserIdNumber#</cfoutput> 
</cfif> --->

<!--- Password Form--->

<CFOUTPUT>
<form action=PasswordGetCustomer.cfm
 method="POST">
<!---  <form action="OrderFormExists.cfm?iD=#cookie.URLUserIdNumber#"
 method="POST"> --->
</cfoutput>


<!--- Pass password and userid from previous screen and --->
<!--- compare it with ones on file --->


<!--- If there is a match, continue by calling routedomestic.cfm to get proper domesticexists or foreignexists form --->

<!--- If not, send back message stating password/username not found  with an option to re-enter password/userid or get hint or enter as new customer--->




   <center><table border="0">
        <tr>
            <td align="right"><font face ="Arial, Helvetica, Sans-Serif" color="#000080" size="2"><strong>
            E-mail Address:</strong></font><font face ="Arial, Helvetica, Sans-Serif" color="#000080"
            size="2"><strong> </strong></font></td>
            <td><input type="text" size="20" maxlength="20"
            name="VerifyEmail"> </td>
        <INPUT type="hidden" name="VerifyEmail_required" value="Please enter a valid email address">

        </tr>
        <tr>
            
      <td align="right" valign="middle" height="22"><font face ="Arial, Helvetica, Sans-Serif" color="#000080" size="2" ><strong>Password:</strong></font></td>
            
      <td height="22"> 
        <input type="password" size="20"
            maxlength="100" name="VerifyPassword">
        <font face ="Arial, Helvetica, Sans-Serif" color="#cccc99">.....</font><br>
            </td>
        <INPUT type="hidden"  name="VerifyPassword_required" value="Please enter a valid password">
        </tr>
		
    </table>
            
  <table height="73">
    <tr> 
      <td colspan="2" height="31"> 
	    <br>
        <p>
		<font size="1" face="verdana, arial, helvetica, sans-serif"><B>Forgot 
          your password? <a href="PasswordForgot.cfm">Click here</b></a><br><br>
         <font size="1" face="verdana, arial, helvetica, sans-serif"><b>Know your Customer Number but don't have a password?  <a href="PasswordCustNumber.cfm">Click Here</a><br>It may appear above your name on the photo-eye mailorder catalogue.</b></font><br><br>
          <font size="1" face="verdana, arial, helvetica, sans-serif"><b>New Customers: <a href="PasswordNewAccount.cfm>">Set Up Your Account</a></b></font>
        </p>

      </td>
    </tr>
    <tr> 
      <td colspan="2" align="center">
	  	<br>
        <input type="submit" value="Continue">
        <font face ="Arial, Helvetica, Sans-Serif" color="#cccc99"> </font></td>
    </tr>
  </table>
    </center>

</form>


<CFINCLUDE TEMPLATE="footer.cfm">



</body>
</html>
