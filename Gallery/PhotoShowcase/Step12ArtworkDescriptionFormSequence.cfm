	  
<CFQUERY NAME="qGetShowcaseSetup"
         DATASOURCE="photoeyecom">

SELECT *
FROM GallerySetup
WHERE Custnumber = #URL.Custnumber# <!---#URL.RecordID#--->

</CFQUERY>

<CFQUERY NAME="qGetShowcasePortfolio"
         DATASOURCE="photoeyecom">

SELECT *
FROM GalleryPortfolio
WHERE Custnumber = #URL.Custnumber# and SubDirectory='#URL.Portfolio#'
</cfquery>


<CFQUERY NAME="qGetShowcaseDefaultPhotos"
         DATASOURCE="photoeyecom">

SELECT *
FROM GalleryDefaultPhotos
WHERE Custnumber = #URL.Custnumber# <!---#URL.RecordID#--->

</CFQUERY>
<CFQUERY NAME="qGetShowcaseIndividualInfo"
         DATASOURCE="photoeyecom">

SELECT *
FROM GalleryIndividualPhotos
WHERE Custnumber = #URL.Custnumber# AND ImageNumber=#URL.ImageNumber#
</CFQUERY>
<!--- Get Default Keywords and Compile them for the default ---> 
<CFQUERY NAME="qGetShowcaseDefaultKeywords"
         DATASOURCE="photoeyecom">
SELECT *
FROM GalleryKeywords
WHERE Custnumber = #URL.Custnumber# and DefaultKW=1
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
SELECT *
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
VALUES (#URL.Custnumber#, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
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




<table width="85%" bgcolor="##FFFFFF"  align="center">
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
            is the same as the information on the <a href="Step11DefaultTemplateURL.cfm?custnumber=#URL.Custnumber#">Default 
            Information Template Page</a> then leave the field blank and choose 
            <b>Use Default</b>. Fill out a page for each artwork that 
            has been accepted.</font></td>
            </tr>
            <tr valign="top"> 
               <td colspan="3" align="LEFT"></td>
            </tr>
            <tr valign="top"> 
               <td width="49%" valign="top" align="left" height="221"> 
            <p>
			<img src="../../#qGetShowcaseSetup.Gallery#/Artists/#qGetShowcaseSetup.Subdirectory#/#qGetShowcasePortfolio.SubDirectory#/Images_Small/image#imagenumber#.JPG"></p><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Image #imagenumber# 
			  	<input type="HIDDEN" name="Imagenumber" value=#imagenumbercounter#>
				<input type="HIDDEN" name="Custnumber" value=#custnumber#>  </b></font><br>
                <br>
               
			    <!---Title--->
				
				<font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b>
                Image Title: </b>&nbsp;&nbsp;&nbsp; </font><br>
                
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
		           		<input type="text" size="40" maxlength="75" name="Title" value="#qGetShowcaseIndividualInfo.title#"></td>				   </tr>
                   </table>
				
                <br>
				<img src="Images/BlackRule.gif" width=100% height=1 border="0">
                <br>
			
			
			  <!---Medium--->
				

				<font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b>
                Medium: </b>&nbsp;&nbsp;&nbsp; </font><br>
                
				   <table cellspacing="0" cellpadding="0">
                  <cfif qGetShowcaseIndividualInfo.Default2 is 1 and (#Len(qGetShowcaseDefaultPhotos.medium)# is not 0 or #Len(qGetShowcaseDefaultPhotos.Othermed)# is not 0)>
                    <!--- If there is a Default show Radio Buttons/Default Info here --->
				      <tr> 
                         <td>
                        <div align="left"> 
                          <input type="radio" name="Default2" value=1 checked>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                          Use Default:<font color="red">
						  <cfif #Len(qGetShowcaseDefaultPhotos.medium)# is not 0>
						 		#qGetShowcaseDefaultPhotos.medium#
						  </cfif> 
							  <cfif #Len(qGetShowcaseDefaultPhotos.OtherMed)# is not 0>
						 		#qGetShowcaseDefaultPhotos.OtherMed#
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
						  <cfif #Len(qGetShowcaseDefaultPhotos.medium)# is not 0>
						  	 #qGetShowcaseDefaultPhotos.medium#<br>
						  <cfelse>
						 	 #qGetShowcaseDefaultPhotos.othermed#
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
							<option value="" <CFIF #qGetShowcaseIndividualInfo.Medium# is "">SELECTED</CFIF>>Select Medium
                  			<option value="Albumen Print" <CFIF #qGetShowcaseIndividualInfo.Medium# is "Albumen Print">SELECTED</CFIF>>Albumen Print 
                 			<option value="Black & White" <CFIF #qGetShowcaseIndividualInfo.Medium# is "Black & White">SELECTED</CFIF>>Black &amp; White 
                 			<option value="Chromogenic Print" <CFIF #qGetShowcaseIndividualInfo.Medium# is "Chromogenic Print">SELECTED</CFIF>>Chromogenic Print 
                  			<option value="Cibachrome Print"  <CFIF #qGetShowcaseIndividualInfo.Medium# is "Cibachrome Print">SELECTED</CFIF>>Cibachrome Print 
                  			<option value="Color" <CFIF #qGetShowcaseIndividualInfo.Medium# is "Color">SELECTED</CFIF>>Color 
                  			<option value="Daguerreotype" <CFIF #qGetShowcaseIndividualInfo.Medium# is "Daguerreotype">SELECTED</CFIF>>Daguerreotype 
                  			<option value="Gelatin-Silver Print"  <CFIF #qGetShowcaseIndividualInfo.Medium# is "Gelatin-Silver Print">SELECTED</CFIF>>Gelatin-Silver Print 
                  			<option value="Iris Print" <CFIF #qGetShowcaseIndividualInfo.Medium# is "Iris Print">SELECTED</CFIF>>Iris Print 
                  			<option value="Mixed Media" <CFIF #qGetShowcaseIndividualInfo.Medium# is "Mixed Media">SELECTED</CFIF>>Mixed Media 
                  			<option value="Montage" <CFIF #qGetShowcaseIndividualInfo.Medium# is "Montage">SELECTED</CFIF>>Montage
                  			<option value="Photocollage"  <CFIF #qGetShowcaseIndividualInfo.Medium# is "Photocollage">SELECTED</CFIF>>Photocollage 
                  			<option value="Photogram" <CFIF #qGetShowcaseIndividualInfo.Medium# is "Photogram">SELECTED</CFIF>>Photogram 
                  			<option value="Photogravure" <CFIF #qGetShowcaseIndividualInfo.Medium# is "Photogravure">SELECTED</CFIF>>Photogravure 
                  			<option value="Platinum Print" <CFIF #qGetShowcaseIndividualInfo.Medium# is "Platinum Print">SELECTED</CFIF>>Platinum Print 
                  			<option value="Polaroid" <CFIF #qGetShowcaseIndividualInfo.Medium# is "Polaroid">SELECTED</CFIF>>Polaroid 
                  			<option value="TinType" <CFIF #qGetShowcaseIndividualInfo.Medium# is "TinType">SELECTED</CFIF>>TinType 
                  			<option value="Contact Print" <CFIF #qGetShowcaseIndividualInfo.Medium# is "Contact Print">SELECTED</CFIF>>Contact Print 
                  			<!--- <option value="Other" <CFIF #qGetShowcaseIndividualInfo.Medium# is "Other">SELECTED</CFIF>>Other  --->
                		</select>
                <br><br>
                <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><b>Other:</b> If your medium is not listed above, please define the process used:</font><br>
                <input type="text" size="35" maxlength="75" name="OtherMed"  value="#qGetShowcaseIndividualInfo.OtherMed#"></td>				  </tr>
                   </table>
                
				
				<br>
				<img src="Images/BlackRule.gif" width=100% height=1 border="0">
        		<br>
				
				<!---Year Produced --->
				
                <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b>Year 
                Produced: </b></font><br>
					<font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Include the date the original
				negative, transparency, digital file, or artwork was produced.
				This may differ from the date of the print (not required) 
				being offered for sale.</font><br> 
                
				   <table cellspacing="0" cellpadding="0">
               	<cfif qGetShowcaseIndividualInfo.default3 is 1 and #Len(qGetShowcaseDefaultPhotos.YearProd)# is not 0>
                    <!--- If there is a Default show Radio Buttons/Default Info here --->
				      <tr> 
                         <td> 
                        <div align="left"> 
                          <input type="radio" name="default3" value=1 checked>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                          Use Default:<font color="red"> #qGetShowcaseDefaultPhotos.YearProd#</font></font></div></td>
                      </tr>
                      <tr> 
                         <td height="32"> 
                        <div align="left"> 
                          <input type="radio" name="default3" value=0>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font></div></td>
                      </tr>
                <cfelse>
				
				  <!--- If No Default, but there is Default Info, show radio buttons/Default Info --->
	               <cfif #Len(qGetShowcaseDefaultPhotos.YearProd)# is not 0>
				      <tr> 
                         <td> 
                        <div align="left"> 
                          <input type="radio" name="default3" value=1>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                          Use Default:<font color="red"> #qGetShowcaseDefaultPhotos.YearProd#</font></font></div></td>
                      </tr>
                      <tr> 
                          <td height="32"> 
                        <div align="left"> 
                          <input type="radio" name="default3" value=0 checked>
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
						    <input type="text" size="4" maxlength="4" name="YearProd"  value="#qGetShowcaseIndividualInfo.YearProd#"></td>
					  </tr>
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
                
	
               	<cfif qGetShowcaseIndividualInfo.default9 is 1 and #Len(qGetShowcaseDefaultPhotos.Genre1)# is not 0>
                    <!--- If there is a Default show Radio Buttons/Default Info here --->
				      <tr> 
                         <td> 
                        <div align="left"> 
                          <input type="radio" name="default9" value=1 checked>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                          Use Default:<font color="red"> #qGetShowcaseDefaultPhotos.Genre1#</font></font></div></td>
                      </tr>
                      <tr> 
                         <td height="32"> 
                        <div align="left"> 
                          <input type="radio" name="default9" value=0>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">Unique to this print, fill in field below:</font></div></td>
                      </tr>
                <cfelse>
				
				  <!--- If No Default, but there is Default Info, show radio buttons/Default Info --->
	               <cfif #Len(qGetShowcaseDefaultPhotos.Genre1)# is not 0>
				      <tr> 
                         <td> 
                        <div align="left"> 
                          <input type="radio" name="default9" value=1>
                          <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                          Use Default:<font color="red"> #qGetShowcaseDefaultPhotos.Genre1#</font></font></div></td>
                      </tr>
                      <tr> 
                         <td height="32"> 
                        <div align="left"> 
                          <input type="radio" name="default9" value=0 checked>
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
                  <option value="Cityscape" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Cityscape">SELECTED</CFIF>>Cityscape 
                  <option value="Conceptual" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Conceptual">SELECTED</CFIF>>Conceptual
                  <option value="Documentary" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Documentary">SELECTED</CFIF>>Documentary 
                  <option value="Fashion" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Fashion">SELECTED</CFIF>>Fashion 
                  <option value="Figurative" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Figurative">SELECTED</CFIF>>Figurative 
                  <option value="Landscape" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Landscape">SELECTED</CFIF>>Landscape 
                  <option value="Nudes" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Nudes">SELECTED</CFIF>>Nudes 
                  <option value="Photojournalism" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Photojournalism">SELECTED</CFIF>>Photojournalism 
                  <option value="Photomontage" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Photomontage">SELECTED</CFIF>>Photomontage 
                  <option value="Pictorialism" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Pictorialism">SELECTED</CFIF>>Pictorialism
                  <option value="Portraiture" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Portraiture">SELECTED</CFIF>>Portraiture 
                  <option value="Still Life" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Still Life">SELECTED</CFIF>>Still Life 
                  <option value="Street Photography" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Street Photography">SELECTED</CFIF>>Street Photography 
                  <!--- <option value="Other" <CFIF #qGetShowcaseIndividualInfo.Genre1# is "Other">SELECTED</CFIF>>Other  --->
                </select>
                <br>
                <br>
                <b>Other Genre:</b> If there is not an appropriate choice above, please define the genre of this photograph:<br>
                <input type="text" size="35" name="Genre2"  value="#qGetShowcaseIndividualInfo.Genre2#" maxlength="75">
                </font></td>
				
				      </tr>
                   </table>		
				   
				 <br>
				<img src="Images/BlackRule.gif" width=100% height=1 border="0">
                <br>			
		
				<!---Print Availability--->
				
                <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b>Image Availability:</b></font><br>
					<font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">If this image is no longer available for sale, please choose the reason why. This usually only applies to unique artwork or editioned prints in which the entire edition has sold out.</font><br>        
   
  <b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">
  <input type="radio" name="NotAvailable" value="0" <cfif #qGetShowcaseIndividualInfo.NotAvailable# is "0"> checked </cfif>>
  Available for Sale<br>		 
  <input type="radio" name="NotAvailable" value="1" <cfif #qGetShowcaseIndividualInfo.NotAvailable# is "1"> checked </cfif>>
  Sold<br>
  <input type="radio" name="NotAvailable" value="2" <cfif #qGetShowcaseIndividualInfo.NotAvailable# is "2"> checked </cfif>>
  Reserved<br>
  <input type="radio" name="NotAvailable" value="3" <cfif #qGetShowcaseIndividualInfo.NotAvailable# is "3"> checked </cfif>>
  Not for Sale</font></b> 
				

				
		<!---Right Column--->
             
          <td width="2%" valign="top" align="left"><img src="Images/BlackRule.gif" width=1 height=100% alt="" border="0"> 
          </td>
		  
		
		
          <!---Print Dimensions---> 
		  
		  
		  <td valign="top" align="left" width="50%"> <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b> 
            Image Dimensions (in inches):</b><br>
            <font size="1">Place all basic default print information in the 
                spaces provided below. All dimensions must be in inches. Measure the
				actual image size (eg. 7x9 (even though image is printed on 8x10 paper). 
				<font color="red">Do not include inch marks (&quot;).<br>
            <br></font></font></font>
                
			      <table cellspacing="0" cellpadding="0"> 
               	<cfif #qGetShowcaseIndividualInfo.default6# is 1 and 
				(#len(qGetShowcaseDefaultPhotos.Height1)# is not 0 or #len(qGetShowcaseDefaultPhotos.Width1)#  is not 0)>

                    <!--- If there is a Default show Radio Buttons/Default Info here --->
				      <tr> 
                         <td colspan="2"> 
                    <div align="left"> 
                      <input type="radio" name="Default6" value=1 checked>
                      <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                     Use Default: <font color="red"> Image Dimensions: #qGetShowcaseDefaultPhotos.height1# x 
#qGetShowcaseDefaultPhotos.width1#<br> 
				</font></font><BR></div>
                         </td>
                      </tr>
                      <tr> 
                         <td colspan="2"> 
                        <div align="left"> 
                          <input type="radio" name="default6" value=0>
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
                          <input type="radio" name="default6" value=0 Checked>
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
                    <input type="text" size="3" name="Height1" maxlength="3"  value="#qGetShowcaseIndividualInfo.Height1#">
                  </div>
                         </td>
                         <td height="33" width="50%"> 
                  <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                    <b>Image Width:</b></font> 
                    <input type="text" size="3" name="Width1" maxlength="3"  value="#qGetShowcaseIndividualInfo.Width1#">
                  </div>
                         </td>
                      </tr>
			    
		 <!---Mat Dimensions / Unmatted---> 	   
		
			    <!---  <br> --->
				 <!--- <table cellspacing="0" cellpadding="0"> --->
                      <tr> 
                         <td colspan="2">
					
					
					<img src="Images/BlackRule.gif" width=100% height=1 border="0"><br><br>
					<font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b> 
                Mat Dimensions (in inches):</b></font><br>
					     </td>
					  </tr>			  
                      <tr>
					     <td colspan="2">
			        <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
				    All photographs must be matted using archival mat board. We recommend that you use a professional
				  matter. Optionally we can mat your work for you, deducting our fee from your percentage. However, please indicate the size of the mat
				  here, regardless as to who mats your work.</font><br></td>
					  </tr>
			         <!---  <tr> --->
					
			  
			               <!---  <table cellspacing="0" cellpadding="0">  --->
		        <cfif #qGetShowcaseIndividualInfo.default4# is 1 and 
				(#len(qGetShowcaseDefaultPhotos.MatHeight1)# is not 0 or #len(qGetShowcaseDefaultPhotos.MatWidth1)#  is not 0 ) or #qGetShowcaseDefaultPhotos.Unmatted# is 1 >
                    <!--- If there is a Default show Radio Buttons/Default Info here --->
				      <tr> 
                         <td height="20" colspan="2"> 
                    <div align="left"> 
                      <input type="radio" name="Default4" value=1 checked>
                      <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                      Use Default:<font color="red"> 			 
<cfif #qGetShowcaseDefaultPhotos.unmatted# is "1">
Unmatted, Ready to Display
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
                          <input type="radio" name="default4" value=0>
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
                          <input type="radio" name="default4" value=0 checked>
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
                    <input type="text" size="3" name="MatHeight1" maxlength="3"  value="#qGetShowcaseIndividualInfo.MatHeight1#">
                  </div>
                         </td>
                         <td height="33" width="50%">  
                  <div align="left"><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><b> 
					Mat Width:</b></font> 
                    <input type="text" size="3" name="MatWidth1" maxlength="3"  value="#qGetShowcaseIndividualInfo.MatWidth1#">
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
					<b>Unmatted, Ready to Display</b></font></td>
				      </tr>
               </table>	
           		<br>
				
				
			<!---Price--->
				
            <img src="Images/BlackRule.gif" width=100% height=1 border="0"> <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b><br>
            Price</b> <font size="1">(U.S. Dollars)</font></font><br>
             <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">You 
                are responsible for updating any price increases. 
				</font>
				
				   <table cellspacing="0" cellpadding="0">
                     <cfif qGetShowcaseIndividualInfo.Default7 is 1 and  #qGetShowcaseDefaultPhotos.Price1# GT 0>
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
                      <input type="text" size="6" name="Price1" maxlength="7" value="#qGetShowcaseIndividualInfo.Price1#">
                      </b></font></font></FONT></font>
					     </td>
					  </tr>
                   </table>
				
                <br>
				<img src="Images/BlackRule.gif" width=100% height=1 border="0">				
		
				
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
				<br>
		<!--- Edition Pricing Structure --->
							
            <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b>Pricing Structure:</b><br>
            <font size="1">List any pricing structure for Editioned Prints</font><br>
			<font color="red" size="1">Note: You must include a &lt;br&gt; after each line.</font></font>
                   <table cellspacing="0" cellpadding="0" width="248">
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
			
			  <cfif qGetShowcaseIndividualInfo.Default8 is 1 and #len(qGetShowcaseDefaultPhotos.AddInfo1)# GT 0>
	
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
            <textarea name="AddInfo1" rows=8 cols=32>#qGetShowcaseIndividualInfo.AddInfo1#</textarea>
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
		        <td colspan="5" align="left">
		 <img src="Images/BlackRule.gif" width=100% height="1" alt="" border="0">      
                   <tr>
                      <td> 
 	<!--- Location --->
	
	
 	 <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b>Location:</b><br>
      <font size="1">If location is important in identifying your work, fill in 
      any or all of the fields below:</font></font></td>
                   </tr>
                   <tr valign="top">
                      <td colspan="5" align="left"><!---       <table cellspacing="0" cellpadding="0" valign="top"> --->
             <cfif #qGetShowcaseIndividualInfo.Default10# is 1 and (#len(qGetShowcaseDefaultPhotos.LocContin)# GT 0 or 
			 #len(qGetShowcaseDefaultPhotos.LocCountry)# GT 0 or 
			 #len(qGetShowcaseDefaultPhotos.LocRegion)# GT 0 or 
			 #len(qGetShowcaseDefaultPhotos.LocState)# GT 0 or 
			 #len(qGetShowcaseDefaultPhotos.LocCity)# GT 0)>
              <!--- If there is a Default show Radio Buttons/Default Info here --->
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
                      <td align="left" Width="49%" height="185"><p><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><b>Continent:</b><br>
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
        <input type="text" size="30" name="LocCountry" maxlength="75"  value="#qGetShowcaseIndividualInfo.LocCountry#">
        </font> <br>
      </p>
	                  </td>
	                  <td height="185"><img src="Images/BlackRule.gif" width=1 height=100% alt="" border="0">
	                  </td>
	                  <td valign="top" height="185" width="49%"> 
      <p><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">
        <b>Region:</b> example - Southwest<br>
        <input type="text" size="30" name="LocRegion" maxlength="75"  value="#qGetShowcaseIndividualInfo.LocRegion#">
        </font></p><p><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><b>State:</b> 
        example - New Mexico<br>
        </font><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
        <input type="text" size="30" name="LocState" maxlength="75"  value="#qGetShowcaseIndividualInfo.LocState#">
        <br>
        <br>
        <br>
        </font><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><b>City:</b> 
        example - Taos<br>
        <input type="text" size="30" name="LocCity" maxlength="75" value="#qGetShowcaseIndividualInfo.LocCity#">
        </font></p>
	                  </td>
                   </tr>
   
                   <tr>     
                      <td colspan="3" align="left"> <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b> 
      </b></font> 
      <img src="Images/BlackRule.gif" width=100% height="1" alt="" border="0"> 
	  
	  
	  <!--- Keywords --->
	  
	  
      <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b> 
      Keywords:</b><br>
      <font size="1">This section is <font color="red">very important</font> as 
      it will help distinguish your work in keyword searches. Include as many 
      keywords that describe your work, <b>excluding</b> <b>Location</b> and <b>Genre</b>. When appropriate, include the plural of the word (eg. boys instead of boy, children instead of child). 
      <br>
      <font color="red">Example 1 - <font color="##000000">Abstract, Light, Color, 
      Dreams</font><br>
      Example 2 -<font color="##000000"> Nudes, Female, Formal, Abstract</font><br>
      Example 3 -<font color="##000000"> Wildlife, Eagles, Natural Habitat, Animals, 
      Endangered Species</font><br>
      Example 4 -<font color="##000000"> Indigenous People, Women, Men</font></font>, 
      Endangered Cultures, Tribal<br>
      <br>
      Please seperate each word with a comma and a space following the example.<br>
                         <table cellspacing="0" cellpadding="0">
           <cfif qGetShowcaseIndividualInfo.Default11 is 1 and #len(CompiledKeywords)# is not 0>
		   <!--- If there is a Default show Radio Buttons/Default Info here --->
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

                         <table width="95%" border="0" cellpadding="5" bgcolor="##FFFFFF" cellspacing="0" valign="top" align="center">
                            <tr> 
                               <td align="center" colspan="3">
              <hr color="black" size="1">
              <center>
			  

			  <input type="HIDDEN" name="changed" value=1> 
			  <input type="HIDDEN" name="id" value="Sequence"> 
			 <!---  <input type="HIDDEN" name="imagecounternumber" value=#URL.imagenumbercounter#> --->
			  <!--- Already above --->
			  <!---<input type="HIDDEN" name="imagenumber" value=#URL.imagenumber#> --->
			  <input type="HIDDEN" name="imagecounter" value=#URL.imagenumber#>
			  <input type="HIDDEN" name="imagenumbercounter" value=#URL.imagenumber#>
    		  <input type="SUBMIT" value="Save Changes" name="SUBMIT">              

          
 <!--- <INPUT TYPE="SUBMIT" VALUE="Cancel this Form"> ---> 
 
              <p><img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"><br>
                <br>
                <FONT FACE="Arial, Helvetica, Sans-Serif" size="2"><IMG SRC="images/photoeyebooks&prints.gif" WIDTH=308 HEIGHT=28 BORDER=0><br>
                376 Garcia Street, Santa Fe, NM 87501<br>
                Orders Only: 800-227-6941 Info: 505-988-5152 Fax: 505-988-4487<br>
                E-Mail: <a href="mailto:webmaster@photoeye.com">webmaster@photoeye.com</a><br>
                © photo-eye books &amp; prints, 2001. All Rights Reserved.</font> 
                <FONT FACE="Arial, Helvetica, Sans-Serif" size="1">This entire 
                web site is the © copyrighted property of photo-eye books &amp; 
                prints, except where artists' and publishers' copyrights on the 
                materials described take precedence. No portion of the contents 
                within may be reproduced in any form, for any non-private use, 
                without the express written permission of photo-eye books &amp; 
                prints.<br>
                <br>
                </font></p></center>
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
                     

</FORM>
</BODY>
</HTML>
</cfoutput>
