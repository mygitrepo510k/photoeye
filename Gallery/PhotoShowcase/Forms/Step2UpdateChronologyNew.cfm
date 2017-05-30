<!--- First, Save Updates --->
<cfquery name="qGetChronology" DATASOURCE="photoeyecom" >
SELECT *
FROM GalleryChronology WHERE Custnumber = '#form.CustNumber#';
</cfquery>


<cfoutput>

<cfset RecordCount = #qGetChronology.RecordCount#>
<cfset number=1> 
<cfset YearNew="Form.Year00">
<cfset DescriptionNew="Form.Description00">
<cfloop query="qGetChronology" startrow="1" endrow="#RecordCount#">
	<cfset Yr =#Replace(YearNew, "00", Number)#>
	<cfset Descrip =#Replace(DescriptionNew, "00", Number)#>
	<cfset Descrip = #Evaluate(Descrip)#>
	<CFQUERY NAME="qUpdatePhotographersSetup2Info"  DATASOURCE="photoeyecom">
  		UPDATE GalleryChronology
		SET
 	    Year = '#Evaluate(Yr)#',
			Description = '#Descrip#'
 		WHERE CustNumber ='#form.CustNumber#' and FieldID=#number#;
	</CFQUERY>
	<cfset number=number+1>
</cfloop>

<CFQUERY NAME="qUpdatePhotographersSetupInfo"  DATASOURCE="photoeyecom">
  UPDATE GallerySetup
   SET Step9='1'
  WHERE CustNumber = #form.custnumber#
</CFQUERY>

</cfoutput>

<CFIF IsDefined('Form.Add')>

<!---Inserts 4 Rows --->
<cfoutput>
	<cfset RecordCount = #qGetChronology.RecordCount#>
	<cfset FieldCounter=RecordCount+1>
	<cfloop index="Count" from="1" to="4" step="1">
		<cfquery name="qGalleryChronologyInsert" DATASOURCE="photoeyecom" >
			INSERT INTO GalleryChronology (Custnumber, FieldID, Year, Description) VALUES ('#url.custnumber#',#fieldcounter#,'','')
		</cfquery>
		<cfset FieldCounter=FieldCounter+1>
	</cfloop>
</cfoutput>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase | Chronology Setup</title>
</head>

<body>
<cfoutput>
<!--- <cfset custnumber=#qGetSoloShows.Custnumber#> --->
<!--- <cfinclude template="DynamictoStaticBio.cfm"> --->
<cfinclude template="Step2ChronologyURLNew.cfm">
</cfoutput>
</body>
</html>


<CFELSE>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase | Chronology Setup</title>
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