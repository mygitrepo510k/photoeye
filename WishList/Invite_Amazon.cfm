<!--- Header --->
<CFSET xShowMenu = 0>
<cfset xShowWishList = 0>
<CFSET xShowBackButton = 0>
<CFSET xAllMaroon = 1>
<CFSET xTitle="Wish List Invitation">
<CFSET xPathToRoot="../">
<cfinclude template="includes/dsp_account_index_top.cfm">

<CFIF IsDefined("form.Send")>

<CFIF not len(trim(form.toemail)) or not find('.', form.toemail) or not find('@', form.toemail)>

<DIV ALIGN="CENTER">
<FONT CLASS="TEXT"><FONT COLOR="RED"><B>Valid send to e-mail address required.</B></FONT></FONT>
</DIV>
<BR>
<CFELSE>

	<CFIF IsDefined("form.view")>
<cfmail to="#trim(Form.ToEmail)#" from="orders@photoeye.com" subject="#Form.Subject#">
You have been invited to view the wish list of #form.Name# (#form.FromEmail#) at photoeye.com

Click this link (or paste it into a browser):
http://www.photoeye.com/wishlist/finder_Amazon.cfm?email=#trim(form.fromEmail)#

photoeye.com - explore art photography 

<CFIF len(trim(form.Message)) gt 0>----------------------
Personal message:
----------------------
#form.Message#</CFIF>

</cfmail>
	
	<CFELSE>
	
<cfmail to="#trim(Form.ToEmail)#" from="orders@photoeye.com" subject="#Form.Subject#">
You have been invited to make a wish list by:

#form.Name# (#form.FromEmail#)

Visit http://www.photoeye.com and when you see something you like click "add to wish list"!

photoeye.com - explore art photography 

<CFIF len(trim(form.Message)) gt 0>----------------------
Personal message:
----------------------
#form.Message#</CFIF>

</cfmail>

	</CFIF>
	
	
	
	<DIV ALIGN="CENTER">
	<FONT CLASS="TEXT">Invitation sent to: <B><CFOUTPUT>#form.toemail#</CFOUTPUT></B></FONT>
	</DIV>
	
	<CFSET xShowHeaderAndFooter = 0>
	<CFINCLUDE TEMPLATE="../templates/wishlist_Amazon.cfm">
	
<!---	<CFINCLUDE template="../templates/Footer_SITE.cfm">--->
	
<CFABORT>
</CFIF>

</CFIF>

<CFOUTPUT>
<DIV ALIGN="CENTER">
<FONT CLASS="TEXT">
<CFIF not xAcctExists>
Please <A HREF="../templates/newpasswordenter.cfm?FromWishList=1">log in</A> before sending an invitation.

<CFELSE>



<CFPARAM NAME="form.ToEmail" DEFAULT="">
<CFPARAM NAME="url.view" DEFAULT="0">

<FORM NAME="Invite" METHOD="POST" ACTION="Invite_Amazon.cfm?view=#url.view#">

	<CFQUERY NAME="qGetAcct" DATASOURCE="photoeyecom"> 
	 SElect FirstName, LastName, email 
	 FROM MailingList_OM
	 WHERE CustNumber = #xAcctID#
	</CFQUERY>
	
	<CFSET xName = "#qGetAcct.FirstName# #qGetAcct.Lastname#">
	<INPUT TYPE="HIDDEN" NAME="FromEmail" VALUE="#qGetAcct.Email#">
	<INPUT TYPE="HIDDEN" NAME="Name" VALUE="#xName#">
	<CFPARAM NAME="form.Message" DEFAULT="">
	<CFPARAM NAME="form.Subject" DEFAULT="Wish List Invitation from #xName#">


<!--- Invite to view your wish list --->

<TABLE WIDTH="500"><TR><TD><FONT CLASS="TEXT">

<TABLE><TR><TD>
<FONT CLASS="TEXT">Send to this E-mail: </FONT></TD><TD><INPUT NAME="TOEMAIL" TYPE="TEXT" class="input_text" VALUE="#form.toemail#" SIZE="50"></TD></TR>
<TR><TD><FONT CLASS="TEXT">Invitation Subject: </FONT></TD><TD><INPUT NAME="Subject" TYPE="TEXT" class="input_text" VALUE="#form.subject#" SIZE="50"></TD></TR></TABLE>
<BR>

<CFIF url.view is 1>
<INPUT TYPE="HIDDEN" NAME="View" VALUE="1">
<TABLE WIDTH="500" BORDER="1" CELLPADDING="5" BORDERCOLOR="BLUE"><TR BORDERCOLOR="WHITE"><TD><FONT CLASS="TEXT">
You have been invited to view the wish list of 	<b>#xName# (#qGetAcct.Email#)</b> at photoeye.com.
<BR><BR>
Click this link (or paste it into a browser):
<A HREF="http://www.photoeye.com/wishlist/index_Amazon.cfm?email=#qGetAcct.Email#">http://www.photoeye.com/wishlist/index_Amazon.cfm?email=#qGetAcct.Email#</A>
<BR><BR>
photoeye.com - explore art photography 

<!--- Invite to make a wish list --->
<CFELSE>

<TABLE WIDTH="500" BORDER="1" CELLPADDING="5" BORDERCOLOR="BLUE"><TR BORDERCOLOR="WHITE"><TD><FONT CLASS="TEXT">
Dear friend of photo-eye,
<BR><BR>
You have been invited to make a wish list by:
<BR><BR>
	<b>#xName# (#qGetAcct.Email#)</b>
<BR><BR>

Visit http://www.photoeye.com and when you see something you like click "add to wish list"!
<BR><BR>
photoeye.com - explore art photography 


</CFIF>



<CFIF IsDefined("form.Preview")>
<CFIF len(trim(form.message)) gt 0>
<BR>----------------------
<BR>Personal message:
<BR>----------------------
<BR>
#replace(form.Message, chr(13), "<BR>", "all")#
</CFIF>
</FONT></TD></TR></TABLE>
<BR><BR>
<INPUT TYPE="HIDDEN" NAME="MESSAGE" VALUE="#form.Message#">
<INPUT NAME="Edit" TYPE="SUBMIT" class="input_submit" VALUE="Edit">
<CFELSE>
</FONT></TD></TR></TABLE>
<BR>
<b>Personal Message (optional)</b>
<BR>
<TEXTAREA NAME="Message" ROWS="5" COLS="40">#form.Message#</TEXTAREA>
<BR>
<INPUT NAME="Preview" TYPE="SUBMIT" class="input_submit" VALUE="Preview Message">
</CFIF>

<INPUT NAME="Send" TYPE="SUBMIT" class="input_submit" VALUE="Send it">

</FONT>
</TD></TR></TABLE>
</FORM>



</CFIF>

</CFOUTPUT>
</FONT></DIV>
<cfinclude template="includes/dsp_account_index_bottom.cfm">
<!---<CFINCLUDE template="../templates/Footer_SITE.cfm">--->