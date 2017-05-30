<cfset xTimeDifference = application.xtimedifference>

<!--- Get time till auction ends --->
<!--- Auction time is Mountain Time --->
<!--- xTimeDifference set in Application --->
<!--- Works for Leap Years, auctions can be years away, even millenia --->

<cfif xTimeDifference gte 0>
	<cfset xyears = datepart("yyyy", qGetAuctionAdmin.TimeEnd) - (datepart("yyyy",Now() - CreateTime(xTimeDifference,0,0)))>
	<cfset xmonths = datepart("m", qGetAuctionAdmin.TimeEnd) - (datepart("m",Now() - CreateTime(xTimeDifference,0,0)))>
	<cfset xdays = datepart("d", qGetAuctionAdmin.TimeEnd) - (datepart("d",Now() - CreateTime(xTimeDifference,0,0)))>
	<cfset xhours = datepart("h", qGetAuctionAdmin.TimeEnd) - (datepart("h",Now() - CreateTime(xTimeDifference,0,0)))>
<cfelse>
	<cfset xTimeDifferenceAbs = Abs(xTimeDifference)>
	<cfset xyears = datepart("yyyy", qGetAuctionAdmin.TimeEnd) - (datepart("yyyy",Now() + CreateTime(xTimeDifferenceAbs,0,0)))>
	<cfset xmonths = datepart("m", qGetAuctionAdmin.TimeEnd) - (datepart("m",Now() + CreateTime(xTimeDifferenceAbs,0,0)))>
	<cfset xdays = datepart("d", qGetAuctionAdmin.TimeEnd) - (datepart("d",Now() + CreateTime(xTimeDifferenceAbs,0,0)))>
	<cfset xhours = datepart("h", qGetAuctionAdmin.TimeEnd) - (datepart("h",Now() + CreateTime(xTimeDifferenceAbs,0,0)))>
</cfif>

<cfset xminutes = datepart("n", qGetAuctionAdmin.TimeEnd) - (datepart("n",Now()))>
<cfset xseconds = datepart("s", qGetAuctionAdmin.TimeEnd) - (datepart("s",Now()))>

<cfif xseconds lt 0>
	<cfset xseconds = xseconds + 60>
	<cfset xminutes = xminutes - 1>
</cfif>

<cfif xminutes lt 0>
	<cfset xminutes = xminutes + 60>
	<cfset xhours = xhours - 1>
</cfif>

<cfif xhours lt 0>
	<cfset xhours = xhours + 24>
	<cfset xdays = xdays - 1>
</cfif>

<cfloop condition="xyears gt 0">
	<cfset xmonths= xmonths + 12 >
	<cfset xYears = xYears - 1>
</cfloop>

<cfset xLoopCounter = 1>
<cfset xYearOffset = 0>

<cfloop condition="xmonths gt 0">

	<cfset xmonthincrement = 31>

	<cfif xyearoffset is 0>
		<cfset xnextmonth = datepart("m",Now()-CreateTime(xTimeDifference,0,0))+xLoopCounter>
	<cfelse>
		<cfset xnextmonth = xLoopCounter>
	</cfif>

	<cfif xnextmonth is 13>
		<cfset xnextmonth = 1>
		<cfset xyearOffset = xyearoffset + 1>
		<cfset xLoopCounter = 1>
	</cfif>

	<cfif xnextmonth is 3>
		<cfset xLeapYear = 0>

		<cfif (right(datepart("yyyy",Now()-CreateTime(xTimeDifference,0,0)) + xYearOffSet, 2) mod 4) is 0>
			<cfset xLeapYear = 1>
		</cfif>

		<cfif xLeapYear is 1>
			<cfset xmonthincrement = 29>
		<cfelse>
			<cfset xmonthincrement = 28>
		</cfif>

	<cfelseif xnextmonth is 5>
		<cfset xmonthincrement = 30>
	<cfelseif xnextmonth is 7>
		<cfset xmonthincrement = 30>
	<cfelseif xnextmonth is 10>
		<cfset xmonthincrement = 30>
	<cfelseif xnextmonth is 12>
		<cfset xmonthincrement = 30>
	</cfif>

	<cfset xdays = xdays + xmonthincrement>
	<cfset xMonths = xMonths - 1>
	<cfset xLoopCounter = xLoopCounter + 1>

</cfloop>

<cfset xLoopCounter = 1>
<cfset xYearOffset = 0>

<cfif xmonths lt 0>
	<cfset xYears = xYears+1>
</cfif>

<cfset xTime = xdays * 24 * 60 * 60 + xhours * 60 * 60 + xminutes * 60 + xseconds>

<cfif xMonths lt 0 or xYears lt 0 or xTime lt 0>
	<cfset xAuctionEnded = 1>
<cfelse>
	<cfset xAuctionEnded = 0>
</cfif>
