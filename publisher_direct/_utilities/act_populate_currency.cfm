<cfset c = arrayNew(1) />

<cfset ci = 1 />
<cfset c[ci] = StructNew() />
<cfset c[ci].currency = "US Dollars" />
<cfset c[ci].code = "USD" />
<cfset c[ci].symbol = "$" />

<cfset ci = 2 />
<cfset c[ci] = StructNew() />
<cfset c[ci].currency = "Canadian Dollars" />
<cfset c[ci].code = "CAD" />
<cfset c[ci].symbol = "$" />

<cfset ci = 3 />
<cfset c[ci] = StructNew() />
<cfset c[ci].currency = "Euros" />
<cfset c[ci].code = "EUR" />
<cfset c[ci].symbol = "&euro;" />

<cfset ci = 4 />
<cfset c[ci] = StructNew() />
<cfset c[ci].currency = "British Pounds" />
<cfset c[ci].code = "GBP" />
<cfset c[ci].symbol = "&pound;" />

<cfset ci = 5 />
<cfset c[ci] = StructNew() />
<cfset c[ci].currency = "Japanese Yen" />
<cfset c[ci].code = "JPY" />
<cfset c[ci].symbol = "&yen;" />

<cfset ci = 6 />
<cfset c[ci] = StructNew() />
<cfset c[ci].currency = "Australian Dollars" />
<cfset c[ci].code = "AUD" />
<cfset c[ci].symbol = "$" />

<cfset ci = 7 />
<cfset c[ci] = StructNew() />
<cfset c[ci].currency = "Norwegian Kronor" />
<cfset c[ci].code = "NOK" />
<cfset c[ci].symbol = "kr" />

<cfloop from="1" to="#ArrayLen(c)#" index="i">
	<cfquery name="qCurrency" dataSource="#application.dsn#">
		Update Currency
			SET symbol = '#c[i].symbol#'
			WHERE code = '#c[i].code#'
	</cfquery>
</cfloop>

<cfquery name="qCurrencies" dataSource="#application.dsn#">
	SELECT * FROM Currency
</cfquery>

<cfdump var="#qCurrencies#" />