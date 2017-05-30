<!--- First, Save Updates --->
<cfquery name="qGetAwards" DATASOURCE="photoeyecom" >
SELECT *
FROM GalleryAwards WHERE Custnumber = '#form.CustNumber#';
</cfquery>

<cfquery name="qGetAwardsMaxID" DATASOURCE="photoeyecom" >
SELECT MAX(FieldID) as MaxFieldID
FROM GalleryAwards WHERE Custnumber = '#form.CustNumber#';
</cfquery>

<cfset RecordCount = #qGetAwards.RecordCount#>
<cfset number=1> 
<cfset NameNew="Form.Name00">
<cfset LocationNew="Form.Location00">
<cfset YearNew="Form.Year00">
<cfloop query="qGetAwards" startrow="1" endrow="#RecordCount#">
	<cfset Ven =#Replace(NameNew, "00", Number)#>
	<cfset Locat =#Replace(LocationNew, "00", Number)#>
	<cfset Yr =#Replace(YearNew, "00", Number)#>
	<cfset Yr = #Evaluate(Yr)#>
	<cfset Ven = #Evaluate(Ven)#>
	<cfset Locat = #Evaluate(Locat)#>
	
	<CFQUERY NAME="qUpdate"  DATASOURCE="photoeyecom">
  		UPDATE GalleryAwards
		SET
 	    	Name = '#Ven#',
			Location = '#Locat#',
			Year = '#Yr#'
 		WHERE CustNumber ='#form.CustNumber#' and FieldID=#number#;
	</CFQUERY>
	<cfset number=number+1>
</cfloop>

<CFQUERY NAME="qUpdatePhotographersSetupInfo"  DATASOURCE="photoeyecom">
  UPDATE GallerySetup
   SET Step6='1'
  WHERE CustNumber = #Form.CustNumber#
</CFQUERY>


<CFIF IsDefined('Form.Add')>

<!---Inserts 4 Rows --->
<cfoutput>
	<cfset RecordCount = #qGetAwards.RecordCount#>
	<cfset FieldCounter=#qGetAwardsMaxID.MaxFieldID#+1>
	<cfloop index="Count" from="1" to="4" step="1">
		<cfquery name="qGalleryInsert" DATASOURCE="photoeyecom" >
			INSERT INTO GalleryAwards (Custnumber, FieldID, Name, Location, Year) VALUES ('#url.custnumber#',#fieldcounter#,'','','')
		</cfquery>
		<cfset FieldCounter=FieldCounter+1>
	</cfloop>
</cfoutput>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase | Awards Setup</title>
</head>

<body>
<cfoutput>
<!--- <cfset custnumber=#qGetAwards.Custnumber#> --->
<!--- <cfinclude template="DynamictoStaticBio.cfm"> --->
<cfinclude template="Step6AwardsURLNew.cfm">
</cfoutput>
</body>
</html>


<CFELSE>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase | Awards Setup</title>
</head>

<body>
<cfoutput>
<!---All Information has been added! --->
<INPUT TYPE="HIDDEN" NAME="Custnumber" value="#form.Custnumber#">
<!--- <cfinclude template="DynamictoStaticBio.cfm"> --->
<cfinclude template="UpdateSuccessful.cfm">
</cfoutput>
</body>
</html>
</cfif>