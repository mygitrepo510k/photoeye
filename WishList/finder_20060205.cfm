<CFSET xWishListID = 0>

<CFIF IsDefined("form.CustNum")>
	<CFIF form.CustNum is "myWishList">
		<CFLOCATION URL="index.cfm?my=1">
	</CFIF>
</CFIF>

<CFIF IsDefined("url.email")>
	<CFSET xInsertNewWIshListIfNecessary = 1>
	<CFINCLUDE template="../templates/getCartContents.cfm">
	<CFSET form.email = url.email>
</CFIF>

<CFIF ((IsDefined("form.email") and len(trim(form.email)) gt 0) or ( IsDefined("form.Previous") and IsDefined("form.CustNum"))) and isDefined("cookie.useridNumber")>
	<CFQUERY NAME="qFindUser" DATASOURCE="photoeyecom"> 
    SElect FirstName, LastName, CustNumber
	FROM  MailingList_OM inner JOIN WishList on Custnumber = CustNum
	<CFIF IsDefined("form.Previous")>
	WHERE CustNumber = #form.CustNum#
	<CFELSE>
	WHERE Email = '#trim(form.email)#'
	</CFIF>
    </CFQUERY>
	
	<CFIF qFindUser.RecordCount is 0>
		<CFSET xErrorMessage = 'E-mail address "#trim(form.email)# not found.
<BR>
<BR>
<FORM METHOD="POST" ACTION="#xURLHOMe#/wishlist/invite.cfm?get=1"><input TYPE="SUBMIT" CLASS="Button" value="Invite #trim(form.email)# to make a wish list!" name="Invite" style="font-size: 10px">
<INPUT TYPE="HIDDEN" NAME="toEMAIL" VALUE="#trim(form.email)#">
</FORM></DIV>'>
	<CFELSE>
		<CFLOOP QUERY="qFindUser">
			<CFQUERY NAME="qGetWishList" DATASOURCE="photoeyecom"> 
		    SElect w.*
			FROM  WishList w INNER JOIN WishList_Items wi ON w.WishListID = wi.WishlistID
			WHERE w.CustNum = #qFindUser.CustNumber# and w.Active = 1 and w.Private = 0
		    </CFQUERY>
			<CFIF qGetWishList.RecordCount gt 0>
				<CFSET xWishListID = qGetWishList.WishlistID>
				<CFBREAK>
			</CFIF>
		</CFLOOP>
		
		<CFIF xWishListID gt 0>
			<cflock timeout="5" throwontimeout="No" type="Exclusive" scope="Session">
				<CFSET Session.BrowseWishListID = xWishListID>
			</CFLOCK>
			
			<!--- If Logged In --->
			<CFIF IsDefined("Session.AcctID")>
			<!--- Save in buddy list, if not already there --->
			<CFQUERY NAME="qWishList" DATASOURCE="photoeyecom"> 
		   SELECT *
		   FROM WishList
		   WHERE UserID = #Cookie.UserIDNumber#
			</CFQUERY>
			
			<CFQUERY NAME="qBuddyAlreadyThere" DATASOURCE="photoeyecom"> 
		   SELECT *
		   FROM WishList_Buddies
		   WHERE WishListID = #qWishList.WIshListID#
		   	AND BuddyCustNumber = #qGetWishList.CustNum#
			</CFQUERY>			
			
			<CFIF qBuddyAlreadyThere.RecordCount is 0>
				<CFQUERY NAME="qInsertBuddy" DATASOURCE="photoeyecom"> 
			   INSERT INTO WishList_Buddies
			   (WishListID, BuddyCustNumber)
			   VALUES
			   (#qWishList.WishListID#,#qGetWishList.CustNum#)
				</CFQUERY>
			</CFIF>
			</CFIF>
			<!--- End Buddy --->
			
			<CFLOCATION url="../templates/Wishlist.cfm">
		<CFELSE>
			<CFSET xErrorMessage = '<DIV ALIGN="CENTER">#qFindUser.FirstName# #qFindUser.LastName# (#trim(form.email)#) has no wish list.
<BR>
<BR>
<FORM METHOD="POST" ACTION="#xURLHOMe#/wishlist/invite.cfm?get=1"><input TYPE="SUBMIT" CLASS="Button" value="Invite #trim(qFindUser.FirstName)# to make one!" name="Invite" style="font-size: 10px">
<INPUT TYPE="HIDDEN" NAME="toEMAIL" VALUE="#trim(form.email)#">
</FORM></DIV>'>
		</CFIF>
		
	</CFIF>
	
	
</CFIF>

<CFINCLUDE template="index.cfm">