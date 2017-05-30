<!--- This example shows the use of randrange --->
<HTML>
<HEAD>
<TITLE>
randrange Example
</TITLE>
</HEAD>

<BODY BGCOLOR=silver>
<H3>randrange Example</H3>

<P>randrange returns an integer between two specified integers.
<CFIF IsDefined("FORM.myInt")>
    <P>randrange returned:
        <CFOUTPUT>#randrange(FORM.myInt, FORM.myInt2)#</CFOUTPUT>
</CFIF>

<CFFORM ACTION="testrandrange.cfm" METHOD="POST">
<P>Enter a number to seed the randomizer:
<CFINPUT TYPE="Text" NAME="MyInt" VALUE="1" RANGE="1,100000000"
  MESSAGE="Please enter a value between 1 and 100,000,000"
    VALIDATE="integer" REQUIRED="Yes">
<CFINPUT TYPE="Text" NAME="MyInt2" VALUE="500" RANGE="1,100000000"
  MESSAGE="Please enter a value between 1 and 100,000,000"
    VALIDATE="integer" REQUIRED="Yes">
<P><INPUT TYPE="Submit" NAME="">
</CFFORM>


</BODY>
</HTML>
