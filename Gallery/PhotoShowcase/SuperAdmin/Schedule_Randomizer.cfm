<!--- This example shows an example of cfschedule --->
<HTML>
<HEAD>
<TITLE>cfschedule Example</TITLE>
</HEAD>

<BODY>
<H3>cfschedule Example</H3>
<P>cfschedule provides a programmatic interface to
the ColdFusion scheduling engine.  You can run a specified
page at scheduled intervals with the option to write out
static HTML pages.  This allows you to offer users access 
to pages that publish data, such as reports, without
forcing users to wait while a database transaction is performed
to populate the data on the page.

<cfschedule action="UPDATE"
            task="RandomizePages" 
            operation="HTTPRequest"
            url="http://63.166.117.43/gallery/photoshowcase/forms/randomizekeywords.cfm"
            startdate="6/24/01"
            starttime="17:35:00"
            interval="300">
			
Keywords have been randomized!
</BODY>
</HTML>      