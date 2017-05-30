<CFSET xWishListID = 0>

<CFIF IsDefined("form.email") and len(trim(form.email)) gt 0 and isDefined("cookie.useridNumber")>
	<CFQUERY NAME="qFindUser" DATASOURCE="photoeyecom"> 
    SElect FirstName, LastName, CustNumber
	FROM  MailingList_OM
	WHERE Email = '#trim(form.email)#'
    </CFQUERY>
	
	<CFIF qFindUser.RecordCount is 0>
		<CFSET xErrorMessage = "E-mail address '#trim(form.email)#' not found.">
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
			
			<!--- Save in buddy list if logged in 
			<CFQUERY NAME="qGetWishBuddies" DATASOURCE="photoeyecom"> 
		   SELECT *
		   FROM WishList_Buddies
		   WHERE wb.CusNumber = #xAcctID#
			</CFQUERY>
			--->
			
			<CFLOCATION url="../templates/Wishlist.cfm">
		<CFELSE>
			<CFSET xErrorMessage = "No wish list found for #qFindUser.FirstName# #qFindUser.LastName# (#trim(form.email)#).">
		</CFIF>
	</CFIF>
	
	
</CFIF>

<CFINCLUDE template="index.cfm">