<cflocation url="http://blog.photoeye.com" addToken="no">

<!--- <cfif isDefined('url.blog') and url.blog NEQ '1'>
	<cfset blog_start = find('1/', url.blog)>
	<cfset temp_blog = right(url.blog,(len(url.blog)-blog_start))>
	<cfset blog_end = find('html',temp_blog)>
	<cfif blog_end GT 0>
		<cfset temp_blog = left(temp_blog,blog_end)>
		<cfset temp_blog = replace(temp_blog, ".h", ".html", "ALL")>
	</cfif>
	<cfhttp url="http://rixonreed.blogspot.com#temp_blog#" method="GET" resolveurl="no"></cfhttp>
	<cfset content = cfhttp.fileContent>
	<cfset content = replace(content, "http://rixonreed.blogspot.com/", "/index.cfm?blog=1/", "ALL")>
	<cfoutput>#content#</cfoutput>
<cfelse>
	<cfhttp url="http://rixonreed.blogspot.com" method="GET" resolveurl="false"></cfhttp>
	<cfset content = cfhttp.fileContent>
	<cfset content = replace(content, "http://rixonreed.blogspot.com/", "/index.cfm?blog=1/", "ALL")>
	<cfoutput>#content#</cfoutput>
</cfif> --->
