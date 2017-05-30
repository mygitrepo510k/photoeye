<!--- Header --->
<CFSET xShowMenu = 0>
<cfset xShowWishList = 0>
<CFSET xShowBackButton = 0>
<CFSET xAllMaroon = 1>
<CFSET xTitle="Wish List">
<CFSET xPathToRoot="../">
<cfinclude template="../templates/Header.cfm">

<CFPARAM NAME="xErrorMessage" DEFAULT="">


<CFIF len(xErrorMessage) gt 0>
<TABLE WIDTH="550" CELLSPACING="10" ALIGN="CENTER">
<TR><TD>
<FONT FACE="Verdana, Arial, Helvetica, sans-serif">
<FONT COLOR="RED"><CFOUTPUT>#xErrorMessage#</CFOUTPUT></FONT>
</TD></TR>
</TABLE>
</CFIF>




<CFSET xShowHeaderAndFooter = 0>
<CFINCLUDE TEMPLATE="../templates/wishlistdebug.cfm">

<CFINCLUDE template="../templates/Footer_SITE.cfm">