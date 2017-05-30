<!--- <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase | Update Successful!</title>
</head>

<body bgcolor="Silver" link="#000080" vlink="#000080">
 --->
	<br>
	<br>
	<br>
	<br>
	<table width="600" align="center">
	<tr><td align="center"></td>
		<p align="center">
	<font color="Black" size="4" face="Verdana, Helvetica, Arial, Sans-Serif"><b>
	Showcase Update Successful!<br><br>
	<img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"><br><br>
	</b></font>

	<br>
	</p>
<cfoutput>
<cfif #url.step# is 2>
<form method="post" action="step2Education.cfm?custnumber=#form.CustNumber#"><font color="Black" size="2" face="Verdana, Helvetica, Arial, Sans-Serif">
Your data has been saved. Choose a different step from the options on the left or click button to continue to the next step.</font>
	<p align="center">
  <br>
  <INPUT TYPE="HIDDEN" NAME="Custnumber" value="#form.Custnumber#">
  <INPUT TYPE="SUBMIT" VALUE="Continue to Next Step">

  </p>
</form>
</cfif>

<cfif #url.step# is 3>
<form method="post" action="step3CollectionsURLNew.cfm?custnumber=#form.CustNumber#"><font color="Black" size="2" face="Verdana, Helvetica, Arial, Sans-Serif">
Your data has been saved. Choose a different step from the options on the left or click button to continue to the next step.</font>
	<p align="center">
  <br>
  <INPUT TYPE="HIDDEN" NAME="Custnumber" value="#form.Custnumber#">
  <INPUT TYPE="SUBMIT" VALUE="Continue to Next Step">
  </p>
</form>
</cfif>


<cfif #url.step# is 4>
<form method="post" action="step4SoloShowsURLNew.cfm?custnumber=#form.CustNumber#"><font color="Black" size="2" face="Verdana, Helvetica, Arial, Sans-Serif">
Your data has been saved. Choose a different step from the options on the left or click button to continue to the next step.</font>
	<p align="center">
  <br>
  <INPUT TYPE="HIDDEN" NAME="Custnumber" value="#form.Custnumber#">
  <INPUT TYPE="SUBMIT" VALUE="Continue to Next Step">
  </p>
</form>
</cfif>

<cfif #url.step# is 5>
<form method="post" action="step5GroupShowsURLNew.cfm?custnumber=#form.CustNumber#"><font color="Black" size="2" face="Verdana, Helvetica, Arial, Sans-Serif">
Your data has been saved. Choose a different step from the options on the left or click button to continue to the next step.</font>
	<p align="center">
  <br>
  <INPUT TYPE="HIDDEN" NAME="Custnumber" value="#form.Custnumber#">
  <INPUT TYPE="SUBMIT" VALUE="Continue to Next Step">
  </p>
</form>
</cfif>

<cfif #url.step# is 6>
<form method="post" action="step6AwardsURLNew.cfm?custnumber=#form.CustNumber#"><font color="Black" size="2" face="Verdana, Helvetica, Arial, Sans-Serif">
Your data has been saved. Choose a different step from the options on the left or click button to continue to the next step.</font>
	<p align="center">
  <br>
  <INPUT TYPE="HIDDEN" NAME="Custnumber" value="#form.Custnumber#">
  <INPUT TYPE="SUBMIT" VALUE="Continue to Next Step">
  </p>
</form>
</cfif>

<cfif #url.step# is 7>
<form method="post" action="step7BibliographyURLNew.cfm?custnumber=#form.CustNumber#"><font color="Black" size="2" face="Verdana, Helvetica, Arial, Sans-Serif">
Your data has been saved. Choose a different step from the options on the left or click button to continue to the next step.</font>
	<p align="center">
  <br>
  <INPUT TYPE="HIDDEN" NAME="Custnumber" value="#form.Custnumber#">
  <INPUT TYPE="SUBMIT" VALUE="Continue to Next Step">
  </p>
</form>
</cfif>




<cfif #url.step# is 8>
<cfif qgetSetup.multiartists is 0>
<form method="post" action="step8StatementsURLNew.cfm?custnumber=#form.CustNumber#">
<font color="Black" size="2" face="Verdana, Helvetica, Arial, Sans-Serif">
Your data has been saved. Choose a different step from the options on the left or click button to continue to the next step.</font>
	<p align="center">
  <br>
  <INPUT TYPE="HIDDEN" NAME="Custnumber" value="#form.Custnumber#">
  <INPUT TYPE="SUBMIT" VALUE="Continue to Next Step">
  </p>
</form>
<cfelse>
<!--- <form method="post" action="step11DefaultTemplateURL.cfm?custnumber=#form.CustNumber#&Portfolio='Portfolio1'"> ---><font color="Black" size="2" face="Verdana, Helvetica, Arial, Sans-Serif">

Your data has been saved.  Click step 11, Artwork Template, on the left table of contents bar to begin cataloguing your images.</font>
</cfif>
</cfif>


<cfif #url.step# is 9>
<form method="post" action="step2ChronologyURLNew.cfm?custnumber=#form.CustNumber#"><font color="Black" size="2" face="Verdana, Helvetica, Arial, Sans-Serif">
Your data has been saved. Choose a different step from the options on the left or click button to continue to the next step.</font>
	<p align="center">
  <br>
  <INPUT TYPE="HIDDEN" NAME="Custnumber" value="#form.Custnumber#">
  <INPUT TYPE="SUBMIT" VALUE="Continue to Next Step">
  </p>
</form>
</cfif>

<cfif #url.step# is 10>
<form method="post" action="step9RecommendedBooksURLNew.cfm?custnumber=#form.CustNumber#"><font color="Black" size="2" face="Verdana, Helvetica, Arial, Sans-Serif">
Your data has been saved. Choose a different step from the options on the left or click button to continue to the next step.</font>
	<p align="center">
  <br>
  <INPUT TYPE="HIDDEN" NAME="Custnumber" value="#form.Custnumber#">
  <INPUT TYPE="SUBMIT" VALUE="Continue to Next Step">
  </p>
</form>
</cfif>  

<cfif #url.step# is 11>
<!--- <form method="post" action="step11DefaultTemplateURL.cfm?custnumber=#form.CustNumber#&Portfolio='Portfolio1'"> ---><font color="Black" size="2" face="Verdana, Helvetica, Arial, Sans-Serif">

Your data has been saved.  Click step 11, Artwork Template, on the left table of contents bar to begin cataloguing your images.</font>
	<p align="center">
  <br>
<!---   <INPUT TYPE="HIDDEN" NAME="Custnumber" value="#form.Custnumber#">
  <INPUT TYPE="SUBMIT" VALUE="Continue to Next Step"> --->
  </p>
  
</cfif>
</cfoutput>
</table>


