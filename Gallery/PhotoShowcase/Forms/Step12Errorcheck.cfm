<!--- New Editioned Option Style --->
<CFIF #form.editionedx# is 1>
	<cfset default5=1>
	<cfset editionedxx=0>
<CFELSEIF #form.editionedx# is 2>
	<cfset default5=0>
	<cfset editionedxx=1>
<CFELSEIF #form.editionedx# is 3>
	<cfset default5=0>
	<cfset editionedxx=0>
</cfif>



<CFPARAM NAME="Unmatted" Default="0">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase | Setup</title>
</head>

<body bgcolor="Silver" link="#000080" vlink="#000080">
<cfoutput>

<font color="Red" size="2" face="Verdana, Helvetica, Arial, Sans-Serif">
<!--- #form.editionedxx# --->
<cfset error=0>


<!--- If Other Medium is chosen, there has to be info in OtherMed, otherwise
an error is generated--->
<cfif #form.Default2# is 0 and #form.Medium# is 'Other Medium' and #len(form.OtherMed)# is 0>
	<cfset error=4>
</cfif>


<!--- If OtherMed has information, a Other Medium has to be chosen, otherwise 
an error is generated--->
<cfif #form.Default2# is 0 and #len(form.OtherMed)# GT 0 and #form.Medium# IS NOT 'Other Medium'>
	<cfset error=4>
</cfif>


<!--- If Other Format is chosen, there has to be info in Format2, otherwise
an error is generated--->
<cfif #form.DefaultFormat# is 0 and #form.Format1# is 'Other Format' and #len(form.Format2)# is 0>
	<cfset error=4>
</cfif>


<!--- If Format2 has information, a Other Format has to be chosen, otherwise 
an error is generated--->
<cfif #form.DefaultFormat# is 0 and #len(form.Format2)# GT 0 and #form.Format1# IS NOT 'Other Format'>
	<cfset error=4>
</cfif>

<!--- If Other Genre is chosen, there has to be info in Genre2, otherwise
an error is generated--->
<cfif #form.Default9# is 0 and #form.Genre1# is 'Other Genre' and #len(form.Genre2)# is 0>
	<cfset error=4>
</cfif>


<!--- If Genre2 has information, then Other Genre has to be chosen, otherwise 
an error is generated--->
<cfif #form.Default9# is 0 and #len(form.Genre2)# GT 0 and #form.Genre1# IS NOT 'Other Genre'>
	<cfset error=4>
</cfif>

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
</cfif>

<cfif #form.CopyrightDefault# is 1 and #len(form.Copyright)# GT 0>
	<cfset error=1>
</cfif>
<!--- 
default5 = #default5#<br>
editionedxx = #editionedxx#<br>
len(form.EditionSz1) = #len(form.EditionSz1)#<br>
len(form.EditionNo1)=#len(form.EditionNo1)#<br>
<CFABORT> --->

<cfif Default5 is 1 and (editionedxx is 1 or #len(form.EditionSz1)# GT 0 or #len(form.EditionNo1)# GT 0)>
	<cfset error=1>
	<!--- 6= #form.Default6#  --->
</cfif>

<!--- <cfif #form.editioned1# is 1 and (#len(form.EditionSz1)# is 0 or #len(form.EditionNo1)# is 0) and Default5 is 1>
	<cfset error=1>
	<!--- 6= #form.Default6#  --->
</cfif> --->


<cfif #form.Default6# is 1 and (#len(form.Height1)# GT 0 or #len(form.Width1)# GT 0)>
	<cfset error=1>
	<!--- 6= #form.Default6#  --->
</cfif>

<cfif #form.Default4# is 1 and (#len(form.MatHeight1)# GT 0 or #len(form.MatWidth1)# GT 0)>
	<cfset error=1>
	<!--- 6= #form.Default6#  --->
</cfif>


<cfif #form.Default7# is 1 and #len(form.price1)# gt 0>
	<cfset error=1>
<!--- 	7= #form.Default7# --->
</cfif>



<cfif #form.Default8# is 1 and #len(form.addinfo1)# GT 0> 
	<cfset error=1>
</cfif> 



<!--- <cfif Default5 is 0 and #len(form.addinfo1)# is 0 and #form.Editioned1# is 1>
	<cfset error=1>
<!--- 	8=#form.Default8# --->
</cfif> --->

<cfif #form.Default9# is 1 and (#len(form.genre1)# GT 0 or #len(form.genre2)# GT 0)>
	<cfset error=1>
<!--- 	9=#form.Default9# --->
</cfif>

<cfif #form.DefaultFormat# is 1 and (#len(form.format1)# GT 0 or #len(form.format2)# GT 0)>
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

<!--- <cfif #form.Default3# is 0 and #len(form.YearProd)# is 0>
	<cfset error=2>
</cfif> --->

<cfif #form.Default9# is 0 and #len(form.genre1)# is 0 and #len(form.genre2)# is 0>
	<cfset error=2>
</cfif>

<cfif #form.DefaultFormat# is 0 and #len(form.Format1)# is 0 and #len(form.Format2)# is 0>
	<cfset error=2>
</cfif>

<cfif #unmatted# is 0>
	<cfif #form.Default4# is 0 and (#len(form.MatHeight1)# is 0 or #len(form.MatWidth1)# is 0)>
		<cfset error=2>
	</cfif>
</cfif>

<!--- If Unique is Chosen, make sure there is information entered --->
 <cfif Default5 is 0 and editionedxx is 1 and (#len(trim(form.editionsz1))# is 0 and #len(trim(form.editionno1))# is 0)>

	<cfset error=2>
</cfif> 

<!--- If Unique is Chosen, make sure there is information entered --->
		 <cfif Default5 is 0 and editionedxx is 1 and #len(trim(form.editionsz1))# is 0 and #len(trim(form.editionno1))# GT 0>

	<cfset error=2>
</cfif> 

<!--- <cfif #form.Default8# is 0 and #len(form.addinfo1)# is 0 and #form.Editioned1# is 1>
	<cfset error=2>
</cfif> --->

<cfif #form.Default7# is 0 and #len(form.price1)# is 0 and form.NotAvailable is 0>
	<cfset error=2>
</cfif>


<!--- <cfif #form.Default8# is 0 and #len(form.addinfo1)# is 0>
	<cfset error=2>
</cfif> --->


<cfif #form.Default10# is 0 and #len(form.LocContin)# is 0 and #len(form.LocCountry)# is 0 and #len(form.LocRegion)# is 0 and #len(form.LocState)# is 0 and #len(form.LocCity)# is 0>
	<cfset error=2>
</cfif>

<cfif #form.Default11# is 0 and #len(form.Keywords)# is 0>
	<cfset error=2>
</cfif>

<cfif  Default5 is 1 and editionedxx is 1 and (#len(form.EditionSz1)# GT 0 or #len(form.EditionNo1)# GT 0)>
	   <cfset error=2>
</cfif>

		<cfif Default5 is 1 and editionedxx is 1 and (#len(form.EditionSz1)# GT 0 or #len(form.EditionNo1)# GT 0)>
	   <cfset error=2>
</cfif>


<!---Error 3--->
<!--- Make sure there is no conflict between several Unique fields under the same heading--->

<cfif Default5 is 1 and (editionedxx is 1 or len(trim(#form.editionsz1#)) GT 0 or len(trim(#form.EditionNo1#)) GT 0)>
	<cfset error=3>
</cfif>

<cfif editionedxx is 0 and (len(trim(#form.editionsz1#)) GT 0 or len(trim(#form.EditionNo1#)) GT 0)>
	<cfset error=3>
</cfif>

<cfif #form.Medium# is NOT 'Other Medium' and #len(form.OtherMed)# GT 0>
	<cfset error=3>
</cfif>


<cfif #form.Genre1# is NOT 'Other Genre' and #len(form.Genre2)# GT 0>
	<cfset error=3>
</cfif>

<cfif #form.Format1# is NOT 'Other Format' and #len(form.Format2)# GT 0>
	<cfset error=3>
</cfif>

<cfif #UnMatted# is 1 and (#len(form.MatHeight1)# GT 0 or #len(form.MatWidth1)# GT 0)>
	<cfset error=3>
</cfif>

<cfif #form.Default4# is 1 and #UnMatted# is 1 and #len(form.MatHeight1)# is 0 and #len(form.MatWidth1)# is 0>
	<cfset error=3>
</cfif>

<cfif #form.Default7# is 0 and #Find('$', form.Price1)# GT 0>
	<cfset error=3>
</cfif>

<cfif #form.Default7# is 0 and #Find(',', form.Price1)# GT 0>
	<cfset error=3>
</cfif>

<cfif #form.Default7# is 0 and #Find('.', form.Price1)# GT 0>
	<cfset error=3>
</cfif>
		
<!--- RR 8/14/2013 added nd form.notavailable is 0 --->
<cfif #form.Default7# is 0 and #val(form.Price1)# LT 100 and form.notavailable is 0>
	<cfset error=3>
</cfif> 

<cfif #form.Default6# is 0 and #Find('"', form.Height1)# GT 0 or  #Find('"', form.Width1)# GT 0>
	<cfset error=3>
</cfif>

<cfif #form.Default4# is 0 and #Find('"', form.MatHeight1)# GT 0 or  #Find('"', form.MatWidth1)# GT 0>
	<cfset error=3>
</cfif>

<!--- <cfif #len(form.addinfo1)# GT 0 and #form.Editioned1# is 0>	
	<cfset error=3>
</cfif> --->

<!--- <cfif #form.default8# is 1 and editionedxx is 0>	
	<cfset error=3>
</cfif> --->


		

<!--- If there is an Error --->

<cfif #error# GT 0>
#error#
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
	The information you have entered has not yet been saved. Please make the following corrections before continuing.</b></font><br><br>

	<!--- Error message is based on the Other parameter---->
	
	<cfif #error# is 4 or  #error# is 9>
	<font color="Red" size="2" face="Verdana, Helvetica, Arial, Sans-Serif"><b>
	<cfif  #form.DefaultFormat# is 0 and #form.Format1# is 'Other Format' and #len(form.Format2)# is 0>
	You have chosen Other Format, but have not entered any information in the Other Format text field.<br>
	</cfif>
	
	<cfif #form.DefaultFormat# is 0 and #form.Format1# is 'Other Format' and #form.Format2# IS NOT 'Other Format'>
	You have chosen a specific Format, but have also entered information into the Other Format text field.<br>
	</cfif>

	
	<cfif  #form.Default9# is 0 and #form.Genre1# is 'Other Genre' and #len(form.Genre2)# is 0>
	You have chosen Other Genre, but have not entered any information in the Other Genre text field.<br>
	</cfif>
	
<cfif #form.Default9# is 0 and #len(form.Genre2)# GT 0 and #form.Genre1# IS NOT 'Other Genre'>
	You have chosen a specific Genre, but have also entered information into the Other Genre text field.<br>
	</cfif>

	<cfif  #form.Default2# is 0 and #form.Medium# is 'Other Medium' and #len(form.OtherMed)# is 0>
	You have chosen Other Process, but have not entered any information in the Other Process text field.<br>
	</cfif>
	
		<cfif #form.Default2# is 0 and #len(form.OtherMed)# GT 0 and #form.Medium# IS NOT 'Other Medium'>
	You have chosen a specific Process, but have also entered information into the Other Process text field.<br>
</cfif>

	<br></b></font>
	</cfif>

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
		Process - (Use <i>Select Process</i> if you wish to use the Default) <br><br>
	</cfif>
	<cfif #form.Default2# is 1 and #len(form.OtherMed)# GT 0>
		Other Process<br><br>
	</cfif>
	<cfif #form.Default3# is 1 and #len(form.YearProd)# GT 0>
		Year Produced<br><br>	
	</cfif> 
	
	<cfif #form.CopyrightDefault# is 1 and #len(form.Copyright)# GT 0>
		Copyright<br><br>	
	</cfif> 
	
<cfif Default5 is 1 and (editionedxx is 1 or #len(form.EditionSz1)# GT 0 or #len(form.EditionNo1)# GT 0)>
		Limited Editions<br><br>
	</cfif>
<!--- 	<cfif #form.Default8# is 1 and #len(form.addinfo1)# GT 0> 
		Pricing Structure<br><br>
	</cfif>  --->
	<cfif #form.Default6# is 1 and (#len(form.Height1)# GT 0 or #len(form.Width1)# GT 0)>
		Print Dimensions<br><br>	
	</cfif>
	<cfif #form.Default4# is 1 and (#len(form.matHeight1)# GT 0 or #len(form.matWidth1)# GT 0)>
		Mat Dimensions<br><br>	
	</cfif>
	<cfif #form.Default7# is 1 and #len(form.Price1)# GT 0>
		Price<br><br>
	</cfif>

	
	<!--- No pricing structure tied to editioned--->
	
<!--- 	<cfif Default5 is 0 and #len(form.addinfo1)# is 0 and #form.Editioned1# is 1>
		Pricing Structure<br><br>
	</cfif> --->
	
	<!--- Default 8 is 0--->
<!---  	<cfif #form.Editioned1# is 1 and #form.Default8# is 0 and #len(form.addinfo1)# is 0>
		Pricing Structure<br><br>
	</cfif>
	 --->

	<cfif #form.Default9# is 1 and (#len(form.genre1)# GT 0 or #len(form.genre2)# GT 0)>
		Genre/Other Genre<br><br>
	</cfif>

	<cfif #form.DefaultFormat# is 1 and (#len(form.Format1)# GT 0 or #len(form.Format2)# GT 0)>
		Format/Other Format<br><br>
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
			Process/Other Process<br><br>
		</cfif>

<!--- 		<cfif #form.Default3# is 0 and #len(form.YearProd)# is 0>
			Year Produced<br><br>
		</cfif> --->

		<cfif #form.Default9# is 0 and #len(form.genre1)# is 0 and #len(form.genre2)# is 0>
			Genre/Other Genre<br><br>
		</cfif>
		
		<cfif #form.DefaultFormat# is 0 and #len(form.Format1)# is 0 and #len(form.Format2)# is 0>
			Format/Other Format<br><br>
		</cfif>		

<!--- RR 8/14/2013 added and  form.NotAvailable is 0 --->
		<cfif #form.Default6# is 0 and #len(form.Height1)# is 0 and form.NotAvailable is 0>
			Image Height<br><br>
		</cfif>
	<!--- RR 8/14/2013 added and  form.NotAvailable is 0 --->	
		<cfif #form.Default6# is 0 and #len(form.Width1)# is 0 and form.NotAvailable is 0>
			Image Width<br><br>
		</cfif>	
		
		<cfif #form.Default4# is 0 and #len(form.MatHeight1)# is 0 and #unmatted# is 0>
			Mat Height<br><br>
		</cfif>
		
		<cfif #form.Default4# is 0 and #len(form.MatWidth1)# is 0 and #unmatted# is 0>
			Mat Width<br><br>
		</cfif>		

<!--- RR 7/14/2013 added and form.notavailable is 0  --->
		<cfif #form.Default7# is 0 and #len(form.price1)# is 0  and form.notavailable is 0 >
			Price<br><br>
		</cfif>
		
<!--- 		<cfif editionedxx is 1 and Default5 is 0 and (#len(form.editionNo1)# is 0 or #len(form.editionSz1)# is 0)>
			Limited Editions<br>
			You have chosen the <i>Editioned</i> option. The edition size is required. 
			Select the <i>Not Editioned</i> option if this print is not 
			part of a limited edition.<br><br>
		</cfif>  --->
		
		 <cfif Default5 is 0 and editionedxx is 1 and #len(trim(form.editionsz1))# is 0 and #len(trim(form.editionno1))# GT 0>
			Limited Editions<br>
			You have chosen the <i>Editioned</i> option. The edition size is required. 
			Select the <i>Not Editioned</i> option if this print is not 
			part of a limited edition and delete any <i>Edition</i> information.<br><br>
		</cfif>

		 <cfif Default5 is 0 and editionedxx is 1 and #len(trim(form.editionsz1))# is 0 and #len(trim(form.editionno1))# is 0>
			Limited Editions<br>
			You have chosen the <i>Editioned</i> option. The edition size is required. 
			Select the <i>Not Editioned</i> option if this print is not 
			part of a limited edition and delete any <i>Edition</i> information.<br><br>
		</cfif>
		
		<cfif Default5 is 1 and editionedxx is 1 and (#len(form.EditionSz1)# GT 0 or #len(form.EditionNo1)# GT 0)>
			Limited Editions<br>
			You have chosen the <i>Use Default</i> option, but there is information in the <i>Print No.</i> and/or <i> Edition Size</i> fields. You may also have the<i> Editioned</i> radio button chosen. Choose <i>Unique to this print</i> or delete the <i>Print No.</i> and <i>Editions Size</i> information and make sure that <i>Not Editioned</i> is chosen.
<br><br>
		</cfif> 
<!--- 		<cfif #form.editioned1# is 1 and (#len(form.EditionSz1)# is 0 or #len(form.EditionNo1)# is 0)>
	 	   Editioned<br<br>
		</cfif> --->
		
<!--- 		<cfif #form.Default8# is 0 and #len(form.addinfo1)# is 0 and #form.Editioned1# is 1>
			Pricing Structure<br><br>
		</cfif> --->
	
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
	<cfif #form.Medium# is NOT 'Other Medium' and #len(form.OtherMed)# GT 0>
		Process / Other Process - Choose Only One <br>
		If <i>Other Process</i>, make sure <i>Other Process</i> is chosen in the drop-down box<br><br>
	</cfif>
	
	<cfif #form.Genre1# is NOT 'Other Genre' and #len(form.Genre2)# GT 0>
		Genre / Other Genre - Choose Only One <br>
		If <i>Other Genre</i>, make sure <i>Other Genre</i> is chosen in the drop-down box<br><br>
	</cfif>
	
	<cfif #form.Format1# is Not 'Other Format' and #len(form.Format2)# GT 0>
		Format / Other Format - Choose Only One <br>
		If <i>Other Format</i>, make sure <i>Other Format</i> is chosen in the drop-down box<br><br>
	</cfif>
	
	
	
	<cfif #UnMatted# is 1 and (#len(form.MatHeight1)# GT 0 or #len(form.MatWidth1)# GT 0)>
		Unmatted<br>
		If your artwork cannot be matted, leave the unmatted box checked, but delete the Mat Height and Mat Width information<br><br>
	</cfif>
	
	<cfif #form.Default4# is 1 and #UnMatted# is 1 and #len(form.MatHeight1)# is 0 and #len(form.MatWidth1)# is 0>
		Unmatted<br>
		Uncheck the <i>Matted checkbox</i> if you would like to use the Default. 
		Othewise, choose <i>Unique to this Print</i>. <br><br>
	</cfif>
	
<cfif Default5 is 1 and (len(trim(#form.editionsz1#)) GT 0 or len(trim(#form.EditionNo1#)) GT 0)>
		Limited Edition<br>
		You have chosen the <i>Use Default</i> option.<br>
		However, there is information in the Print Number, Edition Size fields<br>
		Either choose <i>Unique to this print</i> or delete the information.<br><br>
	</cfif>
	
	
<cfif Default5 is 1 and editionedxx is 1>
		Limited Edition<br>
		You have chosen the <i>Use Default</i> option.<br>
		However, the <i>Editioned</i> button is selected.<br>
		Either choose <i>Not Editioned</i> or choose <i>Unique to this print</i> and include the appropriate <i>Print No.</i> and <i>Edition Size</i> information.<br><br>
	</cfif>

<cfif editionedxx is 0 and (len(trim(#form.editionsz1#)) GT 0 or len(trim(#form.EditionNo1#)) GT 0)>
		Limited Edition<br>
		You have chosen the <i>Not Editioned</i> option.<br>
		However, there is information in the Print Number and/or Edition Size fields<br>
		Either choose Editioned or Delete the information.<br><br>
	</cfif>
	
<!--- 	<cfif #len(form.addinfo1)# GT 0 and #form.Editioned1# is 0>
		Limited Edition<br>
		There is a pricing structure for this print.<br>
		Thus, you must choose the <i>Editioned</i> option located in Limited Editions 
		unique to this print<br><br>
	</cfif> --->
<!--- 	
	<cfif #form.default8# is 1 and editionedxx is 0>	
		Limited Edition<br>
		There is a default pricing structure for this print.<br>
		You must choose the <i>Editioned</i> option located in <i>Limited Editions</i> 
		unique to this print. Otherwise, choose unique to this print under <i>Pricing
		Structure</i> and leave the <i>Pricing Structure</i> blank.<br><br>	
	</cfif> --->
	
	<cfif #Find('.', form.Price1)# GT 0 and form.default7 is 0>
		Price: Illegal $ Character<br>
		No '.' (decimal point) is allowed in your price! Whole numbers only please.<br><br>


	<cfelseif #Find(',', form.Price1)# GT 0 and form.default7 is 0>
			Price: Illegal $ Character<br>
			No ',' (comma separator) is allowed in your price.<br><br>
	
	
	<!--- $ symbol in price will also bring up an Improper Price Error--->
	<cfelseif #Find('$', form.Price1)# GT 0 and form.default7 is 0>
		Price: Illegal $ Character<br>
		No $ is allowed in your price. <br><br>
	
	<!--- RR added form.notavailable is 0 meaning I think that it is available --->
	<cfelseif #val(form.Price1)# LT 100 and form.default7 is 0 and form.notavailable is 0 >
		Price: This print's price is too low or has been left blank! <br>
		The price for your print must be at least $100.<br>
		Make sure your are not using the letter 'O' instead of a zero.<br><br>
	</cfif>
	
	<cfif #Find('"', form.Height1)# GT 0 or  #Find('"', form.Width1)# GT 0>
		Print Dimensions: Illegal Character <br>
		You cannot have an " (inch) mark in your Print Dimensions.<br><br>
	</cfif>
	
	<cfif #Find('"', form.MatHeight1)# GT 0 or  #Find('"', form.MatWidth1)# GT 0>
		Mat Dimensions: Illegal Character <br>
		You cannot have an " (inch) mark in your Mat Dimensions.<br><br>
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
