



<!--- If Coming from Auction, but bid not placed erase the AuctionID session --->
<CFIF IsDefined("url.nobid")>
	<CFSET StructDelete(SESSION, "AuctionID")>
</CFIF>

<!--- Carry over the cookie --->
<CFIF IsDefined("url.UID")>
	<CFSET cookie.UserIdNumber = url.UID>
</CFIF>

<cfinclude template="../../templates/OrderFormApplicationType.cfm">

<CFPARAM NAME="url.orderform" default="0">
<CFPARAM NAME="url.Timeout" default="0">
<CFPARAM NAME="url.AddReviews" default="0">
<CFPARAM NAME="url.Catalog" default="">
<CFPARAM NAME="url.EditAccount" default="1">
<CFPARAM NAME="form.xUserID" default="0">
<CFPARAM NAME="url.Auction" default="0">
<CFPARAM NAME="form.xUserID" default="0">
<CFPARAM NAME="url.GuideApply" default="0">
<CFPARAM NAME="url.Pwd" default="0">
<CFPARAM NAME="xEmail" default="">
<CFPARAM NAME="url.NoEmail" default="0">
<CFPARAM NAME="url.Email" default="">
<CFPARAM NAME="url.GiftCert" DEFAULT="0">
<CFPARAM NAME="url.AlreadySetup" default="0">
<CFSET xAlreadySetup = url.AlreadySetup>
<CFPARAM NAME="url.Acct" default="0">
<CFSET xAcct = url.Acct>

<CFIF IsDefined("url.Email")>
	<CFSET xEmail = url.Email>
</CFIF>

<!--- IF coming from cart, set a session var to remember--->
<CFIF IsDefined("url.FromCart")>
	<cflock timeout="5" throwontimeout="No" type="Exclusive" scope="Session">
		<CFSET Session.FromCart=1>
	</CFLOCK>
</CFIF> 

<!--- IF coming from wishlist, set a session var to remember--->
<CFIF IsDefined("url.FromWishList")>
	<CFIF IsDefined("url.OOP")>
		<cflock timeout="5" throwontimeout="No" type="Exclusive" scope="Session">
			<CFSET Session.FromWishList=2>
		</CFLOCK>
	<CFELSE>
		<cflock timeout="5" throwontimeout="No" type="Exclusive" scope="Session">
			<CFSET Session.FromWishList=url.FromWishList>
		</CFLOCK>
	</CFIF>
</CFIF> 
<CFIF IsDefined("url.ToWishList")>
	<cflock timeout="5" throwontimeout="No" type="Exclusive" scope="Session">
		<CFSET Session.ToWishList=url.ToWishLIst>
	</CFLOCK>
</CFIF> 

<!--- If user comes to the account outside of the shopping cart --->
<CFIF IsDefined("cookie.useridnumber")>
	<cfset form.xUserId = cookie.useridnumber>
</CFIF>

<!--- Passing a UserID over a secure connection --->
<!--- Use the form hidden field to pass the cookie.useridnumber over to https--->
<cfif form.xUserID GT 0>
	<!--- Set a new cookie in https land --->
	<cfcookie name="UserIdNumber" value="#form.xUserID#" expires="60">
<!--- 	<cfoutput>
		#cookie.useridnumber#
	</cfoutput> --->
<cfelse>
	<cfcookie name="UserIdNumber" value="#form.xUserID#" expires="60">
<!--- 		<cfoutput>
		#cookie.useridnumber#
	</cfoutput> --->
</cfif>

<cfif Isdefined("url.Id")>
	<cfcookie name="UserIdNumber" value="#URL.ID#" expires="60">
</cfif>

 <!---<CFOUTPUT> Cookie Exists: #cookie.UserIdNumber#</CFOUTPUT>--->

 
<CFINCLUDE TEMPLATE="/templates/GetCartContents.cfm">


<!--- Remember me on this computer? --->
<CFIF IsDefined("cookie.RememberMe")>
	<cflock timeout="5" throwontimeout="No" type="Exclusive" scope="Session">
		<CFSET Session.AcctID=cookie.RememberMe>
	</CFLOCK>
</CFIF>

<!--- If session is already defined, send them in! --->
<cflock timeout="5" throwontimeout="No" type="ReadOnly" scope="Session">
	<CFIF IsDefined("Session.AcctID")>
		<CFSET SessionExists = 1>
	</CFIF>
</CFLOCK>

	<CFIF IsDefined("SessionExists")>
		<CFIF IsDefined("url.ReturnToAuctionID")>
			<CFSET url.ID=url.ReturnToAuctionID>
			<cflocation url="#xURLhome#/Auctions/Auction.cfm">
		<CFELSEIF qGetProductInfo.RecordCount gt 0 and xAcct is not 1>
			<cfinclude template="/templates/OrderFormConfirmOrderNew.cfm">
		<CFELSE>
			<CFinclude template="/templates/OrderFormEditAccount.cfm">
		</CFIF>
		<CFABORT>
	<cfelse>
		
	</CFIF>


<!--- Page Title --->
<table width="800" align="center" cellpadding="0" cellspacing="0">
 <tr height="40"><td></td></tr> 
 
  <tr>
        <td align="center"><font face="'Times New Roman',Times,serif" size="5" color="Black">L</FONT><font face="'Times New Roman',Times,serif" size="4" color="Black">OGIN</FONT></td>
  </tr></table>
  
  <!--- Intro --->
<table width="800" align="center" cellpadding="5" cellspacing="0">
  <tr>
    <td align="center" class="Example"><FONT color="Black" face="Arial, Helvetica, sans-serif" size="2">
    	<cfif url.GiftCert is 1>
    	 	<font color="Red" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>
    		Please login to continue with your gift certificate purchase.</b></font><br>
	</cfif>
    	
	<cfif url.Addreviews is 1>
	 	<font color="Red" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>
		Please login before writing a review.</b></font><br>
	</cfif>
	
	<cfif isDefined("url.WishList") or isDefined("url.ToWishList") or isDefined("url.FromWishList")>
	 	<font color="Red" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>
		Please login to create or view your wish list.</b></font><br>
	</cfif>
	
	<CFIF xAlreadySetup is 1>
		<b>Welcome back! Please login with your password below.</b>
	</CFIF>
	
	<cfif IsDefined("url.PwdExists")>
	 	<font color="Red" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>
		Your account has already been setup. <BR> Please login with your password.</b></font><br>
		<br>
		<CFSET xEmail = url.Email>
	</cfif>
		
	<cfif url.Auction is 1 and url.Timeout is not 1>
 	<font color="Red" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>
	Required for bidding. Please Login.<!--- before placing an Auction Bid ---></b></font><br>
	

	
	<CFELSEIF url.Auction is 1 and url.Timeout is 1>
	<font color="Red" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>
	Required for bidding. Please Login Again.<!--- before placing an Auction Bid ---></b></font><br>
				<cfelseif url.guideapply is 1 and  url.Timeout neq 1>
		<font color="Red" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>
	Please login or create an account before adding your listing.</b></font><br>
		
		
	<CFELSEIF url.Timeout eq 1 and xAcct is not 1 and url.Addreviews is not 1><BR><font face ="Verdana, Arial, Helvetica, Sans-Serif" color="Red" size="2"><b>Your user session has timed out.</B></FONT><br>
		<br><font face ="Verdana, Arial, Helvetica, Sans-Serif" color="Black" size="2">For security purposes all sessions expire after 20 minutes of inactivity.<br>Simply login again to continue.</font><br>
		
		
		</CFIF>

	<CFIF url.Timeout is not 1>
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
<cfif url.guideapply is 1><br><br>
	In order to be listed in The International Photography Guide<br>you must have a photo-eye account. Please login or create a new account.<BR>
<cfelse>
<!--- 	Welcome to our online ordering system!<br> 
	All account and credit card information is encrypted.--->
</cfif></font>
		</CFIF>
	
		<CFIF url.NoEmail eq 1><font face ="Verdana, Arial, Helvetica, Sans-Serif"  size="2">We did not find <FONT COLOR="RED"><b><CFOUTPUT>#url.Email#</CFOUTPUT></b></FONT> in our records.</FONT>
		<br><font face ="Verdana, Arial, Helvetica, Sans-Serif" color="Black" size="2">Please try again, or create a new account.<BR> Don't worry, your new account will be merged with any existing account information.</font><BR>
	<CFELSEIF url.Pwd eq 1><BR><font face ="Verdana, Arial, Helvetica, Sans-Serif" color="Red" size="2"><b>Password not found!</B></FONT>
		<br><font face ="Verdana, Arial, Helvetica, Sans-Serif" color="Black" size="2">Please try again.</font><BR></CFIF>
	
	</FONT></td>
  </tr></table>
  
<!---   <!--- Table Spacer --->
<table width="800" align="center" cellpadding="0" cellspacing="0"><tr><td height="20"> </td></tr></table> --->



<!--- Delete Previous Session--->

<!--- Delete Session Var: AcctID--->
<CFSET StructDelete(SESSION, "AcctID")>


<!--- Password Form--->




   <center>
	
		
	
	<CFOUTPUT>
	<TABLE WIDTH="800"><TR><TD ALIGN="CENTER">
<TABLE>
<TR><TD bgcolor="Maroon" colspan="3">
	<TABLE WIDTH="100%"><TR><TD WIDTH="220" ALIGN="CENTER">
	<b><font face ="Verdana, Arial, Helvetica, Sans-Serif" color="White" size="2">New Customers</FONT></b></TD><TD ALIGN="CENTER"><b><font face ="Verdana, Arial, Helvetica, Sans-Serif" color="White" size="2">Returning Customers</FONT></b>
	</TD></TR></TABLE>
</TD></TR>
<TR><TD ALIGN="CENTER" VALIGN="TOP" width="220">
	<BR>
	<FORM METHOD="POST" ACTION="../templates/OrderFormNewAccount.cfm?#xApplytype#&NewAccount=1">
		&nbsp;&nbsp;<INPUT TYPE="SUBMIT" CLASS="input_submit" VALUE="Create Account"> 
	</FORM>
	<div align="left"><br />
<font face ="Verdana, Arial, Helvetica, Sans-Serif" color="Gray" style="font-size:10px; line-height:13px;">
If you already have a photo-eye online account, use your account email address and password. <br>
<br /></FONT></div>
</TD><TD VALIGN="TOP" WIDTH="35" ALIGN="CENTER">
	<IMG SRC="/img/maroon_dot.jpg" HEIGHT="176" WIDTH="1">
</TD><TD VALIGN="TOP" ALIGN="CENTER">
		
			<TABLE bgcolor="##F5EBB5" CELLPADDING="3"><TR><TD VALIGN="middle" ALIGN="LEFT">
			<table WIDTH="100%"><tr><td valign="BOTTOM" aLIGN="LEFT" VALIGN="BOTTOM">
			<FORM name="Login" METHOD="POST" ACTION="../templates/NewPasswordGetCustomer.cfm?#xApplyType#&Acct=#xAcct#">
	<font face ="Arial, Helvetica, Sans-Serif" color="Maroon" size="2">
	<b>E-mail Address:</b></font>
	<BR>
	<input	name="VerifyEmail" type="text" class="input_text" value="<CFIF  url.NoEmail is 0>#xEmail#</CFIF>" size="33" maxlength="50">
	<input type="hidden" name="VerifyEmail_required" value="Please enter a valid email address">
	</td></tr></table>
	<table WIDTH="100%" height="50"><tr><td valign="BOTTOM" aLIGN="LEFT" VALIGN="BOTTOM">
			<font face ="Arial, Helvetica, Sans-Serif" color="Maroon" size="2" ><strong>Password: 
</strong></font><FONT SIZE="1"> First time? Use your <a href="../templates/NewPasswordCustomerNumber.cfm?#xApplyType#&Email=#xEmail#"><FONT color="navy" face=" arial, Helvetica, sans-serif" size="1" onMouseover="this.color='maroon';" onMouseout="this.color='navy';"  style="TEXT-DECORATION: underline">Customer Number</FONT></A></FONT><BR>
<!--- <BR><FONT COLOR="black">or</FONT> Customer Number:</strong></font><FONT SIZE="1"> (first time only)</FONT> --->
			<input type="password" size="33" maxlength="20" name="VerifyPassword"> 
			<input type="hidden" name="VerifyPassword_required" value="Please enter a valid password or customer number">
			<div align="left">
			<font face ="Arial, Helvetica, Sans-Serif" color="Black" size="1">Retrieve <a href="../templates/NewPasswordForgot.cfm?#xApplyType#"><FONT color="navy" face="arial, Helvetica, sans-serif" size="1" onMouseover="this.color='maroon';" onMouseout="this.color='navy';"  style="TEXT-DECORATION: underline">Password Hint</FONT></a></B></font>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<font face ="Arial, Helvetica, Sans-Serif" color="Black" size="1">Send me my <a href="../templates/Email_Password.cfm?#xApplyType#"><FONT color="navy" face="arial, Helvetica, sans-serif" size="1" onMouseover="this.color='maroon';" onMouseout="this.color='navy';"  style="TEXT-DECORATION: underline">Password</FONT></a></B></font>
<!--- REMOVED 3.19.09 DE
<BR>
<input name="RememberMe" type="checkbox" class="input_checkbox" value="1"> <font face ="Arial, Helvetica, Sans-Serif" color="Black" size="1" >Remember me on this computer</FONT>
--->
</div>
	</td></tr></table>
	
	<INPUT TYPE="HIDDEN" NAME="AddReviews" VALUE="#url.AddReviews#">
	<INPUT TYPE="HIDDEN" NAME="Catalog" VALUE="#url.Catalog#">
	<table WIDTH="100%"><tr><td height="30" valign="BOTTOM" aLIGN="CENTER"><input TYPE="SUBMIT" CLASS="input_submit" value="Login"></td></tr></table>



			</td></TR></TABLE>

</TD></TR>
</TABLE>
	
</FORM>
</TD></TR></TABLE></CFOUTPUT>
