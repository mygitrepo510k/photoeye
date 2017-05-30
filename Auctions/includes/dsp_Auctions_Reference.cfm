<!--- Carry over the cookie --->
<cfif IsDefined("url.UID")>
	<cfif url.UID>
		<cfset cookie.UserIdNumber = url.UID>
	</cfif>
</cfif>

<cfset xStillAvailableHeaderShown = 0>

<cfinclude template="/templates/UserIdentification.cfm">

<cfparam name="url.size" default="1">
<cfparam name="url.view" default="CurrentAuctions">

<cfif url.Size is "2">
	<cfset xFontSize="2">
	<cfset xImageHeight="80">
	<cfset xImagewidth="80">
<cfelse>
	<cfset xFontSize="1">
	<cfset xImageHeight="50">
	<cfset xImagewidth="50">
</cfif>

<cfif Url.View EQ "CurrentAuctions">
	<cfset xThisPageMenu = 1>
</cfif>


<div align="center">

<!--- Page Title --->
<table width="700" align="center" cellpadding="0" cellspacing="0">
<tr height="40"><td></td></tr>
<tr>
	<td width="100"></td>
	<td align="center" class="Header">
		<font color="Black" face="Times, 'Times-Roman', serif" size="5">
		A</font><font color="Black" face="Times, 'Times-Roman', serif" size="4">UCTION</font></b>
		</font> <font color="Black" face="Times, 'Times-Roman', serif" size="5">
		R</font><font color="Black" face="Times, 'Times-Roman', serif" size="4">EFERENCES</font></b>
		</font></td>
	<td width="100" align="center"></td>
</tr>

<TR><td width="100"></td><TD>

<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
<BR>
Over the last few years, several important books documenting the history of photographic literature have appeared: <I>The Book of 101 Books: Seminal Photographic Books of the Twentieth Century</I> (2001); <I>The Photobook: A History</I>, volume I (2004; volume II due out in early 2006); <I>The Open Book: A History of the Photographic Book from 1878 to the present</I> (2004); and <I>Fotografía Pública: Photography in Print 1919-1939</I> (1999). These publications affirm the photobook as a distinct field of interest to critics, scholars, and serious collectors. Books included in these volumes would be a stellar addition to any collection, not to mention excellent investments. A small cover icon next to an auction listing indicates inclusion in one or more of these references.  
</FONT></TD><td width="100" align="center"></td></TR>
</table>

</div>
