<cfparam name="xmenupath" default="">
<cfoutput>
<font face="'Trebuchet MS', Verdana, Arial, Helvetica, sans-serif" size="2">

<CFIF Page is not "photo-eye booklist">
<A HREF="#xmenupath#index.cfm"><FONT COLOR="maroon"><strong>HOME</strong></FONT></A> &middot; 
</CFIF>

<CFIF Page is not "Survey">
    <A HREF="#xmenupath#survey.cfm"><FONT COLOR="maroon"><strong>READER SURVEY</strong></FONT></A> 
    &middot; 
  </CFIF>

<CFIF Page is not "Booklist Subscriptions">
<A HREF="#xmenupath#subscribe.cfm"><FONT COLOR="maroon"><strong>SUBSCRIPTIONS</strong></FONT></A> &middot; 
</CFIF>

<CFIF Page is not "Advertise">
<A HREF="#xmenupath#1advertise.cfm"><FONT COLOR="maroon"><strong>ADVERTISE</strong></FONT></A> &middot; 
</CFIF>

<CFIF Page is not "Booklist Back Issues">

<A HREF="#xmenupath#backissues.cfm"><FONT COLOR="Maroon"><strong>BACK ISSUES</strong></FONT></A> &middot;  <!---<CFIF Page is not "Booklist Contacts">&middot;</CFIF>
--->
</CFIF>

<CFIF Page is not "Where To Find Us">
    <A HREF="#xmenupath#wheretofindus.cfm"><FONT COLOR="maroon"><strong>WHERE TO FIND US</strong></FONT></A> 
   <CFIF Page is not "Booklist Contacts">&middot;</CFIF> 
  </CFIF>

<CFIF Page is not "Booklist Contacts">
<A HREF="#xmenupath#contact.cfm"><FONT COLOR="Maroon"><strong>CONTACT US</strong></FONT></A>
</CFIF>
</font>
</cfoutput>