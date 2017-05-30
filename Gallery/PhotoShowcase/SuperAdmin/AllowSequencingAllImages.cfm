
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye</title>
</head>

<body>
      <form action="AllowSequencingAllImagesAction.cfm" method="post">
<table width="400" border="0" cellspacing="0" cellpadding="3">
  <tr>
       <td colspan="2" colwidth="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> Change Image Sequencing Capability for</font>:<br><br></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="2">First Name: 
        </font> 
        <input type="text" name="FirstName">
   
    </td>
    <td>
        <p><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Last Name:</font>
          <input type="text" name="Lastname">
        </p>
        </td>
  </tr>
  <tr><td>
  &nbsp;
  </td>
  
  </tr>
    <tr>
      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Portfolio Number: 
        </font> 
        <input type="text" name="PortfolioNo" size="2" maxlength="2">
   
    </td>
    <td>
&nbsp;
        </td>
  </tr>
  
  
    <tr>
      <td colspan="2" colwidth="2"> <BR><BR>       <input type="submit" name="Change" value="Unrestricted Sequencing"> <input type="submit" name="Change" value="Restricted">
      </td>
  </tr>
</table>

<INPUT NAME="PortfolioNo_required" type="HIDDEN" value="Please enter the portfolio number that this change applies.">

<INPUT NAME="FirstName_required" type="HIDDEN" value="Please enter the first name.">

<INPUT NAME="LastName_required" type="HIDDEN" value="Please enter the last name.">

</form>
<cfoutput>


</cfoutput>


</body>
</html>
