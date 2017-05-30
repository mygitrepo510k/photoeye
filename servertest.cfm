<CFSET asdf=1>
<cfquery name="qQuery" datasource="photoeyecom">
	Select top 1 * from stock
</cfquery>
<cfif qQuery.recordcount is 1>
	<CFOUTPUT>Hello World<br></CFOUTPUT>
</cfif>
<cfif fileExists("C:\EdgeWeb\ServerInfo_AP1.txt")>
	<cffile action="read" file="C:\EdgeWeb\ServerInfo_AP1.txt" variable="variables.EWHFileContent">
	<cfoutput>#variables.EWHFileContent#</cfoutput>
<cfelse>
	NO SERVER INFO FILE FOUND!
</cfif>
