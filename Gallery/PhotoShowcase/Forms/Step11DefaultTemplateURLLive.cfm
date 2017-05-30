<CFQUERY NAME="qGetShowcaseDefaultInfo"
         DATASOURCE="photoeyecom">

SELECT *
FROM GalleryDefaultPhotos
WHERE Custnumber = #URL.Custnumber# and SubDirectory='#URL.Portfolio#'

</CFQUERY>

<CFQUERY NAME="qGetShowcasePortfolio"
         DATASOURCE="photoeyecom">

SELECT *
FROM GalleryPortfolio
WHERE Custnumber = #URL.Custnumber# and SubDirectory='#URL.Portfolio#'
</cfquery>

<CFQUERY NAME="qGetShowcaseDefaultKeywords"
         DATASOURCE="photoeyecom">
SELECT *
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



<!--- Insert Default Record if it is not already there --->

<!--- <CFIF  there is no portfolio> --->
<CFIF #qGetShowcaseDefaultInfo.RECORDCOUNT# is 0>
<CFQUERY NAME="qInsert"
         DATASOURCE="photoeyecom">
INSERT INTO
GalleryDefaultPhotos (Custnumber, SubDirectory)
VALUES (#URL.Custnumber#, '#URL.Portfolio#')
</CFQUERY>

<!--- Now requery database to get the new custnumber--->
<CFQUERY NAME="qGetShowcaseDefaultInfo"
         DATASOURCE="photoeyecom">

SELECT *
FROM GalleryDefaultPhotos
WHERE Custnumber = #URL.Custnumber# and SubDirectory='#URL.Portfolio#'

</CFQUERY>

</cfif>

<cfoutput> 
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">

<html>

<head>
<title>Artwork Description Template - Default</title>
</head>

<body bgcolor="Gray" link="##000080" vlink="##000080">
<div align="center"><center>
<form method="post" action="Step11Errorcheck.cfm?portfolio=#url.portfolio#">
<br>
    <table width="85%" bgcolor="##FFFFFF" align="center">
      	<tr>
			<td align="center">
  
	          
          		<table width="95%" border="0" cellpadding="5" bgcolor="##FFFFFF" cellspacing="0" valign="top" align="center">
            		<tr valign="top"> 
              			<td colspan="3" align="left"><br>
                <img src="../SharedImages/photo-eye%20Explore%20NewLogo_photoShowcaseVersionWhiteBackground.jpg" width="151" height="94">			</td>
            		</tr>
            		<tr> 
              			<td colspan="3" align="LEFT"> <font face="Verdana,Arial,Helvetica,sans-serif" size="4">Step 
                11 - Artwork Template</font><font face="Verdana,Arial,Helvetica,sans-serif" size="5"><br>
                <font size="2">This information will be used as the default information 
                for each of your images, unless you choose to override it.<br>
                <br>
                <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"></font></font></td>
            		</tr>
            		<tr> 
              			<td colspan="3" align="left"> <font face="Verdana,Arial,Helvetica,sans-serif" color="BLACK" size="1">To 
                speed up data entry and reduce redundancy, this information will 
                be used as the template for all of your images unless you choose 
                to override it. On this page include the basic information that 
                will be used for most or all of your pictures. For example, if 
                all of your images are gelatin-silver, include that information 
                here under <b>medium</b>. There is no need to repeat this information 
                on the pages describing each individual artwork if they are all 
                the same.  However this information may be overridden for particular images in Step 12.</font><br>
				<font face="Verdana,Arial,Helvetica,sans-serif" size="1"><font color="red"><br>
                    *</font> Signifies a required field</font><br>
				<hr size="1" noshade color="black">
							</td>
            		</tr>
            		<tr> 
              				<td width="49%" valign="top"> <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b>
                Portfolio Title:<br>
                </b><font size="1"> 
				This is an optional way to identify your work. 
				Since you may have more than one portfolio in your Showcase, choose 
a title that is specific to this body of work. This title will appear in various
Showcase Directories and Seach Engine results. If you do not give this portfolio a title, then it will automatically be given a generic name such as Portfolio 1.<br><br>
<font color="Red">Examples:</font><br> 
1. China Series<br>
2. Life in Iran</font></font><br><br><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><b>This Portfolio Title:</b></font><br>
                <input type="text" size="40" maxlength="100" name="PortfolioName" value="#trim(qGetShowcaseDefaultInfo.PortfolioName)#">
                <br>
                		<!---  <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"> --->
                <br>       <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b>
     Portfolio Introduction:<br>
                </b><font size="1"> 
				If you have a preface or introduction for your portfolio, include it here. <font color="red">Use mixed case only (not ALL CAPS). Remember, in order to create blank lines between paragraphs on the web, you must include the following tag between each paragraph: &lt;br&gt;&lt;br&gt;</font>
				</font></font><br>
<!--- 				<font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><b>This Portfolio Title:</b></font><br> --->
 <textarea name="PortfolioIntro" rows="5" cols="40">#qGetShowcasePortfolio.PortfolioIntro#</textarea>
	 
	 <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0">


                <br>       <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b>
                General Print Information:<br></b></font><br>
				<font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><b> Image Title:</b><font size="1"> (Example: Untitled)<br>Use mixed case for title with no period (.) at the end. <b>For Example</b>: Edge of Sky and Ocean, Port Authur, Texas</font></font><br>
                <input type="text" size="40" maxlength="75" name="Title"value="#trim(qGetShowcaseDefaultInfo.Title)#">
                <br><br>
								          
  				                        
                <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><b>Year 
                Produced:</b><br>
					Include the date the original
				negative, transparency, digital file, or artwork was produced.
				This may differ from the date of the print (not required) 
				being offered for sale.</font><br> 
                <input type="text" size="6" maxlength="4" name="YearProd" value="#trim(qGetShowcaseDefaultInfo.YearProd)#">
           
		       		 <br><br>
					 
                <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><b>Copyright Date: </b><br>
					Include the copyright date for most or all of your images. Generally, this is the date that the work was first published.</font><br> 
                <input type="text" size="6" maxlength="4" name="Copyright" value="#trim(qGetShowcaseDefaultInfo.Copyright)#">
               		 <br><br>
		   
		   
		   
		   
					 <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"><br><br>
                <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><b>
                Process: <font color="red">*</font></b></font><br>
		           		  <select name="Medium" size="1">
							<option value="" <CFIF #qGetShowcaseDefaultInfo.Medium# is "">SELECTED</CFIF>>Select Process
                  			<option value="Albumen Print" <CFIF #qGetShowcaseDefaultInfo.Medium# is "Albumen Print">SELECTED</CFIF>>Albumen Print 
                  			<option value="Carbon" <CFIF #qGetShowcaseDefaultInfo.Medium# is "Carbon Print">SELECTED</CFIF>>Carbon Print
<!---                  			<option value="Black & White" <CFIF #qGetShowcaseDefaultInfo.Medium# is "Black & White">SELECTED</CFIF>>Black &amp; White ---> 
                 			<option value="Chromogenic Print" <CFIF #qGetShowcaseDefaultInfo.Medium# is "Chromogenic Print">SELECTED</CFIF>>Chromogenic Print 
                  			<option value="Cibachrome Print"  <CFIF #qGetShowcaseDefaultInfo.Medium# is "Cibachrome Print">SELECTED</CFIF>>Cibachrome Print 
                  			<option value="Cyanotype Print"  <CFIF #qGetShowcaseDefaultInfo.Medium# is "Cyanotype Print">SELECTED</CFIF>>Cyanotype Print 
<!---                   			<option value="Color" <CFIF #qGetShowcaseDefaultInfo.Medium# is "Color">SELECTED</CFIF>>Color  --->
                  			<option value="Daguerreotype" <CFIF #qGetShowcaseDefaultInfo.Medium# is "Daguerreotype">SELECTED</CFIF>>Daguerreotype
                  			<option value="Dye Transfer Print" <CFIF #qGetShowcaseDefaultInfo.Medium# is "Dye Transfer Print">SELECTED</CFIF>>Dye Transfer Print
                  			<option value="Fresson Print"  <CFIF #qGetShowcaseDefaultInfo.Medium# is "Fresson Print">SELECTED</CFIF>>Fresson Print
                  			<option value="Gelatin-Silver Print"  <CFIF #qGetShowcaseDefaultInfo.Medium# is "Gelatin-Silver Print">SELECTED</CFIF>>Gelatin-Silver Print
                  			<option value="Toned Gelatin-Silver Print"  <CFIF #qGetShowcaseDefaultInfo.Medium# is "Toned Gelatin-Silver Print">SELECTED</CFIF>>Toned Gelatin-Silver Print  
                  			<option value="Gicl&eacute;e Print"  <CFIF #qGetShowcaseDefaultInfo.Medium# is "Gicl&eacute;e Print">SELECTED</CFIF>>Gicl&eacute;e Print
                  			<option value="Iris Print" <CFIF #qGetShowcaseDefaultInfo.Medium# is "Iris Print">SELECTED</CFIF>>Iris Print 
                  			<option value="Mixed Media" <CFIF #qGetShowcaseDefaultInfo.Medium# is "Mixed Media">SELECTED</CFIF>>Mixed Media
                  			<option value="Montage" <CFIF #qGetShowcaseDefaultInfo.Medium# is "Montage">SELECTED</CFIF>>Montage
							<option value="Photocollage"  <CFIF #qGetShowcaseDefaultInfo.Medium# is "Photocollage">SELECTED</CFIF>>Photocollage 
                  			<option value="Photogram" <CFIF #qGetShowcaseDefaultInfo.Medium# is "Photogram">SELECTED</CFIF>>Photogram 
                  			<option value="Photogravure" <CFIF #qGetShowcaseDefaultInfo.Medium# is "Photogravure">SELECTED</CFIF>>Photogravure 
                  			<option value="Platinum/Palladium Print" <CFIF #qGetShowcaseDefaultInfo.Medium# is "Platinum/Palladium Print">SELECTED</CFIF>>Platinum/Palladium Print 
                  			<option value="Polaroid" <CFIF #qGetShowcaseDefaultInfo.Medium# is "Polaroid">SELECTED</CFIF>>Polaroid 
                  			<option value="TinType" <CFIF #qGetShowcaseDefaultInfo.Medium# is "TinType">SELECTED</CFIF>>TinType 
                  			<option value="Contact Print" <CFIF #qGetShowcaseDefaultInfo.Medium# is "Contact Print">SELECTED</CFIF>>Contact Print 
                  			 <option value="Other Process" <CFIF #qGetShowcaseDefaultInfo.Medium# is "Other Process">SELECTED</CFIF>>Other Process
                		</select>
                <br><br>
                <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">           <b>Other Process:</b>    If none of the above process are appropriate, choose <b>Other Process</b> from the above list and define your Process below. Your work will be included in the Process directory under the heading  <b>Other Process</b>.<br></font>
                <input type="text" size="40" maxlength="75" name="OtherMed" value="#trim(qGetShowcaseDefaultInfo.OtherMed)#">
                <br>

		 <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0">      
                <br>
				
				<font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><b>Genre: <font color="red">*</font></b><br>
                <font size="1">How would you describe the main body of your work? 
                Choose a Genre to describe the majority of your work. This may be overridden for particular images in Step 12.<br>
                <br>
                <select name="Genre1" size="1">
                  <option value="" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "">SELECTED</CFIF>>Select Genre 
                  <option value="Abstract" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Abstract">SELECTED</CFIF>>Abstract 
                  <option value="Architecture" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Architecture">SELECTED</CFIF>>Architecture 
				<option value="Astronomical" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Astronomical">SELECTED</CFIF>>Astronomical 
<!---                   <option value="Cityscape" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Cityscape">SELECTED</CFIF>>Cityscape  --->
                  <option value="Conceptual" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Conceptual">SELECTED</CFIF>>Conceptual
					<option value="Constructed" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Constructed">SELECTED</CFIF>>Constructed 
                  <option value="Documentary" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Documentary">SELECTED</CFIF>>Documentary 
   		          <option value="Fashion" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Fashion">SELECTED</CFIF>>Fashion 
                  <option value="Figurative" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Figurative">SELECTED</CFIF>>Figurative
                  <option value="Landscape" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Landscape">SELECTED</CFIF>>Landscape 
                  <option value="Nudes" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Nudes">SELECTED</CFIF>>Nudes 
					<option value="Narrative" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Narrative">SELECTED</CFIF>>Narrative 
                  <option value="Photojournalism" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Photojournalism">SELECTED</CFIF>>Photojournalism 
                  <option value="Photomontage" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Photomontage">SELECTED</CFIF>>Photomontage 
                  <option value="Pictorialism" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Pictorialism">SELECTED</CFIF>>Pictorialism
                  <option value="Portraiture" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Portraiture">SELECTED</CFIF>>Portraiture
                  <option value="Scientific" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Scientific">SELECTED</CFIF>>Scientific 
                  <option value="Snapshot" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Snapshot">SELECTED</CFIF>>Snapshot
                  <option value="Social Landscape" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Social Landscape">SELECTED</CFIF>>Social Landscape 
                  <option value="Still Life" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Still Life">SELECTED</CFIF>>Still Life 
                  <option value="Street Photography" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Street Photography">SELECTED</CFIF>>Street Photography 
                  <option value="Urban Landscape" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Urban Landscape">SELECTED</CFIF>>Urban Landscape
                  <option value="Unclassified" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Unclassified">SELECTED</CFIF>>Unclassified
                   <option value="Other Genre" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Other Genre">SELECTED</CFIF>>Other Genre
                </select><br><br>
            <b>Other Genre:</b>    If none of the above genres are appropriate, choose <b>Other Genre</b> from the above list and define your genre below. Your work will be included in the Genre directory under the heading entitled <b>Other Genres</b>.<br>
                <input type="text" size="40" name="Genre2" maxlength="75" value="#trim(qGetShowcaseDefaultInfo.Genre2)#"> 
                </font></font>
              
			    <br>
		 <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0">      
                <br> 
			  
	
			
				<font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><b>Format: <font color="red">*</font></b><br>
                <font size="1">What camera format or type do you use? Choose the most specific type. For example, you may use a 35mm Widelux to take panoramic photographs. Choose Panoramic not Small - 35 mm.  This may be overridden for particular images in Step 12.<br>
                <br>
                 <select name="Format1" size="1">
                  <option value="" <CFIF #qGetShowcaseDefaultInfo.Format1# is "">SELECTED</CFIF>>Select Format
<!---                   <option value="Not Appropriate" <CFIF #qGetShowcaseDefaultInfo.Format1# is "Not Appropriate">SELECTED</CFIF>>Not Appropriate ---> 
                  <option value="Miniature" <CFIF #qGetShowcaseDefaultInfo.Format1# is "Miniature Format">SELECTED</CFIF>>Miniature - Smaller than 35mm
                  <option value="Small Format" <CFIF #qGetShowcaseDefaultInfo.Format1# is "Small Format">SELECTED</CFIF>>Small - 35mm
                  <option value="Medium Format" <CFIF #qGetShowcaseDefaultInfo.Format1# is "Medium Format">SELECTED</CFIF>>Medium Format
                  <option value="Large Format" <CFIF #qGetShowcaseDefaultInfo.Format1# is "Large Format">SELECTED</CFIF>>Large - View Camera
                  <option value="Banquet Camera" <CFIF #qGetShowcaseDefaultInfo.Format1# is "Banquet Camera">SELECTED</CFIF>>Banquet 
                  <option value="Mammoth Camera" <CFIF #qGetShowcaseDefaultInfo.Format1# is "Mammoth Camera">SELECTED</CFIF>>Mammoth 
                  <option value="Digital Photography" <CFIF #qGetShowcaseDefaultInfo.Format1# is "Digital Photography">SELECTED</CFIF>>Digital 
                  <option value="Plastic Camera" <CFIF #qGetShowcaseDefaultInfo.Format1# is "Plastic Camera">SELECTED</CFIF>>Plastic 
                  <option value="Pinhole Photography" <CFIF #qGetShowcaseDefaultInfo.Format1# is "Pinhole Photography">SELECTED</CFIF>>Pinhole 
                  <option value="Stereo Photography" <CFIF #qGetShowcaseDefaultInfo.Format1# is "Stereo Photography">SELECTED</CFIF>>Stereo 
                  <option value="Panoramic Photography" <CFIF #qGetShowcaseDefaultInfo.Format1# is "Panoramic Photography">SELECTED</CFIF>>Panoramic
                  <option value="Cameraless" <CFIF #qGetShowcaseDefaultInfo.Format1# is "Cameraless">SELECTED</CFIF>>Cameraless 
                  <option value="Unclassified" <CFIF #qGetShowcaseDefaultInfo.Format1# is "Unclassified">SELECTED</CFIF>>Unclassified
                  <option value="Other Format" <CFIF #qGetShowcaseDefaultInfo.Format1# is "Other Format">SELECTED</CFIF>>Other Format
                </select> <br><br>
               <b>Other Format</b>: If none of the above formats or camera types are appropriate, choose <b>Other Format</b> from the above list and define your format below. Your work will be included in the Format directory under the heading entitled <b>Other Formats</b>.<br>
                <input type="text" size="40" name="Format2" maxlength="75" value="#trim(qGetShowcaseDefaultInfo.Format2)#"> 
                </font></font>				  
				 <br>
				<img src="Images/BlackRule.gif" width=100% height=1 border="0">
                <br>	
					
							<!---Print Availability--->
				
                <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b>Image Availability:</b></font><br>
					<font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">If most of these images are no longer available for sale, please choose the reason why. This usually only applies to unique artwork or editioned prints in which the entire edition has sold out.</font><br>        
   
  <b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">
  <input type="radio" name="NotAvailable" value="0" <cfif #qGetShowcaseDefaultInfo.NotAvailable# is "0"> checked </cfif>>
  Available for Sale<br>		 
  <input type="radio" name="NotAvailable" value="1" <cfif #qGetShowcaseDefaultInfo.NotAvailable# is "1"> checked </cfif>>
  Not for Sale - Sold Out<br>
  <input type="radio" name="NotAvailable" value="2" <cfif #qGetShowcaseDefaultInfo.NotAvailable# is "2"> checked </cfif>>
  Not for Sale - Reserved<br>
  <input type="radio" name="NotAvailable" value="3" <cfif #qGetShowcaseDefaultInfo.NotAvailable# is "3"> checked </cfif>>
  Not for Sale - Other<br>
<!---    <input type="radio" name="NotAvailable" value="4" <cfif #qGetShowcaseDefaultInfo.NotAvailable# is "4"> checked </cfif>>
Do Not Display on Site --->
  </font></b> 
				
			  				</td>
              
			          		<td width="2%" valign="top" align="left"  height="100%"><img src="Images/BlackRule.gif" width=1 height="100%" alt="" border="0"> 
          					</td>
			  
              				<td valign="top" width="49%">
			  
                <table>
					<tr>
						<td colspan="2"> 
				<font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b> 
				Print Dimensions:</b> <font size="1">(in inches)</font><br>
                <font size="1">Place all basic default print information in the 
                spaces provided below. All dimensions must be in inches. Use whole numbers only rounding to the nearest whole number (no decimal points or fractions are allowed). Measure the actual image size not the paper size (eg. 7x9 even though image is printed on 8x10 paper). 
				<font color="red">Do not include inch marks (&quot;).</font></font></font><br>
						</td>
					</tr>
                  	<tr> 
                    	<td><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                      <b>Image Height:</b>&nbsp;</font> 
                      <input type="text" size="3" name="Height1" maxlength="3" value="#trim(qGetShowcaseDefaultInfo.Height1)#">
                    	</td>
                    	<td><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                      <b>Image Width:</b>&nbsp;</font> 
                      <input type="text" size="3" name="Width1" maxlength="3" value="#trim(qGetShowcaseDefaultInfo.Width1)#"><br>
						</td>
                  </tr>
				  <tr>
				   		<td colspan="2">
					 <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0">
					<br><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b> 
                Mat Dimensions: </b><font size="1">(in inches)</font></font><br>
					    </td>
				</tr>			  
                 <tr>
					    <td colspan="2">
			        <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
				    All photographs must be matted using archival mat board. We recommend that you use a professional matter. Optionally we can mat your work for you, deducting our fee from your percentage. <font color="Red">However, please indicate the size of the mat here, regardless as to who mats your work. Use whole numbers only rounding to the nearest number.</font></font>
				  
				  		</td>
				</tr>

				<tr>
					 	<td width="50%" height="33"><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><b>Mat Height:</b>&nbsp;</font> 
                      <input type="text" size="3" name="MatHeight1" maxlength="3" value="#trim(qGetShowcaseDefaultInfo.MatHeight1)#">
                    	</td>
                   		<td width="50%" height="33"><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><b> 
                      Mat Width:</b>&nbsp;</font> 
                      <input type="text" size="3" name="MatWidth1" maxlength="3" value="#trim(qGetShowcaseDefaultInfo.MatWidth1)#">
						</td>
				</tr>
			  	<tr> 
						<td COLSPAN="2">	  
				  <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1">
				  All photographs must be matted. Occasionally artwork cannot be matted because of the process used. Check the box below 
				  if this is the case.<br>
				  
			    	<cfif #qGetShowcaseDefaultInfo.Unmatted# is 1>
						<input type="checkbox" name="Unmatted" value="1" checked>
			  		<cfelse>
						<input type="checkbox" name="Unmatted" value="1">
					</cfif>
					 <b>Ready to Display</b> (print cannot be matted)</font>
			  			</td> 
				</tr>
			</table>
        
            <table>
                  <tr> 
						<td>
					 <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0">
					<br><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b> 
                    Price:</b> <font size="1">(U.S. Dollars)</font></font><br>
					
					<font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><font color="red">Your prices should be the same everywhere. You 
                are responsible for updating any price increases. <font color="Black">DO NOT use a separator ",", a $ sign, or a decimal point. EG. Instead of $1,500.00 type 1500.<BR><BR>&nbsp;<font size="2"><b>$ 
                      <input type="text" size="6" name="Price1" maxlength="7" value="#trim(qGetShowcaseDefaultInfo.Price1)#">
                      </b></font></font></FONT></font>
					  </td> 
                  </tr>
              </table>
                		 <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0">
				<br>
                <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b>Edition Size:</b><br>
				<font size="1" color="red">1/25 (1 is the 1st print of the edition, 25 is the edition size)</font></font>
				<table width="229">
                  <tr> 
  				 <CFIF #qGetShowcaseDefaultInfo.EditionEd1# is 1>
                    	<td> 
                      <div align="left"> 
					  
                        <input type="radio" name="EditionEd1"value="0">
                        <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><b> 
                        Not Editioned</b>&nbsp;</font> </div>
                    	</td>
                    	<td> 
                      <div align="left"> 
                        <input type="radio" name="EditionEd1" value="1" checked>
                        <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><b> 
                        Editioned</b>&nbsp;</font> </div>
                    	</td>
				 <CFELSE>
                    	<td> 
                      <div align="left"> 
					  
                        <input type="radio" name="EditionEd1"value="0" checked>
                        <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><b> 
                        Not Editioned</b>&nbsp;</font> </div>
                    	</td>
                    	<td> 
                      <div align="left"> 
                        <input type="radio" name="EditionEd1" value="1">
                        <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><b> 
                        Editioned</b>&nbsp;</font> </div>
                    	</td>
				 </CFIF>
                  </tr>
               </table>
		       <table>
                 	 <tr> 
                    	<td> <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><b>Print No.:</b>&nbsp;</font> 
                      <input type="text" size="4" name="EditionNo1" maxlength="4" value="#trim(qGetShowcaseDefaultInfo.EditionNo1)#">
                    	</td>
                    	<td>
					
					 <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><b>Ed.
                      Size:</b>&nbsp;</font> 
                      <input type="text" size="4" name="EditionSz1" maxlength="4" value="#trim(qGetShowcaseDefaultInfo.EditionSz1)#">
                    	</td>

                  	</tr>
               </table>
                <img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0">
                <br><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b>Print Sizes or Ltd. Ed. Price Structure:<br></b>
				  <font size="1">If prints are offered in different sizes apart from the standard size you've already input, then list that information below. If prints are editioned, list the pricing structure below.<font color="red" size="1">Note: You must include a &lt;br&gt; after each line and two breaks &lt;br&gt;&lt;br&gt; to make a blank line.</font></font></font>
	<table cellspacing="0" cellpadding="0" width="248">
                  <tr> 
                    <td><font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"><b>Example:</b>
<br>11&quot;x14&quot;&lt;br&gt;<br>
1-10: $600&lt;br&gt;<br>
11-20: $1,000&lt;br&gt;<br>
&lt;br&gt;&lt;br&gt;<br>
16&quot;x20&quot;&lt;br&gt;<br>
1-10: $1,00&lt;br&gt;<br>
11-20 $2,000&lt;br&gt;<br>
&lt;br&gt;&lt;br&gt;</font>
					</td>
				</tr>
			</table>
                
				
				<textarea cols="32" rows="20" name="AddInfo1">#qGetShowcaseDefaultInfo.AddInfo1#</textarea> <br>
            			</td>
                     </tr>
			
		           </table>
	 <!--- End of Right Column  and center table--->  
	 	       
	
<!--- Begin Wide Bottom Table --->
	
         <table width="95%" border="0" cellpadding="5" bgcolor="##FFFFFF" cellspacing="0" valign="top" align="center">
		    <tr valign="top">
		        <td colspan="3" align="left">
		 <img src="Images/BlackRule.gif" width=100% height="1" alt="" border="0">      
                   
 	<!--- Location ---> <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b> 
                		 
        <br>Location:</b><br>
                <font size="1">If location is important in identifying your work, fill in 
      any or all of the fields below. Otherwise, choose <i>Not Applicable</i> in the drop-down box below.  This may be overridden for particular images in Step 12.</font></font>
</td>
            </tr>
            <tr> 
              <td align="left"> <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                <b>Continent:</b> example - Asia<br>
                <br>
                <select name="LocContin" size="1">
                  <option value="" <CFIF #qGetShowcaseDefaultInfo.LocContin# is "">SELECTED</CFIF>>Select Continent
				<option value="Not Applicable"  <CFIF #qGetShowcaseDefaultInfo.LocContin# is "Not Applicable">SELECTED</CFIF>>Not Applicable 
                  <option value="North America" <CFIF #qGetShowcaseDefaultInfo.LocContin# is "North America">SELECTED</CFIF>>North America
                  <option value="South America" <CFIF #qGetShowcaseDefaultInfo.LocContin# is "South America">SELECTED</CFIF>>South America
                  <option value="Europe" <CFIF #qGetShowcaseDefaultInfo.LocContin# is "Europe">SELECTED</CFIF>>Europe
                  <option value="Asia" <CFIF #qGetShowcaseDefaultInfo.LocContin# is "Asia">SELECTED</CFIF>>Asia
                  <option value="Africa" <CFIF #qGetShowcaseDefaultInfo.LocContin# is "Africa">SELECTED</CFIF>>Africa
                  <option value="Australia" <CFIF #qGetShowcaseDefaultInfo.LocContin# is "Australia">SELECTED</CFIF>>Australia
                  <option value="Antartica" <CFIF #qGetShowcaseDefaultInfo.LocContin# is "Antartica">SELECTED</CFIF>>Antartica
                  <option value="Not Applicable" <CFIF #qGetShowcaseDefaultInfo.LocContin# is "Not Applicable">SELECTED</CFIF>>Not Applicable
                </select>
                <br>
                <br>
                <b>Country:</b> example - India<br>
                <input type="text" size="30" name="LocCountry" maxlength="75" value="#trim(qGetShowcaseDefaultInfo.LocCountry)#">
                <br>
                <br>
                <b>Region:</b> example - Bandereas<br>
                <input type="text" size="30" name="LocRegion" maxlength="75" value="#trim(qGetShowcaseDefaultInfo.LocRegion)#">
                </font> </TD>
              <td>&nbsp;</td>
              <td> <br>
                <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="1"> 
                <b>State:</b> example - New Mexico<br>
                <input type="text" size="30" name="LocState" maxlength="75" value="#trim(qGetShowcaseDefaultInfo.LocState)#">
                <br>
                <br>
                <b>City:</b> example - Taos<br>
                <input type="text" size="30" name="LocCity" maxlength="75" value="#trim(qGetShowcaseDefaultInfo.LocCity)#">
                <br>
                <br>
                </font><br>
                <br>
              </td>
            </tr>
            <tr> 
              <td colspan="3" align="left"> 
                <hr width="100%" size="1" align="left">
                <font face="Verdana,Arial,Helvetica,sans-serif" color="##000000" size="2"><b><br>
                Subject Keywords:</b><br>
                <font size="1">This section is <font color="red">very important</font> as 
      it will help distinguish your work in subject keyword searches.  Include up to 10 keywords that describe your work, <b>excluding</b> <b>Location</b>, <b>Format</b>, and <b>Genre</b>. Ask yourself which words if entered into our search engine would retrieve your own images.  No profanity or racial slurs may be used to describe this image. <b>Separate each keyword, or two word phrase, with a comma.</b> <font color="Red">When appropriate, use the plural of the word (eg. boys instead of boy, children instead of child). <br>
                <br>
               Example 1 - <font color="##000000">Abstract, Light, Color, 
      Dreams</font><br>
      Example 2 -<font color="##000000"> Nudes, Female, Formal, Abstract</font><br>
      Example 3 -<font color="##000000"> Wildlife, Eagles, Natural Habitat, Animals, 
      Endangered Species</font><br>
      Example 4 -<font color="##000000"> Indigenous People, Women, Men</font></font>, 
      Endangered Cultures, Tribal<br>
                <br>
                Please separate each word with a comma and a space following the 
                example.<br>
                <textarea cols="60" rows="3" name="Keywords">#CompiledKeywords#</textarea>             
                </font></font></td>
            </tr>
            <tr> 
              <td colspan="3" align="center"> 
                <hr width="100%" size="1" noshade>
                <br>
                <center>
					<input type="HIDDEN" name="Custnumber" value="#qGetShowcaseDefaultInfo.Custnumber#">

                   <INPUT TYPE="SUBMIT" VALUE="Save Changes">
				   </center> 
               
                <hr color="black" size="1">
                <FONT FACE="Arial, Helvetica, Sans-Serif" size="2"><IMG SRC="images/photoeyebooks&prints.gif" WIDTH=308 HEIGHT=28 BORDER=0><br>
                376 Garcia Street, Santa Fe, NM 87501<br>
                Orders Only: 800-227-6941 Info: 505-988-5152 Fax: 505-988-4487<br>
                E-Mail: <a href="mailto:webmaster@photoeye.com">webmaster@photoeye.com</a><br>
                © photo-eye books &amp; prints, #YEAR(Now())#. All Rights Reserved.</font> 
                <br>
                <FONT FACE="Arial, Helvetica, Sans-Serif" size="1">This entire 
                web site is the © copyrighted property of photo-eye books &amp; 
                prints, except where artists' and publishers' copyrights on the 
                materials described take precedence. No portion of the contents 
                within may be reproduced in any form, for any non-private use, 
                without the express written permission of photo-eye books &amp; 
                prints.</font>
				</td>
            </tr>
          </table>
</td></tr>
</table>
</form>
</center>
</div>
</body>
</html>
</cfoutput>

