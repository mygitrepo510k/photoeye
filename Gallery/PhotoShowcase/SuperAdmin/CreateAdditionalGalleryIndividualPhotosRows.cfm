<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase</title>
</head>


<body bgcolor="#cccc99" link="BLUE" vlink="#000080">
<p align="center">There are more images in this artist's Images_Thumbs directory than rows in the GalleryIndividualPhotos.<br>
Insert New GalleryIndividualPhotos Row(s) to correct this problem.<br><br>
These will automatically be set to Do Not Display on Site.</p><br>
<form method="post" action="InsertAdditionalGalleryIndividualPhotosRows.cfm">
       <p>&nbsp;</p><table width="600" border="0" cellspacing="0" cellpadding="3">
    <tr> 
      <td width="100" height="38" align="right">Custnumber</td>
      <td> 
        <input type="text" name="Custnumber" size="8">
      </td>
      <td width="100" height="38" align="right">Portfolio (eg. Portfolio1, Portfolio2, Portfolio3)</td>
      <td> 
        <input type="text" name="Title" size="50">
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
      <td width="100" height="38" align="right">Rows to Add</td>
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
