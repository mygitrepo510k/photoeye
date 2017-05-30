<cfcomponent hint="I control some universal functions" displayname="Utilities">
	
	<cfset _errors = StructNew() />
	
	<cffunction name="generateToken" description="I create a new random token">
		<cfargument name="size" required="false" default="10" />
		<cfargument name="minNumbers" required="false" default="0" />
		<cfargument name="charSet" required="false" default="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ*%-" />

		<!--- Create the New Password --->
		<cfset var n = '' />
		<cfset var i = '' />
		<cfset var newPass = "">

		<!--- First insert all the required numbers --->
		<cfloop index="i" from="1" to="#arguments.minNumbers#">
			<cfset newPass &= Int(rand()*10)>
		</cfloop>

		<!--- Fill the rest of the string at random places with random chars --->
		<cfloop index="i" from="#arguments.minNumbers+1#" to="#arguments.size#">
			<cfset n = Mid( arguments.charSet, Int(rand()*Len(arguments.charSet))+1, 1) />
			<cfif Len(newPass) LT 1>
				<cfset newPass &= n />
			<cfelse>
				<cfset newPass = Insert(n, newPass, Int(rand()*(Len(newPass)+1)) ) />
			</cfif>
		</cfloop>
		<cfreturn newPass />
	</cffunction>
	
	<cffunction name="validationErrors" output="yes" description="I output validation errors for forms">
		<cfset var key = '' />
		<cfset var i = '' />
		<cfif IsDefined('_errors.found') AND _errors.found GT 0>
		
			<h2>#_errors.found# errors found</h2>
			<ul class="error_messages">
				<cfloop list="#structKeyList(_errors)#" index="key">
					<cfif key NEQ "FOUND">
						<cfloop from="1" to="#ArrayLen(_errors[key])#" index="i">
							<li>#_errors[key][i]#</li>
						</cfloop>
					</cfif>
				</cfloop>
			</ul>

			<script type="text/javascript">
				jQuery(document).ready(function(){
					<cfloop list="#structKeyList(_errors)#" index="key">
						<cfif key NEQ "FOUND">
							jQuery("*[name=#key#]").addClass('invalid');
						</cfif>
					</cfloop>
				})					
			</script>

		</cfif>		
	</cffunction>
	
	<cffunction name="pdError">
		<cfargument name="fieldname" />
		<cfargument name="message" />
		<cfif NOT IsDefined("_errors.found")>
			<cfset _errors = StructNew() />
			<cfset _errors.found = 0 />
		</cfif>
		<cfif NOT StructKeyExists(_errors,fieldname)>
			<cfset _errors[fieldname] = ArrayNew(1) />
		</cfif>
		<cfset ArrayAppend(_errors[fieldname],message) />
		<cfset _errors.found++ />
	</cffunction>

</cfcomponent>