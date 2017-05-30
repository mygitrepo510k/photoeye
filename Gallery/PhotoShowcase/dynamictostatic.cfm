<!--- <cfset xserver="e:\http\photoeye"> --->
<cfset xserver="c:\cfusionmx\wwwroot\photoeye.com">
<cfset xUrl="http://localhost/photoeye/theguide/theguidelistings.cfm?Page=11&Sort=3&State=All">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye</title>
</head>

<body>
<cfhttp
URL="#xUrl#"
METHOD="Get">

<cfset IndexBuild="#CFHTTP.FILECONTENT#">
</cfhttp>


<cffile action="WRITE" file="#xserver#\theguide\theguidelistings.html" 
output="#indexbuild#" addnewline="Yes">

Done!


</body>
</html>
