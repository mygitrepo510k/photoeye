<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TEST</title>
</head>
<body>

<cfif CGI.HTTPS_KEYSIZE GT 0>
	<cfif len(trim(CGI.QUERY_STRING)) GT 0>
		<cflocation url="http://www.photoeye.com#CGI.PATH_INFO#?#CGI.QUERY_STRING#" addtoken="no">
	<cfelse>
		<cflocation url="http://www.photoeye.com#CGI.PATH_INFO#" addtoken="no">
	</cfif>
</cfif>
<cfdump var="#CGI#">
This is the test page

</body>
</html>
