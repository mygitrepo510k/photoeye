	  
<CFQUERY NAME="qGetShowcaseSetup"
         DATASOURCE="photoeyecom">

SELECT Distinct *
FROM GallerySetup
WHERE Custnumber = #URL.Custnumber# <!---#URL.RecordID#--->

</CFQUERY>

<CFQUERY NAME="qGetShowcasePortfolio"
         DATASOURCE="photoeyecom">

SELECT Distinct *
FROM GalleryPortfolio
WHERE Custnumber = #URL.Custnumber# and SubDirectory='#URL.Portfolio#'
</cfquery>


<CFQUERY NAME="qGetShowcaseDefaultPhotos"
         DATASOURCE="photoeyecom">

SELECT Distinct *
FROM GalleryDefaultPhotos
WHERE Custnumber = #URL.Custnumber# and SubDirectory='#URL.Portfolio#'

</CFQUERY>
<CFQUERY NAME="qGetShowcaseIndividualInfo"
         DATASOURCE="photoeyecom">

SELECT Distinct *
FROM GalleryIndividualPhotos
WHERE Custnumber = #URL.Custnumber# AND ImageNumber=#URL.ImageNumber# and PortfolioName='#URL.Portfolio#'
</CFQUERY>
<!--- Get Default Keywords and Compile them for the default ---> 
<CFQUERY NAME="qGetShowcaseDefaultKeywords"
         DATASOURCE="photoeyecom">
SELECT Distinct *
FROM GalleryKeywords
WHERE Custnumber = #URL.Custnumber# and DefaultKW=1 and Portfolio='#URL.Portfolio#'
</CFQUERY>
<cfset compiledKeywords="">
<cfset firsttime=1>
<cfloop query="qGetShowCaseDefaultKeywords" startrow="1" endrow="#qGetShowCaseDefaultKeywords.recordcount#">
	<cfif firsttime is 1>
		<cfset CompiledKeywords="#Keywords#">
	<cfelse>
		<cfset CompiledKeywords="#CompiledKeywords#, #Keywords#">
	</cfif>
	<cfset firsttime=0>
</cfloop>
<!--- Get Unique Keywords and Compile them for the default ---> 
<CFQUERY NAME="qGetShowcaseUniqueKeywords"
         DATASOURCE="photoeyecom">
SELECT Distinct *
FROM GalleryKeywords
WHERE Custnumber = #URL.Custnumber# and DefaultKW=0 and Catalog=#qGetShowcaseIndividualInfo.Catalog#
</CFQUERY>
<cfset compiledUniqueKeywords="">
<cfset firsttime=1>
<cfloop query="qGetShowCaseUniqueKeywords" startrow="1" endrow="#qGetShowCaseUniqueKeywords.recordcount#">
	<cfif firsttime is 1>
		<cfset CompiledUniqueKeywords="#Keywords#">
	<cfelse>
		<cfset CompiledUniqueKeywords="#CompiledUniqueKeywords#, #Keywords#">
	</cfif>
	<cfset firsttime=0>
</cfloop>
<!--- <CFQUERY NAME="qGetShowcaseIndividualKeywords"
         DATASOURCE="photoeyecom">

SELECT *
FROM GalleryKeywords
WHERE Custnumber = #URL.Custnumber# and DefaultKW=0 AND Catalog=#qGetShowcaseIndividualInfo.Catalog#

</CFQUERY>
 ---> 
<CFIF qGetShowcaseIndividualInfo.CUSTNUMBER IS "">
  <CFSET TEST=1>
  <CFQUERY NAME="qInsertRecord" DATASOURCE="photoeyecom">
  INSERT INTO GalleryIndividualPhotos
  (Custnumber, ImageNumber, Changed, UnMatted, NoSale, Default1, Default2, Default3, Default4, Default6, Editioned1, Default7, Editioned2, Default8, Editioned3, Default9, Default10, Default11, Label, Soldout, Inshow)
VALUES (#URL.Custnumber#, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
</CFQUERY>
  <CFQUERY NAME="qGetShowcaseIndividualInfo"
         DATASOURCE="photoeyecom">

SELECT *
FROM GalleryIndividualPhotos
WHERE Custnumber = #URL.Custnumber# AND ImageNumber=#URL.ImageNumberCounter#

</CFQUERY>
  <CFELSE>
  <CFSET TEST=0>
</cfif>
<cfoutput>
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">

<html><head>

<title>photo-eye Photographer's Showcase | Image Descriptions</title>
</head>

<body bgcolor="Gray" link="##000080" vlink="##000080">

<!--- <form method="post" action="InsertArtworkDescription_Sequence.cfm"> --->
<form action="Step12ErrorCheck.cfm?custnumber=#url.custnumber#&imagenumber=#URL.ImageNumberCounter#&portfolio=#URL.Portfolio#" method="post">
<br>
<!--- #URL.imagenumbercounter# #URL.imagenumber# ---><br>
<table width="95%" bgcolor="##FFFFFF"  align="center">
   <tr>
      <td align="center">    
        
         <table width="95%" border="0" cellpadding="5" bgcolor="##FFFFFF" cellspacing="0" valign="top" align="center">
            <tr valign="top"> 
               <td colspan="3" align="left"><br>
                  <img src="../SharedImages/photo-eye%20Explore%20NewLogo_photoShowcaseVersionWhiteBackground.jpg" width="151" height="94"></td>
            </tr>
            <tr valign="top"> 
                <td colspan="3" align="LEFT"> 
				<font face="Verdana,Arial,Helvetica,sans-serif" size="4">Step 
            12 - Edit Artwork Description Text</font><font face="Verdana,Arial,Helvetica,sans-serif" size="5"><br>
            <font size="2">Enter information about the image shown</font></font><br>
            <br>
            <font face="Verdana,Arial,Helvetica,sans-serif" size="5"><font size="2"> 
            <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"></font></font></td>
            </tr>
            <tr valign="top"> <!--- Step11DefaultTemplateURL.cfm --->
               <td colspan="3" align="LEFT"><font face="Verdana,Arial,Helvetica,sans-serif" color="BLACK" size="1">Fill 
            out information that is unique to this artwork. If this text  
            is the same as the information on the <a href="Step11DefaultTemplateURL.cfm?custnumber=#URL.Custnumber#&portfolio=#URL.Portfolio#">Default 
            Artwork Template Page</a> then leave the field blank and choose 
            <b>Use Default</b>. Fill out a page for each artwork that 
            has been accepted.</font></td>
            </tr>
            <tr valign="top"> 
               <td colspan="3" align="LEFT"></td>
            </tr>
            <tr valign="top"> 
               <td width="49%" valign="top" align="left" height="221"> 
            <p>
			
<!--- ImageSizer --->									
<cfset xheight=200>
<cfset xwidth=200>
<cfset xImageAddress = "#xRelativePath#\artists\#qGetShowcaseSetup.Subdirectory#\#qGetShowcasePortfolio.SubDirectory#\Images_Large\">
<!--- <cfset xPath= "http://www.visualserver.com/artists/#qGetShowcaseSetup.Subdirectory#/#qGetShowcasePortfolio.SubDirectory#/Images_Large/"> --->
<cfset xAlt = "Enter Gallery">
<cfset xImage = "image#imagenumber#.JPG">

<cfinclude template="../../../templates/imagesizer.cfm">

<img src="../../../_cache/#imagecr.filename#" height='#imagecr.height#' width='#imagecr.width#' border="0" ALT="#xAlt#"></a>
<!--- End ImageSizer --->	
			
</p><font face="Verdana, Arial, Helvetica, sans-serif" size="2">


<b>Image #imagenumber# 
			  	<input type="HIDDEN" name="Imagenumber" value=#imagenumbercounter#>
				<input type="HIDDEN" name="Custnumber" value=#custnumber#>  </b></font><br>
                <br>
  
  
  <cfif qGetShowcaseSetup.multiartists is 1>
  <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b>
                Artist Name: </b>&nbsp;&nbsp;&nbsp; <br><font size="1">Use mixed case for Artist Name.<br>
				<b>For Example:</b> Henri Cartier-Bresson</font></font><br>
  <table cellspacing="0" cellpadding="0"><tr><td>
  <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">
  First: <input type="text" size="10" maxlength="15" name="FirstName" value="#trim(qGetShowcaseIndividualInfo.firstname)#">
  Last: <input type="text" size="15" maxlength="20" name="LastName" value="#trim(qGetShowcaseIndividualInfo.lastname)#">
  </td></tr></table>
<br>
<img src="Images/BlackRule.gif" width=100% height=1 border="0">
<br>
  </cfif>           
			    <!---Title--->
		
				<font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b>
                Image Title: </b>&nbsp;&nbsp;&nbsp; <br><font size="1">Use mixed case for title with no period (.) at the end. <font color="Red">Capitalize all primary words.</font> <b>For Example:</b> Edge of Sky and Ocean, Port Arthur, Texas</font></font><br>
                
				   <table cellspacing="0" cellpadding="0">
                     <cfif qGetShowcaseIndividualInfo.Default1 is 1 and #Len(qGetShowcaseDefaultPhotos.title)# is not 0>
                    <!--- If there is a Default show Radio Buttons/Default Info here --->
				       <tr> 
                          <td> 
                        <div align="left"> 
                          <input type="radio" name="Default1" value=1 checked>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                          Use Default:<font color="red"> #qGetShowcaseDefaultPhotos.title#</font></font></div></td>
                       </tr>
                       <tr> 
                          <td height="32"> 
                        <div align="left"> 
                          <input type="radio" name="Default1" value=0>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font></div></td>
                       </tr>
                <cfelse>
				
				  <!--- If No Default, but there is Default Info, show radio buttons/Default Info --->
	               <cfif #Len(qGetShowcaseDefaultPhotos.title)# is not 0>
				       <tr> 
                          <td> 
                        <div align="left"> 
                          <input type="radio" name="Default1" value=1>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                          Use Default:<font color="red"> #qGetShowcaseDefaultPhotos.title#</font></font></div></td>
                       </tr>
                       <tr> 
                          <td height="32"> 
                        <div align="left"> 
                          <input type="radio" name="Default1" value=0 checked>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font></div></td>
                       </tr>
					
					<!--- If there is No Default Info Show only Unique Info header text without radio button--->
			 		<cfelse>
				 
	                   <tr> 
                          <td height="32"> 
                        <div align="left"> 
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font></div></td>
                       </tr>							
					<input type="HIDDEN" name="Default1" value=0> 
					</cfif>
                </cfif>
				<!---Show Text box with Unique Information--->
					   <tr>
						  <td>
		           		<input type="text" size="40" maxlength="75" name="Title" value="#trim(qGetShowcaseIndividualInfo.title)#"></td>				   </tr>
                   </table>
				
                <br>
				<img src="Images/BlackRule.gif" width=100% height=1 border="0">
                <br>
			
				<!--- Caption --->
			
                <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b>Image Caption: </b></font><br>
					<font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">If this image has a caption, include it here. <font color="Red">Use mixed case only (not ALL CAPS). The web requires you to enter  &lt;br&gt;&lt;br&gt; between paragraphs.</font></font><br>		
 <textarea name="Caption" rows="5" cols="30">#qGetShowcaseIndividualInfo.Caption1#</textarea>
<!---                 <input type="text" size="40" maxlength="75" name="Caption"value="#qGetShowcaseIndividualInfo.Caption1#"> --->
                <br>
				<img src="Images/BlackRule.gif" width=100% height=1 border="0">
                <br>
				<!---Year Produced --->
				
                <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b>Year 
                Produced: </b></font><br>
					<font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Include the date the original
				negative, transparency, digital file, or artwork was produced.
				This may differ from the date of the print (not required) 
				being offered for sale. <font color="Red">The year should be in a 4 digit format. For example: 1999 (not 99).</font></font><br>
				                
				   <table cellspacing="0" cellpadding="0">
               	<cfif qGetShowcaseIndividualInfo.default3 is 1 and #Len(qGetShowcaseDefaultPhotos.YearProd)# is not 0>
                    <!--- If there is a Default show Radio Buttons/Default Info here --->
				      <tr> 
                         <td> 
                        <div align="left"> 
                          <input type="radio" name="Default3" value=1 checked>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                          Use Default:<font color="red"> #qGetShowcaseDefaultPhotos.YearProd#</font></font></div></td>
                      </tr>
                      <tr> 
                         <td height="32"> 
                        <div align="left"> 
                          <input type="radio" name="Default3" value=0>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font></div></td>
                      </tr>
                <cfelse>
				
				  <!--- If No Default, but there is Default Info, show radio buttons/Default Info --->
	               <cfif #Len(qGetShowcaseDefaultPhotos.YearProd)# is not 0>
				      <tr> 
                         <td> 
                        <div align="left"> 
                          <input type="radio" name="Default3" value=1>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                          Use Default:<font color="red"> #qGetShowcaseDefaultPhotos.YearProd#</font></font></div></td>
                      </tr>
                      <tr> 
                          <td height="32"> 
                        <div align="left"> 
                          <input type="radio" name="Default3" value=0 checked>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font></div></td>
                      </tr>
					
					<!--- If there is No Default Info Show only Unique Info header text without radio button--->
			 		<cfelse>
				 
	                  <tr> 
                         <td height="32"> 
                        <div align="left"> 
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font></div></td>
                      </tr>							
					<input type="HIDDEN" name="default3" value=0> 
					</cfif>
                </cfif>
					<!---Show Text box with Unique Information--->
					  <tr>
				         <td>
						    <input type="text" size="4" maxlength="4" name="YearProd"  value="#trim(qGetShowcaseIndividualInfo.YearProd)#"></td>
					  </tr>
                   </table>
				   
				            
				
				<br>
				<img src="Images/BlackRule.gif" width=100% height=1 border="0">
        		<br>
			  
	
	
	<!---Copyright Date --->
				
                <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b>Copyright Date: 
               </b></font><br>
					<font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Include the copyright date for this image. Generally this is the date that this particular image was first published. If this is the first time that it is being published, then include the current year. If this field is left blank and there is no default copyright date entered in Step 11, then this image will automatically be assigned the current year as the copyright date. <font color="Red">The year should be in a 4 digit format. For example: 1999 (not 99).</font></font><br>
				                
				   <table cellspacing="0" cellpadding="0">
               	<cfif #len(qGetShowcaseIndividualInfo.Copyright)# is 0 and #Len(qGetShowcaseDefaultPhotos.Copyright)# is not 0>
                    <!--- If there is a Default show Radio Buttons/Default Info here --->
				      <tr> 
                         <td> 
                        <div align="left"> 
                          <input type="radio" name="CopyrightDefault" value=1 checked>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                          Use Default:<font color="red"> #qGetShowcaseDefaultPhotos.Copyright#</font></font></div></td>
                      </tr>
                      <tr> 
                         <td height="32"> 
                        <div align="left"> 
                          <input type="radio" name="CopyrightDefault" value=0>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font></div></td>
                      </tr>
                <cfelse>
				
				  <!--- If No Default, but there is Default Info, show radio buttons/Default Info --->
	               <cfif #Len(qGetShowcaseDefaultPhotos.Copyright)# is not 0>
				      <tr> 
                         <td> 
                        <div align="left"> 
                          <input type="radio" name="CopyrightDefault" value=1>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                          Use Default:<font color="red"> #qGetShowcaseDefaultPhotos.Copyright#</font></font></div></td>
                      </tr>
                      <tr> 
                          <td height="32"> 
                        <div align="left"> 
                          <input type="radio" name="CopyrightDefault" value=0 checked>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font></div></td>
                      </tr>
					
					<!--- If there is No Default Info Show only Unique Info header text without radio button--->
			 		<cfelse>
				 
	                  <tr> 
                         <td height="32"> 
                        <div align="left"> 
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font></div></td>
                      </tr>							
					<input type="HIDDEN" name="CopyrightDefault" value=0> 
					</cfif>
                </cfif>
					<!---Show Text box with Unique Information--->
					  <tr>
				         <td>
						    <input type="text" size="4" maxlength="4" name="Copyright"  value="#trim(qGetShowcaseIndividualInfo.Copyright)#"></td>
					  </tr>
                   </table>
				   
				            
				
				<br>
				<img src="Images/BlackRule.gif" width=100% height=1 border="0">
        		<br>		  
		  
			  <!---Medium--->
				

				<font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b>
                Process: </b>&nbsp;&nbsp;&nbsp; </font><br>
                
				   <table cellspacing="0" cellpadding="0">
<!---                   <cfif qGetShowcaseIndividualInfo.Default2 is 1 and (#Len(qGetShowcaseDefaultPhotos.medium)# is not 0 or #Len(qGetShowcaseDefaultPhotos.Othermed)# is not 0)> --->
                  <cfif (len(trim(qGetShowcaseIndividualInfo.Medium)) is 0 and len(trim(qGetShowcaseIndividualInfo.OtherMed)) is 0) and (#Len(qGetShowcaseDefaultPhotos.medium)# is not 0 or #Len(qGetShowcaseDefaultPhotos.Othermed)# is not 0)>                    <!--- If there is a Default show Radio Buttons/Default Info here --->
				      <tr> 
                         <td>
                        <div align="left"> 
                          <input type="radio" name="Default2" value=1 checked>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                          Use Default:<font color="red">
						  <cfif #Len(trim(qGetShowcaseDefaultPhotos.medium))# is not 0 and #trim(qGetShowcaseDefaultPhotos.Medium)# is not "Other Process">
						 		#qGetShowcaseDefaultPhotos.medium#
						   <cfelse>
						 		Other Process: #qGetShowcaseDefaultPhotos.OtherMed#
						  </cfif>					  
						  </font></font></div></td>
                      </tr>
                      <tr> 
                         <td height="32"> 
                        <div align="left"> 
                          <input type="radio" name="Default2" value=0>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font></div></td>
                      </tr>
                <cfelse>
				
				  <!--- If No Default, but there is Default Info, show radio buttons/Default Info --->
	               <cfif #Len(qGetShowcaseDefaultPhotos.medium)# is not 0 or #Len(qGetShowcaseDefaultPhotos.Othermed)# is not 0>
				      <tr> 
                         <td> 
                        <div align="left">
                          <input type="radio" name="Default2" value="1">
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                          Use Default:<font color="red"> 
						  <cfif #Len(trim(qGetShowcaseDefaultPhotos.medium))# is not 0 and #trim(qGetShowcaseDefaultPhotos.Medium)# is not "Other Process">
						  	 #qGetShowcaseDefaultPhotos.medium#<br>
						  <cfelse>
						 	 Other Process: #qGetShowcaseDefaultPhotos.othermed#
                      	  </cfif>
						  </font></font></div></td>
                      </tr>
                      <tr> 
                         <td height="32"> 
                        <div align="left"> 
                          <input type="radio" name="Default2" value=0 checked>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font></div></td>
                      </tr>
					
					<!--- If there is No Default Info Show only Unique Info header text without radio button--->
			 		<cfelse>
				 
	                  <tr> 
                         <td height="32"> 
                        <div align="left"> 
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font></div></td>
                      </tr>							
					<input type="HIDDEN" name="Default2" value=0 checked> 
					</cfif>
                </cfif>
				<!---Show Text box with Unique Information--->
					  <tr>
					     <td>
						
		           		  <select name="Medium" size="1">
							<option value="" <CFIF #qGetShowcaseIndividualInfo.Medium# is "">SELECTED</CFIF>>Select Process
                  			<option value="Albumen Print" <CFIF #qGetShowcaseIndividualInfo.Medium# is "Albumen Print">SELECTED</CFIF>>Albumen Print 
<!---                  			<option value="Black & White" <CFIF #qGetShowcaseIndividualInfo.Medium# is "Black & White">SELECTED</CFIF>>Black &amp; White  --->
                 			<option value="Carbon Print" <CFIF #qGetShowcaseIndividualInfo.Medium# is "Carbon Print">SELECTED</CFIF>>Carbon Print 
                 			<option value="Chromogenic Print" <CFIF #qGetShowcaseIndividualInfo.Medium# is "Chromogenic Print">SELECTED</CFIF>>Chromogenic Print 
                  			<option value="Cibachrome Print"  <CFIF #qGetShowcaseIndividualInfo.Medium# is "Cibachrome Print">SELECTED</CFIF>>Cibachrome Print 
                  			<option value="Cyanotype Print"  <CFIF #qGetShowcaseIndividualInfo.Medium# is "Cyanotype Print">SELECTED</CFIF>>Cyanotype Print
<!---                   			<option value="Color" <CFIF #qGetShowcaseIndividualInfo.Medium# is "Color">SELECTED</CFIF>>Color  --->
                  			<option value="Daguerreotype" <CFIF #qGetShowcaseIndividualInfo.Medium# is "Daguerreotype">SELECTED</CFIF>>Daguerreotype 
                  			<option value="Dye Transfer Print" <CFIF #qGetShowcaseIndividualInfo.Medium# is "Dye Transfer Print">SELECTED</CFIF>>Dye Transfer Print
                  			<option value="Fresson Print"  <CFIF #qGetShowcaseIndividualInfo.Medium# is "Fresson Print">SELECTED</CFIF>>Fresson Print 
                  			<option value="Gelatin-Silver Print"  <CFIF #qGetShowcaseIndividualInfo.Medium# is "Gelatin-Silver Print">SELECTED</CFIF>>Gelatin-Silver Print 
                  			<option value="Toned Gelatin-Silver Print"  <CFIF #qGetShowcaseIndividualInfo.Medium# is "Toned Gelatin-Silver Print">SELECTED</CFIF>>Toned Gelatin-Silver Print 
                  			<option value="Gicl&eacute;e Print"  <CFIF #qGetShowcaseIndividualInfo.Medium# is "Gicl&eacute;e Print">SELECTED</CFIF>>Gicl&eacute;e Print
                  			<option value="Iris Print" <CFIF #qGetShowcaseIndividualInfo.Medium# is "Iris Print">SELECTED</CFIF>>Iris Print 
                  			<option value="Mixed Media" <CFIF #qGetShowcaseIndividualInfo.Medium# is "Mixed Media">SELECTED</CFIF>>Mixed Media 
                  			<option value="Montage" <CFIF #qGetShowcaseIndividualInfo.Medium# is "Montage">SELECTED</CFIF>>Montage
                  			<option value="Photocollage"  <CFIF #qGetShowcaseIndividualInfo.Medium# is "Photocollage">SELECTED</CFIF>>Photocollage 
                  			<option value="Photogram" <CFIF #qGetShowcaseIndividualInfo.Medium# is "Photogram">SELECTED</CFIF>>Photogram 
                  			<option value="Photogravure" <CFIF #qGetShowcaseIndividualInfo.Medium# is "Photogravure">SELECTED</CFIF>>Photogravure 
                  			<option value="Platinum/Palladium Print" <CFIF #qGetShowcaseIndividualInfo.Medium# is "Platinum/Palladium Print">SELECTED</CFIF>>Platinum/Palladium Print 
                  			<option value="Polaroid" <CFIF #qGetShowcaseIndividualInfo.Medium# is "Polaroid">SELECTED</CFIF>>Polaroid 
                  			<option value="TinType" <CFIF #qGetShowcaseIndividualInfo.Medium# is "TinType">SELECTED</CFIF>>TinType 
                  			<option value="Contact Print" <CFIF #qGetShowcaseIndividualInfo.Medium# is "Contact Print">SELECTED</CFIF>>Contact Print 
                  			 <option value="Other Medium" <CFIF #qGetShowcaseIndividualInfo.Medium# is "Other Medium">SELECTED</CFIF>>Other Process
                  			<!--- <option value="Other" <CFIF #qGetShowcaseIndividualInfo.Medium# is "Other">SELECTED</CFIF>>Other  --->
                		</select>
                <br><br>
                <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">           <b>Other Process:</b>    If none of the above processes are appropriate, choose <b>Other Process</b> from the above list and define your process below. Add any additional information about the process you use to your <a href="Step8StatementsURLNew.cfm?custnumber=#URL.Custnumber#">Process Statement</a>. Your signature piece will be included in the Process directory under the heading <b>Other Processes</b>.<font color="Red"> Capitalize all primary words.</font></font><br>
                <input type="text" size="35" maxlength="75" name="OtherMed"  value="#trim(qGetShowcaseIndividualInfo.OtherMed)#"></td>				  </tr>
                   </table>
       			
 

				   
                <br>
				<img src="Images/BlackRule.gif" width=100% height=1 border="0">
                <br>

				
				
				<!--- Genre --->
				
				   <table cellspacing="0" cellpadding="0">			
				      <tr>
					     <td>
				<font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b>Genre:</b><br>
                <font size="1">What's is the primary genre for this artwork?</font></font></td>
				      </tr>
                
	<!--- 
               	<cfif qGetShowcaseIndividualInfo.default9 is 1 and (#Len(qGetShowcaseDefaultPhotos.Genre1)# is not 0 or #Len(qGetShowcaseDefaultPhotos.Genre2)# is not 0)> --->
               	<cfif (len(trim(qGetShowcaseIndividualInfo.Genre1)) is 0 and len(trim(qGetShowcaseIndividualInfo.Genre2)) is 0) and (#Len(qGetShowcaseDefaultPhotos.Genre1)# is not 0 or #Len(qGetShowcaseDefaultPhotos.Genre2)# is not 0)>
                    <!--- If there is a Default show Radio Buttons/Default Info here --->
				      <tr> 
                         <td> 
                        <div align="left"> 
                          <input type="radio" name="Default9" value=1 checked>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                          Use Default:<font color="red">
						  <cfif #Len(trim(qGetShowcaseDefaultPhotos.Genre1))# is not 0 and #trim(qGetShowcaseDefaultPhotos.Genre1)# is not "Other Genre">
						  	 #qGetShowcaseDefaultPhotos.Genre1#<br>
						  <cfelse>
						 	 Other Genre: #qGetShowcaseDefaultPhotos.Genre2#<br>
                      	  </cfif></font></font></div></td>
                      </tr>
                      <tr> 
                         <td height="32"> 
                        <div align="left"> 
                          <input type="radio" name="Default9" value=0>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font></div></td>
                      </tr>
                <cfelse>
				
				  <!--- If No Default, but there is Default Info, show radio buttons/Default Info --->
	               <cfif #Len(qGetShowcaseDefaultPhotos.Genre1)# is not 0 or #Len(qGetShowcaseDefaultPhotos.Genre2)# is not 0>
				      <tr> 
                         <td> 
                        <div align="left"> 
                          <input type="radio" name="Default9" value=1>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                          Use Default:<font color="red">    
						  <cfif #Len(trim(qGetShowcaseDefaultPhotos.Genre1))# is not 0 and #trim(qGetShowcaseDefaultPhotos.Genre1)# is not "Other Genre">
						  	 #qGetShowcaseDefaultPhotos.Genre1#<br>
						  <cfelse>
						 	Other Genre: #qGetShowcaseDefaultPhotos.Genre2#<br>
                      	  </cfif></font></font></div></td>
                      </tr>
                      <tr> 
                         <td height="32"> 
                        <div align="left"> 
                          <input type="radio" name="Default9" value=0 checked>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font></div></td>
                      </tr>
					
					<!--- If there is No Default Info Show only Unique Info header text without radio button--->
			 		<cfelse>
				 
	                  <tr> 
                         <td height="32"> 
                        <div align="left"> 
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font></div></td>
                      </tr>							
					<input type="HIDDEN" name="default9" value=0> 
					</cfif>
                </cfif>
					<!---Show Text box with Unique Information--->
					  <tr>
					     <td>
	               <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><br>
				
                <select name="Genre1" size="1">
                  <option value="" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "">SELECTED</CFIF>>Select Genre 
                  <option value="Abstract" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Abstract">SELECTED</CFIF>>Abstract 
                  <option value="Architecture" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Architecture">SELECTED</CFIF>>Architecture 
                  <option value="Astronomical" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Astronomical">SELECTED</CFIF>>Astronomical 
<!---                   <option value="Cityscape" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Cityscape">SELECTED</CFIF>>Cityscape  --->
                  <option value="Conceptual" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Conceptual">SELECTED</CFIF>>Conceptual
                  <option value="Documentary" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Documentary">SELECTED</CFIF>>Documentary 
                  <option value="Fashion" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Fashion">SELECTED</CFIF>>Fashion 
                  <option value="Figurative" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Figurative">SELECTED</CFIF>>Figurative 
                  <option value="Landscape" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Landscape">SELECTED</CFIF>>Landscape
                  <option value="Narrative" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Narrative">SELECTED</CFIF>>Narrative  
                  <option value="Nudes" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Nudes">SELECTED</CFIF>>Nudes 
                  <option value="Photojournalism" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Photojournalism">SELECTED</CFIF>>Photojournalism 
                  <option value="Photomontage" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Photomontage">SELECTED</CFIF>>Photomontage 
                  <option value="Pictorialism" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Pictorialism">SELECTED</CFIF>>Pictorialism
                  <option value="Portraiture" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Portraiture">SELECTED</CFIF>>Portraiture 
                  <option value="Scientific" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Scientific">SELECTED</CFIF>>Scientific 
                  <option value="Snapshot" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Snapshot">SELECTED</CFIF>>Snapshot 
                  <option value="Still Life" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Still Life">SELECTED</CFIF>>Still Life 
                  <option value="Street Photography" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Street Photography">SELECTED</CFIF>>Street Photography 
                  <option value="Social Landscape" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Social Landscape">SELECTED</CFIF>>Social Landscape 
                  <option value="Urban Landscape" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Urban Landscape">SELECTED</CFIF>>Urban Landscape 
                  <option value="Unclassified" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Unclassified">SELECTED</CFIF>>Unclassified
                   <option value="Other Genre" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Other Genre">SELECTED</CFIF>>Other Genre
                </select><br><br>
            <b>Other Genre:</b>    If none of the above genres are appropriate, choose <b>Other Genre</b> from the above list and define your genre below. Your work will be included in the Genre directory under the heading entitled <b>Other Genre</b>.<font color="Red"> Capitalize all primary words.</font></font><br>
                <input type="text" size="35" name="Genre2"  value="#trim(qGetShowcaseIndividualInfo.Genre2)#" maxlength="75"> 
                </td>
				
				      </tr>
                   </table>		
				   
				 <br>
				<img src="Images/BlackRule.gif" width=100% height=1 border="0">
                <br>			
				
								
				<!--- Format --->
				
				   <table cellspacing="0" cellpadding="0">			
				      <tr>
					     <td>
				<font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b>Camera Format:</b><br>
                <font size="1">What camera format or type do you use? Choose the most specific type. For example, you may use a 35mm Widelux to take panoramic photographs. Choose Panoramic not Small - 35 mm.  This may be overridden for particular images in Step 12.</font></font></td>
				      </tr>
                
<!---                	<cfif qGetShowcaseIndividualInfo.defaultFormat is 1 and (#Len(qGetShowcaseDefaultPhotos.Format1)# is not 0 or #Len(qGetShowcaseDefaultPhotos.Format2)# is not 0)> --->	
               	<cfif (len(trim(qGetShowcaseIndividualInfo.Format1)) is 0 and len(trim(qGetShowcaseIndividualInfo.Format2)) is 0) and (#Len(qGetShowcaseDefaultPhotos.Format1)# is not 0 or #Len(qGetShowcaseDefaultPhotos.Format2)# is not 0)>
                    <!--- If there is a Default show Radio Buttons/Default Info here --->
				      <tr> 
                         <td> 
                        <div align="left"> 
                          <input type="radio" name="DefaultFormat" value=1 checked>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                          Use Default:<font color="red"> 						  
						  <cfif #Len(trim(qGetShowcaseDefaultPhotos.Format1))# is not 0 and #trim(qGetShowcaseDefaultPhotos.Format1)# is not "Other Format">
						  	 #qGetShowcaseDefaultPhotos.Format1#<br>
						  <cfelse>
						 Other Format: #qGetShowcaseDefaultPhotos.Format2#<br>
                      	  </cfif></font></font></div></td>
                      </tr>
                      <tr> 
                         <td height="32"> 
                        <div align="left"> 
                          <input type="radio" name="DefaultFormat" value=0>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font></div></td>
                      </tr>
                <cfelse>
				
				  <!--- If No Default, but there is Default Info, show radio buttons/Default Info --->
	               <cfif #Len(qGetShowcaseDefaultPhotos.Format1)# is not 0 or #Len(qGetShowcaseDefaultPhotos.Format2)# is not 0>
				      <tr> 
                         <td> 
                        <div align="left"> 
                          <input type="radio" name="DefaultFormat" value=1>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                          Use Default:<font color="red"> 						  
						  <cfif #Len(qGetShowcaseDefaultPhotos.Format1)# is not 0 and #trim(qGetShowcaseDefaultPhotos.Format1)# is not "Other Format">
						  	 #qGetShowcaseDefaultPhotos.Format1#<br>
						  <cfelse>
						 	Other Format: #qGetShowcaseDefaultPhotos.Format2#<br>
                      	  </cfif></font></font></div></td>
                      </tr>
                      <tr> 
                         <td height="32"> 
                        <div align="left"> 
                          <input type="radio" name="DefaultFormat" value=0 checked>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font></div></td>
                      </tr>
					
					<!--- If there is No Default Info Show only Unique Info header text without radio button--->
			 		<cfelse>
				 
	                  <tr> 
                         <td height="32"> 
                        <div align="left"> 
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font></div></td>
                      </tr>							
					<input type="HIDDEN" name="DefaultFormat" value=0> 
					</cfif>
                </cfif>
					<!---Show Text box with Unique Information--->
					  <tr>
					     <td>
	               <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><br>
				
                <select name="Format1" size="1">
                  <option value="" <CFIF #qGetShowcaseIndividualInfo.Format1# is "">SELECTED</CFIF>>Select Format
<!---                   <option value="Not Appropriate" <CFIF #qGetShowcaseIndividualInfo.Format1# is "Not Appropriate">SELECTED</CFIF>>Not Appropriate ---> 
                  <option value="Miniature" <CFIF #qGetShowcaseIndividualInfo.Format1# is "Miniature Format">SELECTED</CFIF>>Miniature - Smaller than 35mm
                  <option value="Small Format" <CFIF #qGetShowcaseIndividualInfo.Format1# is "Small Format">SELECTED</CFIF>>Small - 35mm
                  <option value="Medium Format" <CFIF #qGetShowcaseIndividualInfo.Format1# is "Medium Format">SELECTED</CFIF>>Medium Format
                  <option value="Large Format" <CFIF #qGetShowcaseIndividualInfo.Format1# is "Large Format">SELECTED</CFIF>>Large - View Camera
                  <option value="Banquet Camera" <CFIF #qGetShowcaseIndividualInfo.Format1# is "Banquet Camera">SELECTED</CFIF>>Banquet 
                  <option value="Mammoth Camera" <CFIF #qGetShowcaseIndividualInfo.Format1# is "Mammoth Camera">SELECTED</CFIF>>Mammoth 
                  <option value="Digital Photography" <CFIF #qGetShowcaseIndividualInfo.Format1# is "Digital Photography">SELECTED</CFIF>>Digital 
                  <option value="Plastic Camera" <CFIF #qGetShowcaseIndividualInfo.Format1# is "Plastic Camera">SELECTED</CFIF>>Plastic 
                  <option value="Pinhole Photography" <CFIF #qGetShowcaseIndividualInfo.Format1# is "Pinhole Photography">SELECTED</CFIF>>Pinhole 
                  <option value="Stereo Photography" <CFIF #qGetShowcaseIndividualInfo.Format1# is "Stereo Photography">SELECTED</CFIF>>Stereo 
                  <option value="Panoramic Photography" <CFIF #qGetShowcaseIndividualInfo.Format1# is "Panoramic Photography">SELECTED</CFIF>>Panoramic
                  <option value="Cameraless" <CFIF #qGetShowcaseIndividualInfo.Format1# is "Cameraless">SELECTED</CFIF>>Cameraless
                  <option value="Unclassified" <CFIF #qGetShowcaseIndividualInfo.Format1# is "Unclassified">SELECTED</CFIF>>Unclassified
                  <option value="Other Format" <CFIF #qGetShowcaseIndividualInfo.Format1# is "Other Format">SELECTED</CFIF>>Other Format
                </select> <br><br>
               <b>Other Format</b>: If none of the above formats or camera types are appropriate, choose <b>Other Format</b> from the above list and define your format below. Your work will be included in the Format directory under the heading entitled <b>Other Format</b>.<font color="Red">Capitalize all primary words.</font><br>
                <input type="text" size="40" name="Format2" maxlength="75" value="#trim(qGetShowcaseIndividualInfo.Format2)#"> 
                </font></font></td>
				
				      </tr>
                   </table>		
				   
				 <br>
				<img src="Images/BlackRule.gif" width=100% height=1 border="0">
                <br>	
					
				<!---Image Availability--->
				
							
                <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b>Image Availability:</b></font><br>
					<font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">If this image is no longer available for sale, please choose the reason why. This usually only applies to unique artwork or editioned prints in which the entire edition has sold out. Note that the option for Do Not Display on Site is not available for Image 1, the jury chosen signature piece.</font><br> 
               
				   <table cellspacing="0" cellpadding="0">
				
                    <!--- 08/27 Use Default <cfif qGetShowcaseIndividualInfo.DefaultNFS is 1> --->
 					<cfif qGetShowcaseIndividualInfo.DefaultNFS is 1>
					<!---  and #Len(qGetShowcaseDefaultPhotos.NotAvailable)# is not 0 --->
                    <!--- If there is a Default show Radio Buttons/Default Info here --->	
					   <tr>
					   <td><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
					    <!--- If this is image 1, it cannot be taken off the site by the user --->
						 <cfif qGetShowcaseDefaultPhotos.NotAvailable is '0'>
						 
						 <input type="radio" name="NotAvailable" value="0" <cfif #qGetShowcaseDefaultPhotos.NotAvailable# is "0"> checked </cfif>>
  Use Default:  <font color="Red">Available for Sale</font><br>	
  						<cfelseif qGetShowcaseDefaultPhotos.NotAvailable is '1'> 
  <input type="radio" name="NotAvailable" value="1" <cfif #qGetShowcaseDefaultPhotos.NotAvailable# is "1"> checked </cfif>>
   Use Default:  <font color="Red">Not for Sale - Sold Out</font><br>
  						<cfelseif qGetShowcaseDefaultPhotos.NotAvailable is '2'> 
  <input type="radio" name="NotAvailable" value="2" <cfif #qGetShowcaseDefaultPhotos.NotAvailable# is "2"> checked </cfif>>
   Use Default: <font color="Red">Not for Sale - Reserved</font><br>
					   <cfelseif qGetShowcaseDefaultPhotos.NotAvailable is '3'> 
  <input type="radio" name="NotAvailable" value="3" <cfif #qGetShowcaseDefaultPhotos.NotAvailable# is "3"> checked </cfif>>
   Use Default:  <font color="Red">Not for Sale - Other </font><br>					
					   <cfelseif qGetShowcaseDefaultPhotos.NotAvailable is '5'>  	
  <input type="radio" name="NotAvailable" value="5" <cfif #qGetShowcaseDefaultPhotos.NotAvailable# is "5"> checked </cfif>>
  Use Default: 1 <font color="Red">Price Upon Request</font></b>
</cfif>	  
					   </font></td>
					   </tr>
			
					    <tr> 
                          <td height="32"> 
                        <div align="left"> 
                         <!---  <input type="radio" name="DefaultNFS" value=0 checked> --->
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, choose item below:</font></div></td>
                       </tr>

 					   <tr>
						  <td>
  <b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">
  <cfif qGetShowcaseDefaultPhotos.NotAvailable is NOT '0'>
  <input type="radio" name="NotAvailable" value="0" <cfif #qGetShowcaseDefaultPhotos.NotAvailable# is "0"> </cfif>>
  Available for Sale<br>	
  </cfif>
 <cfif qGetShowcaseDefaultPhotos.NotAvailable is NOT '1'> 	 
  <input type="radio" name="NotAvailable" value="1" <cfif #qGetShowcaseDefaultPhotos.NotAvailable# is "1"> </cfif>>
  Not for Sale - Sold Out<br>
  </cfif>
   <cfif qGetShowcaseDefaultPhotos.NotAvailable is NOT '2'> 	
  <input type="radio" name="NotAvailable" value="2" <cfif #qGetShowcaseDefaultPhotos.NotAvailable# is "2">  </cfif>>
  Not for Sale - Reserved<br>
  </cfif>
   <cfif qGetShowcaseDefaultPhotos.NotAvailable is NOT '3'> 	
  <input type="radio" name="NotAvailable" value="3" <cfif #qGetShowcaseDefaultPhotos.NotAvailable# is "3"> </cfif>>
  Not for Sale - Other<br>
  </cfif>	
    <cfif qGetShowcaseDefaultPhotos.NotAvailable is NOT '4' and #ImageNumber# GT 1>  	
  <input type="radio" name="NotAvailable" value="4" >
  Do Not Display on Site<br>
  </cfif>
      <cfif qGetShowcaseDefaultPhotos.NotAvailable is NOT '5'>  	
  <input type="radio" name="NotAvailable" value="5" >
  Price Upon Request<br>
  </cfif>
  </font></b>			
</td>				   </tr> 


                <!--- Don't Use Default --->
				<cfelse>
				
				       <tr> 

				   <td><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
					     <cfif qGetShowcaseDefaultPhotos.NotAvailable is '0'>
						 <input type="radio" name="NotAvailable" value="0" <cfif #qGetShowcaseIndividualInfo.NotAvailable# is "0"> checked </cfif>>
  Use Default:  <font color="Red">Available for Sale</font><br>	
  						<cfelseif qGetShowcaseDefaultPhotos.NotAvailable is '1'> 
  <input type="radio" name="NotAvailable" value="1" <cfif #qGetShowcaseIndividualInfo.NotAvailable# is "1"> checked </cfif>>
   Use Default:  <font color="Red">Not for Sale - Sold Out</font><br>
  						<cfelseif qGetShowcaseDefaultPhotos.NotAvailable is '2'> 
  <input type="radio" name="NotAvailable" value="2" <cfif #qGetShowcaseIndividualInfo.NotAvailable# is "2"> checked </cfif>>
   Use Default: <font color="Red">Not for Sale - Reserved</font><br>
    				   <cfelseif qGetShowcaseDefaultPhotos.NotAvailable is '3'> 
  <input type="radio" name="NotAvailable" value="3" <cfif #qGetShowcaseIndividualInfo.NotAvailable# is "3"> checked </cfif>>
   Use Default:  <font color="Red">Not for Sale - Other</font><br>
   					   <cfelseif qGetShowcaseDefaultPhotos.NotAvailable is '5'> 
  <input type="radio" name="NotAvailable" value="5" <cfif #qGetShowcaseIndividualInfo.NotAvailable# is "5"> checked </cfif>>
   Use Default:  <font color="Red">Price Upon Request</font><br>
  					   </cfif>
  
					   </font></td>
                       </tr>
					    <tr> 
                          <td height="32"> 
                        <div align="left"> 
                         <!---  <input type="radio" name="DefaultNFS" value=0 checked> --->
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, choose item below:</font></div></td>
                       </tr>
					
					   <tr>
						  <td>
   
  <b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">
  <cfif qGetShowcaseDefaultPhotos.NotAvailable is NOT '0'>
  <input type="radio" name="NotAvailable" value="0" <cfif #qGetShowcaseIndividualInfo.NotAvailable# is "0">Checked </cfif>>
  Available for Sale<br>	
  </cfif>
 <cfif qGetShowcaseDefaultPhotos.NotAvailable is NOT '1'> 	 
  <input type="radio" name="NotAvailable" value="1" <cfif #qGetShowcaseIndividualInfo.NotAvailable# is "1">Checked </cfif>>
  Not for Sale - Sold Out<br>
  </cfif>
   <cfif qGetShowcaseDefaultPhotos.NotAvailable is NOT '2'> 	
  <input type="radio" name="NotAvailable" value="2" <cfif #qGetShowcaseIndividualInfo.NotAvailable# is "2">Checked </cfif>>
  Not for Sale - Reserved<br>
  </cfif>
   <cfif qGetShowcaseDefaultPhotos.NotAvailable is NOT '3'> 	
  <input type="radio" name="NotAvailable" value="3" <cfif #qGetShowcaseIndividualInfo.NotAvailable# is "3">Checked </cfif>>
  Not for Sale - Other<br>
  </cfif>
   <cfif qGetShowcaseDefaultPhotos.NotAvailable is NOT '4' and #ImageNumber# GT 1> 	
  <input type="radio" name="NotAvailable" value="4" <cfif #qGetShowcaseIndividualInfo.NotAvailable# is "4">Checked </cfif>>
  Do Not Display on Site<br>
  </cfif>
     <cfif qGetShowcaseDefaultPhotos.NotAvailable is NOT '5'> 	
  <input type="radio" name="NotAvailable" value="5" <cfif #qGetShowcaseIndividualInfo.NotAvailable# is "5">Checked </cfif>>
 Price Upon Request<br>
  </cfif>
  </font></b>
</td>	

			   </tr>
                 </cfif>    
                   </table>
				
				
		<!---Right Column--->
             
          <td width="1" valign="top" align="left" HEIGHT="100%"><img src="Images/BlackRule.gif" width=1 height=100% alt="" border="0"> 
          </td>
		  
		
		
          <!---Print Dimensions---> 
		  
		  
		  <td valign="top" align="left"> 
<br>
		  
		  <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b> 
            Image Dimensions (in inches):</b><br>
            <font size="1">Place all basic default print information in the 
                spaces provided below. All dimensions must be in inches. Use whole numbers only rounding to the nearest whole number (no decimal points or fractions are allowed). Measure the actual image size not the paper size (eg. 7x9 even though image is printed on 8x10 paper). 
				<font color="red">Do not include inch marks (&quot;).<br>
            </font></font></font>
                

			      <table cellspacing="0" cellpadding="0"> 
 <!---
               	<cfif #qGetShowcaseIndividualInfo.default6# is 1 and 
				(#len(qGetShowcaseDefaultPhotos.Height1)# is not 0 or #len(qGetShowcaseDefaultPhotos.Width1)#  is not 0)> --->              	

<cfif (len(trim(qGetShowcaseIndividualInfo.Height1)) is 0 and len(trim(qGetShowcaseIndividualInfo.Width1)) is 0)  and 
				(#len(qGetShowcaseDefaultPhotos.Height1)# is not 0 or #len(qGetShowcaseDefaultPhotos.Width1)#  is not 0)>
                    <!--- If there is a Default show Radio Buttons/Default Info here --->
				      <tr> 
                         <td colspan="2"> 
                    <div align="left"> 
                      <input type="radio" name="Default6" value=1 checked>
                      <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                     Use Default: <font color="red"> Image Dimensions: #qGetShowcaseDefaultPhotos.height1# x 
#qGetShowcaseDefaultPhotos.width1#
				</font></font></div>
                         </td>
                      </tr>
                      <tr> 
                         <td colspan="2"> 
                        <div align="left"> 
                          <input type="radio" name="Default6" value=0>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font></div></td>
                      </tr>
			
				
                <cfelse>
				
				  <!--- If No Default, but there is Default Info, show radio buttons/Default Info ---> 
		 	
			<cfif #len(qGetShowcaseDefaultPhotos.Height1)# is not 0 or #len(qGetShowcaseDefaultPhotos.Width1)#  is not 0 >

				      <tr> 
                         <td height="20" colspan="2"> 
                    <div align="left"> 
                      <input type="radio" name="Default6" value=1>
                      <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                      Use Default: <font color="red"> Image Dimensions: #qGetShowcaseDefaultPhotos.height1# x 
#qGetShowcaseDefaultPhotos.width1#<br></font></font></div>
                         </td>
                      </tr>
                      <tr> 
                         <td colspan="2"> 
                        <div align="left"> 
                          <input type="radio" name="Default6" value=0 Checked>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font></div></td>
                      </tr>
					
					<!--- If there is No Default Info Show only Unique Info header text without radio button--->
			 		<cfelse>
				 
	                  <tr> 
                         <td valign="top" colspan="2"> 
                        <div align="left"> 
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font></div></td>
                      </tr>							
						<input type="HIDDEN" name="default6" value=0> 
					</cfif>
                </cfif>

			<!---Show Text box with Unique Information--->
			
     
			          <tr> 
                         <td height="33" width="50%"> 
                  <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                  <b>Image Height:</b></font> 
                    <input type="text" size="3" name="Height1" maxlength="3"  value="#trim(qGetShowcaseIndividualInfo.Height1)#">
                  </div>
                         </td>
                         <td height="33" width="50%"> 
                  <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                    <b>Image Width:</b></font> 
                    <input type="text" size="3" name="Width1" maxlength="3"  value="#trim(qGetShowcaseIndividualInfo.Width1)#">
                  </div>
                         </td>
                      </tr>
			    
		 <!---Mat Dimensions / Unmatted---> 	   
		
			    <!---  <br> --->
				 <!--- <table cellspacing="0" cellpadding="0"> --->
                      <tr> 
                         <td colspan="2">
					
					
					<br><img src="Images/BlackRule.gif" width=100% height=1 border="0"><br><br>
					<font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b> 
                Mat Dimensions (in inches):</b></font><br>
					     </td>
					  </tr>			  
                      <tr>
					     <td colspan="2">
			        <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
				    All photographs must be matted using archival mat board. We recommend that you use a professional
				  matter. Optionally we can mat your work for you, deducting our fee from your percentage. However, please indicate the size of the mat
				  here, regardless as to who mats your work. Use whole numbers only rounding to the nearest number.</font><br></td>
					  </tr>
			         <!---  <tr> --->
					
			  
			               <!---  <table cellspacing="0" cellpadding="0">  --->
<!--- 		        <cfif #qGetShowcaseIndividualInfo.default4# is 1 and 
				(#len(qGetShowcaseDefaultPhotos.MatHeight1)# is not 0 or #len(qGetShowcaseDefaultPhotos.MatWidth1)#  is not 0 ) or #qGetShowcaseDefaultPhotos.Unmatted# is 1 > --->
		        <cfif (len(trim(qGetShowcaseIndividualInfo.MatHeight1)) is 0 and len(trim(qGetShowcaseIndividualInfo.MatWidth1)) is 0 and qGetShowcaseIndividualInfo.Unmatted is 0)  and
				(#len(qGetShowcaseDefaultPhotos.MatHeight1)# is not 0 or #len(qGetShowcaseDefaultPhotos.MatWidth1)#  is not 0 ) or #qGetShowcaseDefaultPhotos.Unmatted# is 1 >                    <!--- If there is a Default show Radio Buttons/Default Info here --->
				      <tr> 
                         <td height="20" colspan="2"> 
                    <div align="left"> 
                      <input type="radio" name="Default4" value=1 checked>
                      <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                      Use Default:<font color="red"> 			 
<cfif #qGetShowcaseDefaultPhotos.unmatted# is "1">
Unmatted
<cfelse>
Mat Dimensions: 
#qGetShowcaseDefaultPhotos.MATHEIGHT1# x 
#qGetShowcaseDefaultPhotos.MATWIDTH1#
</cfif> 
				</font></font><br>
                    </div>
                         </td>
                      </tr>
                      <tr> 
                         <td colspan="2"> 
                        <div align="left"> 
                          <input type="radio" name="Default4" value=0>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font> </div>
                         </td>
                      </tr>			
                <cfelse>	  
				  <!--- If No Default, but there is Default Info, show radio buttons/Default Info ---> 
		 	
			<cfif (#len(qGetShowcaseDefaultPhotos.MatHeight1)# is not 0 or #len(qGetShowcaseDefaultPhotos.MatWidth1)#  is not 0 ) or #qGetShowcaseDefaultPhotos.Unmatted# is 1 >

				      <tr> 
					  <!--- addedthis colspan--->
                         <td height="20" colspan="2"> 
                    <div align="left"> 
                      <input type="radio" name="Default4" value=1 >
                      <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                      Use Default:<font color="red"> 
<cfif #qGetShowcaseDefaultPhotos.unmatted# is "1">
Unmatted
<cfelse>
Mat Dimensions: 
#qGetShowcaseDefaultPhotos.MATHEIGHT1# x 
#qGetShowcaseDefaultPhotos.MATWIDTH1#
</cfif>  
</font></font><BR>
                    </div>
                         </td>
                      </tr>
                      <tr> 
                         <td colspan="2"> 
                        <div align="left"> 
                          <input type="radio" name="Default4" value=0 checked>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font> </div>
                         </td>
                      </tr>
					
					<!--- If there is No Default Info Show only Unique Info header text without radio button--->
			 		<cfelse>
				 
	                  <tr> 
                         <td height="32" colspan="2"> 
                        <div align="left"> 
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font> </div>
                         </td>
                      </tr>							
					<input type="HIDDEN" name="default4" value=0> 
					</cfif>
                </cfif>				
						  
			  
			  
			          <tr>
                         <td height="33" width="50%"> 
                  <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><b>
				  Mat Height:</b></font> 
                    <input type="text" size="3" name="MatHeight1" maxlength="3"  value="#trim(qGetShowcaseIndividualInfo.MatHeight1)#">
                  </div>
                         </td>
                         <td height="33" width="50%">  
                  <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><b> 
					Mat Width:</b></font> 
                    <input type="text" size="3" name="MatWidth1" maxlength="3"  value="#trim(qGetShowcaseIndividualInfo.MatWidth1)#">
                  </div>
                         </td>
                      </tr>
			          <tr>
				         <td colspan="2">	  
				  <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">
				  All photographs must be matted. Occasionally artwork cannot be matted because of the process used. Check the box below 
				  if this is the case.<br>
				   	<cfif #qGetShowcaseIndividualInfo.Unmatted# is 1>
						<input type="checkbox" name="Unmatted" value="1" checked>
			  		<cfelse>
						<input type="checkbox" name="Unmatted" value="1">
					</cfif>
					<b>Unmatted</b></font></td>
				      </tr>
               </table>	
           		<br>
				
				
			<!---Price--->
				
            <img src="Images/BlackRule.gif" width=100% height=1 border="0"> <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b><br>
            Price</b> <font size="1">(U.S. Dollars)</font></font><br>
             <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Your prices should be the same everywhere. You 
                are responsible for updating any price increases. 
				</font>
				
				   <table cellspacing="0" cellpadding="0">
                     <cfif len(trim(qGetShowcaseIndividualInfo.Price1)) is 0  and  #qGetShowcaseDefaultPhotos.Price1# GT 0>
                    <!--- If there is a Default show Radio Buttons/Default Info here --->
				      <tr> 
                 	     <td height="20"> 
                    	<div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"> 
                    	  <input type="radio" name="Default7" value=1 checked>
                     	 <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">  Use Default: <font color="red"> #DOLLARFORMAT(qGetShowcaseDefaultPhotos.Price1)#</font></font></font></div>
                 	     </td>
                      </tr>
                      <tr> 
                         <td height="32"> 
                        <div align="left"> 
                          <input type="radio" name="Default7" value=0>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font> </div>
                         </td>
                      </tr>
                <cfelse>
				
				  <!--- If No Default, but there is Default Info, show radio buttons/Default Info --->
	               <cfif #qGetShowcaseDefaultPhotos.Price1# GT 0>
				      <tr> 
                         <td> 
                        <div align="left"> 
                          <input type="radio" name="Default7" value=1>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                          Use Default:<font color="red"> $#qGetShowcaseDefaultPhotos.Price1#</font></font></div>
                         </td>
                      </tr>
                      <tr> 
                         <td height="32"> 
                        <div align="left"> 
                          <input type="radio" name="Default7" value=0 checked>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font> </div>
                         </td>
                      </tr>
					
					<!--- If there is No Default Info Show only Unique Info header text without radio button--->
			 		<cfelse>
				 
	                  <tr> 
                         <td height="32"> 
                        <div align="left"> 
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font> </div>
                         </td>
                      </tr>							
					<input type="HIDDEN" name="Default7" value=0> 
					</cfif>
                </cfif>
				<!---Show Text box with Unique Information--->
					  <tr>
                         <td><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><font color="RED">DO NOT use a separator &quot;,&quot;, a $ sign, or a decimal point (whole numbers only). EG. Instead of $1,500.00 type 1500.<font color="BLACK"><BR><BR>&nbsp;<font size="2"><b>$ 
                      <input type="text" size="6" name="Price1" maxlength="7" value="#trim(qGetShowcaseIndividualInfo.Price1)#">
                      </b></font></font></FONT></font>
					     </td>
					  </tr>
                   </table>
				
                <br>
				<img src="Images/BlackRule.gif" width=100% height=1 border="0">				
		
				
			<!--- Edition Size --->		
				
            <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b><br>
            Limited Editions:</b></font> <br>
			<font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> If this print is part of a Limited Edition, include the Edition Number and Edition Size here.</font><br>
				   <table cellspacing="0" cellpadding="0">
                      <!--- Always show a default because the print will either be editioned or not. --->
                   
				      <tr> 
                 	     <td height="32"> 
                    	<div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2">
						<br> 
                    	  <cfif len(trim(#qGetShowcaseIndividualInfo.EditionSz1#)) is 0>
							   <input type="radio" name="Editionedx" value="1" checked> 
						  <cfelse>
						 	 <input type="radio" name="Editionedx" value="1"> 
						  </cfif>
                     	 <font size="1"> Use Default: 
						 <font color="red">
						 <cfif #qGetShowcaseDefaultPhotos.editioned1# is 1> 
						 	<cfif len(trim(#qGetShowcaseDefaultPhotos.editioned1#)) GT 0>
			Editioned  #qGetShowcaseDefaultPhotos.Editionno1#/#qGetShowcaseDefaultPhotos.Editionsz1#<br>
							<cfelse>
			Edition of #qGetShowcaseDefaultPhotos.Editionsz1#<br>						
							</cfif>						 	
						 <cfelse>
						 Not Editioned
						 </cfif>			
						 </font></font></font></div>
                 	     </td>
                      </tr>
                      <tr> 
                         <td height="32"> 
                        <div align="left"> 
                         <cfif len(trim(#qGetShowcaseIndividualInfo.EditionSz1#)) is 0>
						<!---  <input type="radio" name="Default5" value="0"> --->
						 <cfelse>
						<!--- <input type="radio" name="Default5" value="0" checked>  --->
						 </cfif>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><br>Unique to this print, fill in fields below:<br><br>

	                     <cfif #qGetShowcaseIndividualInfo.editioned1# is 1 and #qGetShowcaseIndividualInfo.default5# is 0>
						  <input type="radio" name="Editionedx" value="3">            
                          <b>Not Editioned</b><br>	
                         <input type="radio" name="Editionedx" value="2" checked>
                         <b>Editioned</b>
						    <cfelseif #qGetShowcaseIndividualInfo.editioned1# is 0 and #qGetShowcaseIndividualInfo.default5# is 0 and len(trim(#qGetShowcaseIndividualInfo.EditionSz1#)) GT 0>
						  <input type="radio" name="Editionedx" value="3">            
                         <b> Not Editioned</b><br>
                        <input type="radio" name="Editionedx" value="2" checked>
                          <b>Editioned</b>
						    <cfelse>
						  <input type="radio" name="Editionedx" value="3">            
                          <b>Not Editioned</b><br>
                         <input type="radio" name="Editionedx" value="2">
                          <b>Editioned</b>			  
						  </cfif>
						  
						  </font></div></td>
                      </tr>
				   </table> 
			
				   <table>
                      <tr> 
                         <td> <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><b>
                Print No.:</b>&nbsp;</font> 
                  <input type="text" size="4" name="EditionNo1" maxlength="4"  value="#trim(qGetShowcaseIndividualInfo.EditionNo1)#">
                         </td>
					     <td><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><b>
                   &nbsp;&nbsp;Ed. Size:</b>&nbsp;</font> 
                  <input type="text" size="4" name="EditionSz1" maxlength="4"  value="#trim(qGetShowcaseIndividualInfo.EditionSz1)#">
                         </td>
                      </tr>
                   </table> 
				
                <br>
				<img src="Images/BlackRule.gif" width=100% height=1 border="0">
				<br>
<!--- 				
			<!--- Edition Size --->		
				
            <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b><br>
            Limited Editions:</b></font> <br>
			<font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> If this print is part
			of a Limited Edition, include the Edition Number and Size here.</font><br>
				   <table cellspacing="0" cellpadding="0">
                     <cfif qGetShowcaseIndividualInfo.Default5 is 1 and  #qGetShowcaseIndividualInfo.editioned1# is 1>
                    <!--- If there is a Default show Radio Buttons/Default Info here --->
				      <tr> 
                 	     <td height="20"> 
                    	<div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2">
						<br> 
                    	  <input type="radio" name="Default5" value=1 checked>
                     	 <font size="1"> Use Default:<br>
						 <font color="red">
						 <cfif #qGetShowcaseDefaultPhotos.editioned1# is 1> 
						 	Edition Size: #qGetShowcaseDefaultPhotos.Editionsz1#<br>
						 	Print Number: 	#qGetShowcaseDefaultPhotos.Editionno1#
						 <cfelse>
						 Not Editioned
						 </cfif>			
						 </font></font></font></div>
                 	     </td>
                      </tr>
                      <tr> 
                         <td height="32"> 
                        <div align="left"> 
                          <input type="radio" name="Default5" value=0>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in fields below:</font></div></td>
                      </tr>
                <cfelse>
				
				  <!--- If No Default, but there is Default Info, show radio buttons/Default Info --->
	               <cfif #qGetShowcaseDefaultPhotos.EditionEd1# is 1>
				  
				      <tr> 
                         <td> 
                    	<div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"> 
                    	 <br>
						  <input type="radio" name="Default5" value=1 checked>
                     	 <font size="1"> Use Default:<br> 
						 <font color="red">
						 <cfif #qGetShowcaseDefaultPhotos.editioned1# is 1> 
						 	Edition Size: #qGetShowcaseDefaultPhotos.Editionsz1#<br>
						 	Print Number: #qGetShowcaseDefaultPhotos.Editionno1#
						 <cfelse>
						 Not Editioned
						 </cfif>			
						 </font></font></font></div>
                         </td>
                      </tr>
                      <tr> 
                         <td height="32"> 
                        <div align="left"> 
                          <input type="radio" name="Default5" value=0 checked>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in fields below:</font> </div></td>
                      </tr>
					
					<!--- If there is No Default Info Show only Unique Info header text without radio button--->
			 		<cfelse>
				 
	                  <tr> 
                         <td height="32"> 
                        <div align="left"> 
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in fields below:</font> </div></td>
                      </tr>							
					<input type="HIDDEN" name="Default5" value=0> 
					</cfif>
                </cfif>
			
				<!---Show Text box with Unique Information--->
        
		           <!--- <table cellspacing="0" cellpadding="0">	 --->
					
					  <tr> 
                         <td>
                        <div align="left"> 
						 <cfif #qGetShowcaseIndividualInfo.editioned1# is 1> 
                          <input type="radio" name="Editioned1" value=1 checked>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                          Editioned 
     					  
                          <input type="radio" name="Editioned1" value=0>
                          Not Editioned</font>
						  <cfelse>
	                          <input type="radio" name="Editioned1" value=1>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                          Editioned 
     					  
                          <input type="radio" name="Editioned1" value=0 checked>
                          Not Editioned</font>					  
						  </cfif>
						  </div>
                         </td>
                      </tr>
				   </table> 
			
				   <table>
                      <tr> 
                         <td> <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><b>
                Print No.:</b>&nbsp;</font> 
                  <input type="text" size="4" name="EditionNo1" maxlength="4"  value="#qGetShowcaseIndividualInfo.EditionNo1#">
                         </td>
					     <td><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><b>
                   &nbsp;&nbsp;Ed. Size:</b>&nbsp;</font> 
                  <input type="text" size="4" name="EditionSz1" maxlength="4"  value="#qGetShowcaseIndividualInfo.EditionSz1#">
                         </td>
                      </tr>
                   </table> 
				
                <br>
				<img src="Images/BlackRule.gif" width=100% height=1 border="0">
				<br>	 --->		
				
		<!--- Edition Pricing Structure --->
							
            <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b>Pricing Structure:</b><br>
            <font size="1">List any pricing structure for Editioned Prints</font><br>
			<font color="red" size="1">Note: You must include a &lt;br&gt; after each line.</font></font>
                   <table cellspacing="0" cellpadding="0">
                      <tr> 
                         <td><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Example:&nbsp;&nbsp;</font></td>
                         <td><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">1-10:</font></td>
                         <td><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">$600&lt;br&gt;</font></td>
                      </tr>
                      <tr> 
                         <td>&nbsp;</td>
                         <td><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">10-20:&nbsp;&nbsp;</font></td>
                         <td><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">$1,000&lt;br&gt;</font></td>
                      </tr>
                   </table>
			
			       <table cellspacing="0" cellpadding="0">
<!--- 			
			  <cfif qGetShowcaseIndividualInfo.Default8 is 1 and #len(qGetShowcaseDefaultPhotos.AddInfo1)# GT 0> --->
			  <cfif len(trim(qGetShowcaseIndividualInfo.AddInfo1)) is 0  and #len(qGetShowcaseDefaultPhotos.AddInfo1)# GT 0>	
	          <!--- If there is a Default show Radio Buttons/Default Info here --->
				       <tr> 
                 	      <td height="20"> 
                    	<div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"> 
                    	  <input type="radio" name="Default8" value=1 checked>
                     	 <font size="1"> Use Default: <font color="red"> #qGetShowcaseDefaultPhotos.AddInfo1#</font></font></font></div>
                 	      </td>
                      </tr>
                      <tr> 
                         <td height="32"> 
                        <div align="left"> 
                          <input type="radio" name="Default8" value=0>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in fields below:</font> </div></td>
                      </tr>
	
	               <cfelse>
				
				  <!--- If No Default, but there is Default Info, show radio buttons/Default Info --->
	               <cfif #len(qGetShowcaseDefaultPhotos.AddInfo1)# GT 0>
				      <tr> 
                         <td> 
                        <div align="left"> 
                          <input type="radio" name="Default8" value=1>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                          Use Default:<font color="red"> #qGetShowcaseDefaultPhotos.AddInfo1#</font></font></div>
                         </td>
                      </tr>
                      <tr> 
                         <td height="32"> 
                        <div align="left"> 
                          <input type="radio" name="Default8" value=0 checked>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font></div></td>
                      </tr>
					
					<!--- If there is No Default Info Show only Unique Info header text without radio button--->
			 		<cfelse>
				 
	                  <tr> 
                         <td height="32"> 
                        <div align="left"> 
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font></div></td>
                       </tr>							
					<input type="HIDDEN" name="Default8" value=0> 
					</cfif>
                </cfif>
	
			<!--- <table> --->
                      <tr> 
                         <td> 
                <font face="Verdana,Arial,Helvetica,sans-serif" color="black" size="1">	
            <textarea name="AddInfo1" rows=15 cols=32>#qGetShowcaseIndividualInfo.AddInfo1#</textarea>
				</font>
				         </td>
                      </tr>
			<!---   </table> --->
		           </table>
	 <!--- End of Right Column --->  
	 	        </td>
             </tr>	
	     </table> 
	
<!--- Begin Wide Bottom Table --->
	
         <table width="95%" border="0" cellpadding="5" bgcolor="##FFFFFF" cellspacing="0" valign="top" align="center">
		    <tr valign="top">
		        <td colspan="3" align="left">
		 <img src="Images/BlackRule.gif" width=100% height="1" alt="" border="0">      
                   <tr>
                      <td colspan="3"> 
 	<!--- Location --->
	
	
 	 <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b>Location:</b><br>
      <font size="1">If location is important in identifying your work, fill in 
      any or all of the fields below. Otherwise, choose <i>Not Applicable</i> in the drop-down box below.</font></font></td>
                   </tr>
                   <tr valign="top">
                      <td colspan="3" align="left"><!---       <table cellspacing="0" cellpadding="0" valign="top"> --->
<!---              <cfif #qGetShowcaseIndividualInfo.Default10# is 1 and (#len(qGetShowcaseDefaultPhotos.LocContin)# GT 0 or 
			 #len(qGetShowcaseDefaultPhotos.LocCountry)# GT 0 or 
			 #len(qGetShowcaseDefaultPhotos.LocRegion)# GT 0 or 
			 #len(qGetShowcaseDefaultPhotos.LocState)# GT 0 or 
			 #len(qGetShowcaseDefaultPhotos.LocCity)# GT 0)> --->
             <cfif (len(trim(qGetShowcaseIndividualInfo.LocContin)) is 0 
			 and len(trim(qGetShowcaseIndividualInfo.LocCountry)) is 0 
			 and len(trim(qGetShowcaseIndividualInfo.LocRegion)) is 0 
			 and len(trim(qGetShowcaseIndividualInfo.LocState)) is 0 
			 and len(trim(qGetShowcaseIndividualInfo.LocCity)) is 0 )
			 and (#len(qGetShowcaseDefaultPhotos.LocContin)# GT 0 or 
			 #len(qGetShowcaseDefaultPhotos.LocCountry)# GT 0 or 
			 #len(qGetShowcaseDefaultPhotos.LocRegion)# GT 0 or 
			 #len(qGetShowcaseDefaultPhotos.LocState)# GT 0 or 
			 #len(qGetShowcaseDefaultPhotos.LocCity)# GT 0)>              <!--- If there is a Default show Radio Buttons/Default Info here --->
<!--- 			  <tr valign="top"> 
                <td  valign="top">  --->
                  <div align="left"> 
                    <input type="radio" name="Default10" value=1 checked>
                    <font face="Verdana,Arial,Helvetica,sans-serif" color="Black" size="1"> 
                    Use Default:<br><font color="red">

<cfif #len(qGetShowcaseDefaultPhotos.LocContin)# GT 0>#qGetShowcaseDefaultPhotos.LocContin#<br></cfif>
<cfif #len(qGetShowcaseDefaultPhotos.LocCountry)# GT 0>#qGetShowcaseDefaultPhotos.LocCountry#<br></cfif>
<cfif #len(qGetShowcaseDefaultPhotos.LocRegion)# GT 0>#qGetShowcaseDefaultPhotos.LocRegion#<br></cfif>
<cfif #len(qGetShowcaseDefaultPhotos.LocState)# GT 0> #qGetShowcaseDefaultPhotos.LocState#<br></cfif>
<cfif #LEN(qGetShowcaseDefaultPhotos.LocCity)# GT 0>#qGetShowcaseDefaultPhotos.LocCity#<br></cfif>
</font></font></div><!---                 </td>
                    </tr>
                    <tr> 
                      <td height="32">  --->
                        <div align="left"> 
                          <input type="radio" name="Default10" value=0>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font></div>
						  <!---                       </td>
                    </tr>		 --->
			 
	               <cfelse>
				
				  <!--- If No Default, but there is Default Info, show radio buttons/Default Info --->
				   <cfif #Len(qGetShowcaseDefaultPhotos.LocContin)# is not 0 or 
				   #Len(qGetShowcaseDefaultPhotos.LocCountry)# is not 0 or 
				   #Len(qGetShowcaseDefaultPhotos.LocRegion)# is not 0 or 
				   #Len(qGetShowcaseDefaultPhotos.LocState)# is not 0 or 
				   #Len(qGetShowcaseDefaultPhotos.LocCity)# is not 0>
<!--- 				        <tr> 
                      <td>  --->
                        <div align="left"> 
                          <input type="radio" name="Default10" value=1>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                    Use Default:<br><font color="red">

<cfif #len(qGetShowcaseDefaultPhotos.LocContin)# GT 0>#qGetShowcaseDefaultPhotos.LocContin#<br></cfif>
<cfif #len(qGetShowcaseDefaultPhotos.LocCountry)# GT 0>#qGetShowcaseDefaultPhotos.LocCountry#<br></cfif>
<cfif #len(qGetShowcaseDefaultPhotos.LocRegion)# GT 0>#qGetShowcaseDefaultPhotos.LocRegion#<br></cfif>
<cfif #len(qGetShowcaseDefaultPhotos.LocState)# GT 0> #qGetShowcaseDefaultPhotos.LocState#<br></cfif>
<cfif #LEN(qGetShowcaseDefaultPhotos.LocCity)# GT 0>#qGetShowcaseDefaultPhotos.LocCity#<br></cfif>
</font></font></div><!---                 </td>
                    </tr>
                    <tr> 
                      <td height="32">  --->
                        <div align="left"> 
                          <input type="radio" name="Default10" value=0 checked>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font> </div><!---                       </td>
                    </tr>	 --->	 
			 
					
					<!--- If there is No Default Info Show only Unique Info header text without radio button--->
			 		<cfelse>
<!--- 				 
	                    <tr> 
                      <td height="32">  --->
                        <div align="left"> 
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font> </div><!---                       </td>
                    </tr>	 --->						
					<input type="HIDDEN" name="Default10" value=0> 
					</cfif>
                </cfif>
                      </td>
                   </tr>
                   <tr valign="top"> 
                      <td align="left" Width="50%" height="185"><p><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><b>Continent:</b><br>
              <br>
              <select name="LocContin" size="1">
                <option value=""  <CFIF #qGetShowcaseIndividualInfo.LocContin# is "">SELECTED</CFIF>>Select Continent 
				<option value="Not Applicable"  <CFIF #qGetShowcaseIndividualInfo.LocContin# is "Not Applicable">SELECTED</CFIF>>Not Applicable 
				<option value="North America" <CFIF #qGetShowcaseIndividualInfo.LocContin# is "North America">SELECTED</CFIF>>North America 
                <option value="South America" <CFIF #qGetShowcaseIndividualInfo.LocContin# is "South America">SELECTED</CFIF>>South America 
                <option value="Europe" <CFIF #qGetShowcaseIndividualInfo.LocContin# is "Europe">SELECTED</CFIF>>Europe 
                <option value="Asia" <CFIF #qGetShowcaseIndividualInfo.LocContin# is "Asia">SELECTED</CFIF>>Asia 
                <option value="Africa" <CFIF #qGetShowcaseIndividualInfo.LocContin# is "Africa">SELECTED</CFIF>>Africa 
                <option value="Australia" <CFIF #qGetShowcaseIndividualInfo.LocContin# is "Australia">SELECTED</CFIF>>Australia 
                <option value="Antartica" <CFIF #qGetShowcaseIndividualInfo.LocContin# is "Antartica">SELECTED</CFIF>>Antartica 
              </select>
              </font></p><p><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><b>Country:</b> 
        example - India<br>
        <input type="text" size="30" name="LocCountry" maxlength="75"  value="#trim(qGetShowcaseIndividualInfo.LocCountry)#">
        </font> <br>
      </p>
	                  </td>
	                  <td height="185" width="1"><img src="Images/BlackRule.gif" width=1 height=100% alt="" border="0">
	                  </td>
	                  <td valign="top" height="185">
      <p><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">
        <b>Region:</b> example - Southwest<br>
        <input type="text" size="30" name="LocRegion" maxlength="75"  value="#trim(qGetShowcaseIndividualInfo.LocRegion)#">
        </font></p><p><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><b>State:</b> 
        example - New Mexico<br>
        </font><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
        <input type="text" size="30" name="LocState" maxlength="75"  value="#trim(qGetShowcaseIndividualInfo.LocState)#">
        <br>
        <br>
        <br>
        </font><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><b>City:</b> 
        example - Taos<br>
        <input type="text" size="30" name="LocCity" maxlength="75" value="#trim(qGetShowcaseIndividualInfo.LocCity)#">
        </font></p>
	                  </td>
                   </tr>
   
                   <tr>     
                      <td colspan="3" align="left"> <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b> 
      </b></font> 
      <img src="Images/BlackRule.gif" width=100% height="1" alt="" border="0"> 
	  
	  
	  <!--- Keywords --->
	  
	  
      <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b> 
      Subject Keywords:</b><br>
      <font size="1">This section is <font color="red">very important</font> as 
      it will help distinguish your work in subject keyword searches.  Include up to 10
      keywords that describe your work, <b>excluding</b> <b>Location</b>, <b>Format</b>, and <b>Genre</b>. Ask yourself which words if entered into our search engine would retrieve your own images.  No profanity or racial slurs may be used to describe this image. <b>Separate each keyword, or two word phrase, with a comma.</b> <font color="Red">When appropriate, use the plural of the word (eg. boys instead of boy, children instead of child). 
      <br>
      Example 1 - <font color="##000000">Abstract, Light, Color, 
      Dreams</font><br>
      Example 2 -<font color="##000000"> Nudes, Female, Formal, Abstract</font><br>
      Example 3 -<font color="##000000"> Wildlife, Eagles, Natural Habitat, Animals, 
      Endangered Species</font><br>
      Example 4 -<font color="##000000"> Indigenous People, Women, Men</font></font>, 
      Endangered Cultures, Tribal<br>
      <br>
      Please seperate each word with a comma and a space following the example.<br>
                         <table cellspacing="0" cellpadding="0">
<!---            <cfif qGetShowcaseIndividualInfo.Default11 is 1 and #len(CompiledKeywords)# is not 0> --->
	           <cfif  #len(CompiledKeywords)# is not 0 and #len(compiledUniqueKeywords)# is 0>	   <!--- If there is a Default show Radio Buttons/Default Info here --->
                            <tr> 
                               <td> 
                  <div align="left"> 
                    <input type="radio" name="Default11" value=1 checked>
                    <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                    Use Default: <font color="red"> #CompiledKeywords#</font></font></div>
				               </td>
			                </tr>
                            <tr> 
                               <td> 
                        <div align="left"> 
                          <input type="radio" name="Default11" value=0>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in fields below:</font></div></td>
			                </tr>

  	          <cfelse>
				
				  <!--- If No Default, but there is Default Info, show radio buttons/Default Info --->
	               <cfif #len(CompiledKeywords)# is not 0>
				            <tr> 
                               <td> 
                        <div align="left"> 
                          <input type="radio" name="Default11" value=1>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                          Use Default:<font color="red"> #CompiledKeywords#</font></font></div>
				               </td>
				            </tr>
                            <tr> 
                               <td height="32"> 
                        <div align="left"> 
                          <input type="radio" name="Default11" value=0 checked>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font></div></td>
				            </tr>
					
					<!--- If there is No Default Info Show only Unique Info header text without radio button--->
			 		<cfelse>
				 
	                        <tr> 
                               <td height="32"> 
                        <div align="left"> 
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font></div></td>
				            </tr>							
					<input type="HIDDEN" name="Default11" value=0> 
					</cfif>
                </cfif>  
                         </table>
	  
	  <br>
   		   		<textarea name="Keywords" rows=3 cols=60>#compiledUniqueKeywords#</textarea>
    		  	</font></font>
<!--- 	            </tr>
	         </td> --->

                         <table width="100%" border="0" cellpadding="0" bgcolor="##FFFFFF" cellspacing="0" valign="top" align="center">
                            <tr> 
                               <td align="center">
              <hr color="black" size="1">			  
			  <table border="0" cellpadding="0" cellspacing="0"><tr><td height="50" valign="middle">
			  <input type="HIDDEN" name="changed" value=1> 
			  <input type="HIDDEN" name="id" value="Sequence"> 
			 <!---  <input type="HIDDEN" name="imagecounternumber" value=#URL.imagenumbercounter#> --->
			  <!--- Already above --->
			  <!---<input type="HIDDEN" name="imagenumber" value=#URL.imagenumber#> --->
			  <input type="HIDDEN" name="imagecounter" value=#URL.imagenumber#>
			  <input type="HIDDEN" name="imagenumbercounter" value=#URL.imagenumber#>
    		  <input type="SUBMIT" value="Save Changes" name="SUBMIT">              
			</td></tr></table> 
             <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"><br>
               <center><br>
                <FONT FACE="Arial, Helvetica, Sans-Serif" size="2"><IMG SRC="images/photoeyebooks&prints.gif" WIDTH=308 HEIGHT=28 BORDER=0><br>
                376 Garcia Street, Santa Fe, NM 87501<br>
                Orders Only: 800-227-6941 Info: 505-988-5152 Fax: 505-988-4487<br>
                E-Mail: <a href="mailto:webmaster@photoeye.com">webmaster@photoeye.com</a><br>
                © photo-eye books &amp; prints, #YEAR(Now())#. All Rights Reserved.</font> 
                <FONT FACE="Arial, Helvetica, Sans-Serif" size="1">This entire 
                web site is the © copyrighted property of photo-eye books &amp; 
                prints, except where artists' and publishers' copyrights on the 
                materials described take precedence. No portion of the contents 
                within may be reproduced in any form, for any non-private use, 
                without the express written permission of photo-eye books &amp; 
                prints.<br>
                <br>
                </font></center>
                               </td>
	                        </tr>
                            <tr> 
                               <td>&nbsp;
                               </td>
	                        </tr>   
	       		         </table>
				      </td>
                   </tr>
				</td>
		     </tr>
	      </table> 
		 
      </td>
   </tr>
</table>
<cfif qGetShowcaseSetup.MultiArtists is 1>
       <INPUT TYPE="HIDDEN" NAME="firstname_required" VALUE="You must enter the artist's first name.">
	   
	 <INPUT TYPE="HIDDEN" NAME="lastname_required" VALUE="You must enter the artist's last name.">
	 
</cfif>

</FORM>
</BODY>
</HTML>
</cfoutput>
