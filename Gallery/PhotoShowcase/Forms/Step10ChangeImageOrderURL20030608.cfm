<CFPARAM NAME="Clear" Default="0">

<CFQUERY NAME="qGetShowcaseSetup"
         DATASOURCE="photoeyecom">

SELECT *
FROM GallerySetup
WHERE Custnumber = #URL.Custnumber#
</cfquery>

<CFQUERY NAME="qGetShowcasePortfolio"
         DATASOURCE="photoeyecom">

SELECT *
FROM GalleryPortfolio
WHERE Custnumber = #URL.Custnumber# and SubDirectory='#URL.Portfolio#'
</cfquery>

<!--- Check to see if there is a nonstandard Signature Image --->
<!--- Meaning Image1.jpg is not the signature piece --->

<!--- <CFQUERY NAME="qNonStandardSignatureImage"  DATASOURCE="photoeyecom">
  	SELECT *
 	FROM GalleryIndividualPhotos where custnumber='#url.custnumber#' and PortfolioName='#URL.Portfolio#' and Imageposition=1 and ImageNumber<>1
</CFQUERY> --->

<!--- Now Check if image positions (except for nonstandard signature images) were cleared --->

<!--- <CFQUERY NAME="qImagesCleared"  DATASOURCE="photoeyecom">
  	SELECT *
 	FROM GalleryIndividualPhotos where custnumber='#url.custnumber#' and PortfolioName='#URL.Portfolio#' and Imageposition=0 
</CFQUERY>
 --->


	

<!--- <cfif qNonStandardSignatureImage.recordcount GT 0 and qImagesCleared.recordcount GT 0>
yES
	<!--- Images have NonStandardSignature Image --->
	<!--- Make the order descending as the positions are all 0 except for the nonstandard Image Position 1 --->
	<CFQUERY NAME="qShowcaseGalleryIndividualPhotos"  DATASOURCE="photoeyecom">
  		SELECT *
 		FROM GalleryIndividualPhotos where custnumber='#url.custnumber#' and PortfolioName='#URL.Portfolio#' 
	order by PortfolioName, imageposition DESC, Imagenumber ;
	</CFQUERY>	
	<cfset NonStandardSignature = 1>
<cfelse>
nO --->
	<!--- Images Were Cleared, Standard Signature Piece--->
		<CFQUERY NAME="qShowcaseGalleryIndividualPhotos"  DATASOURCE="photoeyecom">
  		SELECT *
 		FROM GalleryIndividualPhotos where custnumber='#url.custnumber#' and PortfolioName='#URL.Portfolio#' 
	order by PortfolioName, imageposition, Imagenumber;
	</CFQUERY>	
	<!--- <cfset NonStandardSignature = 0> --->
<!--- </cfif> --->




<!--- and imageposition>0 --->

<!---#URL.Custnumber#--->
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">

<html>

<head>
<title>photo-eye Photographer's Showcase | Sequence and Edit Individual Images</title>
</head>

<body bgcolor="Gray" link="#000080" vlink="#000080">


<form method="post" action="CheckDuplicatePositionsa.cfm?custnumber=<cfoutput>#url.custnumber#&Portfolio=#qGetShowcasePortfolio.SubDirectory#</cfoutput>">

    <table width="85%" bgcolor="#FFFFFF" align="center">
      <tr><td align="center">

       
          
      
    <table width="95%" border="0" cellpadding="5" bgcolor="#FFFFFF" cellspacing="0" valign="top" align="center">
      <tr valign="top"> 
        <td colspan="3" align="left"><br>
          <img src="../SharedImages/photo-eye%20Explore%20NewLogo_photoShowcaseVersionWhiteBackground.jpg" width="151" height="94"></td>
      </tr>
      <TR> 
        <TD COLSPAN="3" ALIGN="LEFT"> <font face="Verdana,Arial,Helvetica,sans-serif" size="4">Step 
          12 - Edit and Sequence your Individual Images</font><font face="Verdana,Arial,Helvetica,sans-serif" size="5"><br>
          <font size="2">Edit the text that is unique to each of your images. Change the order of your images.</font></font><hr size="1" noshade color="black">
          <font face="Verdana,Arial,Helvetica,sans-serif" color="BLACK" size="1">Click <i>Edit Text Info </i> (below each thumbnail) to edit the descriptive information for each of your images. This is where you will include additional information unique to each print or keep the defaults from Step 11 - Default Artwork Template.
		   <br><br>Change 
          the order of your images online by changing each image's numeric position. 
          Then click the <i>Make Changes</i> button to complete your new sequence. We suggest
		  that you use this form primarily for swapping a few images.
		  If you would like to reposition many pictures, click the <i>Clear Positions</i> button at the bottom of this page.
		  This will clear all positions, making it much easier to re-sequence all images. The sequence of your signature piece, image 1, is the juror's choice and may not be changed. <br>
<br>The sequence number will be skipped and the image won't appear in your portfolio if the image indicates Not Shown. This is a rarely chosen option in the Image Availability section of the Edit Artwork Description form.</font><hr size="1" noshade color="black">

        <form method="post" action="CheckDuplicatePositionsa.cfm?custnumber=<cfoutput>#url.custnumber#</cfoutput>">
     
			   <cfoutput>
			   
			   <!---Determine how many images there are---> 
			<cfset imagecount = 0>
			<cfloop index="fieldincrementer" from="1" to="#qShowcaseGalleryIndividualPhotos.recordcount#" step="1">
				<cfif fileexists(Expandpath("../../../../visualserver/Artists/#qGetShowcaseSetup.Subdirectory#/#qGetShowcasePortfolio.SubDirectory#/Images_Large/image#qShowcaseGalleryIndividualPhotos.imagenumber#.jpg"))>	
					<cfset imagecount = imagecount + 1>
				</cfif>
			</cfloop>

          <table width="100%" border="0" cellspacing="0" cellpadding="3">
            <tr> <!---Increment 1st Field ---> 
  			
		<cfloop QUERY=qShowcaseGalleryIndividualPhotos startrow="1" endrow="5">
			<td align="center" width="10%">
<!--- 			imageposition #qShowcaseGalleryIndividualPhotos.imagenumber#<br>
			imagenumber #qShowcaseGalleryIndividualPhotos.imagenumber#<br> --->
<!--- 			<cfif fileexists(Expandpath("../../#qGetShowcaseSetup.Gallery#/Artists/#qGetShowcaseSetup.Subdirectory#/#qGetShowcasePortfolio.SubDirectory#/Images_Thumbs/image#qShowcaseGalleryIndividualPhotos.imagenumber#.jpg"))>		
 --->
<!---  #Expandpath("http://www.visualserver.com/Artists/#qGetShowcaseSetup.Subdirectory#/#qGetShowcasePortfolio.SubDirectory#/Images_Large/image#qShowcaseGalleryIndividualPhotos.imagenumber#.jpg")# --->
			<cfif fileexists(Expandpath("../../../../visualserver/Artists/#qGetShowcaseSetup.Subdirectory#/#qGetShowcasePortfolio.SubDirectory#/Images_Large/image#qShowcaseGalleryIndividualPhotos.imagenumber#.jpg"))>	

				<cfset imageno=#qShowcaseGalleryIndividualPhotos.imagenumber#><a href="step12artworkdescriptionformSequence.cfm?custnumber=#qShowcaseGalleryIndividualPhotos.custnumber#&imagenumber=#imageno#&imagenumbercounter=#imageno#&Portfolio=#qGetShowcasePortfolio.SubDirectory#">

<!--- ImageSizer --->									
<cfset xheight=64>
<cfset xwidth=75>
<cfset xPath= "http://www.visualserver.com/artists/#qGetShowcaseSetup.Subdirectory#/#qGetShowcasePortfolio.SubDirectory#/Images_Large/">
<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image#qShowcaseGalleryIndividualPhotos.imagenumber#.jpg">

<cfinclude template="../../../templates/imagesizer.cfm">

<img src="../../../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a>
<!--- End ImageSizer --->

            	
			    <br><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>Edit Text Info</a></b></font><br><cfif qShowcaseGalleryIndividualPhotos.NotAvailable is 4></font><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="Red">Not Shown</font><br></cfif>
	
			</cfif>
			</td>
		</cfloop>	
			
            </tr> 
           <tr> 
				<cfif #imagecount# GT 0>
                <td width="10%" align="center"> 
                  <cfif #qGetShowcasePortfolio.SequenceAll# is 1>
				 
				   <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Position 1</font><br>
					 <font face="Verdana, Arial, Helvetica, sans-serif" size="1">Change 
                    to Position:</font> 
                  	 <cfif #clear# is 0>
					 
				    <input type="text" name="image1" size="2" maxlength="2" value="1">

					<cfelse>
					 <input type="text" name="image1" size="2" maxlength="2" value="">
					</cfif>
                  </p>
				  <cfelse>
				  <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>Signature Image</b></font><br>
					<font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="red">Jury's Choice</font> 
                   <!---  <input type="text" name="image1" size="2" maxlength="2" value="1"> --->
                  <input type="hidden" name="image1" value="1">
				  </p>			  
				  </cfif>
               	 </td>
				<cfelse>
				<td width="10%" align="center"> 
					<br>
                </td>	
				</cfif>
				<cfif #imagecount# GT 1>
                <td width="10%" align="center"> 
                  <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Position 
                    2</font><br>
                    <font face="Verdana, Arial, Helvetica, sans-serif" size="1">Change 
                    to Position:</font> 
                  	 <cfif #clear# is 0>
				    <input type="text" name="image2" size="2" maxlength="2" value="2">
					<cfelse>
					 <input type="text" name="image2" size="2" maxlength="2" value="">
					</cfif>
                  </p>
               	 </td>
				<cfelse>
				<td width="10%" align="center"> 
					<br>
                </td>	
				</cfif>
				<cfif #imagecount# GT 2>
                <td width="10%" align="center"> 
                  <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Position 
                    3</font><br>
                    <font face="Verdana, Arial, Helvetica, sans-serif" size="1">Change 
                    to Position:</font> 
                  	 <cfif #clear# is 0>
				  	     <input type="text" name="image3" size="2" maxlength="2" value="3">
					<cfelse>
						 <input type="text" name="image3" size="2" maxlength="2" value="">
					</cfif>
                  </p>
               	 </td>
				<cfelse>
				<td width="10%" align="center"> 
					<br>
                </td>	
				</cfif>
				<cfif #imagecount# GT 3>
                <td width="10%" align="center"> 
                  <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Position 
                    4</font><br>
                    <font face="Verdana, Arial, Helvetica, sans-serif" size="1">Change 
                    to Position:</font> 
                  	 <cfif #clear# is 0>
				  	     <input type="text" name="image4" size="2" maxlength="2" value="4">
					<cfelse>
						 <input type="text" name="image4" size="2" maxlength="2" value="">
					</cfif>
                  </p>
               	 </td>
				<cfelse>
				<td width="10%" align="center"> 
					<br>
                </td>	
				</cfif>
				<cfif #imagecount# GT 4>
                <td width="10%" align="center"> 
                  <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Position 
                    5</font><br>
                    <font face="Verdana, Arial, Helvetica, sans-serif" size="1">Change 
                    to Position:</font> 
                  	 <cfif #clear# is 0>
				  	     <input type="text" name="image5" size="2" maxlength="2" value="5">
					<cfelse>
						 <input type="text" name="image5" size="2" maxlength="2" value="">
					</cfif>
                  </p>
               	 </td>
				<cfelse>
				<td width="10%" align="center"> 
					<br>
                </td>	
				</cfif>
            </tr>
          </table>
          <hr size="1" noshade>
		  
          <table width="100%" border="0" cellspacing="0" cellpadding="3">
            <tr>
				<cfloop QUERY=qShowcaseGalleryIndividualPhotos startrow="6" endrow="10">
					<td align="center" width="10%">
					<cfif fileexists(Expandpath("../../../../visualserver/Artists/#qGetShowcaseSetup.Subdirectory#/#qGetShowcasePortfolio.SubDirectory#/Images_Large/image#qShowcaseGalleryIndividualPhotos.imagenumber#.jpg"))>		
						
						<cfset imageno=#qShowcaseGalleryIndividualPhotos.imagenumber#>
<a href="step12artworkdescriptionformSequence.cfm?custnumber=#qShowcaseGalleryIndividualPhotos.custnumber#&imagenumber=#imageno#&imagenumbercounter=#imageno#&Portfolio=#qGetShowcasePortfolio.SubDirectory#">

<!--- ImageSizer --->									
<cfset xheight=64>
<cfset xwidth=75>
<cfset xPath= "http://www.visualserver.com/artists/#qGetShowcaseSetup.Subdirectory#/#qGetShowcasePortfolio.SubDirectory#/Images_Large/">
<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image#qShowcaseGalleryIndividualPhotos.imagenumber#.jpg">

<cfinclude template="../../../templates/imagesizer.cfm">

<img src="../../../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a>
<!--- End ImageSizer --->

           	
			    <br><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>Edit Text Info</a></b></font><br><cfif qShowcaseGalleryIndividualPhotos.NotAvailable is 4></font><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="Red">Not Shown</font><br></cfif>
					</cfif>
					</td>
				</cfloop>	 
            </tr>
            <tr> 
				<cfif #imagecount# GT 5>
                <td width="10%" align="center"> 
                  <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Position 
                    6</font><br>
                    <font face="Verdana, Arial, Helvetica, sans-serif" size="1">Change 
                    to Position:</font> 
                  	 <cfif #clear# is 0>
				  	     <input type="text" name="image6" size="2" maxlength="2" value="6">
					<cfelse>
						 <input type="text" name="image6" size="2" maxlength="2" value="">
					</cfif>
                  </p>
               	 </td>
				<cfelse>
				<td width="10%" align="center"> 
					<br>
                </td>	
				</cfif>
				<cfif #imagecount# GT 6>
                <td width="10%" align="center"> 
                  <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Position 
                    7</font><br>
                    <font face="Verdana, Arial, Helvetica, sans-serif" size="1">Change 
                    to Position:</font> 
                  	 <cfif #clear# is 0>
				  	     <input type="text" name="image7" size="2" maxlength="2" value="7">
					<cfelse>
						 <input type="text" name="image7" size="2" maxlength="2" value="">
					</cfif>
                  </p>
               	 </td>
				<cfelse>
				<td width="10%" align="center"> 
					<br>
                </td>	
				</cfif>
  				<cfif #imagecount# GT 7>
                <td width="10%" align="center"> 
                  <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Position 
                    8</font><br>
                    <font face="Verdana, Arial, Helvetica, sans-serif" size="1">Change 
                    to Position:</font> 
                  	 <cfif #clear# is 0>
				  	     <input type="text" name="image8" size="2" maxlength="2" value="8">
					<cfelse>
						 <input type="text" name="image8" size="2" maxlength="2" value="">
					</cfif>
                  </p>
               	 </td>
				<cfelse>
				<td width="10%" align="center"> 
					<br>
                </td>	
				</cfif>
				<cfif #imagecount# GT 8>
                <td width="10%" align="center"> 
                  <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Position 
                    9</font><br>
                    <font face="Verdana, Arial, Helvetica, sans-serif" size="1">Change 
                    to Position:</font> 
                  	 <cfif #clear# is 0>
				  	     <input type="text" name="image9" size="2" maxlength="2" value="9">
					<cfelse>
						 <input type="text" name="image9" size="2" maxlength="2" value="">
					</cfif>
                  </p>
               	 </td>
				<cfelse>
				<td width="10%" align="center"> 
					<br>
                </td>	
				</cfif>
				<cfif #imagecount# GT 9>
                <td width="10%" align="center"> 
                  <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Position 
                    10</font><br>
                    <font face="Verdana, Arial, Helvetica, sans-serif" size="1">Change 
                    to Position:</font> 
                  	 <cfif #clear# is 0>
				  	     <input type="text" name="image10" size="2" maxlength="2" value="10">
					<cfelse>
						 <input type="text" name="image10" size="2" maxlength="2" value="">
					</cfif>
                  </p>
               	 </td>
				<cfelse>
				<td width="10%" align="center"> 
					<br>
                </td>	
				</cfif>
            </tr>
          </table>
		  
          <hr size="1" noshade>
          <!--- If there are 11-15 images show this table---> 
            <table width="100%" border="0" cellspacing="0" cellpadding="3">
              <tr> 
	
        <cfif #imagecount# GT 10>
		<cfloop QUERY=qShowcaseGalleryIndividualPhotos startrow="11" endrow="15">
			<td align="center" width="10%">
			<cfif fileexists(Expandpath("../../../../visualserver/Artists/#qGetShowcaseSetup.Subdirectory#/#qGetShowcasePortfolio.SubDirectory#/Images_Large/image#qShowcaseGalleryIndividualPhotos.imagenumber#.jpg"))>
				<cfset imageno=#qShowcaseGalleryIndividualPhotos.imagenumber#><a href="step12artworkdescriptionformSequence.cfm?custnumber=#qShowcaseGalleryIndividualPhotos.custnumber#&imagenumber=#imageno#&imagenumbercounter=#imageno#&Portfolio=#qGetShowcasePortfolio.SubDirectory#">

<!--- ImageSizer --->									
<cfset xheight=64>
<cfset xwidth=75>
<cfset xPath= "http://www.visualserver.com/artists/#qGetShowcaseSetup.Subdirectory#/#qGetShowcasePortfolio.SubDirectory#/Images_Large/">
<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image#qShowcaseGalleryIndividualPhotos.imagenumber#.jpg">

<cfinclude template="../../../templates/imagesizer.cfm">

<img src="../../../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a>
<!--- End ImageSizer --->


			    <br><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>Edit Text Info</a></b></font><br><cfif qShowcaseGalleryIndividualPhotos.NotAvailable is 4></font><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="Red">Not Shown</font><br></cfif>
			</cfif>
			</td>
		</cfloop>
 
              </tr>
              <tr> 

                    <tr> 
				<cfif #imagecount# GT 10>
                <td width="10%" align="center"> 
                  <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Position 
                    11</font><br>
                    <font face="Verdana, Arial, Helvetica, sans-serif" size="1">Change 
                    to Position:</font> 
                  	 <cfif #clear# is 0>
				  	     <input type="text" name="image11" size="2" maxlength="2" value="11">
					<cfelse>
						 <input type="text" name="image11" size="2" maxlength="2" value="">
					</cfif>
                  </p>
               	 </td>
				<cfelse>
				<td width="10%" align="center"> 
					<br>
                </td>	
				</cfif>
				<cfif #imagecount# GT 11>
                <td width="10%" align="center"> 
                  <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Position 
                    12</font><br>
                    <font face="Verdana, Arial, Helvetica, sans-serif" size="1">Change 
                    to Position:</font> 
                  	 <cfif #clear# is 0>
				  	     <input type="text" name="image12" size="2" maxlength="2" value="12">
					<cfelse>
						 <input type="text" name="image12" size="2" maxlength="2" value="">
					</cfif>
                  </p>
               	 </td>
				<cfelse>
				<td width="10%" align="center"> 
					<br>
                </td>	
				</cfif>
				<cfif #imagecount# GT 12>
                <td width="10%" align="center"> 
                  <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Position 
                    13</font><br>
                    <font face="Verdana, Arial, Helvetica, sans-serif" size="1">Change 
                    to Position:</font> 
                  	 <cfif #clear# is 0>
				  	     <input type="text" name="image13" size="2" maxlength="2" value="13">
					<cfelse>
						 <input type="text" name="image13" size="2" maxlength="2" value="">
					</cfif>
                  </p>
               	 </td>
				<cfelse>
				<td width="10%" align="center"> 
					<br>
                </td>	
				</cfif>
				<cfif #imagecount# GT 13>
                <td width="10%" align="center"> 
                  <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Position 
                    14</font><br>
                    <font face="Verdana, Arial, Helvetica, sans-serif" size="1">Change 
                    to Position:</font> 
                  	 <cfif #clear# is 0>
				  	     <input type="text" name="image14" size="2" maxlength="2" value="14">
					<cfelse>
						 <input type="text" name="image14" size="2" maxlength="2" value="">
					</cfif>
                  </p>
               	 </td>
				<cfelse>
				<td width="10%" align="center"> 
					<br>
                </td>	
				</cfif>
				<cfif #imagecount# GT 14>
                <td width="10%" align="center"> 
                  <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Position 
                    15</font><br>
                    <font face="Verdana, Arial, Helvetica, sans-serif" size="1">Change 
                    to Position:</font> 
                  	 <cfif #clear# is 0>
				  	     <input type="text" name="image15" size="2" maxlength="2" value="15">
					<cfelse>
						 <input type="text" name="image15" size="2" maxlength="2" value="">
					</cfif>
                  </p>
               	 </td>
				<cfelse>
				<td width="10%" align="center"> 
					<br>
                </td>	
				</cfif>
            </tr>
          </table>
          <br>
          </CFIF> 
          <hr size="1" noshade>
          
		  
	<!--- If there are 16-20 images show this table--->
          <cfif #imagecount# GT 15>
            <table width="100%" border="0" cellspacing="0" cellpadding="3">
              <tr> 
		<cfloop QUERY=qShowcaseGalleryIndividualPhotos startrow="16" endrow="20">
			<td align="center" width="10%">
			<cfif fileexists(Expandpath("../../../../visualserver/Artists/#qGetShowcaseSetup.Subdirectory#/#qGetShowcasePortfolio.SubDirectory#/Images_Large/image#qShowcaseGalleryIndividualPhotos.imagenumber#.jpg"))>	
 				<cfset imageno=#qShowcaseGalleryIndividualPhotos.imagenumber#><a href="step12artworkdescriptionformSequence.cfm?custnumber=#qShowcaseGalleryIndividualPhotos.custnumber#&imagenumber=#imageno#&imagenumbercounter=#imageno#&Portfolio=#qGetShowcasePortfolio.SubDirectory#">

<!--- ImageSizer --->									
<cfset xheight=64>
<cfset xwidth=75>
<cfset xPath= "http://www.visualserver.com/artists/#qGetShowcaseSetup.Subdirectory#/#qGetShowcasePortfolio.SubDirectory#/Images_Large/">
<cfset xAlt = "Enter Gallery">
<cfset xImage = "Image#qShowcaseGalleryIndividualPhotos.imagenumber#.jpg">

<cfinclude template="../../../templates/imagesizer.cfm">

<img src="../../../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a>
<!--- End ImageSizer --->
           	
				
			    <br><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>Edit Text Info</a></b></font><br><cfif qShowcaseGalleryIndividualPhotos.NotAvailable is 4></font><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="Red">Not Shown</font><br></cfif>
			</cfif>
			</td>
		</cfloop>	

              </tr>
			
              <tr> 
                <cfif #imagecount# GT 15>
				<td width="10%" align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="1">Position 
                  16</font> <br>
                  <font face="Verdana, Arial, Helvetica, sans-serif" size="1">Change 
                  to Position:</font> 
                  	 <cfif #clear# is 0>
				  	     <input type="text" name="image16" size="2" maxlength="2" value="16">
					<cfelse>
						 <input type="text" name="image16" size="2" maxlength="2" value="">
					</cfif>
                  <br>
                </td>
				<cfelse>
				<td width="10%" align="center"> 
					<br>
                </td>			
				</cfif>
				<cfif #imagecount# GT 16>
                <td width="10%" align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="1">Position 
                  17</font> <br>
                  <font face="Verdana, Arial, Helvetica, sans-serif" size="1">Change 
                  to Position:</font> 
                  	 <cfif #clear# is 0>
				  	     <input type="text" name="image17" size="2" maxlength="2" value="17">
					<cfelse>
						 <input type="text" name="image17" size="2" maxlength="2" value="">
					</cfif>
                  <br>
                </td>
				<cfelse>
				<td width="10%" align="center"> 
					<br>
                </td>	
				</cfif>
	    		<cfif #imagecount# GT 17>    
                <td width="10%" align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="1">Position 
                  18</font> <br>
                  <font face="Verdana, Arial, Helvetica, sans-serif" size="1">Change 
                  to Position:</font> 
                  	 <cfif #clear# is 0>
				  	     <input type="text" name="image18" size="2" maxlength="2" value="18">
					<cfelse>
						 <input type="text" name="image18" size="2" maxlength="2" value="">
					</cfif>
                  <br>
                </td>
				<cfelse>
				<td width="10%" align="center"> 
					<br>
                </td>	
				</cfif>
    			<cfif #imagecount# GT 18>            
				<td width="10%" align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="1">Position 
                  19</font> <br>
                  <font face="Verdana, Arial, Helvetica, sans-serif" size="1">Change 
                  to Position:</font> 
                  	 <cfif #clear# is 0>
				  	     <input type="text" name="image19" size="2" maxlength="2" value="19">
					<cfelse>
						 <input type="text" name="image19" size="2" maxlength="2" value="">
					</cfif>
                  <br>
                </td>
				<cfelse>
				<td width="10%" align="center"> 
					<br>
                </td>	
				</cfif>
				<cfif #imagecount# IS 20>
                <td width="10%" align="center"> 
                  <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Position 
                    20</font><br>
                    <font face="Verdana, Arial, Helvetica, sans-serif" size="1">Change 
                    to Position:</font> 
                  	 <cfif #clear# is 0>
				  	     <input type="text" name="image20" size="2" maxlength="2" value="20">
					<cfelse>
						 <input type="text" name="image20" size="2" maxlength="2" value="">
					</cfif>
                  </p>
               	 </td>
				<cfelse>
				<td width="10%" align="center"> 
					<br>
                </td>	
				</cfif>
				
              </tr>
            </table>
          </cfif>
		  
        </td>
      </tr>
      <tr> 
        <td colspan="3" align="center"> 
          <hr color="black" size="1">
          <center>
            <!--- <INPUT TYPE="SUBMIT" VALUE="Repeat this Step: Add another Artwork Description"><br><br> <INPUT TYPE="SUBMIT" VALUE="Change your Artwork Descriptions"><br><br> ---> 
           
	  	    <INPUT TYPE="HIDDEN" NAME="Custnumber" VALUE=#URL.Custnumber#>
		    <INPUT TYPE="SUBMIT" VALUE="Save Changes"><br>
			</form>
			<form method="post" action="ResetImagePositions.cfm?custnumber=#url.custnumber#&portfolio=#url.portfolio#">
		   <INPUT TYPE="SUBMIT" VALUE="Clear Positions">
		  </form>
          </center>
        </td>
      </tr>
    </table> 
	</CFOUTPUT>
<table align="center"><tr align="center"><td align="center">				
 <br>
        <hr color="black" size="1">
            <BR>
            <FONT FACE="Arial, Helvetica, Sans-Serif" size="2"><IMG SRC="images/photoeyebooks&prints.gif" WIDTH=308 HEIGHT=28 BORDER="0"><br>
            376 Garcia Street, Santa Fe, NM 87501<br>
            Orders Only: 800-227-6941 Info: 505-988-5152 Fax: 505-988-4487<br>
            E-Mail: <a href="mailto:webmaster@photoeye.com">webmaster@photoeye.com</a><br>
            © photo-eye books &amp; prints, 2001. All Rights Reserved.</font> 
            <br>
            <FONT FACE="Arial, Helvetica, Sans-Serif" size="1">This entire web 
            site is the © copyrighted property of photo-eye books &amp; prints, 
            except where artists' and publishers' copyrights on the materials 
            described take precedence. No portion of the contents within may be 
            reproduced in any form, for any non-private use, without the express 
            written permission of photo-eye books &amp; prints.</font> </td>
        </tr>
      </table>
	  
	  </td>
	  </tr>
	  </table>
	</td>
</tr>
</table>  

</body>
</html>

