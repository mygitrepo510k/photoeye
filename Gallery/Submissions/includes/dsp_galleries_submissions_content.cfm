   <CFSET xTitle="Photographer's Showcase">
<CFSET xShowBackButton = 1>
<CFSET xShowMenu = 1>
<CFSET xCookieCheck = 1>
<CFSET xShowCheckout = 0>
<CFSET xShowShoppingCart = 0>
<CFSET xShowYourAccount = 0>
<CFSET xShowSearch = 0>
<CFSET xShowPowersearch = 0>



<FORM METHOD="POST" ACTION="/templates/AddtoCartPSApplyNew.cfm?PSApply=1" target="_top" style="width: 700px ;
  margin-left: auto ;
  margin-right: auto ;">
<br><br>
<div  style="align: center; width:630px; margin-left: auto; margin-right: auto;font-size:13px;  line-height:18px; color:#666; font-family:Verdana, Arial, sans-serif"> 
<cfinclude template="dsp_galleries_submissions_menu.cfm">
<div align="left" style="font-size:20px; line-height:24px; color:#666;"><b>Project/Portfolio Submissions</b></div><br />

<div align="left">Due to the high volume of submissions, we have instated a modest submission fee to ensure our ability to review all work with the care it deserves. While we cannot at this time offer feedback or critiques, your work will be looked at with consideration as to where you might best fit in photo-eye's exhibition venues. These venues include: 
<br><br>
<a href="http://www.photoeye.com/gallery/representedartists/">photo-eye Gallery</a><br>
<a href="http://www.photoeye.com/gallery/photoshowcase/">Photographer's Showcase </a><br>
<!--- <a href="http://www.photobistro.com/">PhotoBistro</a><br> --->
<a href="http://www.artphotoindex.com/">Art Photo Index</a><br>
<br>
While we cannot guarantee we will be able to work with you, your work will receive our honest consideration.
<br><br>
photo-eye accepts submissions only online. Please review the photo-eye <a href="overview.cfm">Overview</a> page before continuing.
<br><br>
The submission fee is a non-refundable $35 for the first portfolio, $20 for each additional when submitted at the same time. Since several of our galleries are fee-based, other fees may apply depending on the outcome of your review. After your order is received, a link will be e-mailed to you enabling you to enter your bio, statements, title lists, and upload your images to us.
<br>
<br>Choose the number of portfolios you would like to submit. 
<br>
<br></font> 
   
	  <table width="200" border="0" cellpadding="0" align="center">
    <tr> 
      <td colspan="2"> 
        <input type="radio" name="PortfolioQty" value="1">
        <font face="Verdana, Arial, Helvetica, sans-serif" size="2">1 portfolios 
        ($35)</font> </td>
    </tr>
    <tr>
      <td colspan="2"> 
        <input type="radio" name="PortfolioQty" value="2">
        <font face="Verdana, Arial, Helvetica, sans-serif" size="2">2 
        portfolios ($55)</font> </td>
    </tr>
    <tr>
      <td colspan="2"> 
        <input type="radio" name="PortfolioQty" value="3">
        <font face="Verdana, Arial, Helvetica, sans-serif" size="2">3 portfolios 
        ($75) </font> <font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp; 
        </font> </td>
    </tr>
    <tr>
      <td colspan="2"> 
        <input type="radio" name="PortfolioQty" value="4">
        <font face="Verdana, Arial, Helvetica, sans-serif" size="2">4 portfolios 
        ($95) </font> <font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp; 
        </font></td>
    </tr>
    <tr>
      <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="radio" name="PortfolioQty" value="5">
        5 portfolios ($115) </font></td>
    </tr>
    <tr>
      <td colspan="2">&nbsp;</td>
     </tr>
 </table>
  <div align="center">
	 <INPUT TYPE="SUBMIT" VALUE="Continue"></div>
	 
  	 	 <INPUT TYPE="HIDDEN" NAME="PortfolioQty_required" VALUE="Please choose the number of portfolios you would like to submit before continuing.">
</form>

</div>
</div>
<!---
<CFSET xTitle="Photographer's Showcase">
<CFSET xShowBackButton = 1>
<CFSET xShowMenu = 1>
<CFSET xCookieCheck = 1>
<CFSET xShowCheckout = 0>
<CFSET xShowShoppingCart = 0>
<CFSET xShowYourAccount = 0>
<CFSET xShowSearch = 0>
<CFSET xShowPowersearch = 0>
<cfinclude template="/gallery/includes/dsp_Galleries_index_top.cfm">


 
<!--- <cfoutput>#cookie.URLUserIdNumber#</cfoutput> --->


    <div align="center"><font face="verdana, arial, helvetica, sans-serif" size="2" color="Black"><b>P 
    H O T O G R A P H E R ' S&nbsp;&nbsp;&nbsp;&nbsp;S H O W C A S E<SUP><FONT SIZE="1"> 
    </font></sup></b><SUP><FONT SIZE="1">&reg;<b></b></FONT></SUP><b>&nbsp;&nbsp;&nbsp;&nbsp;A&nbsp;P&nbsp;P&nbsp;L&nbsp;I&nbsp;C&nbsp;A&nbsp;T&nbsp;I&nbsp;O&nbsp;N</b><br>
    <br>
    </font></div>
 <!--- <a href="../application/index.cfm" target="_top"><font color="Black" face="verdana, arial, Helvetica, sans-serif" size="1" onMouseOver="this.color='Red';" onMouseOut="this.color='Black';"  style="TEXT-DECORATION: none"><b>A P P L Y &nbsp;&nbsp; O N L I N E !</b></font></a> ---><p align="center"><font face="verdana, arial, helvetica, sans-serif" size="3" color="Black"><strong>O R D E R&nbsp;&nbsp;&nbsp; F O R M</strong></font></p>


<FORM METHOD="POST" ACTION="AddtoCartPSApply.cfm?PSApply=1" target="_top">
  <table width="550" border="0" cellpadding="0" align="center">
    <tr> 
      <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
The <b>Photographer's Showcase </b>is a juried, portfolio-based gallery at photoeye.com where selected artists' works are exhibited and sold. A portfolio is a body of work comprised of thematically related images. Each portfolio may contain from 5-20 images to be submitted to our jurors for consideration. Multiple portfolios may be submitted even if they have the same theme. For example, you may want to submit 5 landscape portfolios. Alternatively, each portfolio may have a different theme, such as portraits, still lives, and nudes. Location may also be used to distinguish your portfolios. 
<br>
<CFOUTPUT>
<br> At this time, applications and submissions are accepted online only.     Netscape Navigator or Internet Explorer 4.0 or higher are required to complete the online application process. Please review the <b>Photographer's Showcase <a href="javascript:popUp('../#aGalleryDirectory#/photoshowcase/newdocumentation/artists/applicationchecklist.cfm?PSApply=1&ac=1','Popup','600','440','yes');">Application Checklist</a> </b>before continuing. <br>
<br>The application fee is a non-refundable fee of $35 for the first portfolio, $20 for each additional when submitted at the same time. <a href="javascript:popUp('../#aGalleryDirectory#/photoshowcase/newdocumentation/artists/feeschedule.cfm?PSApply=1','Popup','600','440','yes');"><b>Other fees</b></a> will apply if your work is accepted. After your order is received, a link will be e-mailed to you enabling you to enter your bio, statements, and title lists, and upload your images to our jurors.<br> 
</CFOUTPUT>
<br>Choose the number of portfolios you would like to submit. 
<br>
<br></font></td>
    </tr>
	</table>
	  <table width="200" border="0" cellpadding="0" align="center">
    <tr> 
      <td colspan="2"> 
        <input type="radio" name="PortfolioQty" value="1">
        <font face="Verdana, Arial, Helvetica, sans-serif" size="2">1 portfolios 
        ($35)</font> </td>
    </tr>
    <tr>
      <td colspan="2"> 
        <input type="radio" name="PortfolioQty" value="2">
        <font face="Verdana, Arial, Helvetica, sans-serif" size="2">2 
        portfolios ($55)</font> </td>
    </tr>
    <tr>
      <td colspan="2"> 
        <input type="radio" name="PortfolioQty" value="3">
        <font face="Verdana, Arial, Helvetica, sans-serif" size="2">3 portfolios 
        ($75) </font> <font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp; 
        </font> </td>
    </tr>
    <tr>
      <td colspan="2"> 
        <input type="radio" name="PortfolioQty" value="4">
        <font face="Verdana, Arial, Helvetica, sans-serif" size="2">4 portfolios 
        ($95) </font> <font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp; 
        </font></td>
    </tr>
    <tr>
      <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="radio" name="PortfolioQty" value="5">
        5 portfolios ($115) </font></td>
    </tr>
    <tr>
      <td colspan="2">&nbsp;</td>
    </tr>
  </table>
  <div align="center">
	 <INPUT TYPE="SUBMIT" VALUE="Continue with Photographer's Showcase Order"></div>
	 
  	 	 <INPUT TYPE="HIDDEN" NAME="PortfolioQty_required" VALUE="Please choose the number of portfolios you would like to submit before continuing.">
</form>
</div>
<cfinclude template="/gallery/includes/dsp_Galleries_index_bottom.cfm"> --->
