<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase</title>
</head>


<body bgcolor="#cccc99" link="BLUE" vlink="#000080">
Inserted Record 
<form method="post" action="InsertNewPortfolio.cfm">
       <p>&nbsp;</p><table width="600" border="0" cellspacing="0" cellpadding="3">
    <tr> 
      <td width="100" height="38" align="right">Custnumber</td>
      <td> 
        <input type="text" name="Custnumber" size="8">
      </td>
      <td width="130" height="38" align="right">Portfolio #<br>(eg: 1, 2, 3, etc.)</td>
      <td> 
        <input type="text" name="Title" size="2">
      </td>
    </tr>
  </table>
  
      <p>&nbsp;</p><table width="600" border="0" cellspacing="0" cellpadding="3">
    <tr> 
      <td width="100" height="38" align="right">First Name</td>
      <td> 
        <input type="text" name="FirstName" size="20">
      </td>
      <td width="100" height="38" align="right">Last Name</td>
      <td> 
        <input type="text" name="LastName" size="20">
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
  
   <p>&nbsp;</p><table width="600" border="0" cellspacing="0" cellpadding="3">
    <tr> 
	<td width="100" height="38" align="right">&nbsp;</td>
      <td width="100" height="38" align="right"> 
	Select a Gallery:<select name="Gallery">
          <OPTION SELECTED value="PhotoShowcase">Photo&nbsp;Showcase</option>
          <option value="RepresentedArtists">Represented&nbsp;Artists</option>
          <option value="MagnumArtists">Magnum&nbsp;Artists</option>
        </select>
      </td>
   
      <td width="100" height="38" align="right">Images Qty</td>
      <td> 
        <input type="text" name="ImageQty" size="2">
      </td>
      <td width="100" height="38" align="right"><!--- Background Color ---></td>
      <td> 
        <!--- <input type="text" name="BackgroundColor" size="6"> --->
      </td>
    </tr>
  </table>
  

  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  

   <INPUT TYPE="SUBMIT" VALUE="Insert Customer"></form>
   

</body>
</html>
