


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase</title>
</head>


<body bgcolor="#cccc99" link="BLUE" vlink="#000080">
<p align="center">
<font size="4" face="Verdana, Arial, Helvetica, sans-serif">Create New Artist Account and Portfolio 1
</font>
</p>
<br>

<form method="post" action="InsertNewPhotographer.cfm">
<!--- <form method="post" action="querytest.cfm"> --->
  <table width="600" border="0" cellspacing="0" cellpadding="3">
    <tr>
      <td width="100" height="38" align="right">Custnumber</td>
      <td height="38"> 
        <input name="custnumber" type="text" size="6">
      </td>
      <td width="100" height="38" align="right">E-mail</td>
      <td height="38"> 
        <input type="text" name="email">
      </td>
    </tr>
  </table>
  <p>&nbsp;</p><table width="600" border="0" cellspacing="0" cellpadding="3">
    <tr> 
      <td width="100" height="38" align="right">FirstName</td>
      <td> 
        <input type="text" name="firstname">
      </td>
      <td width="100" height="38" align="right">LastName</td>
      <td> 
        <input type="text" name="lastname">
      </td>
    </tr>
  </table>
  <p>&nbsp;</p><table width="600" border="0" cellspacing="0" cellpadding="3">
    <tr> 
      <td width="100" height="38" align="right">Password</td>
      <td> 
        <input type="text" name="password">
      </td>
      <td width="100" height="38" align="right">Hint</td>
      <td> 
        <input type="text" name="hint">
      </td>
    </tr>
  </table>
  <p>&nbsp;</p><table width="600" border="0" cellspacing="0" cellpadding="3">
    <tr> 
      <td width="100" height="38" align="right">Gallery</td>
      <td> 
	     <select name="Gallery">
          <OPTION SELECTED value="PhotoShowcase">Photo&nbsp;Showcase</option>
          <OPTION value="PhotoBistro">PhotoBistro</option>		  
          <option value="RepresentedArtists">Represented&nbsp;Artists</option>
          <option value="MagnumArtists">Magnum&nbsp;Artists</option>
        </select>

      </td>
      <td width="100" height="38" align="right"><!--- Portfolio (eg. Portfolio1, Portfolio2, Portfolio3) ---></td>
      <td> 
     <!---    <input type="text" name="subdirectory"> --->
      </td>
    </tr>
  </table>
  
<!---     <p>&nbsp;</p><table width="600" border="0" cellspacing="0" cellpadding="3">
    <tr> 
      <td width="100" height="38" align="right">Images OK</td>
      <td> 
        <input type="text" name="ImagesOK" size="1">
      </td>
      <td width="100" height="38" align="right">Showcase OK</td>
      <td> 
        <input type="text" name="ShowcaseOK" size="1">
      </td>
    </tr>
  </table> --->
  
      <p>&nbsp;</p>
	<table width="600" border="0" cellspacing="0" cellpadding="3">
    <tr> 
      <td width="100" height="38" align="right">Images Qty</td>
      <td> 
        <input type="text" name="ImageQty" size="2">
      </td>
      <td width="200" height="38" align="right">
	  Multi-Artist Portfolio?</td>
      <td width=100> 
  	<input name="MultiArtists" type="checkbox" value="1">
      </td>
    </tr>
  </table>
  <br><br>
  <p align="center">
     <INPUT TYPE="HIDDEN" NAME="custnumber_required" VALUE="You must enter the artist's custnumber.">
	 <INPUT TYPE="HIDDEN" NAME="email_required" VALUE="You must enter the artist's e-mail address.">
	 <INPUT TYPE="HIDDEN" NAME="firstname_required" VALUE="You must enter the artist's first name.">
	 <INPUT TYPE="HIDDEN" NAME="lastname_required" VALUE="You must enter the artist's last name.">
	 <INPUT TYPE="HIDDEN" NAME="password_required" VALUE="You must enter the artist's password.">
	 <INPUT TYPE="HIDDEN" NAME="hint_required" VALUE="You must enter the artist's hint.">
	 <INPUT TYPE="HIDDEN" NAME="imageqty_required" VALUE="You must enter the image quantity for portfolio 1.">

   <INPUT TYPE="SUBMIT" VALUE="Create Account"></form>
   </p> 

</body>
</html>
