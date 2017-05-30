<!--- To circumvent problem with spiders going to the root for citation.cfm --->

<cfparam default="" name="cgi.QUERY_STRING">
<cflocation url="/bookstore/citation.cfm?#cgi.QUERY_STRING#" addToken="NO">
