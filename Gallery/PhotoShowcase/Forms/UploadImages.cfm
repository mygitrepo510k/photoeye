<CFQUERY NAME="qGetShowcaseSetup"
         DATASOURCE="photoeyecom">

	SELECT *
	FROM GallerySetup WHERE Custnumber = #URL.Custnumber#
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
  FROM GalleryDefaultPhotos where custnumber = '#url.Custnumber#' 
</CFQUERY>

<CFQUERY NAME="qGetDetails" DATASOURCE="photoeyecom">
SELECT *
FROM Inventory
WHERE CATALOG = '#qShowcaseGalleryIndividualPhotos.catalog#'
</CFQUERY>



<HTML><HEAD>


<TITLE>photo-eye Photographer's Showcase | Upload Your Images</TITLE>






</HEAD>
<body bgcolor="gray" link="#000080" vlink="#000080">

<!---  <form action="UploadImagesAction.cfm?Custnumber=<cfoutput>#url.custnumber#</cfoutput>&RequestTimeOut=10000" method="post" enctype="multipart/form-data"> --->


<cfoutput>
<cfset portfolio='Portfolio1'>
<FORM ACTION="UploadImagesAction.cfm?Custnumber=#url.custnumber#&Portfolio=#portfolio#&RequestTimeOut=10000" METHOD="POST" ENCTYPE="multipart/form-data">


 <br>

<table width="85%" bgcolor="##FFFFFF" background="Images/WhiteBackground.gif" align="center">
      <tr><td align="center">
  
	          
          
        <table width="95%" border="0" cellpadding="5" bgcolor="##FFFFFF" background="../forms/Images/WhiteBackground.gif" cellspacing="0" valign="top" align="center">
          <tr valign="top"> 
            <td colspan="3" align="left"><br>
              <img src="../SharedImages/photo-eye%20Explore%20NewLogo_photoShowcaseVersionWhiteBackground.jpg" width="151" height="94"></td>
          </tr>
          <tr valign="top"> 
            <td colspan="3" align="LEFT"> <font face="Verdana,Arial,Helvetica,sans-serif" size="4">Step 
              4 - Upload Images</font><font face="Verdana,Arial,Helvetica,sans-serif" size="5"><br>
              <font size="2">This is how you upload images to your showcase at 
              photoeye.com <br>
              <br>
              <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"></font></font><br></td>
          </tr>
          <tr> 
            <td> 
              <table width="100%" border="0" cellspacing="0">
                <tr> 
                  <td> 
                    <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>1 - Prepare your Images</b></font> 
                      <hr width="70%" size="1" noshade>
                    </div>
                  </td>
                </tr>
              </table>
             	<font face="Verdana,Arial,Helvetica,sans-serif" size="2">
                Color correct and spot all images
                before uploading them to the photo-eye server. They should be ready to display. After uploading, your images will be resized based on Showcase requirements. There may be additional charges if your uploaded images need work. 
               	<br>
                <br>
                Save images as a .jpg at a high compression ratio, 
                around 75%, and with the width and/or height to be at least 1,000 
                pixels (~ 14 inches) at 72 dpi (dots per inch). Each file size should be less than 200k, preferably around 100k. 
                <br>
				<br>Use the naming convention shown in the example below. Name the images in the order in which you would like to see them online (though you may change this sequence later), with Image1.jpg being the signature piece photo-eye has chosen:<br><br>
               
            	</font>
              <table width="100%" border="0" cellspacing="0">
                <tr>
                  <td>
                    <div align="left"> 
                      
                   	<font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Example:<br>
                      </b></font>
                      <hr width="70%" noshade size="1">
                      <font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>
					  Image1.jpg (Signature Image, First Image in your Showcase)
                      <br>
                      <br>
                      Image2.jpg (Second Image in your Showcase)
					  <br>
                      <br>
                      Image3.jpg (Third Image)
					  <br>
                  	  <br>
					  And so on ...
					  <br><br>
                      
					<font size="2" color="red">


(Maximum of 


<cfif #qShowcaseArtist.imageqty# is 1>
			1
</cfif>
<cfif #qShowcaseArtist.imageqty# is 2>
			2
</cfif>
<cfif #qShowcaseArtist.imageqty# is 3>
			3
</cfif>
<cfif #qShowcaseArtist.imageqty# is 4>
			4
</cfif>
<cfif #qShowcaseArtist.imageqty# is 5>
			5
</cfif>
<cfif #qShowcaseArtist.imageqty# is 6>
			6
</cfif>
<cfif #qShowcaseArtist.imageqty# is 7>
			7
</cfif>
<cfif #qShowcaseArtist.imageqty# is 8>
			8
</cfif>
<cfif #qShowcaseArtist.imageqty# is 9>
			9
</cfif>
<cfif #qShowcaseArtist.imageqty# is 10>
			10
</cfif>
<cfif #qShowcaseArtist.imageqty# is 11>
			11
</cfif>
<cfif #qShowcaseArtist.imageqty# is 12>
			12
</cfif>
<cfif #qShowcaseArtist.imageqty# is 13>
			13
</cfif>
<cfif #qShowcaseArtist.imageqty# is 14>
			14
</cfif>
<cfif #qShowcaseArtist.imageqty# is 15>
			15
</cfif>
<cfif #qShowcaseArtist.imageqty# is 16>
			16
</cfif>
<cfif #qShowcaseArtist.imageqty# is 17>
			17
</cfif>
<cfif #qShowcaseArtist.imageqty# is 18>
			18
</cfif>
<cfif #qShowcaseArtist.imageqty# is 19>
			19
</cfif>
<cfif #qShowcaseArtist.imageqty# is 20>
			20 
</cfif>



images)
</font></b> </font></div>
                  </td>
                </tr>
              </table>
              <table width="100%" border="0" cellspacing="0">
                <tr> 
                  <td> 
				  
                    <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b><br>
                      2 - Upload your Images</b></font> 
                      <hr width="70%" size="1" noshade>
                    </div>
                  </td>
                </tr>
              </table>
              <font face="Verdana,Arial,Helvetica,sans-serif" size="2">
                To upload images, simply click the &quot;Browse&quot; 
                button to the right of each text box below, and access the appropriate .jpg 			    file on your computer. Select 
                the particular file that you would like to upload by clicking on the appropriate filename. Next, press the &quot;Open&quot; button. The filename and location will appear in the Upload Image text box. Repeat these steps for all all images to be uploaded.
When finished press the &quot;Upload Images&quot; button at the bottom 
                of your screen.  In 2-4 business days, you will be contacted 
                by email directing you to the appropriate location 
                to continue working on your Showcase.<br>
              <br>
              If you have any questions reguarding your images or this procedure, 
              please call 1-800-227-6941 and ask for Photographer's Showcase 
              help. We will be happy to assist you.
			  <br><br></font> 
              <table width="100%" border="0" cellspacing="0" cellpadding="4">
                <tr> 
                  <td colspan="3" height="40" bgcolor="##000000"> 
                    <div align="center"><b><font face="Verdana,Arial,Helvetica,sans-serif" size="3" color="##FFFFFF">Upload 
                      Your Images Below</font></b> 
                      <hr width="70%" size="1">
                    </div>
                  </td>
                </tr>
                
				
			<!--- 	<cfif #qShowcaseArtist.imageqty# GT 0> --->
		
				<tr bgcolor="##CCCCCC" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='##CCCCCC';this.style.color='black'"> 
                  <td width="49%" height="40"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image1.jpg:</b></font></div>
                  </td>
                  <td width="2%" height="40">&nbsp;</td>
                  <td width="49%" height="40"> 
                    <div align="center"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName1" size="30" type="File">
					  
                      </b></font></div>
                  </td>
                </tr>
                
				<!--- </cfif>		 --->		
				
				<cfif #qShowcaseArtist.imageqty# GT 1>				
				<tr bgcolor="##999999" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='##999999';this.style.color='black'"> 
                  <td width="49%" height="40"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image2.jpg:</b></font></div>
                  </td>
                  <td width="2%" height="40">&nbsp;</td>
                  <td width="49%" height="40"> 
                    <div align="center"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName2" size="30" type="File">
                      </b></font></div>
                  </td>
                </tr>
               
	</cfif>			
				
				
				
				<cfif #qShowcaseArtist.imageqty# GT 2>
				<tr bgcolor="##CCCCCC" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='##CCCCCC';this.style.color='black'"> 
                  <td width="49%" height="40"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image3.jpg:</b></font></div>
                  </td>
                  <td width="2%" height="40">&nbsp;</td>
                  <td width="49%" height="40"> 
                    <div align="center"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName3" size="30" type="FILE">
                      </b></font></div>
                  </td>
                </tr>
                
	</cfif>			
				
				
				
			<cfif #qShowcaseArtist.imageqty# GT 3>	
				
				<tr bgcolor="##999999" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='##999999';this.style.color='black'"> 
                  <td width="49%" height="40"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image4.jpg:</b></font></div>
                  </td>
                  <td width="2%" height="40">&nbsp;</td>
                  <td width="49%" height="40"> 
                    <div align="center"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName4" size="30" type="FILE">
                      </b></font></div>
                  </td>
                </tr>
 </cfif>               
				
				
				
				
				<cfif #qShowcaseArtist.imageqty# GT 4>
				<tr bgcolor="##CCCCCC" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='##CCCCCC';this.style.color='black'"> 
                  <td width="49%"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image5.jpg:</b></font></div>
                  </td>
                  <td width="2%" height="40">&nbsp;</td>
                  <td width="49%" height="40"> 
                    <div align="center"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName5" size="30" type="FILE">
                      </b></font></div>
                  </td>
                </tr>
   </cfif>             
				
				
				
				<cfif #qShowcaseArtist.imageqty# GT 5>
				<tr bgcolor="##999999" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='##999999';this.style.color='black'"> 
                  <td width="49%" height="40"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image6.jpg:</b></font></div>
                  </td>
                  <td width="2%" height="40">&nbsp;</td>
                  <td width="49%" height="40"> 
                    <div align="center"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName6" size="30" type="FILE">
                      </b></font></div>
                  </td>
                </tr>
    </cfif>            
				
				
				
				<cfif #qShowcaseArtist.imageqty# GT 6>
				<tr bgcolor="##CCCCCC" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='##CCCCCC';this.style.color='black'"> 
                  <td width="49%" height="40"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image7.jpg:</b></font></div>
                  </td>
                  <td width="2%" height="40">&nbsp;</td>
                  <td width="49%" height="40"> 
                    <div align="center"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName7" size="30" type="FILE">
                      </b></font></div>
                  </td>
                </tr>
      </cfif>          
				
				
				
				<cfif #qShowcaseArtist.imageqty# GT 7>
				<tr bgcolor="##999999" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='##999999';this.style.color='black'"> 
                  <td width="49%" height="40"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image8.jpg:</b></font></div>
                  </td>
                  <td width="2%" height="40">&nbsp;</td>
                  <td width="49%" height="40"> 
                    <div align="center"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName8" size="30" type="FILE">
                      </b></font></div>
                  </td>
                </tr>
   </cfif>            
			   
			   
			   
			   <cfif #qShowcaseArtist.imageqty# GT 8>
			   
			    <tr bgcolor="##CCCCCC" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='##CCCCCC';this.style.color='black'"> 
                  <td width="49%" height="40"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image9.jpg:</b></font></div>
                  </td>
                  <td width="2%" height="40">&nbsp;</td>
                  <td width="49%" height="40"> 
                    <div align="center"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName9" size="30" type="FILE">
                      </b></font></div>
                  </td>
                </tr>
     </cfif>           
				
				
				
				<cfif #qShowcaseArtist.imageqty# GT 9>
				<tr bgcolor="##999999" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='##999999';this.style.color='black'"> 
                  <td width="49%" height="40"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image10.jpg:</b></font></div>
                  </td>
                  <td width="2%" height="40">&nbsp;</td>
                  <td width="49%" height="40"> 
                    <div align="center"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName10" size="30" type="FILE">
                      </b></font></div>
                  </td>
                </tr>
                
</cfif>				
				
				
				<cfif #qShowcaseArtist.imageqty# GT 10>
				<tr bgcolor="##CCCCCC" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='##CCCCCC';this.style.color='black'"> 
                  <td width="49%" height="40"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image11.jpg:</b></font></div>
                  </td>
                  <td width="2%" height="40">&nbsp;</td>
                  <td width="49%" height="40"> 
                    <div align="center"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName11" size="30" type="FILE">
                      </b></font></div>
                  </td>
                </tr>
                
		</cfif>		
				
				
				
				<cfif #qShowcaseArtist.imageqty# GT 11>
				<tr bgcolor="##999999" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='##999999';this.style.color='black'"> 
                  <td width="49%" height="40"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image12.jpg:</b></font></div>
                  </td>
                  <td width="2%" height="40">&nbsp;</td>
                  <td width="49%" height="40"> 
                    <div align="center"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName12" size="30" type="FILE">
                      </b></font></div>
                  </td>
                </tr>
                
	</cfif>			
				
				
				<cfif #qShowcaseArtist.imageqty# GT 12>
				<tr bgcolor="##CCCCCC" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='##CCCCCC';this.style.color='black'"> 
                  <td width="49%"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image13.jpg:</b></font></div>
                  </td>
                  <td width="2%" height="40">&nbsp;</td>
                  <td width="49%" height="40"> 
                    <div align="center"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName13" size="30" type="FILE">
                      </b></font></div>
                  </td>
                </tr>
</cfif>
			
			
			<cfif #qShowcaseArtist.imageqty# GT 13>
			
			<tr bgcolor="##999999" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='##999999';this.style.color='black'"> 
                  <td width="49%" height="40"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image14.jpg:</b></font></div>
                  </td>
                  <td width="2%" height="40">&nbsp;</td>
                  <td width="49%" height="40"> 
                    <div align="center"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName14" size="30" type="FILE">
                      </b></font></div>
                  </td>
                </tr>
</cfif>                
				
				
				
				<cfif #qShowcaseArtist.imageqty# GT 14>
				<tr bgcolor="##CCCCCC" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='##CCCCCC';this.style.color='black'"> 
                  <td width="49%" height="40"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image15.jpg:</b></font></div>
                  </td>
                  <td width="2%" height="40">&nbsp;</td>
                  <td width="49%" height="40"> 
                    <div align="center"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName15" size="30" type="FILE">
                      </b></font></div>
                  </td>
                </tr>
 </cfif>               
				
				
				
				
				<cfif #qShowcaseArtist.imageqty# GT 15>
				<tr bgcolor="##999999" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='##999999';this.style.color='black'"> 
                  <td width="49%" height="40"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image16.jpg:</b></font></div>
                  </td>
                  <td width="2%" height="40">&nbsp;</td>
                  <td width="49%" height="40"> 
                    <div align="center"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName16" size="30" type="FILE">
                      </b></font></div>
                  </td>
                </tr>
               
</cfif>			   
			   
			   
			   <cfif #qShowcaseArtist.imageqty# GT 16>
			    <tr bgcolor="##CCCCCC" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='##CCCCCC';this.style.color='black'"> 
                  <td width="49%" height="40"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image17.jpg:</b></font></div>
                  </td>
                  <td width="2%" height="40">&nbsp;</td>
                  <td width="49%" height="40"> 
                    <div align="center"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName17" size="30" type="FILE">
                      </b></font></div>
                  </td>
                </tr>
               
</cfif>
				
				
				
				<cfif #qShowcaseArtist.imageqty# GT 17>
				
				<tr bgcolor="##999999" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='##999999';this.style.color='black'"> 
                  <td width="49%" height="40"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image18.jpg:</b></font></div>
                  </td>
                  <td width="2%" height="40">&nbsp;</td>
                  <td width="49%" height="40"> 
                    <div align="center"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName18" size="30" type="FILE">
                      </b></font></div>
                  </td>
                </tr>
</cfif>              
				
				
				<cfif #qShowcaseArtist.imageqty# GT 18>
				
				<tr bgcolor="##CCCCCC" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='##CCCCCC';this.style.color='black'"> 
                  <td width="49%"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image19.jpg:</b></font></div>
                  </td>
                  <td width="2%" height="40">&nbsp;</td>
                  <td width="49%" height="40"> 
                    <div align="center"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName19" size="30" type="FILE">
                      </b></font></div>
                  </td>
                </tr>
</cfif>
		   
		   
		   <cfif #qShowcaseArtist.imageqty# GT 19>
		   
		   <tr bgcolor="##999999" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='##999999';this.style.color='black'"> 
                  <td width="49%" height="40"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image20.jpg:</b></font></div>
                  </td>
                  <td width="2%" height="40">&nbsp;</td>
                  <td width="49%" height="40"> 
                    <div align="center"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName20" size="30" type="File">
                      </b></font></div>
                  </td>
                </tr>
</cfif>
             
			 
			 
			  </table>
                <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0">
              <table width="100%" border="0" cellspacing="0">
                <tr>
                  <td>
                    <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b><font color="##FF0000">Please make sure you are uploading the correct images 
                      before clicking the button below. They should be named Image1.jpg, Image2.jpg, etc.<br><br><font color="Black">
When you press the button, the images are being uploaded, even though the screen does not change. There may be a bar at the bottom of your screen indicating the progress of the upload.
<br><br>
					  Depending upon your modem speed, each image may take 2-10 minutes to upload to our server. There will be a <i>Finished Uploading</i> screen when the file transfers are complete.</font></b></font></font></div>
                  </td>
                </tr>
              </table>
                <p align="center">
<!---                 <INPUT TYPE="SUBMIT" VALUE="Upload Images" onClick="newWindow = window.open('statusBar.html','newWin','width=400','height=250','resizable=no');"> --->
                <INPUT TYPE="SUBMIT" VALUE="Upload Images"> </p> 
				</td>
          </tr>
          <tr> 
            <td align="center" colspan="3"> <img src="../forms/Images/BlackRule.gif" width=100% height=1 alt="" border="0"><br>
              <br>
              <BR>
              <FONT FACE="Arial, Helvetica, Sans-Serif" size="2"><IMG SRC="../forms/images/photoeyebooks&prints.gif" WIDTH=308 HEIGHT=28 BORDER=0><br>
              376 Garcia Street, Santa Fe, NM 87501<br>
              Orders Only: 800-227-6941 Info: 505-988-5152 Fax: 505-988-4487<br>
              E-Mail: <a href="mailto:webmaster@photoeye.com">webmaster@photoeye.com</a><br>
              © photo-eye books &amp; prints, 2001. All Rights Reserved.</font> 
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
                    

 </FORM>
  </cfoutput>  

</BODY>
</HTML>
