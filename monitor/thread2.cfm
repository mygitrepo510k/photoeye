


<cftry>


<cfparam name="url.stopthreadid" default="">
<cfif len(url.stopthreadid)>
<cfset all = createobject("java", "java.lang.Thread").getAllStackTraces().keySet().toArray()>
<cfloop array="#all#" index="thread">
	<cfif not compare(thread.getName(), url.stopthreadid)>
		STOPPING
		<cfset thread.sleep(1000)>
		<cfset thread.interrupt()>
		<cfset thread.stop()>
		<cfbreak />
	</cfif>
</cfloop>
</cfif>


	<cfset util = createObject('component', 'cfc.utils.dateUtil')>

<!--- Create the thread object --->
<cfobject type="JAVA" action="Create" name="thread" class="java.lang.Thread">

<!--- Get all stack traces from the thread object --->
<cfset stackTrace = thread.getAllStackTraces()>

<!--- Convert the entrySet into an array --->
<cfset stackArray = stackTrace.entrySet().toArray()>

<cfoutput>
    <!--- Loop over the entrySet array --->
    <cfloop from="1" to="#ArrayLen(stackArray)#" index="sIndex">
        <!--- Get the current thread values --->
        <cfset thisThread = stackArray[sIndex].getValue()>
        <cfset c = 0>
        <!--- Loop over current thread values --->
        <cfloop from="1" to="#ArrayLen(thisThread)#" index="tIndex">
            <!--- Get the filename for this thread --->
            <cfset thisThreadFile = thisThread[tIndex].getFileName()>
            <!--- If the file name contains .cfm output it --->
            <cfif isDefined("thisThreadFile") AND thisThreadFile CONTAINS ".cf">
            	<cfset c++>
            	<!---<cfdump var="#stackArray[sIndex].getKey()#" abort="false">--->
                <cftry>#util.EpochTimeToLocalDate(stackArray[sIndex].getKey().getSTartTime()/1000)#<cfcatch></cfcatch></cftry>
            	<cftry>#util.EpochTimeToLocalDate(stackArray[sIndex].getKey().getCreationTime()/1000)#<cfcatch></cfcatch></cftry>
                #stackArray[sIndex].getKey().getId()#
                	- #stackArray[sIndex].getKey().getName()#
                	- #stackArray[sIndex].getKey().isAlive()#
                	- #stackArray[sIndex].getKey().isInterrupted()#
                	- #stackArray[sIndex].getKey().getState().toString()#
                	- #thisThread[tIndex].ToString()#<br>
            </cfif>
        </cfloop>
        <cfif c>
        	<!---<cfdump var="#stackArray[sIndex].getKey()#">--->
			<hr>
		</cfif>
    </cfloop>
</cfoutput>


<cfcatch>


<cfdump var="#cfcatch#">
</cfcatcH>
</cftry>