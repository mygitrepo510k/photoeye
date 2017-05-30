<!--- This example shows the use of Randomize --->
<HTML>
<HEAD>
<TITLE>
Randomize Example
</TITLE>
</HEAD>

<BODY BGCOLOR=silver>
<H3>Randomize Example</H3>

<P>Call Randomize to seed the random number generator. 
This helps to ensure the randomness of numbers generated 
by the Rand function.
<CFIF IsDefined("FORM.myRandomInt")>
    <CFIF IsNumeric(FORM.myRandomInt)>
        <CFOUTPUT><P><b>Seed value is #FORM.myRandomInt#</b>
          </CFOUTPUT><BR>
        <CFSET r=Randomize(FORM.myRandomInt)>
        <cfloop index="i" from="1" to="10" step="1">
           <CFOUTPUT>Next random number is #Rand()#</CFOUTPUT><BR>
        </cflooP><BR>
    <CFELSE>
        <P>Please enter a number.
    </CFIF>
</CFIF>
<FORM ACTION="testrandom.cfm" METHOD="POST">
<P>Enter a number to seed the randomizer:
<INPUT TYPE="Text" NAME="MyRandomInt">
<P><INPUT TYPE="Submit" NAME="">
</FORM>

</BODY>
</HTML>       
