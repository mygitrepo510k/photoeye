<CFPARAM NAME="form.Gallery" DEFAULT="Galleries">
<CFPARAM NAME="url.Gallery" DEFAULT="">
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
<CFMAIL from="#xEmail#" to="webmaster@photoeye.com" subject="Website Comment (#form.Gallery#)">--------------------------------
Website Comment (#form.Gallery#)
--------------------------------
From: <CFIF ISDEFINED("form.email")>#trim(form.email)#<CFELSE>anonymous (email not available)</CFIF>
On: #DateFormat(Now(), "mmmm d, yyyy")# at #TimeFormat(Now(), "h:mm tt")#
--------------------------------

#form.comment#
</CFMAIL>
</CFIF>
</CFIF>

<!--- Send them on their way --->
<CFIF url.Gallery is "">
	<CFLOCATION URL="index.cfm">
<CFELSEIF url.Gallery is 1>
	<CFLOCATION URL="RepresentedArtists/homepagePE.cfm">
<CFELSEIF url.Gallery is 2>
	<CFLOCATION URL="PhotoShowcase/homepagePSNew.cfm">
<CFELSEIF url.Gallery is 3>
	<CFLOCATION URL="MagnumArtists/index.cfm">
</CFIF>
