<cfscript>
	function generateGettersandSetters(camel_attribute){
	return '<cffunction name="set#camel_attribute#" access="public" returntype="void" output="false">
		<cfargument name="#LCase(camel_attribute)#" type="string" required="true" />
		<cfset variables.instance.#LCase(camel_attribute)# = arguments.#LCase(camel_attribute)#  />
	</cffunction>
	<cffunction name="get#camel_attribute#" access="public" returntype="string" output="false">
		<cfreturn variables.instance.#LCase(camel_attribute)# />
	</cffunction>';
	}
</cfscript>