<CFPARAM NAME="Unmatted" Default="0">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase | Setup</title>
</head>

<body bgcolor="Silver" link="#000080" vlink="#000080">
<cfoutput>

<font color="Red" size="2" face="Verdana, Helvetica, Arial, Sans-Serif">


<cfset error=0>



<!--- If Other Medium is chosen, there has to be info in OtherMed, otherwise
an error is generated--->
<cfif #form.Medium# is 'Other Medium' and #len(form.OtherMed)# is 0>
	<cfset error=4>
</cfif>


<!--- If OtherMed has information, a Other Medium has to be chosen, otherwise 
an error is generated--->
<cfif #len(form.OtherMed)# GT 0 and #form.Medium# IS NOT 'Other Process'>
	<cfset error=5>
</cfif>


<!--- If Other Format is chosen, there has to be info in Format2, otherwise
an error is generated--->
<cfif #form.Format1# is 'Other Format' and #len(form.Format2)# is 0>
	<cfset error=6>
</cfif>


<!--- If Format2 has information, a Other Format has to be chosen, otherwise 
an error is generated--->
<cfif  #len(form.Format2)# GT 0 and #form.Format1# IS NOT 'Other Format'>
	<cfset error=7>
</cfif>

<!--- If Other Genre is chosen, there has to be info in Genre2, otherwise
an error is generated--->
<cfif #form.Genre1# is 'Other Genre' and #len(form.Genre2)# is 0>
	<cfset error=8>
</cfif>


<!--- If Genre2 has information, then Other Genre has to be chosen, otherwise 
an error is generated--->
<cfif #len(form.Genre2)# GT 0 and #form.Genre1# IS NOT 'Other Genre'>
	<cfset error=9>
</cfif>

<!--- Finished Error = 4 --->

<!--- Make sure there is Medium selected --->
<cfif #len(form.Medium)# is 0 and #len(trim(form.OtherMed))# is 0>
	<cfset error=1>
	error=1a
</cfif>

<!--- 2 choices for Medium and Genre--->

<cfif #form.Medium# is NOT 'Other Process' and #len(trim(form.OtherMed))# GT 0>
	<cfset error=1>
	error=1b
</cfif>


<cfif #form.Genre1# is NOT 'Other Genre' and #len(trim(form.Genre2))# GT 0>
	<cfset error=1>
	error=2
</cfif>

<cfif #form.Format1# is NOT 'Other Format' and #len(trim(form.Format2))# GT 0>
	<cfset error=1>
	error=2a
</cfif>

<!--- Make sure there is genre selected --->
<cfif #len(form.genre1)# is 0 and #len(trim(form.Genre2))# is 0>
	<cfset error=1>
	error=3
</cfif>

<cfif #len(form.Format1)# is 0 and #len(trim(form.Format2))# is 0>
	<cfset error=1>
	error=3
</cfif>


<!--- illegal Characters--->

<cfif #Find('"', form.Height1)# GT 0 or  #Find('"', form.Width1)# GT 0>
	<cfset error=1>
	error=4
</cfif>

<cfif #Find('"', form.MatHeight1)# GT 0 or  #Find('"', form.MatWidth1)# GT 0>
	<cfset error=1>
	error=5
</cfif>

<cfif #Find('$', form.Price1)# GT 0>
	<cfset error=1>
	error=6
</cfif>

<cfif #Find(',', form.Price1)# GT 0>
	<cfset error=1>
	error=7
</cfif>

<cfif #Find('.', form.Price1)# GT 0>
	<cfset error=1>
	error=8
</cfif>

<!--- Editioned, but no editionsz1 --->

<cfif #form.editioned1# is 1 and #len(form.EditionSz1)# is 0>
	<cfset error=1>
	error=9
</cfif>

<!--- Not Editioned, but there is editionsz1 or editionno1 --->

<cfif #form.editioned1# is 0 and (#len(form.editionsz1)# GT 0 or #len(form.EditionNo1)# GT 0)>
	<cfset error=1>
	error=10
</cfif>



<!---Unmatted but there is a matheight or matwidth--->

<cfif #UnMatted# is 1 and (#len(form.MatHeight1)# GT 0 or #len(form.MatWidth1)# GT 0)>
	<cfset error=1>
	error=11
</cfif>


<!--- <!--- Check if Editioned and there is an Edition No but no Edition Sz --->
<cfif #form.editioned1# is 1 and #len(form.EditionNo1)# GT 0 and #len(form.editionsz1)# is 0>
	<cfset error=1>
	error=12
</cfif> --->

<!--- <!--- If print structure, make sure the print is editioned--->
<cfif #len(form.addinfo1)# GT 0 and #form.editioned1# is 0>
	<cfset error=1>
	error=13
</cfif>
 --->

<!--- Make sure there is both a height and width --->
<cfif #len(form.height1)# GT 0 AND #len(form.width1)# is 0>
	<cfset error=1>
	error=14
</cfif>

<!--- Make sure there is both a height and width --->
<cfif #len(form.height1)# is 0 AND #len(form.width1)# GT 0>
	<cfset error=1>
	error=15
</cfif>

<!--- Make sure there is both a matheight and matwidth --->
<cfif #len(form.matheight1)# GT 0 AND #len(form.matwidth1)# is 0>
	<cfset error=1>
	error=16
</cfif>

<!--- Make sure there is both a matheight and matwidth --->
<cfif #len(form.matheight1)# is 0 AND #len(form.matwidth1)# GT 0>
	<cfset error=1>
	error=17
</cfif>


<cfif #form.editioned1# is 0 and (#form.editionsz1# GT 0 or #form.EditionNo1# GT 0)>
	<cfset error=1>
	error=19
</cfif>



<!--- If there is an Error --->

<cfif #error# GT 0>
	<center>
	<br>
	<br>
	<br>
	<br>
	<table width="600">
	<tr><td>
	<font color="Black" size="4" face="Verdana, Helvetica, Arial, Sans-Serif"><b>
	Showcase Error Page<br><br>
	<img src="Images/BlackRule.gif" width=100% height=1 alt="" border="0"><br>
	</b></font><font color="Black" size="2" face="Verdana, Helvetica, Arial, Sans-Serif"><b>
	The information you have entered has not yet been saved. Please make the following corrections 
	before continuing.</b></font><br><br>


	<cfif #error# GT 0>
	#error#
	<font face="Verdana, Helvetica, Arial, Sans-Serif" Size="2" color="Black">
	There is conflicting data for this particular Artwork Description.<br>
	<br>
	The following item(s) have a problem:<br><br></font>
		<font face="Verdana, Helvetica, Arial, Sans-Serif" Size="2" color="Red"><b>
	
	<!--- Error message is based on the Other parameter---->
	
	<cfif #error# is 4>

	<cfif  #form.Format1# is 'Other Format' and #len(form.Format2)# is 0>
	You have chosen Other Format, but have not entered any information in the Other Format text field.<br>
	</cfif>
	
	<cfif #form.Format1# is 'Other Format' and #form.Format2# IS NOT 'Other Format'>
	You have chosen a specific Format, but have also entered information into the Other Format text field.<br>
	</cfif>

	
	<cfif  #form.Genre1# is 'Other Genre' and #len(form.Genre2)# is 0>
	You have chosen Other Genre, but have not entered any information in the Other Genre text field.<br>
	</cfif>
	
<cfif #len(form.Genre2)# GT 0 and #form.Genre1# IS NOT 'Other Genre'>
	You have chosen a specific Genre, but have also entered information into the Other Genre text field.<br>
	</cfif>

	<cfif  #form.Process# is 'Other Process' and #len(form.OtherMed)# is 0>
	You have chosen Other Process, but have not entered any information in the Other Process text field.<br>
	</cfif>
	
		<cfif #len(form.OtherMed)# GT 0 and #form.Medium# IS NOT 'Other Process'>
	You have chosen a specific Process, but have also entered information into the Other Process text field.<br>
</cfif>

	<br>
	</cfif>
	
	

	<cfif #form.Medium# is NOT 'Other Process' and #len(form.OtherMed)# GT 0>
		Process / Other Process - Choose Only One <br>
		If <i>Other Process</i>, make sure <i>Select Process</i> is chosen in the drop-down box<br><br>
	</cfif>
	
	<cfif #form.Genre1# is NOT 'Other Genre' and #len(form.Genre2)# GT 0>
		Genre / Other Genre - Choose Only One <br>
		If <i>Other Genre</i>, make sure <i>Select Genre</i> is chosen in the drop-down box<br><br>
	</cfif>
	
	<cfif #form.Format1# is NOT 'Other Format' and #len(form.Format2)# GT 0>
		Format / Other Format - Choose Only One <br>
		If <i>Other Format</i>, make sure <i>Select Format</i> is chosen in the drop-down box<br><br>
	</cfif>	

	<cfif #Find('"', form.Height1)# GT 0 or  #Find('"', form.Width1)# GT 0>
		Illegal Inch (") Mark <br>
		Do not use an inch mark in the image height or width.<br><br>
	</cfif>

	<cfif #Find('"', form.MatHeight1)# GT 0 or  #Find('"', form.MatWidth1)# GT 0>
		Illegal Inch (") Mark <br>
		Do not use an inch mark in the mat height or width.<br><br>
	</cfif>

	<cfif #Find('$', form.Price1)# GT 0>
		Illegal Dollar ($) Usage<br>
		Do not use a dollar sign in the price.<br><br>
	</cfif>

	<cfif #Find(',', form.Price1)# GT 0>
		Illegal comma (,) Usage <br>
		Do not use a comma in the price.<br><br>
	</cfif>

	<cfif #Find('.', form.Price1)# GT 0>
		Illegal decimal point (.) Usage <br>
		Do not use a decimal point in the price. Whole numbers only.<br><br>
	</cfif>
	
	
	<!--- Editioned, but no editionsz1 or editionno1 --->
	<cfif #form.editioned1# is 1 and #len(form.editionsz1)# is 0 >
		Limited Editions<br>
		You have chosen <i>Editioned</i>, but there is no 
		Edition Size.<br><br>
		Keep in mind that this information is simply used as the default for each print. 
		In other words, if most of your images are number 3 of 25, 
		then enter that information on the previous page and overide the default when necessary
		when editing each individual image.<br><br>If few of your images have the same <i>Print Number</i>
		and <i>Edition Size</i>, leave this information blank and change the default to <i>Not
		Editioned</i>. Enter the 
		<i>Print Number</i> and <i>Edition Size</i> when 
		editing the text information for each individual image.<br><br><br>
	</cfif>
	
	<!--- Not Editioned, but but there is an editionsz1 or editionno1 --->

	<cfif #form.editioned1# is 0 and (#len(form.editionsz1)# GT 0 or #len(form.EditionNo1)# GT 0)>
		Limited Editions<br>
		You have chosen <i>Not Editioned</i>, but there is a 
		Print Number or Edition Size.<br><br>
		Keep in mind that this information is simply used as the default for each print. 
		In other words, if most of your images are number 3 of 25, 
		then enter that information and overide the default when necessary
		when editing each individual image.<br><br>If few of your images have the same <i>Print Number</i>
		and <i>Edition Size</i>, leave this information blank and change the default to <i>Not
		Editioned</i>. Enter the 
		<i>Print Number</i> and <i>Edition Size</i> when 
		editing the text information for each individual image.<br><br><br>
	</cfif>
	
	<!---Unmatted but there is a matheight or matwidth--->

	<cfif #UnMatted# is 1 and (#len(form.MatHeight1)# GT 0 or #len(form.MatWidth1)# GT 0)>
		Unmatted<br>
		If your artwork cannot be matted, leave the unmatted box checked, but delete the Mat Height and Mat Width information<br><br>	
	</cfif>
	
	
	<!--- Make sure there is both a height and width --->
<cfif #len(form.height1)# GT 0 AND #len(form.width1)# is 0>
	Print Dimensions<br>
	You must include both an image height and width.<br><br>
</cfif>

<!--- Make sure there is both a height and width --->
<cfif #len(form.height1)# is 0 AND #len(form.width1)# GT 0>
	Print Dimensions<br>
	You must include both an image height and width.<br><br>
</cfif>

<!--- Make sure there is both a matheight and matwidth --->
<cfif #len(form.matheight1)# GT 0 AND #len(form.matwidth1)# is 0>
	Mat Dimensions<br>
	You must include both a mat height and width.<br><br>
</cfif>

<!--- Make sure there is both a matheight and matwidth --->
<cfif #len(form.matheight1)# is 0 AND #len(form.matwidth1)# GT 0>
	Mat Dimensions<br>
	You must include both a mat height and width.<br><br>
</cfif>

<!--- 	<!--- Check if there are both EditionSz and Edition No1 if Editioned--->
	<cfif #form.editioned1# is 1 and #len(form.editionsz1)# is 0 and #len(form.EditionNo1)# is 0>
		Limited Editions<br>
		Enter an Edition Size<br><br>
		Keep in mind that this information is simply used as the default for each print. 
		In other words, if most of your images are number 3 of 25, 
		then enter that information and overide the default when necessary
		when editing each individual image.<br><br>If few of your images have the same <i>Print Number</i>
		and <i>Edition Size</i>, leave this information blank and change the default to <i>Not
		Editioned</i>. Enter the 
		<i>Print Number</i> and <i>Edition Size</i> when 
		editing the text information for each individual image.<br><br><br>
	</cfif> --->
	
<!--- 	<!--- If print structure, make sure the print is editioned--->
	<cfif #len(form.addinfo1)# GT 0 and #form.editioned1# is 0>
		Print Structure<br>
		You have entered a <i>Print Structure</i> 
		but you've also chosen the <i>Not Editioned</i> option.
		Either choose <i>Editioned</i> or delete this <i>Print Structure</i> information.<br><br>		
	</cfif> --->

	<cfif #form.editioned1# is 1 and (#form.editionsz1# is 0 or #form.EditionNo1# is 0)>
		Limited Editions<br>
		You have chosen the <i>Editioned</i> option<br>
		however, there is no information in the <i>Print Number</i> and/or <i>Edition Size</i> fields.
		Either choose <i>Not Editioned</i> or add the information.<br><br>
	</cfif>
	
		<cfif #len(form.Medium)# is 0 and #len(form.OtherMed)# is 0>
Process is a required field. <br>	
Your work will be listed under a particular <i>Process</i> on our <i>Showcase Process</i> page. 
Choose a <i>Process</i> that applies to most of your work. Type in a different 
<i>Process</i> (subject to approval) if none of the choices in the drop-down box are appropriate. <br><br>
 	</cfif>	
	
	<cfif #len(form.genre1)# is 0 and #len(form.genre2)# is 0>
Genre is a required field. <br>	
Your work will be listed under a particular <i>Genre</i> on our <i>Showcase Genre</i> page. 
Choose a <i>Genre</i> that applies to most of your work. Type in a different 
<i>Genre</i> (subject to approval) if none of the choices in the drop-down box are appropriate. <br><br>
 	</cfif>	

	<cfif #len(form.Format1)# is 0 and #len(form.Format2)# is 0>
Format is a required field. <br>	
Your work will be listed under a particular <i>Format</i> on our <i>Showcase Format</i> page. 
Choose a <i>Format</i> that applies to most of your work. Type in a different 
<i>Format</i> (subject to approval) if none of the choices in the drop-down box are appropriate. <br><br>
 	</cfif>
		
 	<br>
	<br>
	</b></font>
	<center>
	<font size="2" color="Red" face="Verdana, Arial, Helvetica, Sans-Serif">
	<A href="javascript:history.back();" target="_parent"><b>Correct Problems</b></a></font>
	</center>	
	</cfif>
	 </td>
	 </tr> 
	</table>
	</center>
</cfif>


<br>



<cfif #error# is 0>	
	<input type="HIDDEN" name="custnumber" value=#form.custnumber#>	
	
	<cfinclude template="insertartworkdescription_default.cfm"> 
</cfif> 
</font>
</cfoutput>

</body>
</html>
