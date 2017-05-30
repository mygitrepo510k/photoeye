
<!--- Pass on their comment, if there is one--->
<CFIF IsDefined("form.comment")>

<CFIF ISDEFINED("form.email")>
	<cfif len(trim(form.email))>0>
		<cfset xEmail = "#trim(form.email)#">
	<cfelse>
		<cfset xEmail = "webmaster@photoeye.com">
	</cfif>
<CFELSE>
	<cfset xEmail = "webmaster@photoeye.com">
</CFIF> 


<CFIF len(trim(form.comment)) is not 0>
<CFMAIL from="#xEmail#" to="auctions@photoeye.com" bcc="webmaster@photoeye.com" subject="Website Comment (Auctions)">--------------------------------
Website Comment (Auctions)
--------------------------------
From: <CFIF ISDEFINED("form.email")>#trim(form.email)#<CFELSE>anonymous (email not available)</CFIF>
On: #DateFormat(Now(), "mmmm d, yyyy")# at #TimeFormat(Now(), "h:mm tt")#
--------------------------------

#form.comment#
</CFMAIL>
</CFIF>
</CFIF>

<!--- Send them on their way --->
<CFLOCATION URL="../index.cfm">
