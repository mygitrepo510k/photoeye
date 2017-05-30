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
<cfif #form.Default1# is 1 and #len(form.title)# GT 0>

    <!--- If Default is chosen, Make sure that there is no information in the Unique fields--->
	<cfset error=1>
	<!--- 1= #form.Default1# --->
</cfif>


<cfif #form.Default2# is 1 and (#len(form.Medium)# GT 0 or #len(form.OtherMed)# GT 0)>
	<cfset error=1>
	<!--- 2=#form.Default2# --->
</cfif>


<cfif #form.Default3# is 1 and #len(form.YearProd)# GT 0>
	<cfset error=1>
	<!--- 3= #form.Default3#  --->
</cfif>

<cfif #form.Default5# is 1 and (#len(form.EditionSz1)# GT 0 or #len(form.EditionNo1)# GT 0)>
	<cfset error=1>
	<!--- 6= #form.Default6#  --->
</cfif>


<cfif #form.Default6# is 1 and (#len(form.Height1)# GT 0 or #len(form.Width1)# GT 0)>
	<cfset error=1>
	<!--- 6= #form.Default6#  --->
</cfif>

<cfif #form.Default4# is 1 and (#len(form.MatHeight1)# GT 0 or #len(form.MatWidth1)# GT 0)>
	<cfset error=1>
	<!--- 6= #form.Default6#  --->
</cfif>

<cfif #form.Default7# is 1 and #len(form.price1)# GT 0>
	<cfset error=1>
<!--- 	7= #form.Default7# --->
</cfif>


<cfif #form.Default8# is 1 and #len(form.addinfo1)# GT 0>
	<cfset error=1>
<!--- 	8=#form.Default8# --->
</cfif>

<cfif #form.Default9# is 1 and (#len(form.genre1)# GT 0 or #len(form.genre2)# GT 0)>
	<cfset error=1>
<!--- 	9=#form.Default9# --->
</cfif>
	
<cfif #form.Default10# is 1 and (#len(form.LocContin)# GT 0 or #len(form.LocCountry)# GT 0 or #len(form.LocRegion)# GT 0 or #len(form.LocState)# GT 0 or #len(form.LocCity)# GT 0)>
	<cfset error=1>
<!--- 	10=#form.Default10# --->
</cfif>

<cfif #form.Default11# is 1 and #len(form.Keywords)# GT 0>
	<cfset error=1>
<!--- 	11=#form.Default11# --->
</cfif>


<!--- Error #2 --->
<!--- If Unique is Chosen, Check to see that there is information entered--->

<cfif #form.Default1# is 0 and #len(form.title)# is 0>
	<cfset error=2>
</cfif>


<cfif #form.Default2# is 0 and #len(form.Medium)# is 0 and #len(form.OtherMed)# is 0>
	<cfset error=2>
</cfif>

<cfif #form.Default3# is 0 and #len(form.YearProd)# is 0>
	<cfset error=2>
</cfif>

<cfif #form.Default9# is 0 and #len(form.genre1)# is 0 and #len(form.genre2)# is 0>
	<cfset error=2>
</cfif>

<cfif #unmatted# is 0>
	<cfif #form.Default4# is 0 and (#len(form.MatHeight1)# is 0 or #len(form.MatWidth1)# is 0)>
		<cfset error=2>
	</cfif>
</cfif>

<cfif #form.Editioned1# is 1 and #form.Default5# is 0 and #len(form.editionsz1)# is 0 and #len(form.editionno1)# is 0>
	<cfset error=2>
</cfif>

<cfif #form.Default7# is 0 and #len(form.price1)# is 0>
	<cfset error=2>
</cfif>


<cfif #form.Default8# is 0 and #len(form.addinfo1)# is 0>
	<cfset error=2>
</cfif>


<cfif #form.Default10# is 0 and #len(form.LocContin)# is 0 and #len(form.LocCountry)# is 0 and #len(form.LocRegion)# is 0 and #len(form.LocState)# is 0 and #len(form.LocCity)# is 0>
	<cfset error=2>
</cfif>

<cfif #form.Default11# is 0 and #len(form.Keywords)# is 0>
	<cfset error=2>
</cfif>


<!---Error 3--->
<!--- Make sure there is no conflict between several Unique fields under the same heading--->

<cfif #form.editioned1# is 0 and (#form.editionsz1# GT 0 or #form.EditionNo1# GT 0)>
	<cfset error=3>
</cfif>

<cfif #len(form.Medium)# GT 0 and #len(form.OtherMed)# GT 0>
	<cfset error=3>
</cfif>


<cfif #len(form.Genre1)# GT 0 and #len(form.Genre2)# GT 0>
	<cfset error=3>
</cfif>

<cfif #UnMatted# is 1 and (#len(form.MatHeight1)# GT 0 or #len(form.MatWidth1)# GT 0)>
	<cfset error=3>
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
	The information you have entered has not yet been saved. Please make the following corrects 
	before continuing.</b></font><br><br>

	<cfif #error# is 1>
	<font face="Verdana, Helvetica, Arial, Sans-Serif" Size="2" color="Black">
	You have at least one instance where the <i>Use Default</i> option is chosen AND 
	information is entered that is <i>Unique to this Print</i>.<br>
	<br>
	The following item(s) have this discrepancy:<br><br>
		<font face="Verdana, Helvetica, Arial, Sans-Serif" Size="2" color="Red"><b>
	<cfif #form.Default1# is 1 and #len(form.title)# GT 0>
		Title<br><br>	
	</cfif>
	<cfif #form.Default2# is 1 and #len(form.Medium)# GT 0>
		Medium - (Use <i>Select Medium</i> if you wish to use the Default) <br><br>
	</cfif>
	<cfif #form.Default2# is 1 and #len(form.OtherMed)# GT 0>
		Other Medium<br><br>
	</cfif>
	<cfif #form.Default3# is 1 and #len(form.YearProd)# GT 0>
		Year Produced<br><br>	
	</cfif>
	<cfif #form.Default5# is 1 and (#len(form.EditionSz1)# GT 0 or #len(form.EditionNo1)# GT 0)>
		Limited Editions - (Choose the Editioned option if this is part of a limited edition)
	</cfif>
	<cfif #form.Default6# is 1 and (#len(form.Height1)# GT 0 or #len(form.Width1)# GT 0 or #len(form.MatHeight1)# GT 0 or #len(form.MatWidth1)# GT 0)>
		Print Dimensions<br><br>	
	</cfif>
	<cfif #form.Default7# is 1 and #len(form.Price1)# GT 0>
		Price<br><br>
	</cfif>
	<cfif #form.Default8# is 1 and #len(form.addinfo1)# GT 0>
		Pricing Structure<br><br>
	</cfif>
	<cfif #form.Default9# is 1 and (#len(form.genre1)# GT 0 or #len(form.genre2)# GT 0)>
		Genre/Other Genre<br><br>
	</cfif>
	<cfif #form.Default10# is 1 and (#len(form.LocContin)# GT 0 or #len(form.LocCountry)# GT 0 or #len(form.LocRegion)# GT 0 or #len(form.LocState)# GT 0 or #len(form.LocCity)# GT 0)>
		<cfif #len(form.LocContin)# GT 0> Location: Continent - make sure the Continent drop-down box is set to <i>Select Continent</i><br><br></cfif>
		<cfif #len(form.LocCountry)# GT 0> Location: Country<br><br></cfif>
		<cfif #len(form.LocRegion)# GT 0> Location: Region<br><br></cfif>
		<cfif #len(form.LocState)# GT 0> Location: State<br><br></cfif>
		<cfif #len(form.LocCity)# GT 0> Location: City<br><br></cfif>
	</cfif>
	<cfif #form.Default11# and #len(form.keywords)# GT 0>
		Keywords<br>
	</cfif></b></font>
	<br><br>
	You cannot have the <i>Use Default</i> button chosen when there is <i>Unique to this Print</i> information.<br><br>
	If you would like to <i>Use Default</i>, delete the above item's information that is <i>Unique to this Print</i>.<br>
	<br>
	If you prefer to use the <i>Unique to this Print</i> information, select the appropriate button above the text box.
	<br>
	<br>
	<br>
	</cfif>
	
	
	<cfif #error# is 2>

	<font face="Verdana, Helvetica, Arial, Sans-Serif" Size="2" color="Black">
	You have at least one instance where the <i>Unique to this Print</i> Option is chosen BUT 
	there is no unique information entered.<br>
	<br>
	The following item(s) are missing the <i>Unique to this Print</i> information:<br><br>
		<font face="Verdana, Helvetica, Arial, Sans-Serif" Size="2" color="Red"><b>
		<cfif #form.Default1# is 0 and #len(form.title)# is 0>
			Title<br><br>
		</cfif>

		<cfif #form.Default2# is 0 and #len(form.Medium)# is 0 and #len(form.OtherMed)# is 0>
			Medium/Other Medium<br><br>
		</cfif>

		<cfif #form.Default3# is 0 and #len(form.YearProd)# is 0>
			Year Produced<br><br>
		</cfif>

		<cfif #form.Default9# is 0 and #len(form.genre1)# is 0 and #len(form.genre2)# is 0>
			Genre/Other Genre<br><br>
		</cfif>

		<cfif #form.Default6# is 0 and #len(form.Height1)# is 0>
			Image Height<br><br>
		</cfif>
		
		<cfif #form.Default6# is 0 and #len(form.Width1)# is 0>
			Image Width<br><br>
		</cfif>	
		
		<cfif #form.Default4# is 0 and #len(form.MatHeight1)# is 0 and #unmatted# is 0>
			Mat Height<br><br>
		</cfif>
		
		<cfif #form.Default4# is 0 and #len(form.MatWidth1)# is 0 and #unmatted# is 0>
			Mat Width<br><br>
		</cfif>		

		<cfif #form.Default7# is 0 and #len(form.price1)# is 0>
			Price<br><br>
		</cfif>
		
		<cfif #form.Editioned1# is 1 and #form.Default5# is 0 and #len(form.editionNo1)# is 0 and #len(form.editionSz1)# is 0>
			Limited Editions - Choose the <i>Not Editioned</i> option if this print is not part of a limited edition<br><br>
		</cfif>

		<cfif #form.Default8# is 0 and #len(form.addinfo1)# is 0>
			Pricing Structure<br><br>
		</cfif>
	
		<cfif #form.Default10# is 0 and #len(form.LocContin)# is 0 and #len(form.LocCountry)# is 0 and #len(form.LocRegion)# is 0 and #len(form.LocState)# is 0 and #len(form.LocCity)# is 0>
			Location<br><br>
		</cfif>

		<cfif #form.Default11# is 0 and #len(form.Keywords)# is 0>
			Keywords<br><br>
		</cfif>
		</b></font>
	</cfif>
	
	
	<cfif #error# is 3>
	<font face="Verdana, Helvetica, Arial, Sans-Serif" Size="2" color="Black">
	There is conflicting data for this particular Artwork Description.<br>
	<br>
	The following item(s) have a problem:<br><br>
		<font face="Verdana, Helvetica, Arial, Sans-Serif" Size="2" color="Red"><b>
	<cfif #len(form.Medium)# GT 0 and #len(form.OtherMed)# GT 0>
		Medium / Other Medium - Choose Only One <br>
		If <i>Other Medium</i>, make sure <i>Select Medium</i> is chosen in the drop-down box<br><br>
	</cfif>
	
	<cfif #len(form.Genre1)# GT 0 and #len(form.Genre2)# GT 0>
		Genre / Other Genre - Choose Only One <br>
		If <i>Other Genre</i>, make sure <i>Select Genre</i> is chosen in the drop-down box<br><br>
	</cfif>
	
	
	<cfif #UnMatted# is 1 and (#len(form.MatHeight1)# GT 0 or #len(form.MatWidth1)# GT 0)>
		Unmatted<br>
		If your artwork cannot be matted, leave the unmatted box checked, but delete the Mat Height and Mat Width information<br><br>
	</cfif>
	
	<cfif #form.editioned1# is 0 and (#form.editionsz1# GT 0 or #form.EditionNo1# GT 0)>
		Editioned<br>
		You have chosen the <i>Editioned</i> option<br>
		However, there is information in the Print Number and/or Edition Size fields<br>
		Either choose Editioned or Delete the information.<br><br>
	</cfif>
		
	</cfif>
	
	
	
	<br>
	<center> 
	<font size="2" color="Red" face="Verdana, Arial, Helvetica, Sans-Serif">
	<A href="javascript:history.back();" target="_parent"><b>Correct Problems</b></a> 
<!--- <cfif #id# is 'Sequence'>
		<form method="post" action="Step12ArtworkDescriptionFormSequence.cfm?custnumber=#form.custnumber#&imagenumbercounter=#form.imagenumbercounter#&imagenumber=#form.imagecounter#">
	</cfif>
	<cfif #id# is 'URL'>
		<form method="post" action="Step12ArtworkDescriptionFormSequence.cfm?custnumber=#form.custnumber#&imagenumbercounter=#form.imagenumbercounter#&imagenumber=#form.imagecounter#">
	</cfif>
	<cfif #id# is 'Plain'>
		<form method="post" action="Step12ArtworkDescriptionFormSequence.cfm?custnumber=#form.custnumber#&imagenumbercounter=#form.imagenumbercounter#&imagenumber=#form.imagenumber#">
	</cfif>
	<br>
	<center> 
	<!--- <input type="HIDDEN" name="imagenumber" value=#form.imagecounternumber#>  --->
		<input type="HIDDEN" name="imagenumber" value=#form.imagenumber#>
		<input type="HIDDEN" name="imagenumbercounter" value=#form.imagenumbercounter#>
		<input type="HIDDEN" name="custnumber" value=#form.custnumber#>	
	<!--- <cfoutput>#url.imagenumbercounter# #url.imagenumber#</cfoutput> --->
	<input type="HIDDEN" name="id" value='Sequence'> 
    <input type="SUBMIT" value="Correct Problems" name="SUBMIT">
	</center>              
	</form>  --->
	 </td></tr>  
	</font>
	</table>
	</center>

</cfif>


<br>



<cfif #error# is 0>	
	<input type="HIDDEN" name="imagenumber" value=#form.imagenumber#>
	<input type="HIDDEN" name="imagenumbercounter" value=#form.imagenumbercounter#>
	<input type="HIDDEN" name="custnumber" value=#form.custnumber#>	
	<cfinclude template="insertartworkdescription_unique.cfm"> 
</cfif> 

</cfoutput>
</font>

</body>
</html>
