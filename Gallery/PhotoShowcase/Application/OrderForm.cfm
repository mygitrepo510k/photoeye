<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">

<html>

<head>
<title>Order Form Password</title>
</head>

<body bgcolor="#cccc99" link="BLUE" vlink="#000080">

<div align="center"><center>

<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td width="50%"><strong><font color="#000080" face="Arial, Helvetica, sans-serif" size="4">O</font><font
        color="#000080" face="Arial, Helvetica, sans-serif" size="3">rder </font><font
        color="#000080" face="Arial, Helvetica, sans-serif" size="4">F</font><font color="#000080"
        size="3" face="Arial, Helvetica, sans-serif">orm<br>
        </font><font color="Maroon" size="2" face="Arial, Helvetica, sans-serif"><strong>Password</strong></font></strong></td>
         <td align="right" width="45%"><font color="#000080"
        size="2" face="Arial, Helvetica, sans-serif"><strong><CFOUTPUT>#Dateformat(Now(),"dddd, mmmm dd, yyyy")#</CFOUTPUT><br>
        <CFOUTPUT>#TimeFormat(Now(),'hh:mm')#</CFOUTPUT></strong></font>
<strong><font size="1" face="Arial, Helvetica, sans-serif" color="#000080"> EST</font></strong>
</td>
    </tr>
</table>
</center></div>

<hr size="1" noshade color="#000080">

<!--- Tracks real cookie --->
<!--- Works off URL.Cookie Paramater --->
<!--- Make sure all Posts include:
 ?cookie=<cfoutput>#id.URLUserIdNumber#</cfoutput>"> --->

<CFIF ParameterExists(URL.Id)> 

<CFCOOKIE NAME="URLUserIdNumber" 
           VALUE=#URL.Id#>
<CFELSE> No Cookie Exisits
</CFIF>

<cfif isdefined("cookie.URLUserIdNumber") is false>
<cfoutput> No cookie!</cfoutput>
<cfelse> <!--- <cfoutput>#Cookie.URLUserIdNumber#</cfoutput> --->
</cfif>

<!--- End of Real Cookie Tracking--->

<p align="center"><font color="#000000" face="Arial, Helvetica, sans-serif" size="2"><strong>For our regular
customers, if you know your 5 digit customer number, please enter
it here.</strong></font></p>

<!--- <form action="http://www.photoeye.com/templates/OrderFormExists.cfm" method="POST"> --->
<CFOUTPUT>
<form action="OrderFormExists.cfm?iD=#cookie.URLUserIdNumber#"
 method="POST">
</cfoutput>
    <center><table border="0">
        <tr>
            <td align="right"><font color="#000080" size="2" face="Arial, Helvetica, sans-serif"><strong>Enter
            your Last Name :</strong></font><font color="#000080"
            size="2"><strong> </strong></font></td>
            <td><input
            type="text" size="20" maxlength="20"
            name="VerifyLastName"> </td>

            <INPUT type="hidden" name="VerifyLastName_required" value="Please enter your last name for user authentication">

        </tr>
        <tr>
            <td><font color="#000080" size="2" face="Arial, Helvetica, sans-serif"><strong>Enter 5
            digit Customer Number:</strong></font></td>
            <td><input type="text" size="5"
            maxlength="5" name="CustNumber"><font color="#cccc99" face="Arial, Helvetica, sans-serif">.....</font><input
            type="submit" value="Continue"><br>
            <INPUT type="hidden" name="CustNumber_required" value="Please enter a valid 5 digit customer identification number">

            </td>
        </tr>
    </table>
    </center>
</form>

<center><font color="#000000" face="Arial, Helvetica, sans-serif" size="2"><strong>Otherwise, if you
are a new customer<BR>or if you don't know your customer number:</strong></font>
<cfoutput>
<form method="POST" ACTION="RouteDomestic.cfm?id=#cookie.URLUserIdNumber#">
</cfoutput>
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td width="100%"><p align="center">
            <CENTER>
              <input type="submit" value="Enter Ordering Information"><BR>
                     <FONT SIZE="3" COLOR="000080" face="Arial, Helvetica, sans-serif"><b>for a</b></FONT> 
					 	<SELECT NAME="Domestic"> 
                            <OPTION VALUE="1" SELECTED>Domestic Address
                            <OPTION VALUE="0"> Foreign Address
                        </SELECT> 
            </CENTER></p>
            </td>
        </tr>
    </table>
</form>

<CFINCLUDE TEMPLATE="footer.cfm">

</body>
</html>
