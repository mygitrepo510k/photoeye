<!--- _errors variable
======================================
	
	_errors holds any errors which get caught. If _errors[fieldname] (ex: _errors.datepub) exists at all, then it will contain an Array of messages for that field.  If _errors[fieldname] is not defined, there are no errors for that field.
	
	ex: _errors.datepub[1] => 'You must pick a date'
		_errors.datepub[2] => 'Date must be greater than X'	
		_errors.found => 2 
--->

<!--- <cfdump var="#FORM#" /> --->

<!--- pdError(fieldname,message)
======================================

	pdError(fieldname, message) appends message to fieldname array in _errors.  Creates _errors[fieldname] if not defined.  Increments _errors.found
--->

<!--- Incoming FORM fieldnames --->
<cfset pdFields = "Title,Subtitle,Authors,Publisher,City,Country,Language,DatePub,Pages,Illustrations,Appendices,Size_Width_1,Size_Width_2,Size_Height_1,Size_Height_2,Description" />

<!--- See how many bindings there are, and append them to our pdFields list --->
<cfset bindingCount = 0 />

<cfloop from="1" to="1000" index="i">
	<cfif NOT isDefined("FORM.binding_#i#_Price")>
		<cfbreak />
	</cfif>
	<cfset bindingCount = i />	
</cfloop>

<!--- <cfoutput>#bindingCount# bindings found...</cfoutput> --->

<cfset bindingsPendingRemoval = 0 />
<cfloop from="1" to="#bindingCount#" index="i">
	<cfif StructKeyExists(FORM,'binding_#i#_delete')>
		<cfset bindingsPendingRemoval++ />
	<cfelse> <!--- validate --->
		<cfif Len(FORM['binding_#i#_price']) LT 1>
			<cfset pdError('binding_#i#_price','Binding must have a price.') />
		</cfif>
		<cfif Len(FORM['binding_#i#_link']) LT 1>
			<cfset pdError('binding_#i#_link','Binding must have a purchase link.') />
		</cfif>
		<cfif Len(FORM['binding_#i#_ISBN']) GT 1>
<!--- 			ISBN... --->
			<cfset FORM['binding_#i#_ISBN'] = Replace(FORM['binding_#i#_ISBN'],'-','','ALL') />
			<cfif NOT ReFindNoCase('^(97(8|9))?\d{9}(\d|X)$',FORM['binding_#i#_ISBN'])>
				<cfset pdError('binding_#i#_ISBN','Invalid ISBN detected.') />
			</cfif>
		</cfif>
	</cfif>
</cfloop>

<!--- validate! --->
<cfif bindingCount+bindingsPendingRemoval LT 1 OR (bindingCount-bindingsPendingRemoval) LT 1>
	<cfset pdError('bindings','You must include at least 1 binding.') />
</cfif>

<cfset fnRequired = "Title,Authors,Publisher,City,Country,Language,DatePub,Pages,Description" />

<cfloop list="#pdFields#" index="fn">
<!--- 	<cfdump var="#fn#" /> --->
	<cfset v = FORM[fn] />
	
	<!--- required fields --->
	<cfif fnRequired CONTAINS fn>
		<cfif NOT len(v) GT 0>
			<cfset pdError(fn,"#fn# is required.") />
		</cfif>
	</cfif>
	
	<!--- custom validations --->
	<cfswitch expression="#Trim(UCase(fn))#">
		<cfcase value="SIZE_WIDTH_1">
			<cfif NOT len(FORM[fn])>
				<cfset pdError(fn,"Width is required.") />
			</cfif>
		</cfcase>
		<cfcase value="SIZE_HEIGHT_1">
			<cfif NOT len(FORM[fn])>
				<cfset pdError(fn,"Height is required.") />
			</cfif>
		</cfcase>
	</cfswitch>
</cfloop>