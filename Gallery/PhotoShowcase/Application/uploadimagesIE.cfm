<CFIF ISDEFINED("url.id") is false>
	<CFSET CurrentOrderId=0>
<CFELSE>
	<CFSET CurrentOrderId=#url.id#>
</CFIF>

<CFQUERY NAME="qSetApplyPortfolioQtyBeforeFileisUploaded" DATASOURCE="photoeyecom">
	select ApplyPortfolioQty from UserInfoNew where OrderID = #CurrentOrderId#
</cfquery>	

<CFQUERY NAME="qGetShowcaseSetup"
         DATASOURCE="photoeyecom">

	SELECT *
	FROM GallerySetup WHERE Custnumber = #URL.id#
</cfquery>

<CFQUERY NAME="qShowcaseArtist"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GallerySetup where Custnumber=#url.id#
</CFQUERY>

<CFQUERY NAME="qShowcaseGalleryIndividualPhotos"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryIndividualPhotos where custnumber='#url.id#' 
</CFQUERY>

<CFQUERY NAME="qShowcaseGalleryDefaultPhotos"  DATASOURCE="photoeyecom">
  SELECT *
  FROM GalleryDefaultPhotos where custnumber = '#url.id#' 
</CFQUERY>

<CFQUERY NAME="qGetDetails" DATASOURCE="photoeyecom">
SELECT *
FROM Inventory
WHERE CATALOG = '#qShowcaseGalleryIndividualPhotos.catalog#'
</CFQUERY>



<HTML><HEAD>


<TITLE>photo-eye Photographer's Showcase | Upload Your Images</TITLE>


 <script language="JavaScript">

<!-- hide from JavaScript-challenged browsers

var popupWin = null;
function openWindow(myURL,myWindowName,w,h,scroll,menu){
var myLeft = ((screen.width-w)/2)-5; 
var myTop = ((screen.height-h)/2)-10;   
var settings='height='+h+',width='+w+',top='+myTop+',left='+myLeft+', scrollbars=yes,resizable=yes,menu='+menu
popupWin=window.open(myURL,myWindowName,settings);   
if(parseInt(navigator.appVersion) >= 4){popupWin.focus();}
}



	// End hiding script from old browsers -->
	</SCRIPT>	 

 <script language="JavaScript">

<!-- hide from JavaScript-challenged browsers
var popupWin = null;
function openWindowie() {
		newWindow = window.open('macie5.html', 'popupWin', 'toolbar=no,scrollbars=yes,width=550,height=400', 'top=((screen.width-w)/2)-5', 'left=((screen.height-h)/2)-10')

	}

// End hiding script from old browsers -->
	</SCRIPT> 

<!--- <script language="JavaScript">

<!-- hide from JavaScript-challenged browsers
var popupWin = null;
function openWindow() {
		newWindow = window.open('statusbar.html', 'popupWin', 'toolbar=no,scrollbars=no,width=400,height=300', 'top=((screen.width-w)/2)-5', 'left=((screen.height-h)/2)-10')

	}

// End hiding script from old browsers -->
	</SCRIPT> --->


</HEAD>
<body bgcolor="gray" link="#000080" vlink="#000080">

<img src="statusBar.gif" width="1" height="1">
<!---  <form action="test.cfm?Custnumber=<cfoutput>#url.custnumber#</cfoutput>&RequestTimeOut=10000" method="post"> --->

 <FORM ACTION="UploadImagesActionIE.cfm?id=<cfoutput>#url.id#</cfoutput>&RequestTimeOut=10000" METHOD="POST" ENCTYPE="multipart/form-data" TARGET="_top"> 


 <br>



<table width="85%" bgcolor="#FFFFFF" align="center">
      <tr><td align="center">
  
	          
          
        <table width="95%" border="0" cellpadding="5" bgcolor="#FFFFFF" cellspacing="0" valign="top" align="center">
          <tr valign="top"> 
            <td colspan="3" align="left"><br>
              <img src="../SharedImages/photo-eye%20Explore%20NewLogo_photoShowcaseVersionWhiteBackground.jpg" width="151" height="94"></td>
          </tr>
          <tr valign="top"> 
            <td colspan="3" align="LEFT"> <font face="Verdana,Arial,Helvetica,sans-serif" size="4">Step 
              6 - Upload Images for this Portfolio</font><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><br>(<font color="red">Internet Explorer 5 for the Mac ONLY</font>)<br>
              <font size="2">This is how you upload images to your <strong>showcase</strong> at 
              photoeye.com <br>
              <br>
              <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"></font></font><br></td>
          </tr>
          <tr> 
            <td> 
			
				<table width="100%" border="0" cellspacing="0">
                <tr> 
                  <td> 
                    <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>1 - Determine if you are an Internet Explorer for Macintosh User</b></font> <br>
                      <hr align="left" width="100%" size="1" noshade>
                    </div>
                  </td>
                </tr>
              </table>
             	<font face="Verdana,Arial,Helvetica,sans-serif" size="2">
                If you are <font color="red">NOT</font> using Internet Explorer 5 for the Macintosh, <a href="uploadimages.cfm?id=<cfoutput>#url.id#</cfoutput>">click here</a>. Otherwise, continue with Step 2 below. If you are not sure which version of Internet Explorer  you have for your Macintosh, please <a href="javascript:openWindowie();">click here</a> for information.
               	
            	</font>
			<br><br>
			
			
              <table width="100%" border="0" cellspacing="0">
                <tr> 
                  <td> 
                    <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>2 - Prepare your Images</b></font> 
                     <hr align="left" width="100%" size="1" noshade>
                    </div>
                  </td>
                </tr>
              </table>
             	<font face="Verdana,Arial,Helvetica,sans-serif" size="2">
                	
			Crop, color correct and spot all images
                before uploading them to the <b>photo-eye</b> server.  They should be ready to display. (<strong>Note</strong>: The background color for your showcase will be either black or dark gray. Please be sure to crop your images completely so that no white border outside the images is visible unless it is intentional.) After uploading, your images will be resized based on Showcase requirements. There may be additional charges if your uploaded images need work. 
               	<br>
                <br>
                Save images as a .jpg at a high compression ratio, 
                around 75%, and with the width and/or height to be at least 1,000 
                pixels (~ 14 inches) at 72 dpi (dots per inch). Each file size should be less than 200k, preferably around 100k. 
                <br>
				<br><strong>Very Important!</strong> Use the naming convention shown in the example below. Name the image files in the order in which you would like the jurors to view your work. This is extremely important if your work is a visual narrative. The filenames of the images must be EXACTLY as follows:  <font color="red">Image1.jpg, Image2.jpg, etc. (NOT Image_1.jpg).</font> There can be <strong>NO OTHER INFORMATION</strong> as part of the filename. In other words, <strong>DO NOT</strong> add to the filename, <font color="red">Image1.jpg</font> and make it Image1_thetitle.jpg. Make sure you use .jpg and NOT .jpeg when naming files. These filenames are for the jurying process only. If the work is accepted, you will be able to title your work within your Showcase account online. Call 1-800-227-6941 if you are still not clear.
<br><br>
               
            	</font>
              <table width="100%" border="0" cellspacing="0">
                <tr>
                  <td>
                    <div align="left"> 
                      
                   	<font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Example:<br>
                      </b></font>
                    <hr align="left" width="100%" size="1" noshade>
                      <font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>
					  Image1.jpg (First image to be juried)
                      <br>
                      <br>
                      Image2.jpg (Second Image to be juried)
					  <br>
                      <br>
                      Image3.jpg (Third Image to be juried)
					  <br>
                  	  <br>
					  And so on ...
					  <br><br>
                      
					<font size="2" color="red">


(Maximum of 

20

images)
</font></b> </font></div>
                  </td>
                </tr>
              </table>
              <table width="100%" border="0" cellspacing="0">
                <tr> 
                  <td> 
				  
                    <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b><br>
                      3 - Upload your Images</b></font> 
                     <hr align="left" width="100%" size="1" noshade>
                    </div>
                  </td>
                </tr>
              </table>
              <font face="Verdana,Arial,Helvetica,sans-serif" size="2">
                To upload images, simply click the &quot;Browse&quot; 
                button to the right of each text box below, and access the appropriate .jpg 			    file on your computer. Select 
                the particular file that you would like to upload by clicking on the appropriate filename. Next, press the &quot;Open&quot; button. The filename and location will appear in the Upload Image text box. Repeat these steps for all all images to be uploaded.
When finished press the &quot;Upload Images&quot; button at the bottom 
                of your screen.  Within 7 business days, you will be contacted 
                by email with the jurors' decision. If accepted, you will be given instructions on how to proceed.<br>
<!--- 				In 2-4 business days, you will be contacted 
                by email directing you to the appropriate location 
                to continue working on your Showcase --->
              <br>
              If you have any questions regarding your images or this procedure, 
              please call 1-800-227-6941 and ask for Photographer's Showcase 
              help. We will be happy to assist you.
			  <br><br></font> 
              <table width="100%" border="0" cellspacing="0" cellpadding="4">
                <tr> 
                  <td colspan="3" bgcolor="#000000"> 
                    <div align="center"><b><font face="Verdana,Arial,Helvetica,sans-serif" size="3" color="#FFFFFF">Upload 
                      Your Images Below</font></b> 
                      <hr align="left" width="100%" size="1" noshade>
                    </div>
                  </td>
                </tr>
                
				
			<!--- 	<cfif #qShowcaseArtist.imageqty# GT 0> --->
		
				<tr bgcolor="#CCCCCC" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='#CCCCCC';this.style.color='black'"> 
                  <td width="49%"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image1.jpg:</b></font></div>
                  </td>
                  <td width="2%">&nbsp;</td>
                  <td width="49%"> 
                    <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName1" size="30" type="File" style="font-size:10px;" onChange="this.form.FileNameOne.value=1"><input type="hidden" name="FileNameOne" value=""><br><font color="red" size="1" face="Verdana,Arial,Helvetica,sans-serif"><strong>File must be named Image1.jpg</strong></font>

                      </b></font></div>
                  </td>
                </tr>
                
				<!--- </cfif>		 --->		
				
							
				<tr bgcolor="#999999" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='#999999';this.style.color='black'"> 
                  <td width="49%"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image2.jpg:</b></font></div>
                  </td>
                  <td width="2%">&nbsp;</td>
                  <td width="49%"> 
                    <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName2" size="30" type="File"  style="font-size:10px;" onChange="this.form.FileNameTwo.value=1"><input type="hidden" name="FileNameTwo" value="">
<br><font size="1" face="Verdana,Arial,Helvetica,sans-serif"><strong>File must be named Image2.jpg</strong></font>


                      </b></font></div>
                  </td>
                </tr>
               
		
				
				
				
				
				<tr bgcolor="#CCCCCC" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='#CCCCCC';this.style.color='black'"> 
                  <td width="49%"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image3.jpg:</b></font></div>
                  </td>
                  <td width="2%">&nbsp;</td>
                  <td width="49%"> 
                    <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName3" size="30" type="File"  style="font-size:10px;" onChange="this.form.FileNameThree.value=1"><input type="hidden" name="FileNameThree" value=""><br><font color="red" size="1" face="Verdana,Arial,Helvetica,sans-serif"><strong>File must be named Image3.jpg</strong></font>
                      </b></font></div>
                  </td>
                </tr>
                
			
				
				
				
	
				
				<tr bgcolor="#999999" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='#999999';this.style.color='black'"> 
                  <td width="49%"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image4.jpg:</b></font></div>
                  </td>
                  <td width="2%">&nbsp;</td>
                  <td width="49%"> 
                    <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName4" size="30" type="File"  style="font-size:10px;" onChange="this.form.FileNameFour.value=1"><input type="hidden" name="FileNameFour" value=""><br><font size="1" face="Verdana,Arial,Helvetica,sans-serif"><strong>File must be named Image4.jpg</strong></font>
                      </b></font></div>
                  </td>
                </tr>
               
				
				
				
				
		
				<tr bgcolor="#CCCCCC" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='#CCCCCC';this.style.color='black'"> 
                  <td width="49%"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image5.jpg:</b></font></div>
                  </td>
                  <td width="2%">&nbsp;</td>
                  <td width="49%"> 
                    <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName5" size="30" type="File"  style="font-size:10px;" onChange="this.form.FileNameFive.value=1"><input type="hidden" name="FileNameFive" value=""><br><font color="red" size="1" face="Verdana,Arial,Helvetica,sans-serif"><strong>File must be named Image5.jpg</strong></font>
                      </b></font></div>
                  </td>
                </tr>
              
				
				
				
				
				<tr bgcolor="#999999" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='#999999';this.style.color='black'"> 
                  <td width="49%"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image6.jpg:</b></font></div>
                  </td>
                  <td width="2%">&nbsp;</td>
                  <td width="49%"> 
                    <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName6" size="30" type="File"  style="font-size:10px;" onChange="this.form.FileNameSix.value=1"><input type="hidden" name="FileNameSix" value=""><br><font size="1" face="Verdana,Arial,Helvetica,sans-serif"><strong>File must be named Image6jpg</strong></font>
                      </b></font></div>
                  </td>
                </tr>
              
				
				
				
				
				<tr bgcolor="#CCCCCC" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='#CCCCCC';this.style.color='black'"> 
                  <td width="49%"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image7.jpg:</b></font></div>
                  </td>
                  <td width="2%">&nbsp;</td>
                  <td width="49%"> 
                    <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName7" size="30" type="File"  style="font-size:10px;" onChange="this.form.FileNameSeven.value=1"><input type="hidden" name="FileNameSeven" value=""><br><font color="red" size="1" face="Verdana,Arial,Helvetica,sans-serif"><strong>File must be named Image7.jpg</strong></font>
                      </b></font></div>
                  </td>
                </tr>
              
				
				
				
				
				<tr bgcolor="#999999" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='#999999';this.style.color='black'"> 
                  <td width="49%"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image8.jpg:</b></font></div>
                  </td>
                  <td width="2%">&nbsp;</td>
                  <td width="49%"> 
                    <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName8" size="30" type="File"  style="font-size:10px;" onChange="this.form.FileNameEight.value=1"><input type="hidden" name="FileNameEight" value=""><br><font size="1" face="Verdana,Arial,Helvetica,sans-serif"><strong>File must be named Image8.jpg</strong></font>
                      </b></font></div>
                  </td>
                </tr>
           
			   
			   
			   
		
			   
			    <tr bgcolor="#CCCCCC" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='#CCCCCC';this.style.color='black'"> 
                  <td width="49%"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image9.jpg:</b></font></div>
                  </td>
                  <td width="2%">&nbsp;</td>
                  <td width="49%"> 
                    <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName9" size="30" type="File"  style="font-size:10px;" onChange="this.form.FileNameNine.value=1"><input type="hidden" name="FileNameNine" value=""><br><font color="red" size="1" face="Verdana,Arial,Helvetica,sans-serif"><strong>File must be named Image9.jpg</strong></font>
                      </b></font></div>
                  </td>
                </tr>
           
				
				
				
				
				<tr bgcolor="#999999" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='#999999';this.style.color='black'"> 
                  <td width="49%"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image10.jpg:</b></font></div>
                  </td>
                  <td width="2%">&nbsp;</td>
                  <td width="49%"> 
                    <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName10" size="30" type="File"  style="font-size:10px;" onChange="this.form.FileNameTen.value=1"><input type="hidden" name="FileNameTen" value=""><br><font size="1" face="Verdana,Arial,Helvetica,sans-serif"><strong>File must be named Image10.jpg</strong></font>
                      </b></font></div>
                  </td>
                </tr>
			
				
				
				
				<tr bgcolor="#CCCCCC" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='#CCCCCC';this.style.color='black'"> 
                  <td width="49%"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image11.jpg:</b></font></div>
                  </td>
                  <td width="2%">&nbsp;</td>
                  <td width="49%"> 
                    <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName11" size="30" type="File"  style="font-size:10px;" onChange="this.form.FileNameEleven.value=1"><input type="hidden" name="FileNameEleven" value=""><br><font color="red" size="1" face="Verdana,Arial,Helvetica,sans-serif"><strong>File must be named Image11.jpg</strong></font>
                      </b></font></div>
                  </td>
                </tr>
                
	
				
				
				
				
				<tr bgcolor="#999999" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='#999999';this.style.color='black'"> 
                  <td width="49%"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image12.jpg:</b></font></div>
                  </td>
                  <td width="2%">&nbsp;</td>
                  <td width="49%"> 
                    <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName12" size="30" type="File"  style="font-size:10px;" onChange="this.form.FileNameTwelve.value=1"><input type="hidden" name="FileNameTwelve" value=""><br><font size="1" face="Verdana,Arial,Helvetica,sans-serif"><strong>File must be named Image12.jpg</strong></font>
                      </b></font></div>
                  </td>
                </tr>
	
				
				
				
				<tr bgcolor="#CCCCCC" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='#CCCCCC';this.style.color='black'"> 
                  <td width="49%"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image13.jpg:</b></font></div>
                  </td>
                  <td width="2%">&nbsp;</td>
                  <td width="49%"> 
                    <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName13" size="30" type="File"  style="font-size:10px;" onChange="this.form.FileNameThirteen.value=1"><input type="hidden" name="FileNameThirteen" value=""><br><font color="red" size="1" face="Verdana,Arial,Helvetica,sans-serif"><strong>File must be named Image13.jpg</strong></font>
                      </b></font></div>
                  </td>
                </tr>

			
			
			
			
			<tr bgcolor="#999999" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='#999999';this.style.color='black'"> 
                  <td width="49%"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image14.jpg:</b></font></div>
                  </td>
                  <td width="2%">&nbsp;</td>
                  <td width="49%"> 
                    <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName14" size="30" type="File"  style="font-size:10px;" onChange="this.form.FileNameFourteen.value=1"><input type="hidden" name="FileNameFourteen" value=""><br><font size="1" face="Verdana,Arial,Helvetica,sans-serif"><strong>File must be named Image14.jpg</strong></font>
                      </b></font></div>
                  </td>
                </tr>
               
				
				
				
				
				<tr bgcolor="#CCCCCC" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='#CCCCCC';this.style.color='black'"> 
                  <td width="49%"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image15.jpg:</b></font></div>
                  </td>
                  <td width="2%">&nbsp;</td>
                  <td width="49%"> 
                    <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName15" size="30" type="File"  style="font-size:10px;" onChange="this.form.FileNameFifteen.value=1"><input type="hidden" name="FileNameFifteen" value=""><br><font color="red" size="1" face="Verdana,Arial,Helvetica,sans-serif"><strong>File must be named Image15.jpg</strong></font>
                      </b></font></div>
                  </td>
                </tr>
             
				
				
				
				
				
				<tr bgcolor="#999999" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='#999999';this.style.color='black'"> 
                  <td width="49%"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image16.jpg:</b></font></div>
                  </td>
                  <td width="2%">&nbsp;</td>
                  <td width="49%"> 
                    <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName16" size="30" type="File"  style="font-size:10px;" onChange="this.form.FileNameSixteen.value=1"><input type="hidden" name="FileNameSixteen" value=""><br><font size="1" face="Verdana,Arial,Helvetica,sans-serif"><strong>File must be named Image16.jpg</strong></font>
                      </b></font></div>
                  </td>
                </tr>
		   
			   
			   
			 
			    <tr bgcolor="#CCCCCC" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='#CCCCCC';this.style.color='black'"> 
                  <td width="49%"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image17.jpg:</b></font></div>
                  </td>
                  <td width="2%">&nbsp;</td>
                  <td width="49%"> 
                    <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName17" size="30" type="File"  style="font-size:10px;" onChange="this.form.FileNameSeventeen.value=1"><input type="hidden" name="FileNameSeventeen" value=""><br><font color="red" size="1" face="Verdana,Arial,Helvetica,sans-serif"><strong>File must be named Image17.jpg</strong></font>
                      </b></font></div>
                  </td>
                </tr>
               

				
				
				
			
				
				<tr bgcolor="#999999" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='#999999';this.style.color='black'"> 
                  <td width="49%"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image18.jpg:</b></font></div>
                  </td>
                  <td width="2%">&nbsp;</td>
                  <td width="49%"> 
                    <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName18" size="30" type="File"  style="font-size:10px;" onChange="this.form.FileNameEighteen.value=1"><input type="hidden" name="FileNameEighteen" value=""><br><font size="1" face="Verdana,Arial,Helvetica,sans-serif"><strong>File must be named Imag18.jpg</strong></font>
                      </b></font></div>
                  </td>
                </tr>
             
				
				
				
				
				<tr bgcolor="#CCCCCC" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='#CCCCCC';this.style.color='black'"> 
                  <td width="49%"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image19.jpg:</b></font></div>
                  </td>
                  <td width="2%">&nbsp;</td>
                  <td width="49%"> 
                    <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName19" size="30" type="File"  style="font-size:10px;" onChange="this.form.FileNameNineteen.value=1"><input type="hidden" name="FileNameNineteen" value=""><br><font color="red" size="1" face="Verdana,Arial,Helvetica,sans-serif"><strong>File must be named Image19.jpg</strong></font>
                      </b></font></div>
                  </td>
                </tr>

		   
		   
		 
		   
		   <tr bgcolor="#999999" onmouseover="this.style.backgroundColor='black';this.style.color='white'" onmouseout="this.style.backgroundColor='#999999';this.style.color='black'"> 
                  <td width="49%"> 
                    <div align="right"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b>Upload 
                      Image20.jpg:</b></font></div>
                  </td>
                  <td width="2%">&nbsp;</td>
                  <td width="49%"> 
                    <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><b> 
                      <input name="FileName20" size="30" type="File"  style="font-size:10px;" onChange="this.form.FileNameTwenty.value=1"><input type="hidden" name="FileNameTwenty" value=""><br><font size="1" face="Verdana,Arial,Helvetica,sans-serif"><strong>File must be named Image20.jpg</strong></font>
                      </b></font></div>
                  </td>
                </tr>

             
			 
			 
			  </table>
                <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0">
              <table width="100%" border="0" cellspacing="0">
                <tr>
                  <td><br>
                    <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" size="2"><font color="black"><strong>Very Important!</strong> Use the naming convention shown in the example below. Name the image files in the order in which you would like the jurors to view your work. This is extremely important if your work is a visual narrative. The filenames of the images must be EXACTLY as follows:  <font color="red">Image1.jpg, Image2.jpg, etc.  (NOT Image_1.jpg).</font> There can be <strong>NO OTHER INFORMATION</strong> as part of the filename. In other words, <strong>DO NOT</strong> add to the filename, <font color="red">Image1.jpg</font> and make it Image1_thetitle.jpg. Make sure you use .jpg and NOT .jpeg when naming files. These filenames are for the jurying process only. If the work is accepted, you will be able to title your work within your Showcase account online. Call 1-800-227-6941 if you are still not clear.<br><br> The images begin uploading after you press the button below.<br><br><font color="Black">
					  Depending upon your modem speed, each image may take 2-10 minutes to upload to our server. There will be a <i>Finished Uploading</i> screen when the file transfers are complete.</font></font></font></div>
                  </td>
                </tr>
              </table>
                <p align="center"><div align="center">
<!---                 <INPUT TYPE="SUBMIT" VALUE="Upload Images" onClick="newWindow = window.open('statusBar.html','newWin','width=400','height=250','resizable=no');"> ---> 
                <INPUT TYPE="SUBMIT" VALUE="Upload Images for this Portfolio" onClick="javascript:openWindow('statusbar.html','popupWin','400','300','no')">		
				
				</div></p> 
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

</BODY>
</HTML>
