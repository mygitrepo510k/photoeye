<!---  
<cfset RecordIDReg = 10792>
<cfset BindingReg = "Softbound">
<cfset NumCopiesReg = 1>
<cfset Listprice = 45.00>

<CFIF #Form.UserID# is "-1">

   <CFINCLUDE template="UserIdentification.cfm">

</CFIF>

<CFTRANSACTION>
   <CFQUERY NAME="qAddOrder" DATASOURCE="photoeyecom">
      INSERT INTO OrderInfo
                  (RecordID, UserID, Binding, NumCopies, ListPrice)
           VALUES (#RecordIDReg#, #Cookie.UserIDNumber#, '#BindingReg#', #NumCopiesReg#, #ListPrice#)
   </CFQUERY>
</CFTRANSACTION>
--->


<!--- 
<CFQUERY NAME="qGetShowcaseSetup"
         DATASOURCE="photoeyecom">

SELECT *
FROM GallerySetup
WHERE Custnumber = #URL.Custnumber#
</cfquery>

<CFQUERY NAME="qShowcaseArtist"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup where Custnumber=#url.Custnumber#
</CFQUERY>

<CFQUERY NAME="qShowcaseGalleryIndividualPhotos"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryIndividualPhotos where custnumber='#url.Custnumber#' 
</CFQUERY>

<CFQUERY NAME="qShowcaseGalleryDefaultPhotos"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryDefaultPhotos where custnumber='#url.Custnumber#' 
</CFQUERY>

<CFQUERY NAME="qGetDetails"
         DATASOURCE="photoeyecom">
SELECT *
FROM Inventory
WHERE CATALOG = '#qShowcaseGalleryIndividualPhotos.catalog#'
</CFQUERY>
------------>



<HTML>
<HEAD>

  <TITLE>photo-eye Photographer's Showcase | Upload Your Images</TITLE>

</HEAD>
<body bgcolor="gray" link="#000080" vlink="#000080">



<FORM ACTION="../../gallery/photoshowcase/forms/Step10ChangeImageOrderURL.cfm?RequestTimeOut=10000" METHOD="POST" ENCTYPE="multipart/form-data">
<br>
<table width="85%" bgcolor="#FFFFFF" align="center">
      <tr><td align="center">
  
	          
          
        <table width="95%" border="0" cellpadding="5" bgcolor="#FFFFFF" cellspacing="0" valign="top" align="center">
          <tr valign="top"> 
            <td colspan="3" align="left"><br>
              <img src="../../gallery/photoshowcase/sharedImages/photo-eye%20Explore%20NewLogo_photoShowcaseVersionWhiteBackground.jpg" width="151" height="94"></td>
          </tr>
          <tr valign="top"> 
            <td colspan="3" align="LEFT"> <font face="Verdana,Arial,Helvetica,sans-serif" size="4">Step 
              10 - Upload Images Compleated</font><font face="Verdana,Arial,Helvetica,sans-serif" size="5"><br>
              <font size="2">You have hit the Finished button, meaning all images have been uploaded.<br>
              <br>
              <img src="../../gallery/photoshowcase/forms/Images/BlackRule.gif" width=100% height=1 alt="" border="0"></font></font></td>
          </tr>
          <tr> 
            <td> 
              <div align="center">
              <input type="Submit" value="Sequence Your Images">
			  </div>
<!--- 			  
		 	  <input type="hidden" name="UserID" value="<CFOUTPUT>#Cookie.UserIdNumber#</CFOUTPUT>">
<input type="hidden" name="NumCopies" value="1">
<input type="hidden" name="Binding" value="Photograph">
<input type="hidden" name="ListPrice" value="<CFOUTPUT>#qGetDetails.Soft_price#</CFOUTPUT>">
<input type="hidden" name="SalePrice" value="0">
<input type="hidden" name="RecordID" value="<CFOUTPUT>#qGetDetails.recordID#</CFOUTPUT>">
<input type="hidden" name="Catnum" value="<CFOUTPUT>#qGetDetails.Catalog#</CFOUTPUT>">
<input type="hidden" name="Title" value="<CFOUTPUT>#qGetDetails.Title2x#</CFOUTPUT>">  --->
			  
			  
			  </td>
          </tr>
		  
		  
		
		  
		  
          <tr> 
            <td align="center" colspan="3"> <img src="../../gallery/photoshowcase/forms/Images/BlackRule.gif" width=100% height=1 alt="" border="0"><br>
              <br>
              <BR>
              <FONT FACE="Arial, Helvetica, Sans-Serif" size="2"><IMG SRC="../../img/photoeyebooks&prints.gif" WIDTH=308 HEIGHT=28 BORDER=0><br>
              376 Garcia Street, Santa Fe, NM 87501<br>
              Orders Only: 800-227-6941 Info: 505-988-5152 Fax: 505-988-4487<br>
              E-Mail: <a href="mailto:webmaster@photoeye.com">webmaster@photoeye.com</a><br>
              © photo-eye books &amp; prints, <cfoutput>#YEAR(Now())#</cfoutput>. All Rights Reserved.</font> 
              <FONT FACE="Arial, Helvetica, Sans-Serif" size="1">This entire web 
              site is the © copyrighted property of photo-eye books &amp; prints, 
              except where artists' and publishers' copyrights on the materials 
              described take precedence. No portion of the contents within may 
              be reproduced in any form, for any non-private use, without the 
              express written permission of photo-eye books &amp; prints.<br>
              <br>
              </font></td>
          </tr>
          <tr> 
            <td></td>
          </tr>
        </table>

    
</td></tr></table>

<br>
                       



</BODY>
</HTML>
