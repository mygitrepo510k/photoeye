<CFQUERY NAME="qGetShowcaseDefaultInfo"
         DATASOURCE="photoeyecom">

SELECT *
FROM GalleryDefaultPhotos
WHERE Custnumber = #URL.Custnumber# <!---#URL.RecordID#--->

</CFQUERY>

<CFIF #qGetShowcaseDefaultInfo.CUSTNUMBER# is "">
<CFQUERY NAME="qInsert"
         DATASOURCE="photoeyecom">
INSERT INTO
GalleryDefaultPhotos (Custnumber)
VALUES (#URL.Custnumber#)
</CFQUERY>
</cfif>


<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">

<html>

<head>
<title>Artwork Description Template - Default</title>
</head>

<body bgcolor="Gray" link="#000080" vlink="#000080">
<div align="center"><center>
<form method="post" action="Step11Errorcheck.cfm">
<br>
    <table width="85%" bgcolor="White" background="Images/WhiteBackground.gif" align="center">
      <tr><td align="center">
  
	          
          <table width="95%" border="0" cellpadding="5" bgcolor="#FFFFFF" background="Images/WhiteBackground.gif" cellspacing="0" valign="top" align="center">
            <tr valign="top"> 
              <td colspan="3" align="left"><br>
                <img src="../SharedImages/photo-eye%20Explore%20NewLogo_photoShowcaseVersionWhiteBackground.jpg" width="151" height="94"></td>
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
                the same.</font><br>
				<font face="Verdana,Arial,Helvetica,sans-serif" size="1"><font color="red"><br>
                    *</font> Signifies a required field</font><br>
				<hr size="1" noshade color="black"></td>
            </tr>
            <tr> 
              <td width="49%" valign="top"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><b>General 
                Print Information:<br>
                <br>
                <font size="1">Portfolio Name: <font color="red">*</font></font></b><font size="1"> This will be used to identify your portfolio throughout the Showcase site. Since you may have more than one portfolio, choose 
a title that would make sense to someone who is looking at each of 
your portfolios.<br>
Example 1: China Series,  Example 2: Life in Iran</font></font><br>
                <input type="text" size="30" maxlength="100" name="PortfolioName"<CFOUTPUT>value="#qGetShowcaseDefaultInfo.PortfolioName#"</CFOUTPUT>>
                <br>
                <br>
                <font size="1"> Title:</font></b><font size="1"> (example: Untitled)</font></font><br>
                <input type="text" size="30" maxlength="75" name="Title"<CFOUTPUT>value="#qGetShowcaseDefaultInfo.Title#"</CFOUTPUT>>
                <br>
                <br>
                <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b> 
                Medium: </b></font><br>
		           		  <select name="Medium" size="1">
							<option value="" <CFIF #qGetShowcaseDefaultInfo.Medium# is "">SELECTED</CFIF>>Select Medium
                  			<option value="Albumen Print" <CFIF #qGetShowcaseDefaultInfo.Medium# is "Albumen Print">SELECTED</CFIF>>Albumen Print 
                 			<option value="Black & White" <CFIF #qGetShowcaseDefaultInfo.Medium# is "Black & White">SELECTED</CFIF>>Black &amp; White 
                 			<option value="Chromogenic Print" <CFIF #qGetShowcaseDefaultInfo.Medium# is "Chromogenic Print">SELECTED</CFIF>>Chromogenic Print 
                  			<option value="Cibachrome Print"  <CFIF #qGetShowcaseDefaultInfo.Medium# is "Cibachrome Print">SELECTED</CFIF>>Cibachrome Print 
                  			<option value="Color" <CFIF #qGetShowcaseDefaultInfo.Medium# is "Color">SELECTED</CFIF>>Color 
                  			<option value="Daguerreotype" <CFIF #qGetShowcaseDefaultInfo.Medium# is "Daguerreotype">SELECTED</CFIF>>Daguerreotype 
                  			<option value="Gelatin-Silver Print"  <CFIF #qGetShowcaseDefaultInfo.Medium# is "Gelatin-Silver Print">SELECTED</CFIF>>Gelatin-Silver Print 
                  			<option value="Iris Print" <CFIF #qGetShowcaseDefaultInfo.Medium# is "Iris Print">SELECTED</CFIF>>Iris Print 
                  			<option value="Photocollage"  <CFIF #qGetShowcaseDefaultInfo.Medium# is "Photocollage">SELECTED</CFIF>>Photocollage 
                  			<option value="Photogram" <CFIF #qGetShowcaseDefaultInfo.Medium# is "Photogram">SELECTED</CFIF>>Photogram 
                  			<option value="Photogravure" <CFIF #qGetShowcaseDefaultInfo.Medium# is "Photogravure">SELECTED</CFIF>>Photogravure 
                  			<option value="Platinum Print" <CFIF #qGetShowcaseDefaultInfo.Medium# is "Platinum Print">SELECTED</CFIF>>Platinum Print 
                  			<option value="Polaroid" <CFIF #qGetShowcaseDefaultInfo.Medium# is "Polaroid">SELECTED</CFIF>>Polaroid 
                  			<option value="TinType" <CFIF #qGetShowcaseDefaultInfo.Medium# is "TinType">SELECTED</CFIF>>TinType 
                  			<option value="Contact Print" <CFIF #qGetShowcaseDefaultInfo.Medium# is "Contact Print">SELECTED</CFIF>>Contact Print 
                  			<!--- <option value="Other" <CFIF #qGetShowcaseDefaultInfo.Medium# is "Other">SELECTED</CFIF>>Other  --->
                		</select>
                <br>
                <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1">If 
                you selected <b>Other</b>, please define process below:</font><br>
                <input type="text" size="30" maxlength="75" name="OtherMed" <CFOUTPUT>value="#qGetShowcaseDefaultInfo.OtherMed#"</CFOUTPUT>>
                <br>
                <br>
                <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Year 
                Produced: </b></font><br>
                <input type="text" size="4" maxlength="4" name="YearProd" <CFOUTPUT>value="#qGetShowcaseDefaultInfo.YearProd#"</CFOUTPUT>>
                <br>
                <br>
                <br>
                <br>
				<font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><b>Genre: <font color="red">*</font></b><br>
                <font size="1">How would you describe the main body of your work? 
                Choose a Genre to describe the majority of your work. This may be overridden 
                on the individual artwork forms (Step 12).<br>
                <br>
                <select name="Genre1" size="1">
                  <option value="" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "">SELECTED</CFIF>>Select Genre 
                  <option value="Abstract" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Abstract">SELECTED</CFIF>>Abstract 
                  <option value="Architecture" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Architecture">SELECTED</CFIF>>Architecture 
                  <option value="Cityscape" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Cityscape">SELECTED</CFIF>>Cityscape 
                  <option value="Documentary" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Documentary">SELECTED</CFIF>>Documentary 
                  <option value="Fashion" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Fashion">SELECTED</CFIF>>Fashion 
                  <option value="Figure Study" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Figure Study">SELECTED</CFIF>>Figure Study 
                  <option value="Landscape" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Landscape">SELECTED</CFIF>>Landscape 
                  <option value="Nudes" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Nudes">SELECTED</CFIF>>Nudes 
                  <option value="Photojournalism" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Photojournalism">SELECTED</CFIF>>Photojournalism 
                  <option value="Photomontage" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Photomontage">SELECTED</CFIF>>Photomontage 
                  <option value="Portraiture" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Portraiture">SELECTED</CFIF>>Portraiture 
                  <option value="Still Life" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Still Life">SELECTED</CFIF>>Still Life 
                  <option value="Street Photography" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Street Photography">SELECTED</CFIF>>Street Photography 
                  <!--- <option value="Other" <CFIF #qGetShowcaseDefaultInfo.Genre1# is "Other">SELECTED</CFIF>>Other  --->
                </select><br>
                If none of the above genres are appropriate, please define your genre below:<br>
                <input type="text" size="30" name="Genre2" maxlength="75" <CFOUTPUT>value="#qGetShowcaseDefaultInfo.Genre2#"</CFOUTPUT>>
                </font></font><br>
              </td>
              <td width="2%" valign="top" align="left"> <img src="Images/BlackRule.gif" width=1 height=100% alt="" border="0"> 
              </td>
              <td valign="top" width="49%"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><b> 
                Print Dimensions (in inches):</b><br>
                <font size="1">Place all basic default print information in the 
                spaces provided below. All dimensions must be in inches. Measure the
				actual image size (eg. 7x9 (even though image is printed on 8x10 paper). 
				<font color="red">Do not include inch marks (").</font>
                </font></font><br>
                
				<br>
				<table width="269">
                  <tr> 
                    <td><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"> 
                      <b>Image Height:</b>&nbsp;</font> 
                      <input type="text" size="3" name="Height1" maxlength="3" <CFOUTPUT>value="#qGetShowcaseDefaultInfo.Height1#"</CFOUTPUT>>
                    </td>
                    <td><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"> 
                      <b>Image Width:</b>&nbsp;</font> 
                      <input type="text" size="3" name="Width1" maxlength="3" <CFOUTPUT>value="#qGetShowcaseDefaultInfo.Width1#"</CFOUTPUT>><br>
                    </td>
                  </tr>
				  <td colspan="2">
			        <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"> 
				    All photographs must be matted using archival mat board. We recommend that you use a professional
				  matter. Optionally we can mat your work for you, deducting our fee from your percentages.</font></td></tr>
                </table>
				<br>
                <table>
                  <tr> 
                    <td colspan="2"><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><b> 
                Mat Dimensions:</b></font><br>
					<font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>
					  
					             
					 </td></tr>
					 <tr>
					 <td width="50%" height="33"><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Mat Height:</b>&nbsp;</font> 
                      <input type="text" size="3" name="MatHeight1" maxlength="3" <CFOUTPUT>value="#qGetShowcaseDefaultInfo.MatHeight1#"</CFOUTPUT>>
                    </td>
                    <td width="50%" height="33"><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b> 
                      Mat Width:</b>&nbsp;</font> 
                      <input type="text" size="3" name="MatWidth1" maxlength="3" <CFOUTPUT>value="#qGetShowcaseDefaultInfo.MatWidth1#"</CFOUTPUT>>
</tr>
			  <tr> <td COLSPAN="2">	  
				  <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1">
				  All photographs must be matted. Occasionally artwork cannot be matted because of the process involved. Check the box below 
				  if this is the case.<br>
				  
			    	<cfif #qGetShowcaseDefaultInfo.Unmatted# is 1>
						<input type="checkbox" name="Unmatted" value="1" checked>
			  		<cfelse>
						<input type="checkbox" name="Unmatted" value="1">
					</cfif>
					<b>Unmatted</b></font>
			  </td> </tr>

                   
                </table>
                <br>
                <br>
                <table>
                  <tr> 
					<td>
					
					<font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><b> 
                    Price</b> <font size="1">(U.S. Dollars)</font></font><br>
					
					<font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><font color="red">You 
                are responsible for updating any price increases. DO NOT use a separator ",", a $ sign, or a decimal point. EG. Instead of $1,500.00 type 1500.<font color="BLACK"><BR><BR>&nbsp;<font size="2"><b>$ 
                      <input type="text" size="6" name="Price1" maxlength="7" <CFOUTPUT>value="#qGetShowcaseDefaultInfo.Price1#"</CFOUTPUT>>
                      </b></font></font></FONT></font></td> 
                  </tr>
                </table>
                <br>
                <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><b>Edition 
                Size:</b></font> <br>
                <table width="229">
                  <tr> 
  				 <CFIF #qGetShowcaseDefaultInfo.EditionEd1# is 1>
                    <td> 
                      <div align="left"> 
					  
                        <input type="radio" name="EditionEd1"value="0">
                        <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b> 
                        Not Editioned</b>&nbsp;</font> </div>
                    </td>
                    <td> 
                      <div align="left"> 
                        <input type="radio" name="EditionEd1" value="1" checked>
                        <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b> 
                        Editioned</b>&nbsp;</font> </div>
                    </td>
				 <CFELSE>
                    <td> 
                      <div align="left"> 
					  
                        <input type="radio" name="EditionEd1"value="0" checked>
                        <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b> 
                        Not Editioned</b>&nbsp;</font> </div>
                    </td>
                    <td> 
                      <div align="left"> 
                        <input type="radio" name="EditionEd1" value="1">
                        <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b> 
                        Editioned</b>&nbsp;</font> </div>
                    </td>
				 </CFIF>
                  </tr>
                </table>
                <table>
                  <tr> 
                    <td><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Edition 
                      Size:</b>&nbsp;</font> 
                      <input type="text" size="4" name="EditionSz1" maxlength="4" <CFOUTPUT>value="#qGetShowcaseDefaultInfo.EditionSz1#"</CFOUTPUT>>
                    </td>
                    <td> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"><b>Edition 
                      Number:</b>&nbsp;</font> 
                      <input type="text" size="4" name="EditionNo1" maxlength="4" <CFOUTPUT>value="#qGetShowcaseDefaultInfo.EditionNo1#"</CFOUTPUT>>
                    </td>
                  </tr>
                </table>
                <br>
                <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><b>If 
                Prints are editioned, list Pricing Structure:<br>
                  <font color="red" size="1">Note: You must include a &lt;br&gt; 
                  after each line.</font></b></font>
                <table cellspacing="0" cellpadding="0" width="248">
                  <tr> 
                    <td><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1">Example:&nbsp;&nbsp;</font></td>
                    <td><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1">1-10:</font></td>
                    <td><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1">$600&lt;br&gt;</font></td>
                  </tr>
                  <tr> 
                    <td>&nbsp;</td>
                    <td><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1">10-20:&nbsp;&nbsp;</font></td>
                    <td><font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1">$1,000&lt;br&gt;</font></td>
                  </tr>
                </table>
                <textarea name="AddInfo1" rows=8 cols=32 wrap=virtual><CFOUTPUT>#qGetShowcaseDefaultInfo.AddInfo1#</CFOUTPUT></textarea>
              </td>
            </tr>
            <br>
           
            <tr> 
              <td colspan="3" align="left"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><b> 
                Location:</b><br>
                <font size="1">If location is important in identifying your work, 
                fill in any or all of the fields below. This is to describe the 
                majority of your work which can be overridden on any of the individual 
                artwork forms (Step 3) that you fill out.</font></font></td>
            </tr>
            <tr> 
              <td align="left"> <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"> 
                <b>Continent:</b> example - Asia<br>
                <br>
                <select name="LocContin" size="1">
                  <option value="" <CFIF #qGetShowcaseDefaultInfo.LocContin# is "">SELECTED</CFIF>>Select Continent
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
                <input type="text" size="30" name="LocCountry" maxlength="75" <CFOUTPUT>value="#qGetShowcaseDefaultInfo.LocCountry#"</CFOUTPUT>>
                <br>
                <br>
                <b>Region:</b> example - Bandereas<br>
                <input type="text" size="30" name="LocRegion" maxlength="75" <CFOUTPUT>value="#qGetShowcaseDefaultInfo.LocRegion#"</CFOUTPUT>>
                </font> </TD>
              <td>&nbsp;</td>
              <td> <br>
                <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="1"> 
                <b>State:</b> example - New Mexico<br>
                <input type="text" size="30" name="LocState" maxlength="75" <CFOUTPUT>value="#qGetShowcaseDefaultInfo.LocState#"</CFOUTPUT>>
                <br>
                <br>
                <b>City:</b> example - Taos<br>
                <input type="text" size="30" name="LocCity" maxlength="75" <CFOUTPUT>value="#qGetShowcaseDefaultInfo.LocCity#"</CFOUTPUT>>
                <br>
                <br>
                </font><br>
                <br>
              </td>
            </tr>
            <tr> 
              <td colspan="3" align="left"> 
                <hr width="40%" size="1" align="left">
                <font face="Verdana,Arial,Helvetica,sans-serif" color="#000000" size="2"><b><br>
                Additional Keywords:</b><br>
                <font size="1">This section is very <font color="red">important</font> 
                as it will help distinguish your work in keyword searches. Include 
                as many keywords that describe your work, excluding <b>Location</b> 
                and <b>Genre</b>.<br>
                <br>
                <font color="red">Example 1 - <font color="#000000">Abstract, Light, Color, 
      Dreams</font><br>
      Example 2 -<font color="#000000"> Nudes, Female, Formal, Abstract</font><br>
      Example 3 -<font color="#000000"> Wildlife, Eagles, Natural Habitat, Animals, 
      Endangered Species</font><br>
      Example 4 -<font color="#000000"> Indigenous People, Women, Men</font></font>, 
      Endangered Cultures, Tribal<br>
                <br>
                Please seperate each word with a comma and a space following the 
                example.<br>
                <textarea name="Keywords" rows=3 cols=60 wrap=virtual><CFOUTPUT>#qGetShowcaseDefaultInfo.Keywords#</CFOUTPUT></textarea>             
                </font></font></td>
            </tr>
            <tr> 
              <td colspan="3" align="center"> 
                <hr width="100%" size="1" noshade>
                <br>
                <center>
				<INPUT TYPE="HIDDEN" NAME="PortfolioName_required" VALUE="You must name your Showcase Portfolio!">
				<input type="HIDDEN" name="Custnumber" <CFOUTPUT>value="#qGetShowcaseDefaultInfo.Custnumber#"</CFOUTPUT>>
                   <INPUT TYPE="SUBMIT" VALUE="Save Changes">
				   </form> 
                </center>
                <hr color="black" size="1">
                <FONT FACE="Arial, Helvetica, Sans-Serif" size="2"><IMG SRC="images/photoeyebooks&prints.gif" WIDTH=308 HEIGHT=28 BORDER=0><br>
                376 Garcia Street, Santa Fe, NM 87501<br>
                Orders Only: 800-227-6941 Info: 505-988-5152 Fax: 505-988-4487<br>
                E-Mail: <a href="mailto:webmaster@photoeye.com">webmaster@photoeye.com</a><br>
                � photo-eye books &amp; prints, 2000. All Rights Reserved.</font> 
                <br>
                <FONT FACE="Arial, Helvetica, Sans-Serif" size="1">This entire 
                web site is the � copyrighted property of photo-eye books &amp; 
                prints, except where artists' and publishers' copyrights on the 
                materials described take precedence. No portion of the contents 
                within may be reproduced in any form, for any non-private use, 
                without the express written permission of photo-eye books &amp; 
                prints.</font></td>
            </tr>
          </table>
</td></tr>
</table>

</center>
</div>
</body>
</html>

