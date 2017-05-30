<cfparam name="nPP" default="10"> <!--- either from URL or Form scope --->
<cfparam name="variables.dsp" default="Top"> <!--- for displaying multiple navs on same page --->
<cfparam name="url.st" default="1"> <!--- start record --->

<cfoutput>
<table width="700" cellpadding="0" cellspacing="0" border="0">
<cfset numPerPage = nPP>
<cfset endRow = qGetAuctionAdmin.recordCount> <!--- default value --->
<cfif qGetAuctionAdmin.recordCount GT numPerPage>
	<cfset startRow = url.st>
	<cfset numPages = ceiling(qGetAuctionAdmin.recordCount / numPerPage)>
	<cfset thisPage = ceiling(startRow / numPerPage)>
	<!--- determine current endRow--->
	<cfif startRow + numPerPage LTE qGetAuctionAdmin.recordCount>
		<cfset endRow = startRow + numPerPage - 1>
	</cfif>
	<cfif numPages GT 1>
		<tr>
			<td style="padding-top:10px;padding-bottom:5px" width="10%" nowrap>
				Pages: (#numPages#) 
				<!--- display "first page" link --->
				<cfif thisPage - 2 GT 1>
					<a href="#cgi.script_name#?st=1&nPP=#numPerPage#" title="View First Page" style="text-decoration:underline">&laquo; First</a> ...
				</cfif>
				<!--- display page nav links --->
				<cfloop from="#ceiling(thisPage - 2)#" to="#ceiling(thisPage + 2)#" index="i">
					<cfset curStartRow = (i - 1) * numPerPage + 1>
					<cfset curEndRow = i * numPerPage>
					<cfset curPage = curEndRow / numPerPage>
					<cfif curEndRow GT qGetAuctionAdmin.recordCount>
						<cfset curEndRow = qGetAuctionAdmin.recordCount>
					</cfif>
					<cfif curPage GT 0 AND curPage LTE numPages>
						<cfif thisPage EQ curPage>
							<b>[#curPage#]</b>
						<cfelse>
							<a href="#cgi.script_name#?st=#curStartRow#&nPP=#numPerPage#" title="View Items #curStartRow# - #curEndRow#" style="text-decoration:underline">#curPage#</a> 
						</cfif>
					</cfif>
				</cfloop>
				<!--- display "last page" link--->
				<cfif numPages - thisPage GT 2>
					... <a href="#cgi.script_name#?st=#iif(numPages * numPerPage + 1 LTE qGetAuctionAdmin.recordCount, numPages * numPerPage + 1, (numPages - 1) * numPerPage + 1)#&nPP=#numPerPage#" title="View Last Page" style="text-decoration:underline">Last &raquo;</a> 
				</cfif>
			</td>
			<!--- display "show X per page" selection --->
			<form action="#cgi.script_name#" name="thisForm_#variables.dsp#" method="post">
			<td align="right" style="padding-top:10px;padding-left:20px;padding-bottom:5px">
				<select name="nPP" size="1" style="font-family:Verdana,Arial;font-size:10px;color:Maroon" onChange="document.thisForm_#variables.dsp#.submit()">
					<cfloop from="10" to="50" step="10" index="i">
						<cfif i LTE qGetAuctionAdmin.recordCount>
							<option value="#i#" <cfif numPerPage EQ i>SELECTED</cfif>>#i# <cfif numPerPage EQ i>results per page</cfif></option>
						</cfif>
					</cfloop>
					<cfif qGetAuctionAdmin.recordCount GT 100>
						<cfloop from="100" to="200" step="50" index="i">
							<cfif i LTE qGetAuctionAdmin.recordCount>
								<option value="#i#" <cfif numPerPage EQ i>SELECTED</cfif>>#i# <cfif numPerPage EQ i>results per page</cfif></option>
							</cfif>
						</cfloop>					
					</cfif>
					<cfif qGetAuctionAdmin.recordCount LTE 200>
						<option value="#qGetAuctionAdmin.recordCount#" <cfif numPerPage EQ i>SELECTED</cfif>>Show All #qGetAuctionAdmin.recordCount#</option>
					</cfif>
				</select>
			</td>					
			</form>			
		</tr>
	</cfif> <!--- end if (numPages GT 1) --->	
</cfif> <!--- end if (qGetAuctionAdmin.recordCount GT numPerPage) --->		
</table>
</cfoutput>
