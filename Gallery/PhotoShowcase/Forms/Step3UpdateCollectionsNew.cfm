<!--- First, Save Updates --->
<cfquery name="qGetCollections" DATASOURCE="photoeyecom" >
SELECT *
FROM GalleryCollections WHERE Custnumber = '#form.CustNumber#';
</cfquery>

<cfquery name="qGetCollectionsMaxID" DATASOURCE="photoeyecom" >
SELECT MAX(FieldID) as MaxFieldID
FROM GalleryCollections WHERE Custnumber = '#form.CustNumber#';
</cfquery>

<cfoutput>
<cfset RecordCount = #qGetCollections.RecordCount#>
<cfset number=1> 
<cfset NameNew="Form.Name00">
<cfset LocationNew="Form.Location00">
<cfloop query="qGetCollections" startrow="1" endrow="#RecordCount#">
	<cfset Nm =#Replace(NameNew, "00", Number)#>
	<cfset Locat =#Replace(LocationNew, "00", Number)#>
	<cfset Locat=#Evaluate(Locat)#>
	<cfset Nm= #Evaluate(Nm)#>
	<CFQUERY NAME="qUpdate"  DATASOURCE="photoeyecom">
  		UPDATE GalleryCollections
		SET
 	    Name = '#Nm#',
			Location = '#Locat#'
 		WHERE CustNumber ='#form.CustNumber#' and FieldID=#number#;
	</CFQUERY>
	<cfset number=number+1>
</cfloop>

<CFQUERY NAME="qUpdatePhotographersSetupInfo"  DATASOURCE="photoeyecom">
  UPDATE GallerySetup
   SET Step3='1'
  WHERE CustNumber = #Form.CustNumber#
</CFQUERY>

</cfoutput>


<CFIF IsDefined('Form.Add')>

<!---Inserts 4 Rows --->


<cfoutput>
	<cfset RecordCount = #qGetCollections.RecordCount#>
	<cfset FieldCounter=#qGetCollectionsMaxID.MaxFieldID#+1>
	<cfloop index="Count" from="1" to="4" step="1">
		<cfquery name="qGalleryInsert" DATASOURCE="photoeyecom" >
			INSERT INTO GalleryCollections (Custnumber, FieldID, Name, Location) VALUES ('#url.custnumber#',#fieldcounter#,'','')
		</cfquery>
		<cfset FieldCounter=FieldCounter+1>
	</cfloop>
</cfoutput>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase | Collections Setup</title>
</head>

<body>
<cfoutput>
<!--- <cfset custnumber=#qGetGroupShows.Custnumber#> --->
<!--- <cfinclude template="DynamictoStaticBio.cfm"> --->
<cfinclude template="Step3CollectionsURLNew.cfm">
</cfoutput>
</body>
</html>


<CFELSE>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photo-eye Photographer's Showcase | Collections Setup</title>
</head>

<body>
<cfoutput>
<!---All Information has been added! --->
<!--- <INPUT TYPE="HIDDEN" NAME="Custnumber" value="#form.Custnumber#"> --->
<!--- <cfinclude template="DynamictoStaticBio.cfm"> --->
<cfinclude template="UpdateSuccessful.cfm">
</cfoutput>
</body>
</html>
</cfif>