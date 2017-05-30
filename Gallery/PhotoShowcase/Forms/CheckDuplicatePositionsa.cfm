<CFIF ISDefined("url.Custnumber")>
	<CFSET xCustNumber = url.Custnumber>
<CFELSEIF isDefined("form.Custnumber")>
	<CFSET xCustNumber = form.Custnumber>
</CFIF>


<CFQUERY NAME="qGetShowcaseSetup"
         DATASOURCE="photoeyecom">

SELECT *
FROM GallerySetup
WHERE Custnumber = #xCustnumber#
</cfquery>

<CFQUERY NAME="qGetShowcasePortfolio"
         DATASOURCE="photoeyecom">

SELECT *
FROM GalleryPortfolio
WHERE Custnumber = #xCustnumber# and SubDirectory='#URL.Portfolio#'
</cfquery>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Gallery | Photographer's Showcase</title>
</head>

<body>


<cfoutput>

          
		  <!--- Get Image Count --->
		  <cfset imagecount = 0>
          <cfloop index="fieldincrementer" from="1" to="25" step="1">
				<cfloop index="letterincrementer" from="122" to="97" step="-1">
					<cfif fileexists(Expandpath("../../#qGetShowcaseSetup.Gallery#/Artists/#qGetShowcaseSetup.Subdirectory#/#qGetShowcasePortfolio.SubDirectory#/Images_Thumbs/image#fieldincrementer##chr(letterincrementer)#.jpg")) or fileexists(Expandpath("../../#qGetShowcaseSetup.Gallery#/Artists/#qGetShowcaseSetup.Subdirectory#/#qGetShowcasePortfolio.SubDirectory#/Images_Thumbs/image#fieldincrementer#.jpg"))>								
						<cfset imagecount = imagecount + 1>
						<cfbreak>
					</CFIF> 
			</CFLOOP>	
		</cfloop>
				

<!---Increment 1st Field --->
<cfloop index="fieldincrementer" from="1" to="#imagecount#" step="1">

	<cfset form="form.image#fieldincrementer#"> 
	<!---Define 2nd Field Incrementer--->
	<cfset otherfieldincrementer=#fieldincrementer#+1>
	<cfloop index="otherfieldincrementer" from="#otherfieldincrementer#" to="#imagecount#" step="1">
		<cfset otherforms="form.image#otherfieldincrementer#">
		<cfif #Evaluate(form)# is #Evaluate(otherforms)#>
			<form Method="post" action="step10changeimageorderURL.cfm?custnumber=#URL.Custnumber#&Portfolio=#qGetShowcasePortfolio.SubDirectory#">
				<div align="center"><center>
				You have inadvertently made Image #fieldincrementer# and Image #otherfieldincrementer# have identical positions.<br><br>
				<INPUT TYPE="SUBMIT" VALUE="Return to Previous Form to Correct Image Positions">
				</center></div>
			</form>
			
			<cfabort>
			<cfbreak>
		</cfif>
	</cfloop>
</cfloop>


<!--- Check to see if there are any blanks or 0 positions --->
<cfloop index="fieldincrementer" from="1" to="#imagecount#" step="1">

	<cfset form="form.image#fieldincrementer#"> 
	<!---Define 2nd Field Incrementer--->
	<cfset otherfieldincrementer=#fieldincrementer#+1>
		<cfset otherforms="form.image#otherfieldincrementer#">
		<cfif #Evaluate(form)# is 0 or #TRIM(Evaluate(form))# is ''>
			<form Method="post" action="step10changeimageorderURL.cfm?custnumber=#URL.Custnumber#&Portfolio=#qGetShowcasePortfolio.SubDirectory#">
				<div align="center"><center>
				You have entered 0 as the sequence number or erased it completely. Thus your changes have not yet been saved.<br><br>
				<INPUT TYPE="SUBMIT" VALUE="Return to Previous Form to Correct Image Positions">
				</center></div>
			</form>
			
			<cfabort>
			<cfbreak>
		</cfif>
</cfloop>

<!--- Check to see if there are an equal number of images in each directory ---->



<!---If everything is ok, proceed to changeorder.cfm--->
<!--- <form method="post" action="changeorder.cfm?custnumber=#url.custnumber#">
				<div align="center"><center>
				This is a two 2 step process. Press the Continue button to go to the next step.<br><br>
				<INPUT TYPE="SUBMIT" VALUE="Continue">
				</center></div>
			</form> --->
  <INPUT TYPE="HIDDEN" NAME="Custnumber" VALUE=#URL.Custnumber#>
    <INPUT TYPE="HIDDEN" NAME="Portfolio" VALUE=#URL.Portfolio#>
<!--- <cfinclude template="DynamictoStaticScroll.cfm"> --->


<cfinclude template="changeorder.cfm">
</cfoutput>
</body>
</html>


